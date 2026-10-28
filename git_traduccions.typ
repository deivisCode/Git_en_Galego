#set text(size:12pt, font:"Libertinus Serif", lang:"gl", hyphenate: true)
#show raw: set text(size:1.2em, fill: luma(20%), font: "New Computer Modern Mono" )
#show raw: iso => box(fill: luma(80%), radius: 2pt, outset: 2pt, iso)
#show link: it => { set text(blue); underline(it) }
#set page(paper: "a4", numbering: "1")
#set par(justify: true, linebreaks: "optimized", first-line-indent: 1em)

#let a = sym.arrow.r

#text(size: 30pt)[= `GIT` en\ Galego]

Git é un sistema de control de versións (do inglés, VCS, Version Control
System) que permite organizar e manexar as distintas versións e cambios nun
proxecto de código ao longo do seu desenvolvemento. É unha ferramenta
excepcionalmente útil non só para programadores senón tamén para calquera
persoa que estea a escribir código, por exemplo nunhas memorias de laboratorio
escritas a LaTeX ou Typst, uns apuntes, libros ou poesía, leis
gobernamentais#footnote[https://github.com/bundestag/gesetze] e inclusive este
mesmo documento que estás a ler. Git é un sistema moi completo en opcións e
fluxos de traballo posibles, e un pode pasarse moito tempo aprendendo a usar a
ferramenta. A páxina oficial do programa é https://git-scm.com/ e unha boa
referencia introdutoria é o libro oficial https://git-scm.com/book/en/v2.

Ao igual que tantos campos do saber, a documentación, exemplos de uso, os
propios comandos e subcomandos, opcións, ou calquera concepto relacionado con
Git está feito en lingua inglesa. Si ben é certo que o programa se usa con
palabras en inglés e non se pode usar doutro modo, moitos conceptos poden ser
traducidos sen perda de información e en moitos casos isto pode axudar a
entender o que estamos a facer ao usar expresións coñecidas e non termos
técnicos noutra lingua.

Por un lado temos o propio programa da liña de comandos, `git`, e todos seus
subcomandos#footnote[https://git-scm.com/docs/git#_git_commands]: `commit`,
`push`, `config`, `rebase`, etc. Tamén existen opcións que soen acompañar a
outros (sub)comandos as cales se introducen cun prefixo `--`, como `--amend` ou
`--interactive`. Comandos, subcomandos e opcións deben ser usados en inglés, xa
que así funciona o programa (a menos que quixésemos crear alias a man para
todos e cada un deles con traducións ao galego). O que *si* se pode traducir é
seu funcionamento, as accións que representan ou os fluxos de traballo posibles.
Por exemplo, un comando típico é `git commit`, que se introduce literalmente na
liña de comandos. Podemos dicir que usamos `git commit` para _contribuír_ ao
repositorio, ou que estamos a _crear unha contribución_.

// Ademais da distinción entre (sub)comandos (non traducibles) e as accións que
// representan (traducibles), podemos distinguir os (sub)comandos e súas opción
// nos de uso común e nos máis técnicos. Por exemplo, `bare repo`, ou `worktree`
// son conceptos máis técnicos que, independentemente da lingua, precisan ser
// consultados na documentación do programa para entender seu uso. Nestes casos os
// propios termos en inglés non son nada suxerintes.

Ista é a lista de termos, cales son os comandos relacionados (de habelos), que
accións ou operacións representan (de habelas), e varias traducións posibles.

IMPORTANTE: isto é a mostra das miñas preferencias *persoais* lingüísticas ao
falar de Git. Non hai moita máis base detrás disto ca proba e erro falando no
día cos meus compañeiros.

+ `repository` #a `repositorio`\
  É un termo bastante xenérico. Por un lado, Git local garda a información do
  proxecto nun directorio chamado _.git_. Este inclúe información sobre as
  (anticipándonos) ramas, cambios, remotos, etc. Este directorio *é* o
  *repositorio*, a base de datos de Git. Por outro lado, `repository` pode
  usarse en xeral para falar dun proxecto que está manexado por Git e non so ao
  directorio _.git_. Por exemplo, podemos dicir que _eu teño un repositorio
  gardadado na rede_.

