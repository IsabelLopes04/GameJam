var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

if (_hor > 0) {
    sprite_index = spr_Direita;
}
else if (_hor < 0) {
    sprite_index = spr_Esquerda;
}

if (!place_meeting(x + _hor * velocidade, y, obj_Predio)) {
    x += _hor * velocidade;
}

if (!place_meeting(x, y + _ver * velocidade, obj_Predio)) {
    y += _ver * velocidade;
}

if (_hor != 0 || _ver != 0) {
    image_speed = 0.2;
}
else {
    image_speed = 0;
    image_index = 0;
}