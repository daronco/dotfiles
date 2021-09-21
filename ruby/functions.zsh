rdoc2md() {
    ruby -r rdoc -e "puts RDoc::Markup::ToMarkdown.new.convert File.read(\"$1\")";
}