+ `bare repository` #a `repositorio a pelo`\
  No caso anterior, o proxecto contén, aparte do directorio _.git_, un espazo
  de traballo cunha copia dos ficheiros manexados por Git. Se non temos dito
  espazo de traballo, o que temos é un `bare repository`, ou *repositorio a pelo*.

+ `object` #a `obxecto`\
  En git a información gárdase relacionando unha chave a
  un `object` (a través dunha función criptográfica do tipo `SHA-256`). As
  _cousas_ (si, en xeral, cousas) que se gardan en Git son `objects`, que teñen
  asociada unha chave única. Vexo razoable dicir simplemente *obxecto* ou
  incluso sendo explícito *obxecto de git*.

+ `snapshot` #a `instantánea`\
  É unha versión específica do proxecto, xa sexa pasada ou presente, ou
  versións alternativas (ramas distintas). Git garda a información do proxecto
  como unha serie de versións *instantáneas* del, polo que ao movernos polo
  historial simplemente _move_ un punteiro (adiantándome ao próximo termo) a
  unha copia distinta do repositorio, cambiando os ficheiros do _espazo de
  traballo_ (termo máis adiante). A tradución literal de `snapshot` é
  *instantánea*, e reflicte ben a idea que ten git á hora de gardar a
  información#footnote[Ao contrario doutros sistemas de control de versións,
  que só gardan as _diferenzas_].

+ `pointer` #a `punteiro`\
  É unha referencia a unha contribución concreta (outra vez, adiantándome aos
  termos). Git garda unha serie de _instantáneas_, e en cada unha delas hai
  unha referencia á instantánea anterior (ou anteriores, no caso de ter varias
  ramas que se xuntan). Vexo ben chamalo *punteiro*, porque se soe mostrar como
  tal en gráficas e imaxes, e é directo de entender. Ademais, o termo
  _punteiro_ xa é usado en informática ao referirnos a variables que gardan a
  dirección doutras variables.

+ `branch` #a `rama`\
  O traballo en git soe depender da creación de bifurcacións no traballo. En
  xeral, a representación gráfica deste traballo represéntase con *ramas*. Máis
  concretamente, unha rama é un _punteiro_ móbil.

