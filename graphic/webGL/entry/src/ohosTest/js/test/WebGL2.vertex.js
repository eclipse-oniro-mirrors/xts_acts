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

import {checkError, createProgram, getColorUint8Array,clear,WEBGL2_FRAGMENT_SHADER_DEMO} from './WebGL2';


export default function webgl2_vertex() {
    
	describe('webgl2_vertex', function () {
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
        function vertexAttribI4i(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                in ivec4 a_Position;
                void main(){
                    gl_Position.x = float(a_Position.x);
                    gl_Position.y = float(a_Position.y);
                    gl_Position.z = float(a_Position.z);
                    gl_Position.w = float(a_Position.w);
                    gl_PointSize = 100.0;
                }
            `, `#version 300 es
                precision mediump float;
                out vec4 color;
                void main() {
                    color = vec4(1.0,0.0,0.0,1.0);
                }
            `);
            gl.useProgram(p.program);
            let p_position = gl.getAttribLocation(p.program, "a_Position");
            let defVal = gl.getVertexAttrib(p_position, gl.CURRENT_VERTEX_ATTRIB);
            expect(p_position != null).assertTrue();
            gl.vertexAttribI4i(p_position, 1, 1, 0, 1);
            let a = gl.getVertexAttrib(p_position, gl.CURRENT_VERTEX_ATTRIB);
            console.info("webgltest", a);
            expect(a[0]).assertEqual(1);
            expect(a[1]).assertEqual(1);
            expect(a[2]).assertEqual(0);
            expect(a[3]).assertEqual(1);
            callback();
            gl.clearColor(0.9, 0.9, 0.9, 1.0);
            gl.vertexAttribI4i(p_position, defVal[0], defVal[1], defVal[2], defVal[3]);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.POINTS, 0, 1);
            finish();
            gl.vertexAttrib4f(p_position, 0.0, 0.0, 0.0, 1.0);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            gl.flush();
            checkError(gl);
        }
        /**
         * Method specifies the integer value of a common vertex attribute.
         */
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0001
         * @tc.name webgl2_test_vertexAttribI4i
         * @tc.desc Test vertexAttribI4i.
         */
        it('webgl2_test_vertexAttribI4i', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4i] vertexAttribI4i");
            let p = createProgram(gl, `#version 300 es
                in ivec4 a_Pos;
                void main(){
                    gl_Position.x = float(a_Pos.x);
                    gl_Position.y = float(a_Pos.y);
                    gl_Position.z = float(a_Pos.z);
                    gl_Position.w = float(a_Pos.w);
                    gl_PointSize = 100.0;
                }
            `, `#version 300 es
                precision mediump int;
                precision mediump float;
                out vec4 color;
                void main() {
                    color = vec4(1.0,0.0,0.0,1.0);
                }
            `);
            gl.useProgram(p.program);
            let p_position = gl.getAttribLocation(p.program, "a_Pos");
            let defVal = gl.getVertexAttrib(p_position, gl.CURRENT_VERTEX_ATTRIB);
            console.info("webgltest", defVal);
            gl.vertexAttribI4i(p_position, 0, 0, 0, 1);
            let a = gl.getVertexAttrib(p_position, gl.CURRENT_VERTEX_ATTRIB);
            console.info("webgltest", a);
            expect(a[0]).assertEqual(0);
            expect(a[1]).assertEqual(0);
            expect(a[2]).assertEqual(0);
            expect(a[3]).assertEqual(1);
            gl.clearColor(0.9, 0.9, 0.9, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.vertexAttrib4f(p_position, 0.0, 0.0, 0.0, 1.0);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0002
         * @tc.name webgl2_test_vertexAttribI4i_1
         * @tc.desc Test vertexAttribI4i.
         */
        it('webgl2_test_vertexAttribI4i_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4i] vertexAttribI4i");
            vertexAttribI4i((p_position) => {
                gl.vertexAttribI4i(p_position, 1, 1, 0, 1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0003
         * @tc.name webgl2_test_vertexAttribI4i_2
         * @tc.desc Test vertexAttribI4i.
         */
        it('webgl2_test_vertexAttribI4i_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4i] vertexAttribI4i");
            vertexAttribI4i((p_position) => {
                gl.vertexAttribI4i(null, 1, 1, 0, 1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0004
         * @tc.name webgl2_test_vertexAttribI4i_3
         * @tc.desc Test vertexAttribI4i.
         */
        it('webgl2_test_vertexAttribI4i_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4i] vertexAttribI4i");
            vertexAttribI4i((p_position) => {
                gl.vertexAttribI4i(undefined, 1, 1, 0, 1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0005
         * @tc.name webgl2_test_vertexAttribI4i_4
         * @tc.desc Test vertexAttribI4i.
         */
        it('webgl2_test_vertexAttribI4i_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4i] vertexAttribI4i");
            vertexAttribI4i((p_position) => {
                gl.vertexAttribI4i(false, 1, 1, 0, 1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0006
         * @tc.name webgl2_test_vertexAttribI4i_5
         * @tc.desc Test vertexAttribI4i.
         */
        it('webgl2_test_vertexAttribI4i_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4i] vertexAttribI4i");
            vertexAttribI4i((p_position) => {
                gl.vertexAttribI4i(0, 1, 1, 0, 1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0007
         * @tc.name webgl2_test_vertexAttribI4i_6
         * @tc.desc Test vertexAttribI4i.
         */
        it('webgl2_test_vertexAttribI4i_6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4i] vertexAttribI4i");
            vertexAttribI4i((p_position) => {
                gl.vertexAttribI4i(true, 1, 1, 0, 1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0008
         * @tc.name webgl2_test_vertexAttribI4i_7
         * @tc.desc Test vertexAttribI4i.
         */
        it('webgl2_test_vertexAttribI4i_7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4i] vertexAttribI4i");
            vertexAttribI4i((p_position) => {
                gl.vertexAttribI4i(undefined, undefined, undefined, undefined, undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0009
         * @tc.name webgl2_test_vertexAttribI4i_8
         * @tc.desc Test vertexAttribI4i.
         */
        it('webgl2_test_vertexAttribI4i_8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4i] vertexAttribI4i");
            vertexAttribI4i((p_position) => {
                gl.vertexAttribI4i(null, null, null, null, null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0010
         * @tc.name webgl2_test_vertexAttribI4i_9
         * @tc.desc Test vertexAttribI4i.
         */
        it('webgl2_test_vertexAttribI4i_9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4i] vertexAttribI4i");
            vertexAttribI4i((p_position) => {
                gl.vertexAttribI4i(true, true, true, true, true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0011
         * @tc.name webgl2_test_vertexAttribI4i_10
         * @tc.desc Test vertexAttribI4i.
         */
        it('webgl2_test_vertexAttribI4i_10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4i] vertexAttribI4i");
            vertexAttribI4i((p_position) => {
                gl.vertexAttribI4i(false, false, false, false, false);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function vertexAttribI4iv(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                in ivec4 a_Position;
                void main(){
                    gl_Position.x = float(a_Position.x);
                    gl_Position.y = float(a_Position.y);
                    gl_Position.z = float(a_Position.z);
                    gl_Position.w = float(a_Position.w);
                    gl_PointSize = 100.0;
                }
            `, `#version 300 es
                precision mediump float;
                out vec4 color;
                void main() {
                    color = vec4(1.0,0.0,0.0,1.0);
                }
            `);
            gl.useProgram(p.program);
            let p_position = gl.getAttribLocation(p.program, "a_Position");
            gl.vertexAttribI4iv(p_position, new Int32Array([1, 1, 0, 1]));
            let a = gl.getVertexAttrib(p_position, gl.CURRENT_VERTEX_ATTRIB);
            console.info("webgltest", a);
            expect(a[0]).assertEqual(1);
            expect(a[1]).assertEqual(1);
            expect(a[2]).assertEqual(0);
            expect(a[3]).assertEqual(1);
            callback();
            gl.clearColor(0.9, 0.9, 0.9, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.POINTS, 0, 1);
            finish();
            gl.vertexAttrib4f(p_position, 0.0, 0.0, 0.0, 1.0);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            gl.flush();
            checkError(gl);
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0012
         * @tc.name webgl2_test_vertexAttribI4iv
         * @tc.desc Test vertexAttribI4iv.
         */
        it('webgl2_test_vertexAttribI4iv', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4iv] vertexAttribI4iv");
            let p = createProgram(gl, `#version 300 es
                in ivec4 a_Position;
                void main(){
                    gl_Position.x = float(a_Position.x);
                    gl_Position.y = float(a_Position.y);
                    gl_Position.z = float(a_Position.z);
                    gl_Position.w = float(a_Position.w);
                    gl_PointSize = 100.0;
                }
            `, `#version 300 es
                precision mediump float;
                out vec4 color;
                void main() {
                    color = vec4(1.0,0.0,0.0,1.0);
                }
            `);
            gl.useProgram(p.program);
            let p_position = gl.getAttribLocation(p.program, "a_Position");
            gl.vertexAttribI4iv(p_position, new Int32Array([1, 1, 0, 1]));
            let a = gl.getVertexAttrib(p_position, gl.CURRENT_VERTEX_ATTRIB);
            console.info("webgltest", a);
            expect(a[0]).assertEqual(1);
            expect(a[1]).assertEqual(1);
            expect(a[2]).assertEqual(0);
            expect(a[3]).assertEqual(1);
            gl.vertexAttrib4f(p_position, 0.0, 0.0, 0.0, 1.0);
            gl.clearColor(0.9, 0.9, 0.9, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0013
         * @tc.name webgl2_test_vertexAttribI4iv_1
         * @tc.desc Test vertexAttribI4iv.
         */
        it('webgl2_test_vertexAttribI4iv_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4iv] vertexAttribI4iv");
            vertexAttribI4iv((p_position) => {
                gl.vertexAttribI4iv(p_position, new Int32Array([1, 1, 0, 1]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0014
         * @tc.name webgl2_test_vertexAttribI4iv_2
         * @tc.desc Test vertexAttribI4iv.
         */
        it('webgl2_test_vertexAttribI4iv_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4iv] vertexAttribI4iv");
            vertexAttribI4iv((p_position) => {
                gl.vertexAttribI4iv(null, new Int32Array([1, 1, 0, 1]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0015
         * @tc.name webgl2_test_vertexAttribI4iv_3
         * @tc.desc Test vertexAttribI4iv.
         */
        it('webgl2_test_vertexAttribI4iv_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4iv] vertexAttribI4iv");
            vertexAttribI4iv((p_position) => {
                gl.vertexAttribI4iv(false, new Int32Array([1, 1, 0, 1]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0016
         * @tc.name webgl2_test_vertexAttribI4iv_4
         * @tc.desc Test vertexAttribI4iv.
         */
        it('webgl2_test_vertexAttribI4iv_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4iv] vertexAttribI4iv");
            vertexAttribI4iv((p_position) => {
                gl.vertexAttribI4iv(false, new Int32Array([false, false, false, false]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0017
         * @tc.name webgl2_test_vertexAttribI4iv_5
         * @tc.desc Test vertexAttribI4iv.
         */
        it('webgl2_test_vertexAttribI4iv_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4iv] vertexAttribI4iv");
            vertexAttribI4iv((p_position) => {
                gl.vertexAttribI4iv(true, new Int32Array([1, 1, 0, 1]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0018
         * @tc.name webgl2_test_vertexAttribI4iv_6
         * @tc.desc Test vertexAttribI4iv.
         */
        it('webgl2_test_vertexAttribI4iv_6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4iv] vertexAttribI4iv");
            vertexAttribI4iv((p_position) => {
                gl.vertexAttribI4iv(true, new Int32Array([true, true, true, true]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0019
         * @tc.name webgl2_test_vertexAttribI4iv_7
         * @tc.desc Test vertexAttribI4iv.
         */
        it('webgl2_test_vertexAttribI4iv_7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4iv] vertexAttribI4iv");
            vertexAttribI4iv((p_position) => {
                gl.vertexAttribI4iv(undefined, new Int32Array([1, 1, 0, 1]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0020
         * @tc.name webgl2_test_vertexAttribI4iv_8
         * @tc.desc Test vertexAttribI4iv.
         */
        it('webgl2_test_vertexAttribI4iv_8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4iv] vertexAttribI4iv");
            vertexAttribI4iv((p_position) => {
                gl.vertexAttribI4iv(undefined, new Int32Array([undefined, undefined, undefined, undefined]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0021
         * @tc.name webgl2_test_vertexAttribI4iv_9
         * @tc.desc Test vertexAttribI4iv.
         */
        it('webgl2_test_vertexAttribI4iv_9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4iv] vertexAttribI4iv");
            vertexAttribI4iv((p_position) => {
                gl.vertexAttribI4iv(0, new Int32Array([1, 1, 0, 1]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0022
         * @tc.name webgl2_test_vertexAttribI4iv_10
         * @tc.desc Test vertexAttribI4iv.
         */
        it('webgl2_test_vertexAttribI4iv_10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4iv] vertexAttribI4iv");
            vertexAttribI4iv((p_position) => {
                gl.vertexAttribI4iv(null, new Int32Array([null, null, null, null]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function vertexAttribI4ui(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                in uvec4 a_Position;
                void main(){
                    gl_Position.x = float(a_Position.x);
                    gl_Position.y = float(a_Position.y);
                    gl_Position.z = float(a_Position.z);
                    gl_Position.w = float(a_Position.w);
                    gl_PointSize = 100.0;
                }
            `, `#version 300 es
                precision mediump float;
                out vec4 color;
                void main() {
                    color = vec4(1.0,0.0,0.0,1.0);
                }
            `);
            gl.useProgram(p.program);
            let p_position = gl.getAttribLocation(p.program, "a_Position");
            gl.vertexAttribI4ui(p_position, 1, 1, 0, 1);
            let a = gl.getVertexAttrib(p_position, gl.CURRENT_VERTEX_ATTRIB);
            console.info("webgltest", a);
            expect(a[0]).assertEqual(1);
            expect(a[1]).assertEqual(1);
            expect(a[2]).assertEqual(0);
            expect(a[3]).assertEqual(1);
            callback();
            gl.clearColor(0.9, 0.9, 0.9, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.POINTS, 0, 1);
            finish();
            gl.vertexAttrib4f(p_position, 0.0, 0.0, 0.0, 1.0);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            gl.flush();
            checkError(gl);
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0023
         * @tc.name webgl2_test_vertexAttribI4ui
         * @tc.desc Test vertexAttribI4ui.
         */
        it('webgl2_test_vertexAttribI4ui', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4ui] vertexAttribI4ui");
            let p = createProgram(gl, `#version 300 es
                in uvec4 a_Position;
                void main(){
                    gl_Position.x = float(a_Position.x);
                    gl_Position.y = float(a_Position.y);
                    gl_Position.z = float(a_Position.z);
                    gl_Position.w = float(a_Position.w);
                    gl_PointSize = 100.0;
                }
            `, `#version 300 es
                precision mediump float;
                out vec4 color;
                void main() {
                    color = vec4(1.0,0.0,0.0,1.0);
                }
            `);
            gl.useProgram(p.program);
            let p_position = gl.getAttribLocation(p.program, "a_Position");
            gl.vertexAttribI4ui(p_position, 1, 1, 0, 1);
            let a = gl.getVertexAttrib(p_position, gl.CURRENT_VERTEX_ATTRIB);
            console.info("webgltest", a);
            expect(a[0]).assertEqual(1);
            expect(a[1]).assertEqual(1);
            expect(a[2]).assertEqual(0);
            expect(a[3]).assertEqual(1);
            gl.clearColor(0.9, 0.9, 0.9, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.vertexAttrib4f(p_position, 0.0, 0.0, 0.0, 1.0);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            gl.flush();
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0024
         * @tc.name webgl2_test_vertexAttribI4ui_1
         * @tc.desc Test vertexAttribI4ui.
         */
        it('webgl2_test_vertexAttribI4ui_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4ui] vertexAttribI4ui");
            vertexAttribI4ui((p_position) => {
                gl.vertexAttribI4ui(p_position, 1, 1, 0, 1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0025
         * @tc.name webgl2_test_vertexAttribI4ui_2
         * @tc.desc Test vertexAttribI4ui.
         */
        it('webgl2_test_vertexAttribI4ui_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4ui] vertexAttribI4ui");
            vertexAttribI4ui((p_position) => {
                gl.vertexAttribI4ui(0, 1, 1, 0, 1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0026
         * @tc.name webgl2_test_vertexAttribI4ui_3
         * @tc.desc Test vertexAttribI4ui.
         */
        it('webgl2_test_vertexAttribI4ui_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4ui] vertexAttribI4ui");
            vertexAttribI4ui((p_position) => {
                gl.vertexAttribI4ui(null, 1, 1, 0, 1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0027
         * @tc.name webgl2_test_vertexAttribI4ui_4
         * @tc.desc Test vertexAttribI4ui.
         */
        it('webgl2_test_vertexAttribI4ui_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4ui] vertexAttribI4ui");
            vertexAttribI4ui((p_position) => {
                gl.vertexAttribI4ui(null, null, null, null, null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0028
         * @tc.name webgl2_test_vertexAttribI4ui_5
         * @tc.desc Test vertexAttribI4ui.
         */
        it('webgl2_test_vertexAttribI4ui_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4ui] vertexAttribI4ui");
            vertexAttribI4ui((p_position) => {
                gl.vertexAttribI4ui(undefined, 1, 1, 0, 1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0029
         * @tc.name webgl2_test_vertexAttribI4ui_6
         * @tc.desc Test vertexAttribI4ui.
         */
        it('webgl2_test_vertexAttribI4ui_6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4ui] vertexAttribI4ui");
            vertexAttribI4ui((p_position) => {
                gl.vertexAttribI4ui(undefined, undefined, undefined, undefined, undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0030
         * @tc.name webgl2_test_vertexAttribI4ui_7
         * @tc.desc Test vertexAttribI4ui.
         */
        it('webgl2_test_vertexAttribI4ui_7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4ui] vertexAttribI4ui");
            vertexAttribI4ui((p_position) => {
                gl.vertexAttribI4ui(false, 1, 1, 0, 1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0031
         * @tc.name webgl2_test_vertexAttribI4ui_8
         * @tc.desc Test vertexAttribI4ui.
         */
        it('webgl2_test_vertexAttribI4ui_8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4ui] vertexAttribI4ui");
            vertexAttribI4ui((p_position) => {
                gl.vertexAttribI4ui(false, false, false, false, false);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0032
         * @tc.name webgl2_test_vertexAttribI4ui_9
         * @tc.desc Test vertexAttribI4ui.
         */
        it('webgl2_test_vertexAttribI4ui_9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4ui] vertexAttribI4ui");
            vertexAttribI4ui((p_position) => {
                gl.vertexAttribI4ui(true, 1, 1, 0, 1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0033
         * @tc.name webgl2_test_vertexAttribI4ui_10
         * @tc.desc Test vertexAttribI4ui.
         */
        it('webgl2_test_vertexAttribI4ui_10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4ui] vertexAttribI4ui");
            vertexAttribI4ui((p_position) => {
                gl.vertexAttribI4ui(true, true, true, true, true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function vertexAttribI4uiv(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                in uvec4 a_Position;
                void main(){
                    gl_Position.x = float(a_Position.x);
                    gl_Position.y = float(a_Position.y);
                    gl_Position.z = float(a_Position.z);
                    gl_Position.w = float(a_Position.w);
                    gl_PointSize = 100.0;
                }
            `, `#version 300 es
                precision mediump float;
                out vec4 color;
                void main() {
                    color = vec4(1.0,0.0,0.0,1.0);
                }
            `);
            gl.useProgram(p.program);
            let p_position = gl.getAttribLocation(p.program, "a_Position");
            gl.vertexAttribI4uiv(p_position, new Uint32Array([1, 1, 0, 1]));
            let a = gl.getVertexAttrib(p_position, gl.CURRENT_VERTEX_ATTRIB);
            console.info("webgltest", a);
            expect(a[0]).assertEqual(1);
            expect(a[1]).assertEqual(1);
            expect(a[2]).assertEqual(0);
            expect(a[3]).assertEqual(1);
            callback();
            gl.clearColor(0.9, 0.9, 0.9, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.POINTS, 0, 1);
            finish();
            gl.vertexAttrib4f(p_position, 0.0, 0.0, 0.0, 1.0);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            gl.flush();
            checkError(gl);
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0034
         * @tc.name webgl2_test_vertexAttribI4uiv
         * @tc.desc Test vertexAttribI4uiv.
         */
        it('webgl2_test_vertexAttribI4uiv', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4uiv] vertexAttribI4uiv");
            let p = createProgram(gl, `#version 300 es
                in uvec4 a_Position;
                void main(){
                    gl_Position.x = float(a_Position.x);
                    gl_Position.y = float(a_Position.y);
                    gl_Position.z = float(a_Position.z);
                    gl_Position.w = float(a_Position.w);
                    gl_PointSize = 100.0;
                }
            `, `#version 300 es
                precision mediump float;
                out vec4 color;
                void main() {
                    color = vec4(1.0,0.0,0.0,1.0);
                }
            `);
            gl.useProgram(p.program);
            let p_position = gl.getAttribLocation(p.program, "a_Position");
            gl.vertexAttribI4uiv(p_position, new Uint32Array([1, 1, 0, 1]));
            let a = gl.getVertexAttrib(p_position, gl.CURRENT_VERTEX_ATTRIB);
            console.info("webgltest", a);
            expect(a[0]).assertEqual(1);
            expect(a[1]).assertEqual(1);
            expect(a[2]).assertEqual(0);
            expect(a[3]).assertEqual(1);
            gl.clearColor(0.9, 0.9, 0.9, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.vertexAttrib4f(p_position, 0.0, 0.0, 0.0, 1.0);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            gl.flush();
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0035
         * @tc.name webgl2_test_vertexAttribI4uiv_1
         * @tc.desc Test vertexAttribI4uiv.
         */
        it('webgl2_test_vertexAttribI4uiv_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4uiv] vertexAttribI4uiv");
            vertexAttribI4uiv((p_position) => {
                gl.vertexAttribI4uiv(p_position, new Uint32Array([1, 1, 0, 1]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0036
         * @tc.name webgl2_test_vertexAttribI4uiv_2
         * @tc.desc Test vertexAttribI4uiv.
         */
        it('webgl2_test_vertexAttribI4uiv_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4uiv] vertexAttribI4uiv");
            vertexAttribI4uiv((p_position) => {
                gl.vertexAttribI4uiv(0, new Uint32Array([1, 1, 0, 1]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0037
         * @tc.name webgl2_test_vertexAttribI4uiv_3
         * @tc.desc Test vertexAttribI4uiv.
         */
        it('webgl2_test_vertexAttribI4uiv_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4uiv] vertexAttribI4uiv");
            vertexAttribI4uiv((p_position) => {
                gl.vertexAttribI4uiv(null, new Uint32Array([1, 1, 0, 1]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0038
         * @tc.name webgl2_test_vertexAttribI4uiv_4
         * @tc.desc Test vertexAttribI4uiv.
         */
        it('webgl2_test_vertexAttribI4uiv_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4uiv] vertexAttribI4uiv");
            vertexAttribI4uiv((p_position) => {
                gl.vertexAttribI4uiv(null, new Uint32Array([null, null, null, null]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0039
         * @tc.name webgl2_test_vertexAttribI4uiv_5
         * @tc.desc Test vertexAttribI4uiv.
         */
        it('webgl2_test_vertexAttribI4uiv_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4uiv] vertexAttribI4uiv");
            vertexAttribI4uiv((p_position) => {
                gl.vertexAttribI4uiv(undefined, new Uint32Array([1, 1, 0, 1]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0040
         * @tc.name webgl2_test_vertexAttribI4uiv_6
         * @tc.desc Test vertexAttribI4uiv.
         */
        it('webgl2_test_vertexAttribI4uiv_6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4uiv] vertexAttribI4uiv");
            vertexAttribI4uiv((p_position) => {
                gl.vertexAttribI4uiv(undefined, new Uint32Array([undefined, undefined, undefined, undefined]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0041
         * @tc.name webgl2_test_vertexAttribI4uiv_7
         * @tc.desc Test vertexAttribI4uiv.
         */
        it('webgl2_test_vertexAttribI4uiv_7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4uiv] vertexAttribI4uiv");
            vertexAttribI4uiv((p_position) => {
                gl.vertexAttribI4uiv(false, new Uint32Array([1, 1, 0, 1]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0042
         * @tc.name webgl2_test_vertexAttribI4uiv_8
         * @tc.desc Test vertexAttribI4uiv.
         */
        it('webgl2_test_vertexAttribI4uiv_8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4uiv] vertexAttribI4uiv");
            vertexAttribI4uiv((p_position) => {
                gl.vertexAttribI4uiv(false, new Uint32Array([false, false, false, false]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0043
         * @tc.name webgl2_test_vertexAttribI4uiv_9
         * @tc.desc Test vertexAttribI4uiv.
         */
        it('webgl2_test_vertexAttribI4uiv_9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4uiv] vertexAttribI4uiv");
            vertexAttribI4uiv((p_position) => {
                gl.vertexAttribI4uiv(true, new Uint32Array([1, 1, 0, 1]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0044
         * @tc.name webgl2_test_vertexAttribI4uiv_10
         * @tc.desc Test vertexAttribI4uiv.
         */
        it('webgl2_test_vertexAttribI4uiv_10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribI4uiv] vertexAttribI4uiv");
            vertexAttribI4uiv((p_position) => {
                gl.vertexAttribI4uiv(true, new Uint32Array([true, true, true, true]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function vertexAttribIPointer(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                in ivec3 a_Position;
                void main(){
                    gl_Position.x = float(a_Position.x);
                    gl_Position.y = float(a_Position.y);
                    gl_Position.z = float(a_Position.z);
                    gl_Position.w = float(1.0);
                    gl_PointSize = 100.0;
                }
            `, `#version 300 es
                precision mediump float;
                out vec4 color;
                void main() {
                    color = vec4(1.0,0.0,0.0,1.0);
                }
            `);
            gl.useProgram(p.program);
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            let source = new Int32Array([
                1, 0, 0, 1,
                0, 1, 0, 1,
                0, 0, 0, 1,
            ]);
            gl.bufferData(gl.ARRAY_BUFFER, source, gl.STATIC_DRAW);
            let p_position = gl.getAttribLocation(p.program, "a_Position");
            gl.enableVertexAttribArray(p_position);
            let size = 3;
            gl.vertexAttribIPointer(p_position, size, gl.INT, size * source.BYTES_PER_ELEMENT, 0 * source.BYTES_PER_ELEMENT);
            let a = gl.getVertexAttrib(p_position, gl.VERTEX_ATTRIB_ARRAY_SIZE);
            console.info("webgltest  VERTEX_ATTRIB_ARRAY_SIZE", a);
            expect(a).assertEqual(size);
            callback();
            gl.clearColor(0.9, 0.9, 0.9, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.POINTS, 0, source.length / size);
            console.log("judge", Object.prototype.toString.call(p.program) === "[object WebGLProgram]");
            finish();
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            gl.disableVertexAttribArray(p_position);
            gl.flush();
            checkError(gl);
        }
        /**
         * Method specifies the integer data format and location of the vertex attributes in the vertex attributes array。
         */
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0045
         * @tc.name webgl2_test_vertexAttribIPointer
         * @tc.desc Test vertexAttribIPointer.
         */
        it('webgl2_test_vertexAttribIPointer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribIPointer] vertexAttribIPointer");
            let p = createProgram(gl, `#version 300 es
                in ivec3 a_Position;
                void main(){
                    gl_Position.x = float(a_Position.x);
                    gl_Position.y = float(a_Position.y);
                    gl_Position.z = float(a_Position.z);
                    gl_Position.w = float(1.0);
                    gl_PointSize = 100.0;
                }
            `, `#version 300 es
                precision mediump float;
                out vec4 color;
                void main() {
                    color = vec4(1.0,0.0,0.0,1.0);
                }
            `);
            gl.useProgram(p.program);
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            let source = new Int32Array([
                1, 0, 0, 1,
                0, 1, 0, 1,
                0, 0, 0, 1,
            ]);
            gl.bufferData(gl.ARRAY_BUFFER, source, gl.STATIC_DRAW);
            let p_position = gl.getAttribLocation(p.program, "a_Position");
            gl.enableVertexAttribArray(p_position);
            let size = 3;
            gl.vertexAttribIPointer(p_position, size, gl.INT, size * source.BYTES_PER_ELEMENT, 0 * source.BYTES_PER_ELEMENT);
            let a = gl.getVertexAttrib(p_position, gl.VERTEX_ATTRIB_ARRAY_SIZE);
            console.info("webgltest  VERTEX_ATTRIB_ARRAY_SIZE", a);
            expect(a).assertEqual(size);
            gl.clearColor(0.9, 0.9, 0.9, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.POINTS, 0, source.length / size);
            console.log("judge", Object.prototype.toString.call(p.program) === "[object WebGLProgram]");
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            gl.disableVertexAttribArray(p_position);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0046
         * @tc.name webgl2_test_vertexAttribIPointer_1
         * @tc.desc Test vertexAttribIPointer.
         */
        it('webgl2_test_vertexAttribIPointer_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribIPointer] vertexAttribIPointer");
            vertexAttribIPointer((p_position) => {
                let source = new Int32Array([
                    1, 0, 0, 1,
                    0, 1, 0, 1,
                    0, 0, 0, 1,
                ]);
                let size = 3;
                gl.vertexAttribIPointer(p_position, size, gl.INT, size * source.BYTES_PER_ELEMENT, 0 * source.BYTES_PER_ELEMENT);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0047
         * @tc.name webgl2_test_vertexAttribIPointer_2
         * @tc.desc Test vertexAttribIPointer.
         */
        it('webgl2_test_vertexAttribIPointer_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribIPointer] vertexAttribIPointer");
            vertexAttribIPointer((p_position) => {
                let source = new Int32Array([
                    1, 0, 0, 1,
                    0, 1, 0, 1,
                    0, 0, 0, 1,
                ]);
                let size = 3;
                gl.vertexAttribIPointer(null, size, gl.INT, size * source.BYTES_PER_ELEMENT, 0 * source.BYTES_PER_ELEMENT);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0048
         * @tc.name webgl2_test_vertexAttribIPointer_3
         * @tc.desc Test vertexAttribIPointer.
         */
        it('webgl2_test_vertexAttribIPointer_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribIPointer] vertexAttribIPointer");
            vertexAttribIPointer((p_position) => {
                let source = new Int32Array([
                    1, 0, 0, 1,
                    0, 1, 0, 1,
                    0, 0, 0, 1,
                ]);
                let size = 3;
                gl.vertexAttribIPointer(0, size, gl.INT, size * source.BYTES_PER_ELEMENT, 0 * source.BYTES_PER_ELEMENT);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0049
         * @tc.name webgl2_test_vertexAttribIPointer_4
         * @tc.desc Test vertexAttribIPointer.
         */
        it('webgl2_test_vertexAttribIPointer_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribIPointer] vertexAttribIPointer");
            vertexAttribIPointer((p_position) => {
                let source = new Int32Array([
                    1, 0, 0, 1,
                    0, 1, 0, 1,
                    0, 0, 0, 1,
                ]);
                let size = 3;
                gl.vertexAttribIPointer(undefined, size, gl.INT, size * source.BYTES_PER_ELEMENT, 0 * source.BYTES_PER_ELEMENT);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0050
         * @tc.name webgl2_test_vertexAttribIPointer_5
         * @tc.desc Test vertexAttribIPointer.
         */
        it('webgl2_test_vertexAttribIPointer_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribIPointer] vertexAttribIPointer");
            vertexAttribIPointer((p_position) => {
                let source = new Int32Array([
                    1, 0, 0, 1,
                    0, 1, 0, 1,
                    0, 0, 0, 1,
                ]);
                let size = 3;
                gl.vertexAttribIPointer(undefined, size, gl.BYTE, size * source.BYTES_PER_ELEMENT, 0 * source.BYTES_PER_ELEMENT);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0051
         * @tc.name webgl2_test_vertexAttribIPointer_6
         * @tc.desc Test vertexAttribIPointer.
         */
        it('webgl2_test_vertexAttribIPointer_6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribIPointer] vertexAttribIPointer");
            vertexAttribIPointer((p_position) => {
                let source = new Int32Array([
                    1, 0, 0, 1,
                    0, 1, 0, 1,
                    0, 0, 0, 1,
                ]);
                let size = 3;
                gl.vertexAttribIPointer(undefined, size, gl.SHORT, size * source.BYTES_PER_ELEMENT, 0 * source.BYTES_PER_ELEMENT);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0052
         * @tc.name webgl2_test_vertexAttribIPointer_7
         * @tc.desc Test vertexAttribIPointer.
         */
        it('webgl2_test_vertexAttribIPointer_7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribIPointer] vertexAttribIPointer");
            vertexAttribIPointer((p_position) => {
                let source = new Int32Array([
                    1, 0, 0, 1,
                    0, 1, 0, 1,
                    0, 0, 0, 1,
                ]);
                let size = 3;
                gl.vertexAttribIPointer(false, size, gl.SHORT, size * source.BYTES_PER_ELEMENT, 0 * source.BYTES_PER_ELEMENT);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0053
         * @tc.name webgl2_test_vertexAttribIPointer_8
         * @tc.desc Test vertexAttribIPointer.
         */
        it('webgl2_test_vertexAttribIPointer_8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_vertexAttribIPointer] vertexAttribIPointer");
            vertexAttribIPointer((p_position) => {
                let source = new Int32Array([
                    1, 0, 0, 1,
                    0, 1, 0, 1,
                    0, 0, 0, 1,
                ]);
                let size = 3;
                gl.vertexAttribIPointer(true, size, gl.SHORT, size * source.BYTES_PER_ELEMENT, 0 * source.BYTES_PER_ELEMENT);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (p_position) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0054
         * @tc.name webgl2_test_createVertexArray
         * @tc.desc Test createVertexArray.
         */
        it('webgl2_test_createVertexArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_createVertexArray] createVertexArray");
            let vertexArray = gl.createVertexArray();
            expect(vertexArray != null).assertEqual(true);
            gl.deleteVertexArray(vertexArray);
            done();
        });
        function deleteVertexArray(callback, finish) {
            let vertexArray = gl.createVertexArray();
            expect(vertexArray != null).assertTrue();
            expect(gl.isVertexArray(vertexArray)).assertFalse();
            callback(vertexArray);
            finish(gl.isVertexArray(vertexArray));
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0055
         * @tc.name webgl2_test_deleteVertexArray
         * @tc.desc Test deleteVertexArray.
         */
        it('webgl2_test_deleteVertexArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_deleteVertexArray] deleteVertexArray");
            let vertexArray = gl.createVertexArray();
            expect(vertexArray != null).assertEqual(true);
            expect(gl.isVertexArray(vertexArray)).assertEqual(false);
            gl.bindVertexArray(vertexArray);
            expect(gl.isVertexArray(vertexArray)).assertEqual(true);
            gl.deleteVertexArray(vertexArray);
            expect(gl.isVertexArray(vertexArray)).assertEqual(false);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0056
         * @tc.name webgl2_test_deleteVertexArray_1
         * @tc.desc Test deleteVertexArray.
         */
        it('webgl2_test_deleteVertexArray_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_deleteVertexArray] deleteVertexArray");
            deleteVertexArray((vertexArray) => {
                gl.deleteVertexArray(vertexArray);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isVertexArray) => {
                expect(isVertexArray).assertEqual(false);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0057
         * @tc.name webgl2_test_deleteVertexArray_2
         * @tc.desc Test deleteVertexArray.
         */
        it('webgl2_test_deleteVertexArray_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_deleteVertexArray] deleteVertexArray");
            deleteVertexArray((vertexArray) => {
                gl.deleteVertexArray(null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isVertexArray) => {
                expect(isVertexArray).assertEqual(false);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0058
         * @tc.name webgl2_test_deleteVertexArray_3
         * @tc.desc Test deleteVertexArray.
         */
        it('webgl2_test_deleteVertexArray_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_deleteVertexArray] deleteVertexArray");
            deleteVertexArray((vertexArray) => {
                gl.deleteVertexArray(undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isVertexArray) => {
                expect(isVertexArray).assertEqual(false);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function isVertexArray(callback, finish) {
            let vertexArrayObject = gl.createVertexArray();
            expect(vertexArrayObject != null).assertTrue();
            callback(vertexArrayObject);
            finish(gl.isVertexArray(vertexArrayObject));
            gl.deleteVertexArray(vertexArrayObject);
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0059
         * @tc.name webgl2_test_isVertexArray
         * @tc.desc Test isVertexArray.
         */
        it('webgl2_test_isVertexArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_isVertexArray] isVertexArray");
            let vertexArrayObject = gl.createVertexArray();
            expect(vertexArrayObject != null).assertEqual(true);
            expect(gl.isVertexArray(vertexArrayObject)).assertEqual(false);
            gl.bindVertexArray(vertexArrayObject);
            expect(gl.isVertexArray(vertexArrayObject)).assertEqual(true);
            gl.deleteVertexArray(vertexArrayObject);
            expect(gl.isVertexArray(vertexArrayObject)).assertEqual(false);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0060
         * @tc.name webgl2_test_isVertexArray_1
         * @tc.desc Test isVertexArray.
         */
        it('webgl2_test_isVertexArray_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_isVertexArray] isVertexArray");
            isVertexArray((vertexArrayObject) => {
                gl.isVertexArray(vertexArrayObject);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0061
         * @tc.name webgl2_test_isVertexArray_2
         * @tc.desc Test isVertexArray.
         */
        it('webgl2_test_isVertexArray_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_isVertexArray] isVertexArray");
            isVertexArray((vertexArrayObject) => {
                gl.isVertexArray(null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0062
         * @tc.name webgl2_test_isVertexArray_3
         * @tc.desc Test isVertexArray.
         */
        it('webgl2_test_isVertexArray_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_isVertexArray] isVertexArray");
            isVertexArray((vertexArrayObject) => {
                gl.isVertexArray(undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function bindVertexArray(callback, finish) {
            let vertexArrayObject = gl.createVertexArray();
            gl.bindVertexArray(vertexArrayObject);
            callback(vertexArrayObject);
            finish(gl.isVertexArray(vertexArrayObject));
            gl.deleteVertexArray(vertexArrayObject);
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0063
         * @tc.name webgl2_test_bindVertexArray
         * @tc.desc Test bindVertexArray.
         */
        it('webgl2_test_bindVertexArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_bindVertexArray] bindVertexArray");
            let vertexArrayObject = gl.createVertexArray();
            expect(vertexArrayObject != null).assertEqual(true);
            expect(gl.isVertexArray(vertexArrayObject)).assertEqual(false);
            gl.bindVertexArray(vertexArrayObject);
            expect(gl.getParameter(gl.VERTEX_ARRAY_BINDING)).assertEqual(vertexArrayObject);
            expect(gl.isVertexArray(vertexArrayObject)).assertEqual(true);
            gl.deleteVertexArray(vertexArrayObject);
            expect(gl.isVertexArray(vertexArrayObject)).assertEqual(false);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0064
         * @tc.name webgl2_test_bindVertexArray_1
         * @tc.desc Test bindVertexArray.
         */
        it('webgl2_test_bindVertexArray_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_bindVertexArray] bindVertexArray");
            bindVertexArray((vertexArrayObject) => {
                gl.bindVertexArray(vertexArrayObject);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0065
         * @tc.name webgl2_test_bindVertexArray_2
         * @tc.desc Test bindVertexArray.
         */
        it('webgl2_test_bindVertexArray_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_bindVertexArray] bindVertexArray");
            bindVertexArray((vertexArrayObject) => {
                gl.bindVertexArray(null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_VERTEX_0066
         * @tc.name webgl2_test_bindVertexArray_3
         * @tc.desc Test bindVertexArray.
         */
        it('webgl2_test_bindVertexArray_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_bindVertexArray] bindVertexArray");
            bindVertexArray((vertexArrayObject) => {
                gl.bindVertexArray(undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
    })
}
