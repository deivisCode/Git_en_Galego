#set text(size:10pt, font:"New Computer Modern", lang:"gl")
#show raw: set text(size:11pt, font: "New Computer Modern Mono" )
#show link: it => {
    set text(blue)
    underline(it)
}
#set page(
    paper: "a4",
    numbering: "1",
    columns: 2
)
#set par( justify: true, first-line-indent: 5mm)

#text(size: 30pt)[= GIT en Galego]

Case todo o que vou comentar do funcionamento de Git ven do libro oficial que
podedes atopar na ligazón #link("https://git-scm.com/book/en/v2")

== A base

_Varias palabras que forman o vocabulario básico_

+ `object`: Un termo algo xenérico para referirse a variedade de conceptos (que
  presentarei a continuación). Vexo razoable dicir simplemente *obxecto* ou
  incluso sendo explícito *obxecto de git*

+ `snapshot`. É a versión do proxecto nun momento concreto, presente ou pasado.
  Git garda a información do proxecto como unha serie de versións
  *instantáneas* del, polo que ao volver atrás, simplemente _move_ un punteiro
  (adiantándome ao próximo termo) a unha copia anterior. A tradución literal
  de `snapshot` é `instantánea`, e reflicte ben a idea que ten git á hora de
  gardar a información#footnote[Ao contrario doutros sistemas de control de
  versións, que só gardan as _diferenzas_]

+ `pointer`. É unha referencia a unha contribución concreta (outra vez,
  adiantándome aos termos). Git garda unha serie de _instantáneas_, e en cada
  unha delas hai unha referencia á instantánea anterior (ou anteriores, no caso
  de ter varias ramas que se xuntan). Vexo ben chamalo *punteiro*, porque se
  soe mostrar como tal en gráficas e imaxes, e é directo de entender.

+ `branch`: O traballo en git soe depender da creación de bifurcacións no
  traballo. En xeral, a representación gráfica deste traballo represéntase con
  *ramas*, e a idea mental é razoable á situación real. Máis concretamente, é
  un _punteiro_ móbil, pero dito así é menos suxerinte.

+ `blob`: Unha certa versión dun ficheiro gardado no repositorio. Non atopei
  unha tradución intuitiva, e polo pouco suxerinte e polo simpático da
  palabra, sigo chamándolle *blob*. De todos modos, non se usa a miúdo.

+ `hash`: un valor en hexadecimal computado a partir dos contidos dun (ou
  varios) ficheiros ou doutros obxectos de git. Permite identificar
  unívocamente ditos obxectos. Non atopei ningunha boa tradución, neste caso
  sigo chamándolle *hash*

+ `tree`: Unha lista de nomes de ficheiros cos seus correspondentes _hashes_ e
  os _blobs_ aos que corresponden. É importante non confundir isto cun _working
  tree_. `tree` a secas supoño que se pode traducir como árbore, inda que en
  xeral non se usa o termo

+ `working tree`: A versión _activa_ do proxecto. O repositorio pode ter moitas
  contribución, nas cales os ficheiros cambian. A contribución actual, que se
  presenta como ficheiros reais no directorio de traballo, é o `working tree`.
  Creo que *espazo de traballo* vai da man co significado

+ `delta / difference`: É a *diferenza* entre dúas versións do proxecto. En
  xeral móstranse con comandos coma `git diff [--staged]`

+ `staging area / index`: É posible gardar os cambios que facemos no noso
  _espazo de traballo_ nunha 'zona de proba' a cal se chama `index` ou `staging`
  `area`. Sirve para ir seleccionando os cambios que queremos ir engadindo, e
  unha vez rematamos, gardamos _todo_ o `index` no repositorio. Vexo ben dicir
  simplemente *indice*, ou tal vez *area/zona de preparación*, inda que isto
  último gústame menos.

+ `commit`: O proceso de pasar os cambios que temos no `indice` ao _repositorio
  final_. Esta é a forma de _contribuír_ a un proxecto, xa que son os cambios
  no repositorio os que se comparten na rede, os que se gardan na historia,
  etc. Vexo razoable cha, entón, dicirlle *contribución*

+ `git repository`: É o directorio `.git` onde se gardan os cambios temporais
  do _índice_, os finais en forma de _contribucións_, os _blobs_, _diferenzas_,
  e calquera outra información do proxecto. Chámolle *repositorio de git* ou
  simplemente *repositorio*

