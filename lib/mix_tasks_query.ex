defmodule Mix.Tasks.Heritage.Query do
    use Mix.Task
    alias HeritageTool.Parser

    @shortdoc "Query World Heritage Sites data from CSV"

    def run(args) do
      csv_file = "data/whc-sites.csv"
      sites = Parser.parse(csv_file)

      case args do
        ["--category", category] ->
          filter_by_category(sites, category)

        ["--keyword", keyword] ->
          filter_by_keyword(sites, keyword)

        _ ->
          Mix.shell().info("Usage: mix heritage.query --category <category> | --keyword <keyword>")
      end
    end

    defp filter_by_category(sites, category) do
      filtered = Enum.filter(sites, fn site -> site[:category] == category end)
      display_sites(filtered)
    end

    defp filter_by_keyword(sites, keyword) do
      filtered = Enum.filter(sites, fn site ->
        String.contains?(String.downcase(site[:description]), String.downcase(keyword))
      end)
      display_sites(filtered)
    end

    defp display_sites(sites) do
      Enum.each(sites, fn site ->
        Mix.shell().info("""
        Site: #{site[:site]}
        Description: #{site[:description]}
        Criteria: #{site[:criteria]}
        Category: #{site[:category]}
        Country: #{site[:country]}
        Region: #{site[:region]}
        Latitude: #{site[:latitude]}, Longitude: #{site[:longitude]}
        """)
      end)
    end
  end
