@ECHO OFF

SETLOCAL
SET PATH=%PATH%;C:\Program Files\Puppet Labs\Puppet Enterprise\bin

pushd ..\
puppet apply %* --basemodulepath=C:\Users\rupio\Dev\puppet .\examples\init.pp
popd

ENDLOCAL
