# SOC Analyst Daily Log - Diario de Simulacao de Rotina Profissional

Diario continuo de uma simulacao de posto de trabalho como SOC Analyst / Blue Team, usando infraestrutura real (Microsoft Sentinel, Wazuh SIEM, e um honeypot publico) como se fosse o ambiente de trabalho diario.

## Contexto

Projeto de continuidade do meu percurso de portfolio em ciberseguranca, apos a conclusao do estagio curricular na Escola Superior Agraria de Coimbra (ESAC), no ambito do CET Tecnico Especialista de Ciberseguranca do IEFP Coimbra.

Em vez de projetos isolados e pontuais, este repositorio documenta uma rotina continua: triagem de incidentes, investigacao, resposta, e documentacao tipo runbook, tal como aconteceria num posto de trabalho real de SOC Analyst. O objetivo e demonstrar consistencia e progressao ao longo do tempo, nao apenas resultados finais isolados.

## Infraestrutura usada

- **Microsoft Sentinel** (Azure) - deteccao de brute-force RDP contra uma VM Windows exposta, com regra de analytics customizada em KQL. Ver [azure-mini-soc](https://github.com/heldersindique-prog/azure-mini-soc)
- **Wazuh SIEM** (self-hosted, Docker) - monitorizacao continua do servidor pessoal, com FIM, deteccao de vulnerabilidades e mapeamento MITRE ATT&CK. Ver [wazuh-siem](https://github.com/heldersindique-prog/wazuh-siem)
- **Honeypot T-Pot** (Oracle Cloud, Always Free) - em construcao, para captura de trafego de ataque real e continuo, alimentando o Wazuh

## Rotina diaria

Cada dia de trabalho segue o mesmo ciclo usado num SOC real:

1. **Triagem matinal** - revisao dos incidentes/alertas gerados desde o ultimo turno
2. **Investigacao** - analise aprofundada de 1 a 2 casos por dia (origem, tatica MITRE ATT&CK, decisao)
3. **Resposta** - classificacao, fecho ou escalonamento de incidentes, com comentario de auditoria
4. **Documentacao** - registo do dia neste repositorio, incluindo comandos usados e licoes aprendidas

## Estrutura do repositorio

```
.
├── README.md
└── logs/
    └── YYYY-MM-DD.md      # registo diario, um ficheiro por dia de "trabalho"
```

## Entradas do diario

| Data | Resumo |
|---|---|
| [2026-08-28](logs/2026-08-28.md) | Dia 1: triagem e fecho de 3 incidentes de brute-force RDP no Sentinel; inicio da construcao do honeypot T-Pot na Oracle Cloud (rede configurada, script de retry a correr devido a falta de capacidade Always Free) |

## Tecnologias

- Microsoft Sentinel (KQL, Azure CLI)
- Wazuh (Docker, API REST)
- GitHub CLI (gh)
- T-Pot Honeypot (a integrar)

## Autor

Helder Sindique
[LinkedIn](https://www.linkedin.com/in/helder-luis-sindique-69223331/) | [Portfolio](https://heldersindique.pt)
