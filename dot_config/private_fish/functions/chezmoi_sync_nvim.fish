function chezmoi_sync_nvim --description "Sync nvim config via chezmoi"
    chezmoi add ~/.config/nvim; and chezmoi cd; and git add .; and git commit -sm "lazy sync"; and git push origin main
end