+ `main` #a `principal`\
  A rama por defecto que se usa en Git. As ramas poden ter calquera outro nome,
  e antigamente o nome por defecto era _master_ e non _main_. Os nomes soen
  usarse para separar traballos, polo que p.e. se alguén está traballando nuns
  cambios que teñan que ver ca versión impresa dun documento, o normal é que
  lle poña un nome relacionado como `dev-print` ou algo semellante. Se un
  proxecto está feito en galego, é perfectamente razoable _galeguizar_ os nomes
  das ramas. A rama `main` pode chamarse simplemente *principal* (véxase, como
  exemplo, o proxecto https://github.com/fisicaUSC/revista).

+ `blob` #a `blob`\
  Unha certa versión dun ficheiro gardado no repositorio. Non atopei unha
  tradución intuitiva, e polo pouco suxerinte e polo simpático da palabra, sigo
  chamándolle *blob*. De todos modos, non se usa a miúdo.

+ `pack objects` #a `paquetes`\
  Git pode optimizar a información gardada de distintos blobs ou outros
  obxectos combinándoos (*empaquetándoos*).

+ `hash` #a `hash`\
  Un valor en hexadecimal computado a partir dos contidos dun (ou varios)
  ficheiros ou doutros obxectos de git que se usa como chave destes na base de
  datos de Git. Permite identificar univocamente ditos obxectos. Non atopei
  ningunha boa tradución, neste caso sigo chamándolle *hash*.

+ `tree` #a `tree`\
  Unha lista de nomes de ficheiros cos seus correspondentes _hashes_ e os
  _blobs_ aos que corresponden. É importante non confundir isto cun _working
  tree_. `tree` a secas supoño que se pode traducir como *árbore*, pero `tree` é
  un termo _técnico_ e non tan usado, posiblemente sexa mellor manter a palabra
  literal.

+ `working tree` #a `espazo de traballo`
  A versión _activa_ do proxecto. O repositorio pode ter moitas contribucións
  (máis adiante, _commits_), nas cales os ficheiros cambian. A contribución
  actual, que se presenta como ficheiros reais no directorio de traballo, é o
  `working tree`. Creo que *espazo de traballo* vai da man co significado.

+ `checkout` #a `mover un punteiro`\
  Git ten un comando chamado `checkout` que se pode usar para facer unha ducia
  de operacións completamente distintas. Polo xeral, facer un `checkout` está
  relacionado con *mover un punteiro* de sitio, sexa nun cambio ou creación de
  ramas, nun rebase, cambios de nomes, ou noutras operacións.

+ `HEAD` #a `contribución actual/HEAD`\
  De todos os punteiros que podemos ter nun repositorio, existe un que
  representa a *contribución actual* representada no espazo de traballo.
  Chámase `HEAD`, e non é posible renomeala de ningún modo. É factible seguir
  referíndose a dito punteiro como `HEAD`.

+ `delta / diff(erence)` #a `diferenza`\
  É a *diferenza* entre dúas versións do proxecto, ou entre ficheiros
  específicos. En xeral móstranse con comandos coma `git diff [--staged]`.

+ `staging area / index` #a `índice/zona de preparación`\
  É posible gardar os cambios que facemos no noso _espazo de traballo_ nunha
  *zona de proba* a cal se chama `index` ou `staging  area`. Sirve para ir
  seleccionando os cambios que queremos ir engadindo, e unha vez rematamos,
  gardamos _todo_ o `index` no repositorio. Vexo ben dicir simplemente
  *índice*, ou tal vez *zona de preparación*, inda que isto último gústame
  menos.

+ `commit` #a `contribución`\
  Os cambios no _índice_ deben gardarse no _repositorio_, usando o comando `git commit`.
  Tamén se soe dicir `commit to a repository` ou semellantes. Unha
  tradución razoable é *contrubución*. Podemos dicir que usamos dito comando
  para _contribuír nosos cambios ao repositorio_, ou que _tal persoa fixo unha
  contribución ao proxecto_, ou _[...] cando poidas revisa o par de
  contribucións que subín a Github_.

+ `remote` #a `remoto/a`\
  Unha URL do repositorio na rede. Por exemplo,
  #link("https://github.com/deivisCode/Git_en_Galego.git"). En inglés debería
  dicirse `remote url` pero simplifícase a `remote`. Non lle vexo nada raro de
  dicir *remoto* en galego, como en _ligazón/URL remoto_.

+ `origin` #a `orixe`\
  O nome por defecto dun remoto (dunha URL) de calquera proxecto. Eu case
  sempre lle chamo *orixe* e xa está. É un nome _local_, polo que o feito de
  que _eu_ lle chame así na miña configuración de Git non afecta a outras
  persoas, a diferenza dos nomes das ramas, por exemplo, que si son visibles
  por outras persoas.

+ `clone` #a `clonar`\
  Podemos crear unha copia _local_ dun repositorio da rede (ou doutro sistema)
  usando o comando `git clone <URL>`. Isto copia o proxecto literal (*clónao*)
  ao noso ordenador. Algúns parámetros típicos son: `--depth` (*profundidade*),
  que nos permite establecer o número de contribucións pai queremos descargar
  (por defecto, todas); ou `--recurse-submodules` (*recorrer os submódulos*),
  para descargar sub-repositorios incluídos no que estamos a clonar.

+ `submodule` #a `submódulo`\
  É posible ter un repositorio distinto dentro do noso espazo de traballo, por
  exemplo para engadir un proxecto de código externo que precisamos no noso
  proxecto persoal. Pode dicirse simplemente *submódulo*.

+ `fork` #a `copia remota/na rede`\
  De existir un repositorio calquera na rede, nós podemos facer unha copia
  deste _tamén_ na rede. Dita copia é o `fork`. Direi simplemente que é a
  *copia na rede* doutro proxecto ou repositorio.

+ `pull request` #a `petición de cambios`\
  Podemos ter certos cambios na nosa copia en rede dun proxecto, e pode
  interesarnos _pedir_ que estes sexan aplicados ao proxecto principal. Esto é
  un `pull request`, e pode facerse en distintas plataformas (Github, Gitlab,
  etc.) de distintos modos. Direi simplemente *pedir que se engadan os
  cambios*, por exemplo: _Vou abrir unha petición en Github para que engadan os
  meus cambios de deivisCode/revista en fisicaUSC/revista_, ou _[...]
  por favor, faime unha petición cos cambios e acéptocha_.

+ `push` #a `subir á rede`\
  Compartir os cambios locais na rede, ou subir os cambios ao remoto. Digo
  que vou *subir os cambios*, e uso o comando `push` para facelo.

+ `pull / fetch`: Descargar os cambios da rede, ou baixar os cambios do remoto.
  Digo que *vou baixar/descargar os cambios*, e pra iso uso `git pull` ou
  `git fetch`.

+ `upstream/downstream` #a `río arriba/abaixo`\
  As veces existe unha dependencia entre varios proxectos, sendo un deles un
  proxecto _derivado_ do outro. Dicimos que o primeiro de todos é `upstream` e
  o outro `downstream`. Pode que ao traballar en `downstream` teñamos que usar
  aplicar os novos cambios de `upstream` dado que herdamos deles. Gustaríame
  dicir *rio arriba* e *rio abaixo*, ou tal vez simplemente `arriba` e
  `abaixo`. Como exemplo, ao traballar con Neovim (`downstream`), hai variedade
  de cambios que se fan _arriba_/_rio arriba_ en Vim (`upstream`). Por desgraza
  *non me convence* de todo e non tiven moita oportunidade de usar a tradución.
  Outra opción podería referirnos a `upstream` como *repositorio
  orixinal/principal* e aos outros como *derivados/secundarios*. Non coñezo
  ningún termo que conteña o matiz _describir algo que ocorre como consecuencia
  de eventos_, polo que tal vez sexa mellor non traducilo.

+ `merge` #a `xuntar`\
  Ao ter varias ramas un traballo típico é o de *xuntalas* para crear
  unha sola. Direi que xunto varias ramas, e para facelo uso o comando `git merge`

+ `rebase` #a `rebasar`\
  Unha estratexia para aplicar os cambios dunha rama noutra. `rebase`
  úsase porque literalmente cambiamos a contribución _base_ da cal se
  bifurcaron as ramas ao comezo. Pode usarse *rebasar* inda que non está
  aceptado na RAG (non é mais que re + base). Ou tal vez usar *cambiar a base*.
  Direi que _rebaso a rama A na rama B_, e uso o comando `git rebase B`.

+ `squash` #a `esmagar`\
  Outra estratexia para aplicar os cambios dunha rama noutra. Neste caso, se a
  rama `A` ten 7 contribucións, podemos xuntar ditas contribucións nunha soa e
  aplicar _esa_ á rama B. Persoalmente gustoume a idea de *esmagar*. Entón,
  digo que podo _esmagar_ certas contribucións e xuntalas na rama que sexa,
  usando o comando `git merge --squash`.

+ `triangular workflow` #a `fluxo de traballo triangular`\
  Estratexia na cal existe un repositorio remoto principal e onde cada persoa
  ten unha copia remota e outra local. Os cambios fanse localmente, súbense á
  copia remota e faise unha petición ao repositorio principal. Debuxando un
  diagrama vese claro que é un *fluxo de traballo triangular*.
