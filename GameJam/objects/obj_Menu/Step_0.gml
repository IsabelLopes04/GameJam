
var _w = display_get_gui_width();
var _h = display_get_gui_height();

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

mouse_sobre_botao = (
    _mx >= _w * botao_x1 &&
    _mx <= _w * botao_x2 &&
    _my >= _h * botao_y1 &&
    _my <= _h * botao_y2
);

var _mouse_sobre_sair = (
    _mx >= _w * sair_x1 &&
    _mx <= _w * sair_x2 &&
    _my >= _h * sair_y1 &&
    _my <= _h * sair_y2
);

if (mouse_check_button_pressed(mb_left)) {

    if (mouse_sobre_botao) {
        room_goto(rm_Introducao);
        exit;
    }

    if (_mouse_sobre_sair) {
        game_end();
        exit;
    }
}

if (keyboard_check_pressed(vk_enter)) {
    room_goto(rMapa);
}
