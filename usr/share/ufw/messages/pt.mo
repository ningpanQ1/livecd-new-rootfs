��    �      �  �   |      h     i     k  "   s  �  �       (   6  #   _     �     �  &   �     �     �       *        H     e     m  9   t  )   �     �  "   �          +  /   >  +   n     �     �     �     �  #   �  #   �  %         E     f     z     �     �     �     �  W   �     @  "   ]     �  &   �  "   �     �               5     N  !   m     �  '   �  "   �     �       !   %  #   G     k  !   ~  %   �     �     �  !   �       &   5  5   \  *   �  C   �  =        ?  (   Q  %   z  %   �  0   �  &   �       /   0     `  >   r  @   �     �     �       3   %  ,   Y     �     �     �     �     �     �  '   	     1  '   J     r     �     �  +   �     �     �          +     A     Q     f     y     �  	   �     �  %   �  /   �           0      K      Y   &   x      �   !   �      �      �      !  1   !  /   :!     j!  !   w!     �!  ,   �!  T   �!     7"  
   �"      �"     �"     �"     �"     #     #     ,#     K#  4   f#  $   �#     �#     �#     �#     $     7$     T$  *   k$  :   �$     �$      �$  )   %  $   :%     _%  #   |%  #   �%  0   �%     �%     &  
   &     "&     %&     9&     Q&     l&     �&  %   �&     �&     �&     �&     '  &   3'     Z'     \'     l'     �'     �'  4   �'     �'     �'     �'  �  �'     �)  	   �)  *   �)  �  �)  &   �-  (   �-  0   �-     .     ,.  '   K.     s.     �.  (   �.  ,   �.  %   �.     /     $/  N   ,/  5   {/     �/  9   �/     0     "0  8   80  1   q0     �0     �0     �0     �0  +   �0  )   "1  +   L1  (   x1     �1     �1     �1     �1     	2     #2  ]   ;2  "   �2  *   �2  $   �2  3   3  -   @3  "   n3      �3  %   �3  %   �3     �3  4   4  '   S4  0   {4  *   �4     �4     �4  .   5  3   =5     q5  (   �5  3   �5  "   �5     6  2   *6  )   ]6  6   �6  <   �6  3   �6  E   /7  @   u7     �7  6   �7  ,   �7  ,   ,8  .   Y8  1   �8     �8  2   �8  $   9  b   '9  U   �9     �9     �9      :  K   :  :   g:     �:     �:     �:     �:     ;     );  -   F;      t;  5   �;      �;     �;     <  1   <  !   O<      q<     �<     �<     �<     �<     �<     =     =     &=     3=  )   P=  5   z=  #   �=  "   �=     �=  ,   >  8   2>  !   k>  %   �>  )   �>     �>     �>  6   �>  6   #?     Z?  "   f?  (   �?  >   �?  f   �?  �   X@     �@  #   �@     #A     3A     BA     TA     gA  %   A  #   �A  :   �A  '   B  #   ,B  (   PB  $   yB     �B  #   �B     �B  3    C  I   4C  *   ~C  (   �C  0   �C  &   D     *D  )   JD  '   tD  /   �D     �D     �D     �D     �D     �D     E      6E     WE     uE  .   �E     �E  $   �E  '   F     -F  ,   JF     wF     yF     �F  "   �F     �F  9   �F     G     )G     +G        �      O          x   �          +       y   �   )                  R   �   S                  '           .      e       �          J   ;   �   p   	   �       !   q       �   �   "   D   �   �       �   �   I               5   X   �       4               K       W   �      7   �   -   �   H       �   �   }   �       c                        \   ~   G          �   �       @         <   �   a   �           �   _   Z   �   �   V   >   `      k   �   g   �   l   f       |   3   �   j       o           {   ]           #   �   M   t   �           
   N   �   B           [   ,   �   ^   �   �       �      v   %   F          r       (      1   /   d           �       w       �   0       ?   b   �       �                   L   8   2   �           �       9   �   =   �   A   6   h   �       $   �   �   *                   �   n   u   �   E   T   s             �   Y   i       �         &      z               Q   :       P   �   U       C          �       m   �    
 
(None) 
Error applying application rules. 
Usage: %(progname)s %(command)s

%(commands)s:
 %(enable)-31s enables the firewall
 %(disable)-31s disables the firewall
 %(default)-31s set default policy
 %(logging)-31s set logging to %(level)s
 %(allow)-31s add allow %(rule)s
 %(deny)-31s add deny %(rule)s
 %(reject)-31s add reject %(rule)s
 %(limit)-31s add limit %(rule)s
 %(delete)-31s delete %(urule)s
 %(insert)-31s insert %(urule)s at %(number)s
 %(reload)-31s reload firewall
 %(reset)-31s reset firewall
 %(status)-31s show firewall status
 %(statusnum)-31s show firewall status as numbered list of %(rules)s
 %(statusverbose)-31s show verbose firewall status
 %(show)-31s show firewall report
 %(version)-31s display version information

%(appcommands)s:
 %(applist)-31s list application profiles
 %(appinfo)-31s show information on %(profile)s
 %(appupdate)-31s update %(profile)s
 %(appdefault)-31s set default application policy
  (skipped reloading firewall)  Attempted rules successfully unapplied.  Some rules could not be unapplied. %s is group writable! %s is world writable! '%(f)s' file '%(name)s' does not exist '%s' already exists. Aborting '%s' does not exist '%s' is not writable (be sure to update your rules accordingly) : Need at least python 2.6)
 Aborted Action Added user rules (see 'ufw status' for running firewall): Adding IPv6 rule failed: IPv6 not enabled Available applications: Backing up '%(old)s' to '%(new)s'
 Bad destination address Bad interface name Bad interface name: can't use interface aliases Bad interface name: reserved character: '!' Bad interface type Bad port Bad port '%s' Bad source address Cannot insert rule at position '%d' Cannot insert rule at position '%s' Cannot specify 'all' with '--add-new' Cannot specify insert and delete Checking ip6tables
 Checking iptables
 Checking raw ip6tables
 Checking raw iptables
 Checks disabled Command '%s' already exists Command may disrupt existing ssh connections. Proceed with operation (%(yes)s|%(no)s)?  Could not back out rule '%s' Could not delete non-existent rule Could not find '%s'. Aborting Could not find a profile matching '%s' Could not find executable for '%s' Could not find profile '%s' Could not find protocol Could not find rule '%d' Could not find rule '%s' Could not get listening status Could not get statistics for '%s' Could not load logging rules Could not normalize destination address Could not normalize source address Could not perform '%s' Could not set LOGLEVEL Could not update running firewall Couldn't determine iptables version Couldn't find '%s' Couldn't find parent pid for '%s' Couldn't find pid (is /proc mounted?) Couldn't open '%s' for reading Couldn't stat '%s' Couldn't update application rules Couldn't update rules file Couldn't update rules file for logging Default %(direction)s policy changed to '%(policy)s'
 Default application policy changed to '%s' Default: %(in)s (incoming), %(out)s (outgoing), %(routed)s (routed) Deleting:
 %(rule)s
Proceed with operation (%(yes)s|%(no)s)?  Description: %s

 Duplicate profile '%s', using last found ERROR: this script should not be SGID ERROR: this script should not be SUID Firewall is active and enabled on system startup Firewall not enabled (skipping reload) Firewall reloaded Firewall stopped and disabled on system startup Found exact match Found multiple matches for '%s'. Please use exact profile name Found non-action/non-logtype match (%(xa)s/%(ya)s %(xl)s/%(yl)s) From IPv6 support not enabled Improper rule syntax Improper rule syntax ('%s' specified with app rule) Insert position '%s' is not a valid position Invalid '%s' clause Invalid 'from' clause Invalid 'port' clause Invalid 'proto' clause Invalid 'to' clause Invalid IP version '%s' Invalid IPv6 address with protocol '%s' Invalid interface clause Invalid interface clause for route rule Invalid log level '%s' Invalid log type '%s' Invalid option Invalid policy '%(policy)s' for '%(chain)s' Invalid port with protocol '%s' Invalid ports in profile '%s' Invalid position ' Invalid position '%d' Invalid profile Invalid profile name Invalid token '%s' Logging disabled Logging enabled Logging:  Missing policy for '%s' Mixed IP versions for 'from' and 'to' Must specify 'tcp' or 'udp' with multiple ports Need 'from' or 'to' with '%s' Need 'to' or 'from' clause New profiles: No ports found in profile '%s' No rules found for application profile Option 'log' not allowed here Option 'log-all' not allowed here Port ranges must be numeric Port: Ports: Profile '%(fn)s' has empty required field '%(f)s' Profile '%(fn)s' missing required field '%(f)s' Profile: %s
 Profiles directory does not exist Protocol mismatch (from/to) Protocol mismatch with specified protocol %s Resetting all rules to installed defaults. Proceed with operation (%(yes)s|%(no)s)?  Resetting all rules to installed defaults. This may disrupt existing ssh connections. Proceed with operation (%(yes)s|%(no)s)?  Rule added Rule changed after normalization Rule deleted Rule inserted Rule updated Rules updated Rules updated (v6) Rules updated for profile '%s' Skipped reloading firewall Skipping '%(value)s': value too long for '%(field)s' Skipping '%s': also in /etc/services Skipping '%s': couldn't process Skipping '%s': couldn't stat Skipping '%s': field too long Skipping '%s': invalid name Skipping '%s': name too long Skipping '%s': too big Skipping '%s': too many files read already Skipping IPv6 application rule. Need at least iptables 1.4 Skipping adding existing rule Skipping inserting existing rule Skipping malformed tuple (bad length): %s Skipping malformed tuple (iface): %s Skipping malformed tuple: %s Skipping unsupported IPv4 '%s' rule Skipping unsupported IPv6 '%s' rule Status: active
%(log)s
%(pol)s
%(app)s%(status)s Status: active%s Status: inactive Title: %s
 To Unknown policy '%s' Unsupported action '%s' Unsupported default policy Unsupported direction '%s' Unsupported policy '%s' Unsupported policy for direction '%s' Unsupported protocol '%s' WARN: '%s' is world readable WARN: '%s' is world writable Wrong number of arguments You need to be root to run this script n problem running problem running sysctl problem running ufw-init
%s running ufw-init uid is %(uid)s but '%(path)s' is owned by %(st_uid)s unknown y yes Project-Id-Version: ufw
Report-Msgid-Bugs-To: FULL NAME <EMAIL@ADDRESS>
POT-Creation-Date: 2014-02-20 14:16-0600
PO-Revision-Date: 2014-09-16 09:56+0000
Last-Translator: cetautomatix <mag.formacao@gmail.com>
Language-Team: Portuguese <pt@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Launchpad-Export-Date: 2015-01-26 20:08+0000
X-Generator: Launchpad (build 17306)
 
 
(Nenhum) 
Erro ao aplicar as regras de aplicação. 
Utilização: %(progname)s %(command)s

%(commands)s:
 %(enable)-31s Ativa a firewall
 %(disable)-31s desativa the firewall
 %(default)-31s define políticas padrão
 %(logging)-31s define logging para %(level)s
 %(allow)-31s add permissão %(rule)s
 %(deny)-31s add negação %(rule)s
 %(reject)-31s add rejeição %(rule)s
 %(limit)-31s add limit %(rule)s
 %(delete)-31s apaga %(urule)s
 %(insert)-31s inserir %(urule)s em %(number)s
 %(reload)-31s reload firewall
 %(reset)-31s reset firewall
 %(status)-31s mostrar status da firewall
 %(statusnum)-31s mostra status da firewall como lista numerada de %(rules)s
 %(statusverbose)-31s mostra status verbose da firewall
 %(show)-31s mostra relatório da firewall
 %(version)-31s apresenta a versão

%(appcommands)s:
 %(applist)-31s lista de perfis de aplicações
 %(appinfo)-31s mostrar informações sobre %(profile)s
 %(appupdate)-31s update %(profile)s
 %(appdefault)-31s define políticas padrão
  (ignorado recarregamento da firewall)  Regras tentadas esquecidas com sucesso.  Algumas regras não puderam ser não aplicadas. %s pode ser escrito pelo grupo! %s pode ser escrito por todos! '%(f)s' ficheiro '%(name)s' não existe '%s' já existe. A abortar '%s' não existe '%s' não está disponível para escrita (certifique-se de que altera as suas regras) : Necessita pelo menos o python 2.6)
 Abortado Acção Adicionadas regras de utilizador (veja 'ufw status' para executar a firewall): Falha ao adicionar regra IPv6: IPv6 não está activo Aplicações disponíveis: A fazer cópia de segurança de '%(old)s' para '%(new)s'
 Endereço de destino errado Mau nome de interface Mau nome de interface: não pode usar nomes alternativos Mau nome de interface: caracteres reservados: '!' Tipo mau de interface Porta incorreta Porta errada '%s' Endereço de origem errado Não pode inserir a regra na posição '%d' Não pode inserir regra na posição '%s' Não pode especificar 'all' com '--add-new' Não pode especificar o inserir e apagar A verificar ip6tables
 A verificar iptables
 Verificando ipt6ables brutos
 Verificando iptables brutos
 Verificações desligadas Comando '%s' já existe O comando pode romper ligações ssh existentes. Proceder com a operação (%(yes)s|%(no)s)?  Incapaz de retroceder a regra '%s' Impossível de apagar regra não existente Não pôde encontrar '%s'. A abortar Não pôde encontrar o perfil correspondente a '%s' Não pôde encontrar um executável para '%s' Não pôde encontrar o perfil '%s' Não pôde encontrar o protocolo Não conseguiu encontrar a regra '%d' Não conseguiu encontrar a regra '%s' Não atingiu o estado de escuta Não foi possível encontrar estatísticas para '%s' Não pôde carregar a regras de registo Impossível de normalizar o endereço de destino Não pude normalizar o endereço de origem Não pôde executar '%s' Não pôde ajustar o LOGLEVEL Não pôde atualizar firewall em funcionamento Não foi possível determinar a versão do iptables Não pôde encontrar '%s' Não pôde encontrar o pid pai para '%s' Não pôde encontrar o pid (o /proc está montado?) Não pôde abrir '%s' para leitura Não conseguiu fazer stat '%s' Não foi possível atualizar regras da aplicação Não pôde atualizar o ficheiro de regras Não pôde atualizar o ficheiro de regras para registo Política de %(direction)s padrão mudada para '%(policy)s'
 Política padrão de aplicação alterada para '%s' Predefinido: %(in)s (entrada), %(out)s (saída), %(routed)s (roteado) A apagar:
 %(rule)s
