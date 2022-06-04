
CREATE TABLE public.dim_data (
                sk_data INTEGER NOT NULL,
                nk_data DATE NOT NULL,
                desc_data_completa VARCHAR(60) NOT NULL,
                nr_ano INTEGER NOT NULL,
                nm_trimestre VARCHAR(20) NOT NULL,
                nr_ano_trimestre VARCHAR(20) NOT NULL,
                nr_mes INTEGER NOT NULL,
                nm_mes VARCHAR(20) NOT NULL,
                ano_mes VARCHAR(20) NOT NULL,
                nr_semana INTEGER NOT NULL,
                ano_semana VARCHAR(20) NOT NULL,
                nr_dia INTEGER NOT NULL,
                nr_dia_ano INTEGER NOT NULL,
                nm_dia_semana VARCHAR(20) NOT NULL,
                flag_final_semana CHAR(3) NOT NULL,
                flag_feriado CHAR(3) NOT NULL,
                nm_feriado VARCHAR(60) NOT NULL,
                etl_dt_inicio TIMESTAMP NOT NULL,
                etl_dt_fim TIMESTAMP NOT NULL,
                versao INTEGER NOT NULL,
                CONSTRAINT dim_data_pk PRIMARY KEY (sk_data)
);


CREATE TABLE public.dim_produto (
                sk_produto INTEGER NOT NULL,
                nk_produto INTEGER NOT NULL,
                nm_produto VARCHAR NOT NULL,
                preco_produto REAL NOT NULL,
                etl_dt_inicio DATE NOT NULL,
                etl_dt_fim DATE NOT NULL,
                versao INTEGER NOT NULL,
                CONSTRAINT sk_produto PRIMARY KEY (sk_produto)
);


CREATE TABLE public.dim_loja (
                sk_loja INTEGER NOT NULL,
                nk_loja INTEGER NOT NULL,
                cnpj_loja CHAR(14) NOT NULL,
                cidade_loja VARCHAR NOT NULL,
                etl_dt_inicio DATE NOT NULL,
                etl_dt_fim DATE NOT NULL,
                versao INTEGER NOT NULL,
                CONSTRAINT sk_loja PRIMARY KEY (sk_loja)
);


CREATE TABLE public.dim_cliente (
                sk_cliente INTEGER NOT NULL,
                email_cliente VARCHAR NOT NULL,
                cpf_cliente CHAR(11) NOT NULL,
                nk_cliente INTEGER NOT NULL,
                nm_cliente VARCHAR NOT NULL,
                genero_cliente CHAR(1) NOT NULL,
                datanasc_cliente DATE NOT NULL,
                assinatura_cliente BOOLEAN NOT NULL,
                cidade_cliente VARCHAR NOT NULL,
                etl_dt_inicio DATE NOT NULL,
                etl_dt_fim DATE NOT NULL,
                versao INTEGER NOT NULL,
                CONSTRAINT sk_cliente PRIMARY KEY (sk_cliente)
);


CREATE TABLE public.ft_venda (
                sk_produto INTEGER NOT NULL,
                sk_cliente INTEGER NOT NULL,
                sk_loja INTEGER NOT NULL,
                sk_data INTEGER NOT NULL,
                dt_venda DATE NOT NULL
);


ALTER TABLE public.ft_venda ADD CONSTRAINT dim_data_ft_venda_fk
FOREIGN KEY (sk_data)
REFERENCES public.dim_data (sk_data)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_venda ADD CONSTRAINT dim_produto_ft_venda_fk
FOREIGN KEY (sk_produto)
REFERENCES public.dim_produto (sk_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_venda ADD CONSTRAINT dim_loja_ft_venda_fk
FOREIGN KEY (sk_loja)
REFERENCES public.dim_loja (sk_loja)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_venda ADD CONSTRAINT dim_cliente_ft_venda_fk
FOREIGN KEY (sk_cliente)
REFERENCES public.dim_cliente (sk_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;