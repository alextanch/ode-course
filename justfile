# Удаляются только файлы рядом с .tex с тем же именем: notebooks/x.tex -> notebooks/x.aux, x.log, ...
# Удалить вспомогательные файлы компиляции LaTeX (PDF остаются)
clean:
    #!/usr/bin/env bash
    set -euo pipefail
    exts=(aux log fls fdb_latexmk synctex.gz synctex out toc nav snm bbl blg bcf run.xml xdv dvi)
    find . -path ./.venv -prune -o -path ./.git -prune -o -name '*.tex' -print | while read -r tex; do
        base="${tex%.tex}"
        for ext in "${exts[@]}"; do
            if [ -f "$base.$ext" ]; then
                rm -v -- "$base.$ext"
            fi
        done
    done
