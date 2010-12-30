/* JavaScript Document
	Completely borrowed from dev edge
	Helps control the font size.
*/
function ndeSetTextSize(chgsize,rs) 
{
  if (!document.documentElement || !document.body)
  {
    return;
  }

  var newSize;
  var startSize = parseInt(ndeGetDocTextSize());

  if (!startSize)
  {
    startSize = 12;
  }

  switch (chgsize)
  {
  case 'incr':
    newSize = startSize + 2;
    break;

  case 'decr':
    newSize = startSize - 2;
    break;

  case 'reset':
    if (rs) 
    {
      newSize = rs;
    } 
    else 
    {
      newSize = 12;
    }
    break;

  default:
    newSize = parseInt(ndeReadCookie('nde-textsize', true));
    if (!newSize)
    {
      newSize = startSize;
    }
    break;

  }

  if (newSize < 10) 
  {
    newSize = 10;
  }

  newSize += 'px';

  document.documentElement.style.fontSize = newSize;
  document.body.style.fontSize = newSize;

  // ndeCreateCookie('nde-textsize', newSize, 365, true);
}

function ndeGetDocTextSize() 
{
  if (!document.body)
  {
    return 0;
  }

  var size = 0;
  var body = document.body;

  if (body.style && body.style.fontSize)
  {
    size = body.style.fontSize;
  }
  else if (typeof(getComputedStyle) != 'undefined')
  {
    size = getComputedStyle(body,'').getPropertyValue('font-size');
  }
  else if (body.currentStyle)
  {
    size = body.currentStyle.fontSize;
  }
  return size;
}

function ndeCreateCookie(name,value,days,useLang) 
{
  var langString = useLang ? ndeGetLang() : '';

  var cookie = name + langString + '=' + value + ';';

  if (days) 
  {
    var date = new Date();
    var ndeMilliSecondsInDay = 86400000; // 24*60*60*1000
    date.setTime(date.getTime()+(days*ndeMilliSecondsInDay));
    cookie += ' expires=' + date.toGMTString() + ';';
  }
  cookie += ' path=/';

  document.cookie = cookie;
}