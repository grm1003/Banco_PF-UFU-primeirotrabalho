import System.IO
main = do
  putStrLn "Bem vindo ao trabalho de PF de Gabriel Machado"
  putStrLn "Matrícula: 12121BSI217"


menu = do
  putStrLn "----------------------------------------"
  putStrLn "Banco:"
  putStrLn "Gabriel Rezende Machado"

  putStrLn "----------------------------------------"
  putStrLn "Opções:"
  putStrLn "1.Saldo"
  putStrLn "2.Extrato"
  putStrLn "3.Deposito"
  putStrLn "4.Saque"
  putStrLn "5.Fim"
  putStrLn "Sua opção:"
  s <-getLine 
  let i = read s :: Integer
  opcao i
  persistir i
  putStrLn "----------------------------------------"

opcao n =  case n of
  1 -> imprime "saldo.txt"
  2 -> imprime "extrato.txt"
  3 -> deposito
  4 -> saque
  5 -> putStrLn "5.Fim"
  _ -> putStrLn "Opção ainda não cadastrada"

persistir n = case n of
  5 -> putStrLn "Obrigado por usar o Banco Gabriel Machado"
  _ -> menu

deposito = do 
  putStrLn "----------------------------------------"
--Pegando Valor para ser depositado pelo terminal
  putStrLn "Digite valor a ser depositado:"
  s <-getLine 
-- Variável local que trasforma esse valor de String para Int
  let i = read s :: Integer
--Lê o arquivo extrato.txt
  arquivo <- readFile "saldo.txt" 
  putStrLn "Saldo Antigo:"
  putStrLn arquivo
-- Variável local que trasforma esse valor lido de String para Int
  let n = read arquivo ::Integer
-- Como os dois valores são Int eu consigo somar eles
  let novosaldo = n + i 
--Como é Int tenho que transformar para String de novo para escrever no arquivo
  let output = show(novosaldo)
  putStrLn "Novo saldo:"
  putStrLn output
-- Escrever o novo saldo no extrato.txt
  writeFile  "saldo.txt" output
  appendFile "extrato.txt" output
  putStrLn "----------------------------------------"

--Parecido com o Deposito
saque = do 
  putStrLn "----------------------------------------"
  putStrLn "Digite valor a ser sacado:"
  s <-getLine 
  let i = read s :: Integer
  arquivo <- readFile "saldo.txt" 
  putStrLn "Saldo Antigo:"
  putStrLn arquivo
  let n = read arquivo ::Integer
  let novosaldo = n - i 
  let output = show(novosaldo)
  putStrLn "Novo saldo:"
  putStrLn output
  writeFile  "saldo.txt" output
  appendFile "extrato.txt" output
  putStrLn "----------------------------------------"


imprime file = do
  putStrLn " -------------------------------------- arquivo -----------------------"
  arquivo <- readFile file
  putStrLn arquivo
  putStrLn " --------------------------------------fim-----------------------"

