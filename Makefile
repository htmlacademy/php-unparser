program: lint index

index:
	sed -i -n '1,/^\/\/ node translators/ p' node_translators/index.js
	ls node_translators/|sed -n '/index.js/ !{ s/\([^\.]*\)\.js/CodeGen.prototype.\1 = require(".\/\1\.js");/p }' >> node_translators/index.js
lint:
	node_modules/jslint/bin/jslint.js --indent 2 --color package.json index.js node_translators/*.js node_translators/**/*.js
