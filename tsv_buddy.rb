# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    tsv_lines = tsv.split("\n")
    tsv_lines.map! do |line|
      line.split("\t")
    end
    columns = tsv_lines[0]
    @data = tsv_lines[1..].map { |row| columns.zip(row).to_h }
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    columns = @data[0].keys
    tsv = columns.join("\t")
    tsv << "\n"
    @data.each { |row| tsv << "#{row.values.join("\t")}\n" }
    tsv
  end
end
