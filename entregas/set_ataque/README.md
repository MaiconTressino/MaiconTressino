# Download — Set de Ataque para Godot

Esta branch contém a entrega do set **Investida Implacável**. O README do perfil e a branch main foram preservados.

## Pacote de integração (37,5 MiB)
Abra [Set_Ataque_Godot_Integracao.zip](Set_Ataque_Godot_Integracao.zip) e clique no botão de download do arquivo no GitHub (Download raw file). Contém 22 cartas selecionadas, 7 molduras isoladas, dados de efeitos e exemplo Godot. Extraia e abra o project.godot como projeto separado; não substitua o projeto do jogo.

## Pacote completo (354,5 MiB)
As partes em `completo_partes/` formam um único ZIP e **não são ZIPs independentes**. Incluem o material de integração, todas as pranchas de criação e referências disponíveis.

Forma mais simples: no menu verde **Code**, escolha **Download ZIP** desta branch. Extraia o download e entre em `entregas/set_ataque/`.

No Windows, execute o script `reunir_completo.ps1` pelo PowerShell a partir dessa pasta:

```powershell
.\reunir_completo.ps1
```

Ou, com Python instalado:

```sh
python reunir_completo.py
```

O script verifica o SHA-256 de cada parte e do ZIP final. Depois extraia `Set_Ataque_Investida_Implacavel_Godot.zip`.

## Validação e limites
Importação de 22 cartas e 7 molduras e inicialização do catálogo verificadas no Godot 4.6.3. A cena demonstra assets, não implementa combate.

Algumas cartas são recortes de pranchas aprovadas e preservam rótulos de variação/fundo de apresentação e textos achatados. O PNG isolado das molduras Celestiais do Guerreiro e do Mago não estava disponível localmente; suas cartas completas estão incluídas. As limitações e instruções detalhadas estão no README de cada pacote.
