# DynamoからActiveRecordへの変換
#  - いつかいらなくなる機能なのでconcernにしとく
module DynamoConcern
  extend ActiveSupport::Concern
  
  # 与えられたパラメータを使って、DynamoDBのモデル名からActiveRecordモデルを返却する
  # @param [param] strong parameters
  # @return [ActiveRecord]
  def to_ar_instance(strong_parameters=nil)
    ar_model = self.class.name.demodulize.classify.constantize
    dynamo_id = self.send(:id)
    ar_instance = (ar_model.find_by_dynamo_id(dynamo_id) || create_ar_instance)
    if strong_parameters
      ar_instance.attributes = strong_parameters 
    else
      # @todo 冗長なのでリファクタリングする
      self.class.mapping.each do |dynamo_field_name, ar_column_name|
        ar_instance.send("#{ar_column_name}=", self.send(dynamo_field_name))
      end
    end
    ar_instance
  end

  # DynamoDBからActiveRecordモデルを作る
  # @return [ActiveRecord]
  def create_ar_instance
    ar_instance = self.class.name.demodulize.classify.constantize.new
    # @todo 冗長なのでリファクタリングする
    self.class.mapping.each do |dynamo_field_name, ar_column_name|
      ar_instance.send("#{ar_column_name}=", self.send(dynamo_field_name))
    end
    ar_instance
  end

  # StrongParameterからキーをDynamo用に変換し、自分自身のfieldを書き換える
  # @param [param] strong parameters
  # @return [Aws::Record] 
  def mapping_fields(strong_parameters)
    inverted_map = self.class.mapping.invert
    strong_parameters.each do |key, value|
      # - ActiveRecordのkeyは入れないようにする
      # - 値が一緒でもsetterが走ってしまうので異なる場合のみ代入
      if inverted_map.has_key?(key) && value != self.send(inverted_map[key])
        self.send("#{inverted_map[key]}=", value)
      end
    end
    self
  end
  
  # integer_attrを指定しても.to_hのフィールドが0.0になってしまうため
  def to_clean_data
    self.class.attributes.attributes.map { |key, type|
      [key, self.send(key)]
    }.to_h
  end
  
  class_methods do
    # RDS側とのfield名のマッピング
    #  動的変換なのでイレギュラーがあった場合は各クラスで個別対応
    # @return [Hash] マッピングテーブル, DynamoDB Field(camelCase)がkey RDSのカラム名(snake_case)がvalue
    def mapping
      mapping = self.attributes.attributes.map { |key, type|
        [key, key.to_s.underscore]
      }.to_h
      mapping[:id] = "dynamo_id"
      mapping
    end
  end
end