
var _w = display_get_gui_width();
var _h = display_get_gui_height();

var _cx = _w * 0.5;
var _cy = _h * 0.5;

var _azul = make_color_rgb(16, 27, 46);
var _azul_claro = make_color_rgb(28, 45, 67);
var _dourado = make_color_rgb(235, 187, 92);
var _creme = make_color_rgb(255, 238, 195);
var _cinza = make_color_rgb(135, 153, 173);
var _verde = make_color_rgb(103, 225, 153);
var _vermelho = make_color_rgb(239, 83, 97);

draw_set_alpha(1);
draw_set_font(-1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (tarefa_aberta) {

    draw_set_color(make_color_rgb(4, 10, 22));
    draw_set_alpha(0.82);
    draw_rectangle(0, 0, _w, _h, false);
    draw_set_alpha(1);

    var _pw = 280;
    var _ph = 205;

    var _x1 = _cx - _pw;
    var _y1 = _cy - _ph;
    var _x2 = _cx + _pw;
    var _y2 = _cy + _ph;


    draw_set_color(c_black);
    draw_set_alpha(0.5);

    draw_rectangle(
        _x1 + 8,
        _y1 + 8,
        _x2 + 8,
        _y2 + 8,
        false
    );

    draw_set_alpha(1);


    draw_set_color(_azul);
    draw_rectangle(_x1, _y1, _x2, _y2, false);


    draw_set_color(_dourado);
    draw_rectangle(_x1, _y1, _x2, _y2, true);

    draw_rectangle(
        _x1 + 4,
        _y1 + 4,
        _x2 - 4,
        _y2 - 4,
        true
    );


    draw_set_color(_azul_claro);

    draw_rectangle(
        _x1 + 7,
        _y1 + 7,
        _x2 - 7,
        _y1 + 64,
        false
    );

    draw_set_color(_dourado);

    draw_rectangle(
        _x1 + 7,
        _y1 + 65,
        _x2 - 7,
        _y1 + 67,
        false
    );


    draw_set_color(_dourado);

    draw_text_transformed(
        _cx,
        _y1 + 20,
        "PIXELIGHT",
        1.2,
        1.2,
        0
    );


    var _titulo = "";
    var _instrucao = "";
    var _total = 0;
    var _atual = 0;

    switch (tipo_task) {

        case 0:
            _titulo = "CIRCUITO ELETRICO";
            _instrucao = "CONECTE AS CORES CORRETAS";
            _total = 4;
            _atual = progresso_task;
            break;

        case 1:
            _titulo = "ENERGIA SOLAR";
            _instrucao = "AJUSTE O ANGULO DO PAINEL";
            _total = 3;
            _atual = modulo_solar;
            break;

        case 2:
            _titulo = "SENSORES INTELIGENTES";
            _instrucao = "PARE O INDICADOR NA AREA VERDE";
            _total = sensor_total;
            _atual = sensor_acertos;
            break;
    }

    draw_set_color(_creme);

    draw_text_transformed(
        _cx,
        _y1 + 44,
        _titulo,
        1.15,
        1.15,
        0
    );

    draw_set_color(_cinza);

    draw_text(
        _cx,
        _y1 + 84,
        _instrucao
    );


    if (tipo_task == 0) {

        var _esq = _cx - 125;
        var _dir = _cx + 125;


        for (var i = 0; i < 4; i++) {

            var _fy = _cy - 65 + i * 43;

            draw_set_color(_azul_claro);

            draw_rectangle(
                _esq - 68,
                _fy - 14,
                _esq + 15,
                _fy + 14,
                false
            );

            draw_rectangle(
                _dir - 15,
                _fy - 14,
                _dir + 68,
                _fy + 14,
                false
            );

            draw_set_color(cores_fios[i]);

            draw_line_width(
                _esq - 51,
                _fy,
                _esq,
                _fy,
                5
            );

            draw_circle(
                _esq,
                _fy,
                8,
                false
            );

            draw_set_color(cores_fios[ordem_fios[i]]);

            draw_line_width(
                _dir,
                _fy,
                _dir + 51,
                _fy,
                5
            );

            draw_circle(
                _dir,
                _fy,
                8,
                false
            );
        }


        for (var f = 0; f < 4; f++) {

            if (fios_conectados[f]) {

                var _origem_y = _cy - 65 + f * 43;

                for (var d = 0; d < 4; d++) {

                    if (ordem_fios[d] == f) {

                        var _destino_y = _cy - 65 + d * 43;

                        draw_set_color(cores_fios[f]);

                        draw_line_width(
                            _esq,
                            _origem_y,
                            _dir,
                            _destino_y,
                            5
                        );

                        break;
                    }
                }
            }
        }


        if (fio_arrastando != -1) {

            var _mx = device_mouse_x_to_gui(0);
            var _my = device_mouse_y_to_gui(0);

            var _fy_drag =
                _cy - 65 + fio_arrastando * 43;

            draw_set_color(
                cores_fios[fio_arrastando]
            );

            draw_line_width(
                _esq,
                _fy_drag,
                _mx,
                _my,
                5
            );
        }
    }


    else if (tipo_task == 1) {

        var _mod = min(modulo_solar, 2);
        var _ideal = angulos_ideais[_mod];

        draw_set_color(_azul_claro);

        draw_rectangle(
            _cx - 190,
            _cy - 84,
            _cx + 190,
            _cy + 40,
            false
        );

        draw_set_color(_dourado);

        draw_circle(
            _cx + 130,
            _cy - 48,
            17,
            false
        );


        draw_set_color(_cinza);

        draw_line_width(
            _cx,
            _cy - 30,
            _cx,
            _cy + 14,
            6
        );

        var _tam = 53;

        var _x1p =
            _cx - lengthdir_x(_tam, angulo_solar);

        var _y1p =
            _cy - 30 - lengthdir_y(_tam, angulo_solar);

        var _x2p =
            _cx + lengthdir_x(_tam, angulo_solar);

        var _y2p =
            _cy - 30 + lengthdir_y(_tam, angulo_solar);

        draw_set_color(
            make_color_rgb(10, 35, 70)
        );

        draw_line_width(
            _x1p, _y1p,
            _x2p, _y2p,
            24
        );

        draw_set_color(
            make_color_rgb(43, 140, 216)
        );

        draw_line_width(
            _x1p, _y1p,
            _x2p, _y2p,
            17
        );

        draw_set_color(
            make_color_rgb(150, 216, 244)
        );

        draw_line_width(
            _x1p, _y1p,
            _x2p, _y2p,
            3
        );

        draw_set_color(_creme);

        draw_text(
            _cx,
            _cy + 66,
            "ANGULO: " + string(angulo_solar)
            + "   |   IDEAL: " + string(_ideal)
        );

        if (erro_solar > 0) {

            draw_set_color(_vermelho);

            draw_text(
                _cx,
                _cy + 91,
                "ANGULO INCORRETO!"
            );
        }
    }


    else if (tipo_task == 2) {

        var _nivel = min(
            sensor_acertos,
            sensor_total - 1
        );

        var _barra_x1 = _cx - 145;
        var _barra_x2 = _cx + 145;
        var _barra_y = _cy - 12;

        draw_set_color(_azul_claro);

        draw_rectangle(
            _cx - 190,
            _cy - 84,
            _cx + 190,
            _cy + 54,
            false
        );


        draw_set_color(
            make_color_rgb(75, 94, 115)
        );

        draw_rectangle(
            _barra_x1,
            _barra_y - 12,
            _barra_x2,
            _barra_y + 12,
            false
        );

        var _alvo = sensor_alvos[_nivel];

        var _tolerancia =
            sensor_tolerancias[_nivel];

        var _zona_x =
            _barra_x1 + 290 * _alvo;

        var _margem =
            290 * _tolerancia;


        draw_set_color(_verde);

        draw_rectangle(
            _zona_x - _margem,
            _barra_y - 12,
            _zona_x + _margem,
            _barra_y + 12,
            false
        );


        var _indicador_x =
            _barra_x1 + 290 * sensor_posicao;

        draw_set_color(_creme);

        draw_rectangle(
            _indicador_x - 4,
            _barra_y - 22,
            _indicador_x + 4,
            _barra_y + 22,
            false
        );

        draw_set_color(_cinza);

        draw_text(
            _cx,
            _cy + 78,
            "PRESSIONE ESPACO NA AREA VERDE"
        );

        if (sensor_erro > 0) {

            draw_set_color(_vermelho);

            draw_text(
                _cx,
                _cy + 102,
                "CALIBRACAO INCORRETA!"
            );
        }
    }


    var _progresso_y = _y2 - 72;

    draw_set_color(_dourado);

    draw_text(
        _cx,
        _progresso_y,
        "PROGRESSO: "
        + string(_atual)
        + "/"
        + string(_total)
    );

    var _seg_largura = 34;
    var _seg_espaco = 6;

    var _barra_largura =
        _total * _seg_largura
        + (_total - 1) * _seg_espaco;

    var _inicio_barra =
        _cx - _barra_largura / 2;

    for (var k = 0; k < _total; k++) {

        if (k < _atual) {
            draw_set_color(_verde);
        } else {
            draw_set_color(
                make_color_rgb(64, 78, 96)
            );
        }

        var _sx =
            _inicio_barra
            + k * (_seg_largura + _seg_espaco);

        draw_rectangle(
            _sx,
            _progresso_y + 17,
            _sx + _seg_largura,
            _progresso_y + 23,
            false
        );
    }


    draw_set_color(_azul_claro);

    draw_rectangle(
        _x1 + 7,
        _y2 - 32,
        _x2 - 7,
        _y2 - 7,
        false
    );

    if (task_concluida) {

        draw_set_color(_verde);

        draw_text(
            _cx,
            _y2 - 19,
            "TAREFA CONCLUIDA!"
        );

    } else {

        draw_set_color(_creme);

        if (tipo_task == 0) {

            draw_text(
                _cx,
                _y2 - 19,
                "MOUSE: CONECTAR     S: SAIR"
            );
        }

        if (tipo_task == 1) {

            draw_text(
                _cx,
                _y2 - 19,
                "SETAS: AJUSTAR  |  ESPACO: CONFIRMAR  |  S: SAIR"
            );
        }

        if (tipo_task == 2) {

            draw_text(
                _cx,
                _y2 - 19,
                "ESPACO: CALIBRAR     S: SAIR"
            );
        }
    }

} else {


    if (instance_exists(caixa_atual) && !derrotado) {

        if (!caixa_atual.concluida) {

            draw_set_color(_azul);

            draw_rectangle(
                _cx - 116,
                _h - 95,
                _cx + 116,
                _h - 40,
                false
            );

            draw_set_color(_dourado);

            draw_rectangle(
                _cx - 116,
                _h - 95,
                _cx + 116,
                _h - 40,
                true
            );

            draw_set_color(_creme);

            draw_text(
                _cx,
                _h - 67,
                "[ E ]  INTERAGIR"
            );
        }
    }
}


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

    var _hx =
        _hud_x + _vida_i * _espaco_coracao;

    var _hy = _hud_y;

    if (_vida_i < vida) {
        draw_set_color(_cor_vida);
    } else {
        draw_set_color(_cor_vazia);
    }

    for (var _linha = 0; _linha < 6; _linha++) {

        for (var _coluna = 0; _coluna < 7; _coluna++) {

            if (
                string_char_at(
                    _coracao[_linha],
                    _coluna + 1
                ) == "1"
            ) {

                draw_rectangle(
                    _hx + _coluna * _pixel,
                    _hy + _linha * _pixel,
                    _hx + (_coluna + 1) * _pixel - 1,
                    _hy + (_linha + 1) * _pixel - 1,
                    false
                );
            }
        }
    }
}

