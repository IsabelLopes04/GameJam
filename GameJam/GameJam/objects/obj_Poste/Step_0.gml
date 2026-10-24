if (variable_global_exists("cidade_iluminada")) {
    ligado = global.cidade_iluminada;
}

if (ligado) {
    intensidade_alvo = 1;
} else {
    intensidade_alvo = 0;
}

if (intensidade_luz < intensidade_alvo) {
    intensidade_luz += velocidade_luz;
    if (intensidade_luz > intensidade_alvo) {
        intensidade_luz = intensidade_alvo;
    }
}
else if (intensidade_luz > intensidade_alvo) {
    intensidade_luz -= velocidade_luz;
    if (intensidade_luz < intensidade_alvo) {
        intensidade_luz = intensidade_alvo;
    }
}