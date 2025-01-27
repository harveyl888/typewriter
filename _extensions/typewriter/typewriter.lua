local function ensureHtmlDeps()
  quarto.doc.add_html_dependency({
    name = 'typewriter',
    version = '1.0.0',
    stylesheets = {'assets/css/style.css'},
    scripts = {'assets/js/core.js'}
  })
end


return {
  ['typewriter'] = function(args, kwargs, meta) 

    if quarto.doc.is_format("html:js") then

      local typewriter = meta.typewriter

      -- prefix
      if typewriter.prefix then
        prefix = pandoc.utils.stringify(typewriter.prefix)
      else
        prefix = ""
      end

      -- strings
      if typewriter.strings then
        strings = ""
        for _, s in ipairs(typewriter.strings) do
          strings = strings .. '"' .. pandoc.utils.stringify(s) .. '"' .. ","
        end
        strings = string.sub(strings, 1, -2)
      else
        return pandoc.RawBlock('html', '<div></div>')
      end

      -- parameters
      local t_params = {} 

      -- cursor
      if typewriter.cursor then
        table.insert(t_params, "cursor: '" .. pandoc.utils.stringify(typewriter.cursor) .. "'")
      end

      -- delay
      if typewriter.delay then
        if typewriter.delay == "natural" then
          table.insert(t_params, "delay: 'natural'")
        else
          table.insert(t_params, "delay: " .. pandoc.utils.stringify(typewriter.delay))
        end
      end

      -- deleteSpeed
      if typewriter.deleteSpeed then
        if typewriter.deleteSpeed == "natural" then
          table.insert(t_params, "deleteSpeed: 'natural'")
        else
          table.insert(t_params, "deleteSpeed: " .. pandoc.utils.stringify(typewriter.deleteSpeed))
        end
      end

      -- loop
      if typewriter.loop then
        if typewriter.loop == true then
          table.insert(t_params, "loop: true")
        else
          table.insert(t_params, "loop: false")
        end
      end

      -- pauseFor
      if typewriter.pauseFor then
        table.insert(t_params, "pauseFor: " .. pandoc.utils.stringify(typewriter.pauseFor))
      end

      local num_params = #t_params
      local params
      if num_params > 0 then
        params = table.concat(t_params, ", ")
      else
        params = ""
      end
      
      ensureHtmlDeps()

      local rtn = string.format([[
        <div class="typewriter">
          <span class="typewriter-prefix">%s</span>
          <span id="typewritertext"></span>
        </div>

        <script>
            document.addEventListener('DOMContentLoaded', function() {
                new Typewriter('#typewritertext', {strings: [%s], autoStart: true, wrapperClassName: 'typewriter-strings', cursorClassName: 'typewriter-cursor', %s});
            });
        </script>
      ]], prefix, strings, params)

      return pandoc.RawBlock('html', rtn)
    end
  end
}
