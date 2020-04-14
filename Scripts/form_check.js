// ---------------------------------------------------
// ©1999-2002 Virtware.net - all rights reserved
// written by Vander Nunes
// ---------------------------------------------------

  function trim(str)
  {
     return str.replace(/^\s*|\s*$/g,"");
  }


  // nomes dos campos requeridos devem começar com "req_"
  function checkRequired(which)
  {
    var pass=true;
    if (document.images)
    {
      for (i=0;i<which.length;i++)
      {
        var tempobj=which.elements[i];
        if (tempobj.name.substring(0,4)=="req_")
        {
          if (((tempobj.type=="text"||tempobj.type=="textarea")&&trim(tempobj.value)=='')||(tempobj.type.toString().charAt(0)=="s"&&tempobj.selectedIndex==-1))
          {
            pass=false;
            break;
          }
        }
      }
    }

    if (!pass)
    {
      alert("Some required fields were not filled in!")
      return false;
    }
    else
      return true;
  }


  // verifica se duas senhas são iguais
  function checkPass(p1, p2)
  {
    if (p1 != p2)
    {
      alert("Passwords does not match.");
      return false;
    }

    return true;
  }