if (derrotado) {

    draw_set_alpha(0.9);
    draw_set_color(make_color_rgb(5, 10, 25));

    draw_rectangle(
        0, 0, _w, _h, false
    );

    draw_set_alpha(1);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_set_color(_vermelho);

    draw_text_transformed(
        _cx,
        _cy - 26,
        "VOCE FICOU SEM VIDAS!",
        2,
        2,
        0
    );

    draw_set_color(_creme);

    draw_text(
        _cx,
        _cy + 30,
        "TENTE NOVAMENTE!"
    );
}


draw_set_alpha(1);
draw_set_color(c_white);
draw_set_font(-1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);


if (!tarefa_aberta && !derrotado) {

    var _ord_caixa = noone;
    var _ord_titulo = "";
    var _ord_mensagem = "";
    var _ord_numero = 0;

    var _ord_luz = instance_find(obj_CaixaLuz, 0);
    var _ord_solar = instance_find(obj_CaixaSolar, 0);
    var _ord_sensor = instance_find(obj_CaixaSensor, 0);

    if (instance_exists(_ord_luz) && !_ord_luz.concluida) {

        _ord_caixa = _ord_luz;
        _ord_titulo = "MISSAO 1/3";
        _ord_mensagem = "CIRCUITO ELETRICO";
        _ord_numero = 1;

    }
    else if (instance_exists(_ord_solar) && !_ord_solar.concluida) {

        _ord_caixa = _ord_solar;
        _ord_titulo = "MISSAO 2/3";
        _ord_mensagem = "ENERGIA SOLAR";
        _ord_numero = 2;

    }
    else if (instance_exists(_ord_sensor) && !_ord_sensor.concluida) {

        _ord_caixa = _ord_sensor;
        _ord_titulo = "MISSAO 3/3";
        _ord_mensagem = "SENSORES INTELIGENTES";
        _ord_numero = 3;
    }

    if (instance_exists(_ord_caixa) && view_enabled) {

        var _ord_cam = view_camera[0];

        var _ord_vx = camera_get_view_x(_ord_cam);
        var _ord_vy = camera_get_view_y(_ord_cam);

        var _ord_vw = camera_get_view_width(_ord_cam);
        var _ord_vh = camera_get_view_height(_ord_cam);

        var _ord_gw = display_get_gui_width();
        var _ord_gh = display_get_gui_height();

        var _ord_bx = (
            _ord_caixa.x - _ord_vx
        ) * (_ord_gw / _ord_vw);

        var _ord_by = (
            _ord_caixa.bbox_top - _ord_vy
        ) * (_ord_gh / _ord_vh) - 18;

        var _ord_largura = 220;
        var _ord_altura = 74;

        var _ord_x1 = _ord_bx - _ord_largura / 2;
        var _ord_y1 = _ord_by - _ord_altura;

        var _ord_x2 = _ord_bx + _ord_largura / 2;
        var _ord_y2 = _ord_by;

        draw_set_alpha(0.96);

        draw_set_color(make_color_rgb(16, 27, 46));

        draw_rectangle(
            _ord_x1,
            _ord_y1,
            _ord_x2,
            _ord_y2,
            false
        );

        draw_set_alpha(1);

        draw_set_color(make_color_rgb(235, 187, 92));

        draw_rectangle(
            _ord_x1,
            _ord_y1,
            _ord_x2,
            _ord_y2,
            true
        );

        draw_set_color(make_color_rgb(16, 27, 46));

        draw_triangle(
            _ord_bx - 9,
            _ord_by,
            _ord_bx + 9,
            _ord_by,
            _ord_bx,
            _ord_by + 12,
            false
        );

        draw_set_color(make_color_rgb(235, 187, 92));

        draw_line(
            _ord_bx - 9,
            _ord_by,
            _ord_bx,
            _ord_by + 12
        );

        draw_line(
            _ord_bx,
            _ord_by + 12,
            _ord_bx + 9,
            _ord_by
        );

        draw_set_font(-1);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);

        draw_set_color(make_color_rgb(235, 187, 92));

        draw_text(
            _ord_bx,
            _ord_y1 + 16,
            _ord_titulo
        );

        draw_set_color(c_white);

        draw_text(
            _ord_bx,
            _ord_y1 + 38,
            _ord_mensagem
        );

        draw_set_color(make_color_rgb(103, 225, 153));

        draw_text(
            _ord_bx,
            _ord_y1 + 59,
            "APERTE E PARA INICIAR"
        );

        draw_set_alpha(1);
        draw_set_color(c_white);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    }
}


