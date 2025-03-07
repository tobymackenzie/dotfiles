(function(){
if(document.addEventListener && document.querySelector){
	var _current = 0;
	var _keys = [38,38,40,40,37,39,37,39,66,65];
	document.addEventListener('keyup', function(_event){
		var _key =  _event.which || _event.keyCode;
		if(_key === _keys[_current]){
			if(_current === 9){
				var d = document.querySelector('html').style;
				if(!d.transform){
					d.transform = 'rotate(180deg)';
				}else{
					d.transform = '';
				}
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
