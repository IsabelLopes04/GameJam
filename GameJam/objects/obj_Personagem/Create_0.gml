
velocidade = 4;

tarefa_aberta = false;
caixa_atual = noone;
tipo_task = 0;

progresso_task = 0;
total_circuitos = 3;

task_concluida = false;
tempo_conclusao = 0;

segurando_task = false;
progresso_hold = 0;
progresso_hold_max = room_speed * 1.2;

fios_conectados = [false, false, false, false];

cores_fios = [
    c_red,
    c_blue,
    c_yellow,
    c_lime
];

ordem_fios = [2, 0, 3, 1];

fio_arrastando = -1;

angulo_solar = 0;
modulo_solar = 0;
angulos_ideais = [25, 65, 40];
erro_solar = 0;

sensor_posicao = 0;
sensor_direcao = 1;
sensor_acertos = 0;
sensor_total = 5;

sensor_alvos = [
    0.70,
    0.45,
    0.80,
    0.30,
    0.60
];

sensor_velocidades = [
    0.008,
    0.014,
    0.020,
    0.028,
    0.036
];

sensor_tolerancias = [
    0.12,
    0.09,
    0.07,
    0.055,
    0.04
];

sensor_erro = 0;
