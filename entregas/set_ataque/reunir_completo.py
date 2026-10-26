from pathlib import Path
import hashlib,json,os
r=Path(__file__).resolve().parent
m=json.loads((r/'manifesto_download.json').read_text(encoding='utf-8'))['completo']
out=r/m['arquivo']
if out.exists():
    if hashlib.sha256(out.read_bytes()).hexdigest()!=m['sha256']:raise SystemExit('Arquivo existente divergente; preservado.')
    print('Pacote completo já está correto:',out)
else:
    tmp=out.with_suffix('.zip.tmp')
    with tmp.open('wb') as dst:
        for item in m['partes']:
            p=r/'completo_partes'/item['arquivo'];data=p.read_bytes()
            if hashlib.sha256(data).hexdigest()!=item['sha256']:raise SystemExit('Parte inválida: '+p.name)
            dst.write(data)
    if hashlib.sha256(tmp.read_bytes()).hexdigest()!=m['sha256']:raise SystemExit('Verificação final falhou.')
    os.replace(tmp,out)
    print('ZIP completo criado e verificado:',out)
