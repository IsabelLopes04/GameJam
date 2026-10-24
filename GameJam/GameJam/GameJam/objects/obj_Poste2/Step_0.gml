if (luz_acesa) {
    luz_intensidade = min(1, luz_intensidade + luz_velocidade);
} else {
    luz_intensidade = max(0, luz_intensidade - luz_velocidade);
}