class FutureValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless DateTime.new(value.exam_date) <= DateTime.now
      record.errors[attribute] << (options[:message] || "Can't set a grade for an exam not yet happened")
    end
  end
end
