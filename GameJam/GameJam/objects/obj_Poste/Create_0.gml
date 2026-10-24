ligado = true;

if (variable_global_exists("cidade_iluminada")) {
    ligado = global.cidade_iluminada;
}

intensidade_luz = 0;
intensidade_alvo = 1;
velocidade_luz = 0.04;

// cor da luz
cor_luz = make_color_rgb(255, 220, 150);
cor_lampada = make_color_rgb(255, 245, 190);

// posição do brilho da lâmpada
lamp_x = 0;
lamp_y = -42;

// posição base da luz no chão
chao_x = 0;
chao_y = 34;

// alcance das luzes
raio_centro = 120;
raio_lateral = 85;
raio_frente = 100;

// espalhamento da luz em vários pontos
ponto1_x = 0;
ponto1_y = 34;

ponto2_x = -32;
ponto2_y = 42;

ponto3_x = 32;
ponto3_y = 42;

ponto4_x = 0;
ponto4_y = 68;