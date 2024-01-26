
## Paquetería
install.packages("quantmod")
install.packages("TTR")


library(TTR)
library(quantmod)


## Cargando data de activos financieros desde Yahoo

crypto = "BTC-USD"
getSymbols(crypto, src="yahoo", from="2021-01-02")

cryptos = c("BTC-USD","ETH-USD","ADA-USD")
getSymbols(cryptos, src="yahoo", from="2021-01-02")

stock = c("FB")
getSymbols(stock, src="yahoo", from="2021-01-02")

stock_list=c("FB","AAPL","GOOG")
getSymbols(stock_list, src="yahoo", from="2021-01-02")

head(`BTC-USD`,n=3)

class(`BTC-USD`)

## Gráfico de líneas: Muestra el precio y volumen transado

chartSeries(FB, type="line",subset='2022',theme=chartTheme('white'))

chartSeries(`BTC-USD`, type="line",subset='2022',theme=chartTheme('white'))

## Gráfico de barras: Muestra precio de cierre, de apertura, máximo, mínimo y volumen.

chartSeries(`BTC-USD`,
            type="bar",
            subset='2022',
            theme=chartTheme('white'))

## Gráfico de velas: igual que el gráfico anterior

chartSeries(`BTC-USD`,
            type="candlesticks",
            subset='2022',
            up.col = 'green',
            down.col = 'black',
            theme=chartTheme('white'))

chartSeries(`BTC-USD`,
            subset='2021-05::2022-02',
            theme=chartTheme('white')
)

chartSeries(`BTC-USD`,
            subset="last 10 months",
            theme=chartTheme('white')
)

## Medias móviles

addSMA(n=20,on=1,col = "green")

addSMA(n=50,on=1,col = "blue")

addSMA(n=200,on=1,col = "red")

addEMA(n=30,on=1,col = "orange")

## Bandas de Bollinger

chartSeries(`BTC-USD`,
            subset='2021-05::2022-02',
            theme=chartTheme('white'))

addBBands(n=20,sd=2)

## Momentum

chartSeries(`BTC-USD`,
            subset='2021-05::2022-02',
            theme=chartTheme('white'))

addMomentum(n=10)

## Tasa de Cambio

chartSeries(`BTC-USD`,
            subset='2021-05::2022-02',
            theme=chartTheme('white'))

addROC(n=10)

addMomentum(n=10)

## Divergencia de convergencia de la media móvil (MACD)

chartSeries(`BTC-USD`,
            subset='2021-05::2022-02',
            theme=chartTheme('white'))

addMACD(fast=12,slow=26,signal=9,type="EMA")

addSMA(n=12,on=1,col = "red")

addSMA(n=26,on=1,col = "blue")

## Índice de fuerza relativa (RSI)

chartSeries(`BTC-USD`,
            subset='2021-05::2022-02',
            theme=chartTheme('white'))

addRSI(n=14,maType="EMA")

## Gráfico con indicadores acumulados

chartSeries(`BTC-USD`,type = "candlesticks",
            theme="white",
            TA='addBBands();addBBands(draw="p");addVo();addMACD();addRSI();addSMA()',
            subset = "2022")

chartSeries(`BTC-USD`,type = "candlesticks",
            theme="white",
            TA='addMACD();addRSI();addSMA(n=50,col = "red");addSMA(n=200,col = "blue");addSMA(n=20,col = "green");addCCI()',
            subset = "2021")

## Función para creación de graficos de múltiples acciones

gen_plots=function(x){
  chartSeries(get(x),
              name = x,
              TA='addVo();
             addOBV();
             addRSI()',
              subset='2022',
              theme="white")
  
}

stock_list=c("FB","AAPL","GOOG")

for(i in stock_list) {
  gen_plots(i)
  
}


###########################
























