
draw_set_alpha(1);
draw_set_color(c_white);

if (luz_intensidade > 0) {

    var _chao_x = x + luz_chao_x;
    var _chao_y = y + luz_chao_y;

    gpu_set_blendmode(bm_add);

    for (var i = 18; i >= 1; i--) {

        var _fator = i / 18;

        var _rx = luz_raio * _fator;
        var _ry = luz_raio * luz_altura_chao * _fator;

        draw_set_color(luz_cor);
        draw_set_alpha(0.035 * luz_intensidade);

        draw_ellipse(
            _chao_x - _rx,
            _chao_y - _ry,
            _chao_x + _rx,
            _chao_y + _ry,
            false
        );
    }

    gpu_set_blendmode(bm_normal);
}

draw_set_alpha(1);
draw_set_color(c_white);

draw_self();

if (luz_intensidade > 0) {

    var _lamp_x = x + luz_lampada_x;
    var _lamp_y = y + luz_lampada_y;

    gpu_set_blendmode(bm_add);

    for (var j = 10; j >= 1; j--) {

        var _raio = j * 5;

        draw_set_color(luz_cor_centro);
        draw_set_alpha(0.035 * luz_intensidade);

        draw_circle(
            _lamp_x,
            _lamp_y,
            _raio,
            false
        );
    }

    draw_set_color(make_color_rgb(255, 245, 195));
    draw_set_alpha(0.4 * luz_intensidade);

    draw_circle(
        _lamp_x,
        _lamp_y,
        7,
        false
    );

    gpu_set_blendmode(bm_normal);
}

draw_set_alpha(1);
draw_set_color(c_white);
