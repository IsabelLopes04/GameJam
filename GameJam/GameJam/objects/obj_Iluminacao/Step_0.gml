
if (instance_exists(obj_CentralInteligente)) {

    var _central = instance_find(obj_CentralInteligente, 0);

    if (variable_instance_exists(_central, "missao_concluida")) {

        if (_central.missao_concluida) {
            cidade_acesa = true;
        }
    }

    if (variable_instance_exists(_central, "ativar_iluminacao")) {

        if (_central.ativar_iluminacao) {
            cidade_acesa = true;
        }
    }
}

if (cidade_acesa) {

    escuridao = max(
        escuridao_final,
        escuridao - velocidade_iluminacao
    );

} else {

    escuridao = min(
        escuridao_inicial,
        escuridao + velocidade_iluminacao
    );
}
