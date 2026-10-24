
var _w = display_get_gui_width();
var _h = display_get_gui_height();

var _cx = _w / 2;
var _cy = _h / 2;

draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (tarefa_aberta) {

    draw_set_alpha(0.85);
    draw_set_color(c_black);
    draw_rectangle(0, 0, _w, _h, false);
    draw_set_alpha(1);

    var _pw = 210;
    var _ph = 150;

    if (tipo_task == 1 || tipo_task == 2) {
        _pw = 260;
        _ph = 185;
    }

    draw_set_color(make_color_rgb(23, 35, 51));

    draw_rectangle(
        _cx - _pw,
        _cy - _ph,
        _cx + _pw,
        _cy + _ph,
        false
    );

    draw_set_color(make_color_rgb(55, 75, 100));

    draw_rectangle(
        _cx - _pw,
        _cy - _ph,
        _cx + _pw,
        _cy - _ph + 12,
        false
    );

    if (tipo_task == 0) {

        draw_set_color(make_color_rgb(75, 170, 255));
        draw_text(_cx, _cy - 120, "MANUTENCAO ELETRICA");

        draw_set_color(c_white);
        draw_text(_cx, _cy - 97, "CONECTE OS FIOS CORRETAMENTE");

        var _esq = _cx - 125;
        var _dir = _cx + 125;

        for (var i = 0; i < 4; i++) {

            var _y = _cy - 65 + i * 43;

            draw_set_color(cores_fios[i]);
            draw_line_width(_esq - 55, _y, _esq, _y, 5);
            draw_circle(_esq, _y, 9, false);

            draw_set_color(cores_fios[ordem_fios[i]]);
            draw_line_width(_dir, _y, _dir + 55, _y, 5);
            draw_circle(_dir, _y, 9, false);
        }

        for (var f = 0; f < 4; f++) {

            if (fios_conectados[f]) {

                var _oy = _cy - 65 + f * 43;

                for (var d = 0; d < 4; d++) {

                    if (ordem_fios[d] == f) {

                        var _dy = _cy - 65 + d * 43;

                        draw_set_color(cores_fios[f]);
                        draw_line_width(_esq, _oy, _dir, _dy, 5);
                        break;
                    }
                }
            }
        }

        if (fio_arrastando != -1) {

            var _mx = device_mouse_x_to_gui(0);
            var _my = device_mouse_y_to_gui(0);
            var _fy = _cy - 65 + fio_arrastando * 43;

            draw_set_color(cores_fios[fio_arrastando]);
            draw_line_width(_esq, _fy, _mx, _my, 5);
        }

        draw_set_color(c_white);

        draw_text(
            _cx,
            _cy + 108,
            "FIOS CONECTADOS: " + string(progresso_task) + "/4"
        );

        if (task_concluida) {

            draw_set_color(c_lime);
            draw_text(_cx, _cy + 132, "ENERGIA RESTAURADA!");

        } else {

            draw_set_color(c_white);
            draw_text(_cx, _cy + 132, "S - SAIR");
        }
    }

    else if (tipo_task == 1) {

        draw_set_color(make_color_rgb(255, 204, 80));
        draw_text(_cx, _cy - 150, "CALIBRACAO SOLAR");

        draw_set_color(c_white);
        draw_text(_cx, _cy - 122, "ALINHE OS PAINEIS SOLARES");

        var _mod = min(modulo_solar, 2);
        var _ideal = angulos_ideais[_mod];

        draw_set_color(make_color_rgb(42, 55, 72));

        draw_rectangle(
            _cx - 185, _cy - 88,
            _cx + 185, _cy + 30,
            false
        );

        draw_set_color(make_color_rgb(255, 204, 80));
        draw_circle(_cx + 125, _cy - 55, 16, false);

        draw_set_color(make_color_rgb(160, 175, 190));

        draw_line_width(
            _cx, _cy - 35,
            _cx, _cy + 10,
            5
        );

        var _bx = _cx;
        var _by = _cy - 35;
        var _tam = 45;

        var _x1 = _bx - lengthdir_x(_tam, angulo_solar);
        var _y1 = _by - lengthdir_y(_tam, angulo_solar);

        var _x2 = _bx + lengthdir_x(_tam, angulo_solar);
        var _y2 = _by + lengthdir_y(_tam, angulo_solar);

        draw_set_color(make_color_rgb(15, 55, 100));
        draw_line_width(_x1, _y1, _x2, _y2, 20);

        draw_set_color(make_color_rgb(45, 145, 225));
        draw_line_width(_x1, _y1, _x2, _y2, 15);

        draw_set_color(make_color_rgb(150, 215, 255));
        draw_line_width(_x1, _y1, _x2, _y2, 3);

        draw_set_color(make_color_rgb(255, 204, 80));

        draw_text(
            _cx,
            _cy + 58,
            "MODULO " + string(min(modulo_solar + 1, 3)) + "/3"
        );

        if (task_concluida) {

            draw_set_color(c_lime);
            draw_text(_cx, _cy + 100, "SISTEMA SOLAR ATIVADO!");

        } else {

            draw_set_color(c_white);

            draw_text(
                _cx,
                _cy + 88,
                "ANGULO: " + string(angulo_solar)
                + " / IDEAL: " + string(_ideal)
            );

            if (erro_solar > 0) {

                draw_set_color(c_red);
                draw_text(_cx, _cy + 112, "ANGULO INCORRETO!");

            } else {

                draw_set_color(c_white);
                draw_text(_cx, _cy + 112, "SETAS - AJUSTAR");
            }

            draw_set_color(c_white);
            draw_text(_cx, _cy + 136, "ESPACO - CONFIRMAR");
            draw_text(_cx, _cy + 158, "S - SAIR");
        }
    }

    else if (tipo_task == 2) {

        var _nivel = min(sensor_acertos, sensor_total - 1);

        draw_set_color(make_color_rgb(80, 220, 180));
        draw_text(_cx, _cy - 150, "SENSORES INTELIGENTES");

        draw_set_color(c_white);
        draw_text(_cx, _cy - 120, "CALIBRE O SENSOR DE MOVIMENTO");

        draw_set_color(make_color_rgb(38, 53, 70));

        draw_rectangle(
            _cx - 185, _cy - 85,
            _cx + 185, _cy + 35,
            false
        );

        var _barra_x1 = _cx - 145;
        var _barra_x2 = _cx + 145;
        var _barra_y = _cy - 20;

        draw_set_color(make_color_rgb(70, 85, 105));

        draw_rectangle(
            _barra_x1, _barra_y - 12,
            _barra_x2, _barra_y + 12,
            false
        );

        var _alvo = sensor_alvos[_nivel];
        var _tolerancia = sensor_tolerancias[_nivel];

        var _zona_x = _barra_x1 + 290 * _alvo;
        var _margem = 290 * _tolerancia;

        draw_set_color(make_color_rgb(45, 200, 120));

        draw_rectangle(
            _zona_x - _margem, _barra_y - 12,
            _zona_x + _margem, _barra_y + 12,
            false
        );

        var _indicador_x = _barra_x1 + 290 * sensor_posicao;

        draw_set_color(c_white);

        draw_rectangle(
            _indicador_x - 3, _barra_y - 22,
            _indicador_x + 3, _barra_y + 22,
            false
        );

        draw_set_color(make_color_rgb(80, 220, 180));

        draw_text(
            _cx,
            _cy + 58,
            "SENSOR "
            + string(min(sensor_acertos + 1, sensor_total))
            + "/" + string(sensor_total)
        );

        draw_set_color(c_white);

        draw_text(
            _cx,
            _cy + 80,
            "CALIBRADOS: " + string(sensor_acertos)
            + "/" + string(sensor_total)
        );

        if (task_concluida) {

            draw_set_color(c_lime);

            draw_text(
                _cx,
                _cy + 110,
                "TODOS OS SENSORES CALIBRADOS!"
            );

            draw_text(
                _cx,
                _cy + 135,
                "SISTEMA INTELIGENTE ATIVO!"
            );

        } else {

            if (sensor_erro > 0) {

                draw_set_color(c_red);
                draw_text(_cx, _cy + 110, "ERROU! TENTE NOVAMENTE");

            } else {

                draw_set_color(c_white);
                draw_text(_cx, _cy + 110, "ESPACO - CALIBRAR");
            }

            draw_set_color(c_white);
            draw_text(_cx, _cy + 145, "S - SAIR");
        }
    }

} else {

    if (instance_exists(caixa_atual) && !derrotado) {

        if (!caixa_atual.concluida) {

            draw_set_alpha(0.9);
            draw_set_color(make_color_rgb(20, 25, 35));

            draw_rectangle(
                _cx - 115, _h - 95,
                _cx + 115, _h - 40,
                false
            );

            draw_set_alpha(1);
            draw_set_color(c_white);

            draw_rectangle(
                _cx - 95, _h - 85,
                _cx - 55, _h - 45,
                false
            );

            draw_set_color(c_black);
            draw_text(_cx - 75, _h - 65, "E");

            draw_set_color(c_white);
            draw_text(_cx + 25, _h - 65, "INTERAGIR");
        }
    }
}

