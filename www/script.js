(function(){
if(document.addEventListener){
	var _current = 0;
	var _keys = [38,38,40,40,37,39,37,39,66,65];
	document.addEventListener('keyup', function(_event){
		var _key =  _event.which || _event.keyCode;
		if(_key === _keys[_current]){
			if(_current === 9){
				window.location.href = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ';
			}else{
				++_current;
			}
		}else{
			if(!(_current <= 2 && _key === 38)){
				_current = 0;
			}
		}
	});
}
})();
