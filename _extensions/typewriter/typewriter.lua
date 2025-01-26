local function ensureHtmlDeps()
  quarto.doc.add_html_dependency({
    name = 'typewriter',
    version = '1.0.0',
    scripts = {'assets/js/core.js'}
  })
end


return {
  ['typewriter'] = function(args, kwargs, meta) 

    if quarto.doc.is_format("html:js") then

      local typewriter = meta.typewriter

      if typewriter.strings then
        strings = ""
        for _, s in ipairs(typewriter.strings) do
          strings = strings .. '"' .. pandoc.utils.stringify(s) .. '"' .. ","
        end
        strings = string.sub(strings, 1, -2)
      else
        return pandoc.RawBlock('html', '<div></div>')
      end

      print(strings)

      ensureHtmlDeps()

      local rtn = string.format([[
        <div id='typewriter'></div>
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                new Typewriter('#typewriter', {strings: [%s],autoStart: true,});
            });
        </script>
      ]], strings)

      return pandoc.RawBlock('html', rtn)
    end
  end
}
