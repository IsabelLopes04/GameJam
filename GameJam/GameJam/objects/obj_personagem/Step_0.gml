
if (derrotado) {

    tempo_derrota--;

    if (tempo_derrota <= 0) {
        game_restart();
    }

    exit;
}

if (instance_exists(obj_CentralInteligente)) {

    if (
        obj_CentralInteligente.painel_aberto ||
        obj_CentralInteligente.missao_concluida
    ) {
        image_speed = 0;
        exit;
    }
}

if (tarefa_aberta) {

    image_speed = 0;

    if (task_concluida) {

        tempo_conclusao--;

        if (tempo_conclusao <= 0) {

            tarefa_aberta = false;
            task_concluida = false;
            caixa_atual = noone;
            progresso_task = 0;
        }

        exit;
    }

    if (keyboard_check_pressed(ord("S"))) {

        tarefa_aberta = false;
        caixa_atual = noone;
        progresso_task = 0;
        fio_arrastando = -1;

        exit;
    }

    if (tipo_task == 0) {

        var _cx = display_get_gui_width() / 2;
        var _cy = display_get_gui_height() / 2;

        var _mx = device_mouse_x_to_gui(0);
        var _my = device_mouse_y_to_gui(0);

        var _esq = _cx - 125;
        var _dir = _cx + 125;

        if (mouse_check_button_pressed(mb_left)) {

            for (var i = 0; i < 4; i++) {

                var _fy = _cy - 65 + i * 43;

                if (!fios_conectados[i]) {

                    if (
                        point_distance(
                            _mx, _my, _esq, _fy
                        ) < 18
                    ) {
                        fio_arrastando = i;
                        break;
                    }
                }
            }
        }

        if (mouse_check_button_released(mb_left)) {

            if (fio_arrastando != -1) {

                for (var j = 0; j < 4; j++) {

                    var _dest_y = _cy - 65 + j * 43;

                    if (
                        point_distance(
                            _mx, _my, _dir, _dest_y
                        ) < 20
                    ) {

                        if (
                            ordem_fios[j] ==
                            fio_arrastando
                        ) {

                            fios_conectados[
                                fio_arrastando
                            ] = true;

                            progresso_task++;

                        } else {

                            perder_vida();
                        }

                        break;
                    }
                }

                fio_arrastando = -1;

                if (
                    !derrotado &&
                    progresso_task >= 4
                ) {

                    task_concluida = true;
                    tempo_conclusao = room_speed * 2;

                    if (instance_exists(caixa_atual)) {
                        caixa_atual.concluida = true;
                    }
                }
            }
        }
    }

    else if (tipo_task == 1) {

        if (keyboard_check_pressed(vk_right)) {
            angulo_solar = min(90, angulo_solar + 5);
        }

        if (keyboard_check_pressed(vk_left)) {
            angulo_solar = max(0, angulo_solar - 5);
        }

        if (erro_solar > 0) {
            erro_solar--;
        }

        if (keyboard_check_pressed(vk_space)) {

            var _ideal = angulos_ideais[modulo_solar];

            if (abs(angulo_solar - _ideal) <= 3) {

                modulo_solar++;
                progresso_task = modulo_solar;

                angulo_solar = 0;
                erro_solar = 0;

                if (modulo_solar >= 3) {

                    task_concluida = true;
                    tempo_conclusao = room_speed * 2;

                    if (instance_exists(caixa_atual)) {
                        caixa_atual.concluida = true;
                    }
                }

            } else {

                erro_solar = room_speed;
                perder_vida();
            }
        }
    }

    else if (tipo_task == 2) {

        var _nivel = min(
            sensor_acertos,
            sensor_total - 1
        );

        var _vel = sensor_velocidades[_nivel];

        sensor_posicao += _vel * sensor_direcao;

        if (sensor_posicao >= 1) {
            sensor_posicao = 1;
            sensor_direcao = -1;
        }

        if (sensor_posicao <= 0) {
            sensor_posicao = 0;
            sensor_direcao = 1;
        }

        if (sensor_erro > 0) {
            sensor_erro--;
        }

        if (keyboard_check_pressed(vk_space)) {

            var _alvo = sensor_alvos[_nivel];
            var _tolerancia = sensor_tolerancias[_nivel];

            if (
                abs(sensor_posicao - _alvo)
                <= _tolerancia
            ) {

                sensor_acertos++;
                progresso_task = sensor_acertos;

                sensor_posicao = 0;
                sensor_direcao = 1;
                sensor_erro = 0;

                if (sensor_acertos >= sensor_total) {

                    task_concluida = true;
                    tempo_conclusao = room_speed * 2;

                    if (instance_exists(caixa_atual)) {
                        caixa_atual.concluida = true;
                    }
                }

            } else {

                sensor_erro = room_speed;
                perder_vida();
            }
        }
    }

    exit;
}

