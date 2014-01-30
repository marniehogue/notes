## Using PyTest

 1. Install `pytest` (using pip)
 1. Create directory `test`
 1. In `test` place any testing programs, each of which is named beginning with `test_`.
 1. In each such program, `import pytest`.
 1. Run at the command line:
 
        py.test

    PyTest will find and run all properly named tests in `test`. 

 1. Tests are reported one per function, even if multiple acts of testing are conducted within a function.
 1. The most basic test is an `assert` statement.

[nd]