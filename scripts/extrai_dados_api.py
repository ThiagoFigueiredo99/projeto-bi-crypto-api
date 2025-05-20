import requests
import pandas as pd

# Exemplo com CoinGecko (API pública)
url = "https://api.coingecko.com/api/v3/simple/price"
params = {
    "ids": "bitcoin,ethereum,solana",
    "vs_currencies": "usd",
    "include_24hr_change": "true"
}

response = requests.get(url, params=params)
data = response.json()

df = pd.DataFrame(data).T.reset_index()
df.columns = ["moeda", "preco_usd", "variacao_24h"]
print(df)

# Salvar como CSV em dados/
df.to_csv("../dados/precos_criptos.csv", index=False)