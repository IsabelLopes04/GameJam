
var _w = display_get_gui_width();
var _h = display_get_gui_height();

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

var _botao = point_in_rectangle(
    _mx, _my,
    _w * 0.79, _h * 0.82,
    _w * 0.96, _h * 0.91
);

var _texto = falas[pagina];

texto_visivel = min(
    texto_visivel + velocidade_texto,
    string_length(_texto)
);

if (
    keyboard_check_pressed(vk_space) ||
    keyboard_check_pressed(vk_enter) ||
    (mouse_check_button_pressed(mb_left) && _botao)
) {
    if (texto_visivel < string_length(_texto)) {
        texto_visivel = string_length(_texto);
    } else {
        pagina++;

        if (pagina >= array_length(falas)) {
            room_goto(rMapa);
        } else {
            texto_visivel = 0;
        }
    }
}