Proceder com a operação (%(yes)s|%(no)s)?  Descrição: %s

 Perfil duplicado '%s', utilizando o último encontrado ERRO: Este script não deve ser do tipo SGID ERRO: este script não deve ser do tipo SUID Firewall ativa e ligada no arranque do sistema Firewall não ligada (ignorando o recarregamento) Firewall recarregada Firewall parada e desligada no arranque do sistema Foi encontrada uma ocorrência exata Foram encontradas múltiplas correspondências para '%s'. Por favor utilize o nome exato do perfil Encontrou ocorrência não-acção/não-tipo de registo (%(xa)s/%(ya)s %(xl)s/%(yl)s) De Suporte IPv6 não habilitado Sintaxe de regra inválida Regra com sintaxe imprópria ('%s' especificada com a regra da aplicação) Posição de inserção '%s' não é uma posição válida Cláusula '%s' inválida Clásula 'de' inválida Cláusula de 'porta' inválida Cláusula 'proto' inválida Cláusula 'para' inválida Versão '%s' de IP inválida Endereço IPv6 inválido com o protocolo '%s' Cláusula de interface inválida Cláusula de interface inválida para regras de route Nível de registo inválido '%s' Tipo de registo '%s' inválido Opção inválida Política inválida '%(policy)s' para '%(chain)s' Porta inválida com protoclo '%s' Portas inválidas no perfil '%s' Posição inválida ' Posição '%d' inválida Perfil inválido Nome de perfil inválido Símbolo inválido '%s' Registo desativado Registo ativado A registar:  Política em falta para '%s' Versões IP misturadas para 'de' e 'para' Deve especificar 'tcp' ou 'udp' com múltiplas portas Necessário 'from' ou 'to' com '%s' Necessita cláusula 'de' ou 'para' Novos perfis: Não foram encontradas portas no perfil '%s' Não foram encontradas regras para perfil de aplicação Opção 'log' não permitida aqui Opção 'log-all' não permitida aqui Intervalos de portas devem ser numéricos Porta: Portas: Perfil '%(fn)s' tem um campo necessário vazio '%(f)s' Perfil '%(fn)s' tem em falta campo necessário '%(f)s' Perfil: %s
 O diretório de perfis não existe Protocolo sem correspondência (from/to) Protocolo sem correspondência com o protocolo especificado %s A reconfigurar todas as regras para os padrões instalados. Proceder com operação (%(yes)s|%(no)s)?  A reconfigurar todas as regras para os padrões instalados. Isso pode romper as ligações ssh existentes. Proceder com operação (%(yes)s|%(no)s)?  Regra adicionada Regra alterada após normalização Regra eliminada Regra inserida Regra actualizada Regras atualizadas Regras atualizadas (v6) Regras atualizadas para o perfil '%s' Recarregamento da firewall ignorado A evitar '%(value)s': valor demasiado longo em '%(field)s' A evitar '%s': também em /etc/services A evitar '%s': não pôde processar A evitar '%s': não conseguiu fazer stat A evitar '%s': campo demasiado longo A evitar '%s': nome inválido A evitar '%s': nome demasiado longo A evitar '%s': demasiado grande A saltar '%s': já foram lidos demasiados ficheiros A evitar a regra de aplicação IPv6. Necessita pelo menos o iptables 1.4 A evitar a adição de uma regra existente A evitar a inserção de regra existente A ignorar tuple mal formado (tamanho errado): %s Ignorando tupla malformada (iface):% s A ignorar tuple mal formado: %s Ignorando regra IPv4 não suportada '% s' Saltando regra IPv6 '%s' não suportada Estado: ativo
%(log)s
%(pol)s
%(app)s%(status)s Estado: active%s Estado: inativo Título: %s
 Para Política desconhecida '%s' Ação '%s' não suportada Política padrão não suportada Direção não suportada '%s' Política '%s' não suportada Política não suportada para a direção '%s' Protocolo '%s' não suportado AVISO: '%s' pode ser lido pelo mundo AVISO: '%s' pode ser escrito pelo mundo Número de argumentos errado Necessita ser root para executar este script n problema ao executar problema executando o sysctl problema ao executar o ufw-init
%s a executar ufw-init uid é %(uid)s mas '%(path)s' é possuído por %(st_uid)s desconhecido s sim 