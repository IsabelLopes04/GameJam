var _gw = display_get_gui_width();
var _gh = display_get_gui_height();

draw_set_alpha(escuridao);
draw_set_color(cor_noite);
draw_rectangle(0, 0, _gw, _gh, false);
draw_set_alpha(1);

if (cidade_acesa && view_enabled && view_visible[0]) {
    var _cam = view_camera[0];
    var _cam_x = camera_get_view_x(_cam);
    var _cam_y = camera_get_view_y(_cam);
    var _cam_w = camera_get_view_width(_cam);
    var _cam_h = camera_get_view_height(_cam);
    var _escala_x = _gw / _cam_w;
    var _escala_y = _gh / _cam_h;
    var _transicao = clamp((escuridao_inicial - escuridao) / (escuridao_inicial - escuridao_final), 0, 1);

    with (obj_Poste2) {
        var _lx = (x + 23 * image_xscale - _cam_x) * _escala_x;
        var _ly = (y + 11 * image_yscale - _cam_y) * _escala_y;
        var _forca = _transicao * luz_intensidade;

        if (_forca > 0 && _lx >= -100 && _ly >= -100 && _lx <= _gw + 100 && _ly <= _gh + 100) {
            draw_set_color(make_color_rgb(255, 190, 90));
            draw_set_alpha(0.08 * _forca);
            draw_circle(_lx, _ly, 62, false);
            draw_set_alpha(0.13 * _forca);
            draw_circle(_lx, _ly, 39, false);
            draw_set_alpha(0.24 * _forca);
            draw_circle(_lx, _ly, 20, false);
            draw_set_color(make_color_rgb(255, 238, 165));
            draw_set_alpha(0.75 * _forca);
            draw_circle(_lx, _ly, 7, false);
            draw_set_color(make_color_rgb(255, 250, 210));
            draw_set_alpha(0.9 * _forca);
            draw_circle(_lx, _ly, 3, false);
        }
    }
}

draw_set_alpha(1);
draw_set_color(c_white);
