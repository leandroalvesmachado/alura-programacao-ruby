# imprimindo
# puts ("Bem vindo ao jogo da adivinhação") tambem funciona
puts "Bem vindo ao jogo da adivinhação"
puts "Qual é o seu nome?"

# captura o valor digitado no terminal e atribui a variavel nome
nome = gets

# outra forma de captura o valor já com o puts
# puts "Qual é o seu nome?" + gets


puts
puts
puts
# concatenando
puts "Começaremos o jogo para você, " + nome

puts "Escolhendo um número secreto entre 0 e 200..."
numero_secreto = 175
puts "Escolhido... que tal adivinhar hoje nosso número secreto?"

puts
puts
puts
puts "Tentativa 1"
puts "Entre com o número"
chute = gets
puts "Será que acertou? Você chutou " + chute

# to_i converter para inteiro
puts chute.to_i == numero_secreto