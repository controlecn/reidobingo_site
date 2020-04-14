// ---------------------------------------------------
// ©1999-2002 Virtware.net - all rights reserved
// written by Vander Nunes
// ---------------------------------------------------

var NS,IE;

IE = (document.all ? true : false);
NS = !IE;

function mOver(src,clrOver)
{
 if (!src.contains(event.fromElement))
 {
  src.style.cursor = 'hand';
  src.bgColor = clrOver;
 }
}

function mOut(src,clrIn)
{
 if (!src.contains(event.toElement))
 {
  src.style.cursor = 'default';
  src.bgColor = clrIn;
 }
}

function mClik(src)
{
 if (event.srcElement.tagName=='TD')
 {
  ia = src.children.tags('A');
  if (ia.length>0) ia[0].click(); else alert("humm???");
 }
}

function swapImage(imgName, imgSrc)
{
  document[imgName].src = imgSrc;
}
