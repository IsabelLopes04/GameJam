
var _w = display_get_gui_width();
var _h = display_get_gui_height();

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

var _x1 = _w * botao_x1;
var _x2 = _w * botao_x2;

var _y1 = _h * botao_y1;
var _y2 = _h * botao_y2;

mouse_sobre_botao = (
    _mx >= _x1 &&
    _mx <= _x2 &&
    _my >= _y1 &&
    _my <= _y2
);

if (mouse_sobre_botao && mouse_check_button_pressed(mb_left)) {
    room_goto(rMapa);
}

if (keyboard_check_pressed(vk_enter)) {
    room_goto(rMapa);
}
