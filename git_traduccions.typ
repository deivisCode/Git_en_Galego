#set text(size:10pt, font:"New Computer Modern", lang:"gl")
#show raw: set text(size:11pt, font: "New Computer Modern Mono" )
#show link: it => {
    set text(blue)
    underline(it)
}

#set page(
    paper: "a4",
    margin: ( top : 2cm, inside : 3cm, outside : 5cm, bottom : 2cm),
    numbering: "1",
    columns: 2
)
#set par( justify: true, first-line-indent: 5mm)

#text(size: 25pt)[= GIT en Galego]

Case todo o que vou comentar do funcionamento de Git ven do libro oficial que
podedes atopar na ligazón #link("https://git-scm.com/book/en/v2")

== A base

_Varias palabras que forman o vocabulario básico_

\ `snapshot`
\ `blob`
\ `object`
\ `delta / difference`
\ `branch`
\ `working tree / tree`
\ `staging area / index`
\ `git repository`
\ `commit`
\ `remote`

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
_vou *subir* tal contribución_. O comando non o cambio, como xa comentei.

\ `push`
\ `pull`
\ `upstream`
\ `downstream`
\ `origin`
\ `merge`
\ `rebase`
\ `squash`
