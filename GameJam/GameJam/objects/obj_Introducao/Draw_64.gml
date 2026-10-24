
var _w = display_get_gui_width();
var _h = display_get_gui_height();

draw_set_color(make_color_rgb(15, 25, 42));
draw_rectangle(0, 0, _w, _h, false);

draw_set_color(make_color_rgb(35, 55, 75));
draw_rectangle(0, _h * 0.58, _w, _h, false);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(make_color_rgb(255, 215, 110));
draw_text_transformed(
    _w / 2,
    _h * 0.15,
    "PIXELIGHT",
    2,
    2,
    0
);

draw_set_color(c_white);
draw_text(
    _w / 2,
    _h * 0.25,
    "A CIENCIA DELAS ILUMINA O FUTURO"
);

draw_set_color(make_color_rgb(12, 20, 35));
draw_rectangle(
    _w * 0.08,
    _h * 0.62,
    _w * 0.92,
    _h * 0.91,
    false
);

draw_set_color(make_color_rgb(255, 215, 110));
draw_rectangle(
    _w * 0.08,
    _h * 0.62,
    _w * 0.92,
    _h * 0.91,
    true
);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_color(make_color_rgb(255, 215, 110));
draw_text(_w * 0.12, _h * 0.66, "ANA");

draw_set_color(c_white);
draw_text_ext(
    _w * 0.12,
    _h * 0.72,
    falas[pagina],
    6,
    _w * 0.76
);

draw_set_halign(fa_center);

draw_set_color(make_color_rgb(170, 190, 210));
draw_text(
    _w / 2,
    _h * 0.95,
    "ESPACO OU CLIQUE PARA CONTINUAR"
);

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
