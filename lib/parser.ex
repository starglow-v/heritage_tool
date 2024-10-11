defmodule HeritageTool.Parser do
  alias NimbleCSV.RFC4180, as: CSV

  def parse(csv_file_path) do
    csv_file_path
    |> File.stream!()
    |> CSV.parse_stream()
    |> Enum.map(&process_row/1)
  end

  defp process_row(row) do
    [
      _unique_number,
      _id_no,
      _rev_bis,
      name_en,
      _name_fr,
      _name_es,
      _name_ru,
      _name_ar,
      _name_zh,
      short_description_en,
      _short_description_fr,
      _short_description_es,
      _short_description_ru,
      _short_description_ar,
      _short_description_zh,
      _justification_en,
      _justification_fr,
      _date_inscribed,
      _secondary_dates,
      _danger,
      _date_end,
      _danger_list,
      longitude,
      latitude,
      _area_hectares,
      _c1, _c2, _c3, _c4, _c5, _c6, _n7, _n8, _n9, _n10,
      criteria_txt,
      category,
      _category_short,
      states_name_en,
      _states_name_fr,
      _states_name_es,
      _states_name_ru,
      _states_name_ar,
      _states_name_zh,
      region_en,
      _region_fr,
      _iso_code,
      _udnp_code,
      _transboundary
    ] = row

    %{
      site: name_en,
      description: short_description_en,
      criteria: criteria_txt,
      category: category,
      country: states_name_en,
      region: region_en,
      latitude: latitude,
      longitude: longitude
    }
  end
end
