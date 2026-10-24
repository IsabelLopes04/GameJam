
var _w = display_get_gui_width();
var _h = display_get_gui_height();

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

mouse_sobre_botao = point_in_rectangle(
    _mx, _my,
    _w * botao_x1,
    _h * botao_y1,
    _w * botao_x2,
    _h * botao_y2
);

mouse_sobre_sair = point_in_rectangle(
    _mx, _my,
    _w * sair_x1,
    _h * sair_y1,
    _w * sair_x2,
    _h * sair_y2
);

if (mouse_check_button_pressed(mb_left)) {

    if (mouse_sobre_botao) {
        room_goto(rm_Introducao);
        exit;
    }

    if (mouse_sobre_sair) {
        game_end();
        exit;
    }
}

if (keyboard_check_pressed(vk_enter)) {
    room_goto(rm_Introducao);
}
