# Simulação de Movimento de Bolinha em Tubo Curvo

Este script em MATLAB simula o movimento de uma bolinha deslizando por um tubo com curvatura de 90 graus, considerando a perda de energia devido ao atrito cinético. O programa calcula a velocidade final da bolinha, a distância de queda e o trabalho realizado pela força de atrito, além de gerar gráficos para visualização dos resultados.

## Como o Código Funciona

O script utiliza a **conservação de energia** de forma iterativa. Em vez de resolver a equação de forma analítica, ele divide o percurso da bolinha em pequenos incrementos angulares. Para cada incremento, ele calcula a variação de energia potencial, a energia dissipada pelo atrito e a nova velocidade da bolinha.

A **força de atrito** é calculada a partir da força normal, que muda a cada ponto do arco. A força normal é a soma da componente do peso (`m*g*sin(teta)`) e da força centrípeta (`m*v^2/r`).

Os resultados da simulação incluem:
- **Velocidade de saída** da bolinha do tubo.
- **Trabalho total** realizado pela força de atrito.
- **Distância horizontal** percorrida pela bolinha após a queda livre de 2 metros.
- **Velocidade de impacto** da bolinha no solo.

## Como Usar

1.  **Abra o MATLAB** e carregue o script.
2.  **Execute o script**. Você será solicitado a inserir os seguintes valores:
    -   Massa da bolinha (kg).
    -   Raio do tubo (m).
    -   Coeficiente de atrito cinético (`Uk`).
    -   Incremento do ângulo em graus (para definir a precisão do cálculo).
3.  O programa exibirá os resultados calculados no console e, em seguida, uma janela de figura com dois gráficos:
    -   **Gráfico de Velocidade**: Mostra como a velocidade da bolinha varia em função do ângulo.
    -   **Gráfico do Trabalho do Atrito**: Exibe o trabalho acumulado da força de atrito ao longo do percurso.


Este script requer apenas a instalação do **MATLAB**.

Os gráficos gerados pelo script ajudam a visualizar a perda de velocidade e o acúmulo de energia dissipada pelo atrito ao longo da descida.