var _hor = keyboard_check(ord("D"))
         - keyboard_check(ord("A"));

var _ver = keyboard_check(ord("S"))
         - keyboard_check(ord("W"));

var _dist = max(
    1,
    point_distance(0, 0, _hor, _ver)
);

var _mov_x = (_hor / _dist) * velocidade;
var _mov_y = (_ver / _dist) * velocidade;

if (place_meeting(x, y, obj_Colisao)) {

    var _direcoes = [
        [1, 0],
        [-1, 0],
        [0, 1],
        [0, -1]
    ];

    var _livre = false;

    for (
        var _raio = 1;
        _raio <= 32 && !_livre;
        _raio++
    ) {

        for (var _i = 0; _i < 4; _i++) {

            var _teste_x =
                x + _direcoes[_i][0] * _raio;

            var _teste_y =
                y + _direcoes[_i][1] * _raio;

            if (
                !place_meeting(
                    _teste_x,
                    _teste_y,
                    obj_Colisao
                )
            ) {

                x = _teste_x;
                y = _teste_y;

                _livre = true;
                break;
            }
        }
    }

} else {

    var _passos = ceil(
        max(abs(_mov_x), abs(_mov_y))
    );

    if (_passos > 0) {

        var _dx = _mov_x / _passos;
        var _dy = _mov_y / _passos;

        repeat (_passos) {

            if (
                !place_meeting(
                    x + _dx,
                    y,
                    obj_Colisao
                )
            ) {
                x += _dx;
            }

            if (
                !place_meeting(
                    x,
                    y + _dy,
                    obj_Colisao
                )
            ) {
                y += _dy;
            }
        }
    }
}

if (_hor > 0) {
    sprite_index = spr_Direita;
}
else if (_hor < 0) {
    sprite_index = spr_Esquerda;
}
else if (_ver < 0) {
    sprite_index = spr_Costas;
}
else if (_ver > 0) {
    sprite_index = spr_Frente;
}

if (_hor != 0 || _ver != 0) {
    image_speed = 0.2;
} else {
    image_speed = 0;
    image_index = 0;
}

caixa_atual = noone;

var _caixa = noone;
var _menor_distancia = 40;

var _luz = instance_nearest(
    x, y, obj_CaixaLuz
);

var _solar = instance_nearest(
    x, y, obj_CaixaSolar
);

var _sensor = instance_nearest(
    x, y, obj_CaixaSensor
);

if (instance_exists(_luz)) {

    var _dl = point_distance(
        x, y, _luz.x, _luz.y
    );

    if (
        _dl < _menor_distancia &&
        !_luz.concluida
    ) {
        _caixa = _luz;
        _menor_distancia = _dl;
    }
}

if (instance_exists(_solar)) {

    var _ds = point_distance(
        x, y, _solar.x, _solar.y
    );

    if (
        _ds < _menor_distancia &&
        !_solar.concluida
    ) {
        _caixa = _solar;
        _menor_distancia = _ds;
    }
}

if (instance_exists(_sensor)) {

    var _dt = point_distance(
        x, y, _sensor.x, _sensor.y
    );

    if (
        _dt < _menor_distancia &&
        !_sensor.concluida
    ) {
        _caixa = _sensor;
        _menor_distancia = _dt;
    }
}

if (instance_exists(_caixa)) {

    caixa_atual = _caixa;

    if (keyboard_check_pressed(ord("E"))) {

        tipo_task = 0;

        if (
            _caixa.object_index == obj_CaixaSolar
        ) {
            tipo_task = 1;
        }

        if (
            _caixa.object_index == obj_CaixaSensor
        ) {
            tipo_task = 2;
        }

        tarefa_aberta = true;
        task_concluida = false;
        progresso_task = 0;

        fio_arrastando = -1;

        fios_conectados = [
            false, false, false, false
        ];

        angulo_solar = 0;
        modulo_solar = 0;
        erro_solar = 0;

        sensor_posicao = 0;
        sensor_direcao = 1;
        sensor_acertos = 0;
        sensor_erro = 0;

        image_speed = 0;
        image_index = 0;
    }
}
