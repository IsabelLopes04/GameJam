
var _w = display_get_gui_width();
var _h = display_get_gui_height();

draw_set_font(fnt_Dialogo);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _escala = 1.5;

draw_set_color(make_color_rgb(255, 200, 70));

draw_text_transformed(
    _w * 0.29,
    _h * 0.665,
    "ANA",
    1.2,
    1.2,
    0
);

draw_set_color(c_white);

var _texto = string_copy(
    falas[pagina],
    1,
    floor(texto_visivel)
);

draw_text_ext_transformed(
    _w * 0.29,
    _h * 0.72,
    _texto,
    36,
    (_w * 0.49) / _escala,
    _escala,
    _escala,
    0
);

draw_set_font(-1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
