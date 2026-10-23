
if (intensidade_luz > 0) {

    var _lx = x;
    var _ly = y + luz_deslocamento_y;

    var _raio = raio_luz;
    var _forca = intensidade_luz;

    gpu_set_blendmode(bm_add);

    draw_set_color(cor_luz);

    draw_set_alpha(0.025 * _forca);
    draw_circle(_lx, _ly, _raio, false);

    draw_set_alpha(0.045 * _forca);
    draw_circle(_lx, _ly, _raio * 0.72, false);

    draw_set_alpha(0.075 * _forca);
    draw_circle(_lx, _ly, _raio * 0.45, false);

    draw_set_alpha(0.45 * _forca);
    draw_circle(_lx, _ly, 7, false);

    draw_set_alpha(1);
    draw_set_color(c_white);

    gpu_set_blendmode(bm_normal);
}
