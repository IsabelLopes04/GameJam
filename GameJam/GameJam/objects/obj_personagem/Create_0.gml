
velocidade = 4;

vida_maxima = 5;
vida = 5;

derrotado = false;
tempo_derrota = 0;

tarefa_aberta = false;
task_concluida = false;
tempo_conclusao = 0;
caixa_atual = noone;

tipo_task = 0;
progresso_task = 0;

fio_arrastando = -1;
fios_conectados = [false, false, false, false];
ordem_fios = [2, 0, 3, 1];

cores_fios = [
    make_color_rgb(235, 65, 75),
    make_color_rgb(65, 145, 245),
    make_color_rgb(245, 210, 75),
    make_color_rgb(75, 215, 125)
];

angulo_solar = 0;
modulo_solar = 0;
angulos_ideais = [25, 65, 40];
erro_solar = 0;

sensor_posicao = 0;
sensor_direcao = 1;
sensor_acertos = 0;
sensor_total = 5;
sensor_erro = 0;

sensor_velocidades = [
    0.012,
    0.016,
    0.020,
    0.024,
    0.028
];

sensor_alvos = [
    0.50,
    0.35,
    0.65,
    0.45,
    0.55
];

sensor_tolerancias = [
    0.12,
    0.10,
    0.09,
    0.08,
    0.07
];

perder_vida = function() {

    if (derrotado) {
        return;
    }

    vida = max(0, vida - 1);

    if (vida <= 0) {

        derrotado = true;
        tarefa_aberta = false;
        tempo_derrota = room_speed * 2;
        image_speed = 0;
    }
};
