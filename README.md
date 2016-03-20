[![Build Status](https://travis-ci.org/lispnik/newproject.svg?branch=master)](https://travis-ci.org/lispnik/newproject)

newproject
==========

A file, directory, filter based template approach to new project creation.

Usage
-----

There are three entry points in the NEWPROJECT

 * CREATE-PROJECT-FROM-BUILTIN
 * CREATE-PROJECT
 * NEWPROJECT

CREATE-PROJECT-FROM-BUILTIN
---------------------------

    NEWPROJECT> (create-project-from-builtin "fooproject" :destination-root #p"/tmp/foo/")
    Copying newproject/templates/default/@name@-test.asd -> /tmp/foo/fooproject-test.asd
    Copying newproject/templates/default/@name@.asd -> /tmp/foo/fooproject.asd
    Copying newproject/templates/default/@name@.lisp -> /tmp/foo/fooproject.lisp
    Copying newproject/templates/default/README -> /tmp/foo/README
    Copying newproject/templates/default/packages.lisp -> /tmp/foo/packages.lisp
    Copying newproject/templates/default/test/@name@.lisp -> /tmp/foo/test/fooproject.lisp
    Copying newproject/templates/default/test/packages.lisp -> /tmp/foo/test/packages.lisp
    Copying newproject/templates/default/test/suites.lisp -> /tmp/foo/test/suites.lisp
    Copying newproject/templates/default/test/ -> /tmp/foo/test/
    Copying newproject/templates/default/ -> /tmp/foo/
    ; No value

CREATE-PROJECT
--------------

    (create-project "fooproject" :destination-root #p"/tmp/foo/" :template-name "example" :template-root #p"/tmp/")

NEWPROJECT
----------

    NEWPROJECT> (newproject)

        ╭──╮
        │  │     ╭────────────────────────────────────────╮
        @  @     │ Hi! It looks like you're creating a    │
        ││ │/  ──┤ new project...                         │
        ││ ││    ╰────────────────────────────────────────╯
        │╰─╯│
        ╰───╯

    Project name?  "foo"
    Destination root pathname? (#P"foo/") #p "/tmp/fooproject/"
    Template name? ("default")

    Copying newproject/templates/default/@name@-test.asd -> /tmp/fooproject/foo-test.asd
    Copying newproject/templates/default/@name@.asd -> /tmp/fooproject/foo.asd
    Copying newproject/templates/default/@name@.lisp -> /tmp/fooproject/foo.lisp
    Copying newproject/templates/default/README -> /tmp/fooproject/README
    Copying newproject/templates/default/packages.lisp -> /tmp/fooproject/packages.lisp
    Copying newproject/templates/default/test/@name@.lisp -> /tmp/fooproject/test/foo.lisp
    Copying newproject/templates/default/test/packages.lisp -> /tmp/fooproject/test/packages.lisp
    Copying newproject/templates/default/test/suites.lisp -> /tmp/fooproject/test/suites.lisp
    Copying newproject/templates/default/test/ -> /tmp/fooproject/test/
    Copying newproject/templates/default/ -> /tmp/fooproject/
    ; No value