+ `remote`: Unha `URL` do repositorio na rede. Por exemplo,
  #link("https://github.com/deivisCode/Git_en_Galego.git"). En inglés debería
  dicirse `remote url` pero simplifícase a `remote`. Non lle vexo nada raro de
  dicir *remoto* en galego, como en `ligazón/URL remoto`.

+ `origin`: O nome por defecto dun remoto de calquera proxecto. Eu case sempre
  lle chamo *orixe* e xa está.

+ `fork`. De existir un repositorio calquera na rede, nós podemos facer unha
  copia deste _tamén_ na rede. Dita copia é o `fork`. Direi simplemente que é a
  *copia na rede* doutro proxecto ou repositorio.

+ `pull request`: Podemos ter certos cambios na nosa copia en rede dun
  proxecto, e pode interesarnos _pedir_ que estes sexan aplicados ao proxecto
  principal. Esto é un 'pull request'. Direi simplemente *pedir que se engadan
  os cambios*, por exemplo: Vou abrir unha _petición_ para que engadan os meus
  cambios de `deivisCode/revista` en `DAF-USC/revista`


== Comandos e accións

Por un lado temos *comandos* de git, que se usan chamándoos na terminal como
`git branch`, `git switch`, `git commit`, etc. Os comandos evidentemente *non*
se traducen, dado que son fixos e non se poden cambiar#footnote[A menos que
uses 'aliases']. O relevante é que si se poden traducir as *accións* que levan
a cabo ditos comandos. Por exemplo, `git switch` úsase para cambiar dunha rama
a outra, polo que podemos falar de _cambiar_ como a acción que realiza o
comando `switch`. Non sempre é evidente, porque hai comandos que teñen unha
semántica pouco clara, como `git checkout` que sirve para facer unha ducia de
cousas diferentes.

== Accións

Aquí voume referir ás accións dos comandos (cando estas sexan claras). Por
exemplo, vou traducir `push` como `subir`, o cal significa que ao falar direi
_vou *subir* tal contribución_. Esto é moito máis razoable que dicir _vou facer
un *push*_, o cal non ten moito significado. `push` como nome é o comando e non
se traduce, polo que se diría _vou usar o comando `push`_. O comando non o
cambio, como xa comentei.

+ `push`: Compartir os cambios locais na rede, ou *subir* os cambios ao remoto.
  Digo que vou *subir os cambios*, e uso o comando `push` para facelo.

+ `pull / fetch`: Descargar os cambios da rede, ou *baixar* os cambios do
  remoto. Digo que vou *baixar/descargar os cambios*, e uso `pull` ou `fetch`.
  O detalle entre `fetch` e `pull` como comandos é que o segundo xunta os
  cambios descargados ca rama correspondente de forma automática, mentres que
  `fetch` non o fai. En calquera caso estamos a descargar cambios do
  repositorio remoto, e simplemente é cuestión de saber se queremos usar un
  comando ou outro.

+ `upstream / downstream`: As veces existe unha dependencia entre varios
  proxectos, sendo un deles un proxecto 'derivado' do outro. Dicimos que o
  primeiro de todos é `upstream` e o outro `downstream`. Pode que ao traballar
  en `downstream` teñamos que usar aplicar os novos cambios de `upstream` dado
  que herdamos deles. Gustaríame dicir *rio arriba* e *rio abaixo*, ou tal vez
  simplemente *arriba* e *abaixo*. Como exemplo, ao traballar con neovim, hai
  variedade de cambios que se fan _arriba_/_rio arriba_ en vim

+ `merge`. Ao ter varias ramas un traballo típico é o de _xuntalas_ para crear
  unha sola. Direi que *xunto* varias ramas, e para facelo uso o comando `git`
  `merge`

+ `rebase`. Unha estratexia para aplicar os cambios dunha rama noutra. `rebase`
  úsase porque literalmente cambiamos a contribución 'base' da cal se
  bifurcaron as ramas ao comezo. Pode usarse *rebasar* inda que non está
  aceptado na RAG (non é mais que re + base). Ou tal vez usar *cambiar a base*.
  Direi que *rebaso* a rama A na rama B, e uso o comando `git rebase B`
  (aplicado ao estar na rama A)

+ `squash`: Outra estratexia para aplicar os cambios dunha rama noutra. Neste
  caso, se a rama `A` ten 7 contribucións, podemos xuntar ditas contribucións
  nunha soa e aplicar _esa_ á rama B. Persoalmente gustoume a idea de
  *aplastar*. Entón, podo _aplastar_ certas contribucións e xuntalas na rama
  que sexa.
