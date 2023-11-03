use context essentials2021
include shared-gdrive(
"dcic-2021",
"1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")


# Lager den første tabellen og renser den opp slik det blir strings og ikke some:
include gdrive-sheets
include data-source
ssid = "1RYN0i4Zx_UETVuYacgaGfnFcv4l9zd9toQTTdkQkj7g"
kWh-wealthy-consumer-data =
load-table: komponent, energi
source: load-spreadsheet(ssid).sheet-by-name("kWh", true)
    sanitize energi using string-sanitizer
end

# Gjør tabellens strings om til nummer:
# B
fun energy-to-number(str :: String) -> Number:
  cases(Option) string-to-number(str):
    | some(a) => a
    | none => 0
  end
where:
  energy-to-number("") is 0
  energy-to-number("48") is 48
end

# Fullfører energi kollonens endring til nummer fra string:
#C
trans-table = transform-column(kWh-wealthy-consumer-data, "energi", energy-to-number)

#Regner ut hvor mye energi en gjennomsnitt nordmann bruker på bil hver dag:
#D og E
fun car-energy-per-day(distance-travelled-per-day, distance-per-unit-of-fuel):
 
  energy-per-unit-of-fuel = 10
  
  (distance-travelled-per-day / 
      distance-per-unit-of-fuel) * 
    energy-per-unit-of-fuel
end

distance-travelled-per-day = 35
distance-per-unit-of-fuel = 11

sum-energy-per-day = sum(trans-table, "energi") + car-energy-per-day(distance-travelled-per-day, distance-per-unit-of-fuel)

#Lager en ny tabell med bil:
fun car-energy-pr-day-number(str :: String) -> Number:
  cases(Option) string-to-number(str):
    | some(a) => a
    | none => car-energy-per-day(distance-travelled-per-day, distance-per-unit-of-fuel)
  end
where:
  car-energy-pr-day-number("186.81") is 186.81
end

final-table = transform-column(kWh-wealthy-consumer-data, "energi", car-energy-pr-day-number)

# Printer tabellen som inkluderer bilforbruk, og visualiserer tabellen som et stolpediagram: 
final-table
bar-chart(final-table,"komponent","energi")