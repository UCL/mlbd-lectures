Div = function(div)
    if (not quarto.doc.isFormat("revealjs")) then
        return div
    end
    if div.classes:includes("incremental-stack") then
        div.classes:insert("r-stack")
        div.classes:insert("top-align")
        for i, el in pairs(div.content) do
            if el.tag == "Para" then
                local fragment = pandoc.Div(
                    el.content, {class = "fragment"}
                )
                if i == 1 then
                    fragment.classes:insert("fade-out")
                    fragment.attributes["data-fragment-index"] = 1
                elseif i == #(div.content) then
                    fragment.classes:insert("fade-in")
                    fragment.attributes["data-fragment-index"] = i - 1  
                else
                    fragment.classes:insert(" fade-in-then-out")
                    fragment.attributes["data-fragment-index"] = i - 1
                end
                div.content[i] = fragment
            end
        end
    end
    return div
end
