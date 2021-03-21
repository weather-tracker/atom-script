GrammarUtils = require '../grammar-utils'

# https://github.com/atom-community/atom-script/issues/214#issuecomment-418766763
encodingSet = false
setEncoding: ->
  if (!encodingSet)
    process.env.PYTHONIOENCODING = 'utf-8'
    encodingSet = true
  return

exports.Python =
  'Selection Based':
    command: 'python'
    args: (context) ->
      setEncoding()
      code = context.getCode()
      tmpFile = GrammarUtils.createTempFileWithCode(code)
      return ['-u', tmpFile]

  'File Based':
    command: 'python'
    args: ({filepath}) ->
      setEncoding()
      return ['-u', filepath]

exports.MagicPython = exports.Python

exports.Sage =
  'Selection Based':
    command: 'sage'
    args: (context) ->
      setEncoding()
      code = context.getCode()
      tmpFile = GrammarUtils.createTempFileWithCode(code)
      return [tmpFile]

  'File Based':
    command: 'sage'
    args: ({filepath}) ->
      setEncoding()
      return [filepath]
