@echo off

rem ==
rem ==   This copies a file over via scp, then "start"s it.
rem ==   The file is copied to a temporary directory, so you don't have to worry about it.
rem ==   It's a quick way to view a remote file.
rem ==


rem == get the current date/time as a uniqueID
for /f "skip=1" %%x in ('wmic os get localdatetime') do mydate set mydate=%%x

cd %TEMP%
mkdir %mydate%
cd %mydate%
pscp %1 .

for %%F in (*) do (
    start %%F
)
