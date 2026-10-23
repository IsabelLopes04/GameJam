if (intensidade_luz > 0) {

    var _lx = x + (luz_offset_x * lado_luz);
    var _ly = y + luz_offset_y;

    var _raio = raio_luz;
    var _forca = intensidade_luz;

    gpu_set_blendmode(bm_add);

    draw_set_color(cor_luz);

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