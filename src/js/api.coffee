###
 * API Documentation JS
 * Copyright (c) 2013 Alex Williams, Unscramble <license@unscramble.jp>
 * https://github.com/unscramble/jidoteki-api-docs
###

# Switch the language when a language button is clicked
switchLangListener = ->
  $('button.language').click ->
    # hide all prettyprint <pre> tags, show the selected language only
    $('pre.prettyprint').hide()
    $("pre.lang-#{@title}").show()

    # highlight only the selected language button
    $('button.language').attr 'class', 'language'
    $(@).attr 'class', 'language selected'

    # don't animate, just jump to the proper anchor
    window.location.hash = "##{scrolling.currentSection}" if scrolling.currentSection isnt undefined
    $root.stop().scrollTop($("##{scrolling.currentSection}").offset().top - 116)
  return false

# Dynamically load the languages
addLanguages = ->
  pushLang = (lang, x) ->
    selected = if x is 0 then " selected" else ""
    $('#language').append "<button class=\"language#{selected}\" title=\"#{lang}\">#{lang}</a>"

  pushLang lang, x for lang, x in languagesArray
  switchLangListener()

# Dynamically load the left-menu
loadLeftMenu = ->
  $('#menu').load 'menu.html'

# Scroll to a section
scrollToSection = (href) ->
  scroll = { 'scrollTop': $(href).offset().top - 116 }
  $root.stop().animate scroll, 500, 'swing', ->
    window.location.hash = href
  return false

# Scroll to a section when a menu item is clicked
scrollToSectionListener = ->
  $('ul.menu-list li.section a').click ->
    href = $.attr @, 'href'

    $('ul.menu-list li.section a').removeAttr 'class'
    $(@).attr 'class', 'viewing'

    scrollToSection href

# Load all the sections
loadSections = ->
  curFile = 0
  for section in sectionsArray
    loadFile section, (results) ->
      curFile++
      appendSections curFile

# Dynamically load a section-*.html file
sections = {}
loadFile = (file, callback) ->
  $(@).load "section-#{file}.html", (response) ->
    sections[file] = response
    console.log "Loaded file: section-#{file}.html"
    callback(response)

# Append the section to the #sections div
appendSections = (curFile) ->
  if curFile == sectionsArray.length
    for s in sectionsArray
      $('#sections').append sections[s]
    console.log "  Finished loading all the things!"
    $('pre').each (i,e) ->
      hljs.highlightBlock e
    scrollToSectionListener()
    if window.location.hash isnt ''
      scrollToSection window.location.hash if window.location.hash isnt ''
    # By default we should hide ALL the languages except the first one
    $('pre.prettyprint').hide()
    $("pre.lang-#{languagesArray[0]}").show()

# Change the highlighted menu section when scrolling
scrolling = {}
$(document).scroll ->
  position = $(window).scrollTop()

  $('div.method-description h1').each ->
    offset = $(@).offset().top
    height = $(@).parent().parent().height() - 116

    if offset + height > position
      href = $(@).attr 'id'
      $('ul.menu-list li.section a').removeAttr 'class'
      $("a[href=\"##{href}\"]").attr 'class', 'viewing'
      scrolling.currentSection = href
      return false

$root = $('html, body')
addLanguages()
loadLeftMenu()
loadSections()
