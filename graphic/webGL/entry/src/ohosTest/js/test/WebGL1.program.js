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


export default function webgl1_program() {
    
	describe('webgl1_program', function () {
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

        let VERTEX_SOURCE_DEMO = `
            attribute vec4 a_Position;
            attribute float a_PointSize;
            void main(){
                gl_Position = a_Position;
                gl_PointSize = a_PointSize;
            }
        `;
        let FRAGMENT_SOURCE_DEMO = `
            precision mediump float;
            uniform vec4 u_FragColor;
            void main(){
                gl_FragColor = u_FragColor;
            }
        `;
        let initShader = (gl, type, source) => {
            let shader = gl.createShader(type); // 创建顶点着色器
            if (shader == null) {
                console.log('unable to create shader');
                return null;
            }
            gl.shaderSource(shader, source); // 设置着色器代码
            gl.compileShader(shader); // 编译
            let shaderParameter = gl.getShaderParameter(shader, gl.COMPILE_STATUS);
            if (!shaderParameter) { // 如果编译失败
                let error = gl.getShaderInfoLog(shader);
                console.log('failed to compile shader: ' + error);
                gl.deleteShader(shader); // 删除着色器
                return null;
            }
            return shader;
        }

        /**
         * @tc.name   webgl_test_createProgram
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_PROGRAM_0001
         * @tc.desc   Test createProgram.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_createProgram', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_createProgram] createProgram");
            let program = gl.createProgram();
            console.info("webgltest program:", program);
            expect(program != null).assertTrue();
            console.log("webgltest isProgram:", gl.isProgram(program));
            expect(gl.isProgram(program)).assertEqual(true);
            console.log("webgltest delete program");
            gl.deleteProgram(program)
            console.log("webgltest isProgram:", gl.isProgram(program));
            expect(gl.isProgram(program)).assertEqual(false);
            checkError(gl);
            done();
        })

        function deleteProgram(callback, finish) {
            let program = gl.createProgram();
            expect(program != null).assertTrue();
            callback(program);
            finish(gl.isProgram(program));
        }


        /**
         * @tc.name   webgl_test_deleteProgram
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_PROGRAM_0002
         * @tc.desc   Test deleteProgram.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_deleteProgram', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_deleteProgram] deleteProgram");
            let program = gl.createProgram();
            console.info("webgltest program:", program);
            expect(program != null).assertTrue();
            console.log("webgltest isProgram:", gl.isProgram(program));
            expect(gl.isProgram(program)).assertEqual(true);
            console.log("webgltest delete program");
            gl.deleteProgram(program)
            console.log("webgltest isProgram:", gl.isProgram(program));
            expect(gl.isProgram(program)).assertEqual(false);
            checkError(gl);
            done();
        })


        /**
         * @tc.name   webgl_test_deleteProgram_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_PROGRAM_0003
         * @tc.desc   Test deleteProgram.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_deleteProgram_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_deleteProgram_1] deleteProgram");
            deleteProgram((program) => {
                gl.deleteProgram(null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_deleteProgram_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_PROGRAM_0004
         * @tc.desc   Test deleteProgram.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_deleteProgram_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_deleteProgram_2] deleteProgram");
            deleteProgram((program) => {
                gl.deleteProgram(undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        function isProgram(callback, finish) {
            let program = gl.createProgram();
            callback(program);
            gl.deleteProgram(program)
            finish(gl.isProgram(program));
        }


        /**
         * @tc.name   webgl_test_isProgram
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_PROGRAM_0005
         * @tc.desc   Test isProgram.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_isProgram', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_isProgram] isProgram");
            let program = gl.createProgram();
            console.log("webgltest isProgram:", gl.isProgram(program));
            expect(gl.isProgram(program)).assertEqual(true);
            console.log("webgltest delete program");
            gl.deleteProgram(program)
            console.log("webgltest isProgram:", gl.isProgram(program));
            expect(gl.isProgram(program)).assertEqual(false);
            checkError(gl);
            done();
        })


        /**
         * @tc.name   webgl_test_isProgram_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_PROGRAM_0006
         * @tc.desc   Test isProgram.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_isProgram_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_isProgram_1] isProgram");
            isProgram((program) => {
                gl.isProgram(null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_isProgram_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_PROGRAM_0007
         * @tc.desc   Test isProgram.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_isProgram_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_isProgram_2] isProgram");
            isProgram((program) => {
                gl.isProgram(undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        /**
         * @tc.name   webgl_test_linkProgram
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_PROGRAM_0008
         * @tc.desc   Test linkProgram.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_linkProgram', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_linkProgram] linkProgram");
            let program = gl.createProgram();
            let vShader = initShader(gl, gl.VERTEX_SHADER, VERTEX_SOURCE_DEMO);
            let fShader = initShader(gl, gl.FRAGMENT_SHADER, FRAGMENT_SOURCE_DEMO);
            gl.attachShader(program, vShader);
            gl.attachShader(program, fShader);
            console.info("webgl test LINK_STATUS:", gl.getProgramParameter(program, gl.LINK_STATUS));
            expect(gl.getProgramParameter(program, gl.LINK_STATUS)).assertEqual(false);
            console.info("webgl test linkProgram..");
            gl.linkProgram(program);
            console.info("webgl test LINK_STATUS:", gl.getProgramParameter(program, gl.LINK_STATUS));
            expect(gl.getProgramParameter(program, gl.LINK_STATUS)).assertEqual(true);
            gl.deleteShader(vShader);
            gl.deleteShader(fShader);
            gl.deleteProgram(program);
            checkError(gl);
            done();
        })

        function getProgramParameter(callback, finish) {
            let program = gl.createProgram();
            let vShader = initShader(gl, gl.VERTEX_SHADER, VERTEX_SOURCE_DEMO);
            let fShader = initShader(gl, gl.FRAGMENT_SHADER, FRAGMENT_SOURCE_DEMO);
            gl.attachShader(program, vShader);
            gl.attachShader(program, fShader);
            callback(program)
            finish()
            gl.deleteShader(vShader);
            gl.deleteShader(fShader);
            gl.deleteProgram(program);
        }


        /**
         * @tc.name   webgl_test_getProgramParameter
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_PROGRAM_0009
         * @tc.desc   Test getProgramParameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_getProgramParameter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getProgramParameter] getProgramParameter");
            let program = gl.createProgram();
            let vShader = initShader(gl, gl.VERTEX_SHADER, VERTEX_SOURCE_DEMO);
            let fShader = initShader(gl, gl.FRAGMENT_SHADER, FRAGMENT_SOURCE_DEMO);
            gl.attachShader(program, vShader);
            gl.attachShader(program, fShader);
            console.info("webgltest LINK_STATUS:", gl.getProgramParameter(program, gl.LINK_STATUS));
            expect(gl.getProgramParameter(program, gl.LINK_STATUS)).assertEqual(false);
            console.info("webgltest gl.linkProgram(program);");
            gl.linkProgram(program);
            console.info("webgltest LINK_STATUS:", gl.getProgramParameter(program, gl.LINK_STATUS));
            expect(gl.getProgramParameter(program, gl.LINK_STATUS)).assertTrue();
            console.info("webgl test DELETE_STATUS:", gl.getProgramParameter(program, gl.DELETE_STATUS));
            expect(gl.getProgramParameter(program, gl.DELETE_STATUS)).assertEqual(false);
            console.info("webgl test ATTACHED_SHADERS:", gl.getProgramParameter(program, gl.ATTACHED_SHADERS));
            expect(gl.getProgramParameter(program, gl.ATTACHED_SHADERS)).assertEqual(2);
            expect(gl.getProgramParameter(program, gl.VALIDATE_STATUS)).assertEqual(false);
            gl.validateProgram(program);
            console.info("webgl test VALIDATE_STATUS:", gl.getProgramParameter(program, gl.VALIDATE_STATUS));
            expect(gl.getProgramParameter(program, gl.VALIDATE_STATUS)).assertEqual(true);
            gl.deleteShader(vShader);
            gl.deleteShader(fShader);
            gl.deleteProgram(program);
            checkError(gl);
            done();
        })


        /**
         * @tc.name   webgl_test_getProgramParameter_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_PROGRAM_0010
         * @tc.desc   Test getProgramParameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_getProgramParameter_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getProgramParameter_1] getProgramParameter");
            getProgramParameter((program) => {
                gl.getProgramParameter(program, gl.ACTIVE_UNIFORMS)
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        /**
         * @tc.name   webgl_test_validateProgram
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_PROGRAM_0011
         * @tc.desc   Test validateProgram.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_validateProgram', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_validateProgram] validateProgram");
            let program = gl.createProgram();
            let vShader = initShader(gl, gl.VERTEX_SHADER, VERTEX_SOURCE_DEMO);
            let fShader = initShader(gl, gl.FRAGMENT_SHADER, FRAGMENT_SOURCE_DEMO);
            gl.attachShader(program, vShader);
            gl.attachShader(program, fShader);
            gl.linkProgram(program);
            expect(gl.getProgramParameter(program, gl.VALIDATE_STATUS)).assertEqual(false);
            console.info("webgltest VALIDATE_STATUS:", gl.getProgramParameter(program, gl.VALIDATE_STATUS));
            console.info("webgltest gl.validateProgram(program);");
            gl.validateProgram(program);
            console.info("webgltest VALIDATE_STATUS:", gl.getProgramParameter(program, gl.VALIDATE_STATUS));
            let err = checkError(gl);
            expect(err).assertEqual(gl.NO_ERROR);
            expect(gl.getProgramParameter(program, gl.VALIDATE_STATUS)).assertEqual(true);
            gl.deleteShader(vShader);
            gl.deleteShader(fShader);
            gl.deleteProgram(program);
            checkError(gl);
            done();
        })

        function useProgram(callback, finish) {
            let program = gl.createProgram();
            let program2 = gl.createProgram();
            let vShader = initShader(gl, gl.VERTEX_SHADER, VERTEX_SOURCE_DEMO);
            let vShader2 = initShader(gl, gl.VERTEX_SHADER, VERTEX_SOURCE_DEMO);
            let fShader = initShader(gl, gl.FRAGMENT_SHADER, FRAGMENT_SOURCE_DEMO);
            let fShader2 = initShader(gl, gl.FRAGMENT_SHADER, FRAGMENT_SOURCE_DEMO);
            gl.attachShader(program, vShader);
            gl.attachShader(program, fShader);
            gl.attachShader(program2, vShader2);
            gl.attachShader(program2, fShader2);
            gl.linkProgram(program);
            gl.linkProgram(program2);
            gl.validateProgram(program);
            gl.validateProgram(program2);
            callback(program)
            finish()
            gl.deleteShader(vShader);
            gl.deleteShader(vShader2);
            gl.deleteShader(fShader);
            gl.deleteShader(fShader2);
            gl.deleteProgram(program);
            gl.deleteProgram(program2);
        }


        /**
         * @tc.name   webgl_test_useProgram
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_PROGRAM_0012
         * @tc.desc   Test useProgram.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_useProgram', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_useProgram] useProgram");
            let program = gl.createProgram();
            let program2 = gl.createProgram();
            let vShader = initShader(gl, gl.VERTEX_SHADER, VERTEX_SOURCE_DEMO);
            let vShader2 = initShader(gl, gl.VERTEX_SHADER, VERTEX_SOURCE_DEMO);
            let fShader = initShader(gl, gl.FRAGMENT_SHADER, FRAGMENT_SOURCE_DEMO);
            let fShader2 = initShader(gl, gl.FRAGMENT_SHADER, FRAGMENT_SOURCE_DEMO);
            gl.attachShader(program, vShader);
            gl.attachShader(program, fShader);
            gl.attachShader(program2, vShader2);
            gl.attachShader(program2, fShader2);
            gl.linkProgram(program);
            gl.linkProgram(program2);
            gl.validateProgram(program);
            gl.validateProgram(program2);
            console.info("webgltest VERSION:", gl.getParameter(gl.VERSION));
            console.info("webgltest VENDOR:", gl.getParameter(gl.VENDOR));
            gl.useProgram(program);
            console.info("webgltest CURRENT_PROGRAM:", gl.getParameter(gl.CURRENT_PROGRAM));
            expect(gl.getParameter(gl.CURRENT_PROGRAM)).assertEqual(program);
            gl.useProgram(program2);
            console.info("webgltest CURRENT_PROGRAM:", gl.getParameter(gl.CURRENT_PROGRAM));
            expect(gl.getParameter(gl.CURRENT_PROGRAM)).assertEqual(program2);
            gl.deleteShader(vShader);
            gl.deleteShader(vShader2);
            gl.deleteShader(fShader);
            gl.deleteShader(fShader2);
            gl.deleteProgram(program);
            gl.deleteProgram(program2);
            checkError(gl);
            done();
        })


        /**
         * @tc.name   webgl_test_useProgram_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_PROGRAM_0013
         * @tc.desc   Test useProgram.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_useProgram_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_useProgram_1] useProgram");
            getProgramParameter((program) => {
                gl.useProgram(null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_useProgram_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_PROGRAM_0014
         * @tc.desc   Test useProgram.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_useProgram_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_useProgram_2] useProgram");
            getProgramParameter((program) => {
                gl.useProgram(undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        /**
         * @tc.name   webgl_test_getProgramInfoLog
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_PROGRAM_0015
         * @tc.desc   Test getProgramInfoLog.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_getProgramInfoLog', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_getProgramInfoLog] getProgramInfoLog");
            let program = gl.createProgram();
            let vShader = initShader(gl, gl.VERTEX_SHADER, VERTEX_SOURCE_DEMO);
            let fShader = initShader(gl, gl.FRAGMENT_SHADER, FRAGMENT_SOURCE_DEMO);
            gl.attachShader(program, vShader);
            gl.attachShader(program, fShader);
            gl.linkProgram(program);
            gl.validateProgram(program);
            console.info("webgltest getProgramInfoLog:", gl.getProgramInfoLog(program));
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            expect(gl.getProgramInfoLog(program)).assertEqual("");
            gl.deleteShader(vShader);
            gl.deleteShader(fShader);
            gl.deleteProgram(program);
            checkError(gl);
            done();
        })


        /**
         * @tc.name   webgl_test_getProgramInfoLog_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_PROGRAM_0016
         * @tc.desc   Test getProgramInfoLog.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_getProgramInfoLog_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getProgramInfoLog] getProgramInfoLog");
            let program = gl.createProgram();
            let vShader = initShader(gl, gl.VERTEX_SHADER, VERTEX_SOURCE_DEMO);
            let fShader = initShader(gl, gl.FRAGMENT_SHADER, FRAGMENT_SOURCE_DEMO);
            gl.linkProgram(program);
            gl.validateProgram(program);
            gl.useProgram(program);
            expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            console.info("webgltest getProgramInfoLog:", gl.getProgramInfoLog(program));
            expect(gl.getProgramInfoLog(program).length > 0).assertEqual(true);
            gl.deleteShader(vShader);
            gl.deleteShader(fShader);
            gl.deleteProgram(program);
            checkError(gl);
            done();
        })
    })
}
