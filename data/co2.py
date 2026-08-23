"""Build data/co2.csv: the Mauna Loa monthly CO2 record in tidy long form.

Source: NOAA Global Monitoring Laboratory
  https://gml.noaa.gov/ccgg/trends/data.html

We read NOAA's CSV distribution rather than the fixed-width .txt, because the CSV
carries a real header row -- so the column names come from the data provider instead
of being asserted here. Comment lines beginning with '#' are skipped by duckdb.

Column meanings, per the file header:
  year, month        observation month
  decimal date       year as a decimal fraction
  average            monthly mean CO2, ppm
  deseasonalized     monthly mean with the seasonal cycle removed, ppm
  ndays              number of daily averages in the month (-1 = missing)
  sdev               standard deviation of the daily averages (-9.99 = missing)
  unc                uncertainty of the monthly mean (-0.99 = missing)

The three sentinel values above are left as-is: this file keeps only the two
concentration series, neither of which uses them.
"""

import ibis
import ibis.selectors as s

URL = "https://gml.noaa.gov/webdata/ccgg/trends/co2/co2_mm_mlo.csv"

con = ibis.duckdb.connect()

co2 = (
    con.read_csv(URL, comment="#")
    .rename(decimal_date="decimal date")
)

(
    co2
    .pivot_longer(s.cols("average", "deseasonalized"))
    .select("decimal_date", "name", "value")
    .order_by(["decimal_date", "name"])
    .to_csv("data/co2.csv")
)
