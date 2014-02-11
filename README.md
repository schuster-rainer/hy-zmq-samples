# What is it?

Just some zmq samples translated to hy

# How to install?

It best to run hy and the samples in a virtual environment

    virtualenv hy
    . ./hy/bin/activate

Now it depends on how you would like to deal with hy.
If you would like to use the released packages on pypi.python.org
just install the requirements and you are ready, which will install
hy and zmq 

    pip install -r requirements.rst

or if you like to have the latest master instead of the requirements
you could either:

    pip install -e+git:https://github.com/hylang/hy.git#hy

 or my recommended way, because you can just update hy by git pull:

    git clone https://github.com/hylang/hy.git
    cd ./hy
    pip install -e . 

# How to run the samples

Once setup you have to source your virtual environment

    . ./hy/bin/activate

Every script has a shebang. Either add execution permissions and run
as script

    ./some_sample.hy

or just use the hy interpreter

   hy some_sample.hy


## TIPP

If you are an advanced pythonista you probably know virtualenvwrapper for
easier virtualenv handling. If not already have a look at it. This will boost 
your productivity

# Resources

http://hylang.org/ 
http://learning-0mq-with-pyzmq.readthedocs.org/en/latest/
https://github.com/zeromq/pyzmq/tree/master/examples
http://zeromq.github.io/pyzmq/
http://www.pip-installer.org/
http://virtualenvwrapper.readthedocs.org/en/latest/
