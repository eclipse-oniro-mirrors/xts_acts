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


export default function webgl1_uniform() {
    
	describe('webgl1_uniform', function () {
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

        function getActiveUniform(callback, finish) {
            let vSource = `
            void main(){
                gl_Position = vec4(0.5, 0.5, 1, 1.0);
            }
        `;
            let fSource = `
            precision mediump float;
            uniform vec4 u_FragColor;
            void main(){
                gl_FragColor = u_FragColor;
            }
        `
            let p = createProgram(gl, vSource, fSource);
            callback(p.program);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.name   webgl_test_getActiveUniform
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0001
         * @tc.desc   Test getActiveUniform.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_getActiveUniform', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_getActiveUniform] getActiveUniform");
            let vSource = `
            void main(){
                gl_Position = vec4(0.5, 0.5, 1, 1.0);
            }
        `;
            let fSource = `
            precision mediump float;
            uniform vec4 u_FragColor;
            void main(){
                gl_FragColor = u_FragColor;
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let u_FragColor = gl.getUniformLocation(p.program, "u_FragColor");
            console.info("webgltest fragmentShader source :", fSource);
            console.info("webgltest uniform u_FragColor:", u_FragColor);
            expect(u_FragColor != null).assertTrue();
            let activeUniforms = gl.getProgramParameter(p.program, gl.ACTIVE_UNIFORMS);
            console.info("webgltest  ACTIVE_UNIFORMS: ", activeUniforms);
            let activeUniform = gl.getActiveUniform(p.program, 0);
            console.info("webgltest  gl.getActiveUniform(p.program,0); ", activeUniform);
            expect(activeUniform.name).assertEqual("u_FragColor");
            expect(activeUniform.type).assertEqual(gl.FLOAT_VEC4);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.name   webgl_test_getActiveUniforms_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0002
         * @tc.desc   Test getActiveUniforms.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_getActiveUniforms_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getActiveUniforms_1] getActiveUniforms_1");
            getActiveUniform((program) => {
                let activeUniform = gl.getActiveUniform(program, 0);
                expect(activeUniform.name).assertEqual("u_FragColor");
                expect(activeUniform.type).assertEqual(gl.FLOAT_VEC4);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_getActiveUniforms_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0003
         * @tc.desc   Test getActiveUniforms.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_getActiveUniforms_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getActiveUniforms_2] getActiveUniforms_1");
            getActiveUniform((program) => {
                let activeUniform = gl.getActiveUniform(program, -1);
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            })
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.name   webgl_test_getActiveUniforms_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0004
         * @tc.desc   Test getActiveUniforms.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_getActiveUniforms_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getActiveUniforms_3] getActiveUniforms_1");
            getActiveUniform((program) => {
                let activeUniform = gl.getActiveUniform(program, null);
                expect(activeUniform["name"]).assertEqual("u_FragColor");
                expect(activeUniform["type"]).assertEqual(gl.FLOAT_VEC4);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_getUniformLocation
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0005
         * @tc.desc   Test getUniformLocation.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_getUniformLocation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_getUniformLocation] getUniformLocation");
            let vSource = `
            void main(){
                gl_Position = vec4(0.5, 0.5, 1, 1.0);
            }
        `;
            let fSource = `
            precision mediump float;
            uniform vec4 u_FragColor;
            void main(){
                gl_FragColor = u_FragColor;
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let u_FragColor = gl.getUniformLocation(p.program, "u_FragColor");
            console.info("webgltest fragmentShader source :", fSource);
            console.info("webgltest uniform u_FragColor:", u_FragColor);
            expect(u_FragColor != null).assertTrue();
            let u_FragColorErr = gl.getUniformLocation(p.program, "u_FragColor_Err");
            console.info("webgltest uniform u_FragColorErr:", u_FragColorErr);
            expect(u_FragColorErr).assertEqual(null);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })

        function getUniformLocation(callback) {
            let vSource = `
            void main(){
                gl_Position = vec4(0.5, 0.5, 1, 1.0);
            }
        `;
            let fSource = `
            precision mediump float;
            uniform vec4 u_FragColor;
            void main(){
                gl_FragColor = u_FragColor;
            }
        `
            let p = createProgram(gl, vSource, fSource);
            callback(p.program);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.name   webgl_test_getUniformLocation_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0006
         * @tc.desc   Test getUniformLocation.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_getUniformLocation_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getUniformLocation_1] getUniformLocation");
            getUniformLocation((program) => {
                let u_FragColor = gl.getUniformLocation(program, "u_FragColor");
                expect(u_FragColor != null).assertTrue();
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_getUniformLocation_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0007
         * @tc.desc   Test getUniformLocation.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_getUniformLocation_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getUniformLocation_2] getUniformLocation");
            getUniformLocation((program) => {
                let u_FragColor = gl.getUniformLocation(program, "u_FragColor_1");
                expect(u_FragColor).assertEqual(null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_getUniformLocation_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0008
         * @tc.desc   Test getUniformLocation.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_getUniformLocation_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getUniformLocation_3] getUniformLocation");
            getUniformLocation((program) => {
                let u_FragColor = gl.getUniformLocation(program, null);
                expect(u_FragColor).assertEqual(null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        function uniform1f(callback, finish) {
            let vSource = `
            attribute vec4 a_Position;
            uniform float u_num;
            void main(){
                gl_Position = u_num * vec4(0.5, 0.5, 1, 1.0);
            }
        `;
            let fSource = `
            precision mediump float;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let u_num = gl.getUniformLocation(p.program, "u_num");
            callback(p.program, u_num);
            let uniform = gl.getUniform(p.program, u_num);
            finish(uniform);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.name   webgl_test_uniform1f
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0009
         * @tc.desc   Test uniform1f.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform1f', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform1f] uniform1f");
            let vSource = `
            attribute vec4 a_Position;
            uniform float u_num;
            void main(){
                gl_Position = u_num * vec4(0.5, 0.5, 1, 1.0);
            }
        `;
            let fSource = `
            precision mediump float;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let u_num = gl.getUniformLocation(p.program, "u_num");
            console.info("webgltest fragmentShader source :", fSource);
            console.info("webgltest uniform u_num:", u_num);
            gl.uniform1f(u_num, 0.5);
            let uniform = gl.getUniform(p.program, u_num);
            console.info("webgltest uniform u_num value:", uniform);
            expect(uniform).assertEqual(0.5);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.name   webgl_test_uniform1f_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0010
         * @tc.desc   Test uniform1f.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform1f_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform1f_1] uniform1f");
            uniform1f((program, val) => {
                gl.uniform1f(val, 0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform1f_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0011
         * @tc.desc   Test uniform1f.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform1f_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform1f_2] uniform1f");
            uniform1f((program, val) => {
                gl.uniform1f(val, null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform1f_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0012
         * @tc.desc   Test uniform1f.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform1f_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform1f_3] uniform1f");
            uniform1f((program, val) => {
                gl.uniform1f(val, undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val.toString()).assertEqual("NaN");
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform1f_4
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0013
         * @tc.desc   Test uniform1f.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform1f_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform1f_4] uniform1f");
            uniform1f((program, val) => {
                gl.uniform1f(val, "0");
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        function uniform2f(callback, finish) {
            let vSource = `
            attribute vec4 a_Position;
            uniform vec2 u_num;
            void main(){
                gl_Position.x = u_num.x;
                gl_Position.y = u_num.y;
            }
        `;
            let fSource = `
            precision mediump float;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let u_num = gl.getUniformLocation(p.program, "u_num");
            callback(u_num);
            let uniform = gl.getUniform(p.program, u_num);
            finish(uniform);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.name   webgl_test_uniform2f
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0014
         * @tc.desc   Test uniform2f.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform2f', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform2f] uniform2f");
            let vSource = `
            attribute vec4 a_Position;
            uniform vec2 u_num;
            void main(){
                gl_Position.x = u_num.x;
                gl_Position.y = u_num.y;
            }
        `;
            let fSource = `
            precision mediump float;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let u_num = gl.getUniformLocation(p.program, "u_num");
            console.info("webgltest fragmentShader source :", fSource);
            console.info("webgltest uniform u_num:", u_num);
            gl.uniform2f(u_num, 0.5, 0.5);
            console.info("webgltest gl.uniform2f(u_num,0.5,0.5);");
            let uniform = gl.getUniform(p.program, u_num);
            console.info("webgltest uniform u_num value:", uniform);
            expect(uniform[0]).assertEqual(0.5);
            expect(uniform[1]).assertEqual(0.5);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.name   webgl_test_uniform2f_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0015
         * @tc.desc   Test uniform2f.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform2f_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform2f_1] uniform2f");
            uniform2f((val) => {
                gl.uniform2f(val, 0, 0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0]).assertEqual(0);
                expect(val[1]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform2f_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0016
         * @tc.desc   Test uniform2f.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform2f_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform2f_2] uniform2f");
            uniform2f((val) => {
                gl.uniform2f(val, null, null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0]).assertEqual(0);
                expect(val[1]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform2f_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0017
         * @tc.desc   Test uniform2f.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform2f_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform2f_3] uniform2f");
            uniform2f((val) => {
                gl.uniform2f(val, undefined, undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0].toString()).assertEqual("NaN");
                expect(val[1].toString()).assertEqual("NaN");
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        function uniform3f(callback, finish) {
            let vSource = `
            attribute vec4 a_Position;
            uniform vec3 u_num;
            void main(){
                gl_Position.x = u_num.x;
                gl_Position.y = u_num.y;
                gl_Position.z = u_num.z;
            }
        `;
            let fSource = `
            precision mediump float;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let u_num = gl.getUniformLocation(p.program, "u_num");
            callback(u_num);
            let uniform = gl.getUniform(p.program, u_num);
            finish(uniform);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.name   webgl_test_uniform3f
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0018
         * @tc.desc   Test uniform3f.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform3f', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform3f] uniform3f");
            let vSource = `
            attribute vec4 a_Position;
            uniform vec3 u_num;
            void main(){
                gl_Position.x = u_num.x;
                gl_Position.y = u_num.y;
                gl_Position.z = u_num.z;
            }
        `;
            let fSource = `
            precision mediump float;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let u_num = gl.getUniformLocation(p.program, "u_num");
            console.info("webgltest fragmentShader source :", fSource);
            console.info("webgltest uniform u_num:", u_num);
            gl.uniform3f(u_num, 1.0, 0.5, 0.5);
            console.info("webgltest gl.uniform3f(u_num,1.0,0.5,0.5);");
            let uniform = gl.getUniform(p.program, u_num);
            console.info("webgltest uniform u_num value:", uniform);
            expect(uniform[0]).assertEqual(1.0);
            expect(uniform[1]).assertEqual(0.5);
            expect(uniform[2]).assertEqual(0.5);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.name   webgl_test_uniform3f_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0019
         * @tc.desc   Test uniform3f.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform3f_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform3f_1] uniform3f");
            uniform3f((val) => {
                gl.uniform3f(val, 0, 0, 0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0]).assertEqual(0);
                expect(val[1]).assertEqual(0);
                expect(val[2]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform3f_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0020
         * @tc.desc   Test uniform3f.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform3f_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform3f_2] uniform3f");
            uniform3f((val) => {
                gl.uniform3f(val, null, null, null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0]).assertEqual(0);
                expect(val[1]).assertEqual(0);
                expect(val[2]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform3f_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0021
         * @tc.desc   Test uniform3f.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform3f_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform3f_3] uniform3f");
            uniform3f((val) => {
                gl.uniform3f(val, undefined, undefined, undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0].toString()).assertEqual("NaN");
                expect(val[1].toString()).assertEqual("NaN");
                expect(val[2].toString()).assertEqual("NaN");
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        function uniform4f(callback, finish) {
            let vSource = `
            attribute vec4 a_Position;
            uniform vec4 u_num;
            void main(){
                gl_Position.x = u_num.x;
                gl_Position.y = u_num.y;
                gl_Position.z = u_num.z;
                gl_Position.w = u_num.w;
            }
        `;
            let fSource = `
            precision mediump float;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let u_num = gl.getUniformLocation(p.program, "u_num");
            callback(u_num);
            let uniform = gl.getUniform(p.program, u_num);
            finish(uniform);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.name   webgl_test_uniform4f
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0022
         * @tc.desc   Test uniform4f.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform4f', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform4f] uniform4f");
            let vSource = `
            attribute vec4 a_Position;
            uniform vec4 u_num;
            void main(){
                gl_Position.x = u_num.x;
                gl_Position.y = u_num.y;
                gl_Position.z = u_num.z;
                gl_Position.w = u_num.w;
            }
        `;
            let fSource = `
            precision mediump float;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let u_num = gl.getUniformLocation(p.program, "u_num");
            console.info("webgltest fragmentShader source :", fSource);
            console.info("webgltest uniform u_num:", u_num);
            gl.uniform4f(u_num, 1.0, 0.5, 0.5, 1.0);
            console.info("webgltest gl.uniform3f(u_num,1.0,0.5,0.5,1.0);");
            let uniform = gl.getUniform(p.program, u_num);
            console.info("webgltest uniform u_num value:", uniform);
            expect(uniform[0]).assertEqual(1.0);
            expect(uniform[1]).assertEqual(0.5);
            expect(uniform[2]).assertEqual(0.5);
            expect(uniform[3]).assertEqual(1.0);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.name   webgl_test_uniform4f_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0023
         * @tc.desc   Test uniform4f.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform4f_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform4f_1] uniform4f");
            uniform4f((val) => {
                gl.uniform4f(val, 0, 0, 0, 0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0]).assertEqual(0);
                expect(val[1]).assertEqual(0);
                expect(val[2]).assertEqual(0);
                expect(val[3]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform4f_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0024
         * @tc.desc   Test uniform4f.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform4f_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform4f_2] uniform4f");
            uniform4f((val) => {
                gl.uniform4f(val, null, null, null, null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0]).assertEqual(0);
                expect(val[1]).assertEqual(0);
                expect(val[2]).assertEqual(0);
                expect(val[3]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform4f_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0025
         * @tc.desc   Test uniform4f.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform4f_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform4f_3] uniform4f");
            uniform4f((val) => {
                gl.uniform4f(val, undefined, undefined, undefined, undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0].toString()).assertEqual("NaN");
                expect(val[1].toString()).assertEqual("NaN");
                expect(val[2].toString()).assertEqual("NaN");
                expect(val[3].toString()).assertEqual("NaN");
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        function uniform1fv(callback, finish) {
            let vSource = `
            attribute vec4 a_Position;
            uniform float u_num;
            void main(){
                gl_Position.x = u_num;
            }
        `;
            let fSource = `
            precision mediump float;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let u_num = gl.getUniformLocation(p.program, "u_num");
            callback(u_num);
            let uniform = gl.getUniform(p.program, u_num);
            finish(uniform);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.name   webgl_test_uniform1fv
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0026
         * @tc.desc   Test uniform1fv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform1fv', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform1fv] uniform1fv");
            let vSource = `
            attribute vec4 a_Position;
            uniform float u_num;
            void main(){
                gl_Position.x = u_num;
            }
        `;
            let fSource = `
            precision mediump float;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let u_num = gl.getUniformLocation(p.program, "u_num");
            console.info("webgltest fragmentShader source :", fSource);
            console.info("webgltest uniform u_num:", u_num);
            gl.uniform1fv(u_num, new Float32Array([1.0]));
            console.info("webgltest gl.uniform1fv(u_num,new Float32Array([1.0]));");
            let uniform = gl.getUniform(p.program, u_num);
            console.info("webgltest uniform u_num value:", uniform);
            expect(uniform).assertEqual(1.0);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.name   webgl_test_uniform1fv_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0027
         * @tc.desc   Test uniform1fv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform1fv_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform1fv_1] uniform1fv");
            uniform1fv((val) => {
                gl.uniform1fv(val, [0]);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform1fv_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0028
         * @tc.desc   Test uniform1fv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform1fv_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform1fv_2] uniform1fv");
            uniform1fv((val) => {
                gl.uniform1fv(val, [null]);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform1fv_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0029
         * @tc.desc   Test uniform1fv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform1fv_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform1fv_3] uniform1fv");
            uniform1fv((val) => {
                gl.uniform1fv(val, [undefined]);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val.toString()).assertEqual("NaN");
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        function uniform2fv(callback, finish) {
            let vSource = `
            attribute vec4 a_Position;
            uniform vec2 u_num;
            void main(){
                gl_Position.x = u_num.x;
                gl_Position.y = u_num.y;
            }
        `;
            let fSource = `
            precision mediump float;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `;
            let p = createProgram(gl, vSource, fSource);
            let u_num = gl.getUniformLocation(p.program, "u_num");
            callback(u_num);
            let uniform = gl.getUniform(p.program, u_num);
            finish(uniform);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.name   webgl_test_uniform2fv
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0030
         * @tc.desc   Test uniform2fv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform2fv', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform2fv] uniform2fv");
            let vSource = `
            attribute vec4 a_Position;
            uniform vec2 u_num;
            void main(){
                gl_Position.x = u_num.x;
                gl_Position.y = u_num.y;
            }
        `;
            let fSource = `
            precision mediump float;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let u_num = gl.getUniformLocation(p.program, "u_num");
            console.info("webgltest fragmentShader source :", fSource);
            console.info("webgltest uniform u_num:", u_num);
            gl.uniform2fv(u_num, new Float32Array([1.0, 1.0]));
            console.info("webgltest gl.uniform2fv(u_num,new Float32Array([1.0,1.0]));");
            let uniform = gl.getUniform(p.program, u_num);
            console.info("webgltest uniform u_num value:", uniform);
            expect(uniform[0]).assertEqual(1.0);
            expect(uniform[1]).assertEqual(1.0);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.name   webgl_test_uniform2fv_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0031
         * @tc.desc   Test uniform2fv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform2fv_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform2fv_1] uniform2fv");
            uniform2fv((val) => {
                gl.uniform2fv(val, [0, 0]);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0]).assertEqual(0);
                expect(val[1]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform2fv_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0032
         * @tc.desc   Test uniform2fv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform2fv_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform2fv_2] uniform2fv");
            uniform2fv((val) => {
                gl.uniform2fv(val, [null, null]);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0]).assertEqual(0);
                expect(val[1]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform2fv_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0033
         * @tc.desc   Test uniform2fv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform2fv_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform2fv_3] uniform2fv");
            uniform2fv((val) => {
                gl.uniform2fv(val, [undefined, undefined]);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0].toString()).assertEqual("NaN");
                expect(val[1].toString()).assertEqual("NaN");
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        function uniform3fv(callback, finish) {
            let vSource = `
            attribute vec4 a_Position;
            uniform vec3 u_num;
            void main(){
                gl_Position.x = u_num.x;
                gl_Position.y = u_num.y;
                gl_Position.z = u_num.z;
            }
        `;
            let fSource = `
            precision mediump float;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let u_num = gl.getUniformLocation(p.program, "u_num");
            callback(u_num);
            let uniform = gl.getUniform(p.program, u_num);
            finish(uniform);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.name   webgl_test_uniform3fv
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0034
         * @tc.desc   Test uniform3fv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform3fv', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform3fv] uniform3fv");
            let vSource = `
            attribute vec4 a_Position;
            uniform vec3 u_num;
            void main(){
                gl_Position.x = u_num.x;
                gl_Position.y = u_num.y;
                gl_Position.z = u_num.z;
            }
        `;
            let fSource = `
            precision mediump float;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let u_num = gl.getUniformLocation(p.program, "u_num");
            console.info("webgltest fragmentShader source :", fSource);
            console.info("webgltest uniform u_num:", u_num);
            gl.uniform3fv(u_num, new Float32Array([1.0, 1.0, 1.0]));
            console.info("webgltest gl.uniform3fv(u_num,new Float32Array([1.0,1.0,1.0]));");
            let uniform = gl.getUniform(p.program, u_num);
            console.info("webgltest uniform u_num value:", uniform);
            expect(uniform[0]).assertEqual(1.0);
            expect(uniform[1]).assertEqual(1.0);
            expect(uniform[2]).assertEqual(1.0);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.name   webgl_test_uniform3fv_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0035
         * @tc.desc   Test uniform3fv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform3fv_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform3fv_1] uniform3fv");
            uniform3fv((val) => {
                gl.uniform3fv(val, [0, 0, 0]);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0]).assertEqual(0);
                expect(val[1]).assertEqual(0);
                expect(val[2]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform3fv_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0036
         * @tc.desc   Test uniform3fv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform3fv_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform3fv_2] uniform3fv");
            uniform3fv((val) => {
                gl.uniform3fv(val, [null, null, null]);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0]).assertEqual(0);
                expect(val[1]).assertEqual(0);
                expect(val[2]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform3fv_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0037
         * @tc.desc   Test uniform3fv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform3fv_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform3fv_3] uniform3fv");
            uniform3fv((val) => {
                gl.uniform3fv(val, [undefined, undefined, undefined]);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0].toString()).assertEqual("NaN");
                expect(val[1].toString()).assertEqual("NaN");
                expect(val[2].toString()).assertEqual("NaN");
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        function uniform4fv(callback, finish) {
            let vSource = `
            attribute vec4 a_Position;
            uniform vec4 u_num;
            void main(){
                gl_Position.x = u_num.x;
                gl_Position.y = u_num.y;
                gl_Position.z = u_num.z;
                gl_Position.w = u_num.w;
            }
        `;
            let fSource = `
            precision mediump float;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let u_num = gl.getUniformLocation(p.program, "u_num");
            callback(u_num);
            let uniform = gl.getUniform(p.program, u_num);
            finish(uniform);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.name   webgl_test_uniform4fv
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0038
         * @tc.desc   Test uniform4fv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform4fv', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform4fv] uniform4fv");
            let vSource = `
            attribute vec4 a_Position;
            uniform vec4 u_num;
            void main(){
                gl_Position.x = u_num.x;
                gl_Position.y = u_num.y;
                gl_Position.z = u_num.z;
                gl_Position.w = u_num.w;
            }
        `;
            let fSource = `
            precision mediump float;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let u_num = gl.getUniformLocation(p.program, "u_num");
            console.info("webgltest fragmentShader source :", fSource);
            console.info("webgltest uniform u_num:", u_num);
            gl.uniform4fv(u_num, new Float32Array([1.0, 1.0, 1.0, 1.0]));
            console.info("webgltest gl.uniform4fv(u_num,new Float32Array([1.0,1.0,1.0,1.0]));");
            let uniform = gl.getUniform(p.program, u_num);
            console.info("webgltest uniform u_num value:", uniform);
            expect(uniform[0]).assertEqual(1.0);
            expect(uniform[1]).assertEqual(1.0);
            expect(uniform[2]).assertEqual(1.0);
            expect(uniform[3]).assertEqual(1.0);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.name   webgl_test_uniform4fv_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0039
         * @tc.desc   Test uniform4fv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform4fv_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform4fv_1] uniform4fv");
            uniform4fv((val) => {
                gl.uniform4fv(val, [0, 0, 0, 0]);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0]).assertEqual(0);
                expect(val[1]).assertEqual(0);
                expect(val[2]).assertEqual(0);
                expect(val[3]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform4fv_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0040
         * @tc.desc   Test uniform4fv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform4fv_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform4fv_2] uniform4fv");
            uniform4fv((val) => {
                gl.uniform4fv(val, [null, null, null, null]);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0]).assertEqual(0);
                expect(val[1]).assertEqual(0);
                expect(val[2]).assertEqual(0);
                expect(val[3]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform4fv_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0041
         * @tc.desc   Test uniform4fv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform4fv_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform4fv_3] uniform4fv");
            uniform4fv((val) => {
                gl.uniform4fv(val, [undefined, undefined, undefined, undefined]);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0].toString()).assertEqual("NaN");
                expect(val[1].toString()).assertEqual("NaN");
                expect(val[2].toString()).assertEqual("NaN");
                expect(val[3].toString()).assertEqual("NaN");
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        function uniform1i(callback, finish) {
            let vSource = `
            attribute vec4 a_Position;
            uniform int u_num;
            void main(){
                gl_Position.x = float(u_num);
            }
        `;
            let fSource = `
            precision mediump float;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let u_num = gl.getUniformLocation(p.program, "u_num");
            callback(u_num);
            let uniform = gl.getUniform(p.program, u_num);
            finish(uniform);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.name   webgl_test_uniform1i
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0042
         * @tc.desc   Test uniform1i.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform1i', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform1i] uniform1i");
            let vSource = `
            attribute vec4 a_Position;
            attribute vec2 a_TexCoord;
            varying vec2 v_TexCoord;
            void main(){
                gl_Position.x = 0.5;
                v_TexCoord = a_TexCoord;
            }
        `;
            let fSource = `
            precision mediump float;
            precision highp sampler2D;
            uniform sampler2D u_Sampler;
            varying vec2 v_TexCoord;
            void main(){
                gl_FragColor = texture2D(u_Sampler, v_TexCoord);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let u_Sampler = gl.getUniformLocation(p.program, "u_Sampler");
            console.info("webgltest fragmentShader source :", fSource);
            console.info("webgltest uniform u_Sampler:", u_Sampler);
            gl.uniform1i(u_Sampler, 1);
            console.info("webgltest gl.uniform1i(u_Sampler,1);");
            let uniform = gl.getUniform(p.program, u_Sampler);
            console.info("webgltest uniform u_Sampler value:", uniform);
            expect(uniform).assertEqual(1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.name   webgl_test_uniform1i_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0043
         * @tc.desc   Test uniform1i.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform1i_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform1i_1] uniform1i");
            uniform1i((val) => {
                gl.uniform1i(val, 1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val).assertEqual(1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform1i_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0044
         * @tc.desc   Test uniform1i.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform1i_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform1i_2] uniform1i");
            uniform1i((val) => {
                gl.uniform1i(val, null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform1i_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0045
         * @tc.desc   Test uniform1i.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform1i_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform1i_3] uniform1i");
            uniform1i((val) => {
                gl.uniform1i(val, undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        function uniform1iv(callback, finish) {
            let vSource = `
            attribute vec4 a_Position;
            attribute vec2 a_TexCoord;
            varying vec2 v_TexCoord;
            void main(){
                gl_Position.x = 0.5;
                v_TexCoord = a_TexCoord;
            }
        `;
            let fSource = `
            precision mediump float;
            precision highp sampler2D;
            uniform sampler2D u_Sampler;
            varying vec2 v_TexCoord;
            void main(){
                gl_FragColor = texture2D(u_Sampler, v_TexCoord);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let u_Sampler = gl.getUniformLocation(p.program, "u_Sampler");
            callback(u_Sampler);
            let uniform = gl.getUniform(p.program, u_Sampler);
            finish(uniform);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
        }


        /**
         * @tc.name   webgl_test_uniform1iv
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0046
         * @tc.desc   Test uniform1iv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform1iv', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform1iv] uniform1iv");
            let vSource = `
            attribute vec4 a_Position;
            attribute vec2 a_TexCoord;
            varying vec2 v_TexCoord;
            void main(){
                gl_Position.x = 0.5;
                v_TexCoord = a_TexCoord;
            }
        `;
            let fSource = `
            precision mediump float;
            precision highp sampler2D;
            uniform sampler2D u_Sampler;
            varying vec2 v_TexCoord;
            void main(){
                gl_FragColor = texture2D(u_Sampler, v_TexCoord);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let u_Sampler = gl.getUniformLocation(p.program, "u_Sampler");
            console.info("webgltest fragmentShader source :", fSource);
            console.info("webgltest uniform u_Sampler:", u_Sampler);
            gl.uniform1iv(u_Sampler, new Int32Array([1]));
            console.info("webgltest gl.uniform1iv(u_Sampler,new Int32Array([1]));");
            let uniform = gl.getUniform(p.program, u_Sampler);
            console.info("webgltest uniform u_Sampler value:", uniform);
            expect(uniform).assertEqual(1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.name   webgl_test_uniform1iv_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0047
         * @tc.desc   Test uniform1iv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform1iv_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform1iv_1] uniform1iv");
            uniform1iv((val) => {
                gl.uniform1iv(val, [1]);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val).assertEqual(1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform1iv_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0048
         * @tc.desc   Test uniform1iv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform1iv_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform1iv_2] uniform1iv");
            uniform1iv((val) => {
                gl.uniform1iv(val, [null]);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform1iv_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0049
         * @tc.desc   Test uniform1iv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform1iv_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform1iv_3] uniform1iv");
            uniform1iv((val) => {
                gl.uniform1iv(val, [undefined]);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        function uniform2iv(callback, finish) {
            let vSource = `
            uniform ivec2 a_Position;
            void main(){
                gl_Position.x = float(a_Position.x);
                gl_Position.y = float(a_Position.y);
            }
        `;
            let fSource = `
            precision mediump float;
            precision highp sampler2D;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let a_Position = gl.getUniformLocation(p.program, "a_Position");
            callback(a_Position);
            let uniform = gl.getUniform(p.program, a_Position);
            finish(uniform);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.name   webgl_test_uniform2iv
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0050
         * @tc.desc   Test uniform2iv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform2iv', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform2iv] uniform2iv");
            let vSource = `
            uniform ivec2 a_Position;
            void main(){
                gl_Position.x = float(a_Position.x);
                gl_Position.y = float(a_Position.y);
            }
        `;
            let fSource = `
            precision mediump float;
            precision highp sampler2D;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let a_Position = gl.getUniformLocation(p.program, "a_Position");
            console.info("webgltest fragmentShader source :", vSource);
            console.info("webgltest uniform u_Sampler:", a_Position);
            gl.uniform2iv(a_Position, new Int32Array([1, 1]));
            console.info("webgltest gl.uniform2iv(a_Position,new Int32Array([1,1]));");
            let uniform = gl.getUniform(p.program, a_Position);
            console.info("webgltest uniform u_Sampler value:", uniform);
            expect(uniform[0]).assertEqual(1);
            expect(uniform[1]).assertEqual(1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.name   webgl_test_uniform2iv_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0051
         * @tc.desc   Test uniform2iv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform2iv_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform2iv_1] uniform2iv");
            uniform2iv((val) => {
                gl.uniform2iv(val, [1, 1]);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0]).assertEqual(1);
                expect(val[1]).assertEqual(1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform2iv_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0052
         * @tc.desc   Test uniform2iv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform2iv_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform2iv_2] uniform2iv");
            uniform2iv((val) => {
                gl.uniform2iv(val, [null, null]);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0]).assertEqual(0);
                expect(val[1]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform2iv_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0053
         * @tc.desc   Test uniform2iv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform2iv_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform2iv_3] uniform2iv");
            uniform2iv((val) => {
                gl.uniform2iv(val, [undefined, undefined]);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0]).assertEqual(0);
                expect(val[1]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        function uniform3iv(callback, finish) {
            let vSource = `
            uniform ivec3 a_Position;
            void main(){
                gl_Position.x = float(a_Position.x);
                gl_Position.y = float(a_Position.y);
                gl_Position.z = float(a_Position.z);
            }
        `;
            let fSource = `
            precision mediump float;
            precision highp sampler2D;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let a_Position = gl.getUniformLocation(p.program, "a_Position");
            callback(a_Position);
            let uniform = gl.getUniform(p.program, a_Position);
            finish(uniform);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.name   webgl_test_uniform3iv
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0054
         * @tc.desc   Test uniform3iv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform3iv', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform3iv] uniform3iv");
            let vSource = `
            uniform ivec3 a_Position1;
            uniform ivec3 a_Position2;
            void main(){
                gl_Position.x = float(a_Position1.x + a_Position2.x);
                gl_Position.y = float(a_Position1.y + a_Position2.y);
                gl_Position.z = float(a_Position1.z + a_Position2.z);
            }
        `;
            let fSource = `
            precision mediump float;
            precision highp sampler2D;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let a_Position1 = gl.getUniformLocation(p.program, "a_Position1");
            let a_Position2 = gl.getUniformLocation(p.program, "a_Position2");
            console.info("webgltest fragmentShader source :", vSource);
            console.info("webgltest uniform u_Sampler:", a_Position1,a_Position2);
            gl.uniform3iv(a_Position1, new Int32Array([1, 1, 1]));
            gl.uniform3iv(a_Position2, new Int32Array([2, 2, 2]));
            console.info("webgltest gl.uniform3iv(a_Position1,new Int32Array([1,1,1]));");
            console.info("webgltest gl.uniform3iv(a_Position2,new Int32Array([2,2,2]));");
            let uniform1 = gl.getUniform(p.program, a_Position1);
            let uniform2 = gl.getUniform(p.program, a_Position2);
            console.info("webgltest uniform1 value:", uniform1);
            console.info("webgltest uniform2 value:", uniform2);
            expect(uniform1[0]).assertEqual(1);
            expect(uniform1[1]).assertEqual(1);
            expect(uniform1[2]).assertEqual(1);
            expect(uniform2[0]).assertEqual(2);
            expect(uniform2[1]).assertEqual(2);
            expect(uniform2[2]).assertEqual(2);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.name   webgl_test_uniform3iv_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0055
         * @tc.desc   Test uniform3iv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform3iv_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform3iv_1] uniform3iv");
            uniform3iv((val) => {
                gl.uniform3iv(val, [1, 1, 1]);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0]).assertEqual(1);
                expect(val[1]).assertEqual(1);
                expect(val[2]).assertEqual(1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform3iv_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0056
         * @tc.desc   Test uniform3iv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform3iv_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform3iv_2] uniform3iv");
            uniform3iv((val) => {
                gl.uniform3iv(val, [null, null, null]);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0]).assertEqual(0);
                expect(val[1]).assertEqual(0);
                expect(val[2]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform3iv_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0057
         * @tc.desc   Test uniform3iv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform3iv_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform3iv_3] uniform3iv");
            uniform3iv((val) => {
                gl.uniform3iv(val, [undefined, undefined, undefined]);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0]).assertEqual(0);
                expect(val[1]).assertEqual(0);
                expect(val[2]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        function uniform4iv(callback, finish) {
            let vSource = `
            uniform ivec4 a_Position;
            void main(){
                gl_Position.x = float(a_Position.x);
                gl_Position.y = float(a_Position.y);
                gl_Position.z = float(a_Position.z);
                gl_Position.w = float(a_Position.w);
            }
        `;
            let fSource = `
            precision mediump float;
            precision highp sampler2D;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let a_Position = gl.getUniformLocation(p.program, "a_Position");
            callback(a_Position);
            let uniform = gl.getUniform(p.program, a_Position);
            finish(uniform);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.name   webgl_test_uniform4iv
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0058
         * @tc.desc   Test uniform4iv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform4iv', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform4iv] uniform4iv");
            let vSource = `
            uniform ivec4 a_Position;
            void main(){
                gl_Position.x = float(a_Position.x);
                gl_Position.y = float(a_Position.y);
                gl_Position.z = float(a_Position.z);
                gl_Position.w = float(a_Position.w);
            }
        `;
            let fSource = `
            precision mediump float;
            precision highp sampler2D;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let a_Position = gl.getUniformLocation(p.program, "a_Position");
            console.info("webgltest fragmentShader source :", vSource);
            console.info("webgltest uniform u_Sampler:", a_Position);
            gl.uniform4iv(a_Position, new Int32Array([1, 1, 1, 1]));
            console.info("webgltest gl.uniform4iv(a_Position,new Int32Array([1,1,1,1]));");
            let uniform = gl.getUniform(p.program, a_Position);
            console.info("webgltest uniform u_Sampler value:", uniform);
            expect(uniform[0]).assertEqual(1);
            expect(uniform[1]).assertEqual(1);
            expect(uniform[2]).assertEqual(1);
            expect(uniform[3]).assertEqual(1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.name   webgl_test_uniform4iv_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0059
         * @tc.desc   Test uniform4iv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform4iv_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform4iv_1] uniform4iv");
            uniform4iv((val) => {
                gl.uniform4iv(val, [1, 1, 1, 1]);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0]).assertEqual(1);
                expect(val[1]).assertEqual(1);
                expect(val[2]).assertEqual(1);
                expect(val[3]).assertEqual(1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform4iv_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0060
         * @tc.desc   Test uniform4iv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform4iv_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform4iv_2] uniform4iv");
            uniform4iv((val) => {
                gl.uniform4iv(val, [null, null, null, null]);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0]).assertEqual(0);
                expect(val[1]).assertEqual(0);
                expect(val[2]).assertEqual(0);
                expect(val[3]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform4iv_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0061
         * @tc.desc   Test uniform4iv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform4iv_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform4iv_3] uniform4iv");
            uniform4iv((val) => {
                gl.uniform4iv(val, [undefined, undefined, undefined, undefined]);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0]).assertEqual(0);
                expect(val[1]).assertEqual(0);
                expect(val[2]).assertEqual(0);
                expect(val[3]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        function uniform2i(callback, finish) {
            let vSource = `
            uniform ivec2 a_Position;
            void main(){
                gl_Position.x = float(a_Position.x);
                gl_Position.y = float(a_Position.y);
            }
        `;
            let fSource = `
            precision mediump float;
            precision highp sampler2D;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let a_Position = gl.getUniformLocation(p.program, "a_Position");
            callback(a_Position);
            let uniform = gl.getUniform(p.program, a_Position);
            finish(uniform);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.name   webgl_test_uniform2i
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0062
         * @tc.desc   Test uniform2i.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform2i', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform2i] uniform2i");
            let vSource = `
            uniform ivec2 a_Position;
            void main(){
                gl_Position.x = float(a_Position.x);
                gl_Position.y = float(a_Position.y);
            }
        `;
            let fSource = `
            precision mediump float;
            precision highp sampler2D;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let a_Position = gl.getUniformLocation(p.program, "a_Position");
            console.info("webgltest fragmentShader source :", vSource);
            console.info("webgltest uniform u_Sampler:", a_Position);
            gl.uniform2i(a_Position, 1, 1);
            console.info("webgltest gl.uniform2i(u_Sampler,1,1);");
            let uniform = gl.getUniform(p.program, a_Position);
            console.info("webgltest uniform u_Sampler value:", uniform);
            expect(uniform[0]).assertEqual(1);
            expect(uniform[1]).assertEqual(1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.name   webgl_test_uniform2i_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0063
         * @tc.desc   Test uniform2i.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform2i_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform2i_1] uniform2i");
            uniform2i((val) => {
                gl.uniform2i(val, 1, 1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0]).assertEqual(1);
                expect(val[1]).assertEqual(1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform2i_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0064
         * @tc.desc   Test uniform2i.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform2i_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform2i_2] uniform2i");
            uniform2i((val) => {
                gl.uniform2i(val, null, null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0]).assertEqual(0);
                expect(val[1]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform2i_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0065
         * @tc.desc   Test uniform2i.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform2i_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform2i_3] uniform2i");
            uniform2i((val) => {
                gl.uniform2i(val, undefined, undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0]).assertEqual(0);
                expect(val[1]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        function uniform3i(callback, finish) {
            let vSource = `
            uniform ivec3 a_Position;
            void main(){
                gl_Position.x = float(a_Position.x);
                gl_Position.y = float(a_Position.y);
                gl_Position.z = float(a_Position.z);
            }
        `;
            let fSource = `
            precision mediump float;
            precision highp sampler2D;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let a_Position = gl.getUniformLocation(p.program, "a_Position");
            callback(a_Position);
            let uniform = gl.getUniform(p.program, a_Position);
            finish(uniform);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.name   webgl_test_uniform3i
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0066
         * @tc.desc   Test uniform3i.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform3i', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform3i] uniform3i");
            let vSource = `
            uniform ivec3 a_Position;
            void main(){
                gl_Position.x = float(a_Position.x);
                gl_Position.y = float(a_Position.y);
                gl_Position.z = float(a_Position.z);
            }
        `;
            let fSource = `
            precision mediump float;
            precision highp sampler2D;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let a_Position = gl.getUniformLocation(p.program, "a_Position");
            console.info("webgltest fragmentShader source :", vSource);
            console.info("webgltest uniform u_Sampler:", a_Position);
            gl.uniform3i(a_Position, 1, 1, 1);
            console.info("webgltest gl.uniform3i(a_Position,1,1,1);");
            let uniform = gl.getUniform(p.program, a_Position);
            console.info("webgltest uniform u_Sampler value:", uniform);
            expect(uniform[0]).assertEqual(1);
            expect(uniform[1]).assertEqual(1);
            expect(uniform[2]).assertEqual(1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.name   webgl_test_uniform3i_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0067
         * @tc.desc   Test uniform3i.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform3i_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform3i_1] uniform3i");
            uniform3i((val) => {
                gl.uniform3i(val, 1, 1, 1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0]).assertEqual(1);
                expect(val[1]).assertEqual(1);
                expect(val[2]).assertEqual(1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform3i_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0068
         * @tc.desc   Test uniform3i.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform3i_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform3i_2] uniform3i");
            uniform3i((val) => {
                gl.uniform3i(val, null, null, null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0]).assertEqual(0);
                expect(val[1]).assertEqual(0);
                expect(val[2]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform3i_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0069
         * @tc.desc   Test uniform3i.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform3i_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform3i_3] uniform3i");
            uniform3i((val) => {
                gl.uniform3i(val, undefined, undefined, undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0]).assertEqual(0);
                expect(val[1]).assertEqual(0);
                expect(val[2]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        function uniform4i(callback, finish) {
            let vSource = `
            uniform ivec4 a_Position;
            void main(){
                gl_Position.x = float(a_Position.x);
                gl_Position.y = float(a_Position.y);
                gl_Position.z = float(a_Position.z);
                gl_Position.w = float(a_Position.w);
            }
        `;
            let fSource = `
            precision mediump float;
            precision highp sampler2D;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let a_Position = gl.getUniformLocation(p.program, "a_Position");
            callback(a_Position);
            let uniform = gl.getUniform(p.program, a_Position);
            finish(uniform);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.name   webgl_test_uniform4i
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0070
         * @tc.desc   Test uniform4i.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform4i', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform4i] uniform4i");
            let vSource = `
            uniform ivec4 a_Position;
            void main(){
                gl_Position.x = float(a_Position.x);
                gl_Position.y = float(a_Position.y);
                gl_Position.z = float(a_Position.z);
                gl_Position.w = float(a_Position.w);
            }
        `;
            let fSource = `
            precision mediump float;
            precision highp sampler2D;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            let a_Position = gl.getUniformLocation(p.program, "a_Position");
            console.info("webgltest fragmentShader source :", vSource);
            console.info("webgltest uniform u_Sampler:", a_Position);
            gl.uniform4i(a_Position, 1, 1, 1, 1);
            console.info("webgltest gl.uniform4i(a_Position,1,1,1,1);");
            let uniform = gl.getUniform(p.program, a_Position);
            console.info("webgltest uniform u_Sampler value:", uniform);
            expect(uniform[0]).assertEqual(1);
            expect(uniform[1]).assertEqual(1);
            expect(uniform[2]).assertEqual(1);
            expect(uniform[3]).assertEqual(1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.name   webgl_test_uniform4i_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0071
         * @tc.desc   Test uniform4i.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform4i_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform4i_1] uniform4i");
            uniform4i((val) => {
                gl.uniform4i(val, 1, 1, 1, 1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0]).assertEqual(1);
                expect(val[1]).assertEqual(1);
                expect(val[2]).assertEqual(1);
                expect(val[3]).assertEqual(1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform4i_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0072
         * @tc.desc   Test uniform4i.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform4i_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform4i_2] uniform4i");
            uniform4i((val) => {
                gl.uniform4i(val, null, null, null, null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0]).assertEqual(0);
                expect(val[1]).assertEqual(0);
                expect(val[2]).assertEqual(0);
                expect(val[3]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniform4i_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0073
         * @tc.desc   Test uniform4i.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniform4i_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniform4i_3] uniform4i");
            uniform4i((val) => {
                gl.uniform4i(val, undefined, undefined, undefined, undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                expect(val[0]).assertEqual(0);
                expect(val[1]).assertEqual(0);
                expect(val[2]).assertEqual(0);
                expect(val[3]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_getUniform
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0074
         * @tc.desc   Test getUniform.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_getUniform', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_getUniform] getUniform");
            let vSource = `
            attribute vec4 a_Position;
            void main() {
                gl_Position = a_Position;
            }
            `;
            let fSource = `
            precision mediump float;
            uniform vec4 u_FragColor;
            void main() {
                gl_FragColor = u_FragColor;
            }
            `;
            let p = createProgram(gl, vSource, fSource);
            let a_Position = gl.getAttribLocation(p.program, "a_Position");
            let u_FragColor = gl.getUniformLocation(p.program, "u_FragColor");
            console.info("webgltest gl.uniform4f(u_FragColor, 1.0, 0.5, 0.5, 1.0);");
            gl.uniform4f(u_FragColor, 1.0, 0.5, 0.5, 1.0);
            let value = gl.getUniform(p.program, u_FragColor);
            console.info("webgltest u_FragColor:", u_FragColor, value);
            expect(value[0]).assertEqual(1.0);
            expect(value[1]).assertEqual(0.5);
            expect(value[2]).assertEqual(0.5);
            expect(value[3]).assertEqual(1.0);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })

        function uniformMatrix4fv(callback, finish) {
            let vSource = `
            attribute vec4 a_Position;
            uniform mat4 u_MvpMatrix;
            void main() {
                gl_Position = u_MvpMatrix *a_Position;
            }
            `;
            let fSource = `
            precision mediump float;
            uniform vec4 u_FragColor;
            void main() {
                gl_FragColor = u_FragColor;
            }
            `;
            let p = createProgram(gl, vSource, fSource);
            let u_MvpMatrix = gl.getUniformLocation(p.program, "u_MvpMatrix");
            callback(u_MvpMatrix);
            let value = gl.getUniform(p.program, u_MvpMatrix);
            finish(value);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.name   webgl_test_uniformMatrix4fv
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0075
         * @tc.desc   Test uniformMatrix4fv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniformMatrix4fv', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniformMatrix4fv] uniformMatrix4fv");
            let vSource = `
            attribute vec4 a_Position;
            uniform mat4 u_MvpMatrix;
            void main() {
                gl_Position = u_MvpMatrix *a_Position;
            }
            `;
            let fSource = `
            precision mediump float;
            uniform vec4 u_FragColor;
            void main() {
                gl_FragColor = u_FragColor;
            }
            `;
            let p = createProgram(gl, vSource, fSource);
            let u_MvpMatrix = gl.getUniformLocation(p.program, "u_MvpMatrix");
            gl.uniformMatrix4fv(u_MvpMatrix, false, new Float32Array([
                3.4, -0.5, -0.3, -0.3,
                0, 3.4, -0.3, -0.3,
                -1.4, -1.2, -0.8, -0.8,
                -0.4, -0.5, 6.3, 8.1
            ]));
            checkError(gl);
            let value = gl.getUniform(p.program, u_MvpMatrix);
            console.info("webgltest u_MvpMatrix:", u_MvpMatrix, JSON.stringify(value));
            expect(parseFloat(value[0].toFixed(2))).assertEqual(3.4);
            expect(parseFloat(value[1].toFixed(2))).assertEqual(-0.5);
            expect(parseFloat(value[2].toFixed(2))).assertEqual(-0.3);
            expect(parseFloat(value[3].toFixed(2))).assertEqual(-0.3);
            expect(parseFloat(value[4].toFixed(2))).assertEqual(0);
            expect(parseFloat(value[5].toFixed(2))).assertEqual(3.4);
            expect(parseFloat(value[6].toFixed(2))).assertEqual(-0.3);
            expect(parseFloat(value[7].toFixed(2))).assertEqual(-0.3);
            expect(parseFloat(value[8].toFixed(2))).assertEqual(-1.4);
            expect(parseFloat(value[9].toFixed(2))).assertEqual(-1.2);
            expect(parseFloat(value[10].toFixed(2))).assertEqual(-0.8);
            expect(parseFloat(value[11].toFixed(2))).assertEqual(-0.8);
            expect(parseFloat(value[12].toFixed(2))).assertEqual(-0.4);
            expect(parseFloat(value[13].toFixed(2))).assertEqual(-0.5);
            expect(parseFloat(value[14].toFixed(2))).assertEqual(6.3);
            expect(parseFloat(value[15].toFixed(2))).assertEqual(8.1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.name   webgl_test_uniformMatrix4fv_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0076
         * @tc.desc   Test uniformMatrix4fv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniformMatrix4fv_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniformMatrix4fv_1] uniformMatrix4fv");
            uniformMatrix4fv((val) => {
                gl.uniformMatrix4fv(val, false, [
                    0.0, 0.0, 0.0, 0.0,
                    0.0, 0.0, 0.0, 0.0,
                    0.0, 0.0, 0.0, 0.0,
                    0.0, 0.0, 0.0, 0.0
                ]);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                for (let i = 0; i < 15; i++) {
                    expect(val[i]).assertEqual(0);
                }
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniformMatrix4fv_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0077
         * @tc.desc   Test uniformMatrix4fv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniformMatrix4fv_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniformMatrix4fv_2] uniformMatrix4fv");
            uniformMatrix4fv((val) => {
                gl.uniformMatrix4fv(val, false, [
                    0.0, 0.0, 0.0, 0.0,
                    0.0, 0.0, 0.0, 0.0,
                    0.0, 0.0, 0.0, 0.0
                ]);
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            }, val => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniformMatrix4fv_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0078
         * @tc.desc   Test uniformMatrix4fv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniformMatrix4fv_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniformMatrix4fv_3] uniformMatrix4fv");
            uniformMatrix4fv((val) => {
                gl.uniformMatrix4fv(val, false, [
                    null, null, null, null,
                    null, null, null, null,
                    null, null, null, null,
                    null, null, null, null
                ]);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                for (let i = 0; i < 15; i++) {
                    expect(val[i]).assertEqual(0);
                }
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        function uniformMatrix3fv(callback, finish) {
            let vSource = `
            attribute vec2 a_Position;
            uniform mat3 u_MvpMatrix;
            void main() {
                gl_Position = vec4(
                    (u_MvpMatrix * vec3(a_Position, 1)).xy, 0, 1
                );
            }
            `;
            let fSource = `
            precision mediump float;
            void main() {
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
            `;
            let p = createProgram(gl, vSource, fSource);
            let u_MvpMatrix = gl.getUniformLocation(p.program, "u_MvpMatrix");
            callback(u_MvpMatrix);
            let value = gl.getUniform(p.program, u_MvpMatrix);
            finish(value);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.name   webgl_test_uniformMatrix3fv
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0079
         * @tc.desc   Test uniformMatrix3fv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniformMatrix3fv', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniformMatrix3fv] uniformMatrix3fv");
            let vSource = `
            attribute vec2 a_Position;
            uniform mat3 u_MvpMatrix;
            void main() {
                gl_Position = vec4(
                    (u_MvpMatrix * vec3(a_Position, 1)).xy, 0, 1
                );
            }
            `;
            let fSource = `
            precision mediump float;
            void main() {
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
            `;
            let p = createProgram(gl, vSource, fSource);
            let u_MvpMatrix = gl.getUniformLocation(p.program, "u_MvpMatrix");
            gl.uniformMatrix3fv(u_MvpMatrix, false, new Float32Array([
                3.4, -0.5, -0.3,
                0, 3.4, -0.3,
                -1.4, -1.2, -0.8,
            ]));
            let value = gl.getUniform(p.program, u_MvpMatrix);
            console.info("webgltest u_MvpMatrix:", u_MvpMatrix, JSON.stringify(value));
            expect(parseFloat(value[0].toFixed(2))).assertEqual(3.4);
            expect(parseFloat(value[1].toFixed(2))).assertEqual(-0.5);
            expect(parseFloat(value[2].toFixed(2))).assertEqual(-0.3);
            expect(parseFloat(value[3].toFixed(2))).assertEqual(0);
            expect(parseFloat(value[4].toFixed(2))).assertEqual(3.4);
            expect(parseFloat(value[5].toFixed(2))).assertEqual(-0.3);
            expect(parseFloat(value[6].toFixed(2))).assertEqual(-1.4);
            expect(parseFloat(value[7].toFixed(2))).assertEqual(-1.2);
            expect(parseFloat(value[8].toFixed(2))).assertEqual(-0.8);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.name   webgl_test_uniformMatrix3fv_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0080
         * @tc.desc   Test uniformMatrix3fv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniformMatrix3fv_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniformMatrix3fv_1] uniformMatrix3fv");
            uniformMatrix3fv((val) => {
                gl.uniformMatrix3fv(val, false, [
                    0.0, 0.0, 0.0,
                    0.0, 0.0, 0.0,
                    0.0, 0.0, 0.0
                ]);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                for (let i = 0; i < 8; i++) {
                    expect(val[i]).assertEqual(0);
                }
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniformMatrix3fv_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0081
         * @tc.desc   Test uniformMatrix3fv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniformMatrix3fv_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniformMatrix3fv_2] uniformMatrix3fv");
            uniformMatrix3fv((val) => {
                gl.uniformMatrix3fv(val, false, [
                    0.0, 0.0, 0.0,
                    0.0, 0.0, 0.0
                ]);
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            }, val => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniformMatrix3fv_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0082
         * @tc.desc   Test uniformMatrix3fv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniformMatrix3fv_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniformMatrix3fv_3] uniformMatrix3fv");
            uniformMatrix3fv((val) => {
                gl.uniformMatrix3fv(val, false, [
                    null, null, null,
                    null, null, null,
                    null, null, null
                ]);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                for (let i = 0; i < 8; i++) {
                    expect(val[i]).assertEqual(0);
                }
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        function uniformMatrix2fv(callback, finish) {
            let vSource = `
            attribute vec2 a_Position;
            uniform mat2 u_MvpMatrix;
            void main() {
                gl_Position = vec4(
                    (u_MvpMatrix * vec2(a_Position.x,a_Position.y)).xy, 0, 1
                );
            }
            `;
            let fSource = `
            precision mediump float;
            void main() {
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
            `;
            let p = createProgram(gl, vSource, fSource);
            let u_MvpMatrix = gl.getUniformLocation(p.program, "u_MvpMatrix");
            callback(u_MvpMatrix);
            let value = gl.getUniform(p.program, u_MvpMatrix);
            finish(value);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.name   webgl_test_uniformMatrix2fv
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0083
         * @tc.desc   Test uniformMatrix2fv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniformMatrix2fv', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniformMatrix2fv] uniformMatrix2fv");
            let vSource = `
            attribute vec2 a_Position;
            uniform mat2 u_MvpMatrix;
            void main() {
                gl_Position = vec4(
                    (u_MvpMatrix * vec2(a_Position.x,a_Position.y)).xy, 0, 1
                );
            }
            `;
            let fSource = `
            precision mediump float;
            void main() {
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
            `;
            let p = createProgram(gl, vSource, fSource);
            let u_MvpMatrix = gl.getUniformLocation(p.program, "u_MvpMatrix");
            gl.uniformMatrix2fv(u_MvpMatrix, false, new Float32Array([
                3.4, -0.5,
                0, 3.4,
            ]));
            let value = gl.getUniform(p.program, u_MvpMatrix);
            console.info("webgltest u_MvpMatrix:", u_MvpMatrix, JSON.stringify(value));
            expect(parseFloat(value[0].toFixed(2))).assertEqual(3.4);
            expect(parseFloat(value[1].toFixed(2))).assertEqual(-0.5);
            expect(parseFloat(value[2].toFixed(2))).assertEqual(0);
            expect(parseFloat(value[3].toFixed(2))).assertEqual(3.4);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.name   webgl_test_uniformMatrix2fv_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0084
         * @tc.desc   Test uniformMatrix2fv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniformMatrix2fv_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniformMatrix2fv_1] uniformMatrix2fv");
            uniformMatrix2fv((val) => {
                gl.uniformMatrix2fv(val, false, [
                    0.0, 0.0,
                    0.0, 0.0
                ]);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                for (let i = 0; i < 3; i++) {
                    expect(val[i]).assertEqual(0);
                }
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniformMatrix2fv_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0085
         * @tc.desc   Test uniformMatrix2fv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniformMatrix2fv_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniformMatrix2fv_2] uniformMatrix2fv");
            uniformMatrix2fv((val) => {
                gl.uniformMatrix2fv(val, false, [
                    0.0, 0.0,
                    0.0
                ]);
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            }, val => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_uniformMatrix2fv_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_UNIFORM_0086
         * @tc.desc   Test uniformMatrix2fv.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_uniformMatrix2fv_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_uniformMatrix2fv_3] uniformMatrix2fv");
            uniformMatrix2fv((val) => {
                gl.uniformMatrix2fv(val, false, [
                    null, null,
                    null, null
                ]);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, val => {
                for (let i = 0; i < 3; i++) {
                    expect(val[i]).assertEqual(0);
                }
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })
    })
}
