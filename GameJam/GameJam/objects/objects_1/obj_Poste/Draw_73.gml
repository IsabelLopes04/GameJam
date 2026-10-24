if (intensidade_luz > 0) {

    var _lx = x + (luz_offset_x * lado_luz);
    var _ly = y + luz_offset_y;

    var _forca = intensidade_luz;
    var _raio = 48;

    gpu_set_blendmode(bm_add);

    draw_primitive_begin(pr_trianglefan);

    draw_vertex_color(
        _lx,
        _ly,
        cor_luz,
        0.55 * _forca
    );

    for (var i = 0; i <= 48; i++) {

        var _angulo = i * 360 / 48;

        var _px = _lx + lengthdir_x(_raio, _angulo);
        var _py = _ly + lengthdir_y(_raio, _angulo);

        draw_vertex_color(
            _px,
            _py,
            cor_luz,
            0
        );
    }

    draw_primitive_end();

    draw_set_color(cor_luz);


    draw_set_alpha(0.85 * _forca);
    draw_circle(_lx, _ly, 4, false);

    draw_set_alpha(0.3 * _forca);
    draw_circle(_lx, _ly, 8, false);

    draw_set_alpha(0.020 * _forca);
    draw_circle(_lx, _ly, _raio, false);

    draw_set_alpha(0.040 * _forca);
    draw_circle(_lx, _ly, _raio * 0.70, false);

    draw_set_alpha(0.070 * _forca);
    draw_circle(_lx, _ly, _raio * 0.45, false);

    draw_set_alpha(0.55 * _forca);
    draw_circle(_lx, _ly, 5, false);


    draw_set_alpha(1);
    draw_set_color(c_white);

    gpu_set_blendmode(bm_normal);
}