// HUD DE VIDA PIXELADO

draw_set_alpha(1);

var _hud_x = 18;
var _hud_y = 14;

var _pixel = 3;
var _espaco_coracao = 28;

var _cor_vida = make_color_rgb(232, 65, 80);
var _cor_vazia = make_color_rgb(95, 95, 105);

var _coracao = [
    "0110110",
    "1111111",
    "1111111",
    "0111110",
    "0011100",
    "0001000"
];

for (var _vida_i = 0; _vida_i < vida_maxima; _vida_i++) {

    var _hx = _hud_x + _vida_i * _espaco_coracao;
    var _hy = _hud_y;

    var _cor = _cor_vazia;

    if (_vida_i < vida) {
        _cor = _cor_vida;
    }

    for (
        var _linha = 0;
        _linha < array_length(_coracao);
        _linha++
    ) {

        for (var _coluna = 0; _coluna < 7; _coluna++) {

            if (
                string_char_at(
                    _coracao[_linha],
                    _coluna + 1
                ) == "1"
            ) {

                var _px = _hx + _coluna * _pixel;
                var _py = _hy + _linha * _pixel;

                draw_set_color(_cor);

                draw_rectangle(
                    _px,
                    _py,
                    _px + _pixel - 1,
                    _py + _pixel - 1,
                    false
                );
            }
        }
    }
}

// BARRA DE VIDA COM 5 TRACINHOS

var _vida_bx = _hud_x;
var _vida_by = _hud_y + 24;

var _segmentos = 5;
var _largura = 20;
var _altura = 6;
var _espaco = 4;

var _ativos = clamp(vida, 0, 5);

for (var _j = 0; _j < _segmentos; _j++) {

    var _sx = _vida_bx + _j * (_largura + _espaco);

    if (_j < _ativos) {
        draw_set_color(_cor_vida);
    } else {
        draw_set_color(_cor_vazia);
    }

    draw_rectangle(
        _sx,
        _vida_by,
        _sx + _largura - 1,
        _vida_by + _altura - 1,
        false
    );
}

// TELA DE DERROTA

if (derrotado) {

    draw_set_alpha(0.88);
    draw_set_color(c_black);
    draw_rectangle(0, 0, _w, _h, false);

    draw_set_alpha(1);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_set_color(make_color_rgb(255, 90, 100));

    draw_text_transformed(
        _cx,
        _cy - 25,
        "VOCE FICOU SEM VIDAS!",
        2, 2, 0
    );

    draw_set_color(c_white);

    draw_text(
        _cx,
        _cy + 30,
        "TENTE NOVAMENTE!"
    );
}

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
