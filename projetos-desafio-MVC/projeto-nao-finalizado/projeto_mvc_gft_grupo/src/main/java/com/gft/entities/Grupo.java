package com.gft.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tb_grupo")
public class Grupo implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id_grupo;

	private String nome;

	@OneToMany
	private List<Participante> participantes = new ArrayList<>();

	@ManyToOne
	private Evento evento;

	private int pontuacao;

	private int numIntegrantes;

	private boolean status;

	private boolean atrasos;

	private boolean presencas;

	private int pontuacaoPresenca;

	private int pontuacaoAtividade;

	private boolean atividades;

	private double pontuacaoTotal;

	private double bonusPresenca = 5;

	private double bonusAtividade = 3;

	public boolean isAtrasos() {
		return atrasos;
	}

	public void setAtrasos(boolean atrasos) {
		this.atrasos = atrasos;
	}

	public boolean isPresencas() {
		return presencas;
	}

	public void setPresencas(boolean presencas) {
		this.presencas = presencas;
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

	public double getBonusPresenca() {
		return bonusPresenca;
	}

	public void setBonusPresenca(double bonusPresenca) {
		this.bonusPresenca = bonusPresenca;
	}

	public double getBonusAtividade() {
		return bonusAtividade;
	}

	public void setBonusAtividade(double bonusAtividade) {
		this.bonusAtividade = bonusAtividade;
	}

	public int getNumIntegrantes() {
		return numIntegrantes;
	}

	public void setNumIntegrantes(int numIntegrantes) {
		this.numIntegrantes = numIntegrantes;
	}

	public int getPontuacao() {
		return pontuacao;
	}

	public void setPontuacao(int pontuacao) {
		this.pontuacao = pontuacao;
	}

	public Evento getEvento() {
		return evento;
	}

	public void setEvento(Evento evento) {
		this.evento = evento;
	}

	public Long getId_grupo() {
		return id_grupo;
	}

	public void setId_grupo(Long id_grupo) {
		this.id_grupo = id_grupo;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public List<Participante> getParticipantes() {
		return participantes;
	}

	public void setParticipantes(List<Participante> participantes) {
		this.participantes = participantes;
	}

	public void setParticipantesNaLista(Participante participante) {
		participantes.add(participante);
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public boolean getStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public int calculaQuantidadeDeParticipantesNoGrupo() {
		this.numIntegrantes = participantes.size();
		return participantes.size();
	}
	public int getPontuacaoPresenca() {
		return pontuacaoPresenca;
	}
	
	public void setPontuacaoPresenca(int pontuacaoPresenca) {
		this.pontuacaoPresenca = pontuacaoPresenca;
	}
	
	public int getPontuacaoAtividade() {
		return pontuacaoAtividade;
	}
	
	public void setPontuacaoAtividade(int pontuacaoAtividade) {
		this.pontuacaoAtividade = pontuacaoAtividade;
	}

	public int calculaPontuacaoPresenca() {
		int total = 0;

		for (Participante participante : participantes) {
			total += participante.getPontuacaoPresenca();
		}
		this.pontuacaoPresenca = total;

		return total;
	}

	public int calculaPontuacaoAtividade() {
		int total = 0;

		for (Participante participante : participantes) {
			total += participante.getPontuacaoAtividade();
		}
		this.pontuacaoAtividade = total;

		return total;
	}

	public int pontuacaoTotalDoGrupo() {
		int i = 0;
		int a = 0;
		int total = calculaPontuacaoAtividade() + calculaPontuacaoPresenca();

		for (Participante participante : participantes) {
			if (participante.isPresente() == true) {
				i++;
			}
		}

		if (i == participantes.size()) {
			total += this.bonusPresenca;
			this.presencas = true;
		}

		for (Participante participante : participantes) {
			if (participante.isAtividades() == true) {
				a++;
			}
		}

		if (a == participantes.size()) {
			total += this.bonusAtividade;
			this.atividades = true;
		}
		
		this.pontuacaoTotal = total;

		return total;
	}

	@SuppressWarnings("unused")
	private boolean verificaSeHouveAtrasoNoGrupo() {
		boolean atraso = false;
		int contador = 0;
		
		for (Participante participante : participantes) {
			if (participante.isAtrasado() == true) {
				contador++;
			}
		}

		if (contador > 0) {
			this.atrasos = true;
		}
		
		return atraso;
	}

}
