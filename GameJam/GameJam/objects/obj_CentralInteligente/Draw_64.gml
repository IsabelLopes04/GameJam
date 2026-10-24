
var _w = display_get_gui_width();
var _h = display_get_gui_height();

var _cx = _w / 2;
var _cy = _h / 2;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(1);

if (painel_aberto) {

    draw_set_color(make_color_rgb(8, 14, 23));
    draw_set_alpha(0.92);
    draw_rectangle(0, 0, _w, _h, false);
    draw_set_alpha(1);

    draw_set_color(make_color_rgb(24, 39, 58));
    draw_rectangle(
        _cx - 285, _cy - 174,
        _cx + 285, _cy + 174, false
    );

    draw_set_color(make_color_rgb(56, 184, 220));
    draw_rectangle(
        _cx - 285, _cy - 174,
        _cx + 285, _cy - 168, false
    );

    draw_set_color(make_color_rgb(106, 220, 245));
    draw_text(_cx, _cy - 151, "CENTRAL PIXELIGHT");

    draw_set_color(c_white);
    draw_text(
        _cx, _cy - 130,
        "ESCOLHA UMA LUZ PARA CADA LUGAR!"
    );

    draw_set_color(make_color_rgb(255, 216, 105));
    draw_text(
        _cx, _cy - 109,
        "DICA: A FACULDADE PRECISA DE LUZ FORTE"
    );

    for (var i = 0; i < 4; i++) {

        var _ry = _cy - 78 + i * 41;

        draw_set_color(make_color_rgb(34, 53, 73));
        draw_rectangle(
            _cx - 270, _ry - 19,
            _cx + 270, _ry + 19, false
        );

        draw_set_halign(fa_left);
        draw_set_color(c_white);
        draw_text(_cx - 260, _ry, nomes_regioes[i]);
        draw_set_halign(fa_center);

        for (var j = 0; j < 3; j++) {

            var _bx = _cx - 90 + j * 116;
            var _cor = make_color_rgb(65, 77, 95);
            var _texto = "APAGADA";

            if (j == 1) {
                _texto = "SENSOR";
            }

            if (j == 2) {
                _texto = "FORTE";
            }

            if (modos[i] == j) {

                if (j == 0) {
                    _cor = make_color_rgb(125, 135, 150);
                }

                if (j == 1) {
                    _cor = make_color_rgb(35, 165, 125);
                }

                if (j == 2) {
                    _cor = make_color_rgb(215, 155, 45);
                }
            }

            draw_set_color(_cor);
            draw_rectangle(
                _bx, _ry - 15,
                _bx + 105, _ry + 15, false
            );

            if (modos[i] == j) {
                draw_set_color(c_white);
                draw_rectangle(
                    _bx, _ry - 15,
                    _bx + 105, _ry + 15, true
                );
            }

            draw_set_color(c_white);
            draw_text(_bx + 52, _ry, _texto);
        }
    }

    draw_set_color(c_white);
    draw_text(
        _cx - 130, _cy + 88,
        "RUAS ILUMINADAS: "
        + string(cobertura_atual) + "%"
    );

    if (consumo_atual > limite_energia) {
        draw_set_color(c_red);
    } else {
        draw_set_color(c_lime);
    }

    draw_text(
        _cx + 137, _cy + 88,
        "ENERGIA: " + string(consumo_atual)
        + "/" + string(limite_energia)
    );

    if (aviso_central != "") {
        draw_set_color(make_color_rgb(255, 213, 106));
        draw_text(_cx, _cy + 112, aviso_central);
    } else {
        draw_set_color(c_white);
        draw_text(
            _cx, _cy + 112,
            "ILUMINE TODAS AS RUAS SEM GASTAR DEMAIS!"
        );
    }

    draw_set_color(make_color_rgb(42, 165, 135));
    draw_rectangle(
        _cx - 115, _cy + 119,
        _cx + 115, _cy + 151, false
    );

    draw_set_color(c_white);
    draw_text(_cx, _cy + 135, "TESTAR MINHA CIDADE");

    draw_set_color(make_color_rgb(185, 200, 215));
    draw_text(
        _cx, _cy + 162,
        "CLIQUE NOS BOTOES | S - SAIR"
    );

}
else if (missao_concluida) {

    if (tempo_final > 0) {

        draw_set_color(make_color_rgb(15, 35, 45));
        draw_set_alpha(0.85);

        draw_rectangle(
            _cx - 225, 20,
            _cx + 225, 90, false
        );

        draw_set_alpha(1);
        draw_set_color(make_color_rgb(100, 235, 180));

        draw_text(
            _cx, 43,
            "SISTEMA INTELIGENTE ATIVADO!"
        );

        draw_set_color(c_white);
        draw_text(
            _cx, 68,
            "A CIDADE ESTA SENDO ILUMINADA..."
        );
    }
}
else if (instance_exists(obj_personagem)) {

    var _p = instance_nearest(x, y, obj_personagem);

    if (point_distance(x, y, _p.x, _p.y) < 40) {

        if (!_p.tarefa_aberta) {

            draw_set_color(make_color_rgb(20, 30, 45));
            draw_rectangle(
                _cx - 165, _h - 95,
                _cx + 165, _h - 40, false
            );

            draw_set_color(c_white);

            if (desbloqueada) {
                draw_text(_cx, _h - 68, "E - ACESSAR CENTRAL");
            } else {
                draw_text(_cx, _h - 68, "CONCLUA AS 3 TASKS!");
            }
        }
    }
}

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
