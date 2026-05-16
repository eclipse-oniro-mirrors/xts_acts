/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';

import {checkError, createProgram, getColorUint8Array} from './WebGL1';


export default function webgl1_texture() {
    
	describe('webgl1_texture', function () {
        let gl = global.gl;
        // Defines a test suite. Two parameters are supported: test suite name and test suite function.
        beforeAll(function () {
            hilog.info(0x0000, 'testTag', '%{public}s', 'webgl1_test_01 start');
            // Presets an action, which is performed only once before all test cases of the test suite start.
            // This API supports only one parameter: preset action function.
        })
        beforeEach(function () {
            // Presets an action, which is performed before each unit test case starts.
            // The number of execution times is the same as the number of test cases defined by **it**.
            // This API supports only one parameter: preset action function.
            checkError(gl);
        })
        afterEach(function () {
            // Presets a clear action, which is performed after each unit test case ends.
            // The number of execution times is the same as the number of test cases defined by **it**.
            // This API supports only one parameter: clear action function.
            checkError(gl);
        })
        afterAll(function () {
            // Presets a clear action, which is performed after all test cases of the test suite end.
            // This API supports only one parameter: clear action function.
            hilog.info(0x0000, 'testTag', '%{public}s', 'webgl1_test_01 end');
        })

        let initShader = (gl, type, source) => {
            let shader = gl.createShader(type); // 创建顶点着色器
            if (shader == null) {
                console.info("webgltest ", 'unable to create shader');
                return null;
            }
            gl.shaderSource(shader, source); // 设置着色器代码
            gl.compileShader(shader);
            let shaderParameter = gl.getShaderParameter(shader, gl.COMPILE_STATUS);
            if (!shaderParameter) {
                let error = gl.getShaderInfoLog(shader);
                console.info("webgltest ", 'failed to compile shader: ' + error);
                gl.deleteShader(shader);
                return null;
            }
            return shader;
        }

        /**
         * 创建并初始化 WebGLTexture 对象
         */

        /**
         * @tc.name   webgl_test_createTexture
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0001
         * @tc.desc   Test createTexture.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_createTexture', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_createTexture] createTexture");
            let texture = gl.createTexture();
            console.info("webgltest ", texture);
            expect(texture != null).assertTrue();
            console.info("webgltest ", "gl.bindTexture(gl.TEXTURE_2D, texture);");
            gl.bindTexture(gl.TEXTURE_2D, texture);
            console.info("webgltest ", "isTexture :", gl.isTexture(texture));
            expect(gl.isTexture(texture)).assertTrue();
            console.info("webgltest ", "gl.deleteTexture(texture);");
            gl.deleteTexture(texture);
            console.info("webgltest ", "isTexture :", gl.isTexture(texture));
            expect(gl.isTexture(texture) == false).assertTrue();
            checkError(gl);
            done();
        })

        /**
         * 如果传递的 WebGLTexture 有效，则 WebGL API 的方法返回 true，否则返回 false。
         */

        /**
         * @tc.name   webgl_test_isTexture
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0002
         * @tc.desc   Test isTexture.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_isTexture', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_isTexture] isTexture");
            let texture = gl.createTexture();
            console.info("webgltest ", texture);
            expect(texture != null).assertTrue();
            console.info("webgltest ", "gl.bindTexture(gl.TEXTURE_2D, texture);");
            gl.bindTexture(gl.TEXTURE_2D, texture);
            console.info("webgltest ", "isTexture :", gl.isTexture(texture));
            expect(gl.isTexture(texture)).assertTrue();
            console.info("webgltest ", "gl.deleteTexture(texture);");
            gl.deleteTexture(texture);
            console.info("webgltest ", "isTexture :", gl.isTexture(texture));
            expect(gl.isTexture(texture) == false).assertTrue();
            checkError(gl);
            done();
        })

        /**
         * WebGL API 的方法删除给定的 WebGLTexture 对象。 如果纹理已被删除，则此方法不起作用。
         */

        /**
         * @tc.name   webgl_test_deleteTexture
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0003
         * @tc.desc   Test deleteTexture.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_deleteTexture', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_deleteTexture] deleteTexture");
            let texture = gl.createTexture();
            console.info("webgltest ", texture);
            expect(texture != null).assertTrue();
            console.info("webgltest ", "gl.bindTexture(gl.TEXTURE_2D, texture);");
            gl.bindTexture(gl.TEXTURE_2D, texture);
            console.info("webgltest ", "isTexture :", gl.isTexture(texture));
            expect(gl.isTexture(texture)).assertTrue();
            console.info("webgltest ", "gl.deleteTexture(texture);");
            gl.deleteTexture(texture);
            console.info("webgltest ", "isTexture :", gl.isTexture(texture));
            expect(gl.isTexture(texture) == false).assertTrue();
            checkError(gl);
            done();
        })

        /**
         * WebGL API 的方法将给定的 WebGLTexture 绑定到目标（绑定点）。
         */

        /**
         * @tc.name   webgl_test_bindTexture
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0004
         * @tc.desc   Test bindTexture.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_bindTexture', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_bindTexture] bindTexture");
            let texture = gl.createTexture();
            console.info("webgltest ", "isTexture :", gl.isTexture(texture));
            expect(gl.isTexture(texture) == false).assertTrue();
            console.info("webgltest ", texture);
            expect(texture != null).assertTrue();
            console.info("webgltest ", "gl.bindTexture(gl.TEXTURE_2D, texture);");
            gl.bindTexture(gl.TEXTURE_2D, texture);
            console.info("webgltest ", "isTexture :", gl.isTexture(texture));
            expect(gl.isTexture(texture)).assertTrue();
            console.info("webgltest ", "gl.deleteTexture(texture);");
            gl.deleteTexture(texture);
            console.info("webgltest ", "isTexture :", gl.isTexture(texture));
            expect(gl.isTexture(texture) == false).assertTrue();
            checkError(gl);
            done();
        })

        /**
         * WebGL API 的方法返回传递的参数名称的值。
         */

        /**
         * @tc.name   webgl_test_activeTexture
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0005
         * @tc.desc   Test activeTexture.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_activeTexture', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_activeTexture] activeTexture");
            let srcActiveTexture = gl.getParameter(gl.ACTIVE_TEXTURE);
            gl.activeTexture(gl.TEXTURE0);
            console.info("webgltest ACTIVE_TEXTURE:", gl.getParameter(gl.ACTIVE_TEXTURE));
            expect(gl.getParameter(gl.ACTIVE_TEXTURE)).assertEqual(gl.TEXTURE0);
            console.info("webgltest  gl.activeTexture(gl.TEXTURE12);");
            gl.activeTexture(gl.TEXTURE12);
            console.info("webgltest ACTIVE_TEXTURE:", gl.getParameter(gl.ACTIVE_TEXTURE));
            expect(gl.getParameter(gl.ACTIVE_TEXTURE)).assertEqual(gl.TEXTURE12);
            gl.activeTexture(srcActiveTexture);
            checkError(gl);
            done();
        })
        /**
         * 返回有关给定纹理的信息
         */

        /**
         * @tc.name   webgl_test_getTexParameter
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0006
         * @tc.desc   Test getTexParameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_getTexParameter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_getTexParameter] getTexParameter");
            let texture = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_2D, texture);
            console.info("webgltest gl.getTexParameter(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER):",
                gl.getTexParameter(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER));
            expect(gl.getTexParameter(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER) == gl.NEAREST_MIPMAP_LINEAR).assertTrue();
            console.info("webgltest gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR)");
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
            console.info("webgltest gl.getTexParameter(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER)",
                gl.getTexParameter(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER));
            expect(gl.getTexParameter(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER) == gl.LINEAR).assertTrue();
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.NEAREST_MIPMAP_LINEAR);
            gl.deleteTexture(texture);
            checkError(gl);
            done();
        })

        /**
         * 设置纹理参数
         */

        /**
         * @tc.name   webgl_test_texParameteri
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0007
         * @tc.desc   Test texParameteri.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texParameteri', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_texParameteri] texParameteri");
            let texture = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_2D, texture);
            console.info("webgltest gl.getTexParameter(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER):",
                gl.getTexParameter(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER));
            expect(gl.getTexParameter(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER) == gl.NEAREST_MIPMAP_LINEAR).assertTrue();
            console.info("webgltest gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR)");
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
            console.info("webgltest gl.getTexParameter(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER)",
                gl.getTexParameter(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER));
            expect(gl.getTexParameter(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER) == gl.LINEAR).assertTrue();
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.NEAREST_MIPMAP_LINEAR);
            gl.deleteTexture(texture);
            checkError(gl);
            done();
        })

        /**
         * 设置纹理参数
         */

        /**
         * @tc.name   webgl_test_texParameterf
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0008
         * @tc.desc   Test texParameterf.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texParameterf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_texParameterf] texParameterf");
            let texture = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_2D, texture);
            console.info("webgltest gl.getTexParameter(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER):",
                gl.getTexParameter(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER));
            expect(gl.getTexParameter(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER) == gl.NEAREST_MIPMAP_LINEAR).assertTrue();
            console.info("webgltest gl.texParameterf(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR)");
            gl.texParameterf(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
            console.info("webgltest gl.getTexParameter(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER)",
                gl.getTexParameter(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER));
            expect(gl.getTexParameter(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER) == gl.LINEAR).assertTrue();
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.NEAREST_MIPMAP_LINEAR);
            gl.deleteTexture(texture);
            checkError(gl);
            done();
        })

        async function texImage2D(callback, finish) {
            let {program, vertexShader, fragmentShader} = createProgram(gl, `
                attribute vec4 a_Position;
                attribute vec2 a_TexCoord;
                varying vec2 v_TexCoord;
                void main(){
                    gl_Position = a_Position;
                    v_TexCoord = a_TexCoord;
                }
            `, `
                precision mediump float;
                precision highp sampler2D;
                uniform sampler2D u_Sampler;
                varying vec2 v_TexCoord;
                void main(){
                    gl_FragColor = texture2D(u_Sampler, v_TexCoord);
                }
            `);
            let arr = new Float32Array([
                -0.5, 0.5, 0.0, 1.0,
                -0.5, -0.5, 0.0, 0.0,
                0.5, 0.5, 1.0, 1.0,
                0.5, -0.5, 1.0, 0.0,
            ]);
            let FSIZE = arr.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer(); // 创建缓冲区
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer); // 绑定缓冲区
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW); // 将数据写入缓冲区对象

            let a_Position = gl.getAttribLocation(gl.program, 'a_Position'); // 获取attribute变量地址
            gl.vertexAttribPointer(a_Position, 2, gl.FLOAT, false, FSIZE * 4, 0); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_Position); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)

            let a_TexCoord = gl.getAttribLocation(gl.program, 'a_TexCoord'); // 获取attribute变量地址
            gl.vertexAttribPointer(a_TexCoord, 2, gl.FLOAT, false, FSIZE * 4, FSIZE * 2); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_TexCoord); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)

            let u_Sampler = gl.getUniformLocation(gl.program, 'u_Sampler');
            let texture = gl.createTexture();

            gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, 1); // 对纹理图像进行y轴反转
            gl.activeTexture(gl.TEXTURE0); // 开启0号纹理单元
            gl.bindTexture(gl.TEXTURE_2D, texture); // 向target绑定纹理对象
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.NEAREST); // 配置纹理参数
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.NEAREST); // 配置纹理参数
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE); // 配置纹理参数
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE); // 配置纹理参数
            const width = 4;
            const height = 4;
            const level = 0;
            const internalFormat = gl.RGBA;
            const format = gl.RGBA;
            const type = gl.UNSIGNED_BYTE;
            const data = new Uint8Array(width * height * 4);
            for (let i = 0; i < data.length; i += 4) {
                data[i] = 0; // 红色通道
                data[i + 1] = 0; // 绿色通道
                data[i + 2] = 255; // 蓝色通道
                data[i + 3] = 255; // Alpha 通道
                if (i > data.length / 2) {
                    data[i] = 255;
                    data[i + 1] = 0;
                    data[i + 2] = 0;
                    data[i + 3] = 255;
                }
            }
            // 将图像数据加载到纹理中
            callback(data);
            finish();
            let err = checkError(gl);
            expect(err).assertEqual(gl.NO_ERROR);
            gl.uniform1i(u_Sampler, 0);
            gl.clearColor(0.92, 0.92, 0.92, 1);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLE_STRIP, 0, arr.length / 4);
            gl.disableVertexAttribArray(a_Position);
            gl.disableVertexAttribArray(a_TexCoord);
            gl.bindTexture(gl.TEXTURE_2D, null);
            gl.bindBuffer(gl.ARRAY_BUFFER, null);
            gl.deleteBuffer(buffer);
            gl.deleteTexture(texture);
            gl.deleteShader(vertexShader);
            gl.deleteShader(fragmentShader);
            gl.deleteProgram(program);
            gl.flush();
        }


        /**
         * @tc.name   webgl_test_texImage2D
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0009
         * @tc.desc   Test texImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texImage2D', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_texImage2D] texImage2D");
            let image = await loadImage();
            let {program, vertexShader, fragmentShader} = createProgram(gl, `
                attribute vec4 a_Position;
                attribute vec2 a_TexCoord;
                varying vec2 v_TexCoord;
                void main(){
                    gl_Position = a_Position;
                    v_TexCoord = a_TexCoord;
                }
            `, `
                precision mediump float;
                precision highp sampler2D;
                uniform sampler2D u_Sampler;
                varying vec2 v_TexCoord;
                void main(){
                    gl_FragColor = texture2D(u_Sampler, v_TexCoord);
                }
            `);
            let arr = new Float32Array([
                -0.5, 0.5, 0.0, 1.0,
                -0.5, -0.5, 0.0, 0.0,
                0.5, 0.5, 1.0, 1.0,
                0.5, -0.5, 1.0, 0.0,
            ]);
            let FSIZE = arr.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer(); // 创建缓冲区
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer); // 绑定缓冲区
            gl.bufferData(gl.ARRAY_BUFFER, arr.buffer, gl.STATIC_DRAW); // 将数据写入缓冲区对象

            let a_Position = gl.getAttribLocation(gl.program, 'a_Position'); // 获取attribute变量地址
            gl.vertexAttribPointer(a_Position, 2, gl.FLOAT, false, FSIZE * 4, 0); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_Position); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)

            let a_TexCoord = gl.getAttribLocation(gl.program, 'a_TexCoord'); // 获取attribute变量地址
            gl.vertexAttribPointer(a_TexCoord, 2, gl.FLOAT, false, FSIZE * 4, FSIZE * 2); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_TexCoord); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)

            let u_Sampler = gl.getUniformLocation(gl.program, 'u_Sampler');
            let texture = gl.createTexture();
            gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, 1); // 对纹理图像进行y轴反转
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.activeTexture(gl.TEXTURE0); // 开启0号纹理单元
            gl.bindTexture(gl.TEXTURE_2D, texture); // 向target绑定纹理对象
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR); // 配置纹理参数
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.NEAREST); // 配置纹理参数
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE); // 配置纹理参数
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE); // 配置纹理参数
            gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, image); // 配置纹理图像
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.uniform1i(u_Sampler, 0); // 将0号纹理传递给着色器
            gl.clearColor(0.92, 0.92, 0.92, 1);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLE_STRIP, 0, arr.length / 4);
            gl.flush();
            gl.disableVertexAttribArray(a_Position);
            gl.disableVertexAttribArray(a_TexCoord);
            gl.bindTexture(gl.TEXTURE_2D, null);
            gl.bindBuffer(gl.ARRAY_BUFFER, null);
            gl.deleteBuffer(buffer);
            gl.deleteTexture(texture);
            gl.deleteShader(vertexShader);
            gl.deleteShader(fragmentShader);
            gl.deleteProgram(program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })

        /**
         * @tc.name   webgl_test_texImage2D_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0011
         * @tc.desc   Test texImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texImage2D_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_texImage2D_2] texImage2D");
            let {program, vertexShader, fragmentShader} = createProgram(gl, `
                attribute vec4 a_Position;
                attribute vec2 a_TexCoord;
                varying vec2 v_TexCoord;
                void main(){
                    gl_Position = a_Position;
                    v_TexCoord = a_TexCoord;
                }
            `, `
                precision mediump float;
                precision highp sampler2D;
                uniform sampler2D u_Sampler;
                varying vec2 v_TexCoord;
                void main(){
                    gl_FragColor = texture2D(u_Sampler, v_TexCoord);
                }
            `);
            let arr = new Float32Array([
                -0.5, 0.5, 0.0, 1.0,
                -0.5, -0.5, 0.0, 0.0,
                0.5, 0.5, 1.0, 1.0,
                0.5, -0.5, 1.0, 0.0,
            ]);
            let FSIZE = arr.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer(); // 创建缓冲区
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer); // 绑定缓冲区
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW); // 将数据写入缓冲区对象

            let a_Position = gl.getAttribLocation(gl.program, 'a_Position'); // 获取attribute变量地址
            gl.vertexAttribPointer(a_Position, 2, gl.FLOAT, false, FSIZE * 4, 0); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_Position); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)

            let a_TexCoord = gl.getAttribLocation(gl.program, 'a_TexCoord'); // 获取attribute变量地址
            gl.vertexAttribPointer(a_TexCoord, 2, gl.FLOAT, false, FSIZE * 4, FSIZE * 2); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_TexCoord); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)

            let u_Sampler = gl.getUniformLocation(gl.program, 'u_Sampler');
            let texture = gl.createTexture();

            gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, 1); // 对纹理图像进行y轴反转
            gl.activeTexture(gl.TEXTURE0); // 开启0号纹理单元
            gl.bindTexture(gl.TEXTURE_2D, texture); // 向target绑定纹理对象
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.NEAREST); // 配置纹理参数
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.NEAREST); // 配置纹理参数
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE); // 配置纹理参数
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE); // 配置纹理参数
            const width = 4;
            const height = 4;
            const level = 0;
            const internalFormat = gl.RGBA;
            const format = gl.RGBA;
            const type = gl.UNSIGNED_BYTE;
            const data = new Uint8Array(width * height * 4); // 4个字节表示一个像素的 RGBA 值
            for (let i = 0; i < data.length; i += 4) {
                data[i] = 0; // 红色通道
                data[i + 1] = 0; // 绿色通道
                data[i + 2] = 255; // 蓝色通道
                data[i + 3] = 255; // Alpha 通道
                if (i > data.length / 2) {
                    data[i] = 255;
                    data[i + 1] = 0;
                    data[i + 2] = 0;
                    data[i + 3] = 255;
                }
            }
            console.log(data);
            gl.texImage2D(gl.TEXTURE_2D, level, internalFormat, width, height, 0, format, type, data);
            let err = checkError(gl);
            expect(err).assertEqual(gl.NO_ERROR);
            gl.uniform1i(u_Sampler, 0);
            gl.clearColor(0.92, 0.92, 0.92, 1);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLE_STRIP, 0, arr.length / 4);
            gl.disableVertexAttribArray(a_Position);
            gl.disableVertexAttribArray(a_TexCoord);
            gl.bindTexture(gl.TEXTURE_2D, null);
            gl.bindBuffer(gl.ARRAY_BUFFER, null);
            gl.deleteBuffer(buffer);
            gl.deleteTexture(texture);
            gl.deleteShader(vertexShader);
            gl.deleteShader(fragmentShader);
            gl.deleteProgram(program);
            gl.flush();
            done();
        })


        /**
         * @tc.name   webgl_test_texImage2D_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0012
         * @tc.desc   Test texImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texImage2D_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_texImage2D_3] texImage2D");
            await texImage2D((image2D) => {
                gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, 4, 4, 0, gl.RGBA, gl.UNSIGNED_BYTE, image2D);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_texImage2D_4
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0013
         * @tc.desc   Test texImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texImage2D_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_texImage2D_4] texImage2D");
            await texImage2D((image2D) => {
                gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, 4, 4, 0, gl.RGBA, gl.UNSIGNED_BYTE, image2D);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_texImage2D_5
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0014
         * @tc.desc   Test texImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texImage2D_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_texImage2D_5] texImage2D");
            await texImage2D((image2D) => {
                gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, 4, 4, 0, gl.RGBA, gl.UNSIGNED_BYTE, image2D);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_texImage2D_6
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0015
         * @tc.desc   Test texImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texImage2D_6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_texImage2D_6] texImage2D");
            await texImage2D((image2D) => {
                gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, 4, 4, 0, gl.RGBA, gl.UNSIGNED_BYTE, image2D);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.name   webgl_test_texImage2D_7
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0016
         * @tc.desc   Test texImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texImage2D_7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_texImage2D_7] texImage2D");
            await texImage2D((image2D) => {
                gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, 4, 4, 0, gl.RGBA, gl.UNSIGNED_BYTE, image2D);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();

        })


        /**
         * @tc.name   webgl_test_texImage2D_8
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0017
         * @tc.desc   Test texImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texImage2D_8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_texImage2D_8] texImage2D");
            await texImage2D((image2D) => {
                gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, 4, 4, 0, gl.RGBA, gl.UNSIGNED_BYTE, image2D);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();

        })


        /**
         * @tc.name   webgl_test_texImage2D_9
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0018
         * @tc.desc   Test texImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texImage2D_9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_texImage2D_9] texImage2D");
            await texImage2D((image2D) => {
                gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGB, 4, 4, 0, gl.RGB, gl.UNSIGNED_BYTE, image2D);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();

        })


        /**
         * @tc.name   webgl_test_texImage2D_10
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0019
         * @tc.desc   Test texImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texImage2D_10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_texImage2D_10] texImage2D");
            await texImage2D((image2D) => {
                gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGB, 4, 4, 0, gl.RGB, gl.UNSIGNED_SHORT_5_6_5, image2D);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_texImage2D_11
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0020
         * @tc.desc   Test texImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texImage2D_11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_texImage2D_11] texImage2D");
            await texImage2D((image2D) => {
                gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGB, 4, 4, 0, gl.RGB, gl.UNSIGNED_SHORT_4_4_4_4, image2D);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_texImage2D_12
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0021
         * @tc.desc   Test texImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texImage2D_12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_texImage2D_12] texImage2D");
            await texImage2D((image2D) => {
                gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGB, 4, 4, 0, gl.RGB, gl.UNSIGNED_SHORT_5_5_5_1, image2D);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_texImage2D_Error
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0022
         * @tc.desc   Test texImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texImage2D_Error', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_texImage2D_Error] texImage2D");
            let width = 256;
            let height = 256;
            let level = 0;
            let internalFormat = gl.RGBA;
            let format = gl.RGBA;
            let type = gl.UNSIGNED_BYTE;
            let data = new Uint8Array(width * height * 4);
            for (let i = 0; i < data.length; i += 4) {
                data[i] = 0; // 红色通道
                data[i + 1] = 0; // 绿色通道
                data[i + 2] = 255; // 蓝色通道
                data[i + 3] = 255; // Alpha 通道
            }
            console.info("webgltest [webgl_test_texImage2D] texImage2D no target");
            gl.texImage2D(undefined, level, internalFormat, width, height, 0, format, type, data);
            checkError(gl)
            console.info("webgltest [webgl_test_texImage2D] texImage2D no level");
            level = undefined
            gl.texImage2D(gl.TEXTURE_2D, level, internalFormat, width, height, 0, format, type, data);
            checkError(gl)
            level = 0
            console.info("webgltest [webgl_test_texImage2D] texImage2D no internalFormat");
            internalFormat = undefined
            gl.texImage2D(gl.TEXTURE_2D, level, internalFormat, width, height, 0, format, type, data);
            checkError(gl)
            width = undefined
            console.info("webgltest [webgl_test_texImage2D] texImage2D no width");
            internalFormat = undefined
            gl.texImage2D(gl.TEXTURE_2D, level, internalFormat, width, height, 0, format, type, data);
            checkError(gl)
            internalFormat = 256
            console.info("webgltest [webgl_test_texImage2D] texImage2D no height");
            height = undefined
            gl.texImage2D(gl.TEXTURE_2D, level, internalFormat, width, height, 0, format, type, data);
            checkError(gl)
            height = 256
            console.info("webgltest [webgl_test_texImage2D] texImage2D no border");
            gl.texImage2D(gl.TEXTURE_2D, level, internalFormat, width, height, undefined, format, type, data);
            checkError(gl)
            console.info("webgltest [webgl_test_texImage2D] texImage2D no format");
            format = undefined
            gl.texImage2D(gl.TEXTURE_2D, level, internalFormat, width, height, 0, format, type, data);
            checkError(gl)
            format = gl.RGBA;
            console.info("webgltest [webgl_test_texImage2D] texImage2D no type");
            type = undefined
            gl.texImage2D(gl.TEXTURE_2D, level, internalFormat, width, height, 0, format, type, data);
            checkError(gl)
            type = gl.UNSIGNED_BYTE;
            console.info("webgltest [webgl_test_texImage2D] texImage2D no data");
            data = undefined
            gl.texImage2D(gl.TEXTURE_2D, level, internalFormat, width, height, 0, format, type, data);
            checkError(gl)
            done();
        })


        /**
         * @tc.name   webgl_test_generateMipmap
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0023
         * @tc.desc   Test generateMipmap.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_generateMipmap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [generateMipmap] generateMipmap");
            gl.generateMipmap(gl.TEXTURE_2D);
            const error = checkError(gl);
            expect(error).assertEqual(gl.INVALID_OPERATION);
            done();
        })

        async function texSubImage2D(callback, finish) {
            let {program, vertexShader, fragmentShader} = createProgram(gl, `
                attribute vec4 a_Position;
                attribute vec2 a_TexCoord;
                varying vec2 v_TexCoord;
                void main(){
                    gl_Position = a_Position;
                    v_TexCoord = a_TexCoord;
                }
            `, `
                precision mediump float;
                precision highp sampler2D;
                uniform sampler2D u_Sampler;
                varying vec2 v_TexCoord;
                void main(){
                    gl_FragColor = texture2D(u_Sampler, v_TexCoord);
                }
            `);
            let arr = new Float32Array([
                -0.5, 0.5, 0.0, 1.0,
                -0.5, -0.5, 0.0, 0.0,
                0.5, 0.5, 1.0, 1.0,
                0.5, -0.5, 1.0, 0.0,
            ]);
            let FSIZE = arr.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer(); // 创建缓冲区
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer); // 绑定缓冲区
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW); // 将数据写入缓冲区对象

            let a_Position = gl.getAttribLocation(gl.program, 'a_Position'); // 获取attribute变量地址
            gl.vertexAttribPointer(a_Position, 2, gl.FLOAT, false, FSIZE * 4, 0); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_Position); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)

            let a_TexCoord = gl.getAttribLocation(gl.program, 'a_TexCoord'); // 获取attribute变量地址
            gl.vertexAttribPointer(a_TexCoord, 2, gl.FLOAT, false, FSIZE * 4, FSIZE * 2); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_TexCoord); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)

            let u_Sampler = gl.getUniformLocation(gl.program, 'u_Sampler');
            let texture = gl.createTexture();

            gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, 1); // 对纹理图像进行y轴反转
            gl.activeTexture(gl.TEXTURE0); // 开启0号纹理单元
            gl.bindTexture(gl.TEXTURE_2D, texture); // 向target绑定纹理对象
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.NEAREST); // 配置纹理参数
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.NEAREST); // 配置纹理参数
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE); // 配置纹理参数
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE); // 配置纹理参数
            const width = 256;
            const height = 256;
            const level = 0;
            const internalFormat = gl.RGBA;
            const border = 0;
            const format = gl.RGBA;
            const type = gl.UNSIGNED_BYTE;
            const data = new Uint8Array(width * height * 4);
            for (let i = 0; i < data.length; i += 4) {
                data[i] = 0; // 红色通道
                data[i + 1] = 0; // 绿色通道
                data[i + 2] = 255; // 蓝色通道
                data[i + 3] = 255; // Alpha 通道
            }
            gl.texImage2D(gl.TEXTURE_2D, level, internalFormat, width, height, border, format, type, data);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.uniform1i(u_Sampler, 0);
            gl.clearColor(0.92, 0.92, 0.92, 1);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLE_STRIP, 0, arr.length / 4);

            const newData = new Uint8Array(width * height * 4);
            for (let i = 0; i < newData.length; i += 4) {
                newData[i] = 255; // 红色通道
                newData[i + 1] = 0; // 绿色通道
                newData[i + 2] = 0; // 蓝色通道
                newData[i + 3] = 255; // Alpha 通道
            }
            const xOffset = 128;
            const yOffset = 64;
            callback(newData)
            finish()
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.clearColor(0.92, 0.92, 0.92, 1);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLE_STRIP, 0, arr.length / 4);

            gl.disableVertexAttribArray(a_Position);
            gl.disableVertexAttribArray(a_TexCoord);
            gl.bindTexture(gl.TEXTURE_2D, null);
            gl.bindBuffer(gl.ARRAY_BUFFER, null);
            gl.deleteBuffer(buffer);
            gl.deleteTexture(texture);
            gl.deleteShader(vertexShader);
            gl.deleteShader(fragmentShader);
            gl.deleteProgram(program);
            gl.flush();
        }


        /**
         * @tc.name   webgl_test_texSubImage2D
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0024
         * @tc.desc   Test texSubImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texSubImage2D', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_texSubImage2D] texSubImage2D");
            let {program, vertexShader, fragmentShader} = createProgram(gl, `
                attribute vec4 a_Position;
                attribute vec2 a_TexCoord;
                varying vec2 v_TexCoord;
                void main(){
                    gl_Position = a_Position;
                    v_TexCoord = a_TexCoord;
                }
            `, `
                precision mediump float;
                precision highp sampler2D;
                uniform sampler2D u_Sampler;
                varying vec2 v_TexCoord;
                void main(){
                    gl_FragColor = texture2D(u_Sampler, v_TexCoord);
                }
            `);
            let arr = new Float32Array([
                -0.5, 0.5, 0.0, 1.0,
                -0.5, -0.5, 0.0, 0.0,
                0.5, 0.5, 1.0, 1.0,
                0.5, -0.5, 1.0, 0.0,
            ]);
            let FSIZE = arr.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer(); // 创建缓冲区
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer); // 绑定缓冲区
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW); // 将数据写入缓冲区对象

            let a_Position = gl.getAttribLocation(gl.program, 'a_Position'); // 获取attribute变量地址
            gl.vertexAttribPointer(a_Position, 2, gl.FLOAT, false, FSIZE * 4, 0); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_Position); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)

            let a_TexCoord = gl.getAttribLocation(gl.program, 'a_TexCoord'); // 获取attribute变量地址
            gl.vertexAttribPointer(a_TexCoord, 2, gl.FLOAT, false, FSIZE * 4, FSIZE * 2); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_TexCoord); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)

            let u_Sampler = gl.getUniformLocation(gl.program, 'u_Sampler');
            let texture = gl.createTexture();

            gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, 1); // 对纹理图像进行y轴反转
            gl.activeTexture(gl.TEXTURE0); // 开启0号纹理单元
            gl.bindTexture(gl.TEXTURE_2D, texture); // 向target绑定纹理对象
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.NEAREST); // 配置纹理参数
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.NEAREST); // 配置纹理参数
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE); // 配置纹理参数
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE); // 配置纹理参数
            const width = 256;
            const height = 256;
            const level = 0;
            const internalFormat = gl.RGBA;
            const border = 0;
            const format = gl.RGBA;
            const type = gl.UNSIGNED_BYTE;
            const data = new Uint8Array(width * height * 4);
            for (let i = 0; i < data.length; i += 4) {
                data[i] = 0; // 红色通道
                data[i + 1] = 0; // 绿色通道
                data[i + 2] = 255; // 蓝色通道
                data[i + 3] = 255; // Alpha 通道
            }
            gl.texImage2D(gl.TEXTURE_2D, level, internalFormat, width, height, border, format, type, data);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.uniform1i(u_Sampler, 0);
            gl.clearColor(0.92, 0.92, 0.92, 1);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLE_STRIP, 0, arr.length / 4);

            const newData = new Uint8Array(width * height * 4);
            for (let i = 0; i < newData.length; i += 4) {
                newData[i] = 255; // 红色通道
                newData[i + 1] = 0; // 绿色通道
                newData[i + 2] = 0; // 蓝色通道
                newData[i + 3] = 255; // Alpha 通道
            }
            const xOffset = 128;
            const yOffset = 64;
            gl.texSubImage2D(gl.TEXTURE_2D, level, xOffset, yOffset, width - 128, height - 64, format, type, newData);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.clearColor(0.92, 0.92, 0.92, 1);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLE_STRIP, 0, arr.length / 4);

            gl.disableVertexAttribArray(a_Position);
            gl.disableVertexAttribArray(a_TexCoord);
            gl.bindTexture(gl.TEXTURE_2D, null);
            gl.bindBuffer(gl.ARRAY_BUFFER, null);
            gl.deleteBuffer(buffer);
            gl.deleteTexture(texture);
            gl.deleteShader(vertexShader);
            gl.deleteShader(fragmentShader);
            gl.deleteProgram(program);
            gl.flush();
            done();
        })


        /**
         * @tc.name   webgl_test_texSubImage2D_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0025
         * @tc.desc   Test texSubImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texSubImage2D_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_texSubImage2D_1] texSubImage2D");
            await texSubImage2D((data) => {
                const width = 256;
                const height = 256;
                const level = 0;
                const format = gl.RGBA;
                const type = gl.UNSIGNED_BYTE;
                const xOffset = 128;
                const yOffset = 64;
                gl.texSubImage2D(gl.TEXTURE_CUBE_MAP_POSITIVE_X,
                    level, xOffset, yOffset, width - 128, height - 64, format, type, data);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_texSubImage2D_14
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0026
         * @tc.desc   Test texSubImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texSubImage2D_14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_texSubImage2D_14] texSubImage2D");
            await texSubImage2D((data) => {
                const width = 256;
                const height = 256;
                const level = 0;
                const format = gl.RGBA;
                const type = gl.UNSIGNED_BYTE;
                const xOffset = 128;
                const yOffset = 64;
                gl.texSubImage2D(gl.TEXTURE_CUBE_MAP_NEGATIVE_X,
                    level, xOffset, yOffset, width - 128, height - 64, format, type, data);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_texSubImage2D_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0027
         * @tc.desc   Test texSubImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texSubImage2D_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_texSubImage2D_3] texSubImage2D");
            await texSubImage2D((data) => {
                const width = 256;
                const height = 256;
                const level = 0;
                const format = gl.RGBA;
                const type = gl.UNSIGNED_BYTE;
                const xOffset = 128;
                const yOffset = 64;
                gl.texSubImage2D(gl.TEXTURE_CUBE_MAP_POSITIVE_Y,
                    level, xOffset, yOffset, width - 128, height - 64, format, type, data);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_texSubImage2D_4
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0028
         * @tc.desc   Test texSubImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texSubImage2D_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_texSubImage2D_4] texSubImage2D");
            await texSubImage2D((data) => {
                const width = 256;
                const height = 256;
                const level = 0;
                const format = gl.RGBA;
                const type = gl.UNSIGNED_BYTE;
                const xOffset = 128;
                const yOffset = 64;
                gl.texSubImage2D(gl.TEXTURE_CUBE_MAP_NEGATIVE_Y,
                    level, xOffset, yOffset, width - 128, height - 64, format, type, data);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_texSubImage2D_5
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0029
         * @tc.desc   Test texSubImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texSubImage2D_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_texSubImage2D_5] texSubImage2D");
            await texSubImage2D((data) => {
                const width = 256;
                const height = 256;
                const level = 0;
                const format = gl.RGBA;
                const type = gl.UNSIGNED_BYTE;
                const xOffset = 128;
                const yOffset = 64;
                gl.texSubImage2D(gl.TEXTURE_CUBE_MAP_POSITIVE_Z,
                    level, xOffset, yOffset, width - 128, height - 64, format, type, data);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_texSubImage2D_6
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0030
         * @tc.desc   Test texSubImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texSubImage2D_6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_texSubImage2D_6] texSubImage2D");
            await texSubImage2D((data) => {
                const width = 256;
                const height = 256;
                const level = 0;
                const format = gl.RGBA;
                const type = gl.UNSIGNED_BYTE;
                const xOffset = 128;
                const yOffset = 64;
                gl.texSubImage2D(gl.TEXTURE_CUBE_MAP_NEGATIVE_Z,
                    level, xOffset, yOffset, width - 128, height - 64, format, type, data);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_texSubImage2D_7
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0031
         * @tc.desc   Test texSubImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texSubImage2D_7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_texSubImage2D_7] texSubImage2D");
            await texSubImage2D((data) => {
                const width = 256;
                const height = 256;
                const level = 0;
                const format = gl.ALPHA;
                const type = gl.UNSIGNED_BYTE;
                const xOffset = 128;
                const yOffset = 64;
                gl.texSubImage2D(gl.TEXTURE_2D, level, xOffset, yOffset, width - 128, height - 64, format, type, data);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_texSubImage2D_8
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0032
         * @tc.desc   Test texSubImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texSubImage2D_8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_texSubImage2D_8] texSubImage2D");
            await texSubImage2D((data) => {
                const width = 256;
                const height = 256;
                const level = 0;
                const format = gl.RGB;
                const type = gl.UNSIGNED_BYTE;
                const xOffset = 128;
                const yOffset = 64;
                gl.texSubImage2D(gl.TEXTURE_2D, level, xOffset, yOffset, width - 128, height - 64, format, type, data);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_texSubImage2D_9
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0033
         * @tc.desc   Test texSubImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texSubImage2D_9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_texSubImage2D_9] texSubImage2D");
            await texSubImage2D((data) => {
                const width = 256;
                const height = 256;
                const level = 0;
                const format = gl.LUMINANCE;
                const type = gl.UNSIGNED_BYTE;
                const xOffset = 128;
                const yOffset = 64;
                gl.texSubImage2D(gl.TEXTURE_2D, level, xOffset, yOffset, width - 128, height - 64, format, type, data);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_texSubImage2D_10
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0034
         * @tc.desc   Test texSubImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texSubImage2D_10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_texSubImage2D_10] texSubImage2D");
            await texSubImage2D((data) => {
                const width = 256;
                const height = 256;
                const level = 0;
                const format = gl.LUMINANCE_ALPHA;
                const type = gl.UNSIGNED_BYTE;
                const xOffset = 128;
                const yOffset = 64;
                gl.texSubImage2D(gl.TEXTURE_2D, level, xOffset, yOffset, width - 128, height - 64, format, type, data);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_texSubImage2D_11
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0035
         * @tc.desc   Test texSubImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texSubImage2D_11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_texSubImage2D_11] texSubImage2D");
            await texSubImage2D((data) => {
                const width = 256;
                const height = 256;
                const level = 0;
                const format = gl.RGBA;
                const type = gl.UNSIGNED_SHORT_5_6_5;
                const xOffset = 128;
                const yOffset = 64;
                gl.texSubImage2D(gl.TEXTURE_2D, level, xOffset, yOffset, width - 128, height - 64, format, type, data);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_texSubImage2D_12
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0036
         * @tc.desc   Test texSubImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texSubImage2D_12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_texSubImage2D_12] texSubImage2D");
            await texSubImage2D((data) => {
                const width = 256;
                const height = 256;
                const level = 0;
                const format = gl.RGBA;
                const type = gl.UNSIGNED_SHORT_4_4_4_4;
                const xOffset = 128;
                const yOffset = 64;
                gl.texSubImage2D(gl.TEXTURE_2D, level, xOffset, yOffset, width - 128, height - 64, format, type, data);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_texSubImage2D_13
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0037
         * @tc.desc   Test texSubImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texSubImage2D_13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_texSubImage2D_13] texSubImage2D");
            await texSubImage2D((data) => {
                const width = 256;
                const height = 256;
                const level = 0;
                const format = gl.RGBA;
                const type = gl.UNSIGNED_SHORT_5_5_5_1;
                const xOffset = 128;
                const yOffset = 64;
                gl.texSubImage2D(gl.TEXTURE_2D, level, xOffset, yOffset, width - 128, height - 64, format, type, data);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            })
            done()
        })

        function loadFile(src) {
            return new Promise((resolve, reject) => {
                fetch(src).then(rs => {
                    return rs.blob()
                }).then(rs => {
                    const imageUrl = URL.createObjectURL(rs);
                    let image = new Image();
                    image.onload = ev1 => {
                        let imageBitmap = createImageBitmap(image, 0, 0, image.width, image.height);
                        console.log(imageBitmap);
                        resolve(imageBitmap)
                    }
                    image.src = imageUrl;
                })
            });
        }

        function loadImage(src) {
            return new Promise((resolve, reject) => {
                let image = new Image();
                resolve(image);
                image.src = `data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg==`;
            });
        }


        /**
         * @tc.name   webgl_test_texSubImage2D_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0038
         * @tc.desc   Test texSubImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texSubImage2D_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_texSubImage2D_2] texSubImage2D");
            let image = await loadImage()
            let {program, vertexShader, fragmentShader} = createProgram(gl, `
                attribute vec4 a_Position;
                attribute vec2 a_TexCoord;
                varying vec2 v_TexCoord;
                void main(){
                    gl_Position = a_Position;
                    v_TexCoord = a_TexCoord;
                }
            `, `
                precision mediump float;
                precision highp sampler2D;
                uniform sampler2D u_Sampler;
                varying vec2 v_TexCoord;
                void main(){
                    gl_FragColor = texture2D(u_Sampler, v_TexCoord);
                }
            `);
            let arr = new Float32Array([
                -0.5, 0.5, 0.0, 1.0,
                -0.5, -0.5, 0.0, 0.0,
                0.5, 0.5, 1.0, 1.0,
                0.5, -0.5, 1.0, 0.0,
            ]);
            let FSIZE = arr.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer(); // 创建缓冲区
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer); // 绑定缓冲区
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW); // 将数据写入缓冲区对象

            let a_Position = gl.getAttribLocation(gl.program, 'a_Position'); // 获取attribute变量地址
            gl.vertexAttribPointer(a_Position, 2, gl.FLOAT, false, FSIZE * 4, 0); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_Position); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)

            let a_TexCoord = gl.getAttribLocation(gl.program, 'a_TexCoord'); // 获取attribute变量地址
            gl.vertexAttribPointer(a_TexCoord, 2, gl.FLOAT, false, FSIZE * 4, FSIZE * 2); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_TexCoord); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)

            let u_Sampler = gl.getUniformLocation(gl.program, 'u_Sampler');
            let texture = gl.createTexture();

            gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, 1); // 对纹理图像进行y轴反转
            gl.activeTexture(gl.TEXTURE0); // 开启0号纹理单元
            gl.bindTexture(gl.TEXTURE_2D, texture); // 向target绑定纹理对象
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.NEAREST); // 配置纹理参数
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.NEAREST); // 配置纹理参数
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE); // 配置纹理参数
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE); // 配置纹理参数
            const width = 500;
            const height = 500;
            const level = 0;
            const internalFormat = gl.RGBA;
            const border = 0;
            const format = gl.RGBA;
            const type = gl.UNSIGNED_BYTE;
            const data = new Uint8Array(width * height * 4);
            for (let i = 0; i < data.length; i += 4) {
                data[i] = 0; // 红色通道
                data[i + 1] = 0; // 绿色通道
                data[i + 2] = 255; // 蓝色通道
                data[i + 3] = 255; // Alpha 通道
            }
            gl.texImage2D(gl.TEXTURE_2D, level, internalFormat, width, height, border, format, type, data);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.uniform1i(u_Sampler, 0);
            gl.clearColor(0.92, 0.92, 0.92, 1);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLE_STRIP, 0, arr.length / 4);

            console.log(image);
            gl.texSubImage2D(gl.TEXTURE_2D, level, 490, 490, format, type, image);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.texSubImage2D(gl.TEXTURE_2D, level, 400, 400, format, type, image);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.texSubImage2D(gl.TEXTURE_2D, level, 300, 300, format, type, image);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.texSubImage2D(gl.TEXTURE_2D, level, 200, 200, format, type, image);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.texSubImage2D(gl.TEXTURE_2D, level, 100, 100, format, type, image);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.clearColor(0.92, 0.92, 0.92, 1);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLE_STRIP, 0, arr.length / 4);
            gl.disableVertexAttribArray(a_Position);
            gl.disableVertexAttribArray(a_TexCoord);
            gl.bindTexture(gl.TEXTURE_2D, null);
            gl.bindBuffer(gl.ARRAY_BUFFER, null);
            gl.deleteBuffer(buffer);
            gl.deleteTexture(texture);
            gl.deleteShader(vertexShader);
            gl.deleteShader(fragmentShader);
            gl.deleteProgram(program);
            gl.flush();
            done();
        })


        /**
         * @tc.name   webgl_test_texSubImage2D_Error
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0039
         * @tc.desc   Test texSubImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_texSubImage2D_Error', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_texSubImage2D] texSubImage2D");
            let image = await loadImage()
            const width = 500;
            const height = 500;
            const level = 0;
            const internalFormat = gl.RGBA;
            const border = 0;
            const format = gl.RGBA;
            const type = gl.UNSIGNED_BYTE;
            const data = new Uint8Array(width * height * 4);
            for (let i = 0; i < data.length; i += 4) {
                data[i] = 0; // 红色通道
                data[i + 1] = 0; // 绿色通道
                data[i + 2] = 255; // 蓝色通道
                data[i + 3] = 255; // Alpha 通道
            }
            console.info("webgltest [webgl_test_texSubImage2D] texSubImage2D no target");
            gl.texSubImage2D(undefined, level, 490, 490, format, type, image);
            checkError(gl)
            console.info("webgltest [webgl_test_texSubImage2D] texSubImage2D no level");
            gl.texSubImage2D(gl.TEXTURE_2D, undefined, 490, 490, format, type, image);
            checkError(gl)
            console.info("webgltest [webgl_test_texSubImage2D] texSubImage2D no xoffset");
            gl.texSubImage2D(gl.TEXTURE_2D, level, undefined, 490, format, type, image);
            checkError(gl)
            console.info("webgltest [webgl_test_texSubImage2D] texSubImage2D no yoffset");
            gl.texSubImage2D(gl.TEXTURE_2D, level, 490, undefined, format, type, image);
            checkError(gl)
            console.info("webgltest [webgl_test_texSubImage2D] texSubImage2D no format");
            gl.texSubImage2D(gl.TEXTURE_2D, level, 490, 490, undefined, type, image);
            checkError(gl)
            console.info("webgltest [webgl_test_texSubImage2D] texSubImage2D no type");
            gl.texSubImage2D(gl.TEXTURE_2D, level, 490, 490, format, undefined, image);
            checkError(gl)
            done()
        })


        function compressedTexImage2D(callback, finish) {
            console.info("webgltest [webgl_test_compressedTexImage2D] compressedTexImage2D");
            var availableExtensions = gl.getSupportedExtensions();
            for (var i = 0; i < availableExtensions.length; i++) {
                if (availableExtensions[i].indexOf('texture') >= 0
                    && availableExtensions[i].indexOf('compressed') >= 0) {
                    console.log(availableExtensions[i]);
                }
            }
            let {program, vertexShader, fragmentShader} = createProgram(gl, `
                attribute vec4 a_Position;
                attribute vec2 a_TexCoord;
                varying vec2 v_TexCoord;
                void main(){
                    gl_Position = a_Position;
                    v_TexCoord = a_TexCoord;
                }
            `, `
                precision mediump float;
                precision highp sampler2D;
                uniform sampler2D u_Sampler;
                varying vec2 v_TexCoord;
                void main(){
                    gl_FragColor = texture2D(u_Sampler, v_TexCoord);
                }
            `);
            let arr = new Float32Array([
                -0.5, 0.5, 0.0, 1.0,
                -0.5, -0.5, 0.0, 0.0,
                0.5, 0.5, 1.0, 1.0,
                0.5, -0.5, 1.0, 0.0,
            ]);
            const ext =
                gl.getExtension("WEBGL_compressed_texture_s3tc") ||
                gl.getExtension("MOZ_WEBGL_compressed_texture_s3tc") ||
                gl.getExtension("WEBKIT_WEBGL_compressed_texture_s3tc") || {};

            let FSIZE = arr.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer(); // 创建缓冲区
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer); // 绑定缓冲区
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW); // 将数据写入缓冲区对象

            let a_Position = gl.getAttribLocation(gl.program, 'a_Position'); // 获取attribute变量地址
            gl.vertexAttribPointer(a_Position, 2, gl.FLOAT, false, FSIZE * 4, 0); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_Position); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)

            let a_TexCoord = gl.getAttribLocation(gl.program, 'a_TexCoord'); // 获取attribute变量地址
            gl.vertexAttribPointer(a_TexCoord, 2, gl.FLOAT, false, FSIZE * 4, FSIZE * 2); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_TexCoord); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)

            let u_Sampler = gl.getUniformLocation(gl.program, 'u_Sampler');
            let texture = gl.createTexture();

            gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, 1); // 对纹理图像进行y轴反转
            gl.activeTexture(gl.TEXTURE0); // 开启0号纹理单元
            gl.bindTexture(gl.TEXTURE_2D, texture); // 向target绑定纹理对象
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.NEAREST); // 配置纹理参数
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.NEAREST); // 配置纹理参数
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE); // 配置纹理参数
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE); // 配置纹理参数

            callback(ext)
            finish()
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.uniform1i(u_Sampler, 0);
            gl.clearColor(0.92, 0.92, 0.92, 1);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLE_STRIP, 0, arr.length / 4);
            gl.disableVertexAttribArray(a_Position);
            gl.disableVertexAttribArray(a_TexCoord);
            gl.bindTexture(gl.TEXTURE_2D, null);
            gl.bindBuffer(gl.ARRAY_BUFFER, null);
            gl.deleteBuffer(buffer);
            gl.deleteTexture(texture);
            gl.deleteShader(vertexShader);
            gl.deleteShader(fragmentShader);
            gl.deleteProgram(program);
            gl.flush();
        }


        /**
         * @tc.name   webgl_test_compressedTexImage2D
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0040
         * @tc.desc   Test compressedTexImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_compressedTexImage2D', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_compressedTexImage2D] compressedTexImage2D");
            var availableExtensions = gl.getSupportedExtensions();
            for (var i = 0; i < availableExtensions.length; i++) {
                if (availableExtensions[i].indexOf('texture') >= 0
                    && availableExtensions[i].indexOf('compressed') >= 0) {
                    console.log(availableExtensions[i]);
                }
            }
            let {program, vertexShader, fragmentShader} = createProgram(gl, `
                attribute vec4 a_Position;
                attribute vec2 a_TexCoord;
                varying vec2 v_TexCoord;
                void main(){
                    gl_Position = a_Position;
                    v_TexCoord = a_TexCoord;
                }
            `, `
                precision mediump float;
                precision highp sampler2D;
                uniform sampler2D u_Sampler;
                varying vec2 v_TexCoord;
                void main(){
                    gl_FragColor = texture2D(u_Sampler, v_TexCoord);
                }
            `);
            let arr = new Float32Array([
                -0.5, 0.5, 0.0, 1.0,
                -0.5, -0.5, 0.0, 0.0,
                0.5, 0.5, 1.0, 1.0,
                0.5, -0.5, 1.0, 0.0,
            ]);
            const ext =
                gl.getExtension("WEBGL_compressed_texture_s3tc") ||
                gl.getExtension("MOZ_WEBGL_compressed_texture_s3tc") ||
                gl.getExtension("WEBKIT_WEBGL_compressed_texture_s3tc") || {};

            let FSIZE = arr.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer(); // 创建缓冲区
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer); // 绑定缓冲区
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW); // 将数据写入缓冲区对象

            let a_Position = gl.getAttribLocation(gl.program, 'a_Position'); // 获取attribute变量地址
            gl.vertexAttribPointer(a_Position, 2, gl.FLOAT, false, FSIZE * 4, 0); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_Position); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)

            let a_TexCoord = gl.getAttribLocation(gl.program, 'a_TexCoord'); // 获取attribute变量地址
            gl.vertexAttribPointer(a_TexCoord, 2, gl.FLOAT, false, FSIZE * 4, FSIZE * 2); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_TexCoord); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)

            let u_Sampler = gl.getUniformLocation(gl.program, 'u_Sampler');
            let texture = gl.createTexture();

            gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, 1); // 对纹理图像进行y轴反转
            gl.activeTexture(gl.TEXTURE0); // 开启0号纹理单元
            gl.bindTexture(gl.TEXTURE_2D, texture); // 向target绑定纹理对象
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.NEAREST); // 配置纹理参数
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.NEAREST); // 配置纹理参数
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE); // 配置纹理参数
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE); // 配置纹理参数
            const width = 4;
            const height = 4;
            gl.compressedTexImage2D(gl.TEXTURE_2D, 0, ext.COMPRESSED_RGBA_S3TC_DXT1_EXT,
                width, height, 0, new Uint8Array([0x1e, 0x33, 0xaa, 0xaF, 0x1e, 0x88, 0x1e, 0x77,]));
            if (ext.COMPRESSED_RGBA_S3TC_DXT1_EXT) {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            } else {
                expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            }
            gl.uniform1i(u_Sampler, 0);
            gl.clearColor(0.92, 0.92, 0.92, 1);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLE_STRIP, 0, arr.length / 4);
            gl.disableVertexAttribArray(a_Position);
            gl.disableVertexAttribArray(a_TexCoord);
            gl.bindTexture(gl.TEXTURE_2D, null);
            gl.bindBuffer(gl.ARRAY_BUFFER, null);
            gl.deleteBuffer(buffer);
            gl.deleteTexture(texture);
            gl.deleteShader(vertexShader);
            gl.deleteShader(fragmentShader);
            gl.deleteProgram(program);
            gl.flush();
            done();
        })


        /**
         * @tc.name   webgl_test_compressedTexImage2D_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0041
         * @tc.desc   Test compressedTexImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_compressedTexImage2D_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            compressedTexImage2D((ext) => {
                const width = 4;
                const height = 4;
                gl.compressedTexImage2D(gl.TEXTURE_CUBE_MAP_POSITIVE_X, 0, ext.COMPRESSED_RGBA_S3TC_DXT1_EXT, width,
                    height, 0, new Uint8Array([0x1e, 0x33, 0xaa, 0xaF, 0x1e, 0x88, 0x1e, 0x77,]));
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_compressedTexImage2D_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0042
         * @tc.desc   Test compressedTexImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_compressedTexImage2D_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            compressedTexImage2D((ext) => {
                const width = 4;
                const height = 4;
                gl.compressedTexImage2D(gl.TEXTURE_CUBE_MAP_NEGATIVE_X, 0, ext.COMPRESSED_RGBA_S3TC_DXT1_EXT, width,
                    height, 0, new Uint8Array([0x1e, 0x33, 0xaa, 0xaF, 0x1e, 0x88, 0x1e, 0x77,]));
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_compressedTexImage2D_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0043
         * @tc.desc   Test compressedTexImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_compressedTexImage2D_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            compressedTexImage2D((ext) => {
                const width = 4;
                const height = 4;
                gl.compressedTexImage2D(gl.TEXTURE_CUBE_MAP_POSITIVE_Y, 0, ext.COMPRESSED_RGBA_S3TC_DXT1_EXT, width,
                    height, 0, new Uint8Array([0x1e, 0x33, 0xaa, 0xaF, 0x1e, 0x88, 0x1e, 0x77,]));
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_compressedTexImage2D_4
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0044
         * @tc.desc   Test compressedTexImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_compressedTexImage2D_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            compressedTexImage2D((ext) => {
                const width = 4;
                const height = 4;
                gl.compressedTexImage2D(gl.TEXTURE_CUBE_MAP_NEGATIVE_Y, 0, ext.COMPRESSED_RGBA_S3TC_DXT1_EXT, width,
                    height, 0, new Uint8Array([0x1e, 0x33, 0xaa, 0xaF, 0x1e, 0x88, 0x1e, 0x77,]));
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_compressedTexImage2D_5
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0045
         * @tc.desc   Test compressedTexImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_compressedTexImage2D_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            compressedTexImage2D((ext) => {
                const width = 4;
                const height = 4;
                gl.compressedTexImage2D(gl.TEXTURE_CUBE_MAP_NEGATIVE_Z, 0, ext.COMPRESSED_RGBA_S3TC_DXT1_EXT, width,
                    height, 0, new Uint8Array([0x1e, 0x33, 0xaa, 0xaF, 0x1e, 0x88, 0x1e, 0x77,]));
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_compressedTexImage2D_6
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0046
         * @tc.desc   Test compressedTexImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_compressedTexImage2D_6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            compressedTexImage2D((ext) => {
                const width = 4;
                const height = 4;
                gl.compressedTexImage2D(gl.TEXTURE_CUBE_MAP_POSITIVE_X, 0, ext.COMPRESSED_RGBA_S3TC_DXT1_EXT, width,
                    height, 0, new Uint8Array([0x1e, 0x33, 0xaa, 0xaF, 0x1e, 0x88, 0x1e, 0x77,]));
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_compressedTexImage2D_Error
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0047
         * @tc.desc   Test compressedTexImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_compressedTexImage2D_Error', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_compressedTexImage2D_Error] compressedTexImage2D");
            const width = 500;
            const height = 500;
            const ext =
                gl.getExtension("WEBGL_compressed_texture_s3tc") ||
                gl.getExtension("MOZ_WEBGL_compressed_texture_s3tc") ||
                gl.getExtension("WEBKIT_WEBGL_compressed_texture_s3tc") || {};
            console.info("webgltest [webgl_test_compressedTexImage2D_Error] compressedTexImage2D no target");
            gl.compressedTexImage2D(undefined, 0, ext.COMPRESSED_RGBA_S3TC_DXT1_EXT, width, height, 0, new Uint8Array([
                0x1e, 0x33, 0xaa, 0xaF, 0x1e, 0x88, 0x1e, 0x77,
            ]));
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            console.info("webgltest [webgl_test_compressedTexImage2D_Error] compressedTexImage2D no level");
            gl.compressedTexImage2D(gl.TEXTURE_2D, undefined, ext.COMPRESSED_RGBA_S3TC_DXT1_EXT, width, height, 0, new Uint8Array([
                0x1e, 0x33, 0xaa, 0xaF, 0x1e, 0x88, 0x1e, 0x77,
            ]));
            expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            console.info("webgltest [webgl_test_compressedTexImage2D_Error] compressedTexImage2D no internalformat");
            gl.compressedTexImage2D(gl.TEXTURE_2D, 0, undefined, width, height, 0, new Uint8Array([
                0x1e, 0x33, 0xaa, 0xaF, 0x1e, 0x88, 0x1e, 0x77,
            ]));
            expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            console.info("webgltest [webgl_test_compressedTexImage2D_Error] compressedTexImage2D no width");
            gl.compressedTexImage2D(gl.TEXTURE_2D, 0, ext.COMPRESSED_RGBA_S3TC_DXT1_EXT, undefined, height, 0, new Uint8Array([
                0x1e, 0x33, 0xaa, 0xaF, 0x1e, 0x88, 0x1e, 0x77,
            ]));
            expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            console.info("webgltest [webgl_test_compressedTexImage2D_Error] compressedTexImage2D no height");
            gl.compressedTexImage2D(gl.TEXTURE_2D, 0, ext.COMPRESSED_RGBA_S3TC_DXT1_EXT, width, undefined, 0, new Uint8Array([
                0x1e, 0x33, 0xaa, 0xaF, 0x1e, 0x88, 0x1e, 0x77,
            ]));
            expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            console.info("webgltest [webgl_test_compressedTexImage2D_Error] compressedTexImage2D no border");
            gl.compressedTexImage2D(gl.TEXTURE_2D, 0, ext.COMPRESSED_RGBA_S3TC_DXT1_EXT, width, height, undefined, new Uint8Array([
                0x1e, 0x33, 0xaa, 0xaF, 0x1e, 0x88, 0x1e, 0x77,
            ]));
            expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            console.info("webgltest [webgl_test_compressedTexImage2D_Error] compressedTexImage2D no pixels");
            gl.compressedTexImage2D(gl.TEXTURE_2D, 0, ext.COMPRESSED_RGBA_S3TC_DXT1_EXT, width, height, 0, new Uint8Array([]));
            expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            done()
        })


        /**
         * @tc.name   webgl_test_compressedTexSubImage2D
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0048
         * @tc.desc   Test compressedTexSubImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_compressedTexSubImage2D', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_compressedTexSubImage2D] compressedTexSubImage2D");
            let availableExtensions = gl.getSupportedExtensions();
            for (var i = 0; i < availableExtensions.length; i++) {
                if (availableExtensions[i].indexOf('texture') >= 0
                    && availableExtensions[i].indexOf('compressed') >= 0) {
                    console.log("webgltest extension:", availableExtensions[i]);
                }
            }
            let {program, vertexShader, fragmentShader} = createProgram(gl, `
                attribute vec4 a_Position;
                attribute vec2 a_TexCoord;
                varying vec2 v_TexCoord;
                void main(){
                    gl_Position = a_Position;
                    v_TexCoord = a_TexCoord;
                }
            `, `
                precision mediump float;
                precision highp sampler2D;
                uniform sampler2D u_Sampler;
                varying vec2 v_TexCoord;
                void main(){
                    gl_FragColor = texture2D(u_Sampler, v_TexCoord);
                }
            `);
            let arr = new Float32Array([
                -0.5, 0.5, 0.0, 1.0,
                -0.5, -0.5, 0.0, 0.0,
                0.5, 0.5, 1.0, 1.0,
                0.5, -0.5, 1.0, 0.0,
            ]);
            const ext =
                gl.getExtension("WEBGL_compressed_texture_s3tc") ||
                gl.getExtension("MOZ_WEBGL_compressed_texture_s3tc") ||
                gl.getExtension("WEBKIT_WEBGL_compressed_texture_s3tc") || {};

            let FSIZE = arr.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer(); // 创建缓冲区
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer); // 绑定缓冲区
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW); // 将数据写入缓冲区对象

            let a_Position = gl.getAttribLocation(gl.program, 'a_Position'); // 获取attribute变量地址
            gl.vertexAttribPointer(a_Position, 2, gl.FLOAT, false, FSIZE * 4, 0); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_Position); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)

            let a_TexCoord = gl.getAttribLocation(gl.program, 'a_TexCoord'); // 获取attribute变量地址
            gl.vertexAttribPointer(a_TexCoord, 2, gl.FLOAT, false, FSIZE * 4, FSIZE * 2); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_TexCoord); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)

            let u_Sampler = gl.getUniformLocation(gl.program, 'u_Sampler');
            let texture = gl.createTexture();

            gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, 1); // 对纹理图像进行y轴反转
            gl.activeTexture(gl.TEXTURE0); // 开启0号纹理单元
            gl.bindTexture(gl.TEXTURE_2D, texture); // 向target绑定纹理对象
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.NEAREST); // 配置纹理参数
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.NEAREST); // 配置纹理参数
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE); // 配置纹理参数
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE); // 配置纹理参数
            const width = 4;
            const height = 4;
            gl.compressedTexImage2D(gl.TEXTURE_2D, 0, ext.COMPRESSED_RGBA_S3TC_DXT1_EXT, width, height, 0, new Uint8Array([
                0x1e, 0x33, 0xaa, 0xaF,
                0x1e, 0x88, 0x1e, 0x77,
            ]));
            gl.compressedTexSubImage2D(gl.TEXTURE_2D, 0, 0, 0, width, height, ext.COMPRESSED_RGBA_S3TC_DXT1_EXT, new Uint8Array([
                0xe0, 0x07, 0x00, 0xf8,
                0x13, 0x10, 0x15, 0x00,
            ]))
            if (ext.COMPRESSED_RGBA_S3TC_DXT1_EXT) {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            } else {
                expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            }
            gl.uniform1i(u_Sampler, 0);
            gl.clearColor(0.92, 0.92, 0.92, 1);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLE_STRIP, 0, arr.length / 4);
            gl.disableVertexAttribArray(a_Position);
            gl.disableVertexAttribArray(a_TexCoord);
            gl.bindTexture(gl.TEXTURE_2D, null);
            gl.bindBuffer(gl.ARRAY_BUFFER, null);
            gl.deleteBuffer(buffer);
            gl.deleteTexture(texture);
            gl.deleteShader(vertexShader);
            gl.deleteShader(fragmentShader);
            gl.deleteProgram(program);
            gl.flush();
            checkError(gl);
            done();
        })

        /**
         * @tc.name   webgl_test_compressedTexSubImage2D_Error
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0049
         * @tc.desc   Test compressedTexSubImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_compressedTexSubImage2D_Error', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_compressedTexSubImage2D_Error] compressedTexSubImage2D");
            const width = 500;
            const height = 500;
            const ext =
                gl.getExtension("WEBGL_compressed_texture_s3tc") ||
                gl.getExtension("MOZ_WEBGL_compressed_texture_s3tc") ||
                gl.getExtension("WEBKIT_WEBGL_compressed_texture_s3tc") || {};
            console.info("webgltest [webgl_test_compressedTexSubImage2D] compressedTexSubImage2D no target");
            gl.compressedTexSubImage2D(undefined, 0, 0, 0, width, height, ext.COMPRESSED_RGBA_S3TC_DXT1_EXT, new Uint8Array([
                0xe0, 0x07, 0x00, 0xf8,
                0x13, 0x10, 0x15, 0x00,
            ]))
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            console.info("webgltest [webgl_test_compressedTexSubImage2D] compressedTexSubImage2D no level");
            gl.compressedTexSubImage2D(gl.TEXTURE_2D, undefined, 0, 0, width, height, ext.COMPRESSED_RGBA_S3TC_DXT1_EXT, new Uint8Array([
                0xe0, 0x07, 0x00, 0xf8,
                0x13, 0x10, 0x15, 0x00,
            ]))
            expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            console.info("webgltest [webgl_test_compressedTexSubImage2D] compressedTexSubImage2D no xoffset");
            gl.compressedTexSubImage2D(gl.TEXTURE_2D, 0, undefined, 0, width, height, ext.COMPRESSED_RGBA_S3TC_DXT1_EXT, new Uint8Array([
                0xe0, 0x07, 0x00, 0xf8,
                0x13, 0x10, 0x15, 0x00,
            ]))
            expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            console.info("webgltest [webgl_test_compressedTexSubImage2D] compressedTexSubImage2D no yoffset");
            gl.compressedTexSubImage2D(gl.TEXTURE_2D, 0, 0, undefined, width, height, ext.COMPRESSED_RGBA_S3TC_DXT1_EXT, new Uint8Array([
                0xe0, 0x07, 0x00, 0xf8,
                0x13, 0x10, 0x15, 0x00,
            ]))
            expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            console.info("webgltest [webgl_test_compressedTexSubImage2D] compressedTexSubImage2D no width");
            gl.compressedTexSubImage2D(gl.TEXTURE_2D, 0, 0, 0, undefined, height, ext.COMPRESSED_RGBA_S3TC_DXT1_EXT, new Uint8Array([
                0xe0, 0x07, 0x00, 0xf8,
                0x13, 0x10, 0x15, 0x00,
            ]))
            expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            console.info("webgltest [webgl_test_compressedTexSubImage2D] compressedTexSubImage2D no height");
            gl.compressedTexSubImage2D(gl.TEXTURE_2D, 0, 0, 0, width, undefined, ext.COMPRESSED_RGBA_S3TC_DXT1_EXT, new Uint8Array([
                0xe0, 0x07, 0x00, 0xf8,
                0x13, 0x10, 0x15, 0x00,
            ]))
            expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            console.info("webgltest [webgl_test_compressedTexSubImage2D] compressedTexSubImage2D no format");
            gl.compressedTexSubImage2D(gl.TEXTURE_2D, 0, 0, 0, width, height, undefined, new Uint8Array([
                0xe0, 0x07, 0x00, 0xf8,
                0x13, 0x10, 0x15, 0x00,
            ]))
            expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            console.info("webgltest [webgl_test_compressedTexSubImage2D] compressedTexSubImage2D no srcData");
            gl.compressedTexSubImage2D(gl.TEXTURE_2D, 0, 0, 0, width, height, ext.COMPRESSED_RGBA_S3TC_DXT1_EXT, new Uint8Array([]))
            expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            done()
        })

        /**
         * 方法将像素从当前 WebGLFramebuffer 复制到 2D 纹理图像中。
         */

        function copyTexImage2D(callback, finish) {
            console.info("webgltest [webgl_test_copyTexImage2D] copyTexImage2D");
            let {program, vertexShader, fragmentShader} = createProgram(gl, `
                void main(){
                    gl_Position = vec4(0.0, 0.0, 0.0, 1.0);
                    gl_PointSize = 100.0;
                }
            `, `
                precision mediump float;
                void main(){
                    gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
                }
            `);
            let srcViewPort = gl.getParameter(gl.VIEWPORT);
            console.log(srcViewPort);
            gl.useProgram(program);
            gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, 1);
            gl.activeTexture(gl.TEXTURE0);
            let texture = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_2D, texture);
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
            gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, 256, 256, 0, gl.RGBA, gl.UNSIGNED_BYTE, null);
            let frameBuffer = gl.createFramebuffer();
            gl.bindFramebuffer(gl.FRAMEBUFFER, frameBuffer);
            gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.TEXTURE_2D, texture, 0);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.viewport(0, 0, 256, 256);
            gl.clearColor(0.9, 0.9, 0.9, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.POINTS, 0, 1);
            let newTexture = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_2D, newTexture);
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
            gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, 256, 256, 0, gl.RGBA, gl.UNSIGNED_BYTE, null);
            callback()
            finish()
            gl.bindFramebuffer(gl.FRAMEBUFFER, null);
            gl.viewport(srcViewPort[0], srcViewPort[1], srcViewPort[2], srcViewPort[3]);
            let p2 = createProgram(gl, `
                attribute vec4 a_Position;
                attribute vec2 a_TexCoord;
                varying vec2 v_TexCoord;
                void main(){
                    gl_Position = a_Position;
                    v_TexCoord = a_TexCoord;
                }
            `, `
                precision mediump float;
                uniform sampler2D u_Sampler;
                varying vec2 v_TexCoord;
                void main(){
                    gl_FragColor = texture2D(u_Sampler, v_TexCoord);
                }
            `);

            gl.useProgram(p2.program);
            let arr = new Float32Array([
                -0.5, 0.5, 0.0, 1.0,
                -0.5, -0.5, 0.0, 0.0,
                0.5, 0.5, 1.0, 1.0,
                0.5, -0.5, 1.0, 0.0,
            ]);
            let FSIZE = arr.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer(); // 创建缓冲区
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer); // 绑定缓冲区
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW); // 将数据写入缓冲区对象
            let a_Position = gl.getAttribLocation(p2.program, 'a_Position'); // 获取attribute变量地址
            gl.vertexAttribPointer(a_Position, 2, gl.FLOAT, false, FSIZE * 4, 0); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_Position); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)
            let a_TexCoord = gl.getAttribLocation(p2.program, 'a_TexCoord'); // 获取attribute变量地址
            gl.vertexAttribPointer(a_TexCoord, 2, gl.FLOAT, false, FSIZE * 4, FSIZE * 2); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_TexCoord); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)

            gl.bindTexture(gl.TEXTURE_2D, newTexture);
            let u_Sampler = gl.getUniformLocation(p2.program, 'u_Sampler');
            gl.uniform1i(u_Sampler, 0);
            gl.clearColor(1.92, 0.92, 0.92, 1);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLE_STRIP, 0, arr.length / 4);
            gl.flush();
            gl.disableVertexAttribArray(a_Position);
            gl.disableVertexAttribArray(a_TexCoord);
            gl.bindTexture(gl.TEXTURE_2D, null);
            gl.bindBuffer(gl.ARRAY_BUFFER, null);
            gl.deleteBuffer(buffer);
            gl.deleteFramebuffer(frameBuffer);
            gl.deleteTexture(texture);
            gl.deleteTexture(newTexture);
            gl.deleteShader(vertexShader);
            gl.deleteShader(fragmentShader);
            gl.deleteProgram(program);
            gl.deleteShader(p2.vertexShader);
            gl.deleteShader(p2.fragmentShader);
            gl.deleteProgram(p2.program);
        }


        /**
         * @tc.name   webgl_test_copyTexImage2D
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0050
         * @tc.desc   Test copyTexImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_copyTexImage2D', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_copyTexImage2D] copyTexImage2D");
            let {program, vertexShader, fragmentShader} = createProgram(gl, `
                void main(){
                    gl_Position = vec4(0.0, 0.0, 0.0, 1.0);
                    gl_PointSize = 100.0;
                }
            `, `
                precision mediump float;
                void main(){
                    gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
                }
            `);
            let srcViewPort = gl.getParameter(gl.VIEWPORT);
            console.log(srcViewPort);
            gl.useProgram(program);
            gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, 1);
            gl.activeTexture(gl.TEXTURE0);
            let texture = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_2D, texture);
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
            gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, 256, 256, 0, gl.RGBA, gl.UNSIGNED_BYTE, null);
            let frameBuffer = gl.createFramebuffer();
            gl.bindFramebuffer(gl.FRAMEBUFFER, frameBuffer);
            gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.TEXTURE_2D, texture, 0);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.viewport(0, 0, 256, 256);
            gl.clearColor(0.9, 0.9, 0.9, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.POINTS, 0, 1);
            let newTexture = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_2D, newTexture);
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
            gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, 256, 256, 0, gl.RGBA, gl.UNSIGNED_BYTE, null);
            gl.copyTexImage2D(gl.TEXTURE_2D, 0, gl.RGBA, 128, 128, 128, 128, 0);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.bindFramebuffer(gl.FRAMEBUFFER, null);
            gl.viewport(srcViewPort[0], srcViewPort[1], srcViewPort[2], srcViewPort[3]);
            let p2 = createProgram(gl, `
                attribute vec4 a_Position;
                attribute vec2 a_TexCoord;
                varying vec2 v_TexCoord;
                void main(){
                    gl_Position = a_Position;
                    v_TexCoord = a_TexCoord;
                }
            `, `
                precision mediump float;
                uniform sampler2D u_Sampler;
                varying vec2 v_TexCoord;
                void main(){
                    gl_FragColor = texture2D(u_Sampler, v_TexCoord);
                }
            `);

            gl.useProgram(p2.program);
            let arr = new Float32Array([
                -0.5, 0.5, 0.0, 1.0,
                -0.5, -0.5, 0.0, 0.0,
                0.5, 0.5, 1.0, 1.0,
                0.5, -0.5, 1.0, 0.0,
            ]);
            let FSIZE = arr.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW);
            let a_Position = gl.getAttribLocation(p2.program, 'a_Position');
            gl.vertexAttribPointer(a_Position, 2, gl.FLOAT, false, FSIZE * 4, 0);
            gl.enableVertexAttribArray(a_Position);
            let a_TexCoord = gl.getAttribLocation(p2.program, 'a_TexCoord');
            gl.vertexAttribPointer(a_TexCoord, 2, gl.FLOAT, false, FSIZE * 4, FSIZE * 2);
            gl.enableVertexAttribArray(a_TexCoord);

            gl.bindTexture(gl.TEXTURE_2D, newTexture);
            let u_Sampler = gl.getUniformLocation(p2.program, 'u_Sampler');
            gl.uniform1i(u_Sampler, 0);
            gl.clearColor(1.92, 0.92, 0.92, 1);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLE_STRIP, 0, arr.length / 4);
            gl.flush();
            gl.disableVertexAttribArray(a_Position);
            gl.disableVertexAttribArray(a_TexCoord);
            gl.bindTexture(gl.TEXTURE_2D, null);
            gl.bindBuffer(gl.ARRAY_BUFFER, null);
            gl.deleteBuffer(buffer);
            gl.deleteFramebuffer(frameBuffer);
            gl.deleteTexture(texture);
            gl.deleteTexture(newTexture);
            gl.deleteShader(vertexShader);
            gl.deleteShader(fragmentShader);
            gl.deleteProgram(program);
            gl.deleteShader(p2.vertexShader);
            gl.deleteShader(p2.fragmentShader);
            gl.deleteProgram(p2.program);
            done();
        })


        /**
         * @tc.name   webgl_test_copyTexImage2D_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0051
         * @tc.desc   Test copyTexImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_copyTexImage2D_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            copyTexImage2D(() => {
                gl.copyTexImage2D(gl.TEXTURE_CUBE_MAP_POSITIVE_X, 0, gl.RGBA, 128, 128, 128, 128, 0);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_copyTexImage2D_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0052
         * @tc.desc   Test copyTexImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_copyTexImage2D_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            copyTexImage2D(() => {
                gl.copyTexImage2D(gl.TEXTURE_CUBE_MAP_NEGATIVE_X, 0, gl.RGBA, 128, 128, 128, 128, 0);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_copyTexImage2D_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0053
         * @tc.desc   Test copyTexImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_copyTexImage2D_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            copyTexImage2D(() => {
                gl.copyTexImage2D(gl.TEXTURE_CUBE_MAP_POSITIVE_Y, 0, gl.RGBA, 128, 128, 128, 128, 0);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_copyTexImage2D_4
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0054
         * @tc.desc   Test copyTexImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_copyTexImage2D_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            copyTexImage2D(() => {
                gl.copyTexImage2D(gl.TEXTURE_CUBE_MAP_NEGATIVE_Y, 0, gl.RGBA, 128, 128, 128, 128, 0);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_copyTexImage2D_5
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0055
         * @tc.desc   Test copyTexImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_copyTexImage2D_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            copyTexImage2D(() => {
                gl.copyTexImage2D(gl.TEXTURE_CUBE_MAP_POSITIVE_Z, 0, gl.RGBA, 128, 128, 128, 128, 0);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_copyTexImage2D_6
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0056
         * @tc.desc   Test copyTexImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_copyTexImage2D_6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            copyTexImage2D(() => {
                gl.copyTexImage2D(gl.TEXTURE_CUBE_MAP_NEGATIVE_Z, 0, gl.RGBA, 128, 128, 128, 128, 0);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_copyTexImage2D_Error
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0057
         * @tc.desc   Test copyTexImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_copyTexImage2D_Error', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_copyTexImage2D] copyTexImage2D");
            const width = 500;
            const height = 500;
            console.info("webgltest [webgl_test_copyTexImage2D] copyTexImage2D no target");
            gl.copyTexImage2D(undefined, 0, 0, 0, 0, width, height, 0)
            checkError(gl)
            console.info("webgltest [webgl_test_copyTexImage2D] copyTexImage2D no level");
            gl.copyTexImage2D(gl.TEXTURE_2D, undefined, 0, 0, 0, width, height, 0)
            checkError(gl)
            console.info("webgltest [webgl_test_copyTexImage2D] copyTexImage2D no internalformat");
            gl.copyTexImage2D(gl.TEXTURE_2D, 0, undefined, 0, 0, width, height, 0)
            checkError(gl)
            console.info("webgltest [webgl_test_copyTexImage2D] copyTexImage2D no x");
            gl.copyTexImage2D(gl.TEXTURE_2D, 0, 0, undefined, 0, width, height, 0)
            checkError(gl)
            console.info("webgltest [webgl_test_copyTexImage2D] copyTexImage2D no y");
            gl.copyTexImage2D(gl.TEXTURE_2D, 0, 0, 0, undefined, width, height, 0)
            checkError(gl)
            console.info("webgltest [webgl_test_copyTexImage2D] copyTexImage2D no width");
            gl.copyTexImage2D(gl.TEXTURE_2D, 0, 0, 0, 0, undefined, height, 0)
            checkError(gl)
            console.info("webgltest [webgl_test_copyTexImage2D] copyTexImage2D no height");
            gl.copyTexImage2D(gl.TEXTURE_2D, 0, 0, 0, 0, width, undefined, 0)
            checkError(gl)
            console.info("webgltest [webgl_test_copyTexImage2D] copyTexImage2D no border");
            gl.copyTexImage2D(gl.TEXTURE_2D, 0, 0, 0, 0, width, height, undefined)
            checkError(gl)
            done()
        })

        /**
         * 方法将像素从当前 WebGLFramebuffer 复制到现有的 2D 纹理子图像中。
         */
        function copyTexSubImage2D(callback, finish) {
            console.info("webgltest [webgl_test_copyTexSubImage2D] copyTexSubImage2D");
            let {program, vertexShader, fragmentShader} = createProgram(gl, `
                void main(){
                    gl_Position = vec4(0.0, 0.0, 0.0, 1.0);
                    gl_PointSize = 50.0;
                }
            `, `
                precision mediump float;
                void main(){
                    gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
                }
            `);
            let srcViewPort = gl.getParameter(gl.VIEWPORT);
            console.log(srcViewPort);
            gl.useProgram(program);
            gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, 1);
            gl.activeTexture(gl.TEXTURE0);
            let texture = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_2D, texture);
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
            gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, 256, 256, 0, gl.RGBA, gl.UNSIGNED_BYTE, null);
            let frameBuffer = gl.createFramebuffer();
            gl.bindFramebuffer(gl.FRAMEBUFFER, frameBuffer);
            gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.TEXTURE_2D, texture, 0);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.viewport(0, 0, 256, 256);
            gl.clearColor(0.9, 0.9, 0.9, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.POINTS, 0, 1);
            let newTexture = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_2D, newTexture);
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
            gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, 256, 256, 0, gl.RGBA, gl.UNSIGNED_BYTE, null);
            console.info("webgltest", gl.isTexture(texture), gl.isTexture(newTexture));
            callback()
            finish()
            gl.bindFramebuffer(gl.FRAMEBUFFER, null);
            gl.viewport(srcViewPort[0], srcViewPort[1], srcViewPort[2], srcViewPort[3]);
            let p2 = createProgram(gl, `
                attribute vec4 a_Position;
                attribute vec2 a_TexCoord;
                varying vec2 v_TexCoord;
                void main(){
                    gl_Position = a_Position;
                    v_TexCoord = a_TexCoord;
                }
            `, `
                precision mediump float;
                uniform sampler2D u_Sampler;
                varying vec2 v_TexCoord;
                void main(){
                    gl_FragColor = texture2D(u_Sampler, v_TexCoord);
                }
            `);

            gl.useProgram(p2.program);
            let arr = new Float32Array([
                -0.5, 0.5, 0.0, 1.0,
                -0.5, -0.5, 0.0, 0.0,
                0.5, 0.5, 1.0, 1.0,
                0.5, -0.5, 1.0, 0.0,
            ]);
            let FSIZE = arr.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW);
            let a_Position = gl.getAttribLocation(p2.program, 'a_Position');
            gl.vertexAttribPointer(a_Position, 2, gl.FLOAT, false, FSIZE * 4, 0);
            gl.enableVertexAttribArray(a_Position);
            let a_TexCoord = gl.getAttribLocation(p2.program, 'a_TexCoord');
            gl.vertexAttribPointer(a_TexCoord, 2, gl.FLOAT, false, FSIZE * 4, FSIZE * 2);
            gl.enableVertexAttribArray(a_TexCoord);

            gl.bindTexture(gl.TEXTURE_2D, newTexture);
            let u_Sampler = gl.getUniformLocation(p2.program, 'u_Sampler');
            gl.uniform1i(u_Sampler, 0);
            gl.clearColor(1.92, 0.92, 0.92, 1);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLE_STRIP, 0, arr.length / 4);
            gl.flush();
            gl.disableVertexAttribArray(a_Position);
            gl.disableVertexAttribArray(a_TexCoord);
            gl.bindTexture(gl.TEXTURE_2D, null);
            gl.bindBuffer(gl.ARRAY_BUFFER, null);
            gl.deleteBuffer(buffer);
            gl.deleteFramebuffer(frameBuffer);
            gl.deleteTexture(texture);
            gl.deleteTexture(newTexture);
            gl.deleteShader(vertexShader);
            gl.deleteShader(fragmentShader);
            gl.deleteProgram(program);
            gl.deleteShader(p2.vertexShader);
            gl.deleteShader(p2.fragmentShader);
            gl.deleteProgram(p2.program);
        }


        /**
         * @tc.name   webgl_test_copyTexSubImage2D
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0058
         * @tc.desc   Test copyTexSubImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_copyTexSubImage2D', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_copyTexSubImage2D] copyTexSubImage2D");
            let {program, vertexShader, fragmentShader} = createProgram(gl, `
                void main(){
                    gl_Position = vec4(0.0, 0.0, 0.0, 1.0);
                    gl_PointSize = 50.0;
                }
            `, `
                precision mediump float;
                void main(){
                    gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
                }
            `);
            let srcViewPort = gl.getParameter(gl.VIEWPORT);
            console.log(srcViewPort);
            gl.useProgram(program);
            gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, 1);
            gl.activeTexture(gl.TEXTURE0);
            let texture = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_2D, texture);
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
            gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, 256, 256, 0, gl.RGBA, gl.UNSIGNED_BYTE, null);
            let frameBuffer = gl.createFramebuffer();
            gl.bindFramebuffer(gl.FRAMEBUFFER, frameBuffer);
            gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.TEXTURE_2D, texture, 0);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.viewport(0, 0, 256, 256);
            gl.clearColor(0.9, 0.9, 0.9, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.POINTS, 0, 1);
            let newTexture = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_2D, newTexture);
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
            gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, 256, 256, 0, gl.RGBA, gl.UNSIGNED_BYTE, null);
            console.info("webgltest", gl.isTexture(texture), gl.isTexture(newTexture));
            gl.copyTexSubImage2D(gl.TEXTURE_2D, 0, 32, 32, 32, 64, 128, 128);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);

            gl.bindFramebuffer(gl.FRAMEBUFFER, null);
            gl.viewport(srcViewPort[0], srcViewPort[1], srcViewPort[2], srcViewPort[3]);
            let p2 = createProgram(gl, `
                attribute vec4 a_Position;
                attribute vec2 a_TexCoord;
                varying vec2 v_TexCoord;
                void main(){
                    gl_Position = a_Position;
                    v_TexCoord = a_TexCoord;
                }
            `, `
                precision mediump float;
                uniform sampler2D u_Sampler;
                varying vec2 v_TexCoord;
                void main(){
                    gl_FragColor = texture2D(u_Sampler, v_TexCoord);
                }
            `);

            gl.useProgram(p2.program);
            let arr = new Float32Array([
                -0.5, 0.5, 0.0, 1.0,
                -0.5, -0.5, 0.0, 0.0,
                0.5, 0.5, 1.0, 1.0,
                0.5, -0.5, 1.0, 0.0,
            ]);
            let FSIZE = arr.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW);
            let a_Position = gl.getAttribLocation(p2.program, 'a_Position');
            gl.vertexAttribPointer(a_Position, 2, gl.FLOAT, false, FSIZE * 4, 0);
            gl.enableVertexAttribArray(a_Position);
            let a_TexCoord = gl.getAttribLocation(p2.program, 'a_TexCoord');
            gl.vertexAttribPointer(a_TexCoord, 2, gl.FLOAT, false, FSIZE * 4, FSIZE * 2);
            gl.enableVertexAttribArray(a_TexCoord);

            gl.bindTexture(gl.TEXTURE_2D, newTexture);
            let u_Sampler = gl.getUniformLocation(p2.program, 'u_Sampler');
            gl.uniform1i(u_Sampler, 0);
            gl.clearColor(1.92, 0.92, 0.92, 1);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLE_STRIP, 0, arr.length / 4);
            gl.flush();
            gl.disableVertexAttribArray(a_Position);
            gl.disableVertexAttribArray(a_TexCoord);
            gl.bindTexture(gl.TEXTURE_2D, null);
            gl.bindBuffer(gl.ARRAY_BUFFER, null);
            gl.deleteBuffer(buffer);
            gl.deleteFramebuffer(frameBuffer);
            gl.deleteTexture(texture);
            gl.deleteTexture(newTexture);
            gl.deleteShader(vertexShader);
            gl.deleteShader(fragmentShader);
            gl.deleteProgram(program);
            gl.deleteShader(p2.vertexShader);
            gl.deleteShader(p2.fragmentShader);
            gl.deleteProgram(p2.program);
            done();
        })


        /**
         * @tc.name   webgl_test_copyTexSubImage2D_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0059
         * @tc.desc   Test copyTexSubImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_copyTexSubImage2D_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            copyTexSubImage2D(() => {
                gl.copyTexSubImage2D(gl.TEXTURE_CUBE_MAP_POSITIVE_X, 0, 32, 32, 32, 64, 128, 128);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_copyTexSubImage2D_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0060
         * @tc.desc   Test copyTexSubImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_copyTexSubImage2D_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            copyTexSubImage2D(() => {
                gl.copyTexSubImage2D(gl.TEXTURE_CUBE_MAP_NEGATIVE_X, 0, 32, 32, 32, 64, 128, 128);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_copyTexSubImage2D_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0061
         * @tc.desc   Test copyTexSubImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_copyTexSubImage2D_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            copyTexSubImage2D(() => {
                gl.copyTexSubImage2D(gl.TEXTURE_CUBE_MAP_POSITIVE_Y, 0, 32, 32, 32, 64, 128, 128);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_copyTexSubImage2D_4
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0062
         * @tc.desc   Test copyTexSubImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_copyTexSubImage2D_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            copyTexSubImage2D(() => {
                gl.copyTexSubImage2D(gl.TEXTURE_CUBE_MAP_NEGATIVE_Y, 0, 32, 32, 32, 64, 128, 128);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_copyTexSubImage2D_5
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0063
         * @tc.desc   Test copyTexSubImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_copyTexSubImage2D_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            copyTexSubImage2D(() => {
                gl.copyTexSubImage2D(gl.TEXTURE_CUBE_MAP_POSITIVE_Z, 0, 32, 32, 32, 64, 128, 128);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_copyTexSubImage2D_6
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0064
         * @tc.desc   Test copyTexSubImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_copyTexSubImage2D_6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            copyTexSubImage2D(() => {
                gl.copyTexSubImage2D(gl.TEXTURE_CUBE_MAP_NEGATIVE_Z, 0, 32, 32, 32, 64, 128, 128);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_copyTexSubImage2D_Error
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0065
         * @tc.desc   Test copyTexSubImage2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_copyTexSubImage2D_Error', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_copyTexSubImage2D] copyTexSubImage2D");
            const width = 500;
            const height = 500;
            console.info("webgltest [webgl_test_copyTexSubImage2D] copyTexSubImage2D no target");
            gl.copyTexSubImage2D(undefined, 0, 0, 0, 0, 0, width, height)
            checkError(gl)
            console.info("webgltest [webgl_test_copyTexSubImage2D] copyTexSubImage2D no level");
            gl.copyTexSubImage2D(gl.TEXTURE_2D, undefined, 0, 0, 0, 0, width, height)
            checkError(gl)
            console.info("webgltest [webgl_test_copyTexSubImage2D] copyTexImage2D no xoffset");
            gl.copyTexSubImage2D(gl.TEXTURE_2D, 0, undefined, 0, 0, 0, width, height)
            checkError(gl)
            console.info("webgltest [webgl_test_copyTexSubImage2D] copyTexSubImage2D no yoffset");
            gl.copyTexSubImage2D(gl.TEXTURE_2D, 0, 0, undefined, 0, 0, width, height)
            checkError(gl)
            console.info("webgltest [webgl_test_copyTexSubImage2D] copyTexSubImage2D no x");
            gl.copyTexSubImage2D(gl.TEXTURE_2D, 0, 0, 0, undefined, 0, width, height)
            checkError(gl)
            console.info("webgltest [webgl_test_copyTexSubImage2D] copyTexSubImage2D no y");
            gl.copyTexSubImage2D(gl.TEXTURE_2D, 0, 0, 0, 0, undefined, width, height)
            checkError(gl)
            console.info("webgltest [webgl_test_copyTexSubImage2D] copyTexSubImage2D no width");
            gl.copyTexSubImage2D(gl.TEXTURE_2D, 0, 0, 0, 0, 0, undefined, height)
            checkError(gl)
            console.info("webgltest [webgl_test_copyTexSubImage2D] copyTexSubImage2D no height");
            gl.copyTexSubImage2D(gl.TEXTURE_2D, 0, 0, 0, 0, 0, width, undefined)
            checkError(gl)
            done()
        })

        function framebufferTexture2D(callback, finish) {
            console.info("webgltest [webgl_test_framebufferTexture2D] framebufferTexture2D");
            let {program, vertexShader, fragmentShader} = createProgram(gl, `
                void main(){
                    gl_Position = vec4(0.0, 0.0, 0.0, 1.0);
                    gl_PointSize = 100.0;
                }
            `, `
                precision mediump float;
                void main(){
                    gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
                }
            `);
            let srcViewPort = gl.getParameter(gl.VIEWPORT);
            console.log(srcViewPort);
            gl.useProgram(program);
            gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, 1);
            gl.activeTexture(gl.TEXTURE0);
            let texture = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_2D, texture);
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
            gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, 256, 256, 0, gl.RGBA, gl.UNSIGNED_BYTE, null);
            let frameBuffer = gl.createFramebuffer();
            gl.bindFramebuffer(gl.FRAMEBUFFER, frameBuffer);
            callback(texture)
            gl.viewport(0, 0, 256, 256);
            gl.clearColor(0.9, 0.9, 0.9, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.POINTS, 0, 1);

            gl.bindFramebuffer(gl.FRAMEBUFFER, null);
            gl.viewport(srcViewPort[0], srcViewPort[1], srcViewPort[2], srcViewPort[3]);
            let p2 = createProgram(gl, `
                attribute vec4 a_Position;
                attribute vec2 a_TexCoord;
                varying vec2 v_TexCoord;
                void main(){
                    gl_Position = a_Position;
                    v_TexCoord = a_TexCoord;
                }
            `, `
                precision mediump float;
                uniform sampler2D u_Sampler;
                varying vec2 v_TexCoord;
                void main(){
                    gl_FragColor = texture2D(u_Sampler, v_TexCoord);
                }
            `);

            gl.useProgram(p2.program);
            let arr = new Float32Array([
                -0.5, 0.5, 0.0, 1.0,
                -0.5, -0.5, 0.0, 0.0,
                0.5, 0.5, 1.0, 1.0,
                0.5, -0.5, 1.0, 0.0,
            ]);
            let FSIZE = arr.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW);
            let a_Position = gl.getAttribLocation(p2.program, 'a_Position');
            gl.vertexAttribPointer(a_Position, 2, gl.FLOAT, false, FSIZE * 4, 0);
            gl.enableVertexAttribArray(a_Position);
            let a_TexCoord = gl.getAttribLocation(p2.program, 'a_TexCoord');
            gl.vertexAttribPointer(a_TexCoord, 2, gl.FLOAT, false, FSIZE * 4, FSIZE * 2);
            gl.enableVertexAttribArray(a_TexCoord);
            gl.bindTexture(gl.TEXTURE_2D, texture);
            let u_Sampler = gl.getUniformLocation(p2.program, 'u_Sampler');
            gl.uniform1i(u_Sampler, 0);
            gl.clearColor(1.92, 0.92, 0.92, 1);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLE_STRIP, 0, arr.length / 4);
            gl.flush();
            gl.disableVertexAttribArray(a_Position);
            gl.disableVertexAttribArray(a_TexCoord);
            gl.bindTexture(gl.TEXTURE_2D, null);
            gl.bindBuffer(gl.ARRAY_BUFFER, null);
            gl.bindFramebuffer(gl.FRAMEBUFFER, null);
            gl.deleteBuffer(buffer);
            gl.deleteFramebuffer(frameBuffer);
            gl.deleteTexture(texture);
            gl.deleteShader(vertexShader);
            gl.deleteShader(fragmentShader);
            gl.deleteProgram(program);
            gl.deleteShader(p2.vertexShader);
            gl.deleteShader(p2.fragmentShader);
            gl.deleteProgram(p2.program);
            finish()
        }


        /**
         * @tc.name   webgl_test_framebufferTexture2D
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0066
         * @tc.desc   Test framebufferTexture2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_framebufferTexture2D', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_framebufferTexture2D] framebufferTexture2D");
            let {program, vertexShader, fragmentShader} = createProgram(gl, `
                void main(){
                    gl_Position = vec4(0.0, 0.0, 0.0, 1.0);
                    gl_PointSize = 100.0;
                }
            `, `
                precision mediump float;
                void main(){
                    gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
                }
            `);
            let srcViewPort = gl.getParameter(gl.VIEWPORT);
            console.log(srcViewPort);
            gl.useProgram(program);
            gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, 1);
            gl.activeTexture(gl.TEXTURE0);
            let texture = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_2D, texture);
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
            gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, 256, 256, 0, gl.RGBA, gl.UNSIGNED_BYTE, null);
            let frameBuffer = gl.createFramebuffer();
            gl.bindFramebuffer(gl.FRAMEBUFFER, frameBuffer);
            gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.TEXTURE_2D, texture, 0);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.viewport(0, 0, 256, 256);
            gl.clearColor(0.9, 0.9, 0.9, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.POINTS, 0, 1);

            gl.bindFramebuffer(gl.FRAMEBUFFER, null);
            let p2 = createProgram(gl, `
                attribute vec4 a_Position;
                attribute vec2 a_TexCoord;
                varying vec2 v_TexCoord;
                void main(){
                    gl_Position = a_Position;
                    v_TexCoord = a_TexCoord;
                }
            `, `
                precision mediump float;
                uniform sampler2D u_Sampler;
                varying vec2 v_TexCoord;
                void main(){
                    gl_FragColor = texture2D(u_Sampler, v_TexCoord);
                }
            `);

            gl.useProgram(p2.program);
            let arr = new Float32Array([
                -0.5, 0.5, 0.0, 1.0,
                -0.5, -0.5, 0.0, 0.0,
                0.5, 0.5, 1.0, 1.0,
                0.5, -0.5, 1.0, 0.0,
            ]);
            let FSIZE = arr.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer(); // 创建缓冲区
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer); // 绑定缓冲区
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW); // 将数据写入缓冲区对象
            let a_Position = gl.getAttribLocation(p2.program, 'a_Position'); // 获取attribute变量地址
            gl.vertexAttribPointer(a_Position, 2, gl.FLOAT, false, FSIZE * 4, 0); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_Position); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)
            let a_TexCoord = gl.getAttribLocation(p2.program, 'a_TexCoord'); // 获取attribute变量地址
            gl.vertexAttribPointer(a_TexCoord, 2, gl.FLOAT, false, FSIZE * 4, FSIZE * 2); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_TexCoord); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)

            gl.bindTexture(gl.TEXTURE_2D, texture);
            let u_Sampler = gl.getUniformLocation(p2.program, 'u_Sampler');
            gl.uniform1i(u_Sampler, 0); // 将0号纹理传递给着色器
            gl.clearColor(1.92, 0.92, 0.92, 1);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLE_STRIP, 0, arr.length / 4);
            gl.flush();
            gl.viewport(srcViewPort[0], srcViewPort[1], srcViewPort[2], srcViewPort[3]);
            gl.disableVertexAttribArray(a_Position);
            gl.disableVertexAttribArray(a_TexCoord);
            gl.bindTexture(gl.TEXTURE_2D, null);
            gl.bindBuffer(gl.ARRAY_BUFFER, null);
            gl.deleteBuffer(buffer);
            gl.deleteFramebuffer(frameBuffer);
            gl.deleteTexture(texture);
            gl.deleteShader(vertexShader);
            gl.deleteShader(fragmentShader);
            gl.deleteProgram(program);
            gl.deleteShader(p2.vertexShader);
            gl.deleteShader(p2.fragmentShader);
            gl.deleteProgram(p2.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.name   webgl_test_framebufferTexture2D_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0067
         * @tc.desc   Test framebufferTexture2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_framebufferTexture2D_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            framebufferTexture2D((texture) => {
                gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.DEPTH_ATTACHMENT, gl.TEXTURE_2D, texture, 0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_FRAMEBUFFER_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_framebufferTexture2D_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0068
         * @tc.desc   Test framebufferTexture2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_framebufferTexture2D_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            framebufferTexture2D((texture) => {
                gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.STENCIL_ATTACHMENT, gl.TEXTURE_2D, texture, 0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_FRAMEBUFFER_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_framebufferTexture2D_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0069
         * @tc.desc   Test framebufferTexture2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_framebufferTexture2D_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            framebufferTexture2D((texture) => {
                gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.STENCIL_ATTACHMENT,
                gl.TEXTURE_CUBE_MAP_POSITIVE_X, texture, 0);
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_FRAMEBUFFER_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_framebufferTexture2D_4
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0070
         * @tc.desc   Test framebufferTexture2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_framebufferTexture2D_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            framebufferTexture2D((texture) => {
                gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.STENCIL_ATTACHMENT,
                gl.TEXTURE_CUBE_MAP_NEGATIVE_X, texture, 0);
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_FRAMEBUFFER_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_framebufferTexture2D_5
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0071
         * @tc.desc   Test framebufferTexture2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_framebufferTexture2D_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            framebufferTexture2D((texture) => {
                gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.STENCIL_ATTACHMENT,
                gl.TEXTURE_CUBE_MAP_POSITIVE_Y, texture, 0);
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_FRAMEBUFFER_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_framebufferTexture2D_6
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0072
         * @tc.desc   Test framebufferTexture2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_framebufferTexture2D_6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            framebufferTexture2D((texture) => {
                gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.STENCIL_ATTACHMENT,
                gl.TEXTURE_CUBE_MAP_NEGATIVE_Y, texture, 0);
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_FRAMEBUFFER_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_framebufferTexture2D_7
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0073
         * @tc.desc   Test framebufferTexture2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_framebufferTexture2D_7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            framebufferTexture2D((texture) => {
                gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.STENCIL_ATTACHMENT,
                gl.TEXTURE_CUBE_MAP_POSITIVE_Z, texture, 0);
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_FRAMEBUFFER_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_framebufferTexture2D_8
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0074
         * @tc.desc   Test framebufferTexture2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_framebufferTexture2D_8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            framebufferTexture2D((texture) => {
                gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.STENCIL_ATTACHMENT,
                gl.TEXTURE_CUBE_MAP_NEGATIVE_Z, texture, 0);
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_FRAMEBUFFER_OPERATION);
            })
            done()
        })


        /**
         * @tc.name   webgl_test_framebufferTexture2D_Error
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0075
         * @tc.desc   Test framebufferTexture2D.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_framebufferTexture2D_Error', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            let texture = gl.createTexture();
            console.info("webgltest [webgl_test_framebufferTexture2D] framebufferTexture2D");
            console.info("webgltest [webgl_test_framebufferTexture2D] framebufferTexture2D no target");
            gl.framebufferTexture2D(undefined, gl.DEPTH_STENCIL_ATTACHMENT, gl.TEXTURE_2D, texture, 0)
            checkError(gl)
            console.info("webgltest [webgl_test_framebufferTexture2D] framebufferTexture2D no attachment");
            gl.framebufferTexture2D(gl.FRAMEBUFFER, undefined, gl.TEXTURE_2D, texture, 0)
            checkError(gl)
            console.info("webgltest [webgl_test_framebufferTexture2D] framebufferTexture2D no textarget");
            gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.DEPTH_STENCIL_ATTACHMENT, undefined, texture, 0)
            checkError(gl)
            console.info("webgltest [webgl_test_framebufferTexture2D] framebufferTexture2D no texture");
            gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.DEPTH_STENCIL_ATTACHMENT, gl.TEXTURE_2D, undefined, 0)
            checkError(gl)
            console.info("webgltest [webgl_test_framebufferTexture2D] framebufferTexture2D no texture");
            gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.DEPTH_STENCIL_ATTACHMENT, gl.TEXTURE_2D, texture, undefined)
            checkError(gl)
            gl.deleteTexture(texture);
            done()
        })
    })
}
