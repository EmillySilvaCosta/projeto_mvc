package com.gft.entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tb_participante")
public class Participante implements Serializable {

	private int cont;

	private static final long serialVersionUID = 1L;

	private Evento evento;
	
	private Atividade atividade;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id_participante;

	private String nome;

	private String nivel;

	private String email;

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "tarefa_participante", joinColumns = @JoinColumn(name = "participante_id", referencedColumnName = "id_participante"), inverseJoinColumns = @JoinColumn(name = "atividade_id", referencedColumnName = "id_atividade"))
	private List<Atividade> listaAtividades;

	private boolean[] presencas;

	private boolean[] atrasos;

	private String quatro_letras;

	@ManyToOne
	private Grupo grupo;

	private boolean status;

	private boolean atrasado;

	private boolean presente;

	private boolean atividades;

	private double pontuacaoTotal;

	private double pontuacaoAtividade;

	private double pontuacaoPresenca;

	public boolean isAtrasado() {
		return atrasado;
	}

	public void setAtrasado(boolean atrasado) {
		this.atrasado = atrasado;
	}

	public boolean isPresente() {
		return presente;
	}

	public void setPresente(boolean presente) {
		this.presente = presente;
	}

	public boolean isAtividades() {
		return atividades;
	}

	public void setAtividades(boolean atividades) {
		this.atividades = atividades;
	}

	public double getPontuacaoTotal() {
		return pontuacaoTotal;
	}

	public void setPontuacaoTotal(double pontuacaoTotal) {
		this.pontuacaoTotal = pontuacaoTotal;
	}

	public double getPontuacaoAtividade() {
		return pontuacaoAtividade;
	}

	public void setPontuacaoAtividade(double pontuacaoAtividade) {
		this.pontuacaoAtividade = pontuacaoAtividade;
	}

	public double getPontuacaoPresenca() {
		return pontuacaoPresenca;
	}

	public void setPontuacaoPresenca(double pontuacaoPresenca) {
		this.pontuacaoPresenca = pontuacaoPresenca;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public Grupo getGrupo() {
		return grupo;
	}

	public void setGrupo(Grupo grupo) {
		this.grupo = grupo;
	}

	public Long getId_participante() {
		return id_participante;
	}

	public void setId_participante(Long id_participante) {
		this.id_participante = id_participante;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getNivel() {
		return nivel;
	}

	public void setNivel(String nivel) {
		this.nivel = nivel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getQuatro_letras() {
		return quatro_letras;
	}

	public void setQuatro_letras(String quatro_letras) {
		this.quatro_letras = quatro_letras;
	}

	public boolean[] getAtrasos() {
		return atrasos;
	}

	public void setAtrasos(boolean[] atrasos) {
		this.atrasos = atrasos;
	}

	public boolean[] getPresencas() {
		return presencas;
	}

	public void setPresencas(boolean[] presencas) {
		this.presencas = presencas;
	}

	public Evento getEvento() {
		return evento;
	}

	public void setEvento(Evento evento) {
		this.evento = evento;
	}

	public Atividade getAtividade() {
		return atividade;
	}

	public void setAtividade(Atividade atividade) {
		this.atividade = atividade;
	}

	public List<Atividade> getListaAtividades() {
		return listaAtividades;
	}

	public void setListaAtividades(List<Atividade> listaAtividades) {
		this.listaAtividades = listaAtividades;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int contaAtividadesEntregues() {
		for (Atividade item : this.getListaAtividades()) {
			boolean atividadesConcluidas = item.getStatus_entrega();
			if (atividadesConcluidas == true) {
				cont++;
			}
		}
		return cont;
	}

	public void entregouTodasAtividades() {
		if (contaAtividadesEntregues() == evento.getAtividades().size()) {
			this.setAtividades(true);
		}
	}

	public void calculaPontosAtividade() {
		setPontuacaoAtividade(contaAtividadesEntregues() * atividade.getPontosAtribuidosNaEntrega());
	}

	public void determinarTamanhoArrayPresenca() {
		Evento evento = getGrupo().getEvento();
		int i = (int) evento.totalDiasDoEvento();
		this.presencas = new boolean[i];
	}

	public void teveTodasAsPresencasEPontuaPresencas() {
		Evento evento = getGrupo().getEvento();
		int i = 0;

		for (boolean presenca : this.getPresencas()) {
			if (presenca == true) {
				this.pontuacaoPresenca += evento.getPontosAtribuidosCadaPresenca();
				i++;
			}
		}

		if (i == this.getPresencas().length) {
			this.presente = true;
		}
	}

	public void determinarTamanhoArrayAtraso() {
		Evento evento = getGrupo().getEvento();
		int i = (int) evento.totalDiasDoEvento();
		this.atrasos = new boolean[i];
	}

	public void calculoAtraso() {
		Evento evento = getGrupo().getEvento();
		int i = 0;

		for (boolean atraso : this.getAtrasos()) {
			if (atraso == true) {
				this.pontuacaoPresenca -= evento.getPontosDescontadosCadaAtraso();
				i++;
			}

			if (i > 0) {
				this.atrasado = true;
			}
		}
	}
}
