from flask import Flask
app = Flask(__name__)

def wrapviz(title,embedhtml):
    htmlunit = "<h3>"+title+"</h3><br />"
    htmlunit += embedhtml+"<br /><hr /><br />"
    return htmlunit

@app.route("/")
def basictableauviz():
    #I have to paste in these embed snippets, and Find and Replace " ' " -> " \' " to escape single quotes. It works...for now.
    t1 = "<div class=\'tableauPlaceholder\' id=\'viz1562616608121\' style=\'position: relative\'><noscript><a href=\'#\'><img alt=\' \' src=\'https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;8T&#47;8TB559D4B&#47;1_rss.png\' style=\'border: none\' /></a></noscript><object class=\'tableauViz\'  style=\'display:none;\'><param name=\'host_url\' value=\'https%3A%2F%2Fpublic.tableau.com%2F\' /> <param name=\'embed_code_version\' value=\'3\' /> <param name=\'path\' value=\'shared&#47;8TB559D4B\' /> <param name=\'toolbar\' value=\'yes\' /><param name=\'static_image\' value=\'https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;8T&#47;8TB559D4B&#47;1.png\' /> <param name=\'animate_transition\' value=\'yes\' /><param name=\'display_static_image\' value=\'yes\' /><param name=\'display_spinner\' value=\'yes\' /><param name=\'display_overlay\' value=\'yes\' /><param name=\'display_count\' value=\'yes\' /></object></div>                <script type=\'text/javascript\'>                    var divElement = document.getElementById(\'viz1562616608121\');                    var vizElement = divElement.getElementsByTagName(\'object\')[0];                    vizElement.style.width=\'1016px\';vizElement.style.height=\'991px\';                    var scriptElement = document.createElement(\'script\');                    scriptElement.src = \'https://public.tableau.com/javascripts/api/viz_v1.js\';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>"

    t2 = "<div class=\'tableauPlaceholder\' id=\'viz1562620507189\' style=\'position: relative\'><noscript><a href=\'#\'><img alt=\' \' src=\'https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;PQ&#47;PQZMHJ6GN&#47;1_rss.png\' style=\'border: none\' /></a></noscript><object class=\'tableauViz\'  style=\'display:none;\'><param name=\'host_url\' value=\'https%3A%2F%2Fpublic.tableau.com%2F\' /> <param name=\'embed_code_version\' value=\'3\' /> <param name=\'path\' value=\'shared&#47;PQZMHJ6GN\' /> <param name=\'toolbar\' value=\'yes\' /><param name=\'static_image\' value=\'https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;PQ&#47;PQZMHJ6GN&#47;1.png\' /> <param name=\'animate_transition\' value=\'yes\' /><param name=\'display_static_image\' value=\'yes\' /><param name=\'display_spinner\' value=\'yes\' /><param name=\'display_overlay\' value=\'yes\' /><param name=\'display_count\' value=\'yes\' /></object></div>                <script type=\'text/javascript\'>                    var divElement = document.getElementById(\'viz1562620507189\');                    var vizElement = divElement.getElementsByTagName(\'object\')[0];                    vizElement.style.width=\'100%\';vizElement.style.height=(divElement.offsetWidth*0.75)+\'px\';                    var scriptElement = document.createElement(\'script\');                    scriptElement.src = \'https://public.tableau.com/javascripts/api/viz_v1.js\';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>"

    h1 = wrapviz("Basic Tableau Storyboard1",t1)
    h2 = wrapviz("A second visualization", t2)

    return h1+h2

if __name__ == "__main__":
    app.run()
