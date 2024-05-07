#variable -> tudo o que eu posso medir
#value -> o estado de determinada variável no momento em que vou medi-la
#observation -> conjunto de medidas feitas nas mesmas condições
#tabular data -> conjunto de valores, cada um deles associado a uma variável e dentro de uma observação

library(tidyverse)
install.packages(
  c("arrow", "babynames", "curl", "duckdb", "gapminder",
    "ggrepel", "ggridges", "ggthemes", "hexbin", "janitor", "Lahman",
    "leaflet", "maps", "nycflights13", "openxlsx", "palmerpenguins",
    "repurrrsive", "tidymodels", "writexl"))

install.packages('tidyverse')

#precisamos carregar o pacote que vamos utilizar (só precisamos instalar uma vez, porém SEMPRE precisamos carregar na hora de utilizar)

library(tidyverse)

#vamos estudar os pinguins e a possível relação entre tamanho da nadadeira e massa muscular. Para isso, precisamos carregar um conjunto de dados sobre esses pinguins, e vamos carregar outro pacote, que vai tornar possível usar uma paleta para daltônicos na hora de plotar nosso gráfico

library(palmerpenguins)
library(ggthemes)

#vamos carregar o dataset para visualizá-lo

palmerpenguins::penguins

#usamos o "View" para ter uma visão melhor dos dados
View(penguins)

#podemos obter mais informações sobre aquele conjunto de dados usando "?"
?penguins

#nós vamos usar um pacote chamado ggplot (perguntar para o Marcelo pra que serve exatamente)

#para esse exercício, vamos usar o pacote ggplot2. Com ele, para começar um plot, usamos a função ggplot() e aí eu digo pra ele de qual dataset ele tem que puxar os dados

ggplot(data = penguins)

#temos uma tela vazia porque ainda não falamos para o ggplot como queremos que o gráfico seja
#vamos usar o "mapping" para dizer como vai ser o visual (aesthetics) do gráfico

#usamos aes() - aesthetic - para especificar o que vai no x e o que vai no y

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
)

#ok, definimos o que fica onde, porém ainda não jogamos os dados (valores) no gráfico
#para isso, devemos definir qual vai ser o "geom", que é o objeto geométrico (linha, barra, boxplot etc.) que representará nossos dados

#vamos usar a função geom_point() para criar um gráfico scatterplot

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point()

#esse scatterplot mostra que possivelmente há uma relação positiva (diretamente proporcional) entre tamanho da nadadeira e massa muscular; porém, precisamos pensar se não existem outras variáveis que influenciam isso, como por exemplo a espécie
#vamos dar um "highlight" nas espécies, indo no aes(), que é onde editamos nossas variáveis

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)
) +
  geom_point()

#quando uma variável categórica é mapeada em uma aesthetic, o ggplot2 vai automaticamente atribuir um valor único da aesthetic (cor) para cada nível único da variável (espécies)

