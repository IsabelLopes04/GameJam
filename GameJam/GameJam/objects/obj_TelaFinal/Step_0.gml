
var _w = display_get_gui_width();
var _h = display_get_gui_height();

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

hover_finalizar = point_in_rectangle(
    _mx,
    _my,
    _w * 0.39,
    _h * 0.87,
    _w * 0.67,
    _h * 0.99
);

var _texto = mensagens[pagina_final];

texto_visivel = min(
    texto_visivel + velocidade_texto,
    string_length(_texto)
);

if (mouse_check_button_pressed(mb_left) && hover_finalizar) {
    room_goto(rm_Menu);
    exit;
}

if (keyboard_check_pressed(vk_enter)) {
    room_goto(rm_Menu);
    exit;
}

if (keyboard_check_pressed(vk_space)) {

    if (texto_visivel < string_length(_texto)) {
        texto_visivel = string_length(_texto);
    }
    else {
        pagina_final++;

        if (pagina_final >= array_length(mensagens)) {
            pagina_final = 0;
        }

        texto_visivel = 0;
    }
}
