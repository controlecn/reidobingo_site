// ---------------------------------------------------
// ©1999-2002 Virtware.net - all rights reserved
// written by Vander Nunes
// ---------------------------------------------------

function popup(loc, name, w,h)
{
 var cmd = "width="+ w +", height="+ h +", status=no, toolbar=no";
 var pop = window.open(loc, name, cmd);
}
