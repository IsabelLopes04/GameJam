
var _w = display_get_gui_width();
var _h = display_get_gui_height();

draw_set_alpha(1);

draw_set_font(fnt_Dialogo);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _texto = string_copy(
    mensagens[pagina_final],
    1,
    floor(texto_visivel)
);

var _escala = 1.25;

draw_set_color(make_color_rgb(255, 215, 100));

draw_text_transformed(
    _w * 0.29,
    _h * 0.645,
    "ANA",
    1,
    1,
    0
);

draw_set_color(c_white);

draw_text_ext_transformed(
    _w * 0.29,
    _h * 0.70,
    _texto,
    32,
    (_w * 0.50) / _escala,
    _escala,
    _escala,
    0
);

draw_set_font(-1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
