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


export default function webgl2_uniform() {
    
	describe('webgl2_uniform', function () {
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
        function uniform(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                uniform uint u;
                void main(){
                    gl_Position = vec4(0.0,0.0,0.0,1.0);
                    gl_PointSize = float(u);
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            callback(u);
            let uniform = gl.getUniform(p.program, u);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            finish();
            checkError(gl);
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0001
         * @tc.name webgl2_test_uniform1ui
         * @tc.desc Test uniform1ui.
         */
        it('webgl2_test_uniform1ui', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform1ui] uniform1ui");
            let p = createProgram(gl, `#version 300 es
                uniform uint u;
                void main(){
                    gl_Position = vec4(0.0,0.0,0.0,1.0);
                    gl_PointSize = float(u);
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            gl.uniform1ui(u, 100);
            let uniform = gl.getUniform(p.program, u);
            console.info("webgltest", uniform);
            expect(uniform).assertEqual(100);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0002
         * @tc.name webgl2_test_uniform1ui_1
         * @tc.desc Test uniform1ui.
         */
        it('webgl2_test_uniform1ui_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform1ui_1] uniform1ui");
            uniform((u) => {
                gl.uniform1ui(u, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0003
         * @tc.name webgl2_test_uniform1ui_2
         * @tc.desc Test uniform1ui.
         */
        it('webgl2_test_uniform1ui_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform1ui_2] uniform1ui");
            uniform((u) => {
                gl.uniform1ui(u, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0004
         * @tc.name webgl2_test_uniform1ui_3
         * @tc.desc Test uniform1ui.
         */
        it('webgl2_test_uniform1ui_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform1ui_3] uniform1ui");
            uniform((u) => {
                gl.uniform1ui(u, "100");
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0005
         * @tc.name webgl2_test_uniform1ui_4
         * @tc.desc Test uniform1ui.
         */
        it('webgl2_test_uniform1ui_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform1ui_4] uniform1ui");
            uniform((u) => {
                gl.uniform1ui(null, 100);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0006
         * @tc.name webgl2_test_uniform1ui_5
         * @tc.desc Test uniform1ui.
         */
        it('webgl2_test_uniform1ui_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform1ui_5] uniform1ui");
            uniform((u) => {
                gl.uniform1ui(undefined, 100);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0007
         * @tc.name webgl2_test_uniform1ui_6
         * @tc.desc Test uniform1ui.
         */
        it('webgl2_test_uniform1ui_6', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform1ui_6] uniform1ui");
            uniform((u) => {
                gl.uniform1ui(undefined, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0008
         * @tc.name webgl2_test_uniform1ui_7
         * @tc.desc Test uniform1ui.
         */
        it('webgl2_test_uniform1ui_7', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform1ui_7] uniform1ui");
            uniform((u) => {
                gl.uniform1ui(null, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function uniform2ui(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                uniform uvec2 u;
                void main(){
                    gl_Position.x = float(u.x);
                    gl_Position.y = float(u.y);
                    gl_Position.w = 1.0;
                    gl_PointSize = 100.0;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            callback(u);
            let uniform = gl.getUniform(p.program, u);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            finish();
            checkError(gl);
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0009
         * @tc.name webgl2_test_uniform2ui
         * @tc.desc Test uniform2ui.
         */
        it('webgl2_test_uniform2ui', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform2ui] uniform2ui");
            let p = createProgram(gl, `#version 300 es
                uniform uvec2 u;
                void main(){
                    gl_Position.x = float(u.x);
                    gl_Position.y = float(u.y);
                    gl_Position.w = 1.0;
                    gl_PointSize = 100.0;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            gl.uniform2ui(u, 1, 1);
            let uniform = gl.getUniform(p.program, u);
            console.info("webgltest", uniform);
            expect(uniform[0]).assertEqual(1);
            expect(uniform[1]).assertEqual(1);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0010
         * @tc.name webgl2_test_uniform2ui_1
         * @tc.desc Test uniform2ui.
         */
        it('webgl2_test_uniform2ui_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform2ui_1] uniform2ui");
            uniform2ui((u) => {
                gl.uniform2ui(u, 1, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0011
         * @tc.name webgl2_test_uniform2ui_2
         * @tc.desc Test uniform2ui.
         */
        it('webgl2_test_uniform2ui_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform2ui_2] uniform2ui");
            uniform2ui((u) => {
                gl.uniform2ui(u, 1, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0012
         * @tc.name webgl2_test_uniform2ui_3
         * @tc.desc Test uniform2ui.
         */
        it('webgl2_test_uniform2ui_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform2ui_3] uniform2ui");
            uniform2ui((u) => {
                gl.uniform2ui(u, 1, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0013
         * @tc.name webgl2_test_uniform2ui_4
         * @tc.desc Test uniform2ui.
         */
        it('webgl2_test_uniform2ui_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform2ui_4] uniform2ui");
            uniform2ui((u) => {
                gl.uniform2ui(u, null, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0014
         * @tc.name webgl2_test_uniform2ui_5
         * @tc.desc Test uniform2ui.
         */
        it('webgl2_test_uniform2ui_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform2ui_5] uniform2ui");
            uniform2ui((u) => {
                gl.uniform2ui(u, undefined, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0015
         * @tc.name webgl2_test_uniform2ui_6
         * @tc.desc Test uniform2ui.
         */
        it('webgl2_test_uniform2ui_6', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform2ui_6] uniform2ui");
            uniform2ui((u) => {
                gl.uniform2ui(null, null, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0016
         * @tc.name webgl2_test_uniform2ui_7
         * @tc.desc Test uniform2ui.
         */
        it('webgl2_test_uniform2ui_7', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform2ui_7] uniform2ui");
            uniform2ui((u) => {
                gl.uniform2ui(undefined, undefined, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function uniform3ui(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                uniform uvec3 u;
                void main(){
                    gl_Position.x = float(u.x);
                    gl_Position.y = float(u.y);
                    gl_Position.z = float(u.z);
                    gl_Position.w = 1.0;
                    gl_PointSize = 100.0;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            callback(u);
            let uniform = gl.getUniform(p.program, u);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            finish();
            checkError(gl);
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0017
         * @tc.name webgl2_test_uniform3ui
         * @tc.desc Test uniform3ui.
         */
        it('webgl2_test_uniform3ui', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform3ui] uniform3ui");
            let p = createProgram(gl, `#version 300 es
                uniform uvec3 u;
                void main(){
                    gl_Position.x = float(u.x);
                    gl_Position.y = float(u.y);
                    gl_Position.z = float(u.z);
                    gl_Position.w = 1.0;
                    gl_PointSize = 100.0;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            gl.uniform3ui(u, 0, 1, 1);
            let uniform = gl.getUniform(p.program, u);
            console.info("webgltest", uniform);
            expect(uniform[0]).assertEqual(0);
            expect(uniform[1]).assertEqual(1);
            expect(uniform[2]).assertEqual(1);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0018
         * @tc.name webgl2_test_uniform3ui_1
         * @tc.desc Test uniform3ui.
         */
        it('webgl2_test_uniform3ui_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform3ui_1] uniform3ui");
            uniform3ui((u) => {
                gl.uniform3ui(u, 0, 1, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0019
         * @tc.name webgl2_test_uniform3ui_2
         * @tc.desc Test uniform3ui.
         */
        it('webgl2_test_uniform3ui_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform3ui_2] uniform3ui");
            uniform3ui((u) => {
                gl.uniform3ui(u, 0, 1, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0020
         * @tc.name webgl2_test_uniform3ui_3
         * @tc.desc Test uniform3ui.
         */
        it('webgl2_test_uniform3ui_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform3ui_3] uniform3ui");
            uniform3ui((u) => {
                gl.uniform3ui(u, 0, null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0021
         * @tc.name webgl2_test_uniform3ui_4
         * @tc.desc Test uniform3ui.
         */
        it('webgl2_test_uniform3ui_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform3ui_4] uniform3ui");
            uniform3ui((u) => {
                gl.uniform3ui(u, null, null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0022
         * @tc.name webgl2_test_uniform3ui_5
         * @tc.desc Test uniform3ui.
         */
        it('webgl2_test_uniform3ui_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform3ui_5] uniform3ui");
            uniform3ui((u) => {
                gl.uniform3ui(null, null, null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function uniform4ui(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                uniform uvec4 u;
                void main(){
                    gl_Position.x = float(u.x);
                    gl_Position.y = float(u.y);
                    gl_Position.z = float(u.z);
                    gl_Position.w = float(u.w);
                    gl_PointSize = 100.0;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            callback(u);
            let uniform = gl.getUniform(p.program, u);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            finish();
            checkError(gl);
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0023
         * @tc.name webgl2_test_uniform4ui
         * @tc.desc Test uniform4ui.
         */
        it('webgl2_test_uniform4ui', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform4ui] uniform4ui");
            let p = createProgram(gl, `#version 300 es
                uniform uvec4 u;
                void main(){
                    gl_Position.x = float(u.x);
                    gl_Position.y = float(u.y);
                    gl_Position.z = float(u.z);
                    gl_Position.w = float(u.w);
                    gl_PointSize = 100.0;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            gl.uniform4ui(u, 1, 1, 1, 1);
            let uniform = gl.getUniform(p.program, u);
            console.info("webgltest", uniform);
            expect(uniform[0]).assertEqual(1);
            expect(uniform[1]).assertEqual(1);
            expect(uniform[2]).assertEqual(1);
            expect(uniform[3]).assertEqual(1);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0024
         * @tc.name webgl2_test_uniform4ui_1
         * @tc.desc Test uniform4ui.
         */
        it('webgl2_test_uniform4ui_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform4ui_1] uniform4ui");
            uniform4ui((u) => {
                gl.uniform4ui(u, 1, 1, 1, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0025
         * @tc.name webgl2_test_uniform4ui_2
         * @tc.desc Test uniform4ui.
         */
        it('webgl2_test_uniform4ui_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform4ui_2] uniform4ui");
            uniform4ui((u) => {
                gl.uniform4ui(u, 1, 1, null, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0026
         * @tc.name webgl2_test_uniform4ui_3
         * @tc.desc Test uniform4ui.
         */
        it('webgl2_test_uniform4ui_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform4ui_3] uniform4ui");
            uniform4ui((u) => {
                gl.uniform4ui(u, 1, null, null, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0027
         * @tc.name webgl2_test_uniform4ui_4
         * @tc.desc Test uniform4ui.
         */
        it('webgl2_test_uniform4ui_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform4ui_4] uniform4ui");
            uniform4ui((u) => {
                gl.uniform4ui(u, null, null, null, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0028
         * @tc.name webgl2_test_uniform4ui_5
         * @tc.desc Test uniform4ui.
         */
        it('webgl2_test_uniform4ui_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform4ui_5] uniform4ui");
            uniform4ui((u) => {
                gl.uniform4ui(null, null, null, null, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0029
         * @tc.name webgl2_test_uniform4ui_6
         * @tc.desc Test uniform4ui.
         */
        it('webgl2_test_uniform4ui_6', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform4ui_6] uniform4ui");
            uniform4ui((u) => {
                gl.uniform4ui(u, 1, 1, 1, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0030
         * @tc.name webgl2_test_uniform4ui_7
         * @tc.desc Test uniform4ui.
         */
        it('webgl2_test_uniform4ui_7', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform4ui_7] uniform4ui");
            uniform4ui((u) => {
                gl.uniform4ui(u, 1, 1, undefined, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0031
         * @tc.name webgl2_test_uniform4ui_8
         * @tc.desc Test uniform4ui.
         */
        it('webgl2_test_uniform4ui_8', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform4ui_8] uniform4ui");
            uniform4ui((u) => {
                gl.uniform4ui(u, 1, undefined, undefined, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0032
         * @tc.name webgl2_test_uniform4ui_9
         * @tc.desc Test uniform4ui.
         */
        it('webgl2_test_uniform4ui_9', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform4ui_9] uniform4ui");
            uniform4ui((u) => {
                gl.uniform4ui(u, undefined, undefined, undefined, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0033
         * @tc.name webgl2_test_uniform4ui_10
         * @tc.desc Test uniform4ui.
         */
        it('webgl2_test_uniform4ui_10', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform4ui_10] uniform4ui");
            uniform4ui((u) => {
                gl.uniform4ui(undefined, undefined, undefined, undefined, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function uniform1uiv(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                uniform uint u;
                void main(){
                    gl_Position.x = float(u);
                    gl_Position.w = 1.0;
                    gl_PointSize = 100.0;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            callback(u);
            let uniform = gl.getUniform(p.program, u);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            finish();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0034
         * @tc.name webgl2_test_uniform1uiv
         * @tc.desc Test uniform1uiv.
         */
        it('webgl2_test_uniform1uiv', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform1uiv] uniform1uiv");
            let p = createProgram(gl, `#version 300 es
                uniform uint u;
                void main(){
                    gl_Position.x = float(u);
                    gl_Position.w = 1.0;
                    gl_PointSize = 100.0;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            gl.uniform1uiv(u, new Uint32Array([1, 0]), 1, 1);
            let uniform = gl.getUniform(p.program, u);
            console.info("webgltest", uniform);
            expect(uniform).assertEqual(0);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0035
         * @tc.name webgl2_test_uniform1uiv_1
         * @tc.desc Test uniform1uiv.
         */
        it('webgl2_test_uniform1uiv_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform1uiv_1] uniform1uiv");
            uniform1uiv((u) => {
                gl.uniform1uiv(u, new Uint32Array([1, 0]), 1, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0036
         * @tc.name webgl2_test_uniform1uiv_2
         * @tc.desc Test uniform1uiv.
         */
        it('webgl2_test_uniform1uiv_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform1uiv_2] uniform1uiv");
            uniform1uiv((u) => {
                gl.uniform1uiv(u, new Uint32Array([1, 0]), 1, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0037
         * @tc.name webgl2_test_uniform1uiv_3
         * @tc.desc Test uniform1uiv.
         */
        it('webgl2_test_uniform1uiv_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform1uiv_3] uniform1uiv");
            uniform1uiv((u) => {
                gl.uniform1uiv(u, new Uint32Array([1, 0]), undefined, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0038
         * @tc.name webgl2_test_uniform1uiv_4
         * @tc.desc Test uniform1uiv.
         */
        it('webgl2_test_uniform1uiv_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform1uiv_4] uniform1uiv");
            uniform1uiv((u) => {
                gl.uniform1uiv(u, new Uint32Array([1, 0]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0039
         * @tc.name webgl2_test_uniform1uiv_5
         * @tc.desc Test uniform1uiv.
         */
        it('webgl2_test_uniform1uiv_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform1uiv_5] uniform1uiv");
            uniform1uiv((u) => {
                gl.uniform1uiv(null, new Uint32Array([1, 0]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function uniform2uiv(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                uniform uvec2 u;
                void main(){
                    gl_Position.x = float(u.x);
                    gl_Position.y = float(u.y);
                    gl_Position.w = 1.0;
                    gl_PointSize = 100.0;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            callback(u);
            let uniform = gl.getUniform(p.program, u);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            finish();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0040
         * @tc.name webgl2_test_uniform2uiv
         * @tc.desc Test uniform2uiv.
         */
        it('webgl2_test_uniform2uiv', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform2uiv] uniform2uiv");
            let p = createProgram(gl, `#version 300 es
                uniform uvec2 u;
                void main(){
                    gl_Position.x = float(u.x);
                    gl_Position.y = float(u.y);
                    gl_Position.w = 1.0;
                    gl_PointSize = 100.0;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            gl.uniform2uiv(u, new Uint32Array([0, 1, 1]), 1, 2);
            let uniform = gl.getUniform(p.program, u);
            console.info("webgltest", uniform);
            expect(uniform[0]).assertEqual(1);
            expect(uniform[1]).assertEqual(1);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0041
         * @tc.name webgl2_test_uniform2uiv_1
         * @tc.desc Test uniform2uiv.
         */
        it('webgl2_test_uniform2uiv_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform2uiv_1] uniform2uiv");
            uniform2uiv((u) => {
                gl.uniform2uiv(u, new Uint32Array([0, 1, 1]), 1, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0042
         * @tc.name webgl2_test_uniform2uiv_2
         * @tc.desc Test uniform2uiv.
         */
        it('webgl2_test_uniform2uiv_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform2uiv_2] uniform2uiv");
            uniform2uiv((u) => {
                gl.uniform2uiv(u, new Uint32Array([0, 1, 1]), 1, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0043
         * @tc.name webgl2_test_uniform2uiv_3
         * @tc.desc Test uniform2uiv.
         */
        it('webgl2_test_uniform2uiv_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform2uiv_3] uniform2uiv");
            uniform2uiv((u) => {
                gl.uniform2uiv(u, new Uint32Array([0, 1, 1]), undefined, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0044
         * @tc.name webgl2_test_uniform2uiv_4
         * @tc.desc Test uniform2uiv.
         */
        it('webgl2_test_uniform2uiv_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform2uiv_4] uniform2uiv");
            uniform2uiv((u) => {
                gl.uniform2uiv(u, new Uint32Array([0, 1, 1]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0045
         * @tc.name webgl2_test_uniform2uiv_5
         * @tc.desc Test uniform2uiv.
         */
        it('webgl2_test_uniform2uiv_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform2uiv_5] uniform2uiv");
            uniform2uiv((u) => {
                gl.uniform2uiv(null, new Uint32Array([0, 1, 1]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function uniform3uiv(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                uniform uvec3 u;
                void main(){
                    gl_Position.x = float(u.x);
                    gl_Position.y = float(u.y);
                    gl_Position.z = float(u.z);
                    gl_Position.w = 1.0;
                    gl_PointSize = 100.0;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            callback(u);
            let uniform = gl.getUniform(p.program, u);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            finish();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0046
         * @tc.name webgl2_test_uniform3uiv
         * @tc.desc Test uniform3uiv.
         */
        it('webgl2_test_uniform3uiv', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform3uiv] uniform3uiv");
            let p = createProgram(gl, `#version 300 es
                uniform uvec3 u;
                void main(){
                    gl_Position.x = float(u.x);
                    gl_Position.y = float(u.y);
                    gl_Position.z = float(u.z);
                    gl_Position.w = 1.0;
                    gl_PointSize = 100.0;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            gl.uniform3uiv(u, new Uint32Array([0, 1, 1, 1]), 1, 3);
            let uniform = gl.getUniform(p.program, u);
            console.info("webgltest", uniform);
            expect(uniform[0]).assertEqual(1);
            expect(uniform[1]).assertEqual(1);
            expect(uniform[2]).assertEqual(1);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0047
         * @tc.name webgl2_test_uniform3uiv_1
         * @tc.desc Test uniform3uiv.
         */
        it('webgl2_test_uniform3uiv_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform3uiv_1] uniform3uiv");
            uniform3uiv((u) => {
                gl.uniform3uiv(u, new Uint32Array([0, 1, 1, 1]), 1, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0048
         * @tc.name webgl2_test_uniform3uiv_2
         * @tc.desc Test uniform3uiv.
         */
        it('webgl2_test_uniform3uiv_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform3uiv_2] uniform3uiv");
            uniform3uiv((u) => {
                gl.uniform3uiv(u, new Uint32Array([0, 1, 1, 1]), 1, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0049
         * @tc.name webgl2_test_uniform3uiv_3
         * @tc.desc Test uniform3uiv.
         */
        it('webgl2_test_uniform3uiv_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform3uiv_3] uniform3uiv");
            uniform3uiv((u) => {
                gl.uniform3uiv(u, new Uint32Array([0, 1, 1, 1]), undefined, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0050
         * @tc.name webgl2_test_uniform3uiv_4
         * @tc.desc Test uniform3uiv.
         */
        it('webgl2_test_uniform3uiv_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform3uiv_4] uniform3uiv");
            uniform3uiv((u) => {
                gl.uniform3uiv(u, new Uint32Array([0, 1, 1, 1]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0051
         * @tc.name webgl2_test_uniform3uiv_5
         * @tc.desc Test uniform3uiv.
         */
        it('webgl2_test_uniform3uiv_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform3uiv_5] uniform3uiv");
            uniform3uiv((u) => {
                gl.uniform3uiv(null, new Uint32Array([0, 1, 1, 1]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function uniform4uiv(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                uniform uvec4 u;
                void main(){
                    gl_Position.x = float(u.x);
                    gl_Position.y = float(u.y);
                    gl_Position.z = float(u.z);
                    gl_Position.w = float(u.w);
                    gl_PointSize = 100.0;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            callback(u);
            let uniform = gl.getUniform(p.program, u);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            finish();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0052
         * @tc.name webgl2_test_uniform4uiv
         * @tc.desc Test uniform4uiv.
         */
        it('webgl2_test_uniform4uiv', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform4uiv] uniform4uiv");
            let p = createProgram(gl, `#version 300 es
                uniform uvec4 u;
                void main(){
                    gl_Position.x = float(u.x);
                    gl_Position.y = float(u.y);
                    gl_Position.z = float(u.z);
                    gl_Position.w = float(u.w);
                    gl_PointSize = 100.0;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            gl.uniform4uiv(u, new Uint32Array([0, 1, 1, 1, 1]), 1, 4);
            let uniform = gl.getUniform(p.program, u);
            console.info("webgltest", uniform);
            expect(uniform[0]).assertEqual(1);
            expect(uniform[1]).assertEqual(1);
            expect(uniform[2]).assertEqual(1);
            expect(uniform[3]).assertEqual(1);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0053
         * @tc.name webgl2_test_uniform4uiv_1
         * @tc.desc Test uniform4uiv.
         */
        it('webgl2_test_uniform4uiv_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform4uiv_1] uniform4uiv");
            uniform4uiv((u) => {
                gl.uniform4uiv(u, new Uint32Array([0, 1, 1, 1, 1]), 1, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0054
         * @tc.name webgl2_test_uniform4uiv_2
         * @tc.desc Test uniform4uiv.
         */
        it('webgl2_test_uniform4uiv_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform4uiv_2] uniform4uiv");
            uniform4uiv((u) => {
                gl.uniform4uiv(u, new Uint32Array([0, 1, 1, 1, 1]), 1, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0055
         * @tc.name webgl2_test_uniform4uiv_3
         * @tc.desc Test uniform4uiv.
         */
        it('webgl2_test_uniform4uiv_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform4uiv_3] uniform4uiv");
            uniform4uiv((u) => {
                gl.uniform4uiv(u, new Uint32Array([0, 1, 1, 1, 1]), undefined, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0056
         * @tc.name webgl2_test_uniform4uiv_4
         * @tc.desc Test uniform4uiv.
         */
        it('webgl2_test_uniform4uiv_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform4uiv_4] uniform4uiv");
            uniform4uiv((u) => {
                gl.uniform4uiv(u, new Uint32Array([0, 1, 1, 1, 1]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0057
         * @tc.name webgl2_test_uniform4uiv_5
         * @tc.desc Test uniform4uiv.
         */
        it('webgl2_test_uniform4uiv_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform4uiv_5] uniform4uiv");
            uniform4uiv((u) => {
                gl.uniform4uiv(null, new Uint32Array([0, 1, 1, 1, 1]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function uniformMatrix3x2fv(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                in vec3 a_position;
                uniform mat3x2 m32;
                void main(){
                    vec2 transformedPosition = (m32 * a_position).xy;
                   gl_Position = vec4(transformedPosition, 0.0, 1.0);
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let m32 = gl.getUniformLocation(p.program, "m32");
            callback(m32);
            let uniform = gl.getUniform(p.program, m32);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            finish();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0058
         * @tc.name webgl2_test_uniformMatrix3x2fv
         * @tc.desc Test uniformMatrix3x2fv.
         */
        it('webgl2_test_uniformMatrix3x2fv', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix3x2fv] uniformMatrix3x2fv");
            let p = createProgram(gl, `#version 300 es
                in vec3 a_position;
                uniform mat3x2 m32;
                void main(){
                    vec2 transformedPosition = (m32 * a_position).xy;
                   gl_Position = vec4(transformedPosition, 0.0, 1.0);
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let m32 = gl.getUniformLocation(p.program, "m32");
            gl.uniformMatrix3x2fv(m32, false, new Float32Array([
                1.5, 1.5,
                1.0, 0.0,
                0.0, 1.0,
                0.0, 0.0
            ]), 2, 6);
            let uniform = gl.getUniform(p.program, m32);
            console.info("webgltest", uniform);
            expect(uniform[0]).assertEqual(1.0);
            expect(uniform[1]).assertEqual(0.0);
            expect(uniform[2]).assertEqual(0.0);
            expect(uniform[3]).assertEqual(1.0);
            expect(uniform[4]).assertEqual(0.0);
            expect(uniform[5]).assertEqual(0.0);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0059
         * @tc.name webgl2_test_uniformMatrix3x2fv_1
         * @tc.desc Test uniformMatrix3x2fv.
         */
        it('webgl2_test_uniformMatrix3x2fv_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix3x2fv_1] uniformMatrix3x2fv");
            uniformMatrix3x2fv((m32) => {
                gl.uniformMatrix3x2fv(m32, null, new Float32Array([
                    1.5, 1.5,
                    1.0, 0.0,
                    0.0, 1.0,
                    0.0, 0.0
                ]), 2, 6);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0060
         * @tc.name webgl2_test_uniformMatrix3x2fv_2
         * @tc.desc Test uniformMatrix3x2fv.
         */
        it('webgl2_test_uniformMatrix3x2fv_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix3x2fv_2] uniformMatrix3x2fv");
            uniformMatrix3x2fv((m32) => {
                gl.uniformMatrix3x2fv(m32, null, new Float32Array([
                    1.5, 1.5,
                    1.0, 0.0,
                    0.0, 1.0,
                    0.0, 0.0
                ]), null, 6);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0061
         * @tc.name webgl2_test_uniformMatrix3x2fv_3
         * @tc.desc Test uniformMatrix3x2fv.
         */
        it('webgl2_test_uniformMatrix3x2fv_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix3x2fv_3] uniformMatrix3x2fv");
            uniformMatrix3x2fv((m32) => {
                gl.uniformMatrix3x2fv(m32, null, new Float32Array([
                    1.5, 1.5,
                    1.0, 0.0,
                    0.0, 1.0,
                    0.0, 0.0
                ]), null, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0062
         * @tc.name webgl2_test_uniformMatrix3x2fv_4
         * @tc.desc Test uniformMatrix3x2fv.
         */
        it('webgl2_test_uniformMatrix3x2fv_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix3x2fv_4] uniformMatrix3x2fv");
            uniformMatrix3x2fv((m32) => {
                gl.uniformMatrix3x2fv(m32, null, new Float32Array([
                    1.5, 1.5,
                    1.0, 0.0,
                    0.0, 1.0,
                    0.0, 0.0
                ]), undefined, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0063
         * @tc.name webgl2_test_uniformMatrix3x2fv_5
         * @tc.desc Test uniformMatrix3x2fv.
         */
        it('webgl2_test_uniformMatrix3x2fv_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix3x2fv_5] uniformMatrix3x2fv");
            uniformMatrix3x2fv((m32) => {
                gl.uniformMatrix3x2fv(null, null, new Float32Array([
                    1.5, 1.5,
                    1.0, 0.0,
                    0.0, 1.0,
                    0.0, 0.0
                ]), undefined, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function uniformMatrix4x2fv(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                in vec4 a_position;
                uniform mat4x2 m42;
                void main(){
                    vec2 transformedPosition = (m42 * a_position).xy;
                   gl_Position = vec4(transformedPosition, 0.0, 1.0);
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let m42 = gl.getUniformLocation(p.program, "m42");
            callback(m42);
            let uniform = gl.getUniform(p.program, m42);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            finish();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0064
         * @tc.name webgl2_test_uniformMatrix4x2fv
         * @tc.desc Test uniformMatrix4x2fv.
         */
        it('webgl2_test_uniformMatrix4x2fv', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix4x2fv] uniformMatrix4x2fv");
            let p = createProgram(gl, `#version 300 es
                in vec4 a_position;
                uniform mat4x2 m42;
                void main(){
                    vec2 transformedPosition = (m42 * a_position).xy;
                   gl_Position = vec4(transformedPosition, 0.0, 1.0);
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let m42 = gl.getUniformLocation(p.program, "m42");
            gl.uniformMatrix4x2fv(m42, false, new Float32Array([
                1.5, 1.5,
                1.0, 0.0,
                0.0, 1.0,
                0.0, 0.0,
                0.0, 0.0,
            ]), 2, 8);
            let uniform = gl.getUniform(p.program, m42);
            console.info("webgltest", uniform);
            expect(uniform[0]).assertEqual(1.0);
            expect(uniform[1]).assertEqual(0.0);
            expect(uniform[2]).assertEqual(0.0);
            expect(uniform[3]).assertEqual(1.0);
            expect(uniform[4]).assertEqual(0.0);
            expect(uniform[5]).assertEqual(0.0);
            expect(uniform[6]).assertEqual(0.0);
            expect(uniform[7]).assertEqual(0.0);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0065
         * @tc.name webgl2_test_uniformMatrix4x2fv_1
         * @tc.desc Test uniformMatrix4x2fv.
         */
        it('webgl2_test_uniformMatrix4x2fv_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix4x2fv_1] uniformMatrix4x2fv");
            uniformMatrix4x2fv((m42) => {
                gl.uniformMatrix4x2fv(m42, null, new Float32Array([
                    1.5, 1.5,
                    1.0, 0.0,
                    0.0, 1.0,
                    0.0, 0.0,
                    0.0, 0.0,
                ]), 2, 6);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0066
         * @tc.name webgl2_test_uniformMatrix4x2fv_2
         * @tc.desc Test uniformMatrix4x2fv.
         */
        it('webgl2_test_uniformMatrix4x2fv_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix4x2fv_2] uniformMatrix4x2fv");
            uniformMatrix4x2fv((m42) => {
                gl.uniformMatrix4x2fv(m42, null, new Float32Array([
                    1.5, 1.5,
                    1.0, 0.0,
                    0.0, 1.0,
                    0.0, 0.0,
                    0.0, 0.0,
                ]), null, 6);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0067
         * @tc.name webgl2_test_uniformMatrix4x2fv_3
         * @tc.desc Test uniformMatrix4x2fv.
         */
        it('webgl2_test_uniformMatrix4x2fv_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix4x2fv_3] uniformMatrix4x2fv");
            uniformMatrix4x2fv((m42) => {
                gl.uniformMatrix4x2fv(m42, null, new Float32Array([
                    1.5, 1.5,
                    1.0, 0.0,
                    0.0, 1.0,
                    0.0, 0.0,
                    0.0, 0.0,
                ]), null, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0068
         * @tc.name webgl2_test_uniformMatrix4x2fv_4
         * @tc.desc Test uniformMatrix4x2fv.
         */
        it('webgl2_test_uniformMatrix4x2fv_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix4x2fv_4] uniformMatrix4x2fv");
            uniformMatrix4x2fv((m42) => {
                gl.uniformMatrix4x2fv(m42, null, new Float32Array([
                    1.5, 1.5,
                    1.0, 0.0,
                    0.0, 1.0,
                    0.0, 0.0,
                    0.0, 0.0,
                ]), undefined, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        function uniformMatrix2x3fv(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                in vec2 a_position;
                uniform mat2x3 m23;
                void main(){
                   vec3 transformedPosition = (m23 * a_position).xyz;
                   gl_Position = vec4(transformedPosition, 1.0);
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let m23 = gl.getUniformLocation(p.program, "m23");
            callback(m23);
            let uniform = gl.getUniform(p.program, m23);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            finish();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0069
         * @tc.name webgl2_test_uniformMatrix2x3fv
         * @tc.desc Test uniformMatrix2x3fv.
         */
        it('webgl2_test_uniformMatrix2x3fv', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix2x3fv] uniformMatrix2x3fv");
            let p = createProgram(gl, `#version 300 es
                in vec2 a_position;
                uniform mat2x3 m23;
                void main(){
                   vec3 transformedPosition = (m23 * a_position).xyz;
                   gl_Position = vec4(transformedPosition, 1.0);
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let m23 = gl.getUniformLocation(p.program, "m23");
            gl.uniformMatrix2x3fv(m23, false, new Float32Array([
                1.5, 1.5, 1.5,
                1.0, 0.0, 0.0,
                1.0, 0.0, 1.0,
            ]), 3, 6);
            let uniform = gl.getUniform(p.program, m23);
            console.info("webgltest", uniform);
            expect(uniform[0]).assertEqual(1.0);
            expect(uniform[1]).assertEqual(0.0);
            expect(uniform[2]).assertEqual(0.0);
            expect(uniform[3]).assertEqual(1.0);
            expect(uniform[4]).assertEqual(0.0);
            expect(uniform[5]).assertEqual(1.0);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0070
         * @tc.name webgl2_test_uniformMatrix2x3fv_1
         * @tc.desc Test uniformMatrix2x3fv.
         */
        it('webgl2_test_uniformMatrix2x3fv_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix2x3fv_1] uniformMatrix2x3fv");
            uniformMatrix2x3fv((m23) => {
                gl.uniformMatrix2x3fv(m23, null, new Float32Array([
                    1.5, 1.5, 1.5,
                    1.0, 0.0, 0.0,
                    1.0, 0.0, 1.0,
                ]), 3, 6);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0071
         * @tc.name webgl2_test_uniformMatrix2x3fv_2
         * @tc.desc Test uniformMatrix2x3fv.
         */
        it('webgl2_test_uniformMatrix2x3fv_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix2x3fv_2] uniformMatrix2x3fv");
            uniformMatrix2x3fv((m23) => {
                gl.uniformMatrix2x3fv(m23, null, new Float32Array([
                    1.5, 1.5, 1.5,
                    1.0, 0.0, 0.0,
                    1.0, 0.0, 1.0,
                ]), null, 6);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0072
         * @tc.name webgl2_test_uniformMatrix2x3fv_3
         * @tc.desc Test uniformMatrix2x3fv.
         */
        it('webgl2_test_uniformMatrix2x3fv_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix2x3fv_3] uniformMatrix2x3fv");
            uniformMatrix2x3fv((m23) => {
                gl.uniformMatrix2x3fv(m23, null, new Float32Array([
                    1.5, 1.5, 1.5,
                    1.0, 0.0, 0.0,
                    1.0, 0.0, 1.0,
                ]), null, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0073
         * @tc.name webgl2_test_uniformMatrix2x3fv_4
         * @tc.desc Test uniformMatrix2x3fv.
         */
        it('webgl2_test_uniformMatrix2x3fv_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix2x3fv_4] uniformMatrix2x3fv");
            uniformMatrix2x3fv((m23) => {
                gl.uniformMatrix2x3fv(m23, null, new Float32Array([
                    1.5, 1.5, 1.5,
                    1.0, 0.0, 0.0,
                    1.0, 0.0, 1.0,
                ]), undefined, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        function uniformMatrix4x3fv(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                in vec4 a_position;
                uniform mat4x3 m43;
                void main(){
                   vec3 transformedPosition = (m43 * a_position).xyz;
                   gl_Position = vec4(transformedPosition, 1.0);
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let m43 = gl.getUniformLocation(p.program, "m43");
            callback(m43);
            let uniform = gl.getUniform(p.program, m43);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            finish();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0074
         * @tc.name webgl2_test_uniformMatrix4x3fv
         * @tc.desc Test uniformMatrix4x3fv.
         */
        it('webgl2_test_uniformMatrix4x3fv', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix4x3fv] uniformMatrix4x3fv");
            let p = createProgram(gl, `#version 300 es
                in vec4 a_position;
                uniform mat4x3 m43;
                void main(){
                   vec3 transformedPosition = (m43 * a_position).xyz;
                   gl_Position = vec4(transformedPosition, 1.0);
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let m43 = gl.getUniformLocation(p.program, "m43");
            gl.uniformMatrix4x3fv(m43, false, new Float32Array([
                1.5, 1.5, 1.5,
                1.0, 0.0, 0.0,
                1.0, 0.0, 1.0,
                1.0, 0.0, 1.0,
                1.0, 0.0, 1.0,
            ]), 3, 12);
            let uniform = gl.getUniform(p.program, m43);
            console.info("webgltest", uniform);
            expect(uniform[0]).assertEqual(1.0);
            expect(uniform[1]).assertEqual(0.0);
            expect(uniform[2]).assertEqual(0.0);
            expect(uniform[3]).assertEqual(1.0);
            expect(uniform[4]).assertEqual(0.0);
            expect(uniform[5]).assertEqual(1.0);
            expect(uniform[6]).assertEqual(1.0);
            expect(uniform[7]).assertEqual(0.0);
            expect(uniform[8]).assertEqual(1.0);
            expect(uniform[9]).assertEqual(1.0);
            expect(uniform[10]).assertEqual(0.0);
            expect(uniform[11]).assertEqual(1.0);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0075
         * @tc.name webgl2_test_uniformMatrix4x3fv_1
         * @tc.desc Test uniformMatrix4x3fv.
         */
        it('webgl2_test_uniformMatrix4x3fv_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix4x3fv_1] uniformMatrix4x3fv");
            uniformMatrix4x3fv((m) => {
                gl.uniformMatrix4x3fv(m, null, new Float32Array([
                    1.5, 1.5, 1.5,
                    1.0, 0.0, 0.0,
                    1.0, 0.0, 1.0,
                    1.0, 0.0, 1.0,
                    1.0, 0.0, 1.0,
                ]), 3, 6);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0076
         * @tc.name webgl2_test_uniformMatrix4x3fv_2
         * @tc.desc Test uniformMatrix4x3fv.
         */
        it('webgl2_test_uniformMatrix4x3fv_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix4x3fv_2] uniformMatrix4x3fv");
            uniformMatrix4x3fv((m) => {
                gl.uniformMatrix4x3fv(m, null, new Float32Array([
                    1.5, 1.5, 1.5,
                    1.0, 0.0, 0.0,
                    1.0, 0.0, 1.0,
                    1.0, 0.0, 1.0,
                    1.0, 0.0, 1.0,
                ]), null, 6);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0077
         * @tc.name webgl2_test_uniformMatrix4x3fv_3
         * @tc.desc Test uniformMatrix4x3fv.
         */
        it('webgl2_test_uniformMatrix4x3fv_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix4x3fv_3] uniformMatrix4x3fv");
            uniformMatrix4x3fv((m) => {
                gl.uniformMatrix4x3fv(m, null, new Float32Array([
                    1.5, 1.5, 1.5,
                    1.0, 0.0, 0.0,
                    1.0, 0.0, 1.0,
                    1.0, 0.0, 1.0,
                    1.0, 0.0, 1.0,
                ]), null, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0078
         * @tc.name webgl2_test_uniformMatrix4x3fv_4
         * @tc.desc Test uniformMatrix4x3fv.
         */
        it('webgl2_test_uniformMatrix4x3fv_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix4x3fv_4] uniformMatrix4x3fv");
            uniformMatrix4x3fv((m) => {
                gl.uniformMatrix4x3fv(m, null, new Float32Array([
                    1.5, 1.5, 1.5,
                    1.0, 0.0, 0.0,
                    1.0, 0.0, 1.0,
                    1.0, 0.0, 1.0,
                    1.0, 0.0, 1.0,
                ]), undefined, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        function uniformMatrix2x4fv(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                in vec2 a_position;
                uniform mat2x4 m24;
                void main(){
                   vec3 transformedPosition = (m24 * a_position).xyz;
                   gl_Position = vec4(transformedPosition, 1.0);
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let m24 = gl.getUniformLocation(p.program, "m24");
            callback(m24);
            let uniform = gl.getUniform(p.program, m24);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            finish();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0079
         * @tc.name webgl2_test_uniformMatrix2x4fv
         * @tc.desc Test uniformMatrix2x4fv.
         */
        it('webgl2_test_uniformMatrix2x4fv', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix2x4fv] uniformMatrix2x4fv");
            let p = createProgram(gl, `#version 300 es
                in vec2 a_position;
                uniform mat2x4 m24;
                void main(){
                   vec3 transformedPosition = (m24 * a_position).xyz;
                   gl_Position = vec4(transformedPosition, 1.0);
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let m24 = gl.getUniformLocation(p.program, "m24");
            gl.uniformMatrix2x4fv(m24, false, new Float32Array([
                1.5, 1.5, 1.5, 1.5,
                1.0, 0.0, 0.0, 1.0,
                1.0, 0.0, 0.0, 1.0,
            ]), 4, 8);
            let uniform = gl.getUniform(p.program, m24);
            console.info("webgltest", uniform);
            expect(uniform[0]).assertEqual(1.0);
            expect(uniform[1]).assertEqual(0.0);
            expect(uniform[2]).assertEqual(0.0);
            expect(uniform[3]).assertEqual(1.0);
            expect(uniform[4]).assertEqual(1.0);
            expect(uniform[5]).assertEqual(0.0);
            expect(uniform[6]).assertEqual(0.0);
            expect(uniform[7]).assertEqual(1.0);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0080
         * @tc.name webgl2_test_uniformMatrix2x4fv_1
         * @tc.desc Test uniformMatrix2x4fv.
         */
        it('webgl2_test_uniformMatrix2x4fv_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix2x4fv_1] uniformMatrix2x4fv");
            uniformMatrix2x4fv((m) => {
                gl.uniformMatrix2x4fv(m, null, new Float32Array([
                    1.5, 1.5, 1.5, 1.5,
                    1.0, 0.0, 0.0, 1.0,
                    1.0, 0.0, 0.0, 1.0,
                ]), 3, 6);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0081
         * @tc.name webgl2_test_uniformMatrix2x4fv_2
         * @tc.desc Test uniformMatrix2x4fv.
         */
        it('webgl2_test_uniformMatrix2x4fv_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix2x4fv_2] uniformMatrix2x4fv");
            uniformMatrix2x4fv((m) => {
                gl.uniformMatrix2x4fv(m, null, new Float32Array([
                    1.5, 1.5, 1.5, 1.5,
                    1.0, 0.0, 0.0, 1.0,
                    1.0, 0.0, 0.0, 1.0,
                ]), null, 6);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0082
         * @tc.name webgl2_test_uniformMatrix2x4fv_3
         * @tc.desc Test uniformMatrix2x4fv.
         */
        it('webgl2_test_uniformMatrix2x4fv_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix2x4fv_3] uniformMatrix2x4fv");
            uniformMatrix2x4fv((m) => {
                gl.uniformMatrix2x4fv(m, null, new Float32Array([
                    1.5, 1.5, 1.5, 1.5,
                    1.0, 0.0, 0.0, 1.0,
                    1.0, 0.0, 0.0, 1.0,
                ]), null, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0083
         * @tc.name webgl2_test_uniformMatrix2x4fv_4
         * @tc.desc Test uniformMatrix2x4fv.
         */
        it('webgl2_test_uniformMatrix2x4fv_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix2x4fv_4] uniformMatrix2x4fv");
            uniformMatrix2x4fv((m) => {
                gl.uniformMatrix2x4fv(m, null, new Float32Array([
                    1.5, 1.5, 1.5, 1.5,
                    1.0, 0.0, 0.0, 1.0,
                    1.0, 0.0, 0.0, 1.0,
                ]), undefined, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        function uniformMatrix3x4fv(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                in vec3 a_position;
                uniform mat3x4 m34;
                void main(){
                   vec3 transformedPosition = (m34 * a_position).xyz;
                   gl_Position = vec4(transformedPosition, 1.0);
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let m34 = gl.getUniformLocation(p.program, "m34");
            callback(m34);
            let uniform = gl.getUniform(p.program, m34);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            finish();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0084
         * @tc.name webgl2_test_uniformMatrix3x4fv
         * @tc.desc Test uniformMatrix3x4fv.
         */
        it('webgl2_test_uniformMatrix3x4fv', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix3x4fv] uniformMatrix3x4fv");
            let p = createProgram(gl, `#version 300 es
                in vec3 a_position;
                uniform mat3x4 m34;
                void main(){
                   vec3 transformedPosition = (m34 * a_position).xyz;
                   gl_Position = vec4(transformedPosition, 1.0);
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let m34 = gl.getUniformLocation(p.program, "m34");
            gl.uniformMatrix3x4fv(m34, false, new Float32Array([
                1.5, 1.5, 1.5, 1.5,
                1.0, 0.0, 0.0, 1.0,
                1.0, 0.0, 0.0, 1.0,
                1.0, 0.0, 0.0, 1.0,
            ]), 4, 12);
            let uniform = gl.getUniform(p.program, m34);
            console.info("webgltest", uniform);
            expect(uniform[0]).assertEqual(1.0);
            expect(uniform[1]).assertEqual(0.0);
            expect(uniform[2]).assertEqual(0.0);
            expect(uniform[3]).assertEqual(1.0);
            expect(uniform[4]).assertEqual(1.0);
            expect(uniform[5]).assertEqual(0.0);
            expect(uniform[6]).assertEqual(0.0);
            expect(uniform[7]).assertEqual(1.0);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0085
         * @tc.name webgl2_test_uniformMatrix3x4fv_1
         * @tc.desc Test uniformMatrix3x4fv.
         */
        it('webgl2_test_uniformMatrix3x4fv_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix3x4fv_1] uniformMatrix3x4fv");
            uniformMatrix3x4fv((m) => {
                gl.uniformMatrix3x4fv(m, null, new Float32Array([
                    1.5, 1.5, 1.5, 1.5,
                    1.0, 0.0, 0.0, 1.0,
                    1.0, 0.0, 0.0, 1.0,
                    1.0, 0.0, 0.0, 1.0,
                ]), 3, 6);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0086
         * @tc.name webgl2_test_uniformMatrix3x4fv_2
         * @tc.desc Test uniformMatrix3x4fv.
         */
        it('webgl2_test_uniformMatrix3x4fv_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix3x4fv_2] uniformMatrix3x4fv");
            uniformMatrix3x4fv((m) => {
                gl.uniformMatrix3x4fv(m, null, new Float32Array([
                    1.5, 1.5, 1.5, 1.5,
                    1.0, 0.0, 0.0, 1.0,
                    1.0, 0.0, 0.0, 1.0,
                    1.0, 0.0, 0.0, 1.0,
                ]), null, 6);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0087
         * @tc.name webgl2_test_uniformMatrix3x4fv_3
         * @tc.desc Test uniformMatrix3x4fv.
         */
        it('webgl2_test_uniformMatrix3x4fv_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix3x4fv_3] uniformMatrix3x4fv");
            uniformMatrix3x4fv((m) => {
                gl.uniformMatrix3x4fv(m, null, new Float32Array([
                    1.5, 1.5, 1.5, 1.5,
                    1.0, 0.0, 0.0, 1.0,
                    1.0, 0.0, 0.0, 1.0,
                    1.0, 0.0, 0.0, 1.0,
                ]), null, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0088
         * @tc.name webgl2_test_uniformMatrix3x4fv_4
         * @tc.desc Test uniformMatrix3x4fv.
         */
        it('webgl2_test_uniformMatrix3x4fv_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix3x4fv_4] uniformMatrix3x4fv");
            uniformMatrix3x4fv((m) => {
                gl.uniformMatrix3x4fv(m, null, new Float32Array([
                    1.5, 1.5, 1.5, 1.5,
                    1.0, 0.0, 0.0, 1.0,
                    1.0, 0.0, 0.0, 1.0,
                    1.0, 0.0, 0.0, 1.0,
                ]), undefined, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        function uniform1fv(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                uniform float u;
                void main(){
                    gl_Position.x = float(u);
                    gl_Position.w = 1.0;
                    gl_PointSize = 100.0;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            callback(u);
            let uniform = gl.getUniform(p.program, u);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            finish();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0089
         * @tc.name webgl2_test_uniform1fv
         * @tc.desc Test uniform1fv.
         */
        it('webgl2_test_uniform1fv', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform1fv] uniform1fv");
            let p = createProgram(gl, `#version 300 es
                uniform float u;
                void main(){
                    gl_Position.x = float(u);
                    gl_Position.w = 1.0;
                    gl_PointSize = 100.0;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            gl.uniform1fv(u, new Float32Array([1.0, 0.0, 1.0]), 1, 1);
            let uniform = gl.getUniform(p.program, u);
            console.info("webgltest", uniform);
            expect(uniform).assertEqual(0.0);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0090
         * @tc.name webgl2_test_uniform1fv_1
         * @tc.desc Test uniform1fv.
         */
        it('webgl2_test_uniform1fv_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform1fv_1] uniform1fv");
            uniform1fv((u) => {
                gl.uniform1fv(u, new Float32Array([1.0, 0.0, 1.0]), 1, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0091
         * @tc.name webgl2_test_uniform1fv_2
         * @tc.desc Test uniform1fv.
         */
        it('webgl2_test_uniform1fv_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform1fv_2] uniform1fv");
            uniform1fv((u) => {
                gl.uniform1fv(u, new Float32Array([1.0, 0.0, 1.0]), 1, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0092
         * @tc.name webgl2_test_uniform1fv_3
         * @tc.desc Test uniform1fv.
         */
        it('webgl2_test_uniform1fv_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform1fv_3] uniform1fv");
            uniform1fv((u) => {
                gl.uniform1fv(u, new Float32Array([1.0, 0.0, 1.0]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0093
         * @tc.name webgl2_test_uniform1fv_4
         * @tc.desc Test uniform1fv.
         */
        it('webgl2_test_uniform1fv_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform1fv_4] uniform1fv");
            uniform1fv((u) => {
                gl.uniform1fv(u, new Float32Array([1.0, 0.0, 1.0]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0094
         * @tc.name webgl2_test_uniform1fv_5
         * @tc.desc Test uniform1fv.
         */
        it('webgl2_test_uniform1fv_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform1fv_5] uniform1fv");
            uniform1fv((u) => {
                gl.uniform1fv(null, new Float32Array([1.0, 0.0, 1.0]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function uniform2fv(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                uniform vec2 u;
                void main(){
                    gl_Position.x = u.x;
                    gl_Position.y = u.y;
                    gl_Position.w = 1.0;
                    gl_PointSize = 100.0;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            callback(u);
            let uniform = gl.getUniform(p.program, u);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            finish();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0095
         * @tc.name webgl2_test_uniform2fv
         * @tc.desc Test uniform2fv.
         */
        it('webgl2_test_uniform2fv', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform2fv] uniform2fv");
            let p = createProgram(gl, `#version 300 es
                uniform vec2 u;
                void main(){
                    gl_Position.x = u.x;
                    gl_Position.y = u.y;
                    gl_Position.w = 1.0;
                    gl_PointSize = 100.0;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            gl.uniform2fv(u, new Float32Array([0.0, 0.0, 1.0, 1.0]), 2, 2);
            let uniform = gl.getUniform(p.program, u);
            console.info("webgltest", uniform);
            expect(uniform[0]).assertEqual(1.0);
            expect(uniform[1]).assertEqual(1.0);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0096
         * @tc.name webgl2_test_uniform2fv_1
         * @tc.desc Test uniform2fv.
         */
        it('webgl2_test_uniform2fv_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform2fv_1] uniform2fv");
            uniform2fv((u) => {
                gl.uniform2fv(u, new Float32Array([1.0, 0.0, 1.0, 1.0]), 2, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0097
         * @tc.name webgl2_test_uniform2fv_2
         * @tc.desc Test uniform2fv.
         */
        it('webgl2_test_uniform2fv_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform2fv_2] uniform2fv");
            uniform2fv((u) => {
                gl.uniform2fv(u, new Float32Array([1.0, 0.0, 1.0, 1.0]), 1, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0098
         * @tc.name webgl2_test_uniform2fv_3
         * @tc.desc Test uniform2fv.
         */
        it('webgl2_test_uniform2fv_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform2fv_3] uniform2fv");
            uniform2fv((u) => {
                gl.uniform2fv(u, new Float32Array([1.0, 0.0, 1.0, 1.0]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0099
         * @tc.name webgl2_test_uniform2fv_4
         * @tc.desc Test uniform2fv.
         */
        it('webgl2_test_uniform2fv_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform2fv_4] uniform2fv");
            uniform2fv((u) => {
                gl.uniform2fv(u, new Float32Array([1.0, 0.0, 1.0, 1.0]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0100
         * @tc.name webgl2_test_uniform2fv_5
         * @tc.desc Test uniform2fv.
         */
        it('webgl2_test_uniform2fv_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform2fv_5] uniform2fv");
            uniform2fv((u) => {
                gl.uniform2fv(null, new Float32Array([1.0, 0.0, 1.0, 1.0]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function uniform3fv(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                uniform vec3 u;
                void main(){
                    gl_Position.x = u.x;
                    gl_Position.y = u.y;
                    gl_Position.z = u.z;
                    gl_Position.w = 1.0;
                    gl_PointSize = 100.0;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            callback(u);
            let uniform = gl.getUniform(p.program, u);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            finish();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0101
         * @tc.name webgl2_test_uniform3fv
         * @tc.desc Test uniform3fv.
         */
        it('webgl2_test_uniform3fv', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform3fv] uniform3fv");
            let p = createProgram(gl, `#version 300 es
                uniform vec3 u;
                void main(){
                    gl_Position.x = u.x;
                    gl_Position.y = u.y;
                    gl_Position.z = u.z;
                    gl_Position.w = 1.0;
                    gl_PointSize = 100.0;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            gl.uniform3fv(u, new Float32Array([0.0, 0.0, 1.0, 1.0, 1.0, 1.0]), 2, 3);
            let uniform = gl.getUniform(p.program, u);
            console.info("webgltest", uniform);
            expect(uniform[0]).assertEqual(1.0);
            expect(uniform[1]).assertEqual(1.0);
            expect(uniform[2]).assertEqual(1.0);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0102
         * @tc.name webgl2_test_uniform3fv_1
         * @tc.desc Test uniform3fv.
         */
        it('webgl2_test_uniform3fv_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform3fv_1] uniform3fv");
            uniform3fv((u) => {
                gl.uniform3fv(u, new Float32Array([1.0, 0.0, 1.0, 1.0, 1.0]), 2, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0103
         * @tc.name webgl2_test_uniform3fv_2
         * @tc.desc Test uniform3fv.
         */
        it('webgl2_test_uniform3fv_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform3fv_2] uniform3fv");
            uniform3fv((u) => {
                gl.uniform3fv(u, new Float32Array([1.0, 0.0, 1.0, 1.0, 1.0]), 1, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0104
         * @tc.name webgl2_test_uniform3fv_3
         * @tc.desc Test uniform3fv.
         */
        it('webgl2_test_uniform3fv_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform3fv_3] uniform3fv");
            uniform3fv((u) => {
                gl.uniform3fv(u, new Float32Array([1.0, 0.0, 1.0, 1.0, 1.0]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0105
         * @tc.name webgl2_test_uniform3fv_4
         * @tc.desc Test uniform3fv.
         */
        it('webgl2_test_uniform3fv_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform3fv_4] uniform3fv");
            uniform3fv((u) => {
                gl.uniform3fv(u, new Float32Array([1.0, 0.0, 1.0, 1.0, 1.0]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0106
         * @tc.name webgl2_test_uniform3fv_5
         * @tc.desc Test uniform3fv.
         */
        it('webgl2_test_uniform3fv_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform3fv_5] uniform3fv");
            uniform3fv((u) => {
                gl.uniform3fv(null, new Float32Array([1.0, 0.0, 1.0, 1.0, 1.0]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function uniform4fv(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                uniform vec4 u;
                void main(){
                    gl_Position.x = u.x;
                    gl_Position.y = u.y;
                    gl_Position.z = u.z;
                    gl_Position.w = u.w;
                    gl_PointSize = 100.0;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            callback(u);
            let uniform = gl.getUniform(p.program, u);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            finish();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0107
         * @tc.name webgl2_test_uniform4fv
         * @tc.desc Test uniform4fv.
         */
        it('webgl2_test_uniform4fv', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform4fv] uniform4fv");
            let p = createProgram(gl, `#version 300 es
                uniform vec4 u;
                void main(){
                    gl_Position.x = u.x;
                    gl_Position.y = u.y;
                    gl_Position.z = u.z;
                    gl_Position.w = u.w;
                    gl_PointSize = 100.0;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            gl.uniform4fv(u, new Float32Array([0.0, 0.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0]), 4, 4);
            let uniform = gl.getUniform(p.program, u);
            console.info("webgltest", uniform);
            expect(uniform[0]).assertEqual(1.0);
            expect(uniform[1]).assertEqual(1.0);
            expect(uniform[2]).assertEqual(1.0);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0108
         * @tc.name webgl2_test_uniform4fv_1
         * @tc.desc Test uniform4fv.
         */
        it('webgl2_test_uniform4fv_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform4fv_1] uniform4fv");
            uniform4fv((u) => {
                gl.uniform4fv(u, new Float32Array([0.0, 0.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0]), 4, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0109
         * @tc.name webgl2_test_uniform4fv_2
         * @tc.desc Test uniform4fv.
         */
        it('webgl2_test_uniform4fv_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform4fv_2] uniform4fv");
            uniform4fv((u) => {
                gl.uniform4fv(u, new Float32Array([0.0, 0.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0]), 4, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0110
         * @tc.name webgl2_test_uniform4fv_3
         * @tc.desc Test uniform4fv.
         */
        it('webgl2_test_uniform4fv_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform4fv_3] uniform4fv");
            uniform4fv((u) => {
                gl.uniform4fv(u, new Float32Array([0.0, 0.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0111
         * @tc.name webgl2_test_uniform4fv_4
         * @tc.desc Test uniform4fv.
         */
        it('webgl2_test_uniform4fv_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform4fv_4] uniform4fv");
            uniform4fv((u) => {
                gl.uniform4fv(u, new Float32Array([0.0, 0.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0112
         * @tc.name webgl2_test_uniform4fv_5
         * @tc.desc Test uniform4fv.
         */
        it('webgl2_test_uniform4fv_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform4fv_5] uniform4fv");
            uniform4fv((u) => {
                gl.uniform4fv(null, new Float32Array([0.0, 0.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function uniform1iv(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                uniform int u;
                void main(){
                    gl_Position.x = float(u);
                    gl_Position.w = 1.0;
                    gl_PointSize = 100.0;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            callback(u);
            let uniform = gl.getUniform(p.program, u);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            finish();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0113
         * @tc.name webgl2_test_uniform1iv
         * @tc.desc Test uniform1iv.
         */
        it('webgl2_test_uniform1iv', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform1iv] uniform1iv");
            let p = createProgram(gl, `#version 300 es
                uniform int u;
                void main(){
                    gl_Position.x = float(u);
                    gl_Position.w = 1.0;
                    gl_PointSize = 100.0;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            gl.uniform1iv(u, new Int32Array([0, 1, 1]), 1, 1);
            let uniform = gl.getUniform(p.program, u);
            console.info("webgltest", uniform);
            expect(uniform).assertEqual(1);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0114
         * @tc.name webgl2_test_uniform1iv_1
         * @tc.desc Test uniform1iv.
         */
        it('webgl2_test_uniform1iv_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform1iv_1] uniform1iv");
            uniform1iv((u) => {
                gl.uniform1iv(u, new Int32Array([0, 1, 1]), 1, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0115
         * @tc.name webgl2_test_uniform1iv_2
         * @tc.desc Test uniform1iv.
         */
        it('webgl2_test_uniform1iv_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform1iv_2] uniform1iv");
            uniform1iv((u) => {
                gl.uniform1iv(u, new Int32Array([0, 1, 1]), 1, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0116
         * @tc.name webgl2_test_uniform1iv_3
         * @tc.desc Test uniform1iv.
         */
        it('webgl2_test_uniform1iv_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform1iv_3] uniform1iv");
            uniform1iv((u) => {
                gl.uniform1iv(u, new Int32Array([0, 1, 1]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0117
         * @tc.name webgl2_test_uniform1iv_4
         * @tc.desc Test uniform1iv.
         */
        it('webgl2_test_uniform1iv_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform1iv_4] uniform1iv");
            uniform1iv((u) => {
                gl.uniform1iv(u, new Int32Array([0, 1, 1]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0118
         * @tc.name webgl2_test_uniform1iv_5
         * @tc.desc Test uniform1iv.
         */
        it('webgl2_test_uniform1iv_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform1iv_5] uniform1iv");
            uniform1iv((u) => {
                gl.uniform1iv(null, new Int32Array([0, 1, 1]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function uniform2iv(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                uniform ivec2 u;
                void main(){
                    gl_Position.x = float(u.x);
                    gl_Position.y = float(u.y);
                    gl_Position.w = 1.0;
                    gl_PointSize = 100.0;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            callback(u);
            let uniform = gl.getUniform(p.program, u);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            finish();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0119
         * @tc.name webgl2_test_uniform2iv
         * @tc.desc Test uniform2iv.
         */
        it('webgl2_test_uniform2iv', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform2iv] uniform2iv");
            let p = createProgram(gl, `#version 300 es
                uniform ivec2 u;
                void main(){
                    gl_Position.x = float(u.x);
                    gl_Position.y = float(u.y);
                    gl_Position.w = 1.0;
                    gl_PointSize = 100.0;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            gl.uniform2iv(u, new Int32Array([0, 0, 1, 1]), 2, 2);
            let uniform = gl.getUniform(p.program, u);
            console.info("webgltest", uniform);
            expect(uniform[0]).assertEqual(1);
            expect(uniform[1]).assertEqual(1);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0120
         * @tc.name webgl2_test_uniform2iv_1
         * @tc.desc Test uniform2iv.
         */
        it('webgl2_test_uniform2iv_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform2iv_1] uniform2iv");
            uniform2iv((u) => {
                gl.uniform2iv(u, new Int32Array([0, 1, 1, 1]), 1, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0121
         * @tc.name webgl2_test_uniform2iv_2
         * @tc.desc Test uniform2iv.
         */
        it('webgl2_test_uniform2iv_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform2iv_2] uniform2iv");
            uniform2iv((u) => {
                gl.uniform2iv(u, new Int32Array([0, 1, 1, 1]), 1, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0122
         * @tc.name webgl2_test_uniform2iv_3
         * @tc.desc Test uniform2iv.
         */
        it('webgl2_test_uniform2iv_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform2iv_3] uniform2iv");
            uniform2iv((u) => {
                gl.uniform2iv(u, new Int32Array([0, 1, 1, 1]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0123
         * @tc.name webgl2_test_uniform2iv_4
         * @tc.desc Test uniform2iv.
         */
        it('webgl2_test_uniform2iv_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform2iv_4] uniform2iv");
            uniform2iv((u) => {
                gl.uniform2iv(u, new Int32Array([0, 1, 1, 1]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0124
         * @tc.name webgl2_test_uniform2iv_5
         * @tc.desc Test uniform2iv.
         */
        it('webgl2_test_uniform2iv_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform2iv_5] uniform2iv");
            uniform2iv((u) => {
                gl.uniform2iv(null, new Int32Array([0, 1, 1, 1]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function uniform3iv(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                uniform ivec3 u;
                void main(){
                    gl_Position.x = float(u.x);
                    gl_Position.y = float(u.y);
                    gl_Position.z = float(u.z);
                    gl_Position.w = 1.0;
                    gl_PointSize = 100.0;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            callback(u);
            let uniform = gl.getUniform(p.program, u);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            finish();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0125
         * @tc.name webgl2_test_uniform3iv
         * @tc.desc Test uniform3iv.
         */
        it('webgl2_test_uniform3iv', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform3iv] uniform3iv");
            let p = createProgram(gl, `#version 300 es
                uniform ivec3 u;
                void main(){
                    gl_Position.x = float(u.x);
                    gl_Position.y = float(u.y);
                    gl_Position.z = float(u.z);
                    gl_Position.w = 1.0;
                    gl_PointSize = 100.0;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            gl.uniform3iv(u, new Int32Array([0, 0, 1, 1, 1, 1]), 3, 3);
            let uniform = gl.getUniform(p.program, u);
            console.info("webgltest", uniform);
            expect(uniform[0]).assertEqual(1);
            expect(uniform[1]).assertEqual(1);
            expect(uniform[2]).assertEqual(1);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0126
         * @tc.name webgl2_test_uniform3iv_1
         * @tc.desc Test uniform3iv.
         */
        it('webgl2_test_uniform3iv_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform3iv_1] uniform3iv");
            uniform3iv((u) => {
                gl.uniform3iv(u, new Int32Array([0, 0, 1, 1, 1, 1]), 1, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0127
         * @tc.name webgl2_test_uniform3iv_2
         * @tc.desc Test uniform3iv.
         */
        it('webgl2_test_uniform3iv_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform3iv_2] uniform3iv");
            uniform3iv((u) => {
                gl.uniform3iv(u, new Int32Array([0, 0, 1, 1, 1, 1]), 1, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0128
         * @tc.name webgl2_test_uniform3iv_3
         * @tc.desc Test uniform3iv.
         */
        it('webgl2_test_uniform3iv_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform3iv_3] uniform3iv");
            uniform3iv((u) => {
                gl.uniform3iv(u, new Int32Array([0, 0, 1, 1, 1, 1]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0129
         * @tc.name webgl2_test_uniform3iv_4
         * @tc.desc Test uniform3iv.
         */
        it('webgl2_test_uniform3iv_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform3iv_4] uniform3iv");
            uniform3iv((u) => {
                gl.uniform3iv(u, new Int32Array([0, 0, 1, 1, 1, 1]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0130
         * @tc.name webgl2_test_uniform3iv_5
         * @tc.desc Test uniform3iv.
         */
        it('webgl2_test_uniform3iv_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform3iv_5] uniform3iv");
            uniform3iv((u) => {
                gl.uniform3iv(null, new Int32Array([0, 0, 1, 1, 1, 1]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function uniform4iv(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                uniform ivec4 u;
                void main(){
                    gl_Position.x = float(u.x);
                    gl_Position.y = float(u.y);
                    gl_Position.z = float(u.z);
                    gl_Position.w = float(u.w);
                    gl_PointSize = 100.0;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            callback(u);
            let uniform = gl.getUniform(p.program, u);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            finish();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0131
         * @tc.name webgl2_test_uniform4iv
         * @tc.desc Test uniform4iv.
         */
        it('webgl2_test_uniform4iv', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform4iv] uniform4iv");
            let p = createProgram(gl, `#version 300 es
                uniform ivec4 u;
                void main(){
                    gl_Position.x = float(u.x);
                    gl_Position.y = float(u.y);
                    gl_Position.z = float(u.z);
                    gl_Position.w = float(u.w);
                    gl_PointSize = 100.0;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u");
            gl.uniform4iv(u, new Int32Array([
                0, 0, 1, 1,
                1, 1, 1, 1
            ]), 4, 4);
            let uniform = gl.getUniform(p.program, u);
            console.info("webgltest", uniform);
            expect(uniform[0]).assertEqual(1);
            expect(uniform[1]).assertEqual(1);
            expect(uniform[2]).assertEqual(1);
            expect(uniform[3]).assertEqual(1);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0132
         * @tc.name webgl2_test_uniform4iv_1
         * @tc.desc Test uniform4iv.
         */
        it('webgl2_test_uniform4iv_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform4iv_1] uniform4iv");
            uniform4iv((u) => {
                gl.uniform4iv(u, new Int32Array([
                    0, 0, 1, 1,
                    1, 1, 1, 1
                ]), 4, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0133
         * @tc.name webgl2_test_uniform4iv_2
         * @tc.desc Test uniform4iv.
         */
        it('webgl2_test_uniform4iv_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform4iv_2] uniform4iv");
            uniform4iv((u) => {
                gl.uniform4iv(u, new Int32Array([
                    0, 0, 1, 1,
                    1, 1, 1, 1
                ]), 4, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0134
         * @tc.name webgl2_test_uniform4iv_3
         * @tc.desc Test uniform4iv.
         */
        it('webgl2_test_uniform4iv_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform4iv_3] uniform4iv");
            uniform4iv((u) => {
                gl.uniform4iv(u, new Int32Array([
                    0, 0, 1, 1,
                    1, 1, 1, 1
                ]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0135
         * @tc.name webgl2_test_uniform4iv_4
         * @tc.desc Test uniform4iv.
         */
        it('webgl2_test_uniform4iv_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform4iv_4] uniform4iv");
            uniform4iv((u) => {
                gl.uniform4iv(u, new Int32Array([
                    0, 0, 1, 1,
                    1, 1, 1, 1
                ]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0136
         * @tc.name webgl2_test_uniform4iv_5
         * @tc.desc Test uniform4iv.
         */
        it('webgl2_test_uniform4iv_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniform4iv_5] uniform4iv");
            uniform4iv((u) => {
                gl.uniform4iv(null, new Int32Array([
                    0, 0, 1, 1,
                    1, 1, 1, 1
                ]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function uniformMatrix2fv(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                in vec2 a_Position;
                uniform mat2 u_MvpMatrix;
                void main(){
                    gl_Position = vec4(
                        (u_MvpMatrix * vec2(a_Position.x,a_Position.y)).xy, 0, 1
                    );
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u_MvpMatrix");
            callback(u);
            let uniform = gl.getUniform(p.program, u);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            finish();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0137
         * @tc.name webgl2_test_uniformMatrix2fv
         * @tc.desc Test uniformMatrix2fv.
         */
        it('webgl2_test_uniformMatrix2fv', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix2fv] uniformMatrix2fv");
            let p = createProgram(gl, `#version 300 es
                in vec2 a_Position;
                uniform mat2 u_MvpMatrix;
                void main(){
                    gl_Position = vec4(
                        (u_MvpMatrix * vec2(a_Position.x,a_Position.y)).xy, 0, 1
                    );
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u_MvpMatrix");
            gl.uniformMatrix2fv(u, false, new Float32Array([
                3.0, -0.5,
                0, 3.5,
                1.0, -1.5,
                0, 1.5,
            ]), 4, 4);
            let value = gl.getUniform(p.program, u);
            console.info("webgltest", value);
            expect(value[0]).assertEqual(1.0);
            expect(value[1]).assertEqual(-1.5);
            expect(value[2]).assertEqual(0);
            expect(value[3]).assertEqual(1.5);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0138
         * @tc.name webgl2_test_uniformMatrix2fv_1
         * @tc.desc Test uniformMatrix2fv.
         */
        it('webgl2_test_uniformMatrix2fv_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix2fv_1] uniformMatrix2fv");
            uniformMatrix2fv((u) => {
                gl.uniformMatrix2fv(u, null, new Float32Array([
                    3.0, -0.5,
                    0, 3.5,
                    1.0, -1.5,
                    0, 1.5,
                ]), 4, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0139
         * @tc.name webgl2_test_uniformMatrix2fv_2
         * @tc.desc Test uniformMatrix2fv.
         */
        it('webgl2_test_uniformMatrix2fv_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix2fv_2] uniformMatrix2fv");
            uniformMatrix2fv((u) => {
                gl.uniformMatrix2fv(u, null, new Float32Array([
                    3.0, -0.5,
                    0, 3.5,
                    1.0, -1.5,
                    0, 1.5,
                ]), 4, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0140
         * @tc.name webgl2_test_uniformMatrix2fv_3
         * @tc.desc Test uniformMatrix2fv.
         */
        it('webgl2_test_uniformMatrix2fv_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix2fv_3] uniformMatrix2fv");
            uniformMatrix2fv((u) => {
                gl.uniformMatrix2fv(u, null, new Float32Array([
                    3.0, -0.5,
                    0, 3.5,
                    1.0, -1.5,
                    0, 1.5,
                ]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0141
         * @tc.name webgl2_test_uniformMatrix2fv_4
         * @tc.desc Test uniformMatrix2fv.
         */
        it('webgl2_test_uniformMatrix2fv_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix2fv_4] uniformMatrix2fv");
            uniformMatrix2fv((u) => {
                gl.uniformMatrix2fv(u, null, new Float32Array([
                    3.0, -0.5,
                    0, 3.5,
                    1.0, -1.5,
                    0, 1.5,
                ]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0142
         * @tc.name webgl2_test_uniformMatrix2fv_5
         * @tc.desc Test uniformMatrix2fv.
         */
        it('webgl2_test_uniformMatrix2fv_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix2fv_5] uniformMatrix2fv");
            uniformMatrix2fv((u) => {
                gl.uniformMatrix2fv(null, null, new Float32Array([
                    3.0, -0.5,
                    0, 3.5,
                    1.0, -1.5,
                    0, 1.5,
                ]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function uniformMatrix3fv(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                in vec2 a_Position;
                uniform mat3 u_MvpMatrix;
                void main(){
                    gl_Position = vec4(
                        (u_MvpMatrix * vec3(a_Position, 1)).xy, 0, 1
                    );
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u_MvpMatrix");
            callback(u);
            let uniform = gl.getUniform(p.program, u);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            finish();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0143
         * @tc.name webgl2_test_uniformMatrix3fv
         * @tc.desc Test uniformMatrix3fv.
         */
        it('webgl2_test_uniformMatrix3fv', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix3fv] uniformMatrix3fv");
            let p = createProgram(gl, `#version 300 es
                in vec2 a_Position;
                uniform mat3 u_MvpMatrix;
                void main(){
                    gl_Position = vec4(
                        (u_MvpMatrix * vec3(a_Position, 1)).xy, 0, 1
                    );
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u_MvpMatrix");
            gl.uniformMatrix3fv(u, false, new Float32Array([
                3.0, -0.5, 1.0,
                0.0, 3.5, 1.0,
                1.0, -1.5, 1.0,
                0.0, 1.5, 1.0,
            ]), 3, 9);
            let value = gl.getUniform(p.program, u);
            console.info("webgltest", value);
            expect(value[0]).assertEqual(0.0);
            expect(value[1]).assertEqual(3.5);
            expect(value[2]).assertEqual(1.0);
            expect(value[3]).assertEqual(1.0);
            expect(value[4]).assertEqual(-1.5);
            expect(value[5]).assertEqual(1.0);
            expect(value[6]).assertEqual(0.0);
            expect(value[7]).assertEqual(1.5);
            expect(value[8]).assertEqual(1.0);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0144
         * @tc.name webgl2_test_uniformMatrix3fv_1
         * @tc.desc Test uniformMatrix3fv.
         */
        it('webgl2_test_uniformMatrix3fv_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix3fv_1] uniformMatrix3fv");
            uniformMatrix3fv((u) => {
                gl.uniformMatrix3fv(u, null, new Float32Array([
                    3.0, -0.5, 1.0,
                    0.0, 3.5, 1.0,
                    1.0, -1.5, 1.0,
                    0.0, 1.5, 1.0,
                ]), 3, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0145
         * @tc.name webgl2_test_uniformMatrix3fv_2
         * @tc.desc Test uniformMatrix3fv.
         */
        it('webgl2_test_uniformMatrix3fv_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix3fv_2] uniformMatrix3fv");
            uniformMatrix3fv((u) => {
                gl.uniformMatrix3fv(u, null, new Float32Array([
                    3.0, -0.5, 1.0,
                    0.0, 3.5, 1.0,
                    1.0, -1.5, 1.0,
                    0.0, 1.5, 1.0,
                ]), 3, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0146
         * @tc.name webgl2_test_uniformMatrix3fv_3
         * @tc.desc Test uniformMatrix3fv.
         */
        it('webgl2_test_uniformMatrix3fv_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix3fv_3] uniformMatrix3fv");
            uniformMatrix3fv((u) => {
                gl.uniformMatrix3fv(u, null, new Float32Array([
                    3.0, -0.5, 1.0,
                    0.0, 3.5, 1.0,
                    1.0, -1.5, 1.0,
                    0.0, 1.5, 1.0,
                ]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0147
         * @tc.name webgl2_test_uniformMatrix3fv_4
         * @tc.desc Test uniformMatrix3fv.
         */
        it('webgl2_test_uniformMatrix3fv_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix3fv_4] uniformMatrix3fv");
            uniformMatrix3fv((u) => {
                gl.uniformMatrix3fv(u, null, new Float32Array([
                    3.0, -0.5, 1.0,
                    0.0, 3.5, 1.0,
                    1.0, -1.5, 1.0,
                    0.0, 1.5, 1.0,
                ]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0148
         * @tc.name webgl2_test_uniformMatrix3fv_5
         * @tc.desc Test uniformMatrix3fv.
         */
        it('webgl2_test_uniformMatrix3fv_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix3fv_5] uniformMatrix3fv");
            uniformMatrix3fv((u) => {
                gl.uniformMatrix3fv(null, null, new Float32Array([
                    3.0, -0.5, 1.0,
                    0.0, 3.5, 1.0,
                    1.0, -1.5, 1.0,
                    0.0, 1.5, 1.0,
                ]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function uniformMatrix4fv(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                in vec4 a_Position;
                uniform mat4 u_MvpMatrix;
                void main(){
                    gl_Position = u_MvpMatrix * a_Position;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u_MvpMatrix");
            callback(u);
            let uniform = gl.getUniform(p.program, u);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            finish();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0149
         * @tc.name webgl2_test_uniformMatrix4fv
         * @tc.desc Test uniformMatrix4fv.
         */
        it('webgl2_test_uniformMatrix4fv', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix4fv] uniformMatrix4fv");
            let p = createProgram(gl, `#version 300 es
                in vec4 a_Position;
                uniform mat4 u_MvpMatrix;
                void main(){
                    gl_Position = u_MvpMatrix * a_Position;
                }
            `, WEBGL2_FRAGMENT_SHADER_DEMO);
            gl.useProgram(p.program);
            let u = gl.getUniformLocation(p.program, "u_MvpMatrix");
            gl.uniformMatrix4fv(u, false, new Float32Array([
                1.0, 2.0, 3.0, 4.0,
                3.5, -0.5, -0.5, -0.5,
                0, 3.5, -0.5, -0.5,
                -1.0, -1.5, -2.0, -1.0,
                -3.0, -0.5, 6.0, 8.0
            ]), 4, 16);
            let value = gl.getUniform(p.program, u);
            console.info("webgltest", value);
            expect(value[0]).assertEqual(3.5);
            expect(value[1]).assertEqual(-0.5);
            expect(value[2]).assertEqual(-0.5);
            expect(value[3]).assertEqual(-0.5);
            expect(value[4]).assertEqual(0.0);
            expect(value[5]).assertEqual(3.5);
            expect(value[6]).assertEqual(-0.5);
            expect(value[7]).assertEqual(-0.5);
            expect(value[8]).assertEqual(-1.0);
            expect(value[9]).assertEqual(-1.5);
            expect(value[10]).assertEqual(-2.0);
            expect(value[11]).assertEqual(-1.0);
            expect(value[12]).assertEqual(-3.0);
            expect(value[13]).assertEqual(-0.5);
            expect(value[14]).assertEqual(6.0);
            expect(value[15]).assertEqual(8.0);
            clear(gl);
            gl.drawArrays(gl.POINTS, 0, 1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0150
         * @tc.name webgl2_test_uniformMatrix4fv_1
         * @tc.desc Test uniformMatrix4fv.
         */
        it('webgl2_test_uniformMatrix4fv_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix4fv_1] uniformMatrix4fv");
            uniformMatrix4fv((u) => {
                gl.uniformMatrix4fv(u, null, new Float32Array([
                    1.0, 2.0, 3.0, 4.0,
                    3.5, -0.5, -0.5, -0.5,
                    0, 3.5, -0.5, -0.5,
                    -1.0, -1.5, -2.0, -1.0,
                    -3.0, -0.5, 6.0, 8.0
                ]), 4, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0151
         * @tc.name webgl2_test_uniformMatrix4fv_2
         * @tc.desc Test uniformMatrix4fv.
         */
        it('webgl2_test_uniformMatrix4fv_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix4fv_2] uniformMatrix4fv");
            uniformMatrix4fv((u) => {
                gl.uniformMatrix4fv(u, null, new Float32Array([
                    1.0, 2.0, 3.0, 4.0,
                    3.5, -0.5, -0.5, -0.5,
                    0, 3.5, -0.5, -0.5,
                    -1.0, -1.5, -2.0, -1.0,
                    -3.0, -0.5, 6.0, 8.0
                ]), 4, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0152
         * @tc.name webgl2_test_uniformMatrix4fv_3
         * @tc.desc Test uniformMatrix4fv.
         */
        it('webgl2_test_uniformMatrix4fv_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix4fv_3] uniformMatrix4fv");
            uniformMatrix4fv((u) => {
                gl.uniformMatrix4fv(u, null, new Float32Array([
                    1.0, 2.0, 3.0, 4.0,
                    3.5, -0.5, -0.5, -0.5,
                    0, 3.5, -0.5, -0.5,
                    -1.0, -1.5, -2.0, -1.0,
                    -3.0, -0.5, 6.0, 8.0
                ]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0153
         * @tc.name webgl2_test_uniformMatrix4fv_4
         * @tc.desc Test uniformMatrix4fv.
         */
        it('webgl2_test_uniformMatrix4fv_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix4fv_4] uniformMatrix4fv");
            uniformMatrix4fv((u) => {
                gl.uniformMatrix4fv(u, null, new Float32Array([
                    1.0, 2.0, 3.0, 4.0,
                    3.5, -0.5, -0.5, -0.5,
                    0, 3.5, -0.5, -0.5,
                    -1.0, -1.5, -2.0, -1.0,
                    -3.0, -0.5, 6.0, 8.0
                ]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0154
         * @tc.name webgl2_test_uniformMatrix4fv_5
         * @tc.desc Test uniformMatrix4fv.
         */
        it('webgl2_test_uniformMatrix4fv_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_uniformMatrix4fv_5] uniformMatrix4fv");
            uniformMatrix4fv((u) => {
                gl.uniformMatrix4fv(null, null, new Float32Array([
                    1.0, 2.0, 3.0, 4.0,
                    3.5, -0.5, -0.5, -0.5,
                    0, 3.5, -0.5, -0.5,
                    -1.0, -1.5, -2.0, -1.0,
                    -3.0, -0.5, 6.0, 8.0
                ]), null, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
    })
}
