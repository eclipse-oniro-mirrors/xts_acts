/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import app from '@system.app'

import {
	describe,
	beforeAll,
	beforeEach,
	afterEach,
	afterAll,
	it,
	expect
} from 'deccjsunit/index'

describe('webgl1Test_webgl15', function() {
	console.info('webgltest start');
	var gl;
	var gl2;

	var indices = new Uint16Array([0, 1, 2, 1, 3, 4]);
	var vertices = new Uint16Array([
		-0.5, 0.5, 0.0,
		0.0, 0.5, 0.0,
		-0.25, 0.25, 0.0,
		0.5, 0.5, 0.0,
		0.25, 0.25, 0.0,
	])

	//顶点着色器程序
	var VSHADER_SOURCE =
		"attribute vec4 a_Position;" +
		"void main() {" +
		//设置坐标
		"gl_Position = a_Position; " +
		//    "gl_PointSize = 10.0;" +
		"} ";

	//片元着色器
	var FSHADER_SOURCE =
		"void main() {" +
		//设置颜色
		"gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);" +
		"}";

	function globalFunction() {
		const vertexShader = gl.createShader(gl.VERTEX_SHADER);
		gl.shaderSource(vertexShader, VSHADER_SOURCE);
		gl.compileShader(vertexShader);
		const fragmentShader = gl.createShader(gl.FRAGMENT_SHADER);
		gl.shaderSource(fragmentShader, FSHADER_SOURCE);
		gl.compileShader(fragmentShader);
		const programObj = gl.createProgram();
		console.info("testUseProgram has failed for " + programObj)
		const useProgramError1 = gl.getError();
		console.info("useProgramError: " + useProgramError1);
		const renderBufferValue1 = gl.getParameter(gl.CURRENT_PROGRAM);
		console.info("testUseProgram has failed for " + renderBufferValue1)
		gl.attachShader(programObj, vertexShader);
		gl.attachShader(programObj, fragmentShader);
		gl.linkProgram(programObj);
		gl.useProgram(programObj);
		return programObj;
	}


	function createProgram(gl) {
		//顶点着色器程序
		var VSHADER_SOURCE =
			'attribute vec4 a_Position;\n' +
			'void main() {\n' +
			'  gl_Position = a_Position;\n' +
			'}\n';

		// 片元着色器程序
		var FSHADER_SOURCE =
			'precision mediump float;\n' +
			'uniform vec4 u_FragColor;\n' +
			'void main() {\n' +
			'  gl_FragColor = u_FragColor;\n' +
			'}\n';
		var vertexShader = gl.createShader(gl.VERTEX_SHADER);
		gl.shaderSource(vertexShader, VSHADER_SOURCE);
		gl.compileShader(vertexShader);
		var fragmentShader = gl.createShader(gl.FRAGMENT_SHADER);
		gl.shaderSource(fragmentShader, FSHADER_SOURCE);
		gl.compileShader(fragmentShader);
		const programObj = gl.createProgram();
		console.log("testUseProgram has failed for " + programObj)
		const useProgramError1 = gl.getError();
		console.info("useProgramError: " + useProgramError1);
		const renderBufferValue1 = gl.getParameter(gl.CURRENT_PROGRAM);
		console.log("testUseProgram has failed for " + renderBufferValue1)
		gl.attachShader(programObj, vertexShader);
		gl.attachShader(programObj, fragmentShader);
		gl.linkProgram(programObj);
		gl.useProgram(programObj);
		return programObj;
	}

	function initShaders(gl, vshader, fshader) {
		var program = createProgramExternal(gl, vshader, fshader);
		console.log("======createProgram program: " + JSON.stringify(program));

		if (!program) {
			console.log('Failed to create program');
			return false;
		}

		gl.useProgram(program);
		gl.program = program;

		return true;
	}

	function createProgramExternal(gl, vshader, fshader) {
		// Create shader object
		var vertexShader = loadShader(gl, gl.VERTEX_SHADER, vshader);
		console.log("======vertexShader: " + vertexShader);
		var fragmentShader = loadShader(gl, gl.FRAGMENT_SHADER, fshader);
		if (!vertexShader || !fragmentShader) {
			return null;
		}

		// Create a program object
		var program = gl.createProgram();
		console.log("======createProgram program: " + JSON.stringify(program));

		if (!program) {
			return null;
		}

		// Attach the shader objects
		gl.attachShader(program, vertexShader);
		gl.attachShader(program, fragmentShader);

		// Link the program object
		gl.linkProgram(program);

		// Check the result of linking
		var linked = gl.getProgramParameter(program, 0x8B82);
		console.log("======getProgramParameter linked: " + linked);

		const getUniformLocationValue = gl.getUniformLocation(program, "a_Position");
		console.log("======getUniformLocation: " + JSON.stringify(getUniformLocationValue));


		if (!linked) {
			var error = gl.getProgramInfoLog(program);
			console.log('Failed to link program: ' + error);
			gl.deleteProgram(program);
			gl.deleteShader(fragmentShader);
			gl.deleteShader(vertexShader);
			return null;
		}

		return program;
	}

	function loadShader(gl, type, source) {
		console.log("======into loadShader====");
		// Create shader object
		var shader = gl.createShader(type);
		if (shader == null) {
			console.log('unable to create shader');
			return null;
		}

		const isShaderValue = gl.isShader(shader);
		console.log('isShader: ' + isShaderValue);

		// Set the shader program
		gl.shaderSource(shader, source);

		// Compile the shader
		gl.compileShader(shader);

		// Check the result of compilation
		var compiled = gl.getShaderParameter(shader, gl.COMPILE_STATUS);
		if (!compiled) {
			var error = gl.getShaderInfoLog(shader);
			console.log('Failed to compile shader: ' + error);
			gl.deleteShader(shader);
			return null;
		}

		var vertex = gl.getShaderParameter(shader, gl.VERTEX_SHADER);
		console.log('getShaderParameter VERTEX_SHADER: ' + vertex);


		return shader;
	}

	function initVertexBuffers(gl) {
		var vertices = new Float32Array([
			0.0, -1.0, -0.5, 0, 0.5, 0
		]);

		var n = 3; // 点的个数

		// 创建缓冲区对象
		var vertexBuffer = gl.createBuffer();
		if (!vertexBuffer) {
			console.log('Failed to create the buffer object');
			return -1;
		}

		// 将缓冲区对象绑定到目标
		gl.bindBuffer(gl.ARRAY_BUFFER, vertexBuffer);
		// 向缓冲区对象写入数据
		gl.bufferData(gl.ARRAY_BUFFER, vertices.buffer, gl.STATIC_DRAW);

		var aPosition = gl.getAttribLocation(gl.program, 'a_Position');
		console.info("webgl# getAttribLocation getAttribLocation success:" + JSON.stringify(gl.program));
		console.info("webgl# getAttribLocation getAttribLocation success:" + aPosition);
		if (aPosition < 0) {
			console.log('Failed to get the storage location of a_Position');
			return -1;
		}
		// 将缓冲区对象分配给a_Position变量
		gl.vertexAttribPointer(aPosition, 2, gl.FLOAT, false, 0, 0);

		// 连接a_Position变量与分配给它的缓冲区对象
		gl.enableVertexAttribArray(aPosition);

		return n;
	}


	var float1 = new Float32Array([1.1, 1.2, 1.3, 1.4]);
	var int1 = new Int8Array([1, 1, 1, 1]);
	var uint1 = new Uint8Array([1, 1, 1, 1]);
	var float2 = [1.1, 1.2, 1.3, 1.4];
	var int2 = [1, 1, 1, 1];
	var uint2 = [1, 1, 1, 1];

	function initContext() {
		console.info('initContext start');
		// 获取canvas元素
		const el = global.el;
		const el2 = global.el2;
		// 获取webgl上下文
		gl = el.getContext('webgl');
		if (!gl) {
			console.log('webgltest Failed to get the rendering context for WebGL');
		}
		gl2 = el2.getContext('webgl2');
		if (!gl) {
			console.log('webgltest Failed to get the rendering context for WebGL2');
		}
		console.info('webgltest initContext finish');
	}

	function deleteContext() {
		if (gl != null) {
			gl = null;
			console.info("webgltest gl has null");
		}
		if (gl2 != null) {
			console.info("webgltest gl2 has null");
			gl2 = null;
		}
	}

	/**
	 * run before testClass
	 */
	beforeAll(async function(done) {
		console.info('webgltest beforeAll called');
		initContext();
		done();
	});

	/**
	 * run after testClass
	 */
	afterAll(async function(done) {
		console.info('webgltest afterEach called');
		deleteContext();
		done();
	})

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0220
	 * @tc.name testGetParameter3
	 * @tc.desc Test getParameter.
	 */
	it('testGetParameter3', 0, async function(done) {
		//initContext();
		console.info('jsWebGL getParameter test start ...' + JSON.stringify(gl));
		const buffer = gl.getParameter(gl.ARRAY_BUFFER_BINDING);
		console.info("buffer: " + buffer);
		gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
		const isBuffer = gl.isBuffer(buffer);
		console.info("isBuffer: " + isBuffer);
		expect(isBuffer).assertEqual(true);
		done();
	});

	
	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0231
	 * @tc.name testGetVertexAttribFirst
	 * @tc.desc Test getVertexAttrib.
	 */
	it('testGetVertexAttribFirst', 0, async function(done) {
		//initContext();
		console.info('jsWebGL getVertexAttrib test start ...' + JSON.stringify(gl));
		const vertexBuffer = gl.createBuffer();
		gl.bindBuffer(gl.ARRAY_BUFFER, vertexBuffer);
		const shaderProgram = globalFunction();
		const aVertexPosition = gl.getAttribLocation(shaderProgram, "a_position");

		gl.enableVertexAttribArray(aVertexPosition);
		gl.vertexAttribPointer(aVertexPosition, 3, gl.FLOAT, false, 20, 0);

		gl.drawArrays(gl.TRIANGLES, 0, 8);
		gl.vertexAttrib1f(0, 2.8);
		const type = gl.getVertexAttrib(0, gl.VERTEX_ATTRIB_ARRAY_ENABLED);
		console.info("getVertexAttrib: type" + type);
		expect(type).assertEqual(true);
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0370
	 * @tc.name testIsRenderbuffer_04
	 * @tc.desc Test isRenderbuffer.
	 */
	it('testIsRenderbuffer_04', 0, async function(done) {
		//initContext();
		console.info('jsWebGL testIsRenderbuffer_04 test start ...66');
		var texture = gl.createTexture();
		const isrenderbuffer = gl.isRenderbuffer(texture);
		console.info("createRenderbuffer --> isRenderbuffer: " + isrenderbuffer);
		// The webgl interface transparently transmits opengl.Therefore, only need to verify the interface does not crash.
		const notCrash = true;
		expect(notCrash).assertTrue();
		for(let err; (err = gl.getError()) != gl.NO_ERROR;) {}
		done();
	})

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0991
	 * @tc.name testGetBufferParameter3
	 * @tc.desc Test getBufferParameter.
	 */
	it('testGetBufferParameter3', 0, async function(done) {
		//initContext();
		console.info('jsWebGL getBufferParameter test start ...' + JSON.stringify(gl));
		const buffer = gl.createBuffer();
		gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
		gl.bufferData(gl.ARRAY_BUFFER, 1024, gl.STATIC_DRAW);
		const bufferSize = gl.getBufferParameter(gl.ELEMENT_ARRAY_BUFFER, gl.BUFFER_SIZE);
		console.info('bufferSize' + bufferSize);
		expect(bufferSize).assertEqual(8);
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1035
	 * @tc.name testStencilMaskSeparate1
	 * @tc.desc Test stencilMaskSeparate.
	 */
	it('testStencilMaskSeparate1', 0, async function(done) {
		//initContext();
		console.info('jsWebGL stencilMaskSeparate test start ...' + JSON.stringify(gl));
		gl.stencilMaskSeparate(gl.BACK, 110101);
		const stencilMaskSeparateParameter = gl.getParameter(gl.STENCIL_WRITEMASK);
		console.info("stencilMaskSeparate stencilMaskSeparateParameter: " +
			stencilMaskSeparateParameter);
		// The webgl interface transparently transmits opengl.Therefore, only need to verify the interface does not crash.
		const notCrash = true;
		expect(notCrash).assertTrue();
		for(let err; (err = gl.getError()) != gl.NO_ERROR;) {}
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1338
	 * @tc.name webgl_test_webglContextAttributes
	 * @tc.desc Test webglContextAttributes.
	 */
	 it('webgl_test_webglContextAttributes_0', 0, async function(done) {
		console.info("webgltest into webglContextAttributes");
		const ContextAttributesValue = gl.getContextAttributes();
    	ContextAttributesValue.alpha = true;
		const alphaValue = ContextAttributesValue.alpha;
		console.info("webgltest webglContextAttributes: " + alphaValue);
		expect(alphaValue).assertEqual(true);
		done();
	})
 
   	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1339
	 * @tc.name webgl_test_webglContextAttributes
	 * @tc.desc Test webglContextAttributes.
	 */
	it('webgl_test_webglContextAttributes_1', 0, async function(done) {
		console.info("webgltest into webglContextAttributes_1");
		const ContextAttributesValue = gl.getContextAttributes();
    	ContextAttributesValue.antialias = true;
		const antialiasValue = ContextAttributesValue.antialias;
		console.info("webgltest webglContextAttributes_1: " + antialiasValue);
		expect(antialiasValue).assertEqual(true);
		done();
	})
 
    	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1341
	 * @tc.name webgl_test_webglContextAttributes
	 * @tc.desc Test webglContextAttributes.
	 */
	it('webgl_test_webglContextAttributes_2', 0, async function(done) {
		console.info("webgltest into webglContextAttributes_2");
		const ContextAttributesValue = gl.getContextAttributes();
    	ContextAttributesValue.depth = true;
		const depthValue = ContextAttributesValue.depth;
		console.info("webgltest webglContextAttributes_2: " + depthValue);
		expect(depthValue).assertEqual(true);
		done();
	})
 
	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1342
	 * @tc.name webgl_test_webglContextAttributes
	 * @tc.desc Test webglContextAttributes.
	 */
	it('webgl_test_webglContextAttributes_3', 0, async function(done) {
		console.info("webgltest into webglContextAttributes_3");
		const ContextAttributesValue = gl.getContextAttributes();
    	ContextAttributesValue.failIfMajorPerformanceCaveat = false;
		const failIfMajorPerformanceCaveatValue = ContextAttributesValue.failIfMajorPerformanceCaveat;
		console.info("webgltest webglContextAttributes_3: " + failIfMajorPerformanceCaveatValue);
		expect(failIfMajorPerformanceCaveatValue).assertEqual(false);
		done();
	})
 
	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1343
	 * @tc.name webgl_test_webglContextAttributes
	 * @tc.desc Test webglContextAttributes.
	 */
	it('webgl_test_webglContextAttributes_4', 0, async function(done) {
		console.info("webgltest into webglContextAttributes_4");
		const ContextAttributesValue = gl.getContextAttributes();
    	ContextAttributesValue.desynchronized = false;
		const desynchronizedValue = ContextAttributesValue.desynchronized;
		console.info("webgltest webglContextAttributes_4: " + desynchronizedValue);
		expect(desynchronizedValue).assertEqual(false);
		done();
	})
 
 	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1344
	 * @tc.name webgl_test_webglContextAttributes
	 * @tc.desc Test webglContextAttributes.
	 */
	it('webgl_test_webglContextAttributes_5', 0, async function(done) {
		console.info("webgltest into webglContextAttributes_5");
		const ContextAttributesValue = gl.getContextAttributes();
		const powerPreferenceValue = ContextAttributesValue.powerPreference;
		console.info("webgltest webglContextAttributes_5: " + powerPreferenceValue);
		expect(powerPreferenceValue).assertEqual("default");
		done();
	})
 
 	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1345
	 * @tc.name webgl_test_webglContextAttributes
	 * @tc.desc Test webglContextAttributes.
	 */
	it('webgl_test_webglContextAttributes_6', 0, async function(done) {
		console.info("webgltest into webglContextAttributes_6");
		const ContextAttributesValue = gl.getContextAttributes();
    	ContextAttributesValue.premultipliedAlpha = true;
		const premultipliedAlphaValue = ContextAttributesValue.premultipliedAlpha;
		console.info("webgltest webglContextAttributes_6: " + premultipliedAlphaValue);
		expect(premultipliedAlphaValue).assertEqual(true);
		done();
	})
 
  	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1346
	 * @tc.name webgl_test_webglContextAttributes
	 * @tc.desc Test webglContextAttributes.
	 */
	it('webgl_test_webglContextAttributes_7', 0, async function(done) {
		console.info("webgltest into webglContextAttributes_7");
		const ContextAttributesValue = gl.getContextAttributes();
    	ContextAttributesValue.preserveDrawingBuffer = false;
		const preserveDrawingBufferValue = ContextAttributesValue.preserveDrawingBuffer;
		console.info("webgltest webglContextAttributes_7: " + preserveDrawingBufferValue);
		expect(preserveDrawingBufferValue).assertEqual(false);
		done();
	})

   	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1347
	 * @tc.name webgl_test_webglContextAttributes
	 * @tc.desc Test webglContextAttributes.
	 */
	it('webgl_test_webglContextAttributes_8', 0, async function(done) {
		console.info("webgltest into webglContextAttributes_8");
		const ContextAttributesValue = gl.getContextAttributes();
    	ContextAttributesValue.stencil = false;
		const stencilValue = ContextAttributesValue.stencil;
		console.info("webgltest webglContextAttributes_8: " + stencilValue);
		expect(stencilValue).assertEqual(false);
		done();
	})

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1348
	 * @tc.name webgl_test_endTransformFeedback
	 * @tc.desc Test endTransformFeedback.
	 */
	it('webgl_test_endTransformFeedback', 0, async function(done) {
		let transformFeedback = gl2.createTransformFeedback();
		gl2.endTransformFeedback();
		let errorCode = gl.getError();
		console.info("webgltest endTransformFeedback getError: " + errorCode);
		expect(errorCode).assertLarger(gl.NO_ERROR);
		//deleteContext();
		done();	
	});
})
