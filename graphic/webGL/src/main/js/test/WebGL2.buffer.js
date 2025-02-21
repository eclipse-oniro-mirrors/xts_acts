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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

import {checkError, createProgram, getColorUint8Array,clear,WEBGL2_FRAGMENT_SHADER_DEMO} from './WebGL2';


export default function webgl2_buffer() {
    
	describe('webgl2_buffer', function () {
        let gl = global.gl2;
        // Defines a test suite. Two parameters are supported: test suite name and test suite function.
        beforeAll(function () {
            hilog.info(0x0000, 'testTag', '%{public}s', 'webgl1_test_01 start');
            // Presets an action, which is performed only once before all test cases of the test suite start.
            // This API supports only one parameter: preset action function.
        });
        beforeEach(function () {
            // Presets an action, which is performed before each unit test case starts.
            // The number of execution times is the same as the number of test cases defined by **it**.
            // This API supports only one parameter: preset action function.
            checkError(gl);
        });
        afterEach(function () {
            // Presets a clear action, which is performed after each unit test case ends.
            // The number of execution times is the same as the number of test cases defined by **it**.
            // This API supports only one parameter: clear action function.
            checkError(gl);
        });
        afterAll(function () {
            // Presets a clear action, which is performed after all test cases of the test suite end.
            // This API supports only one parameter: clear action function.
            hilog.info(0x0000, 'testTag', '%{public}s', 'webgl1_test_01 end');
        });
        function copyBufferSubData(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                in vec4 a_position;
                in vec3 a_color;
                out vec3 v_color;
                void main(){
                    gl_Position = a_position;
                    gl_PointSize = 100.0;
                    v_color = a_color;
                }
            `, `#version 300 es
                precision mediump float;
                in vec3 v_color;
                out vec4 color;
                void main(){
                    color = vec4(v_color,1.0);
                }
            `);
            let source = new Float32Array([
                -1.0, -1.0, 1.0, 0.0, 0.0,
                -1.0, 1.0, 0.0, 1.0, 0.0,
                1.0, 1.0, 0.0, 0.0, 1.0,
                1.0, -1.0, 0.0, 0.0, 0.0,
            ]);
            let FSIZE = source.BYTES_PER_ELEMENT;
            let srcBuffer = gl.createBuffer(); //Create a buffer
            gl.bindBuffer(gl.ARRAY_BUFFER, srcBuffer); //bound buffer
            gl.bufferData(gl.ARRAY_BUFFER, source, gl.STATIC_READ, 0, 20); //writes data to a buffer object
            gl.bindBuffer(gl.COPY_READ_BUFFER, srcBuffer); //gl.COPY_READ_BUFFER A buffer used to copy from one buffer object to another
            let dstBuffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, dstBuffer);
            gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(source.length), gl.STATIC_READ, 0, 20); //gl.STATIC_DRAW data is written to the buffer object only once
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            callback();
            let a_position = gl.getAttribLocation(p.program, 'a_position');
            gl.vertexAttribPointer(a_position, 2, gl.FLOAT, false, 5 * FSIZE, 0);
            gl.enableVertexAttribArray(a_position);
            let a_color = gl.getAttribLocation(p.program, 'a_color');
            gl.vertexAttribPointer(a_color, 3, gl.FLOAT, false, 5 * FSIZE, 2 * FSIZE);
            gl.enableVertexAttribArray(a_color);
            gl.clearColor(0.8, 0.8, 0.8, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.POINTS, 0, 4);
            let result = new Uint8Array(2 * 2 * 4);
            gl.readPixels(0, 0, 2, 2, gl.RGBA, gl.UNSIGNED_BYTE, result);
            console.info("webgltest ", result);
            finish();
            gl.deleteBuffer(srcBuffer);
            gl.deleteBuffer(dstBuffer);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            gl.flush();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0001
         * @tc.name webgl2_test_copyBufferSubData
         * @tc.desc Test copyBufferSubData.
         */
        it('webgl2_test_copyBufferSubData', 0, async function (done) {
            console.info("webgl2test [webgl2_test_copyBufferSubData] copyBufferSubData");
            let p = createProgram(gl, `#version 300 es
                in vec4 a_position;
                in vec3 a_color;
                out vec3 v_color;
                void main(){
                    gl_Position = a_position;
                    gl_PointSize = 100.0;
                    v_color = a_color;
                }
            `, `#version 300 es
                precision mediump float;
                in vec3 v_color;
                out vec4 color;
                void main(){
                    color = vec4(v_color,1.0);
                }
            `);
            let source = new Float32Array([
                -1.0, -1.0, 1.0, 0.0, 0.0,
                -1.0, 1.0, 0.0, 1.0, 0.0,
                1.0, 1.0, 0.0, 0.0, 1.0,
                1.0, -1.0, 0.0, 0.0, 0.0,
            ]);
            let FSIZE = source.BYTES_PER_ELEMENT;
            let srcBuffer = gl.createBuffer(); //create buffer
            gl.bindBuffer(gl.ARRAY_BUFFER, srcBuffer); //bound buffer
            gl.bufferData(gl.ARRAY_BUFFER, source, gl.STATIC_READ, 0, 20); //writes data to a buffer object
            gl.bindBuffer(gl.COPY_READ_BUFFER, srcBuffer); //gl.COPY_READ_BUFFER A buffer used to copy from one buffer object to another
            let dstBuffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, dstBuffer);
            gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(source.length), gl.STATIC_READ, 0, 20); //gl.STATIC_DRAW data is written to the buffer object only once
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.copyBufferSubData(gl.COPY_READ_BUFFER, gl.ARRAY_BUFFER, 0 * FSIZE, 0 * FSIZE, 20 * FSIZE);
            let a_position = gl.getAttribLocation(p.program, 'a_position');
            gl.vertexAttribPointer(a_position, 2, gl.FLOAT, false, 5 * FSIZE, 0);
            gl.enableVertexAttribArray(a_position);
            let a_color = gl.getAttribLocation(p.program, 'a_color');
            gl.vertexAttribPointer(a_color, 3, gl.FLOAT, false, 5 * FSIZE, 2 * FSIZE);
            gl.enableVertexAttribArray(a_color);
            gl.clearColor(0.8, 0.8, 0.8, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.POINTS, 0, 4);
            let result = new Uint8Array(2 * 2 * 4);
            gl.readPixels(0, 0, 2, 2, gl.RGBA, gl.UNSIGNED_BYTE, result);
            console.info("webgltest ", result);
            expect(result[0]).assertEqual(255);
            expect(result[1]).assertEqual(0);
            expect(result[2]).assertEqual(0);
            expect(result[3]).assertEqual(255);
            gl.deleteBuffer(srcBuffer);
            gl.deleteBuffer(dstBuffer);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            gl.flush();
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0002
         * @tc.name webgl2_test_copyBufferSubData_1
         * @tc.desc Test copyBufferSubData.
         */
        it('webgl2_test_copyBufferSubData_1', 0, async function (done) {
            let source = new Float32Array([
                -1.0, -1.0, 1.0, 0.0, 0.0,
                -1.0, 1.0, 0.0, 1.0, 0.0,
                1.0, 1.0, 0.0, 0.0, 1.0,
                1.0, -1.0, 0.0, 0.0, 0.0,
            ]);
            let FSIZE = source.BYTES_PER_ELEMENT;
            copyBufferSubData(() => {
                gl.copyBufferSubData(gl.COPY_WRITE_BUFFER, gl.ARRAY_BUFFER, 0 * FSIZE, 0 * FSIZE, 20 * FSIZE);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0003
         * @tc.name webgl2_test_copyBufferSubData_2
         * @tc.desc Test copyBufferSubData.
         */
        it('webgl2_test_copyBufferSubData_2', 0, async function (done) {
            let source = new Float32Array([
                -1.0, -1.0, 1.0, 0.0, 0.0,
                -1.0, 1.0, 0.0, 1.0, 0.0,
                1.0, 1.0, 0.0, 0.0, 1.0,
                1.0, -1.0, 0.0, 0.0, 0.0,
            ]);
            let FSIZE = source.BYTES_PER_ELEMENT;
            copyBufferSubData(() => {
                gl.copyBufferSubData(gl.TRANSFORM_FEEDBACK_BUFFER, gl.ARRAY_BUFFER, 0 * FSIZE, 0 * FSIZE, 20 * FSIZE);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0004
         * @tc.name webgl2_test_copyBufferSubData_3
         * @tc.desc Test copyBufferSubData.
         */
        it('webgl2_test_copyBufferSubData_3', 0, async function (done) {
            let source = new Float32Array([
                -1.0, -1.0, 1.0, 0.0, 0.0,
                -1.0, 1.0, 0.0, 1.0, 0.0,
                1.0, 1.0, 0.0, 0.0, 1.0,
                1.0, -1.0, 0.0, 0.0, 0.0,
            ]);
            let FSIZE = source.BYTES_PER_ELEMENT;
            copyBufferSubData(() => {
                gl.copyBufferSubData(gl.UNIFORM_BUFFER, gl.ARRAY_BUFFER, 0 * FSIZE, 0 * FSIZE, 20 * FSIZE);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0005
         * @tc.name webgl2_test_copyBufferSubData_4
         * @tc.desc Test copyBufferSubData.
         */
        it('webgl2_test_copyBufferSubData_4', 0, async function (done) {
            let source = new Float32Array([
                -1.0, -1.0, 1.0, 0.0, 0.0,
                -1.0, 1.0, 0.0, 1.0, 0.0,
                1.0, 1.0, 0.0, 0.0, 1.0,
                1.0, -1.0, 0.0, 0.0, 0.0,
            ]);
            let FSIZE = source.BYTES_PER_ELEMENT;
            copyBufferSubData(() => {
                gl.copyBufferSubData(gl.PIXEL_PACK_BUFFER, gl.ARRAY_BUFFER, 0 * FSIZE, 0 * FSIZE, 20 * FSIZE);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0006
         * @tc.name webgl2_test_copyBufferSubData_5
         * @tc.desc Test copyBufferSubData.
         */
        it('webgl2_test_copyBufferSubData_5', 0, async function (done) {
            let source = new Float32Array([
                -1.0, -1.0, 1.0, 0.0, 0.0,
                -1.0, 1.0, 0.0, 1.0, 0.0,
                1.0, 1.0, 0.0, 0.0, 1.0,
                1.0, -1.0, 0.0, 0.0, 0.0,
            ]);
            let FSIZE = source.BYTES_PER_ELEMENT;
            copyBufferSubData(() => {
                gl.copyBufferSubData(gl.PIXEL_UNPACK_BUFFER, gl.ARRAY_BUFFER, 0 * FSIZE, 0 * FSIZE, 20 * FSIZE);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        function getBufferSubData(callback, finish) {
            console.info("webgl2test [webgl2_test_getBufferSubData] getBufferSubData");
            let p = createProgram(gl, `#version 300 es
                in vec4 a_position;
                in vec3 a_color;
                out vec3 v_color;
                void main(){
                    gl_Position = a_position;
                    gl_PointSize = 100.0;
                    v_color = a_color;
                }
            `, `#version 300 es
                precision mediump float;
                in vec3 v_color;
                out vec4 color;
                void main(){
                    color = vec4(v_color,1.0);
                }
            `);
            let source = new Float32Array([
                -1.0, -1.0, 1.0, 0.0, 0.0,
                -1.0, 1.0, 0.0, 1.0, 0.0,
                1.0, 1.0, 0.0, 0.0, 1.0,
                1.0, -1.0, 0.0, 0.0, 0.0,
            ]);
            let FSIZE = source.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            gl.bufferData(gl.ARRAY_BUFFER, source, gl.STATIC_DRAW, 0, 20);
            let a_position = gl.getAttribLocation(p.program, 'a_position');
            gl.vertexAttribPointer(a_position, 2, gl.FLOAT, false, 5 * FSIZE, 0);
            gl.enableVertexAttribArray(a_position);
            let a_color = gl.getAttribLocation(p.program, 'a_color');
            gl.vertexAttribPointer(a_color, 3, gl.FLOAT, false, 5 * FSIZE, 2 * FSIZE);
            gl.enableVertexAttribArray(a_color);
            gl.clearColor(0.8, 0.8, 0.8, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLE_FAN, 0, 4);
            let result = new Float32Array(5);
            callback(source, result);
            finish();
            gl.disableVertexAttribArray(a_color);
            gl.disableVertexAttribArray(a_position);
            gl.deleteBuffer(buffer);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            gl.flush();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0007
         * @tc.name webgl2_test_getBufferSubData_1
         * @tc.desc Test getBufferSubData.
         */
        it('webgl2_test_getBufferSubData_1', 0, async function (done) {
            getBufferSubData((source, result) => {
                gl.getBufferSubData(gl.ELEMENT_ARRAY_BUFFER, 5 * source.BYTES_PER_ELEMENT, result, 0, 5);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0008
         * @tc.name webgl2_test_getBufferSubData_2
         * @tc.desc Test getBufferSubData.
         */
        it('webgl2_test_getBufferSubData_2', 0, async function (done) {
            getBufferSubData((source, result) => {
                gl.getBufferSubData(gl.COPY_READ_BUFFER, 5 * source.BYTES_PER_ELEMENT, result, 0, 5);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0009
         * @tc.name webgl2_test_getBufferSubData_3
         * @tc.desc Test getBufferSubData.
         */
        it('webgl2_test_getBufferSubData_3', 0, async function (done) {
            getBufferSubData((source, result) => {
                gl.getBufferSubData(gl.COPY_WRITE_BUFFER, 5 * source.BYTES_PER_ELEMENT, result, 0, 5);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0010
         * @tc.name webgl2_test_getBufferSubData_4
         * @tc.desc Test getBufferSubData.
         */
        it('webgl2_test_getBufferSubData_4', 0, async function (done) {
            getBufferSubData((source, result) => {
                gl.getBufferSubData(gl.TRANSFORM_FEEDBACK_BUFFER, 5 * source.BYTES_PER_ELEMENT, result, 0, 5);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0011
         * @tc.name webgl2_test_getBufferSubData_5
         * @tc.desc Test getBufferSubData.
         */
        it('webgl2_test_getBufferSubData_5', 0, async function (done) {
            getBufferSubData((source, result) => {
                gl.getBufferSubData(gl.UNIFORM_BUFFER, 5 * source.BYTES_PER_ELEMENT, result, 0, 5);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0012
         * @tc.name webgl2_test_getBufferSubData
         * @tc.desc Test getBufferSubData.
         */
        it('webgl2_test_getBufferSubData', 0, async function (done) {
            console.info("webgl2test [webgl2_test_getBufferSubData] getBufferSubData");
            let p = createProgram(gl, `#version 300 es
                in vec4 a_position;
                in vec3 a_color;
                out vec3 v_color;
                void main(){
                    gl_Position = a_position;
                    gl_PointSize = 100.0;
                    v_color = a_color;
                }
            `, `#version 300 es
                precision mediump float;
                in vec3 v_color;
                out vec4 color;
                void main(){
                    color = vec4(v_color,1.0);
                }
            `);
            let source = new Float32Array([
                -1.0, -1.0, 1.0, 0.0, 0.0,
                -1.0, 1.0, 0.0, 1.0, 0.0,
                1.0, 1.0, 0.0, 0.0, 1.0,
                1.0, -1.0, 0.0, 0.0, 0.0,
            ]);
            let FSIZE = source.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            gl.bufferData(gl.ARRAY_BUFFER, source, gl.STATIC_DRAW, 0, 20);
            let a_position = gl.getAttribLocation(p.program, 'a_position');
            gl.vertexAttribPointer(a_position, 2, gl.FLOAT, false, 5 * FSIZE, 0);
            gl.enableVertexAttribArray(a_position);
            let a_color = gl.getAttribLocation(p.program, 'a_color');
            gl.vertexAttribPointer(a_color, 3, gl.FLOAT, false, 5 * FSIZE, 2 * FSIZE);
            gl.enableVertexAttribArray(a_color);
            gl.clearColor(0.8, 0.8, 0.8, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLE_FAN, 0, 4);
            let result = new Float32Array(5);
            gl.getBufferSubData(gl.ARRAY_BUFFER, 5 * source.BYTES_PER_ELEMENT, result, 0, 5);
            console.info("webgltest", result);
            expect(result[0]).assertEqual(-1);
            expect(result[1]).assertEqual(1);
            expect(result[2]).assertEqual(0);
            expect(result[3]).assertEqual(1);
            expect(result[4]).assertEqual(0);
            gl.disableVertexAttribArray(a_color);
            gl.disableVertexAttribArray(a_position);
            gl.deleteBuffer(buffer);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.flush();
            done();
        });
        function blitFramebuffer(callback, finish) {
            let srcViewport = gl.getParameter(gl.VIEWPORT);
            let p = createProgram(gl, `#version 300 es
                void main(){
                    gl_Position = vec4(-1.0,-1.0,0.0,1.0);
                    gl_PointSize = 300.0;
                }
            `, `#version 300 es
                precision mediump float;
                out vec4 color;
                void main(){
                    color = vec4(1.0,0.0,0.0,1.0);
                }
            `);
            let width = 1, height = 1;
            let fb1 = gl.createFramebuffer();
            gl.bindFramebuffer(gl.FRAMEBUFFER, fb1);
            let texture1 = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_2D, texture1);
            gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA8, width, height, 0, gl.RGBA, gl.UNSIGNED_BYTE, null);
            gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.TEXTURE_2D, texture1, 0);
            gl.viewport(0, 0, width, height);
            gl.clearColor(1.0, 0.0, 0.0, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.POINTS, 0, 1);
            let res = new Uint8Array(width * height * 4);
            gl.readPixels(0, 0, width, height, gl.RGBA, gl.UNSIGNED_BYTE, res);
            console.info("webgltest", res);
            let fb2 = gl.createFramebuffer();
            gl.bindFramebuffer(gl.FRAMEBUFFER, fb2);
            let texture2 = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_2D, texture2);
            gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA8, width, height, 0, gl.RGBA, gl.UNSIGNED_BYTE, null);
            gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.TEXTURE_2D, texture2, 0);
            gl.bindFramebuffer(gl.READ_FRAMEBUFFER, fb1);
            gl.bindFramebuffer(gl.DRAW_FRAMEBUFFER, fb2);
            callback(width, height);
            gl.bindFramebuffer(gl.FRAMEBUFFER, fb2);
            let res2 = new Uint8Array(width * height * 4);
            gl.readPixels(0, 0, width, height, gl.RGBA, gl.UNSIGNED_BYTE, res2);
            console.info("webgltest", res2);
            finish(res2);
            gl.viewport(srcViewport[0], srcViewport[1], srcViewport[2], srcViewport[3]);
            gl.bindFramebuffer(gl.FRAMEBUFFER, null);
            gl.bindFramebuffer(gl.READ_FRAMEBUFFER, null);
            gl.bindFramebuffer(gl.DRAW_FRAMEBUFFER, null);
            gl.deleteFramebuffer(fb1);
            gl.deleteFramebuffer(fb2);
            gl.deleteTexture(texture1);
            gl.deleteTexture(texture2);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            gl.flush();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0013
         * @tc.name webgl2_test_blitFramebuffer
         * @tc.desc Test blitFramebuffer.
         */
        it('webgl2_test_blitFramebuffer', 0, async function (done) {
            console.info("webgl2test [webgl2_test_blitFramebuffer] blitFramebuffer");
            blitFramebuffer((width, height) => {
                gl.blitFramebuffer(0, 0, width, height, 0, 0, width, height, gl.COLOR_BUFFER_BIT, gl.NEAREST);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (res) => {
                expect(res[0]).assertEqual(255);
                expect(res[1]).assertEqual(0);
                expect(res[2]).assertEqual(0);
                expect(res[3]).assertEqual(255);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0014
         * @tc.name webgl2_test_blitFramebuffer_1
         * @tc.desc Test blitFramebuffer.
         */
        it('webgl2_test_blitFramebuffer_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_blitFramebuffer_1] blitFramebuffer");
            blitFramebuffer((width, height) => {
                gl.blitFramebuffer(0, 0, width, height, 0, 0, width, height, gl.STENCIL_BUFFER_BIT, gl.NEAREST);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0015
         * @tc.name webgl2_test_blitFramebuffer_2
         * @tc.desc Test blitFramebuffer.
         */
        it('webgl2_test_blitFramebuffer_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_blitFramebuffer_2] blitFramebuffer");
            blitFramebuffer((width, height) => {
                gl.blitFramebuffer(0, 0, width, height, 0, 0, width, height, gl.DEPTH_BUFFER_BIT, gl.NEAREST);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0016
         * @tc.name webgl2_test_blitFramebuffer_3
         * @tc.desc Test blitFramebuffer.
         */
        it('webgl2_test_blitFramebuffer_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_blitFramebuffer_3] blitFramebuffer");
            blitFramebuffer((width, height) => {
                gl.blitFramebuffer(0, 0, width, height, 0, 0, width, height, gl.DEPTH_BUFFER_BIT, gl.LINEAR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0017
         * @tc.name webgl2_test_blitFramebuffer_4
         * @tc.desc Test blitFramebuffer.
         */
        it('webgl2_test_blitFramebuffer_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_blitFramebuffer_4] blitFramebuffer");
            blitFramebuffer((width, height) => {
                gl.blitFramebuffer(0, 0, width, height, 0, 0, width, height, gl.STENCIL_BUFFER_BIT, gl.LINEAR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        function framebufferTextureLayer(callback, finish) {
            let srcViewPort = gl.getParameter(gl.VIEWPORT);
            let width = 8, height = 8, depth = 3;
            let data = new Uint8Array(width * height * depth * 4);
            let colors = [[255, 0, 0, 255], [0, 255, 0, 255], [0, 0, 255, 255]];
            for (let i = 0; i < depth; i++) {
                data.set(getColorUint8Array(width, height, colors[i][0], colors[i][1], colors[i][2], colors[i][3]), width * height * 4 * i);
            }
            let a_position = 0, a_texcoord = 1;
            let vCode = `#version 300 es
                layout(location=0) in vec4 a_position;
                layout(location=1) in vec2 a_texcoord;
                out vec2 v_texcoord;
                void main(){
                    gl_Position = a_position;
                    v_texcoord = a_texcoord;
                }
            `;
            let fCode = `#version 300 es
                precision mediump float;
                precision highp int;
                precision mediump sampler2DArray;
                
                uniform sampler2DArray u_sampler;
                in vec2 v_texcoord;
                uniform int u_depth;
                out vec4 color;
                void main(){
                    color = texture(u_sampler,vec3(v_texcoord,float(u_depth)));
                }
            `;
            let source = [
                -1, -1, 0, 1,
                1, 1, 1, 0,
                -1, 1, 0, 0,
                -1, -1, 0, 1,
                1, -1, 1, 1,
                1, 1, 1, 0,
            ];
            let p1 = createProgram(gl, vCode, fCode);
            gl.useProgram(p1.program);
            gl.activeTexture(gl.TEXTURE0);
            //texture
            let texture = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_2D_ARRAY, texture);
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_BASE_LEVEL, 0);
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MAX_LEVEL, 0);
            gl.texImage3D(gl.TEXTURE_2D_ARRAY, 0, gl.RGBA, width, height, depth, 0, gl.RGBA, gl.UNSIGNED_BYTE, data);
            //renderTexture
            let renderTexture = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_2D_ARRAY, renderTexture);
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_BASE_LEVEL, 0);
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MAX_LEVEL, 0);
            gl.texImage3D(gl.TEXTURE_2D_ARRAY, 0, gl.RGBA, width, height, depth, 0, gl.RGBA, gl.UNSIGNED_BYTE, null);
            //framebuffer
            let framebuffer = gl.createFramebuffer();
            let renderbuffer = gl.createRenderbuffer();
            gl.bindFramebuffer(gl.FRAMEBUFFER, framebuffer);
            gl.bindRenderbuffer(gl.RENDERBUFFER, renderbuffer);
            gl.renderbufferStorage(gl.RENDERBUFFER, gl.DEPTH_COMPONENT16, width, height);
            let useDep = callback(renderTexture);
            gl.framebufferRenderbuffer(gl.FRAMEBUFFER, gl.DEPTH_ATTACHMENT, gl.RENDERBUFFER, renderbuffer);
            gl.viewport(0, 0, width, height);
            gl.bindTexture(gl.TEXTURE_2D_ARRAY, texture);
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(source), gl.STATIC_DRAW);
            gl.vertexAttribPointer(a_position, 2, gl.FLOAT, false, 4 * 4, 0);
            gl.vertexAttribPointer(a_texcoord, 2, gl.FLOAT, false, 4 * 4, 2 * 4);
            gl.enableVertexAttribArray(a_position);
            gl.enableVertexAttribArray(a_texcoord);
            let u_depth1 = gl.getUniformLocation(p1.program, 'u_depth');
            gl.uniform1i(u_depth1, useDep);
            gl.clearColor(0, 0, 0, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLES, 0, 6);
            gl.readBuffer(gl.COLOR_ATTACHMENT0);
            let p2 = createProgram(gl, vCode, fCode);
            gl.useProgram(p2.program);
            gl.viewport(srcViewPort[0], srcViewPort[1], srcViewPort[2], srcViewPort[3]);
            gl.bindFramebuffer(gl.FRAMEBUFFER, null);
            gl.bindTexture(gl.TEXTURE_2D_ARRAY, renderTexture);
            let buffer2 = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer2);
            gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(source), gl.STATIC_DRAW);
            gl.vertexAttribPointer(a_position, 2, gl.FLOAT, false, 4 * 4, 0);
            gl.vertexAttribPointer(a_texcoord, 2, gl.FLOAT, false, 4 * 4, 2 * 4);
            let u_depth2 = gl.getUniformLocation(p2.program, 'u_depth');
            gl.uniform1i(u_depth2, useDep);
            let u_sampler = gl.getUniformLocation(p2.program, 'u_sampler');
            gl.uniform1i(u_sampler, 0);
            gl.enableVertexAttribArray(a_position);
            gl.enableVertexAttribArray(a_texcoord);
            gl.clearColor(0, 0, 0, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLES, 0, 6);
            let res = new Uint8Array(width * height * 4);
            gl.readPixels(0, 0, width, height, gl.RGBA, gl.UNSIGNED_BYTE, res);
            finish(res);
            gl.flush();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0018
         * @tc.name webgl2_test_framebufferTextureLayer
         * @tc.desc Test framebufferTextureLayer.
         */
        it('webgl2_test_framebufferTextureLayer', 0, async function (done) {
            console.info("webgl2test [webgl2_test_framebufferTextureLayer] framebufferTextureLayer");
            framebufferTextureLayer((renderTexture) => {
                let layer = 2;
                gl.framebufferTextureLayer(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, renderTexture, 0, layer);
                return layer;
            }, (res) => {
                console.log(res);
                expect(res[0]).assertEqual(0);
                expect(res[1]).assertEqual(0);
                expect(res[2]).assertEqual(255);
                expect(res[3]).assertEqual(255);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0019
         * @tc.name webgl2_test_framebufferTextureLayer_1
         * @tc.desc Test framebufferTextureLayer.
         */
        it('webgl2_test_framebufferTextureLayer_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_framebufferTextureLayer] framebufferTextureLayer");
            framebufferTextureLayer((renderTexture) => {
                let layer = 2;
                gl.framebufferTextureLayer(gl.DRAW_FRAMEBUFFER, gl.COLOR_ATTACHMENT0, renderTexture, 0, layer);
                return layer;
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0020
         * @tc.name webgl2_test_framebufferTextureLayer_2
         * @tc.desc Test framebufferTextureLayer.
         */
        it('webgl2_test_framebufferTextureLayer_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_framebufferTextureLayer] framebufferTextureLayer");
            framebufferTextureLayer((renderTexture) => {
                let layer = 2;
                gl.framebufferTextureLayer(gl.READ_FRAMEBUFFER, gl.COLOR_ATTACHMENT0, renderTexture, 0, layer);
                return layer;
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0021
         * @tc.name webgl2_test_framebufferTextureLayer_3
         * @tc.desc Test framebufferTextureLayer.
         */
        it('webgl2_test_framebufferTextureLayer_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_framebufferTextureLayer] framebufferTextureLayer");
            framebufferTextureLayer((renderTexture) => {
                let layer = 2;
                gl.framebufferTextureLayer(gl.READ_FRAMEBUFFER, gl.DEPTH_ATTACHMENT, renderTexture, 0, layer);
                return layer;
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0022
         * @tc.name webgl2_test_framebufferTextureLayer_4
         * @tc.desc Test framebufferTextureLayer.
         */
        it('webgl2_test_framebufferTextureLayer_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_framebufferTextureLayer] framebufferTextureLayer");
            framebufferTextureLayer((renderTexture) => {
                let layer = 2;
                gl.framebufferTextureLayer(gl.READ_FRAMEBUFFER, gl.STENCIL_ATTACHMENT, renderTexture, 0, layer);
                return layer;
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_FRAMEBUFFER_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0023
         * @tc.name webgl2_test_framebufferTextureLayer_5
         * @tc.desc Test framebufferTextureLayer.
         */
        it('webgl2_test_framebufferTextureLayer_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_framebufferTextureLayer] framebufferTextureLayer");
            framebufferTextureLayer((renderTexture) => {
                let layer = 2;
                gl.framebufferTextureLayer(gl.READ_FRAMEBUFFER, gl.DEPTH_STENCIL_ATTACHMENT, renderTexture, 0, layer);
                return layer;
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_FRAMEBUFFER_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0024
         * @tc.name webgl2_test_invalidateFramebuffer
         * @tc.desc Test invalidateFramebuffer.
         */
        it('webgl2_test_invalidateFramebuffer', 0, async function (done) {
            console.info("webgl2test [webgl2_test_invalidateFramebuffer] invalidateFramebuffer");
            let framebuffer = gl.createFramebuffer();
            gl.bindFramebuffer(gl.FRAMEBUFFER, framebuffer);
            gl.invalidateFramebuffer(gl.FRAMEBUFFER, [gl.COLOR_ATTACHMENT0]);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.deleteFramebuffer(framebuffer);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0025
         * @tc.name webgl2_test_invalidateFramebuffer_1
         * @tc.desc Test invalidateFramebuffer.
         */
        it('webgl2_test_invalidateFramebuffer_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_invalidateFramebuffer] invalidateFramebuffer");
            let framebuffer = gl.createFramebuffer();
            gl.bindFramebuffer(gl.FRAMEBUFFER, framebuffer);
            gl.invalidateFramebuffer(gl.DRAW_FRAMEBUFFER, [gl.COLOR_ATTACHMENT0]);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.deleteFramebuffer(framebuffer);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0026
         * @tc.name webgl2_test_invalidateFramebuffer_2
         * @tc.desc Test invalidateFramebuffer.
         */
        it('webgl2_test_invalidateFramebuffer_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_invalidateFramebuffer] invalidateFramebuffer");
            let framebuffer = gl.createFramebuffer();
            gl.bindFramebuffer(gl.FRAMEBUFFER, framebuffer);
            gl.invalidateFramebuffer(gl.READ_FRAMEBUFFER, [gl.COLOR_ATTACHMENT0]);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.deleteFramebuffer(framebuffer);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0027
         * @tc.name webgl2_test_invalidateFramebuffer_3
         * @tc.desc Test invalidateFramebuffer.
         */
        it('webgl2_test_invalidateFramebuffer_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_invalidateFramebuffer] invalidateFramebuffer");
            let framebuffer = gl.createFramebuffer();
            gl.bindFramebuffer(gl.FRAMEBUFFER, framebuffer);
            gl.invalidateFramebuffer(gl.READ_FRAMEBUFFER, [gl.COLOR_ATTACHMENT1]);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.deleteFramebuffer(framebuffer);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0028
         * @tc.name webgl2_test_invalidateFramebuffer_4
         * @tc.desc Test invalidateFramebuffer.
         */
        it('webgl2_test_invalidateFramebuffer_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_invalidateFramebuffer] invalidateFramebuffer");
            let framebuffer = gl.createFramebuffer();
            gl.bindFramebuffer(gl.FRAMEBUFFER, framebuffer);
            gl.invalidateFramebuffer(gl.READ_FRAMEBUFFER, [gl.COLOR_ATTACHMENT2]);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.deleteFramebuffer(framebuffer);
            done();
        });
        function readBuffer(callback, finish) {
            const framebuffer = gl.createFramebuffer();
            gl.bindFramebuffer(gl.FRAMEBUFFER, framebuffer);
            const texture1 = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_2D, texture1);
            gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, 4, 4, 0, gl.RGBA, gl.UNSIGNED_BYTE, getColorUint8Array(4, 4, 255, 0, 0, 255));
            callback(texture1);
            const pixels = new Uint8Array(4 * 4 * 4);
            gl.readPixels(0, 0, 4, 4, gl.RGBA, gl.UNSIGNED_BYTE, pixels);
            finish(pixels);
            gl.bindFramebuffer(gl.FRAMEBUFFER, null);
            gl.bindTexture(gl.TEXTURE_2D, null);
            gl.deleteTexture(texture1);
            gl.deleteFramebuffer(framebuffer);
            gl.flush();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0029
         * @tc.name webgl2_test_readBuffer
         * @tc.desc Test readBuffer.
         */
        it('webgl2_test_readBuffer', 0, async function (done) {
            //Method selects a color buffer as the pixel's source for subsequent calls to copyTexImage2D, copyTexSubImage2D, copyTexSubImage3D, or readPixels.
            console.info("webgl2test [webgl2_test_readBuffer] readBuffer");
            readBuffer((texture) => {
                gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.TEXTURE_2D, texture, 0);
                gl.readBuffer(gl.COLOR_ATTACHMENT0);
            }, (pixels) => {
                expect(pixels[0]).assertEqual(255);
                expect(pixels[1]).assertEqual(0);
                expect(pixels[2]).assertEqual(0);
                expect(pixels[3]).assertEqual(255);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0030
         * @tc.name webgl2_test_readBuffer_1
         * @tc.desc Test readBuffer.
         */
        it('webgl2_test_readBuffer_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_readBuffer] readBuffer");
            readBuffer((texture) => {
                gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.TEXTURE_2D, texture, 0);
                gl.readBuffer(gl.BACK);
            }, (pixels) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0031
         * @tc.name webgl2_test_readBuffer_2
         * @tc.desc Test readBuffer.
         */
        it('webgl2_test_readBuffer_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_readBuffer] readBuffer");
            readBuffer((texture) => {
                gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.TEXTURE_2D, texture, 0);
                gl.readBuffer(gl.NONE);
            }, (pixels) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0032
         * @tc.name webgl2_test_readBuffer_3
         * @tc.desc Test readBuffer.
         */
        it('webgl2_test_readBuffer_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_readBuffer] readBuffer");
            readBuffer((texture) => {
                gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.TEXTURE_2D, texture, 0);
                gl.readBuffer(gl.COLOR_ATTACHMENT1);
            }, (pixels) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0033
         * @tc.name webgl2_test_readBuffer_4
         * @tc.desc Test readBuffer.
         */
        it('webgl2_test_readBuffer_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_readBuffer] readBuffer");
            readBuffer((texture) => {
                gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.TEXTURE_2D, texture, 0);
                gl.readBuffer(gl.COLOR_ATTACHMENT2);
            }, (pixels) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        function getInternalformatParameter(callback, finish) {
            const renderbuffer = gl.createRenderbuffer();
            gl.bindRenderbuffer(gl.RENDERBUFFER, renderbuffer);
            gl.renderbufferStorageMultisample(gl.RENDERBUFFER, 4, gl.RGBA8, 256, 256);
            callback();
            finish();
            gl.deleteRenderbuffer(renderbuffer);
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0034
         * @tc.name webgl2_test_getInternalformatParameter
         * @tc.desc Test getInternalformatParameter.
         */
        it('webgl2_test_getInternalformatParameter', 0, async function (done) {
            console.info("webgl2test [webgl2_test_getInternalformatParameter] getInternalformatParameter");
            const renderbuffer = gl.createRenderbuffer();
            gl.bindRenderbuffer(gl.RENDERBUFFER, renderbuffer);
            gl.renderbufferStorageMultisample(gl.RENDERBUFFER, 4, gl.RGBA8, 256, 256);
            const samples = gl.getInternalformatParameter(gl.RENDERBUFFER, gl.RGBA8, gl.SAMPLES);
            console.log(`Internal format parameter value:`, samples);
            expect(samples.byteLength > 0).assertEqual(true);
            gl.bindRenderbuffer(gl.RENDERBUFFER, null);
            gl.deleteRenderbuffer(renderbuffer);
            gl.flush();
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0035
         * @tc.name webgl2_test_getInternalformatParameter_1
         * @tc.desc Test getInternalformatParameter.
         */
        it('webgl2_test_getInternalformatParameter_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_getInternalformatParameter_1] getInternalformatParameter");
            readBuffer((texture) => {
                const samples = gl.getInternalformatParameter(gl.RENDERBUFFER, gl.RGBA8I, gl.SAMPLES);
                expect(samples.byteLength).assertEqual(0);
            }, (pixels) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_FRAMEBUFFER_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0036
         * @tc.name webgl2_test_getInternalformatParameter_2
         * @tc.desc Test getInternalformatParameter.
         */
        it('webgl2_test_getInternalformatParameter_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_getInternalformatParameter_2] getInternalformatParameter");
            readBuffer((texture) => {
                const samples = gl.getInternalformatParameter(gl.RENDERBUFFER, gl.RGBA16I, gl.SAMPLES);
                expect(samples.byteLength).assertEqual(0);
            }, (pixels) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_FRAMEBUFFER_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0037
         * @tc.name webgl2_test_getInternalformatParameter_3
         * @tc.desc Test getInternalformatParameter.
         */
        it('webgl2_test_getInternalformatParameter_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_getInternalformatParameter_3] getInternalformatParameter");
            readBuffer((texture) => {
                const samples = gl.getInternalformatParameter(gl.RENDERBUFFER, gl.RGBA16UI, gl.SAMPLES);
                expect(samples.byteLength).assertEqual(0);
            }, (pixels) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_FRAMEBUFFER_OPERATION);
            });
            done();
        });
        function renderbufferStorageMultisample(callback, finish) {
            const renderbuffer = gl.createRenderbuffer();
            gl.bindRenderbuffer(gl.RENDERBUFFER, renderbuffer);
            const samples = 4;
            const internalFormat = gl.RGBA8;
            const width = 256;
            const height = 256;
            callback(samples, internalFormat, width, height);
            finish();
            const maxSamples = gl.getParameter(gl.MAX_SAMPLES);
            const actualSamples = gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_SAMPLES);
            console.info("webgltest", "Max supported samples: ", maxSamples);
            console.info("webgltest", "Actual samples used: ", actualSamples);
            gl.deleteRenderbuffer(renderbuffer);
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0038
         * @tc.name webgl2_test_renderbufferStorageMultisample
         * @tc.desc Test renderbufferStorageMultisample.
         */
        it('webgl2_test_renderbufferStorageMultisample', 0, async function (done) {
            console.info("webgl2test [webgl2_test_renderbufferStorageMultisample] renderbufferStorageMultisample");
            const renderbuffer = gl.createRenderbuffer();
            gl.bindRenderbuffer(gl.RENDERBUFFER, renderbuffer);
            const samples = 4; // set the number of samples for multiple sampling
            const internalFormat = gl.RGBA8;
            const width = 256;
            const height = 256;
            gl.renderbufferStorageMultisample(gl.RENDERBUFFER, samples, internalFormat, width, height);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            const maxSamples = gl.getParameter(gl.MAX_SAMPLES);
            const actualSamples = gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_SAMPLES);
            console.info("webgltest", "Max supported samples: ", maxSamples);
            console.info("webgltest", "Actual samples used: ", actualSamples);
            expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_WIDTH)).assertEqual(256);
            expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_HEIGHT)).assertEqual(256);
            expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_INTERNAL_FORMAT)).assertEqual(gl.RGBA8);
            gl.deleteRenderbuffer(renderbuffer);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0039
         * @tc.name webgl2_test_renderbufferStorageMultisample_1
         * @tc.desc Test renderbufferStorageMultisample.
         */
        it('webgl2_test_renderbufferStorageMultisample_1', 0, async function (done) {
            renderbufferStorageMultisample((samples, internalFormat, width, height) => {
                gl.renderbufferStorageMultisample(gl.RENDERBUFFER, samples, gl.R8, width, height);
            }, () => {
                expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_INTERNAL_FORMAT)).assertEqual(gl.R8);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0040
         * @tc.name webgl2_test_renderbufferStorageMultisample_2
         * @tc.desc Test renderbufferStorageMultisample.
         */
        it('webgl2_test_renderbufferStorageMultisample_2', 0, async function (done) {
            renderbufferStorageMultisample((samples, internalFormat, width, height) => {
                gl.renderbufferStorageMultisample(gl.RENDERBUFFER, samples, gl.R8UI, width, height);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0041
         * @tc.name webgl2_test_renderbufferStorageMultisample_3
         * @tc.desc Test renderbufferStorageMultisample.
         */
        it('webgl2_test_renderbufferStorageMultisample_3', 0, async function (done) {
            renderbufferStorageMultisample((samples, internalFormat, width, height) => {
                gl.renderbufferStorageMultisample(gl.RENDERBUFFER, samples, gl.R32UI, width, height);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0042
         * @tc.name webgl2_test_renderbufferStorageMultisample_4
         * @tc.desc Test renderbufferStorageMultisample.
         */
        it('webgl2_test_renderbufferStorageMultisample_4', 0, async function (done) {
            renderbufferStorageMultisample((samples, internalFormat, width, height) => {
                gl.renderbufferStorageMultisample(gl.RENDERBUFFER, samples, gl.RG16UI, width, height);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        function vertexAttribDivisor(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                layout(location=0) in vec2 position;
                layout(location=1) in vec3 color;
                layout(location=2) in float instanceId;
                out vec3 vColor;
                void main() {
                    gl_Position = vec4(position.x + instanceId , position.y, 0.0, 1.0);
                    vColor = color;
                }
            `, `#version 300 es
                precision highp float;
                in vec3 vColor;
                out vec4 fragColor;
                void main() {
                    fragColor = vec4(vColor, 1.0);
                }
            `);
            const vertices = [
                -1.0, -1.0, 1.0, 0.0, 0.0,
                -1.0, 1.0, 1.0, 0.0, 0.0,
                1.0, -1.0, 1.0, 0.0, 0.0,
            ];
            const divisor = [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];
            const vbo = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, vbo);
            gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(vertices), gl.STATIC_DRAW);
            gl.enableVertexAttribArray(0);
            gl.enableVertexAttribArray(1);
            gl.enableVertexAttribArray(2);
            gl.vertexAttribPointer(0, 2, gl.FLOAT, false, 5 * 4, 0);
            gl.vertexAttribPointer(1, 3, gl.FLOAT, false, 5 * 4, 2 * 4);
            let buf2 = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buf2);
            gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(divisor), gl.STATIC_DRAW);
            gl.vertexAttribPointer(2, 1, gl.FLOAT, false, 1 * 4, 0); // set to update once per instance
            callback();
            gl.clearColor(1.0, 0.0, 0.0, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
            gl.drawArraysInstanced(gl.TRIANGLES, 0, 3, divisor.length);
            let pixels = new Uint8Array(4);
            gl.readPixels(0, 0, 1, 1, gl.RGBA, gl.UNSIGNED_BYTE, pixels);
            finish(pixels);
            gl.disableVertexAttribArray(0);
            gl.disableVertexAttribArray(1);
            gl.disableVertexAttribArray(2);
            gl.deleteBuffer(vbo);
            gl.deleteBuffer(buf2);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            gl.flush();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0043
         * @tc.name webgl2_test_vertexAttribDivisor
         * @tc.desc Test vertexAttribDivisor.
         */
        it('webgl2_test_vertexAttribDivisor', 0, async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribDivisor] vertexAttribDivisor");
            vertexAttribDivisor(() => {
                gl.vertexAttribDivisor(2, 1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (res) => {
                console.info("webgltest", res);
                expect(res[0]).assertEqual(255);
                expect(res[1]).assertEqual(0);
                expect(res[2]).assertEqual(0);
                expect(res[3]).assertEqual(255);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0044
         * @tc.name webgl2_test_vertexAttribDivisor_1
         * @tc.desc Test vertexAttribDivisor.
         */
        it('webgl2_test_vertexAttribDivisor_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribDivisor_1] vertexAttribDivisor");
            vertexAttribDivisor(() => {
                gl.vertexAttribDivisor(2, 0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (res) => {
                console.info("webgltest", res);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
                checkError(gl);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0045
         * @tc.name webgl2_test_vertexAttribDivisor_2
         * @tc.desc Test vertexAttribDivisor.
         */
        it('webgl2_test_vertexAttribDivisor_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribDivisor_2] vertexAttribDivisor");
            vertexAttribDivisor(() => {
                gl.vertexAttribDivisor(2, -1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (res) => {
                console.info("webgltest", res);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
                checkError(gl);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0046
         * @tc.name webgl2_test_vertexAttribDivisor_3
         * @tc.desc Test vertexAttribDivisor.
         */
        it('webgl2_test_vertexAttribDivisor_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribDivisor_3] vertexAttribDivisor");
            vertexAttribDivisor(() => {
                gl.vertexAttribDivisor(2, 2);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (res) => {
                console.info("webgltest", res);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
                checkError(gl);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0047
         * @tc.name webgl2_test_vertexAttribDivisor_4
         * @tc.desc Test vertexAttribDivisor.
         */
        it('webgl2_test_vertexAttribDivisor_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribDivisor_4] vertexAttribDivisor");
            vertexAttribDivisor(() => {
                gl.vertexAttribDivisor(2, 100);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (res) => {
                console.info("webgltest", res);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
                checkError(gl);
            });
            done();
        });
        function drawArraysInstanced(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                layout(location=0) in vec2 position;
                layout(location=1) in vec3 color;
                layout(location=2) in float instanceId;
                out vec3 vColor;
                void main() {
                    gl_Position = vec4(position.x + instanceId , position.y, 0.0, 1.0);
                    gl_PointSize = 100.0;
                    vColor = color;
                }
            `, `#version 300 es
                precision highp float;
                in vec3 vColor;
                out vec4 fragColor;
                void main() {
                    fragColor = vec4(vColor, 1.0);
                }
            `);
            const vertices = [
                -1.0, -1.0, 1.0, 0.0, 0.0,
                -1.0, 1.0, 1.0, 0.0, 0.0,
                1.0, -1.0, 1.0, 0.0, 0.0,
            ];
            const divisor = [0.0, 0.2, 0.4];
            const vbo = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, vbo);
            gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(vertices), gl.STATIC_DRAW);
            gl.enableVertexAttribArray(0);
            gl.enableVertexAttribArray(1);
            gl.enableVertexAttribArray(2);
            gl.vertexAttribPointer(0, 2, gl.FLOAT, false, 5 * 4, 0);
            gl.vertexAttribPointer(1, 3, gl.FLOAT, false, 5 * 4, 2 * 4);
            let buf2 = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buf2);
            gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(divisor), gl.STATIC_DRAW);
            gl.vertexAttribPointer(2, 1, gl.FLOAT, false, 1 * 4, 0);
            gl.vertexAttribDivisor(2, 1); // set to update once per instance
            gl.clearColor(0.0, 1.0, 1.0, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
            callback(divisor);
            let pixels = new Uint8Array(4);
            gl.readPixels(0, 0, 1, 1, gl.RGBA, gl.UNSIGNED_BYTE, pixels);
            finish(pixels);
            gl.disableVertexAttribArray(0);
            gl.disableVertexAttribArray(1);
            gl.disableVertexAttribArray(2);
            gl.deleteBuffer(buf2);
            gl.deleteBuffer(vbo);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            gl.flush();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0048
         * @tc.name webgl2_test_drawArraysInstanced
         * @tc.desc Test drawArraysInstanced.
         */
        it('webgl2_test_drawArraysInstanced', 0, async function (done) {
            console.info("webgl2test [webgl2_test_drawArraysInstanced] drawArraysInstanced");
            drawArraysInstanced((divisor) => {
                gl.drawArraysInstanced(gl.TRIANGLES, 0, 3, divisor.length);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (res) => {
                console.info("webgltest", res);
                expect(res[0]).assertEqual(255);
                expect(res[1]).assertEqual(0);
                expect(res[2]).assertEqual(0);
                expect(res[3]).assertEqual(255);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0049
         * @tc.name webgl2_test_drawArraysInstanced_1
         * @tc.desc Test drawArraysInstanced.
         */
        it('webgl2_test_drawArraysInstanced_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_drawArraysInstanced_1] drawArraysInstanced");
            drawArraysInstanced((divisor) => {
                gl.drawArraysInstanced(gl.POINTS, 0, 3, divisor.length);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (res) => {
                console.info("webgltest", res);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0050
         * @tc.name webgl2_test_drawArraysInstanced_2
         * @tc.desc Test drawArraysInstanced.
         */
        it('webgl2_test_drawArraysInstanced_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_drawArraysInstanced_2] drawArraysInstanced");
            drawArraysInstanced((divisor) => {
                gl.drawArraysInstanced(gl.LINE_STRIP, 0, 3, divisor.length);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (res) => {
                console.info("webgltest", res);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0051
         * @tc.name webgl2_test_drawArraysInstanced_3
         * @tc.desc Test drawArraysInstanced.
         */
        it('webgl2_test_drawArraysInstanced_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_drawArraysInstanced_3] drawArraysInstanced");
            drawArraysInstanced((divisor) => {
                gl.drawArraysInstanced(gl.LINE_STRIP, 0, 3, divisor.length);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (res) => {
                console.info("webgltest", res);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0052
         * @tc.name webgl2_test_drawArraysInstanced_4
         * @tc.desc Test drawArraysInstanced.
         */
        it('webgl2_test_drawArraysInstanced_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_drawArraysInstanced_4] drawArraysInstanced");
            drawArraysInstanced((divisor) => {
                gl.drawArraysInstanced(gl.LINE_LOOP, 0, 3, divisor.length);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (res) => {
                console.info("webgltest", res);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function drawElementsInstanced(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                layout(location=0) in vec2 position;
                layout(location=1) in vec3 color;
                layout(location=2) in float instanceId;
                out vec3 vColor;
                void main() {
                    gl_Position = vec4(position.x + instanceId , position.y, 0.0, 1.0);
                    vColor = color;
                }
            `, `#version 300 es
                precision highp float;
                in vec3 vColor;
                out vec4 fragColor;
                void main() {
                    fragColor = vec4(vColor, 1.0);
                }
            `);
            const vertices = [
                -1.0, -1.0, 1.0, 0.0, 0.0,
                -1.0, 1.0, 1.0, 0.0, 0.0,
                1.0, 1.0, 1.0, 0.0, 1.0,
                1.0, -1.0, 0.0, 0.0, 1.0,
            ];
            const indices = new Uint8Array([0, 1, 3, 1, 2, 3]);
            const divisor = [0.0, 0.2, 0.4];
            const vbo = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, vbo);
            gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(vertices), gl.STATIC_DRAW);
            gl.enableVertexAttribArray(0);
            gl.enableVertexAttribArray(1);
            gl.enableVertexAttribArray(2);
            gl.vertexAttribPointer(0, 2, gl.FLOAT, false, 5 * 4, 0);
            gl.vertexAttribPointer(1, 3, gl.FLOAT, false, 5 * 4, 2 * 4);
            let buf2 = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buf2);
            gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(divisor), gl.STATIC_DRAW);
            gl.vertexAttribPointer(2, 1, gl.FLOAT, false, 1 * 4, 0);
            gl.vertexAttribDivisor(2, 1); // set to update once per instance
            let indexBuffer = gl.createBuffer();
            gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, indexBuffer);
            gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, indices, gl.STATIC_DRAW);
            gl.clearColor(0.0, 1.0, 1.0, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
            callback(indices, divisor);
            let pixels = new Uint8Array(4);
            gl.readPixels(0, 0, 1, 1, gl.RGBA, gl.UNSIGNED_BYTE, pixels);
            finish(pixels);
            gl.disableVertexAttribArray(0);
            gl.disableVertexAttribArray(1);
            gl.disableVertexAttribArray(2);
            gl.deleteBuffer(indexBuffer);
            gl.deleteBuffer(buf2);
            gl.deleteBuffer(vbo);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            gl.flush();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0053
         * @tc.name webgl2_test_drawElementsInstanced
         * @tc.desc Test drawElementsInstanced.
         */
        it('webgl2_test_drawElementsInstanced', 0, async function (done) {
            console.info("webgl2test [webgl2_test_drawElementsInstanced] drawElementsInstanced");
            drawElementsInstanced((indices, divisor) => {
                gl.drawElementsInstanced(gl.TRIANGLES, indices.length, gl.UNSIGNED_BYTE, 0, divisor.length);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (res) => {
                console.info("webgltest", res);
                expect(res[0]).assertEqual(255);
                expect(res[1]).assertEqual(0);
                expect(res[2]).assertEqual(0);
                expect(res[3]).assertEqual(255);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0054
         * @tc.name webgl2_test_drawElementsInstanced_1
         * @tc.desc Test drawElementsInstanced.
         */
        it('webgl2_test_drawElementsInstanced_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_drawElementsInstanced_1] drawElementsInstanced");
            drawElementsInstanced((indices, divisor) => {
                gl.drawElementsInstanced(gl.LINE_STRIP, indices.length, gl.UNSIGNED_BYTE, 0, divisor.length);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (res) => {
                console.info("webgltest", res);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0055
         * @tc.name webgl2_test_drawElementsInstanced_3
         * @tc.desc Test drawElementsInstanced.
         */
        it('webgl2_test_drawElementsInstanced_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_drawElementsInstanced_3] drawElementsInstanced");
            drawElementsInstanced((indices, divisor) => {
                gl.drawElementsInstanced(gl.LINES, indices.length, gl.UNSIGNED_BYTE, 0, divisor.length);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (res) => {
                console.info("webgltest", res);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0056
         * @tc.name webgl2_test_drawElementsInstanced_4
         * @tc.desc Test drawElementsInstanced.
         */
        it('webgl2_test_drawElementsInstanced_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_drawElementsInstanced_4] drawElementsInstanced");
            drawElementsInstanced((indices, divisor) => {
                gl.drawElementsInstanced(gl.TRIANGLE_STRIP, indices.length, gl.UNSIGNED_BYTE, 0, divisor.length);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (res) => {
                console.info("webgltest", res);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0057
         * @tc.name webgl2_test_drawElementsInstanced_5
         * @tc.desc Test drawElementsInstanced.
         */
        it('webgl2_test_drawElementsInstanced_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_drawElementsInstanced_5] drawElementsInstanced");
            drawElementsInstanced((indices, divisor) => {
                gl.drawElementsInstanced(gl.TRIANGLE_FAN, indices.length, gl.UNSIGNED_BYTE, 0, divisor.length);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (res) => {
                console.info("webgltest", res);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function drawRangeElements(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                layout(location=0) in vec4 a_position;
                layout(location=1) in vec4 a_color;
                out vec4 v_color;
                void main(){
                    gl_Position = a_position;
                    gl_PointSize = 10.0;
                    v_color = a_color;
                }
            `, `#version 300 es
                precision mediump float;
                in vec4 v_color;
                out vec4 color;
                void main(){
                    color = v_color;
                }
            `);
            let source = new Float32Array([
                0.0, 0.0, 0.0, 1.0, 0.0, 1.0,
                -1.0, -1.0, 0.0, 1.0, 0.0, 1.0,
                1.0, -1.0, 0.0, 1.0, 0.0, 1.0,
                -1.0, 1.0, 0.0, 1.0, 0.0, 1.0,
                1.0, 1.0, 0.0, 1.0, 0.0, 1.0,
            ]);
            let indices = new Uint16Array([
                0, 1, 2,
                0, 1, 3,
                0, 3, 4,
                0, 2, 4,
            ]);
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            gl.bufferData(gl.ARRAY_BUFFER, source, gl.STATIC_DRAW, 0, source.length);
            let indexBuffer = gl.createBuffer();
            gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, indexBuffer);
            gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, indices, gl.STATIC_DRAW, 0, indices.length);
            gl.vertexAttribPointer(0, 2, gl.FLOAT, false, 6 * 4, 0);
            gl.vertexAttribPointer(1, 4, gl.FLOAT, false, 6 * 4, 2 * 4);
            gl.enableVertexAttribArray(0);
            gl.enableVertexAttribArray(1);
            gl.clearColor(1.0, 1.0, 1.0, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            callback();
            let res = new Uint8Array(2 * 2 * 4);
            gl.readPixels(0, 0, 2, 2, gl.RGBA, gl.UNSIGNED_BYTE, res);
            console.log("drawRangeElements=>", res);
            finish(res);
            gl.flush();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0058
         * @tc.name webgl2_test_drawRangeElements
         * @tc.desc Test drawRangeElements.
         */
        it('webgl2_test_drawRangeElements', 0, async function (done) {
            console.info("webgl2test [webgl2_test_drawRangeElements] drawRangeElements");
            drawRangeElements(() => {
                gl.drawRangeElements(gl.TRIANGLES, 0, 5, 6, gl.UNSIGNED_SHORT, 0 * 2);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (res) => {
                expect(res[0]).assertEqual(0);
                expect(res[1]).assertEqual(255);
                expect(res[2]).assertEqual(0);
                expect(res[3]).assertEqual(255);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0059
         * @tc.name webgl2_test_drawRangeElements_1
         * @tc.desc Test drawRangeElements.
         */
        it('webgl2_test_drawRangeElements_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_drawRangeElements_1] drawRangeElements");
            drawRangeElements(() => {
                gl.drawRangeElements(gl.POINTS, 0, 2, 6, gl.UNSIGNED_SHORT, 0 * 2);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0060
         * @tc.name webgl2_test_drawRangeElements_2
         * @tc.desc Test drawRangeElements.
         */
        it('webgl2_test_drawRangeElements_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_drawRangeElements_2] drawRangeElements");
            drawRangeElements(() => {
                gl.drawRangeElements(gl.LINE_STRIP, 0, 2, 6, gl.UNSIGNED_SHORT, 0 * 2);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0061
         * @tc.name webgl2_test_drawRangeElements_3
         * @tc.desc Test drawRangeElements.
         */
        it('webgl2_test_drawRangeElements_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_drawRangeElements_3] drawRangeElements");
            drawRangeElements(() => {
                gl.drawRangeElements(gl.LINE_LOOP, 0, 2, 6, gl.UNSIGNED_SHORT, 0 * 2);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0062
         * @tc.name webgl2_test_drawRangeElements_4
         * @tc.desc Test drawRangeElements.
         */
        it('webgl2_test_drawRangeElements_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_drawRangeElements_4] drawRangeElements");
            drawRangeElements(() => {
                gl.drawRangeElements(gl.LINES, 0, 2, 6, gl.UNSIGNED_SHORT, 0 * 2);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0063
         * @tc.name webgl2_test_drawRangeElements_5
         * @tc.desc Test drawRangeElements.
         */
        it('webgl2_test_drawRangeElements_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_drawRangeElements_5] drawRangeElements");
            drawRangeElements(() => {
                gl.drawRangeElements(gl.TRIANGLE_STRIP, 0, 2, 6, gl.UNSIGNED_SHORT, 0 * 2);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0064
         * @tc.name webgl2_test_drawRangeElements_6
         * @tc.desc Test drawRangeElements.
         */
        it('webgl2_test_drawRangeElements_6', 0, async function (done) {
            console.info("webgl2test [webgl2_test_drawRangeElements_6] drawRangeElements");
            drawRangeElements(() => {
                gl.drawRangeElements(gl.TRIANGLE_FAN, 0, 2, 6, gl.UNSIGNED_SHORT, 0 * 2);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function drawBuffers(callback, finish) {
            let srcViewport = gl.getParameter(gl.VIEWPORT);
            let p = createProgram(gl, `#version 300 es
                void main() {
                    gl_PointSize = 300.0;
                    gl_Position = vec4(0, 0, 0, 1);
                }
            `, `#version 300 es
                precision mediump float;
                layout(location = 0) out vec4 outColor0;
                layout(location = 1) out vec4 outColor1;
                layout(location = 2) out vec4 outColor2;
                void main() {
                    outColor0 = vec4(1.0, 0.0, 0.0, 1.0);  
                    outColor1 = vec4(0.0, 1.0, 0.0, 1.0); 
                    outColor2 = vec4(0.0, 0.0, 1.0, 1.0); 
                }
            `);
            let fb = gl.createFramebuffer();
            gl.bindFramebuffer(gl.FRAMEBUFFER, fb);
            let textures = [];
            for (let i = 0; i < 3; i++) {
                let texture = gl.createTexture();
                textures.push(texture);
                gl.bindTexture(gl.TEXTURE_2D, texture);
                gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA8, 1, 1, 0, gl.RGBA, gl.UNSIGNED_BYTE, null);
                gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0 + i, gl.TEXTURE_2D, texture, 0);
            }
            callback();
            gl.viewport(0, 0, 1, 1);
            gl.drawArrays(gl.POINTS, 0, 1);
            let result = new Uint8Array(1 * 1 * 4);
            gl.readPixels(0, 0, 1, 1, gl.RGBA, gl.UNSIGNED_BYTE, result);
            console.info("webgltest ", result);
            finish(result);
            textures.forEach((it) => gl.deleteTexture(it));
            gl.viewport(srcViewport[0], srcViewport[1], srcViewport[2], srcViewport[3]);
            gl.bindFramebuffer(gl.FRAMEBUFFER, null);
            gl.deleteFramebuffer(fb);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            gl.flush();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0065
         * @tc.name webgl2_test_drawBuffers
         * @tc.desc Test drawBuffers.
         */
        it('webgl2_test_drawBuffers', 0, async function (done) {
            console.info("webgl2test [webgl2_test_drawBuffers] drawBuffers");
            drawBuffers(() => {
                gl.drawBuffers([gl.COLOR_ATTACHMENT0, gl.COLOR_ATTACHMENT1, gl.COLOR_ATTACHMENT2, gl.COLOR_ATTACHMENT3]);
                gl.readBuffer(gl.COLOR_ATTACHMENT0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (result) => {
                expect(result[0]).assertEqual(255);
                expect(result[1]).assertEqual(0);
                expect(result[2]).assertEqual(0);
                expect(result[3]).assertEqual(255);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0066
         * @tc.name webgl2_test_drawBuffers_1
         * @tc.desc Test drawBuffers.
         */
        it('webgl2_test_drawBuffers_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_drawBuffers_1] drawBuffers");
            drawBuffers(() => {
                gl.drawBuffers([gl.COLOR_ATTACHMENT0, gl.COLOR_ATTACHMENT1, gl.COLOR_ATTACHMENT2, gl.COLOR_ATTACHMENT3]);
                gl.readBuffer(gl.NONE);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (result) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0067
         * @tc.name webgl2_test_drawBuffers_2
         * @tc.desc Test drawBuffers.
         */
        it('webgl2_test_drawBuffers_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_drawBuffers_2] drawBuffers");
            drawBuffers(() => {
                gl.drawBuffers([gl.COLOR_ATTACHMENT0, gl.COLOR_ATTACHMENT1, gl.COLOR_ATTACHMENT2, gl.COLOR_ATTACHMENT3]);
                gl.readBuffer(gl.BACK);
            }, (result) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0068
         * @tc.name webgl2_test_drawBuffers_3
         * @tc.desc Test drawBuffers.
         */
        it('webgl2_test_drawBuffers_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_drawBuffers_3] drawBuffers");
            drawBuffers(() => {
                gl.drawBuffers([gl.COLOR_ATTACHMENT0, gl.COLOR_ATTACHMENT1, gl.COLOR_ATTACHMENT2, gl.COLOR_ATTACHMENT3]);
                gl.readBuffer(gl.COLOR_ATTACHMENT1);
            }, (result) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0069
         * @tc.name webgl2_test_drawBuffers_4
         * @tc.desc Test drawBuffers.
         */
        it('webgl2_test_drawBuffers_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_drawBuffers_4] drawBuffers");
            drawBuffers(() => {
                gl.drawBuffers([gl.COLOR_ATTACHMENT0, gl.COLOR_ATTACHMENT1, gl.COLOR_ATTACHMENT2, gl.COLOR_ATTACHMENT3]);
                gl.readBuffer(gl.COLOR_ATTACHMENT2);
            }, (result) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0070
         * @tc.name webgl2_test_drawBuffers_5
         * @tc.desc Test drawBuffers.
         */
        it('webgl2_test_drawBuffers_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_drawBuffers_5] drawBuffers");
            drawBuffers(() => {
                gl.drawBuffers([gl.COLOR_ATTACHMENT0, gl.COLOR_ATTACHMENT1, gl.COLOR_ATTACHMENT2, gl.COLOR_ATTACHMENT3]);
                gl.readBuffer(gl.COLOR_ATTACHMENT3);
            }, (result) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        function clearBufferfv(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                void main(){
                    gl_Position = vec4(0.0,0.0,0.0,1.0);
                    gl_PointSize= 100.0;
                }
            `, `#version 300 es
                precision mediump float;
                out vec4 color;
                void main(){
                    color = vec4(1.0,0.0,0.0,1.0);
                }
            `);
            callback();
            gl.drawArrays(gl.POINTS, 0, 1);
            let result = new Uint8Array(1 * 1 * 4);
            gl.readPixels(0, 0, 1, 1, gl.RGBA, gl.UNSIGNED_BYTE, result);
            console.info("webgltest ", result);
            finish(result);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            gl.flush();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0071
         * @tc.name webgl2_test_clearBufferfv
         * @tc.desc Test clearBufferfv.
         */
        it('webgl2_test_clearBufferfv', 0, async function (done) {
            console.info("webgl2test [webgl2_test_clearBufferfv] clearBufferfv");
            clearBufferfv(() => {
                gl.clearBufferfv(gl.COLOR, 0, new Float32Array([0.0, 0.0, 1.0, 1.0]));
            }, (result) => {
                expect(result[0]).assertEqual(0);
                expect(result[1]).assertEqual(0);
                expect(result[2]).assertEqual(255);
                expect(result[3]).assertEqual(255);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0072
         * @tc.name webgl2_test_clearBufferfv_1
         * @tc.desc Test clearBufferfv.
         */
        it('webgl2_test_clearBufferfv_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_clearBufferfv_1] clearBufferfv");
            clearBufferfv(() => {
                gl.clearBufferfv(gl.DEPTH, 0, new Float32Array([0.0, 0.0, 1.0, 1.0]));
            }, (result) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0073
         * @tc.name webgl2_test_clearBufferfv_2
         * @tc.desc Test clearBufferfv.
         */
        it('webgl2_test_clearBufferfv_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_clearBufferfv_2] clearBufferfv");
            clearBufferfv(() => {
                gl.clearBufferfv(gl.STENCIL, 0, new Float32Array([0.0, 0.0, 1.0, 1.0]));
            }, (result) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0074
         * @tc.name webgl2_test_clearBufferfv_3
         * @tc.desc Test clearBufferfv.
         */
        it('webgl2_test_clearBufferfv_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_clearBufferfv_3] clearBufferfv");
            clearBufferfv(() => {
                gl.clearBufferfv(gl.DEPTH_STENCIL, 0, new Float32Array([0.0, 0.0, 1.0, 1.0]));
            }, (result) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            });
            done();
        });
        function clearBufferiv(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                void main(){
                    gl_Position = vec4(0.0,0.0,0.0,1.0);
                    gl_PointSize= 100.0;
                }
            `, `#version 300 es
                precision mediump float;
                out vec4 color;
                void main(){
                    color = vec4(1.0,0.0,0.0,1.0);
                }
            `);
            let framebuffer = gl.createFramebuffer();
            gl.bindFramebuffer(gl.FRAMEBUFFER, framebuffer);
            // Creates and binds a render buffer object as a color attachment
            const colorRenderbuffer = gl.createRenderbuffer();
            gl.bindRenderbuffer(gl.RENDERBUFFER, colorRenderbuffer);
            gl.renderbufferStorage(gl.RENDERBUFFER, gl.RGBA8I, 100, 100);
            gl.framebufferRenderbuffer(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.RENDERBUFFER, colorRenderbuffer);
            callback();
            let result = new Int32Array(100 * 100 * 4);
            gl.readPixels(0, 0, 100, 100, gl.RGBA_INTEGER, gl.INT, result);
            console.info("webgltest ", result);
            finish(result);
            gl.bindRenderbuffer(gl.RENDERBUFFER, null);
            gl.bindFramebuffer(gl.FRAMEBUFFER, null);
            gl.deleteFramebuffer(framebuffer);
            gl.deleteRenderbuffer(colorRenderbuffer);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            gl.flush();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0075
         * @tc.name webgl2_test_clearBufferiv
         * @tc.desc Test clearBufferiv.
         */
        it('webgl2_test_clearBufferiv', 0, async function (done) {
            console.info("webgl2test [webgl2_test_clearBufferiv] clearBufferiv");
            clearBufferiv(() => {
                gl.clearBufferiv(gl.COLOR, 0, new Int32Array([0, 0, 127, 127]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (result) => {
                expect(result[0]).assertEqual(0);
                expect(result[1]).assertEqual(0);
                expect(result[2]).assertEqual(127);
                expect(result[3]).assertEqual(127);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0076
         * @tc.name webgl2_test_clearBufferiv_1
         * @tc.desc Test clearBufferiv.
         */
        it('webgl2_test_clearBufferiv_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_clearBufferiv_1] clearBufferiv");
            clearBufferiv(() => {
                gl.clearBufferiv(gl.DEPTH, 0, new Int32Array([0, 0, 127, 127]));
            }, (result) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0077
         * @tc.name webgl2_test_clearBufferiv_2
         * @tc.desc Test clearBufferiv.
         */
        it('webgl2_test_clearBufferiv_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_clearBufferiv_2] clearBufferiv");
            clearBufferiv(() => {
                gl.clearBufferiv(gl.STENCIL, 0, new Int32Array([0, 0, 127, 127]));
            }, (result) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function clearBufferuiv(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                void main(){
                    gl_Position = vec4(0.0,0.0,0.0,1.0);
                    gl_PointSize= 100.0;
                }
            `, `#version 300 es
                precision mediump float;
                out vec4 color;
                void main(){
                    color = vec4(1.0,0.0,0.0,1.0);
                }
            `);
            let framebuffer = gl.createFramebuffer();
            gl.bindFramebuffer(gl.FRAMEBUFFER, framebuffer);
            // Creates and binds a render buffer object as a color attachment
            const colorRenderbuffer = gl.createRenderbuffer();
            gl.bindRenderbuffer(gl.RENDERBUFFER, colorRenderbuffer);
            gl.renderbufferStorage(gl.RENDERBUFFER, gl.RGBA8UI, 1, 1);
            gl.framebufferRenderbuffer(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.RENDERBUFFER, colorRenderbuffer);
            callback();
            let result = new Uint32Array(1 * 1 * 4);
            gl.readPixels(0, 0, 1, 1, gl.RGBA_INTEGER, gl.UNSIGNED_INT, result);
            console.info("webgltest ", result);
            finish(result);
            gl.bindRenderbuffer(gl.RENDERBUFFER, null);
            gl.bindFramebuffer(gl.FRAMEBUFFER, null);
            gl.deleteFramebuffer(framebuffer);
            gl.deleteRenderbuffer(colorRenderbuffer);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0078
         * @tc.name webgl2_test_clearBufferuiv
         * @tc.desc Test clearBufferuiv.
         */
        it('webgl2_test_clearBufferuiv', 0, async function (done) {
            console.info("webgl2test [webgl2_test_clearBufferuiv] clearBufferuiv");
            clearBufferuiv(() => {
                gl.clearBufferuiv(gl.COLOR, 0, new Uint32Array([255, 255, 255, 255]));
            }, (res) => {
                expect(res[0]).assertEqual(255);
                expect(res[1]).assertEqual(255);
                expect(res[2]).assertEqual(255);
                expect(res[3]).assertEqual(255);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0079
         * @tc.name webgl2_test_clearBufferuiv_1
         * @tc.desc Test clearBufferuiv.
         */
        it('webgl2_test_clearBufferuiv_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_clearBufferuiv_1] clearBufferuiv");
            clearBufferuiv(() => {
                gl.clearBufferuiv(gl.DEPTH, 0, new Uint32Array([255, 255, 255, 255]));
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0080
         * @tc.name webgl2_test_clearBufferuiv_2
         * @tc.desc Test clearBufferuiv.
         */
        it('webgl2_test_clearBufferuiv_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_clearBufferuiv_2] clearBufferuiv");
            clearBufferuiv(() => {
                gl.clearBufferuiv(gl.STENCIL, 0, new Uint32Array([255, 255, 255, 255]));
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0081
         * @tc.name webgl2_test_clearBufferuiv_3
         * @tc.desc Test clearBufferuiv.
         */
        it('webgl2_test_clearBufferuiv_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_clearBufferuiv_3] clearBufferuiv");
            clearBufferuiv(() => {
                gl.clearBufferuiv(gl.DEPTH_STENCIL, 0, new Uint32Array([255, 255, 255, 255]));
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            });
            done();
        });
        function clearBufferfi(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                layout(location=0)in vec4 a_position;
                layout(location=1)in vec3 a_color;
                out vec3 v_color;
                void main(){
                    gl_Position = a_position;
                    gl_PointSize= 100.0;
                    v_color = a_color;
                }
            `, `#version 300 es
                precision mediump float;
                in vec3 v_color;
                out vec4 color;
                void main(){
                    color = vec4(v_color,1.0);
                }
            `);
            let arr = new Float32Array([
                1.0, 1.0, 0.1, 1.0, 0.0, 1.0,
                -1.0, 1.0, 0.1, 1.0, 0.0, 1.0,
                -1.0, -1.0, 0.1, 1.0, 0.0, 1.0,
                1.0, -1.0, 0.1, 1.0, 0.0, 1.0,
            ]);
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW, 0, arr.length);
            let indexBuffer = gl.createBuffer();
            gl.vertexAttribPointer(0, 3, gl.FLOAT, false, 6 * 4, 0);
            gl.vertexAttribPointer(1, 3, gl.FLOAT, false, 6 * 4, 3 * 4);
            gl.enableVertexAttribArray(0);
            gl.enableVertexAttribArray(1);
            gl.enable(gl.DEPTH_TEST);
            gl.enable(gl.POLYGON_OFFSET_FILL);
            gl.polygonOffset(0.1, .1);
            gl.clearColor(0.0, 0.0, 1.0, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT | gl.STENCIL_BUFFER_BIT);
            callback();
            gl.drawArrays(gl.TRIANGLE_FAN, 0, 4);
            gl.flush();
            let result = new Uint8Array(1 * 1 * 4);
            gl.readPixels(0, 0, 1, 1, gl.RGBA, gl.UNSIGNED_BYTE, result);
            console.info("webgltest ", result);
            finish(result);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            gl.disable(gl.DEPTH_TEST);
            gl.flush();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0082
         * @tc.name webgl2_test_clearBufferfi
         * @tc.desc Test clearBufferfi.
         */
        it('webgl2_test_clearBufferfi', 0, async function (done) {
            console.info("webgl2test [webgl2_test_clearBufferfi] clearBufferfi");
            clearBufferfi(() => {
                gl.clearBufferfi(gl.DEPTH_STENCIL, 0, 0.6, 0);
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0083
         * @tc.name webgl2_test_clearBufferfi_1
         * @tc.desc Test clearBufferfi.
         */
        it('webgl2_test_clearBufferfi_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_clearBufferfi_1] clearBufferfi");
            clearBufferfi(() => {
                gl.clearBufferfi(gl.COLOR, 0, 0.6, 0);
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0084
         * @tc.name webgl2_test_clearBufferfi_2
         * @tc.desc Test clearBufferfi.
         */
        it('webgl2_test_clearBufferfi_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_clearBufferfi_2] clearBufferfi");
            clearBufferfi(() => {
                gl.clearBufferfi(gl.DEPTH, 0, 0.6, 0);
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0085
         * @tc.name webgl2_test_clearBufferfi_3
         * @tc.desc Test clearBufferfi.
         */
        it('webgl2_test_clearBufferfi_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_clearBufferfi_2] clearBufferfi");
            clearBufferfi(() => {
                gl.clearBufferfi(gl.DEPTH_STENCIL, 0, 0.6, 0);
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function bindBufferBase(callback, finish) {
            const uniformBuffer = gl.createBuffer();
            gl.bindBuffer(gl.UNIFORM_BUFFER, uniformBuffer);
            gl.bufferData(gl.UNIFORM_BUFFER, new Float32Array([1.0, 2.0, 3.0]), gl.STATIC_DRAW);
            callback(uniformBuffer);
            const boundBuffer = gl.getIndexedParameter(gl.UNIFORM_BUFFER_BINDING, 0);
            console.info('webgltest', boundBuffer);
            finish(boundBuffer, uniformBuffer);
            gl.deleteBuffer(uniformBuffer);
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0086
         * @tc.name webgl2_test_bindBufferBase
         * @tc.desc Test bindBufferBase.
         */
        it('webgl2_test_bindBufferBase', 0, async function (done) {
            console.info("webgl2test [webgl2_test_bindBufferBase] bindBufferBase");
            const uniformBuffer = gl.createBuffer();
            gl.bindBuffer(gl.UNIFORM_BUFFER, uniformBuffer);
            gl.bufferData(gl.UNIFORM_BUFFER, new Float32Array([1.0, 2.0, 3.0]), gl.STATIC_DRAW);
            gl.bindBufferBase(gl.UNIFORM_BUFFER, 0, uniformBuffer);
            const boundBuffer = gl.getIndexedParameter(gl.UNIFORM_BUFFER_BINDING, 0);
            console.info('webgltest', boundBuffer);
            expect(boundBuffer).assertEqual(uniformBuffer);
            gl.deleteBuffer(uniformBuffer);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0087
         * @tc.name webgl2_test_bindBufferBase_1
         * @tc.desc Test bindBufferBase.
         */
        it('webgl2_test_bindBufferBase_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_bindBufferBase_1] bindBufferBase");
            bindBufferBase((uniformBuffer) => {
                gl.bindBufferBase(gl.TRANSFORM_FEEDBACK_BUFFER, 0, uniformBuffer);
            }, (boundBuffer, uniformBuffer) => {
                expect(boundBuffer === uniformBuffer).assertEqual(false);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0088
         * @tc.name webgl2_test_bindBufferBase_2
         * @tc.desc Test bindBufferBase.
         */
        it('webgl2_test_bindBufferBase_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_bindBufferBase_2] bindBufferBase");
            bindBufferBase((uniformBuffer) => {
                gl.bindBufferBase(gl.TRANSFORM_FEEDBACK_BUFFER, 0, uniformBuffer);
            }, (boundBuffer, uniformBuffer) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function bindBufferRange(callback, finish) {
            console.info("webgl2test [webgl2_test_bindBufferRange] bindBufferRange");
            const uniformBuffer = gl.createBuffer();
            gl.bindBuffer(gl.UNIFORM_BUFFER, uniformBuffer);
            let float32Array = new Float32Array(256 * 4);
            gl.bufferData(gl.UNIFORM_BUFFER, float32Array, gl.STATIC_DRAW);
            const alignment = gl.getParameter(gl.UNIFORM_BUFFER_OFFSET_ALIGNMENT);
            console.info("webgltest UNIFORM_BUFFER_OFFSET_ALIGNMENT", alignment);
            let offset = alignment * 2;
            callback(uniformBuffer, offset, float32Array);
            const boundBuffer = gl.getIndexedParameter(gl.UNIFORM_BUFFER_BINDING, 0);
            finish(offset, float32Array);
            console.info('webgltest', boundBuffer);
            gl.deleteBuffer(uniformBuffer);
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0089
         * @tc.name webgl2_test_bindBufferRange
         * @tc.desc Test bindBufferRange.
         */
        it('webgl2_test_bindBufferRange', 0, async function (done) {
            console.info("webgl2test [webgl2_test_bindBufferRange] bindBufferRange");
            const uniformBuffer = gl.createBuffer();
            gl.bindBuffer(gl.UNIFORM_BUFFER, uniformBuffer);
            let float32Array = new Float32Array(256 * 4);
            gl.bufferData(gl.UNIFORM_BUFFER, float32Array, gl.STATIC_DRAW);
            const alignment = gl.getParameter(gl.UNIFORM_BUFFER_OFFSET_ALIGNMENT);
            console.info("webgltest UNIFORM_BUFFER_OFFSET_ALIGNMENT", alignment);
            let offset = alignment * 2;
            gl.bindBufferRange(gl.UNIFORM_BUFFER, 0, uniformBuffer, offset, float32Array.length * float32Array.BYTES_PER_ELEMENT);
            const boundBuffer = gl.getIndexedParameter(gl.UNIFORM_BUFFER_BINDING, 0);
            expect(gl.getIndexedParameter(gl.UNIFORM_BUFFER_START, 0)).assertEqual(offset);
            expect(gl.getIndexedParameter(gl.UNIFORM_BUFFER_SIZE, 0)).assertEqual(float32Array.length * float32Array.BYTES_PER_ELEMENT);
            console.info('webgltest', boundBuffer);
            expect(boundBuffer).assertEqual(uniformBuffer);
            gl.deleteBuffer(uniformBuffer);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0090
         * @tc.name webgl2_test_bindBufferRange_1
         * @tc.desc Test bindBufferRange.
         */
        it('webgl2_test_bindBufferRange_1', 0, async function (done) {
            bindBufferRange((uniformBuffer, offset, float32Array) => {
                gl.bindBufferRange(gl.TRANSFORM_FEEDBACK_BUFFER, 0, uniformBuffer, offset, float32Array.length * float32Array.BYTES_PER_ELEMENT);
            }, (offset, float32Array) => {
                expect(gl.getIndexedParameter(gl.UNIFORM_BUFFER_SIZE, 0)).assertEqual(0);
                expect(gl.getIndexedParameter(gl.UNIFORM_BUFFER_START, 0)).assertEqual(0);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0091
         * @tc.name webgl2_test_bindBufferRange_2
         * @tc.desc Test bindBufferRange.
         */
        it('webgl2_test_bindBufferRange_2', 0, async function (done) {
            bindBufferRange((uniformBuffer, offset, float32Array) => {
                gl.bindBufferRange(gl.TRANSFORM_FEEDBACK_BUFFER, 1, uniformBuffer, offset, float32Array.length * float32Array.BYTES_PER_ELEMENT);
            }, (offset, float32Array) => {
                expect(gl.getIndexedParameter(gl.UNIFORM_BUFFER_SIZE, 0)).assertEqual(0);
                expect(gl.getIndexedParameter(gl.UNIFORM_BUFFER_START, 0)).assertEqual(0);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0092
         * @tc.name webgl2_test_getIndexedParameter
         * @tc.desc Test getIndexedParameter.
         */
        it('webgl2_test_getIndexedParameter', 0, async function (done) {
            console.info("webgl2test [webgl2_test_getIndexedParameter] getIndexedParameter");
            const uniformBuffer = gl.createBuffer();
            gl.bindBuffer(gl.UNIFORM_BUFFER, uniformBuffer);
            let float32Array = new Float32Array(256 * 4);
            gl.bufferData(gl.UNIFORM_BUFFER, float32Array, gl.STATIC_DRAW);
            const alignment = gl.getParameter(gl.UNIFORM_BUFFER_OFFSET_ALIGNMENT);
            console.info("webgltest UNIFORM_BUFFER_OFFSET_ALIGNMENT", alignment);
            let offset = alignment * 2;
            gl.bindBufferRange(gl.UNIFORM_BUFFER, 0, uniformBuffer, offset, float32Array.length * float32Array.BYTES_PER_ELEMENT);
            const boundBuffer = gl.getIndexedParameter(gl.UNIFORM_BUFFER_BINDING, 0);
            expect(gl.getIndexedParameter(gl.UNIFORM_BUFFER_START, 0)).assertEqual(offset);
            expect(gl.getIndexedParameter(gl.UNIFORM_BUFFER_SIZE, 0)).assertEqual(float32Array.length * float32Array.BYTES_PER_ELEMENT);
            console.info('webgltest', boundBuffer);
            expect(boundBuffer).assertEqual(uniformBuffer);
            gl.deleteBuffer(uniformBuffer);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0093
         * @tc.name webgl2_test_getUniformIndices
         * @tc.desc Test getUniformIndices.
         */
        it('webgl2_test_getUniformIndices', 0, async function (done) {
            console.info("webgl2test [webgl2_test_getUniformIndices] getUniformIndices");
            let p = createProgram(gl, `#version 300 es
                uniform float u_size_1;
                uniform float u_size_2;
                void main(){
                    gl_Position = vec4(0.0,0.0,0.0,1.0);
                    gl_PointSize = u_size_1 + u_size_2;
                }
            `, `#version 300 es
                precision mediump float;
                out vec4 color;
                void main(){
                    color = vec4(1.0,0.0,0.0,1.0);
                }
            `);
            let indices = [...gl.getUniformIndices(p.program, ['u_size_1', 'u_size_2', 'u_size_3'])];
            console.info("webgltest", indices);
            expect(indices[0]).assertLargerOrEqual(0);
            expect(indices[1]).assertLargerOrEqual(0);
            expect(indices[2] !== 2).assertEqual(true);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0094
         * @tc.name webgl2_test_getActiveUniforms
         * @tc.desc Test getActiveUniforms.
         */
        it('webgl2_test_getActiveUniforms', 0, async function (done) {
            console.info("webgl2test [webgl2_test_getActiveUniforms] getActiveUniforms");
            let p = createProgram(gl, `#version 300 es
                uniform float u_size_1;
                uniform float u_size_2;
                uniform float u_size_3;
                void main(){
                    gl_Position = vec4(0.0,0.0,0.0,1.0);
                    gl_PointSize = u_size_1 + u_size_2 + u_size_3;
                }
            `, `#version 300 es
                precision mediump float;
                out vec4 color;
                void main(){
                    color = vec4(1.0,0.0,0.0,1.0);
                }
            `);
            const activeUniformsCount = gl.getProgramParameter(p.program, gl.ACTIVE_UNIFORMS);
            console.log(activeUniformsCount);
            let uniformIndices = gl.getUniformIndices(p.program, ['u_size_1', 'u_size_2', 'u_size_3']);
            const uniformOffsets = gl.getActiveUniforms(p.program, uniformIndices, gl.UNIFORM_TYPE);
            console.info("webgltest", uniformIndices, uniformOffsets);
            expect(uniformOffsets[0]).assertEqual(gl.FLOAT);
            expect(uniformOffsets[1]).assertEqual(gl.FLOAT);
            expect(uniformOffsets[2]).assertEqual(gl.FLOAT);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0095
         * @tc.name webgl2_test_getUniformBlockIndex
         * @tc.desc Test getUniformBlockIndex.
         */
        it('webgl2_test_getUniformBlockIndex', 0, async function (done) {
            console.info("webgl2test [webgl2_test_getUniformBlockIndex] getUniformBlockIndex");
            let p = createProgram(gl, `#version 300 es
                uniform float u_size_1;
                uniform float u_size_2;
                uniform float u_size_3;
                uniform UBOData1 {
                    mat4 u_matrix;
                } instanceName1;
                uniform UBOData2 {
                    mat4 u_matrix;
                } instanceName2;
                void main(){
                    gl_Position = vec4(0.0,0.0,0.0,1.0);
                    gl_PointSize = u_size_1 + u_size_2 + u_size_3;
                }
            `, `#version 300 es
                precision mediump float;
                out vec4 color;
                void main(){
                    color = vec4(1.0,0.0,0.0,1.0);
                }
            `);
            const blockIndex1 = gl.getUniformBlockIndex(p.program, "UBOData1");
            const blockIndex2 = gl.getUniformBlockIndex(p.program, "UBOData2");
            console.info("webgltest", blockIndex1, blockIndex2);
            expect(blockIndex1 >= 0).assertEqual(true);
            expect(blockIndex2 >= 0).assertEqual(true);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0096
         * @tc.name webgl2_test_getActiveUniformBlockParameter
         * @tc.desc Test getActiveUniformBlockParameter.
         */
        it('webgl2_test_getActiveUniformBlockParameter', 0, async function (done) {
            console.info("webgl2test [webgl2_test_getActiveUniformBlockParameter] getActiveUniformBlockParameter");
            let p = createProgram(gl, `#version 300 es
                uniform float u_size_1;
                uniform float u_size_2;
                uniform float u_size_3;
                uniform UBOData1 {
                    mat4 u_matrix1;
                    mat4 u_matrix2;
                } instanceName1;
                uniform UBOData2 {
                    mat4 u_matrix;
                } instanceName2;
                void main(){
                    gl_Position = vec4(0.0,0.0,0.0,1.0);
                    gl_PointSize = u_size_1 + u_size_2 + u_size_3;
                }
            `, `#version 300 es
                precision mediump float;
                out vec4 color;
                void main(){
                    color = vec4(1.0,0.0,0.0,1.0);
                }
            `);
            let activeUniformBlocksCount = gl.getProgramParameter(p.program, gl.ACTIVE_UNIFORM_BLOCKS);
            console.log(activeUniformBlocksCount);
            const uniformBlockSize = gl.getActiveUniformBlockParameter(p.program, 0, gl.UNIFORM_BLOCK_DATA_SIZE);
            let uniformBlockActiveUniforms = gl.getActiveUniformBlockParameter(p.program, 0, gl.UNIFORM_BLOCK_ACTIVE_UNIFORMS);
            expect(uniformBlockSize >= 0).assertEqual(true);
            expect(uniformBlockActiveUniforms >= 0).assertEqual(true);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0097
         * @tc.name webgl2_test_getActiveUniformBlockName
         * @tc.desc Test getActiveUniformBlockName.
         */
        it('webgl2_test_getActiveUniformBlockName', 0, async function (done) {
            console.info("webgl2test [webgl2_test_getActiveUniformBlockName] getActiveUniformBlockNatexImage2Dme");
            let p = createProgram(gl, `#version 300 es
                uniform float u_size_1;
                uniform float u_size_2;
                uniform float u_size_3;
                uniform UBOData1 {
                    mat4 u_matrix1;
                    mat4 u_matrix2;
                } instanceName1;
                uniform UBOData2 {
                    mat4 u_matrix;
                } instanceName2;
                void main(){
                    gl_Position = vec4(0.0,0.0,0.0,1.0);
                    gl_PointSize = u_size_1 + u_size_2 + u_size_3;
                }
            `, `#version 300 es
                precision mediump float;
                out vec4 color;
                void main(){
                    color = vec4(1.0,0.0,0.0,1.0);
                }
            `);
            let blockName1 = gl.getActiveUniformBlockName(p.program, 1);
            let blockName2 = gl.getActiveUniformBlockName(p.program, 0);
            console.info("webgltest", blockName1, blockName2);
            expect(blockName1).assertEqual("UBOData1");
            expect(blockName2).assertEqual("UBOData2");
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            done();
        });
        function uniformBlockBinding(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                uniform float u_size_1;
                uniform float u_size_2;
                uniform float u_size_3;
                uniform UBOData1 {
                    mat4 u_matrix1;
                    mat4 u_matrix2;
                } instanceName1;
                uniform UBOData2 {
                    mat4 u_matrix;
                } instanceName2;
                void main(){
                    gl_Position = vec4(0.0,0.0,0.0,1.0);
                    gl_PointSize = u_size_1 + u_size_2 + u_size_3;
                }
            `, `#version 300 es
                precision mediump float;
                out vec4 color;
                void main(){
                    color = vec4(1.0,0.0,0.0,1.0);
                }
            `);
            const uniformBlockIndex = gl.getUniformBlockIndex(p.program, "UBOData1");
            callback(uniformBlockIndex, p.program);
            const uniformBlockBinding = gl.getActiveUniformBlockParameter(p.program, uniformBlockIndex, gl.UNIFORM_BLOCK_BINDING);
            console.info("webgltest uniformBlockBinding: ", uniformBlockBinding);
            finish(uniformBlockBinding);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0098
         * @tc.name webgl2_test_uniformBlockBinding
         * @tc.desc Test uniformBlockBinding.
         */
        it('webgl2_test_uniformBlockBinding', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformBlockBinding] uniformBlockBinding");
            uniformBlockBinding((uniformBlockIndex, program) => {
                gl.uniformBlockBinding(program, uniformBlockIndex, 10);
                console.log(gl.getUniformBlockIndex(program, "UBOData1"));
                console.log(gl.getUniformBlockIndex(program, "UBOData2"));
                console.log(gl.getActiveUniformBlockParameter(program, gl.getUniformBlockIndex(program, "UBOData1"), gl.UNIFORM_BLOCK_BINDING));
                console.log(gl.getActiveUniformBlockParameter(program, gl.getUniformBlockIndex(program, "UBOData2"), gl.UNIFORM_BLOCK_BINDING));
            }, (res) => {
                expect(res).assertEqual(10);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0099
         * @tc.name webgl2_test_uniformBlockBinding_1
         * @tc.desc Test uniformBlockBinding.
         */
        it('webgl2_test_uniformBlockBinding_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformBlockBinding_1] uniformBlockBinding");
            uniformBlockBinding((uniformBlockIndex, program) => {
                gl.uniformBlockBinding(program, 1, 10);
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
                expect(res).assertLargerOrEqual(0);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0100
         * @tc.name webgl2_test_uniformBlockBinding_2
         * @tc.desc Test uniformBlockBinding.
         */
        it('webgl2_test_uniformBlockBinding_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformBlockBinding_2] uniformBlockBinding");
            uniformBlockBinding((uniformBlockIndex, program) => {
                gl.uniformBlockBinding(program, -1, 10);
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
                expect(res).assertEqual(0);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0101
         * @tc.name webgl2_test_uniformBlockBinding_3
         * @tc.desc Test uniformBlockBinding.
         */
        it('webgl2_test_uniformBlockBinding_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformBlockBinding_3] uniformBlockBinding");
            uniformBlockBinding((uniformBlockIndex, program) => {
                gl.uniformBlockBinding(program, -1, -1);
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
                expect(res).assertEqual(0);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0102
         * @tc.name webgl2_test_uniformBlockBinding_4
         * @tc.desc Test uniformBlockBinding.
         */
        it('webgl2_test_uniformBlockBinding_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformBlockBinding_4] uniformBlockBinding");
            uniformBlockBinding((uniformBlockIndex, program) => {
                gl.uniformBlockBinding(program, 10, -1);
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
                expect(res).assertEqual(0);
            });
            done();
        });
        function bufferData(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                in vec4 a_position;
                in vec3 a_color;
                out vec3 v_color;
                void main(){
                    gl_Position = a_position;
                    gl_PointSize = 100.0;
                    v_color = a_color;
                }
            `, `#version 300 es
                precision mediump float;
                in vec3 v_color;
                out vec4 color;
                void main(){
                    color = vec4(v_color,1.0);
                }
            `);
            let source = new Float32Array([
                0, 0, 0, 0, 0,
                -1.0, -1.0, 1.0, 0.0, 0.0,
                -1.0, 1.0, 0.0, 1.0, 0.0,
                1.0, 1.0, 0.0, 0.0, 1.0,
                1.0, -1.0, 0.0, 0.0, 0.0,
            ]);
            let num = 4;
            let FSIZE = source.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            callback(source);
            let a_position = gl.getAttribLocation(p.program, 'a_position');
            gl.vertexAttribPointer(a_position, 2, gl.FLOAT, false, 5 * FSIZE, 0);
            gl.enableVertexAttribArray(a_position);
            let a_color = gl.getAttribLocation(p.program, 'a_color');
            gl.vertexAttribPointer(a_color, 3, gl.FLOAT, false, 5 * FSIZE, 2 * FSIZE);
            gl.enableVertexAttribArray(a_color);
            gl.clearColor(0.8, 0.8, 0.8, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.POINTS, 0, 1);
            let result = new Uint8Array(1 * 1 * 4);
            gl.readPixels(0, 0, 1, 1, gl.RGBA, gl.UNSIGNED_BYTE, result);
            console.info("webgltest ", result);
            finish(result);
            gl.deleteBuffer(buffer);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            gl.disableVertexAttribArray(a_color);
            gl.disableVertexAttribArray(a_position);
            gl.flush();
            checkError(gl);
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0103
         * @tc.name webgl2_test_bufferData
         * @tc.desc Test bufferData.
         */
        it('webgl2_test_bufferData', 0, async function (done) {
            console.info("webgl2test [webgl2_test_bufferData] bufferData");
            bufferData((source) => {
                gl.bufferData(gl.ARRAY_BUFFER, source, gl.STATIC_READ, 5, 5);
            }, (result) => {
                expect(result[0]).assertEqual(255);
                expect(result[1]).assertEqual(0);
                expect(result[2]).assertEqual(0);
                expect(result[3]).assertEqual(255);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0104
         * @tc.name webgl2_test_bufferData_1
         * @tc.desc Test bufferData.
         */
        it('webgl2_test_bufferData_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_bufferData_1] bufferData");
            bufferData((source) => {
                gl.bufferData(gl.COPY_READ_BUFFER, source, gl.STATIC_READ, 5, 5);
            }, (result) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0105
         * @tc.name webgl2_test_bufferData_2
         * @tc.desc Test bufferData.
         */
        it('webgl2_test_bufferData_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_bufferData_2] bufferData");
            bufferData((source) => {
                gl.bufferData(gl.COPY_WRITE_BUFFER, source, gl.STATIC_READ, 5, 5);
            }, (result) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0106
         * @tc.name webgl2_test_bufferData_3
         * @tc.desc Test bufferData.
         */
        it('webgl2_test_bufferData_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_bufferData_3] bufferData");
            bufferData((source) => {
                gl.bufferData(gl.TRANSFORM_FEEDBACK_BUFFER, source, gl.STATIC_READ, 5, 5);
            }, (result) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0107
         * @tc.name webgl2_test_bufferData_4
         * @tc.desc Test bufferData.
         */
        it('webgl2_test_bufferData_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_bufferData_4] bufferData");
            bufferData((source) => {
                gl.bufferData(gl.UNIFORM_BUFFER, source, gl.STATIC_READ, 5, 5);
            }, (result) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0108
         * @tc.name webgl2_test_bufferData_5
         * @tc.desc Test bufferData.
         */
        it('webgl2_test_bufferData_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_bufferData_5] bufferData");
            bufferData((source) => {
                gl.bufferData(gl.PIXEL_PACK_BUFFER, source, gl.STATIC_READ, 5, 5);
            }, (result) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0109
         * @tc.name webgl2_test_bufferData_6
         * @tc.desc Test bufferData.
         */
        it('webgl2_test_bufferData_6', 0, async function (done) {
            console.info("webgl2test [webgl2_test_bufferData_6] bufferData");
            bufferData((source) => {
                gl.bufferData(gl.PIXEL_UNPACK_BUFFER, source, gl.STATIC_READ, 5, 5);
            }, (result) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        function bufferSubData(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                in vec4 a_position;
                void main(){
                    gl_Position = a_position;
                }
            `, `#version 300 es
                precision mediump float;
                out vec4 color;
                void main(){
                    color = vec4(1.0,0.0,0.0,1.0);
                }
            `);
            // create vertex data
            const vertices = [
                -0.5, -0.5, 0.0,
                0.5, -0.5, 0.0,
                -0.5, 0.5, 0.0
            ];
            // create a buffer object and bind the data
            const vertexBuffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, vertexBuffer);
            gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(vertices), gl.STATIC_DRAW);
            const a_Position = gl.getAttribLocation(p.program, 'a_position');
            gl.vertexAttribPointer(a_Position, 3, gl.FLOAT, false, 0, 0);
            gl.enableVertexAttribArray(a_Position);
            callback();
            gl.clearColor(0.0, 0.0, 0.0, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLES, 0, 3);
            let result = new Uint8Array(1 * 1 * 4);
            gl.readPixels(0, 0, 1, 1, gl.RGBA, gl.UNSIGNED_BYTE, result);
            console.info("webgltest ", result);
            finish(result);
            gl.disableVertexAttribArray(a_Position);
            gl.deleteBuffer(vertexBuffer);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            gl.flush();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0110
         * @tc.name webgl2_test_bufferSubData
         * @tc.desc Test bufferSubData.
         */
        it('webgl2_test_bufferSubData', 0, async function (done) {
            console.info("webgl2test [webgl2_test_bufferSubData] bufferSubData");
            bufferSubData(() => {
                gl.bufferSubData(gl.ARRAY_BUFFER, 0, new Float32Array([
                    -1.0, -1.0, 0.0,
                    1.0, -1.0, 0.0,
                    -1.0, 1.0, 0.0
                ]));
            }, (result) => {
                expect(result[0]).assertEqual(255);
                expect(result[1]).assertEqual(0);
                expect(result[2]).assertEqual(0);
                expect(result[3]).assertEqual(255);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0111
         * @tc.name webgl2_test_bufferSubData_1
         * @tc.desc Test bufferSubData.
         */
        it('webgl2_test_bufferSubData_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_bufferSubData_1] bufferSubData");
            bufferSubData(() => {
                gl.bufferSubData(gl.COPY_READ_BUFFER, 0, new Float32Array([
                    -1.0, -1.0, 0.0,
                    1.0, -1.0, 0.0,
                    -1.0, 1.0, 0.0
                ]));
            }, (result) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0112
         * @tc.name webgl2_test_bufferSubData_2
         * @tc.desc Test bufferSubData.
         */
        it('webgl2_test_bufferSubData_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_bufferSubData_2] bufferSubData");
            bufferSubData(() => {
                gl.bufferSubData(gl.COPY_WRITE_BUFFER, 0, new Float32Array([
                    -1.0, -1.0, 0.0,
                    1.0, -1.0, 0.0,
                    -1.0, 1.0, 0.0
                ]));
            }, (result) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0113
         * @tc.name webgl2_test_bufferSubData_3
         * @tc.desc Test bufferSubData.
         */
        it('webgl2_test_bufferSubData_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_bufferSubData_3] bufferSubData");
            bufferSubData(() => {
                gl.bufferSubData(gl.COPY_WRITE_BUFFER, 0, new Float32Array([
                    -1.0, -1.0, 0.0,
                    1.0, -1.0, 0.0,
                    -1.0, 1.0, 0.0
                ]));
            }, (result) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0114
         * @tc.name webgl2_test_bufferSubData_4
         * @tc.desc Test bufferSubData.
         */
        it('webgl2_test_bufferSubData_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_bufferSubData_4] bufferSubData");
            bufferSubData(() => {
                gl.bufferSubData(gl.TRANSFORM_FEEDBACK_BUFFER, 0, new Float32Array([
                    -1.0, -1.0, 0.0,
                    1.0, -1.0, 0.0,
                    -1.0, 1.0, 0.0
                ]));
            }, (result) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0115
         * @tc.name webgl2_test_bufferSubData_5
         * @tc.desc Test bufferSubData.
         */
        it('webgl2_test_bufferSubData_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_bufferSubData_5] bufferSubData");
            bufferSubData(() => {
                gl.bufferSubData(gl.UNIFORM_BUFFER, 0, new Float32Array([
                    -1.0, -1.0, 0.0,
                    1.0, -1.0, 0.0,
                    -1.0, 1.0, 0.0
                ]));
            }, (result) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0116
         * @tc.name webgl2_test_bufferSubData_6
         * @tc.desc Test bufferSubData.
         */
        it('webgl2_test_bufferSubData_6', 0, async function (done) {
            console.info("webgl2test [webgl2_test_bufferSubData_6] bufferSubData");
            bufferSubData(() => {
                gl.bufferSubData(gl.PIXEL_PACK_BUFFER, 0, new Float32Array([
                    -1.0, -1.0, 0.0,
                    1.0, -1.0, 0.0,
                    -1.0, 1.0, 0.0
                ]));
            }, (result) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0117
         * @tc.name webgl2_test_bufferSubData_7
         * @tc.desc Test bufferSubData.
         */
        it('webgl2_test_bufferSubData_7', 0, async function (done) {
            console.info("webgl2test [webgl2_test_bufferSubData_7] bufferSubData");
            bufferSubData(() => {
                gl.bufferSubData(gl.PIXEL_UNPACK_BUFFER, 0, new Float32Array([
                    -1.0, -1.0, 0.0,
                    1.0, -1.0, 0.0,
                    -1.0, 1.0, 0.0
                ]));
            }, (result) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
    })
}
