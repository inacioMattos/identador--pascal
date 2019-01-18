### [EDIT]: Para fazer o download do Identador e usar no seu computador, basta acessar o aba 'releases' ou clicar [aqui](https://github.com/inacioMattos/identador--pascal/releases)

# Identador de código em Pascal

   Este projeto é sobre um desenvolvimento de um software cuja função seja aceitar um determinado código e mostrar como resultado o mesmo identado, inicialmente, utilizando o Allman-6 Style.

   Inicialmente, a ideia é de desenvolver em Pascal, e aceitar três diferentes linguagens de programação: Pascal, C# e Java. (Futuramente, outras linguagens serão adicionadas nesta lista :smile:).

## Exemplos de código identados usando o Allman-6 Style

Em C#:
```CSharp
while (x == y)
{
    something();
    somethingelse();
}

finalthing();
```
Esse exemplo está correto segundo o Allman-6 Style, já o próximo está incorreto:
```CSharp
while (x == y) {
    something();
    somethingelse();
}

finalthing();
```

Em Pascal:
```Pascal
procedure dosomething(x, y: Integer);
begin
    while (x = y) do
    begin
        something();
        somethingelse();
    end;
end;
```
Esse exemplo está correto segundo o Allman-6 Style, já o próximo está incorreto:
```Pascal
procedure dosomething(x, y: Integer);
begin
    while (x = y) do begin
        something();
        somethingelse();
    end;
end;
```
