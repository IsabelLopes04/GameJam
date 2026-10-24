
var _luz_ok = false;
var _solar_ok = false;
var _sensor_ok = false;

with (obj_CaixaLuz) {
    if (concluida) {
        _luz_ok = true;
    }
}

with (obj_CaixaSolar) {
    if (concluida) {
        _solar_ok = true;
    }
}

with (obj_CaixaSensor) {
    if (concluida) {
        _sensor_ok = true;
    }
}

desbloqueada = _luz_ok && _solar_ok && _sensor_ok;

var _p = instance_nearest(x, y, obj_personagem);
var _perto = false;

if (instance_exists(_p)) {
    _perto = point_distance(x, y, _p.x, _p.y) < 120;
}

if (missao_concluida) {

    if (tempo_final > 0) {
        tempo_final--;
    }

    exit;
}


if (!painel_aberto) {

    if (_perto && keyboard_check_pressed(ord("E"))) {

        if (desbloqueada) {

            if (!_p.tarefa_aberta) {

                painel_aberto = true;
                modos = [0, 0, 0, 0];

                aviso_central = "";
                tentou_confirmar = false;

                consumo_atual = 0;
                cobertura_atual = 0;
            }
        }
    }

}
else {

    if (keyboard_check_pressed(ord("S"))) {
        painel_aberto = false;
        exit;
    }

    var _w = display_get_gui_width();
    var _h = display_get_gui_height();

    var _cx = _w / 2;
    var _cy = _h / 2;

    var _mx = device_mouse_x_to_gui(0);
    var _my = device_mouse_y_to_gui(0);

    if (mouse_check_button_pressed(mb_left)) {

        for (var i = 0; i < 4; i++) {

            var _ry = _cy - 78 + i * 41;

            for (var j = 0; j < 3; j++) {

                var _bx = _cx - 90 + j * 116;

                if (_mx >= _bx &&
                    _mx <= _bx + 105 &&
                    _my >= _ry - 15 &&
                    _my <= _ry + 15) {

                    modos[i] = j;

                    aviso_central = "";
                    tentou_confirmar = false;
                }
            }
        }

        var _botao_y = _cy + 135;

        if (_mx >= _cx - 115 &&
            _mx <= _cx + 115 &&
            _my >= _botao_y - 16 &&
            _my <= _botao_y + 16) {

            tentou_confirmar = true;
        }
    }

    consumo_atual = 0;
    cobertura_atual = 0;

    for (var k = 0; k < 4; k++) {

        if (modos[k] == 1) {
            consumo_atual += custos_sensor[k];
            cobertura_atual += 25;
        }

        if (modos[k] == 2) {
            consumo_atual += custos_maximo[k];
            cobertura_atual += 25;
        }
    }

    if (keyboard_check_pressed(vk_space)) {
        tentou_confirmar = true;
    }

    if (tentou_confirmar) {

        tentou_confirmar = false;

        if (cobertura_atual < 100) {

            aviso_central = "AINDA EXISTEM RUAS APAGADAS!";

        }
        else if (consumo_atual > limite_energia) {

            aviso_central = "GASTAMOS MUITA ENERGIA! USE SENSORES!";

        }
        else if (modos[0] != 2) {

            aviso_central = "A FACULDADE PRECISA DE LUZ FORTE!";

        }
        
		
else {

    missao_concluida = true;
    painel_aberto = false;

    ativar_iluminacao = true;
	audio_play_sound(snd_central_ativar, 3, false);

    tempo_final = room_speed * 5;
}


    }
}

if (!missao_concluida && !painel_aberto) {

    if (desbloqueada) {
        balao_visivel = true;
    } else {
        balao_visivel = false;
    }

} else {
    balao_visivel = false;
}