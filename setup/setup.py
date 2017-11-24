from distutils.core import setup

setup(name = "hoodlib",
      description = "Tools for Data Science at Hoodline",
      author = "Aniket Aranake",
      author_email = "aniket@hoodline.com",
      version = "1.1",
      packages = ['hoodlib',
                  'hoodlib.APIrequests',
                  'hoodlib.factors',
                  'hoodlib.featureeng',
                  'hoodlib.SQLtools',
                  'hoodlib.textprocessing',
                  'hoodlib.visualization',
                  'hoodlib.wordsmith']
     )
