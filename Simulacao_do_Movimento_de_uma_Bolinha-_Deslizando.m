clc
clear all
close all

% Pedindo os valores necessários
while true
    massa = input('digite o valor da massa da particula: ');
    raio = input('digite o valor do raio; ');
    Uk = input('digite o valor do coeficênte de atrito cinético; ');
    incremento = input('digite o valor do incremento do angulo em graus (obrigatoriamente menor de 90); ');

    % Criando um loop para que os valores sejam corretos
    if massa > 0 && raio > 0 && Uk >= 0 && incremento > 0
        break
    else
        fprintf('\nvalores inválidos \ndigite números maiores do que zero para: massa e raio.\nDigite o incremento como um número real não negativo \n\nTenta denovo logo abaixo: \n\n') ;
    end
end

% Definindo parametros iniciais
g = 9.81 ; % gravidade
velocidade_anterior = 0 ; % velocidade inicial
teta = 0 ; % angulo inicial
T_F_atrito = 0 ; % trabalho da força de atrito inicial
E_pot = massa * g * raio ; % Energia potencial gravitacional inicial
parada = 0 ;

% Vetores para armazenar os dados de cada iteração
angulos_plot = [];
velocidades_plot = [];
trabalho_atrito_plot = [];

% Criando um loop para realizar a integral
while teta <=((pi/2));

    Delta_Altura = ( raio - raio * sin(teta) ) ; % identificando a variação de altura
    Delta_E_Pot = ( massa * g * Delta_Altura ) ; % identificando a variação de energia potencial gravitacional
    Peso_Y = ( massa * g * sin(teta)) ; % calculando a componente y do peso
    F_centripeta_atual =(( massa * ( velocidade_anterior^2 ))*(1/raio)) ; % calculando a força centripeda do espaço delimitado pelo incremento

    T_F_atrito = T_F_atrito + ( Uk * (F_centripeta_atual + Peso_Y ) * raio * (incremento * (pi/180)) ) ; % calculando o somatório da força de atrito

    % Criando um break para caso a bola pare dentro do tubo
    if E_pot - Delta_E_Pot - T_F_atrito < 0
        fprintf('\na particula parou antes do final do tubo\n');
        parada = 1;
        break
    end

    v = sqrt( 2 * ( E_pot - Delta_E_Pot - T_F_atrito ) / massa) ; % calculando nova velocidade
    velocidade_anterior = v ; % armazenando a variavel v como v anterior
    teta = teta + (incremento * (pi/180)) ; % adicionando o incremento no angulo

    % Adicionando os valores atuais aos vetores para plotagem
    angulos_plot = [angulos_plot, teta * 180/pi]; % Converte para graus
    velocidades_plot = [velocidades_plot, v];
    trabalho_atrito_plot = [trabalho_atrito_plot, T_F_atrito];

end

% Determinando o trabalho da força de atrito e parando o codigo caso a bolinha pare dentro do tubo
if parada == 1
    disp(fprintf('\na particula não terá velocidade de saida pois parou dentro do tubo. \no trabalho da força de atrito é %.4f [J] ', E_pot)) ;
else
    % Identificando o tempo de queda livre a uma altura de 2m
    tempo = sqrt(2*2/g);

    % Identificando a distância de queda a partir do ponto de saida do tubo
    Dist_final = v * tempo ;

    % Identificando a velocidade de impacto no chão
    v_impacto = g * tempo ;

    % Reportando os valores desejados
    disp(sprintf('\nAo sair do tubo com um coeficiente de atrito cinético igual a %.4f \na particula irá sair com uma velocidade de %.4f [m/s] \na uma distância %.4f [m] \no trabalho da força de atrito corresponde a %.4f [J] \ncom velocidade de impacto de %.4f [m/s] .', Uk, v, Dist_final, T_F_atrito, v_impacto)) ;

    % --- Plotagem final dos gráficos ---
    figure('Name', 'Resultados da Simulação');

    % Gráfico de Velocidade
    subplot(2, 1, 1);
    plot(angulos_plot, velocidades_plot, 'b-', 'DisplayName', 'Velocidade Instantânea');
    title('Velocidade da partícula vs. Ângulo');
    xlabel('Ângulo (graus)');
    ylabel('Velocidade (m/s)');
    grid on;
    legend('Location', 'southeast');

    % Gráfico do Trabalho do Atrito
    subplot(2, 1, 2);
    plot(angulos_plot, trabalho_atrito_plot, 'r-', 'DisplayName', 'Trabalho do Atrito Acumulado');
    title('Trabalho da Força de Atrito vs. Ângulo');
    xlabel('Ângulo (gr)');
    ylabel('Trabalho (J)');
    grid on;
    legend('Location', 'southeast');
end

