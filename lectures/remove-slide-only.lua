function is_presentation()
 return quarto.doc.isFormat("revealjs") or quarto.doc.isFormat("beamer") or quarto.doc.isFormat("pptx")
end

function remove_if_not_slides(el)
    if (not is_presentation() and el.classes:includes("slides-only")) then
        return {}
    end
    return el
end

function remove_if_not_slides_div(el)
    if (not is_presentation() and el.classes:includes("slides-only")) then
        return {}
    end
    return el.content
end

Header = remove_if_not_slides
Div = remove_if_not_slides