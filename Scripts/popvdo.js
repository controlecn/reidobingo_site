// ---------------------------------------------------
// ©1999-2002 Virtware.net - all rights reserved
// written by Vander Nunes
// ---------------------------------------------------

function popvdo(loc, name, w,h, vw,vh)
{
 var cmd = "width="+ w +", height="+ h +", status=no, toolbar=no";
 var pop = window.open("vdo.php?video=" + loc + "&w=" + vw + "&h=" + vh, name, cmd);
}
