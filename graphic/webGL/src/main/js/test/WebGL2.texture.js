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


export default function webgl2_texture() {
    
	describe('webgl2_texture', function () {
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
        // All levels of two-dimensional texture storage are specified. This function acts like tex Image 2D, but it does not initialize the texture image data.
        function texStorage2D(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                in vec4 a_position;
                in vec2 a_texcoord;
                out vec2 v_texcoord;
                void main(){
                    gl_Position = a_position;
                    v_texcoord = a_texcoord;
                }
            `, `#version 300 es
                precision mediump float;
                precision highp sampler2D;
                in vec2 v_texcoord;
                out vec4 color;
                uniform sampler2D u_sampler;
                void main(){
                    color = texture(u_sampler, v_texcoord);
                }
            `);
            let source = new Float32Array([
                -1.0, -1.0, 0.0, 0.0,
                1.0, -1.0, 1.0, 0.0,
                -1.0, 1.0, 0.0, 1.0,
                1.0, 1.0, 1.0, 1.0,
            ]);
            let num = 4;
            let FSIZE = source.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            gl.bufferData(gl.ARRAY_BUFFER, source, gl.STATIC_READ, 0, 16);
            let a_position = gl.getAttribLocation(p.program, 'a_position');
            gl.vertexAttribPointer(a_position, 2, gl.FLOAT, false, 4 * FSIZE, 0);
            gl.enableVertexAttribArray(a_position);
            let a_texcoord = gl.getAttribLocation(p.program, 'a_texcoord');
            gl.vertexAttribPointer(a_texcoord, 2, gl.FLOAT, false, 4 * FSIZE, 2 * FSIZE);
            gl.enableVertexAttribArray(a_texcoord);
            let u_sampler = gl.getUniformLocation(p.program, 'u_sampler');
            let texture = gl.createTexture();
            gl.activeTexture(gl.TEXTURE0);
            gl.bindTexture(gl.TEXTURE_2D, texture);
            gl.uniform1i(u_sampler, 0);
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.NEAREST);
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.NEAREST);
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE);
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE);
            callback();
            gl.clearColor(1, 1, 0, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLE_STRIP, 0, num);
            finish();
            gl.disableVertexAttribArray(a_position);
            gl.disableVertexAttribArray(a_texcoord);
            gl.deleteTexture(texture);
            gl.deleteBuffer(buffer);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0001
         * @tc.name webgl2_test_texStorage2D
         * @tc.desc Test texStorage2D.
         */
        it('webgl2_test_texStorage2D', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texStorage2D] texStorage2D");
            texStorage2D(() => {
                gl.texStorage2D(gl.TEXTURE_2D, 1, gl.RGBA8, 120, 120);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
                let image = getColorUint8Array(120, 120, 255, 0, 0, 255);
                gl.texSubImage2D(gl.TEXTURE_2D, 0, 0, 0, 120, 120, gl.RGBA, gl.UNSIGNED_BYTE, image);
            }, () => {
                let result = new Uint8Array(2 * 2 * 4);
                gl.readPixels(0, 0, 2, 2, gl.RGBA, gl.UNSIGNED_BYTE, result);
                console.info("webgltest ", result);
                expect(result[0]).assertEqual(255);
                expect(result[1]).assertEqual(0);
                expect(result[2]).assertEqual(0);
                expect(result[3]).assertEqual(255);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0002
         * @tc.name webgl2_test_texStorage2D_1
         * @tc.desc Test texStorage2D.
         */
        it('webgl2_test_texStorage2D_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texStorage2D_1] texStorage2D");
            texStorage2D(() => {
                gl.texStorage2D(gl.TEXTURE_CUBE_MAP, 1, gl.RGBA8, 120, 120);
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
                let image = getColorUint8Array(120, 120, 255, 0, 0, 255);
                gl.texSubImage2D(gl.TEXTURE_2D, 0, 0, 0, 120, 120, gl.RGBA, gl.UNSIGNED_BYTE, image);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0003
         * @tc.name webgl2_test_texStorage2D_2
         * @tc.desc Test texStorage2D.
         */
        it('webgl2_test_texStorage2D_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texStorage2D_2] texStorage2D");
            texStorage2D(() => {
                gl.texStorage2D(gl.TEXTURE_CUBE_MAP, 1, gl.R16F, 120, 120);
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
                let image = getColorUint8Array(120, 120, 255, 0, 0, 255);
                gl.texSubImage2D(gl.TEXTURE_2D, 0, 0, 0, 120, 120, gl.RGBA, gl.UNSIGNED_BYTE, image);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0004
         * @tc.name webgl2_test_texStorage2D_3
         * @tc.desc Test texStorage2D.
         */
        it('webgl2_test_texStorage2D_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texStorage2D_3] texStorage2D");
            texStorage2D(() => {
                gl.texStorage2D(gl.TEXTURE_2D, 1, gl.R8UI, 120, 120);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
                let image = getColorUint8Array(120, 120, 255, 0, 0, 255);
                gl.texSubImage2D(gl.TEXTURE_2D, 0, 0, 0, 120, 120, gl.RGBA, gl.UNSIGNED_BYTE, image);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0005
         * @tc.name webgl2_test_texStorage2D_4
         * @tc.desc Test texStorage2D.
         */
        it('webgl2_test_texStorage2D_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texStorage2D_4] texStorage2D");
            texStorage2D(() => {
                gl.texStorage2D(gl.TEXTURE_2D, 1, gl.RG16F, 120, 120);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
                let image = getColorUint8Array(120, 120, 255, 0, 0, 255);
                gl.texSubImage2D(gl.TEXTURE_2D, 0, 0, 0, 120, 120, gl.RGBA, gl.UNSIGNED_BYTE, image);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0006
         * @tc.name webgl2_test_texStorage2D_5
         * @tc.desc Test texStorage2D.
         */
        it('webgl2_test_texStorage2D_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texStorage2D_2] texStorage2D");
            texStorage2D(() => {
                gl.texStorage2D(gl.TEXTURE_2D, 1, gl.R11F_G11F_B10F, 120, 120);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
                let image = getColorUint8Array(120, 120, 255, 0, 0, 255);
                gl.texSubImage2D(gl.TEXTURE_2D, 0, 0, 0, 120, 120, gl.RGBA, gl.UNSIGNED_BYTE, image);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        function texStorage3D(callback, finish) {
            const data = new Uint8Array(128 * 1280 * 4); // four bytes represent the rgba value of a pixel
            let colors = [
                [255, 0, 0, 255],
                [0, 255, 0, 255],
                [0, 0, 255, 255],
                [255, 255, 0, 255],
                [255, 0, 255, 255],
                [0, 255, 255, 255],
                [255, 255, 255, 255],
                [128, 128, 128, 255],
                [0, 0, 0, 255],
                [255, 255, 255, 255],
            ];
            for (let i = 0; i < 10; i++) {
                let arr = getColorUint8Array(128, 128, colors[i][0], colors[i][1], colors[i][2], 255);
                data.set(arr, 128 * 128 * 4 * i);
            }
            let p = createProgram(gl, `#version 300 es
                layout(location=0) in vec4 a_position;
                layout(location=1) in vec2 a_texCoord;
                layout(location=2) in float a_depth;
                out vec2 v_texcoord;
                out float v_depth;
                void main(){
                    gl_Position = a_position;
                    v_texcoord = a_texCoord;
                    v_depth = a_depth;
                }
            `, `#version 300 es
                precision mediump float;
                uniform mediump sampler2DArray u_sampler;
                in vec2 v_texcoord;
                in float v_depth;
                out vec4 color;
                void main(){
                    color = texture(u_sampler, vec3(v_texcoord,v_depth));
                }
            `);
            let source = new Float32Array([
                -1, -1, 0, 1,
                1, 1, 1, 0,
                -1, 1, 0, 0,
                -1, -1, 0, 1,
                1, -1, 1, 1,
                1, 1, 1, 0,
            ]);
            let depth = 0;
            let texture = gl.createTexture();
            gl.activeTexture(gl.TEXTURE0);
            gl.bindTexture(gl.TEXTURE_2D_ARRAY, texture);
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MIN_FILTER, gl.NEAREST);
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MAG_FILTER, gl.NEAREST);
            callback(data);
            gl.texSubImage3D(gl.TEXTURE_2D_ARRAY, 0, 0, 0, 0, 128, 128, 10, gl.RGBA, gl.UNSIGNED_BYTE, data);
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            gl.bufferData(gl.ARRAY_BUFFER, source, gl.STATIC_DRAW);
            gl.vertexAttribPointer(0, 2, gl.FLOAT, false, 4 * 4, 0);
            gl.vertexAttribPointer(1, 2, gl.FLOAT, false, 4 * 4, 2 * 4);
            gl.vertexAttrib1f(2, 2);
            gl.enableVertexAttribArray(0);
            gl.enableVertexAttribArray(1);
            gl.generateMipmap(gl.TEXTURE_2D_ARRAY);
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_BASE_LEVEL, 0);
            gl.clearColor(1.0, 1.0, 0.0, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLES, 0, 6);
            let res = new Uint8Array(128 * 128 * 4);
            gl.readPixels(0, 0, 128, 128, gl.RGBA, gl.UNSIGNED_BYTE, res);
            finish(res);
            gl.disableVertexAttribArray(0);
            gl.disableVertexAttribArray(1);
            gl.deleteBuffer(buffer);
            gl.deleteTexture(texture);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            gl.flush();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0007
         * @tc.name webgl2_test_texStorage3D
         * @tc.desc Test texStorage3D.
         */
        it('webgl2_test_texStorage3D', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texStorage3D] texStorage3D");
            texStorage3D((data) => {
                gl.texStorage3D(gl.TEXTURE_2D_ARRAY, 1, gl.RGBA8, 128, 128, 10);
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
                expect(res[0]).assertEqual(0);
                expect(res[1]).assertEqual(0);
                expect(res[2]).assertEqual(255);
                expect(res[3]).assertEqual(255);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0008
         * @tc.name webgl2_test_texStorage3D_1
         * @tc.desc Test texStorage3D.
         */
        it('webgl2_test_texStorage3D_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texStorage3D_1] texStorage3D");
            texStorage3D((data) => {
                gl.texStorage3D(gl.TEXTURE_3D, 1, gl.RGBA8, 128, 128, 10);
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0009
         * @tc.name webgl2_test_texStorage3D_2
         * @tc.desc Test texStorage3D.
         */
        it('webgl2_test_texStorage3D_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texStorage3D_2] texStorage3D");
            texStorage3D((data) => {
                gl.texStorage3D(gl.TEXTURE_2D_ARRAY, 1, gl.R16F, 128, 128, 10);
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0010
         * @tc.name webgl2_test_texStorage3D_3
         * @tc.desc Test texStorage3D.
         */
        it('webgl2_test_texStorage3D_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texStorage3D_3] texStorage3D");
            texStorage3D((data) => {
                gl.texStorage3D(gl.TEXTURE_2D_ARRAY, 1, gl.RG16F, 128, 128, 10);
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0011
         * @tc.name webgl2_test_texStorage3D_4
         * @tc.desc Test texStorage3D.
         */
        it('webgl2_test_texStorage3D_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texStorage3D_4] texStorage3D");
            texStorage3D((data) => {
                gl.texStorage3D(gl.TEXTURE_2D_ARRAY, 1, gl.SRGB8, 128, 128, 10);
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0012
         * @tc.name webgl2_test_texStorage3D_5
         * @tc.desc Test texStorage3D.
         */
        it('webgl2_test_texStorage3D_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texStorage3D_5] texStorage3D");
            texStorage3D((data) => {
                gl.texStorage3D(gl.TEXTURE_2D_ARRAY, 1, gl.R11F_G11F_B10F, 128, 128, 10);
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        function texImage3D(callback, finish) {
            const width = 8;
            const height = 8;
            let depth = 3;
            const data = new Uint8Array(width * height * depth * 4); // four bytes represent the rgba value of a pixel
            let colors = [
                [255, 0, 0, 255],
                [0, 255, 0, 255],
                [0, 0, 255, 255],
            ];
            for (let i = 0; i < depth; i++) {
                let arr = getColorUint8Array(width, height, colors[i][0], colors[i][1], colors[i][2], colors[i][3]);
                data.set(arr, width * height * 4 * i);
            }
            let p = createProgram(gl, `#version 300 es
                layout(location=0) in vec4 a_position;
                layout(location=1) in vec2 a_texCoord;
                layout(location=2) in float a_depth;
                out vec2 v_texcoord;
                out float v_depth;
                void main(){
                    gl_Position = a_position;
                    v_texcoord = a_texCoord;
                    v_depth = a_depth;
                }
            `, `#version 300 es
                precision mediump float;
                uniform mediump sampler2DArray u_sampler;
                in vec2 v_texcoord;
                in float v_depth;
                out vec4 color;
                void main(){
                    color = texture(u_sampler, vec3(v_texcoord,v_depth));
                }
            `);
            let source = new Float32Array([
                -1, -1, 0, 1,
                1, 1, 1, 0,
                -1, 1, 0, 0,
                -1, -1, 0, 1,
                1, -1, 1, 1,
                1, 1, 1, 0,
            ]);
            let texture = gl.createTexture();
            gl.activeTexture(gl.TEXTURE0);
            gl.bindTexture(gl.TEXTURE_2D_ARRAY, texture);
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MIN_FILTER, gl.NEAREST);
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MAG_FILTER, gl.NEAREST);
            depth = callback(width, height, depth, data);
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            gl.bufferData(gl.ARRAY_BUFFER, source, gl.STATIC_DRAW);
            let FSIZE = source.BYTES_PER_ELEMENT;
            let u_sampler = gl.getUniformLocation(p.program, 'u_sampler');
            gl.uniform1i(u_sampler, 0);
            gl.vertexAttribPointer(0, 2, gl.FLOAT, false, 4 * FSIZE, 0);
            gl.vertexAttribPointer(1, 2, gl.FLOAT, false, 4 * FSIZE, 2 * FSIZE);
            gl.vertexAttrib1f(2, depth);
            gl.enableVertexAttribArray(0);
            gl.enableVertexAttribArray(1);
            gl.generateMipmap(gl.TEXTURE_2D_ARRAY);
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_BASE_LEVEL, 0);
            gl.clearColor(1.0, 1.0, 0.0, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLES, 0, 6);
            let res = new Uint8Array(width * height * 4);
            gl.readPixels(0, 0, width, height, gl.RGBA, gl.UNSIGNED_BYTE, res);
            finish(res);
            gl.disableVertexAttribArray(0);
            gl.disableVertexAttribArray(1);
            gl.deleteBuffer(buffer);
            gl.deleteTexture(texture);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0013
         * @tc.name webgl2_test_texImage3D
         * @tc.desc Test texImage3D.
         */
        it('webgl2_test_texImage3D', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texImage3D] texImage3D");
            texImage3D((width, height, depth, data) => {
                gl.texImage3D(gl.TEXTURE_2D_ARRAY, 0, gl.RGBA, width, height, depth, 0, gl.RGBA, gl.UNSIGNED_BYTE, data);
                return 2;
            }, (res) => {
                expect(res[0]).assertEqual(0);
                expect(res[1]).assertEqual(0);
                expect(res[2]).assertEqual(255);
                expect(res[3]).assertEqual(255);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0014
         * @tc.name webgl2_test_texImage3D_1
         * @tc.desc Test texImage3D.
         */
        it('webgl2_test_texImage3D_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texImage3D_1] texImage3D");
            texImage3D((width, height, depth, data) => {
                gl.texImage3D(gl.TEXTURE_3D, 0, gl.RGBA, width, height, depth, 0, gl.RGBA, gl.UNSIGNED_BYTE, data);
                return 2;
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0015
         * @tc.name webgl2_test_texImage3D_2
         * @tc.desc Test texImage3D.
         */
        it('webgl2_test_texImage3D_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texImage3D_2] texImage3D");
            texImage3D((width, height, depth, data) => {
                gl.texImage3D(gl.TEXTURE_2D_ARRAY, 1, gl.ALPHA, width, height, depth, 0, gl.RGBA, gl.UNSIGNED_BYTE, data);
                return 2;
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0016
         * @tc.name webgl2_test_texImage3D_3
         * @tc.desc Test texImage3D.
         */
        it('webgl2_test_texImage3D_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texImage3D_3] texImage3D");
            texImage3D((width, height, depth, data) => {
                gl.texImage3D(gl.TEXTURE_2D_ARRAY, 1, gl.LUMINANCE, width, height, depth, 0, gl.RGBA, gl.UNSIGNED_BYTE, data);
                return 2;
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0017
         * @tc.name webgl2_test_texImage3D_4
         * @tc.desc Test texImage3D.
         */
        it('webgl2_test_texImage3D_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texImage3D_4] texImage3D");
            texImage3D((width, height, depth, data) => {
                gl.texImage3D(gl.TEXTURE_2D_ARRAY, 1, gl.R8UI, width, height, depth, 0, gl.RGBA, gl.UNSIGNED_BYTE, data);
                return 2;
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0018
         * @tc.name webgl2_test_texImage3D_5
         * @tc.desc Test texImage3D.
         */
        it('webgl2_test_texImage3D_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texImage3D_5] texImage3D");
            texImage3D((width, height, depth, data) => {
                gl.texImage3D(gl.TEXTURE_2D_ARRAY, 1, gl.R11F_G11F_B10F, width, height, depth, 0, gl.RGBA, gl.UNSIGNED_BYTE, data);
                return 2;
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        function texSubImage3D(callback, finish) {
            const width = 8;
            const height = 8;
            let depth = 3;
            const data = new Uint8Array(width * height * depth * 4); // four bytes represent the rgba value of a pixel
            const data1 = new Uint8Array(width * height * depth * 4); // four bytes represent the rgba value of a pixel
            let colors = [
                [255, 0, 0, 255],
                [0, 255, 0, 255],
                [0, 0, 255, 255],
            ];
            let colors1 = [
                [0, 0, 255, 255],
                [0, 255, 0, 255],
                [255, 0, 0, 255],
            ];
            for (let i = 0; i < depth; i++) {
                let arr = getColorUint8Array(width, height, colors[i][0], colors[i][1], colors[i][2], colors[i][3]);
                data.set(arr, width * height * 4 * i);
            }
            for (let i = 0; i < depth; i++) {
                let arr = getColorUint8Array(width, height, colors1[i][0], colors1[i][1], colors1[i][2], colors1[i][3]);
                data1.set(arr, width * height * 4 * i);
            }
            let p = createProgram(gl, `#version 300 es
                layout(location=0) in vec4 a_position;
                layout(location=1) in vec2 a_texCoord;
                layout(location=2) in float a_depth;
                out vec2 v_texcoord;
                out float v_depth;
                void main(){
                    gl_Position = a_position;
                    v_texcoord = a_texCoord;
                    v_depth = a_depth;
                }
            `, `#version 300 es
                precision mediump float;
                uniform mediump sampler2DArray u_sampler;
                in vec2 v_texcoord;
                in float v_depth;
                out vec4 color;
                void main(){
                    color = texture(u_sampler, vec3(v_texcoord,v_depth));
                }
            `);
            let source = new Float32Array([
                -1, -1, 0, 1,
                1, 1, 1, 0,
                -1, 1, 0, 0,
                -1, -1, 0, 1,
                1, -1, 1, 1,
                1, 1, 1, 0,
            ]);
            let texture = gl.createTexture();
            gl.activeTexture(gl.TEXTURE0);
            gl.bindTexture(gl.TEXTURE_2D_ARRAY, texture);
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MIN_FILTER, gl.NEAREST);
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MAG_FILTER, gl.NEAREST);
            depth = callback(width, height, depth, data, data1);
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            gl.bufferData(gl.ARRAY_BUFFER, source, gl.STATIC_DRAW);
            let FSIZE = source.BYTES_PER_ELEMENT;
            let u_sampler = gl.getUniformLocation(p.program, 'u_sampler');
            gl.uniform1i(u_sampler, 0);
            gl.vertexAttribPointer(0, 2, gl.FLOAT, false, 4 * FSIZE, 0);
            gl.vertexAttribPointer(1, 2, gl.FLOAT, false, 4 * FSIZE, 2 * FSIZE);
            gl.vertexAttrib1f(2, depth);
            gl.enableVertexAttribArray(0);
            gl.enableVertexAttribArray(1);
            gl.generateMipmap(gl.TEXTURE_2D_ARRAY);
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_BASE_LEVEL, 0);
            gl.clearColor(1.0, 1.0, 0.0, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLES, 0, 6);
            let res = new Uint8Array(width * height * 4);
            gl.readPixels(0, 0, width, height, gl.RGBA, gl.UNSIGNED_BYTE, res);
            finish(res);
            gl.disableVertexAttribArray(0);
            gl.disableVertexAttribArray(1);
            gl.deleteBuffer(buffer);
            gl.deleteTexture(texture);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0019
         * @tc.name webgl2_test_texSubImage3D
         * @tc.desc Test texSubImage3D.
         */
        it('webgl2_test_texSubImage3D', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texSubImage3D] texSubImage3D");
            texSubImage3D((width, height, depth, data, data1) => {
                gl.texImage3D(gl.TEXTURE_2D_ARRAY, 0, gl.RGBA, width, height, depth, 0, gl.RGBA, gl.UNSIGNED_BYTE, data);
                gl.texSubImage3D(gl.TEXTURE_2D_ARRAY, 0, width / 2, width / 2, 0, width - width / 2, height - height / 2, depth, gl.RGBA, gl.UNSIGNED_BYTE, data1);
                return 0;
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
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0020
         * @tc.name webgl2_test_texSubImage3D_1
         * @tc.desc Test texSubImage3D.
         */
        it('webgl2_test_texSubImage3D_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texSubImage3D_1] texSubImage3D");
            texSubImage3D((width, height, depth, data, data1) => {
                gl.texImage3D(gl.TEXTURE_2D_ARRAY, 0, gl.RGBA, width, height, depth, 0, gl.RGBA, gl.UNSIGNED_SHORT_5_6_5, data);
                gl.texSubImage3D(gl.TEXTURE_2D_ARRAY, 0, width / 2, width / 2, 0, width - width / 2, height - height / 2, depth, gl.RGBA, gl.UNSIGNED_SHORT_5_6_5, data1);
                return 0;
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0021
         * @tc.name webgl2_test_texSubImage3D_2
         * @tc.desc Test texSubImage3D.
         */
        it('webgl2_test_texSubImage3D_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texSubImage3D_2] texSubImage3D");
            texSubImage3D((width, height, depth, data, data1) => {
                gl.texImage3D(gl.TEXTURE_2D_ARRAY, 0, gl.RGBA, width, height, depth, 0, gl.RGBA, gl.UNSIGNED_SHORT_4_4_4_4, data);
                gl.texSubImage3D(gl.TEXTURE_2D_ARRAY, 0, width / 2, width / 2, 0, width - width / 2, height - height / 2, depth, gl.RGBA, gl.UNSIGNED_SHORT_4_4_4_4, data1);
                return 0;
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0022
         * @tc.name webgl2_test_texSubImage3D_3
         * @tc.desc Test texSubImage3D.
         */
        it('webgl2_test_texSubImage3D_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texSubImage3D_3] texSubImage3D");
            texSubImage3D((width, height, depth, data, data1) => {
                gl.texImage3D(gl.TEXTURE_2D_ARRAY, 0, gl.RGBA, width, height, depth, 0, gl.RGBA, gl.UNSIGNED_INT, data);
                gl.texSubImage3D(gl.TEXTURE_2D_ARRAY, 0, width / 2, width / 2, 0, width - width / 2, height - height / 2, depth, gl.RGBA, gl.UNSIGNED_INT, data1);
                return 0;
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0023
         * @tc.name webgl2_test_texSubImage3D_4
         * @tc.desc Test texSubImage3D.
         */
        it('webgl2_test_texSubImage3D_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texSubImage3D_4] texSubImage3D");
            texSubImage3D((width, height, depth, data, data1) => {
                gl.texImage3D(gl.TEXTURE_2D_ARRAY, 0, gl.RGBA, width, height, depth, 0, gl.RGBA, gl.HALF_FLOAT, data);
                gl.texSubImage3D(gl.TEXTURE_2D_ARRAY, 0, width / 2, width / 2, 0, width - width / 2, height - height / 2, depth, gl.RGBA, gl.HALF_FLOAT, data1);
                return 0;
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0024
         * @tc.name webgl2_test_texSubImage3D_5
         * @tc.desc Test texSubImage3D.
         */
        it('webgl2_test_texSubImage3D_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texSubImage3D_5] texSubImage3D");
            texSubImage3D((width, height, depth, data, data1) => {
                gl.texImage3D(gl.TEXTURE_2D_ARRAY, 0, gl.RGBA, width, height, depth, 0, gl.RGBA, gl.UNSIGNED_INT_2_10_10_10_REV, data);
                gl.texSubImage3D(gl.TEXTURE_2D_ARRAY, 0, width / 2, width / 2, 0, width - width / 2, height - height / 2, depth, gl.RGBA, gl.UNSIGNED_INT_2_10_10_10_REV, data1);
                return 0;
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        function copyTexSubImage3D(callback, finish) {
            let srcViewPort = gl.getParameter(gl.VIEWPORT);
            let width = 8;
            let height = 8;
            let depth = 3;
            let data = new Uint8Array(width * height * depth * 4); // four bytes represent the rgba value of a pixel
            let colors = [
                [255, 0, 0, 255],
                [0, 255, 0, 255],
                [0, 0, 255, 255],
            ];
            for (let i = 0; i < depth; i++) {
                let arr = getColorUint8Array(width, height, colors[i][0], colors[i][1], colors[i][2], colors[i][3]);
                data.set(arr, width * height * 4 * i);
            }
            let vCode = `#version 300 es
                layout(location=0) in vec4 a_position;
                layout(location=1) in vec2 a_texCoord;
                layout(location=2) in float a_depth;
                out vec2 v_texcoord;
                out float v_depth;
                void main(){
                    gl_Position = a_position;
                    v_texcoord = a_texCoord;
                    v_depth = a_depth;
                }
            `;
            let fCode = `#version 300 es
                precision mediump float;
                uniform mediump sampler2DArray u_sampler;
                in vec2 v_texcoord;
                in float v_depth;
                out vec4 color;
                void main(){
                    color = texture(u_sampler, vec3(v_texcoord,v_depth));
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
            // texture
            gl.activeTexture(gl.TEXTURE0);
            let texture = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_2D_ARRAY, texture);
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
            gl.texImage3D(gl.TEXTURE_2D_ARRAY, 0, gl.RGBA, width, height, depth, 0, gl.RGBA, gl.UNSIGNED_BYTE, data);
            let renderTexture = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_2D_ARRAY, renderTexture);
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
            gl.texImage3D(gl.TEXTURE_2D_ARRAY, 0, gl.RGBA, width, height, depth, 0, gl.RGBA, gl.UNSIGNED_BYTE, null);
            // framebuffer
            let framebuffer = gl.createFramebuffer();
            gl.bindFramebuffer(gl.FRAMEBUFFER, framebuffer);
            let renderbuffer = gl.createRenderbuffer();
            gl.bindRenderbuffer(gl.RENDERBUFFER, renderbuffer);
            gl.renderbufferStorage(gl.RENDERBUFFER, gl.DEPTH_COMPONENT16, width, height);
            gl.framebufferTextureLayer(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, renderTexture, 0, 0);
            gl.framebufferTextureLayer(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT1, renderTexture, 0, 1);
            gl.framebufferTextureLayer(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT2, renderTexture, 0, 2);
            gl.framebufferRenderbuffer(gl.FRAMEBUFFER, gl.DEPTH_ATTACHMENT, gl.RENDERBUFFER, renderbuffer);
            gl.viewport(0, 0, width, height);
            // draw
            gl.bindTexture(gl.TEXTURE_2D_ARRAY, texture);
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(source), gl.STATIC_DRAW);
            let FSIZE = 4;
            let a_position = gl.getAttribLocation(p1.program, 'a_position');
            let a_texCoord = gl.getAttribLocation(p1.program, 'a_texCoord');
            let a_depth = gl.getAttribLocation(p1.program, 'a_depth');
            gl.vertexAttribPointer(a_position, 2, gl.FLOAT, false, 4 * FSIZE, 0);
            gl.vertexAttribPointer(a_texCoord, 2, gl.FLOAT, false, 4 * FSIZE, 2 * FSIZE);
            gl.vertexAttrib1f(a_depth, 0);
            gl.enableVertexAttribArray(a_position);
            gl.enableVertexAttribArray(a_texCoord);
            gl.clearColor(0.0, 0.0, 0.0, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLES, 0, 6);
            gl.flush();
            // copyTexImage3D
            let newTexture = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_2D_ARRAY, newTexture);
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
            gl.texImage3D(gl.TEXTURE_2D_ARRAY, 0, gl.RGBA, width, height, depth, 0, gl.RGBA, gl.UNSIGNED_BYTE, null);
            callback(width, height, depth, texture, newTexture);
            gl.bindFramebuffer(gl.FRAMEBUFFER, null);
            // draw
            gl.viewport(srcViewPort[0], srcViewPort[1], srcViewPort[2], srcViewPort[3]);
            let p2 = createProgram(gl, vCode, fCode);
            gl.useProgram(p2.program);
            let buffer2 = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer2);
            gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(source), gl.STATIC_DRAW);
            gl.vertexAttribPointer(0, 2, gl.FLOAT, false, 4 * FSIZE, 0);
            gl.vertexAttribPointer(1, 2, gl.FLOAT, false, 4 * FSIZE, 2 * FSIZE);
            gl.bindTexture(gl.TEXTURE_2D_ARRAY, newTexture);
            gl.vertexAttrib1f(2, 2);
            gl.enableVertexAttribArray(0);
            gl.enableVertexAttribArray(1);
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
            let u_sampler = gl.getUniformLocation(p2.program, 'u_sampler');
            gl.uniform1i(u_sampler, 0);
            gl.clearColor(0.0, 0.0, 0.0, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLES, 0, 6);
            let res = new Uint8Array(width * height * 4);
            gl.readPixels(0, 0, width, height, gl.RGBA, gl.UNSIGNED_BYTE, res);
            finish(res);
            gl.disableVertexAttribArray(0);
            gl.disableVertexAttribArray(1);
            gl.deleteBuffer(buffer);
            gl.deleteBuffer(buffer2);
            gl.deleteTexture(texture);
            gl.deleteTexture(renderTexture);
            gl.deleteTexture(newTexture);
            gl.deleteRenderbuffer(renderbuffer);
            gl.deleteFramebuffer(framebuffer);
            gl.deleteShader(p1.vertexShader);
            gl.deleteShader(p1.fragmentShader);
            gl.deleteProgram(p1.program);
            gl.deleteShader(p2.vertexShader);
            gl.deleteShader(p2.fragmentShader);
            gl.deleteProgram(p2.program);
            gl.flush();
            checkError(gl);
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0025
         * @tc.name webgl2_test_copyTexSubImage3D
         * @tc.desc Test copyTexSubImage3D.
         */
        it('webgl2_test_copyTexSubImage3D', 0, async function (done) {
            console.info("webgl2test [webgl2_test_copyTexSubImage3D] copyTexSubImage3D");
            copyTexSubImage3D((width, height, depth, texture, newTexture) => {
                for (let i = 0; i < depth; i++) {
                    gl.bindTexture(gl.TEXTURE_2D_ARRAY, texture);
                    gl.vertexAttrib1f(2, i);
                    gl.clearColor(0.0, 0.0, 0.0, 1.0);
                    gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
                    gl.drawArrays(gl.TRIANGLES, 0, 6);
                    gl.flush();
                    gl.bindTexture(gl.TEXTURE_2D_ARRAY, newTexture);
                    gl.copyTexSubImage3D(gl.TEXTURE_2D_ARRAY, 0, 0, 0, i, 0, 0, width, height);
                }
            }, (res) => {
                expect(res[0]).assertEqual(0);
                expect(res[1]).assertEqual(0);
                expect(res[2]).assertEqual(255);
                expect(res[3]).assertEqual(255);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0026
         * @tc.name webgl2_test_copyTexSubImage3D_1
         * @tc.desc Test copyTexSubImage3D.
         */
        it('webgl2_test_copyTexSubImage3D_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_copyTexSubImage3D_1] copyTexSubImage3D");
            copyTexSubImage3D((width, height, depth, texture, newTexture) => {
                for (let i = 0; i < depth; i++) {
                    gl.bindTexture(gl.TEXTURE_2D_ARRAY, texture);
                    gl.vertexAttrib1f(2, i);
                    gl.clearColor(0.0, 0.0, 0.0, 1.0);
                    gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
                    gl.drawArrays(gl.TRIANGLES, 0, 6);
                    gl.bindTexture(gl.TEXTURE_2D_ARRAY, newTexture);
                    gl.copyTexSubImage3D(gl.TEXTURE_3D, 0, 0, 0, i, 0, 0, width, height);
                }
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0027
         * @tc.name webgl2_test_copyTexSubImage3D_2
         * @tc.desc Test copyTexSubImage3D.
         */
        it('webgl2_test_copyTexSubImage3D_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_copyTexSubImage3D_2] copyTexSubImage3D");
            copyTexSubImage3D((width, height, depth, texture, newTexture) => {
                for (let i = 0; i < depth; i++) {
                    gl.bindTexture(gl.TEXTURE_2D_ARRAY, texture);
                    gl.vertexAttrib1f(2, i);
                    gl.clearColor(0.0, 0.0, 0.0, 1.0);
                    gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
                    gl.drawArrays(gl.TRIANGLES, 0, 6);
                    gl.bindTexture(gl.TEXTURE_2D_ARRAY, newTexture);
                    gl.copyTexSubImage3D(gl.TEXTURE_2D_ARRAY, 1, 1, 10, i, 10, 10, width, height);
                }
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0028
         * @tc.name webgl2_test_copyTexSubImage3D_3
         * @tc.desc Test copyTexSubImage3D.
         */
        it('webgl2_test_copyTexSubImage3D_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_copyTexSubImage3D_3] copyTexSubImage3D");
            copyTexSubImage3D((width, height, depth, texture, newTexture) => {
                for (let i = 0; i < depth; i++) {
                    gl.bindTexture(gl.TEXTURE_2D_ARRAY, texture);
                    gl.vertexAttrib1f(2, i);
                    gl.clearColor(0.0, 0.0, 0.0, 1.0);
                    gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
                    gl.drawArrays(gl.TRIANGLES, 0, 6);
                    gl.bindTexture(gl.TEXTURE_2D_ARRAY, newTexture);
                    gl.copyTexSubImage3D(gl.TEXTURE_2D_ARRAY, -1, 0, 0, i, 0, 0, width, height);
                }
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        function compressedTexImage3D(callback, finish) {
            let texture = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_2D_ARRAY, texture);
            console.log(gl.getParameter(gl.COMPRESSED_TEXTURE_FORMATS));
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
            callback();
            finish();
            gl.deleteTexture(texture);
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0029
         * @tc.name webgl2_test_compressedTexImage3D
         * @tc.desc Test compressedTexImage3D.
         */
        it('webgl2_test_compressedTexImage3D', 0, async function (done) {
            console.info("webgl2test [webgl2_test_compressedTexImage3D] compressedTexImage3D");
            let texture = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_2D_ARRAY, texture);
            console.log(gl.getParameter(gl.COMPRESSED_TEXTURE_FORMATS));
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
            gl.compressedTexImage3D(gl.TEXTURE_2D_ARRAY, 0, gl.COMPRESSED_TEXTURE_FORMATS, 1, 1, 1, 0, new Float32Array(1 * 1 * 1 * 4));
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            gl.deleteTexture(texture);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0030
         * @tc.name webgl2_test_compressedTexImage3D_1
         * @tc.desc Test compressedTexImage3D.
         */
        it('webgl2_test_compressedTexImage3D_1', 0, async function (done) {
            compressedTexImage3D(() => {
                gl.compressedTexImage3D(gl.TEXTURE_3D, 0, gl.COMPRESSED_TEXTURE_FORMATS, 1, 1, 1, 0, new Float32Array(1 * 1 * 1 * 4));
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0031
         * @tc.name webgl2_test_compressedTexImage3D_2
         * @tc.desc Test compressedTexImage3D.
         */
        it('webgl2_test_compressedTexImage3D_2', 0, async function (done) {
            compressedTexImage3D(() => {
                gl.compressedTexImage3D(gl.TEXTURE_3D, 1, gl.COMPRESSED_TEXTURE_FORMATS, 1, 1, 1, 0, new Float32Array(1 * 1 * 1 * 4));
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0032
         * @tc.name webgl2_test_compressedTexImage3D_3
         * @tc.desc Test compressedTexImage3D.
         */
        it('webgl2_test_compressedTexImage3D_3', 0, async function (done) {
            compressedTexImage3D(() => {
                gl.compressedTexImage3D(gl.TEXTURE_3D, -1, gl.COMPRESSED_TEXTURE_FORMATS, 1, 1, 1, 0, new Float32Array(1 * 1 * 1 * 4));
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        function compressedTexSubImage3D(callback, finish) {
            let texture = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_2D_ARRAY, texture);
            console.log(gl.getParameter(gl.COMPRESSED_TEXTURE_FORMATS));
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
            gl.compressedTexImage3D(gl.TEXTURE_2D_ARRAY, 0, gl.COMPRESSED_TEXTURE_FORMATS, 1, 1, 1, 0, new Float32Array(4));
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            callback();
            finish();
            gl.deleteTexture(texture);
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0033
         * @tc.name webgl2_test_compressedTexSubImage3D
         * @tc.desc Test compressedTexSubImage3D.
         */
        it('webgl2_test_compressedTexSubImage3D', 0, async function (done) {
            console.info("webgl2test [webgl2_test_compressedTexSubImage3D] compressedTexSubImage3D");
            let texture = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_2D_ARRAY, texture);
            console.log(gl.getParameter(gl.COMPRESSED_TEXTURE_FORMATS));
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
            gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
            gl.compressedTexImage3D(gl.TEXTURE_2D_ARRAY, 0, gl.COMPRESSED_TEXTURE_FORMATS, 1, 1, 1, 0, new Float32Array(4));
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            gl.deleteTexture(texture);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0034
         * @tc.name webgl2_test_compressedTexSubImage3D_1
         * @tc.desc Test compressedTexSubImage3D.
         */
        it('webgl2_test_compressedTexSubImage3D_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_compressedTexSubImage3D_1] compressedTexSubImage3D");
            compressedTexSubImage3D(() => {
                gl.compressedTexSubImage3D(gl.TEXTURE_3D, 0, 0, 0, 0, 1, 1, 1, gl.COMPRESSED_TEXTURE_FORMATS, new Float32Array(4));
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0035
         * @tc.name webgl2_test_compressedTexSubImage3D_2
         * @tc.desc Test compressedTexSubImage3D.
         */
        it('webgl2_test_compressedTexSubImage3D_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_compressedTexSubImage3D_1] compressedTexSubImage3D");
            compressedTexSubImage3D(() => {
                gl.compressedTexSubImage3D(gl.TEXTURE_3D, 1, 0, 0, 0, 1, 1, 1, gl.COMPRESSED_TEXTURE_FORMATS, new Float32Array(4));
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0036
         * @tc.name webgl2_test_compressedTexSubImage3D_3
         * @tc.desc Test compressedTexSubImage3D.
         */
        it('webgl2_test_compressedTexSubImage3D_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_compressedTexSubImage3D_1] compressedTexSubImage3D");
            compressedTexSubImage3D(() => {
                gl.compressedTexSubImage3D(gl.TEXTURE_3D, -1, 0, 0, 0, 1, 1, 1, gl.COMPRESSED_TEXTURE_FORMATS, new Float32Array(4));
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        function texImage2D(callback, finish) {
            let image = new Uint8Array(8 * 8 * 4); // four bytes represent the rgba value of a pixel
            for (let i = 0; i < image.length; i += 4) {
                if (i < image.length / 2) {
                    image[i] = 0;
                    image[i + 1] = 0;
                    image[i + 2] = 255;
                    image[i + 3] = 255;
                }
                else {
                    image[i] = 255;
                    image[i + 1] = 0;
                    image[i + 2] = 0;
                    image[i + 3] = 255;
                }
            }
            let { program, vertexShader, fragmentShader } = createProgram(gl, `#version 300 es
                in vec4 a_Position;
                in vec2 a_TexCoord;
                out vec2 v_TexCoord;
                void main(){
                    gl_Position = a_Position;
                    v_TexCoord = a_TexCoord;
                }
            `, `#version 300 es
                precision mediump float;
                precision highp sampler2D;
                uniform sampler2D u_Sampler;
                in vec2 v_TexCoord;
                out vec4 color;
                void main(){
                    color = texture(u_Sampler, v_TexCoord);
                }
            `);
            let arr = new Float32Array([
                -1.0, 1.0, 0.0, 1.0,
                -1.0, -1.0, 0.0, 0.0,
                1.0, 1.0, 1.0, 1.0,
                1.0, -1.0, 1.0, 0.0,
            ]);
            let FSIZE = arr.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer(); // create buffer
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer); // bound buffer
            gl.bufferData(gl.ARRAY_BUFFER, arr.buffer, gl.STATIC_DRAW); // writes data to a buffer object
            let a_Position = gl.getAttribLocation(program, 'a_Position'); // gets the address of the attribute variable
            gl.vertexAttribPointer(a_Position, 2, gl.FLOAT, false, FSIZE * 4, 0); // assign the buffer object to an attribute variable
            gl.enableVertexAttribArray(a_Position); // Open the attribute variable (connect a Position variable to the buffer object assigned to it)
            let a_TexCoord = gl.getAttribLocation(program, 'a_TexCoord'); // gets the address of the attribute variable
            gl.vertexAttribPointer(a_TexCoord, 2, gl.FLOAT, false, FSIZE * 4, FSIZE * 2); // assign the buffer object to an attribute variable
            gl.enableVertexAttribArray(a_TexCoord); // Open the attribute variable (connect a Position variable to the buffer object assigned to it)
            let u_Sampler = gl.getUniformLocation(program, 'u_Sampler');
            let texture = gl.createTexture();
            gl.activeTexture(gl.TEXTURE0); // open texture unit 0
            gl.bindTexture(gl.TEXTURE_2D, texture); // bind the texture object to target
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR); // configure texture parameters
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR); // configure texture parameters
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE); // configure texture parameters
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE); // configure texture parameters
            callback(image);
            gl.uniform1i(u_Sampler, 0); // pass texture 0 to the shader
            gl.clearColor(0.92, 0.92, 0.92, 1);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLE_STRIP, 0, arr.length / 4);
            let res = new Uint8Array(8 * 8 * 4);
            gl.readPixels(0, 0, 1, 1, gl.RGBA, gl.UNSIGNED_BYTE, res);
            finish(res);
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
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0037
         * @tc.name webgl2_test_texImage2D
         * @tc.desc Test texImage2D.
         */
        it('webgl2_test_texImage2D', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texImage2D] texImage2D");
            texImage2D((image) => {
                gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, 8, 4, 0, gl.RGBA, gl.UNSIGNED_BYTE, image, 32); // configure texture images
            }, (res) => {
                expect(res[0]).assertEqual(0);
                expect(res[1]).assertEqual(0);
                expect(res[2]).assertEqual(255);
                expect(res[3]).assertEqual(255);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0038
         * @tc.name webgl2_test_texImage2D_1
         * @tc.desc Test texImage2D.
         */
        it('webgl2_test_texImage2D_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texImage2D_1] texImage2D");
            texImage2D((image) => {
                gl.texImage2D(gl.TEXTURE_CUBE_MAP_POSITIVE_X, 0, gl.RGBA, 8, 4, 0, gl.RGBA, gl.UNSIGNED_BYTE, image, 32); // configure texture images
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0039
         * @tc.name webgl2_test_texImage2D_2
         * @tc.desc Test texImage2D.
         */
        it('webgl2_test_texImage2D_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texImage2D_2] texImage2D");
            texImage2D((image) => {
                gl.texImage2D(gl.TEXTURE_CUBE_MAP_NEGATIVE_X, 0, gl.RGBA, 8, 4, 0, gl.RGBA, gl.UNSIGNED_BYTE, image, 32); // configure texture images
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0040
         * @tc.name webgl2_test_texImage2D_3
         * @tc.desc Test texImage2D.
         */
        it('webgl2_test_texImage2D_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texImage2D_3] texImage2D");
            texImage2D((image) => {
                gl.texImage2D(gl.TEXTURE_CUBE_MAP_POSITIVE_Y, 0, gl.RGBA, 8, 4, 0, gl.RGBA, gl.UNSIGNED_BYTE, image, 32); // configure texture images
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0041
         * @tc.name webgl2_test_texImage2D_4
         * @tc.desc Test texImage2D.
         */
        it('webgl2_test_texImage2D_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texImage2D_4] texImage2D");
            texImage2D((image) => {
                gl.texImage2D(gl.TEXTURE_CUBE_MAP_NEGATIVE_Y, 0, gl.RGBA, 8, 4, 0, gl.RGBA, gl.UNSIGNED_BYTE, image, 32); //  configure texture images
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0042
         * @tc.name webgl2_test_texImage2D_5
         * @tc.desc Test texImage2D.
         */
        it('webgl2_test_texImage2D_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texImage2D_5] texImage2D");
            texImage2D((image) => {
                gl.texImage2D(gl.TEXTURE_CUBE_MAP_POSITIVE_Z, 0, gl.RGBA, 8, 4, 0, gl.RGBA, gl.UNSIGNED_BYTE, image, 32); // configure texture images
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0043
         * @tc.name webgl2_test_texImage2D_6
         * @tc.desc Test texImage2D.
         */
        it('webgl2_test_texImage2D_6', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texImage2D_6] texImage2D");
            texImage2D((image) => {
                gl.texImage2D(gl.TEXTURE_CUBE_MAP_NEGATIVE_Z, 0, gl.RGBA, 8, 4, 0, gl.RGBA, gl.UNSIGNED_BYTE, image, 32); // configure texture images
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        function texSubImage2D(callback, finish) {
            let image = new Uint8Array(8 * 8 * 4); // four bytes represent the rgba value of a pixel
            for (let i = 0; i < image.length; i += 4) {
                if (i < image.length / 2) {
                    image[i] = 0;
                    image[i + 1] = 0;
                    image[i + 2] = 255;
                    image[i + 3] = 255;
                }
                else {
                    image[i] = 255;
                    image[i + 1] = 0;
                    image[i + 2] = 0;
                    image[i + 3] = 255;
                }
            }
            let { program, vertexShader, fragmentShader } = createProgram(gl, `#version 300 es
                in vec4 a_Position;
                in vec2 a_TexCoord;
                out vec2 v_TexCoord;
                void main(){
                    gl_Position = a_Position;
                    v_TexCoord = a_TexCoord;
                }
            `, `#version 300 es
                precision mediump float;
                precision highp sampler2D;
                uniform sampler2D u_Sampler;
                in vec2 v_TexCoord;
                out vec4 color;
                void main(){
                    color = texture(u_Sampler, v_TexCoord);
                }
            `);
            let arr = new Float32Array([
                -1.0, 1.0, 0.0, 1.0,
                -1.0, -1.0, 0.0, 0.0,
                1.0, 1.0, 1.0, 1.0,
                1.0, -1.0, 1.0, 0.0,
            ]);
            let FSIZE = arr.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer(); // create buffer
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer); // bound buffer
            gl.bufferData(gl.ARRAY_BUFFER, arr.buffer, gl.STATIC_DRAW); // writes data to a buffer object
            let a_Position = gl.getAttribLocation(program, 'a_Position'); // gets the address of the attribute variable
            gl.vertexAttribPointer(a_Position, 2, gl.FLOAT, false, FSIZE * 4, 0); // assign the buffer object to an attribute variable
            gl.enableVertexAttribArray(a_Position); // Open the attribute variable (connect a Position variable to the buffer object assigned to it)
            let a_TexCoord = gl.getAttribLocation(program, 'a_TexCoord'); // gets the address of the attribute variable
            gl.vertexAttribPointer(a_TexCoord, 2, gl.FLOAT, false, FSIZE * 4, FSIZE * 2); // assign the buffer object to an attribute variable
            gl.enableVertexAttribArray(a_TexCoord); // Open the attribute variable (connect a Position variable to the buffer object assigned to it)
            let u_Sampler = gl.getUniformLocation(program, 'u_Sampler');
            let texture = gl.createTexture();
            gl.activeTexture(gl.TEXTURE0); // open texture unit 0
            gl.bindTexture(gl.TEXTURE_2D, texture); // bind the texture object to target
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR); // configure texture parameters
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR); // configure texture parameters
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE); // configure texture parameters
            gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE); // configure texture parameters
            gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, 8, 8, 0, gl.RGBA, gl.UNSIGNED_BYTE, image, 0); // configure texture images
            callback(image);
            gl.uniform1i(u_Sampler, 0); // pass texture 0 to the shader
            gl.clearColor(0.92, 0.92, 0.92, 1);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLE_STRIP, 0, arr.length / 4);
            let res = new Uint8Array(8 * 8 * 4);
            gl.readPixels(0, 0, 1, 1, gl.RGBA, gl.UNSIGNED_BYTE, res);
            finish(res);
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
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0044
         * @tc.name webgl2_test_texSubImage2D
         * @tc.desc Test texSubImage2D.
         */
        it('webgl2_test_texSubImage2D', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texSubImage2D] texSubImage2D");
            texSubImage2D((image) => {
                let newData = getColorUint8Array(4, 4, 255, 255, 0, 255);
                gl.texSubImage2D(gl.TEXTURE_2D, 0, 0, 0, 4, 2, gl.RGBA, gl.UNSIGNED_BYTE, newData, 8);
            }, (res) => {
                expect(res[0]).assertEqual(255);
                expect(res[1]).assertEqual(255);
                expect(res[2]).assertEqual(0);
                expect(res[3]).assertEqual(255);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0045
         * @tc.name webgl2_test_texSubImage2D_1
         * @tc.desc Test texSubImage2D.
         */
        it('webgl2_test_texSubImage2D_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texSubImage2D_1] texSubImage2D");
            texSubImage2D((image) => {
                let newData = getColorUint8Array(4, 4, 255, 255, 0, 255);
                gl.texSubImage2D(gl.TEXTURE_CUBE_MAP_POSITIVE_X, 0, 0, 0, 4, 2, gl.RGBA, gl.UNSIGNED_BYTE, newData, 8);
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0046
         * @tc.name webgl2_test_texSubImage2D_2
         * @tc.desc Test texSubImage2D.
         */
        it('webgl2_test_texSubImage2D_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texSubImage2D_2] texSubImage2D");
            texSubImage2D((image) => {
                let newData = getColorUint8Array(4, 4, 255, 255, 0, 255);
                gl.texSubImage2D(gl.TEXTURE_CUBE_MAP_NEGATIVE_X, 0, 0, 0, 4, 2, gl.RGBA, gl.UNSIGNED_BYTE, newData, 8);
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0047
         * @tc.name webgl2_test_texSubImage2D_3
         * @tc.desc Test texSubImage2D.
         */
        it('webgl2_test_texSubImage2D_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texSubImage2D_3] texSubImage2D");
            texSubImage2D((image) => {
                let newData = getColorUint8Array(4, 4, 255, 255, 0, 255);
                gl.texSubImage2D(gl.TEXTURE_CUBE_MAP_POSITIVE_Y, 0, 0, 0, 4, 2, gl.RGBA, gl.UNSIGNED_BYTE, newData, 8);
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0048
         * @tc.name webgl2_test_texSubImage2D_4
         * @tc.desc Test texSubImage2D.
         */
        it('webgl2_test_texSubImage2D_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texSubImage2D_4] texSubImage2D");
            texSubImage2D((image) => {
                let newData = getColorUint8Array(4, 4, 255, 255, 0, 255);
                gl.texSubImage2D(gl.TEXTURE_CUBE_MAP_NEGATIVE_Y, 0, 0, 0, 4, 2, gl.RGBA, gl.UNSIGNED_BYTE, newData, 8);
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0049
         * @tc.name webgl2_test_texSubImage2D_5
         * @tc.desc Test texSubImage2D.
         */
        it('webgl2_test_texSubImage2D_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texSubImage2D_5] texSubImage2D");
            texSubImage2D((image) => {
                let newData = getColorUint8Array(4, 4, 255, 255, 0, 255);
                gl.texSubImage2D(gl.TEXTURE_CUBE_MAP_POSITIVE_Z, 0, 0, 0, 4, 2, gl.RGBA, gl.UNSIGNED_BYTE, newData, 8);
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0050
         * @tc.name webgl2_test_texSubImage2D_6
         * @tc.desc Test texSubImage2D.
         */
        it('webgl2_test_texSubImage2D_6', 0, async function (done) {
            console.info("webgl2test [webgl2_test_texSubImage2D_6] texSubImage2D");
            texSubImage2D((image) => {
                let newData = getColorUint8Array(4, 4, 255, 255, 0, 255);
                gl.texSubImage2D(gl.TEXTURE_CUBE_MAP_NEGATIVE_Z, 0, 0, 0, 4, 2, gl.RGBA, gl.UNSIGNED_BYTE, newData, 8);
            }, (res) => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        function compressedTexImage2D(callback, finish) {
            let texture = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_2D, texture);
            console.log(gl.getSupportedExtensions());
            console.log(gl.getParameter(gl.COMPRESSED_TEXTURE_FORMATS));
            callback();
            finish();
            gl.deleteTexture(texture);
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0051
         * @tc.name webgl2_test_compressedTexImage2D
         * @tc.desc Test compressedTexImage2D.
         */
        it('webgl2_test_compressedTexImage2D', 0, async function (done) {
            console.info("webgl2test [webgl2_test_compressedTexImage2D] compressedTexImage2D");
            let texture = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_2D, texture);
            console.log(gl.getSupportedExtensions());
            console.log(gl.getParameter(gl.COMPRESSED_TEXTURE_FORMATS));
            gl.compressedTexImage2D(gl.TEXTURE_2D, 0, gl.COMPRESSED_TEXTURE_FORMATS, 1, 1, 0, new Float32Array(1 * 1 * 4));
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            gl.deleteTexture(texture);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0052
         * @tc.name webgl2_test_compressedTexImage2D_1
         * @tc.desc Test compressedTexImage2D.
         */
        it('webgl2_test_compressedTexImage2D_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_compressedTexImage2D_1] compressedTexImage2D");
            compressedTexImage2D(() => {
                gl.compressedTexImage2D(gl.TEXTURE_CUBE_MAP_POSITIVE_X, 0, gl.COMPRESSED_TEXTURE_FORMATS, 1, 1, 0, new Float32Array(1 * 1 * 4));
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0053
         * @tc.name webgl2_test_compressedTexImage2D_2
         * @tc.desc Test compressedTexImage2D.
         */
        it('webgl2_test_compressedTexImage2D_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_compressedTexImage2D_2] compressedTexImage2D");
            compressedTexImage2D(() => {
                gl.compressedTexImage2D(gl.TEXTURE_CUBE_MAP_NEGATIVE_X, 0, gl.COMPRESSED_TEXTURE_FORMATS, 1, 1, 0, new Float32Array(1 * 1 * 4));
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0054
         * @tc.name webgl2_test_compressedTexImage2D_3
         * @tc.desc Test compressedTexImage2D.
         */
        it('webgl2_test_compressedTexImage2D_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_compressedTexImage2D_3] compressedTexImage2D");
            compressedTexImage2D(() => {
                gl.compressedTexImage2D(gl.TEXTURE_CUBE_MAP_POSITIVE_Y, 0, gl.COMPRESSED_TEXTURE_FORMATS, 1, 1, 0, new Float32Array(1 * 1 * 4));
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0055
         * @tc.name webgl2_test_compressedTexImage2D_4
         * @tc.desc Test compressedTexImage2D.
         */
        it('webgl2_test_compressedTexImage2D_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_compressedTexImage2D_4] compressedTexImage2D");
            compressedTexImage2D(() => {
                gl.compressedTexImage2D(gl.TEXTURE_CUBE_MAP_NEGATIVE_Y, 0, gl.COMPRESSED_TEXTURE_FORMATS, 1, 1, 0, new Float32Array(1 * 1 * 4));
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0056
         * @tc.name webgl2_test_compressedTexImage2D_5
         * @tc.desc Test compressedTexImage2D.
         */
        it('webgl2_test_compressedTexImage2D_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_compressedTexImage2D_5] compressedTexImage2D");
            compressedTexImage2D(() => {
                gl.compressedTexImage2D(gl.TEXTURE_CUBE_MAP_POSITIVE_Z, 0, gl.COMPRESSED_TEXTURE_FORMATS, 1, 1, 0, new Float32Array(1 * 1 * 4));
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0057
         * @tc.name webgl2_test_compressedTexImage2D_6
         * @tc.desc Test compressedTexImage2D.
         */
        it('webgl2_test_compressedTexImage2D_6', 0, async function (done) {
            console.info("webgl2test [webgl2_test_compressedTexImage2D_6] compressedTexImage2D");
            compressedTexImage2D(() => {
                gl.compressedTexImage2D(gl.TEXTURE_CUBE_MAP_NEGATIVE_Z, 0, gl.COMPRESSED_TEXTURE_FORMATS, 1, 1, 0, new Float32Array(1 * 1 * 4));
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        function compressedTexSubImage2D(callback, finish) {
            let texture = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_2D, texture);
            console.log(gl.getParameter(gl.COMPRESSED_TEXTURE_FORMATS));
            gl.compressedTexImage2D(gl.TEXTURE_2D, 0, gl.COMPRESSED_TEXTURE_FORMATS, 1, 1, 0, new Float32Array(1 * 1 * 4));
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            callback();
            finish();
            gl.deleteTexture(texture);
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0058
         * @tc.name webgl2_test_compressedTexSubImage2D
         * @tc.desc Test compressedTexSubImage2D.
         */
        it('webgl2_test_compressedTexSubImage2D', 0, async function (done) {
            console.info("webgl2test [webgl2_test_compressedTexSubImage2D] compressedTexSubImage2D");
            let texture = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_2D, texture);
            console.log(gl.getParameter(gl.COMPRESSED_TEXTURE_FORMATS));
            gl.compressedTexImage2D(gl.TEXTURE_2D, 0, gl.COMPRESSED_TEXTURE_FORMATS, 1, 1, 0, new Float32Array(1 * 1 * 4));
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            gl.compressedTexSubImage2D(gl.TEXTURE_2D, 0, 0, 0, 1, 1, gl.COMPRESSED_TEXTURE_FORMATS, new Float32Array(4), 0, 1);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            gl.deleteTexture(texture);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0059
         * @tc.name webgl2_test_compressedTexSubImage2D_1
         * @tc.desc Test compressedTexSubImage2D.
         */
        it('webgl2_test_compressedTexSubImage2D_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_compressedTexSubImage2D_1] compressedTexSubImage2D");
            compressedTexSubImage2D(() => {
                gl.compressedTexSubImage2D(gl.TEXTURE_2D, 0, 0, 0, 1, 1, gl.COMPRESSED_TEXTURE_FORMATS, new Float32Array(4), 0, 1);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0060
         * @tc.name webgl2_test_compressedTexSubImage2D_2
         * @tc.desc Test compressedTexSubImage2D.
         */
        it('webgl2_test_compressedTexSubImage2D_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_compressedTexSubImage2D_2] compressedTexSubImage2D");
            compressedTexSubImage2D(() => {
                gl.compressedTexSubImage2D(gl.TEXTURE_CUBE_MAP_NEGATIVE_X, 0, 0, 0, 1, 1, gl.COMPRESSED_TEXTURE_FORMATS, new Float32Array(4), 0, 1);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0061
         * @tc.name webgl2_test_compressedTexSubImage2D_3
         * @tc.desc Test compressedTexSubImage2D.
         */
        it('webgl2_test_compressedTexSubImage2D_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_compressedTexSubImage2D_3] compressedTexSubImage2D");
            compressedTexSubImage2D(() => {
                gl.compressedTexSubImage2D(gl.TEXTURE_CUBE_MAP_POSITIVE_Y, 0, 0, 0, 1, 1, gl.COMPRESSED_TEXTURE_FORMATS, new Float32Array(4), 0, 1);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0062
         * @tc.name webgl2_test_compressedTexSubImage2D_4
         * @tc.desc Test compressedTexSubImage2D.
         */
        it('webgl2_test_compressedTexSubImage2D_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_compressedTexSubImage2D_4] compressedTexSubImage2D");
            compressedTexSubImage2D(() => {
                gl.compressedTexSubImage2D(gl.TEXTURE_CUBE_MAP_NEGATIVE_Y, 0, 0, 0, 1, 1, gl.COMPRESSED_TEXTURE_FORMATS, new Float32Array(4), 0, 1);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0063
         * @tc.name webgl2_test_compressedTexSubImage2D_5
         * @tc.desc Test compressedTexSubImage2D.
         */
        it('webgl2_test_compressedTexSubImage2D_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_compressedTexSubImage2D_5] compressedTexSubImage2D");
            compressedTexSubImage2D(() => {
                gl.compressedTexSubImage2D(gl.TEXTURE_CUBE_MAP_POSITIVE_Z, 0, 0, 0, 1, 1, gl.COMPRESSED_TEXTURE_FORMATS, new Float32Array(4), 0, 1);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0064
         * @tc.name webgl2_test_compressedTexSubImage2D_6
         * @tc.desc Test compressedTexSubImage2D.
         */
        it('webgl2_test_compressedTexSubImage2D_6', 0, async function (done) {
            console.info("webgl2test [webgl2_test_compressedTexSubImage2D_6] compressedTexSubImage2D");
            compressedTexSubImage2D(() => {
                gl.compressedTexSubImage2D(gl.TEXTURE_CUBE_MAP_NEGATIVE_Z, 0, 0, 0, 1, 1, gl.COMPRESSED_TEXTURE_FORMATS, new Float32Array(4), 0, 1);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0065
         * @tc.name webgl2_test_readPixels
         * @tc.desc Test readPixels.
         */
        it('webgl2_test_readPixels', 0, async function (done) {
            console.info("webgl2test [webgl2_test_readPixels] readPixels");
            let srcViewport = gl.getParameter(gl.VIEWPORT);
            let p = createProgram(gl, `#version 300 es
                in vec4 a_position;
                in vec3 a_color;
                out vec3 v_color;
                void main(){
                    gl_Position = a_position;
                    gl_PointSize = 1.0;
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
                -0.5, -0.5, 1.0, 0.0, 0.0,
                0.5, -0.5, 0.0, 0.0, 0.0,
                -0.5, 0.5, 0.0, 1.0, 0.0,
                0.5, 0.5, 0.0, 0.0, 1.0,
            ]);
            let num = 4;
            let FSIZE = source.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            gl.bufferData(gl.ARRAY_BUFFER, source, gl.STATIC_READ, 0, 20);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            let a_position = gl.getAttribLocation(p.program, 'a_position');
            gl.vertexAttribPointer(a_position, 2, gl.FLOAT, false, 5 * FSIZE, 0);
            gl.enableVertexAttribArray(a_position);
            let a_color = gl.getAttribLocation(p.program, 'a_color');
            gl.vertexAttribPointer(a_color, 3, gl.FLOAT, false, 5 * FSIZE, 2 * FSIZE);
            gl.enableVertexAttribArray(a_color);
            gl.clearColor(0, 0, 0, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.viewport(0, 0, 2, 2);
            gl.drawArrays(gl.POINTS, 0, 4);
            let result = new Uint8Array(2 * 2 * 4 + 4);
            gl.readPixels(0, 0, 2, 2, gl.RGBA, gl.UNSIGNED_BYTE, result, 4);
            console.info("webgltest ", result);
            expect(result[0]).assertEqual(0);
            expect(result[1]).assertEqual(0);
            expect(result[2]).assertEqual(0);
            expect(result[3]).assertEqual(0);
            expect(result[4]).assertEqual(255);
            expect(result[5]).assertEqual(0);
            expect(result[6]).assertEqual(0);
            expect(result[7]).assertEqual(255);
            gl.deleteBuffer(buffer);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            gl.disableVertexAttribArray(a_color);
            gl.disableVertexAttribArray(a_position);
            gl.viewport(srcViewport[0], srcViewport[1], srcViewport[2], srcViewport[3]);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TEXTURE_0066
         * @tc.name webgl2_test_readPixels_2
         * @tc.desc Test readPixels.
         */
        it('webgl2_test_readPixels_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_readPixels_2] readPixels");
            let srcViewport = gl.getParameter(gl.VIEWPORT);
            let p = createProgram(gl, `#version 300 es
                in vec4 a_position;
                in vec3 a_color;
                out vec3 v_color;
                void main(){
                    gl_Position = a_position;
                    gl_PointSize = 1.0;
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
                -0.5, -0.5, 1.0, 0.0, 0.0,
                0.5, -0.5, 0.0, 0.0, 0.0,
                -0.5, 0.5, 0.0, 1.0, 0.0,
                0.5, 0.5, 0.0, 0.0, 1.0,
            ]);
            let num = 4;
            let FSIZE = source.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            gl.bufferData(gl.ARRAY_BUFFER, source, gl.STATIC_READ, 0, 20);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            let a_position = gl.getAttribLocation(p.program, 'a_position');
            gl.vertexAttribPointer(a_position, 2, gl.FLOAT, false, 5 * FSIZE, 0);
            gl.enableVertexAttribArray(a_position);
            let a_color = gl.getAttribLocation(p.program, 'a_color');
            gl.vertexAttribPointer(a_color, 3, gl.FLOAT, false, 5 * FSIZE, 2 * FSIZE);
            gl.enableVertexAttribArray(a_color);
            gl.clearColor(0, 0, 0, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.viewport(0, 0, 2, 2);
            gl.drawArrays(gl.POINTS, 0, 4);
            let result = new Uint8Array(2 * 2 * 4);
            gl.readPixels(0, 0, 2, 2, gl.RGBA, gl.UNSIGNED_BYTE, result);
            console.info("webgltest ", result);
            expect(result[0]).assertEqual(255);
            expect(result[1]).assertEqual(0);
            expect(result[2]).assertEqual(0);
            expect(result[3]).assertEqual(255);
            expect(result[4]).assertEqual(0);
            expect(result[5]).assertEqual(0);
            expect(result[6]).assertEqual(0);
            expect(result[7]).assertEqual(255);
            gl.deleteBuffer(buffer);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            gl.disableVertexAttribArray(a_color);
            gl.disableVertexAttribArray(a_position);
            gl.viewport(srcViewport[0], srcViewport[1], srcViewport[2], srcViewport[3]);
            checkError(gl);
            done();
        });
    })
}
