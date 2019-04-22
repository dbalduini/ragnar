# Configuration file for ipython-notebook.

c = get_config()

# The IP address the notebook server will listen on.
c.NotebookApp.ip = '0.0.0.0'

# The port the notebook server will listen on.
c.NotebookApp.port = 8888

# Whether to open in a browser after starting.
c.NotebookApp.open_browser = False

# Whether to allow the user to run the notebook as root.
c.NotebookApp.allow_root = True

# Token used for authenticating first-time connections to the server.
# Setting to an empty string disables authentication altogether
c.NotebookApp.token = u''
