"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"               
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║     
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"               
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               

" Desabilitar a compatibilidade com vi, que pode causar problemas inesperados.
set nocompatible

" Habilitar a detecção do tipo de arquivo.O Vim será capaz de tentar detectar automaticamente o tipo de arquivo.
filetype on

" Habilitar plugins e carregar o plug-in correspondente ao tipo de arquivo detectado.
filetype plugin on

" Carregar um aquivo de indentação correspondente ao tipo de arquivo detectado.
filetype indent on

" Ativar o destaque de sintaxe.
syntax on

" Adiciona numeração ao lado esquerdo de cada linha.
set number

" Destaca a linha do cursor horizontalmente, diretamente abaixo dele.
set cursorline

" Destaca a linha do cursor verticalmente, diretamente abaixo dele.
set cursorcolumn

" Define o recuo como 4 espaços.
set shiftwidth=4

" Define ao tamanho da tabulação como 4 espaços.
set tabstop=4

" Utiliza espaço ao invés de tabulações.
set expandtab

" Não salvar arquivos de backup.
set nobackup

" Não permite que o cursor role abaixo ou acima de um número N de linhas ao rolar.
set scrolloff=10

" Não quebrar linhas. Permitir que as linhas longas se estendam até onde a linha vai.
set nowrap

" Destaca os caracteres correspondentes a medida que você os digita durante uma busca.
set incsearch

" Ignora letras maiúsculas durante a busca.
set ignorecase

" Sobrescreve a opção ignorecase se estiver buscando por letras maiúsculas.
"Isso permitirá que você procure especificamente por letras maiúsculas.
set smartcase

" Mostra parte do comando que você digitou na última linha da tela.
set showcmd

" Mostra o modo em que você está na última linha.
set showmode

" Mostra as palavras correspondentes durante uma pesquisa.
set showmatch

" Utiliza destaque durante uma pesquisa.
set hlsearch

" Define os comandos a serem salvos no histórico, sendo o número padrão 20
set history=1000

" Habilita o menu de preenchimento automático ao pressionar TAB.
set wildmenu

" Faz com que o wildmenu se comporte de modo semelhante ao autocompletar do Bash.
set wildmode=list:longest

" Há certos arquivos que nunca gostaríamos de editar com o Vim.
"O Wildmenu ignorará arquivos com essas extensões.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

set clipboard=unnamedplus
" PLUG-INS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

  Plug 'dense-analysis/ale'

  Plug 'preservim/nerdtree'

  "Autocomplete plugin. similar to VSCode
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
    
call plug#end()

" }}}

" MAPEAMENTOS --------------------------------------------------------------- {{{

" Defina a barra invertida como a tecla líder.
" let mapleader = "\"

" Pressione \\ para voltar à última posição do cursor.
nnoremap <leader>\ ``

" Pressione \p para imprimir o arquivo atual na impressora padrão em sistemas Linux.
" Veja as impressoras disponíveis: lpstat -v
" Defina a impressora padrão: lpoptions -d <nome_da_impressora>
" <silent> significa não exibir saída.
nnoremap <silent> <leader>p :%w !lp<CR>

" Digite jj para sair do modo inserção rapidamente.
inoremap jj <Esc>

" Pressione a barra de espaço para digitar o caractere : no modo de comando.
nnoremap <space> :

" Ao pressionar a letra o, uma nova linha será aberta abaixo da linha atual.
" Sair do modo de inserção cria uma nova linha acima ou abaixo da linha atual.
nnoremap o o<esc>
nnoremap O O<esc>

" Centralize verticalmente o cursor ao mover para a próxima palavra durante uma busca.
nnoremap n nzz
nnoremap N Nzz

" Yank do cursor até o final da linha.
nnoremap Y y$

" Mapeie a tecla F5 para executar um script Python dentro do Vim.
" Aqui, mapeio a tecla F5 para uma sequência de comandos.
" :w salva o arquivo.
" <CR> (carriage return) é como pressionar a tecla Enter.
" !clear executa o comando externo de limpeza da tela.
" !python3 % executa o arquivo atual com Python.
nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>

" É possível dividir a janela no Vim digitando :split ou :vsplit.
" Navegue nas visualizações divididas com mais facilidade pressionando CTRL+j, CTRL+k, CTRL+h, ou CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Redimensione as janelas divididas usando as setas do teclado pressionando:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, ou CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" Mapeamentos específicos do NERDTree.
" Mapeie a tecla F3 para alternar entre abrir e fechar o NERDTree.
nnoremap <F3> :NERDTreeToggle<cr>

" Faça o NERDTree ignorar certos arquivos e diretórios.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" Habilitar o método de marcação para dobramento de código.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Se o tipo de arquivo atual for HTML, configurar a indentação para 2 espaços.
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

" Se a versão do Vim for igual ou superior a 7.3, habilitar o uso de undofile.
" Isso permite desfazer alterações em um arquivo mesmo após salvá-lo.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" É possível dividir uma janela em seções usando `:split` ou `:vsplit`.
" Exibir a linha do cursor e a coluna do cursor APENAS na janela ativa.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END

" Definir o tom de fundo.
    colorscheme molokai

" Se estiver usando a versão GUI do Vim, definir essas opções abaixo.
if has('gui_running')

    " Definir do plano de fundo.
    set background=dark


    " Definir uma fonte personalizada instalada no seu computador.
    " Sintaxe: set guifont=<nome_da_fonte>\ <peso_da_fonte>\ <tamanho>
    set guifont=Monospace\ Regular\ 12

    " Mostrar mais do arquivo por padrão.
	" Ocultar a barra de ferramentas.
    set guioptions-=T

    " Ocultar a barra de rolagem do lado esquerdo.
    set guioptions-=L

    " Ocultar a barra de rolagem do lado direito.
    set guioptions-=r

    " Ocultar a barra de menu.
    set guioptions-=m

    " Ocultar a barra de rolagem inferior.
    set guioptions-=b

    " Mapear a tecla F4 para alternar a barra de menu, barra de 		ferramentas e barra de rolagem.
	" <Bar> é o caractere da barra vertical.
	" <CR> é a tecla Enter.
    nnoremap <F4> :if &guioptions=~#'mTr'<Bar>
        \set guioptions-=mTr<Bar>
        \else<Bar>
        \set guioptions+=mTr<Bar>
        \endif<CR>

endif


" }}}

" LINHA DE STATUS ---------------------------------------------------------- {{{

" Limpa a barra de status quando o vimrc é recarregado.
set statusline=

" Lado esquerdo da barra de status.
set statusline+=\ %F\ %M\ %Y\ %R

" Utiliza um divisor para separar o lado esquerdo do lado direito.
set statusline+=%=

" Lado direito da barra de status.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Mostra a barra de status na penúltima linha.
set laststatus=2

" }}}
