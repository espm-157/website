import ibis
import ibis.selectors as s
columns = ['year', 'month', 'decimal_date', 'co2',
           'smooth', 'std_days', 'uncertainty', 'empty']
df = pd.read_csv("https://gml.noaa.gov/webdata/ccgg/trends/co2/co2_mm_mlo.txt",
                 sep="\s+", comment="#", names= columns)
con = ibis.duckdb.connect()
con.create_table("co2", df)

(
    con.table("co2")
    .pivot_longer(s.any_of(['co2','smooth']))
    .select(['decimal_date', 'name', 'value'])
    .to_csv("../data/co2.csv")
)