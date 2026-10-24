
var _w = display_get_gui_width();
var _h = display_get_gui_height();

var _cx = _w / 2;
var _cy = _h / 2;

var _azul = make_color_rgb(16, 27, 46);
var _azul_claro = make_color_rgb(28, 45, 67);
var _dourado = make_color_rgb(235, 187, 92);
var _creme = make_color_rgb(255, 238, 195);
var _cinza = make_color_rgb(145, 160, 180);
var _verde = make_color_rgb(103, 225, 153);
var _vermelho = make_color_rgb(239, 83, 97);

draw_set_alpha(1);
draw_set_font(-1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (painel_aberto) {

    // FUNDO ESCURECIDO

    draw_set_color(make_color_rgb(4, 10, 22));
    draw_set_alpha(0.82);
    draw_rectangle(0, 0, _w, _h, false);
    draw_set_alpha(1);

    // PAINEL ORIGINAL

    var _x1 = _cx - 285;
    var _y1 = _cy - 174;
    var _x2 = _cx + 285;
    var _y2 = _cy + 174;

    draw_set_color(c_black);
    draw_set_alpha(0.5);

    draw_rectangle(
        _x1 + 8, _y1 + 8,
        _x2 + 8, _y2 + 8,
        false
    );

    draw_set_alpha(1);

    draw_set_color(_azul);
    draw_rectangle(_x1, _y1, _x2, _y2, false);

    draw_set_color(_dourado);
    draw_rectangle(_x1, _y1, _x2, _y2, true);

    draw_rectangle(
        _x1 + 4, _y1 + 4,
        _x2 - 4, _y2 - 4,
        true
    );

    // CABECALHO

    draw_set_color(_azul_claro);

    draw_rectangle(
        _x1 + 7,
        _y1 + 7,
        _x2 - 7,
        _y1 + 76,
        false
    );

    draw_set_color(_dourado);

    draw_rectangle(
        _x1 + 7,
        _y1 + 77,
        _x2 - 7,
        _y1 + 79,
        false
    );

    draw_set_color(_dourado);

    draw_text(
        _cx,
        _y1 + 19,
        "PIXELIGHT"
    );

    draw_set_color(_creme);

    draw_text(
        _cx,
        _y1 + 41,
        "CENTRAL INTELIGENTE"
    );

    draw_set_color(_cinza);

    draw_text(
        _cx,
        _y1 + 64,
        "DICA: FACULDADE NO MODO FORTE"
    );

    // QUATRO REGIOES
    // COORDENADAS ORIGINAIS PRESERVADAS

    for (var i = 0; i < 4; i++) {

        var _ry = _cy - 78 + i * 41;

        draw_set_color(_azul_claro);

        draw_rectangle(
            _cx - 270,
            _ry - 19,
            _cx + 270,
            _ry + 19,
            false
        );

        draw_set_color(make_color_rgb(49, 68, 91));

        draw_rectangle(
            _cx - 270,
            _ry - 19,
            _cx + 270,
            _ry + 19,
            true
        );

        draw_set_halign(fa_left);
        draw_set_color(_creme);

        draw_text(
            _cx - 260,
            _ry,
            nomes_regioes[i]
        );

        draw_set_halign(fa_center);

        // BOTOES ORIGINAIS

        for (var j = 0; j < 3; j++) {

            var _bx = _cx - 90 + j * 116;

            var _cor = make_color_rgb(49, 62, 81);
            var _texto = "APAGADA";

            if (j == 1) {
                _texto = "SENSOR";
            }

            if (j == 2) {
                _texto = "FORTE";
            }

            if (modos[i] == j) {

                if (j == 0) {
                    _cor = make_color_rgb(103, 113, 128);
                }

                if (j == 1) {
                    _cor = make_color_rgb(38, 145, 105);
                }

                if (j == 2) {
                    _cor = make_color_rgb(175, 121, 38);
                }
            }

            draw_set_color(_cor);

            draw_rectangle(
                _bx,
                _ry - 15,
                _bx + 105,
                _ry + 15,
                false
            );

            if (modos[i] == j) {

                draw_set_color(_dourado);

                draw_rectangle(
                    _bx,
                    _ry - 15,
                    _bx + 105,
                    _ry + 15,
                    true
                );
            }

            draw_set_color(_creme);

            draw_text(
                _bx + 52,
                _ry,
                _texto
            );
        }
    }

    // COBERTURA

    draw_set_color(_dourado);

    draw_text(
        _cx - 135,
        _cy + 88,
        "COBERTURA: "
        + string(cobertura_atual)
        + "%"
    );

    // ENERGIA

    if (consumo_atual > limite_energia) {
        draw_set_color(_vermelho);
    } else {
        draw_set_color(_verde);
    }

    draw_text(
        _cx + 140,
        _cy + 88,
        "ENERGIA: "
        + string(consumo_atual)
        + "/"
        + string(limite_energia)
    );

    // MENSAGEM

    if (aviso_central != "") {

        draw_set_color(_vermelho);

        draw_text(
            _cx,
            _cy + 110,
            aviso_central
        );

    } else {

        draw_set_color(_cinza);

        draw_text(
            _cx,
            _cy + 110,
            "ILUMINE TODAS AS RUAS SEM DESPERDICAR ENERGIA"
        );
    }

    // BOTAO TESTAR
    // COORDENADAS ORIGINAIS PRESERVADAS

    draw_set_color(make_color_rgb(36, 135, 105));

    draw_rectangle(
        _cx - 115,
        _cy + 119,
        _cx + 115,
        _cy + 151,
        false
    );

    draw_set_color(_dourado);

    draw_rectangle(
        _cx - 115,
        _cy + 119,
        _cx + 115,
        _cy + 151,
        true
    );

    draw_set_color(_creme);

    draw_text(
        _cx,
        _cy + 135,
        "TESTAR MINHA CIDADE"
    );

    // RODAPE

    draw_set_color(_cinza);

    draw_text(
        _cx,
        _cy + 162,
        "MOUSE: SELECIONAR  |  ESPACO: TESTAR  |  S: SAIR"
    );

}
else if (missao_concluida) {

    if (tempo_final > 0) {

        draw_set_alpha(0.94);
        draw_set_color(_azul);

        draw_rectangle(
            _cx - 245,
            17,
            _cx + 245,
            100,
            false
        );

        draw_set_alpha(1);
        draw_set_color(_dourado);

        draw_rectangle(
            _cx - 245,
            17,
            _cx + 245,
            100,
            true
        );

        draw_set_color(_verde);

        draw_text(
            _cx,
            44,
            "SISTEMA INTELIGENTE ATIVADO!"
        );

        draw_set_color(_creme);

        draw_text(
            _cx,
            73,
            "A CIDADE ESTA SENDO ILUMINADA..."
        );
    }

}
else if (instance_exists(obj_personagem)) {

    var _p = instance_nearest(
        x,
        y,
        obj_personagem
    );

    if (
        point_distance(
            x,
            y,
            _p.x,
            _p.y
        ) < 40
    ) {

        if (!_p.tarefa_aberta) {

            draw_set_color(_azul);

            draw_rectangle(
                _cx - 175,
                _h - 95,
                _cx + 175,
                _h - 40,
                false
            );

            draw_set_color(_dourado);

            draw_rectangle(
                _cx - 175,
                _h - 95,
                _cx + 175,
                _h - 40,
                true
            );

            if (desbloqueada) {

                draw_set_color(_creme);

                draw_text(
                    _cx,
                    _h - 67,
                    "[ E ]  ACESSAR CENTRAL"
                );

            } else {

                draw_set_color(_dourado);

                draw_text(
                    _cx,
                    _h - 67,
                    "CONCLUA AS 3 TASKS!"
                );
            }
        }
    }
}

// BALAO CENTRAL DESBLOQUEADA

if (balao_visivel && !painel_aberto && !missao_concluida) {

    var _cam = view_camera[0];

    var _vx = camera_get_view_x(_cam);
    var _vy = camera_get_view_y(_cam);

    var _vw = camera_get_view_width(_cam);
    var _vh = camera_get_view_height(_cam);

    var _bx = (x - _vx) * (_w / _vw);
    var _by = (y - _vy - 85) * (_h / _vh);

    var _largura = 250;
    var _altura = 65;

    var _bx1 = _bx - _largura / 2;
    var _by1 = _by - _altura;
    var _bx2 = _bx + _largura / 2;
    var _by2 = _by;

    draw_set_alpha(0.95);
    draw_set_color(_azul);

    draw_rectangle(
        _bx1,
        _by1,
        _bx2,
        _by2,
        false
    );

    draw_set_alpha(1);
    draw_set_color(_dourado);

    draw_rectangle(
        _bx1,
        _by1,
        _bx2,
        _by2,
        true
    );

    draw_set_color(_azul);

    draw_triangle(
        _bx - 9,
        _by,
        _bx + 9,
        _by,
        _bx,
        _by + 12,
        false
    );

    draw_set_color(_dourado);

    draw_line(
        _bx - 9,
        _by,
        _bx,
        _by + 12
    );

    draw_line(
        _bx,
        _by + 12,
        _bx + 9,
        _by
    );

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_set_color(_verde);

    draw_text(
        _bx,
        _by1 + 21,
        "CENTRAL DESBLOQUEADA!"
    );

    draw_set_color(c_white);

    draw_text(
        _bx,
        _by1 + 45,
        "APERTE E PARA ATIVAR"
    );
}

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_font(-1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
