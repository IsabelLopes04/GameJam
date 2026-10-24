
if (keyboard_check_pressed(vk_space) ||
    keyboard_check_pressed(vk_enter) ||
    mouse_check_button_pressed(mb_left)) {

    pagina++;

    if (pagina >= array_length(falas)) {
        room_goto(rMapa);
    }
}
