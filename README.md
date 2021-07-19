# Neovim >= 0.5.0 Configuration files,  
## except that everything is a Lua file :)
![image](https://user-images.githubusercontent.com/55247343/126057008-4ef89222-791a-4450-b517-f435dcb9cc51.png)
  
# FEATURES
1. Neovim Native-LSP together with Tree-Sitter, for better syntax highlighting, code diagnostics, autocompletion, snippets, go to definitions, etc  
Currently attached LSP: clang (c/c++), python, bash, vim, lua, cmake.
**special note for Clangd LSP** : You need clang & clangd >= 8.0 to be able to make it work correctly. There are some issues with clangd <= 7.0
```vim
" go-to-definition : gd
" go-back to last file (spam able) : CTRL + O
" show documentation : SHIFT + K
```

2. Floaterm & FFF (Fuc_ing Fast File-manager) for easy file navigation & floating terminal instance (can also use classic NERDTree)
```vim
" Open Floaterm terminal: SPACE - f - t
" Open Floaterm for FFF : SPACE - f - f
```
3. Neovim-Telescope for amazing file navigation, git navigation (branches, files, commits, etc), code diagnostics, vim quickfixes
```vim
" All Telescope commands are prefixed with : SPACE - t - ....
```
4. Aurora Theme for optimized theme & syntax highlighting for TreeSitter.
5. Integrated CMake plugin. Press SPACE-c-g to generate build files, and SPACE-c-b to build the project! (CMakeGenerate will look CMakeLists.txt in the root directory, and also respecting .gitignore & .git). If you want to enable clangd LSP support, you have to add this line in your main CMakeLists.txt file:
```cmake
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
```
This will generate file named 'compile_commands.json', which tells the clangd LSP how your project looks like, how your include dirs are arranged, what   libraries you used, etc. Without this, clangd may not behave properly.  
```vim
" Generate build files from root CMakeLists.txt: SPACE - c - g  
" Build project from build files: SPACE - c - b  
" Close CMake window: SPACE - c - q  
```
6. And many more! You can read all through the config files if you want to utilize the full potential of Neovim 0.5.0
  
&nbsp;  
  
# INSTALLATION
1. Get this requirements:
```
- Install Neovim 0.5.0 official release. You have to either:
        - Install from source, there is an appimage available.
        - Build from source, and install globally
After that configure it so Neovim 0.5.0 is accessible globally by creating a link & adding the path.
        ln -S -T /path/to/nvim0.5.0/binary ~/bin/       #assuming ~/bin/ is in $PATH
Or if you built from source, usually they will provide a Makefile to install globally.
        sudo make install
otherwise, you can always use link method

- Install via your package manager: node, python3, python3-pip, gcc, g++, clang, node, clangd, git, ripgrep
   (in my case: apt)
- Install via pip: cmake-language-server
- Install via npm (global installation): vim-language-server, bash-language-server, pyright
  (UNIX based systems have to install as root)
- Install the 'Vim-Plug' plugin manager. There is a bash install script available in this dir.
        bash INSTALL_VimPlug.sh

- For Lua language server, it's a bit complicated, but I recommend you following these guide:  
        https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)  

- For my Neovim (particular) config, clone the the lua-language-server repo (^) in your ~/bin directory.
  (IMPORTANT: ~/bin/ must be in $PATH)
        ex: 
        mkdir ~/bin
        cd ~/bin/ ; git clone https://github.com/sumneko/lua-language-server

        after that, follow the build step and do it in ~/bin
```


2. Clone this repository:
```bash
# do this first, we will change the directory name later
git clone https://github.com/yeyee2901/yy-neovim-config ~/.config/nvim
```


3. NOW, the main difference with this LUA config counterpart, compared to vimscript counterpart,
This will automatically install 'packer' plugin manager, and install all the plugins specified.

4. If it succeeds, then it should automatically install the required plugins!  

5. Try opening any file and either press ' SPACE - t - f ', or running this command in neovim:
```vim
:Telescope find_files
```
6. If you're not messing up something, you can watch ChrisAtMachine / TJ DeVries videos & livestreams. They provide
clear explanation on these setups. Regarding LSP setups, do watch ChrisAtMachine's video: https://www.youtube.com/watch?v=NXysez2vS4Q&t=915s

7. There are also instructions on the init.vim file. Be sure to read it~
  
&nbsp;  
# SNAPSHOTS
1. Code snippets, autocompletes on Tab, and if the function is not yet defined, it tries to auto import the module. (see big dots beside the text). Navigate with Ctrl+n & Ctrl+p
![image](https://user-images.githubusercontent.com/55247343/126035950-60eeedca-76f0-4a75-89ea-fdbfffe23ddb.png)

2. Floating Terminal & FFF for file navigation
![image](https://user-images.githubusercontent.com/55247343/126035996-debdde8e-ac6a-411f-a99b-4ca88c1ccf8a.png)
![image](https://user-images.githubusercontent.com/55247343/126036090-ecb8ac46-a313-41af-8317-b2385fe69fc0.png)

3. Here are some of Telescope capabilities.Telescope will try to search all occurences of your search query, and you can immediately jump on ENTER. Of course you can also go back to previous file using CTRL + o from LSP keymapping.
![image](https://user-images.githubusercontent.com/55247343/126036038-2a376131-2010-4ee1-bacf-bf3dee948228.png)

Telescope the quickfix list! ( SPACE-t-q-f ) - To generate quickfix lists, run these command (in command mode :)
```vim
vimgrep /your_search_query/g ./file_to_search'

" EXAMPLE: this will tell neovim to : 'search all 'def' occurence in the current directory, for all files that end with ".py" '
vimgrep /def/g ./*.py
```
![image](https://user-images.githubusercontent.com/55247343/126036409-48e9a1e1-c34b-4f4f-8773-88ea6cd2fba3.png)

Telescope the diagnostics! (for current file only, the workspace diagnostics seems buggy) ( SPACE - t - d )
![image](https://user-images.githubusercontent.com/55247343/126036469-0acd7640-fb59-40df-bba2-d02549825672.png)

Forgot keymap / shortcuts? No Problemo! ( SPACE-t-? )
![image](https://user-images.githubusercontent.com/55247343/126036526-f4abfd95-19dc-458a-8355-0ee64914d079.png)

4. Integrated CMake building & file generator
![image](https://user-images.githubusercontent.com/55247343/126036555-bd56990f-16fb-4b6d-b4d1-0a8c3cfa7de6.png)

&nbsp;  

# NOTES
I do not own any of the plugins, softwares, etc. I just arranged them to be suitable for my development needs. Feel free to download this repo and try exploring with Neovim >= 0.5.0! HAPPY VIMMING!!  
  
Tested On:
1. Pop! OS 21.04 (debian based)
2. Raspbian (buster) @Raspberry Pi 4 model B (8GB RAM)
![image](https://user-images.githubusercontent.com/55247343/126037131-4e2583dd-b84a-4b4c-9e90-7f475f2d7e85.png)
