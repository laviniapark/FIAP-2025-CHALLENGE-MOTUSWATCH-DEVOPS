CREATE INDEX idx_usuarios_cpf ON usuarios(cpf);
CREATE INDEX idx_usuarios_email ON usuarios(email);
CREATE INDEX idx_usuarios_perfil ON usuarios(perfil);
CREATE INDEX idx_usuarios_ativo ON usuarios(ativo);

CREATE INDEX idx_motos_usuario ON motos(usuario_id);
CREATE INDEX idx_motos_data_entrada ON motos(data_entrada);
CREATE INDEX idx_motos_ativo ON motos(ativo);