if (tarefa_aberta && task_concluida) {

    var _mw = display_get_gui_width();
    var _mh = display_get_gui_height();

    var _cx = _mw / 2;
    var _cy = _mh / 2;

    var _largura = 620;
    var _altura = 270;

    var _x1 = _cx - _largura / 2;
    var _y1 = _cy - _altura / 2;
    var _x2 = _cx + _largura / 2;
    var _y2 = _cy + _altura / 2;

    var _azul = make_color_rgb(16, 27, 46);
    var _dourado = make_color_rgb(235, 187, 92);
    var _creme = make_color_rgb(255, 238, 195);
    var _verde = make_color_rgb(103, 225, 153);


    draw_set_alpha(0.85);
    draw_set_color(c_black);
    draw_rectangle(0, 0, _mw, _mh, false);
    draw_set_alpha(1);


    draw_set_color(c_black);
    draw_rectangle(
        _x1 + 6, _y1 + 6,
        _x2 + 6, _y2 + 6,
        false
    );


    draw_set_color(_azul);
    draw_rectangle(
        _x1, _y1,
        _x2, _y2,
        false
    );


    draw_set_color(_dourado);

    draw_rectangle(
        _x1, _y1,
        _x2, _y2,
        true
    );

    draw_rectangle(
        _x1 + 5, _y1 + 5,
        _x2 - 5, _y2 - 5,
        true
    );


    draw_set_font(-1);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);


    draw_set_color(_dourado);

    draw_text(
        _cx,
        _y1 + 35,
        "PIXELIGHT"
    );


    draw_set_color(_verde);

    draw_text(
        _cx,
        _y1 + 72,
        "TAREFA CONCLUIDA!"
    );


    draw_set_color(_dourado);

    draw_line(
        _x1 + 40,
        _y1 + 100,
        _x2 - 40,
        _y1 + 100
    );


    var _mensagem = mensagens_educativas[tipo_task];

    var _texto_largura = 480;

    var _texto_altura = string_height_ext(
        _mensagem,
        24,
        _texto_largura
    );

    draw_set_color(_creme);

    draw_set_valign(fa_top);

    draw_text_ext(
        _cx,
        _y1 + 145 - _texto_altura / 2,
        _mensagem,
        24,
        _texto_largura
    );


    draw_set_valign(fa_middle);
    draw_set_color(_dourado);

    draw_text(
        _cx,
        _y2 - 32,
        "ESPACO OU ENTER PARA CONTINUAR"
    );


    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
