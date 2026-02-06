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


export default function webgl1_shader() {
    
	describe('webgl1_shader', function () {
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
         * @tc.name   webgl_test_createShader
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SHADER_0001
         * @tc.desc   Test createShader.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_createShader', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_createShader] createShader");
            let vShader = gl.createShader(gl.VERTEX_SHADER);
            console.info("webgltest vShader: " + vShader);
            expect(vShader != null).assertTrue();
            gl.deleteShader(vShader);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            let nShader = gl.createShader(1);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            console.info("webgltest nShader: " + nShader);
            expect(nShader).assertEqual(null);
            checkError(gl);
            done();
        })


        /**
         * @tc.name   webgl_test_createShader_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SHADER_0002
         * @tc.desc   Test createShader.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_createShader_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_createShader_1] createShader");
            let vShader = gl.createShader(null);
            if (vShader) gl.deleteShader(vShader);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            checkError(gl);
            done();
        })


        /**
         * @tc.name   webgl_test_createShader_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SHADER_0003
         * @tc.desc   Test createShader.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_createShader_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_createShader_2] createShader");
            let vShader = gl.createShader(undefined);
            if (vShader) gl.deleteShader(vShader);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            checkError(gl);
            done();
        })


        /**
         * @tc.name   webgl_test_createShader_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SHADER_0004
         * @tc.desc   Test createShader.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_createShader_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_createShader_3] createShader");
            let vShader = gl.createShader("");
            if (vShader) gl.deleteShader(vShader);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            checkError(gl);
            done();
        })

        function shaderSource(callback, finish) {
            let vShader = gl.createShader(gl.VERTEX_SHADER);
            callback(vShader)
            finish()
            gl.deleteShader(vShader);
        }


        /**
         * @tc.name   webgl_test_shaderSource
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SHADER_0005
         * @tc.desc   Test shaderSource.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_shaderSource', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_shaderSource] shaderSource");
            let vShader = gl.createShader(gl.VERTEX_SHADER);
            let vSource = `
        attribute vec4 a_Position;
        attribute float a_PointSize;
        void main(){
            gl_Position = a_Position;
            gl_PointSize = a_PointSize;
        }`
            gl.shaderSource(vShader, vSource);
            let source = gl.getShaderSource(vShader);
            console.info("webgltest  shaderSource ", source);
            expect(vSource).assertEqual(source);
            gl.deleteShader(vShader);
            checkError(gl);
            done();
        })


        /**
         * @tc.name   webgl_test_shaderSource_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SHADER_0006
         * @tc.desc   Test shaderSource.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_shaderSource_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_shaderSource_1] shaderSource");
            shaderSource((vShader) => {
                gl.shaderSource(vShader, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_shaderSource_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SHADER_0007
         * @tc.desc   Test shaderSource.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_shaderSource_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_shaderSource_2] shaderSource");
            shaderSource((vShader) => {
                gl.shaderSource(vShader, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_shaderSource_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SHADER_0008
         * @tc.desc   Test shaderSource.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_shaderSource_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_shaderSource_3] shaderSource");
            shaderSource((vShader) => {
                gl.shaderSource(vShader, "");
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        /**
         * @tc.name   webgl_test_getShaderSource
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SHADER_0009
         * @tc.desc   Test getShaderSource.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_getShaderSource', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_getShaderSource] getShaderSource");
            let vShader = gl.createShader(gl.VERTEX_SHADER);
            let vSource = `
        attribute vec4 a_Position;
        attribute float a_PointSize;
        void main(){
            gl_Position = a_Position;
            gl_PointSize = a_PointSize;
        }`
            gl.shaderSource(vShader, vSource);
            let source = gl.getShaderSource(vShader);
            console.info("webgltest  shaderSource ", source);
            expect(vSource).assertEqual(source);
            gl.deleteShader(vShader);
            checkError(gl);
            done();
        })

        function getShaderParameter(callback, finish) {
            let vShader = gl.createShader(gl.VERTEX_SHADER);
            let vSource = `
        attribute vec4 a_Position;
        attribute float a_PointSize;
        void main(){
            gl_Position = a_Position;
            gl_PointSize = a_PointSize;
        }`
            gl.shaderSource(vShader, vSource);
            callback(vShader)
            finish()
            gl.deleteShader(vShader);
        }


        /**
         * @tc.name   webgl_test_getShaderParameter
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SHADER_0010
         * @tc.desc   Test getShaderParameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_getShaderParameter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_getShaderParameter] getShaderParameter");
            let vShader = gl.createShader(gl.VERTEX_SHADER);
            let vSource = `
        attribute vec4 a_Position;
        attribute float a_PointSize;
        void main(){
            gl_Position = a_Position;
            gl_PointSize = a_PointSize;
        }`
            gl.shaderSource(vShader, vSource);
            let shaderCompileStatus = gl.getShaderParameter(vShader, gl.COMPILE_STATUS);
            console.log("webgltest shaderCompileStatus: ", shaderCompileStatus);
            expect(shaderCompileStatus).assertEqual(false);
            let shaderType = gl.getShaderParameter(vShader, gl.SHADER_TYPE);
            console.log("webgltest ShaderType : ", shaderType);
            expect(shaderType).assertEqual(gl.VERTEX_SHADER);
            gl.deleteShader(vShader);
            checkError(gl);
            done();
        })


        /**
         * @tc.name   webgl_test_getShaderParameter_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SHADER_0011
         * @tc.desc   Test getShaderParameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_getShaderParameter_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getShaderParameter_1] getShaderParameter");
            getShaderParameter((vShader) => {
                let shaderType = gl.getShaderParameter(vShader, gl.DELETE_STATUS);
                console.log("webgltest ShaderType : ", shaderType);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_getShaderParameter_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SHADER_0012
         * @tc.desc   Test getShaderParameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_getShaderParameter_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getShaderParameter_2] getShaderParameter");
            getShaderParameter((vShader) => {
                let shaderType = gl.getShaderParameter(vShader, null);
                console.log("webgltest ShaderType : ", shaderType);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_getShaderParameter_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SHADER_0013
         * @tc.desc   Test getShaderParameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_getShaderParameter_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getShaderParameter_3] getShaderParameter");
            getShaderParameter((vShader) => {
                let shaderType = gl.getShaderParameter(vShader, undefined);
                console.log("webgltest ShaderType : ", shaderType);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            })
            done();
        })

        /**
         * @tc.name   webgl_test_compileShader
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SHADER_0014
         * @tc.desc   Test compileShader.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_compileShader', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_compileShader] compileShader");
            let vShader = gl.createShader(gl.VERTEX_SHADER);
            let vSource = `
        attribute vec4 a_Position;
        attribute float a_PointSize;
        void main(){
            gl_Position = a_Position;
            gl_PointSize = a_PointSize;
        }`
            gl.shaderSource(vShader, vSource);
            let shaderParameter1 = gl.getShaderParameter(vShader, gl.COMPILE_STATUS);
            console.info("webgltest shaderParameter1 before compile : ", shaderParameter1);
            expect(shaderParameter1).assertEqual(false);
            gl.compileShader(vShader);
            let shaderParameter2 = gl.getShaderParameter(vShader, gl.COMPILE_STATUS);
            console.info("webgltest shaderParameter2 after compile : ", shaderParameter2);
            expect(shaderParameter2).assertEqual(true);
            gl.deleteShader(vShader);
            checkError(gl);
            done();
        })

        /**
         * @tc.name   webgl_test_getShaderInfoLog
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SHADER_0015
         * @tc.desc   Test getShaderInfoLog.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_getShaderInfoLog', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_getShaderInfoLog] getShaderInfoLog");
            let vShader = gl.createShader(gl.VERTEX_SHADER);
            let vSource = `
        attribute vec4 a_Position;
        attribute float a_PointSize;
        void main(){
            gl_Position = a_Position;
            gl_PointSize = a_PointSizeErr;
        }`
            gl.shaderSource(vShader, vSource);
            let log1 = gl.getShaderInfoLog(vShader);
            console.info("webgltest log : ", log1);
            expect(log1).assertEqual(null || '');
            gl.compileShader(vShader);
            let compileStatus = gl.getShaderParameter(vShader, gl.COMPILE_STATUS);
            console.info("webgltest compileStatus : ", compileStatus);
            let errLog = gl.getShaderInfoLog(vShader);
            console.info("webgltest compile log : ", errLog);
            expect(errLog.length > 0).assertTrue();
            gl.deleteShader(vShader);
            checkError(gl);
            done();
        })

        /**
         * @tc.name   webgl_test_isShader
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SHADER_0016
         * @tc.desc   Test isShader.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_isShader', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_isShader] isShader");
            let vShader = gl.createShader(gl.VERTEX_SHADER);
            console.info("isShader ", gl.isShader(vShader));
            expect(gl.isShader(vShader)).assertEqual(true);
            console.info("delete Shader");
            gl.deleteShader(vShader);
            console.info("isShader ", gl.isShader(vShader));
            expect(gl.isShader(vShader)).assertEqual(false);
            checkError(gl);
            done();
        })


        /**
         * @tc.name   webgl_test_isShader_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SHADER_0017
         * @tc.desc   Test isShader.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_isShader_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_isShader_1] isShader");
            let vShader = gl.createShader(gl.VERTEX_SHADER);
            console.info("isShader ", gl.isShader(null));
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.deleteShader(vShader);
            checkError(gl);
            done();
        })


        /**
         * @tc.name   webgl_test_isShader_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SHADER_0018
         * @tc.desc   Test isShader.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_isShader_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_isShader_2] isShader");
            let vShader = gl.createShader(gl.VERTEX_SHADER);
            console.info("isShader ", gl.isShader(undefined));
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.deleteShader(vShader);
            checkError(gl);
            done();
        })

        /**
         * @tc.name   webgl_test_deleteShader
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SHADER_0019
         * @tc.desc   Test deleteShader.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_deleteShader', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_deleteShader] deleteShader");
            let vShader = gl.createShader(gl.VERTEX_SHADER);
            console.info("isShader ", gl.isShader(vShader));
            expect(gl.isShader(vShader) == true).assertTrue();
            console.info("delete Shader");
            gl.deleteShader(vShader);
            console.info("isShader ", gl.isShader(vShader));
            expect(gl.isShader(vShader)).assertEqual(false);
            gl.deleteShader(null);
            checkError(gl);
            done();
        })


        /**
         * @tc.name   webgl_test_deleteShader_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SHADER_0020
         * @tc.desc   Test deleteShader.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_deleteShader_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_deleteShader_1] deleteShader");
            let vShader = gl.createShader(gl.VERTEX_SHADER);
            expect(gl.isShader(vShader) == true).assertTrue();
            gl.deleteShader(undefined);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            checkError(gl);
            done();
        })

        /**
         * @tc.name   webgl_test_attachShader
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SHADER_0021
         * @tc.desc   Test attachShader.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_attachShader', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_attachShader] attachShader");
            let program = gl.createProgram();
            expect(gl.getError()).assertEqual(gl.NO_ERROR);
            console.info("webgl_test_attachShader initShader");
            let vShader = initShader(gl, gl.VERTEX_SHADER, `
            attribute vec4 a_Position;
            attribute float a_PointSize;
            void main(){
                gl_Position = a_Position;
                gl_PointSize = a_PointSize;
            }
        `);
            expect(gl.getError()).assertEqual(gl.NO_ERROR);
            console.info("webgl_test_attachShader attachShader");
            gl.attachShader(program, vShader);
            expect(gl.getError()).assertEqual(gl.NO_ERROR);
            console.info("webgl_test_attachShader getAttachedShaders");
            let attachedShaders = gl.getAttachedShaders(program);
            expect(gl.getError()).assertEqual(gl.NO_ERROR);
            console.info("webgltest getAttachedShaders:", attachedShaders);
            expect(attachedShaders[0]).assertEqual(vShader);
            expect(attachedShaders[0] != null).assertTrue();
            expect(attachedShaders.length).assertEqual(1);
            gl.deleteShader(vShader);
            gl.deleteProgram(program);
            checkError(gl);
            done();
        })

        /**
         * @tc.name   webgl_test_getAttachedShaders
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SHADER_0022
         * @tc.desc   Test getAttachedShaders.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_getAttachedShaders', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_getAttachedShaders] getAttachedShaders");
            let program = gl.createProgram();
            let vShader = initShader(gl, gl.VERTEX_SHADER, `
                attribute vec4 a_Position;
                attribute float a_PointSize;
                void main(){
                    gl_Position = a_Position;
                    gl_PointSize = a_PointSize;
                }
            `);
            gl.attachShader(program, vShader);
            let attachedShaders = gl.getAttachedShaders(program);
            console.info("webgltest getAttachedShaders:", attachedShaders);
            expect(attachedShaders[0] == vShader).assertTrue();
            expect(gl.getError()).assertEqual(gl.NO_ERROR);
            console.info("webgltest gl.detachShader(program, vShader);");
            gl.detachShader(program, vShader);
            console.info("webgltest getAttachedShaders:", gl.getAttachedShaders(program));
            expect(gl.getAttachedShaders(program).length == 0).assertTrue();
            gl.deleteShader(vShader);
            gl.deleteProgram(program);
            done();
        })

        /**
         * @tc.name   webgl_test_detachShader
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SHADER_0023
         * @tc.desc   Test detachShader.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_detachShader', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_detachShader] detachShader");
            let program = gl.createProgram();
            let vShader = initShader(gl, gl.VERTEX_SHADER, `
                attribute vec4 a_Position;
                attribute float a_PointSize;
                void main(){
                    gl_Position = a_Position;
                    gl_PointSize = a_PointSize;
                }
            `);
            gl.attachShader(program, vShader);
            let attachedShaders = gl.getAttachedShaders(program);
            console.info("webgltest getAttachedShaders:", attachedShaders);
            expect(attachedShaders[0]).assertEqual(vShader);
            expect(gl.getError()).assertEqual(gl.NO_ERROR);
            console.info("webgltest gl.detachShader(program, vShader);");
            gl.detachShader(program, vShader);
            console.info("webgltest getAttachedShaders:", gl.getAttachedShaders(program));
            expect(gl.getAttachedShaders(program).length).assertEqual(0);
            gl.deleteShader(vShader);
            gl.deleteProgram(program);
            done();
        })

        /**
         * WebGL API 的 WebGLRenderingContext.getShaderPrecisionFormat（）
         * 方法返回一个新的 WebGLShaderPrecisionFormat 对象，描述指定着色器的范围和精度 数字格式
         */
        function getShaderPrecisionFormat(callback, finish) {
            let program = gl.createProgram();
            let vShader = initShader(gl, gl.VERTEX_SHADER, `
                precision mediump float;
                attribute vec4 a_Position;
                attribute float a_PointSize;
                void main(){
                    gl_Position = a_Position;
                    gl_PointSize = a_PointSize;
                }
            `);
            gl.attachShader(program, vShader);
            callback(vShader)
            finish()
            gl.deleteShader(vShader);
            gl.deleteProgram(program);
        }


        /**
         * @tc.name   webgl_test_getShaderPrecisionFormat
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SHADER_0024
         * @tc.desc   Test getShaderPrecisionFormat.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_getShaderPrecisionFormat', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getShaderPrecisionFormat] getShaderPrecisionFormat");
            let program = gl.createProgram();
            let vShader = initShader(gl, gl.VERTEX_SHADER, `
                precision mediump float;
                attribute vec4 a_Position;
                attribute float a_PointSize;
                void main(){
                    gl_Position = a_Position;
                    gl_PointSize = a_PointSize;
                }
            `);
            gl.attachShader(program, vShader);
            let shaderPrecisionFormat = gl.getShaderPrecisionFormat(gl.VERTEX_SHADER, gl.MEDIUM_FLOAT);
            expect(gl.getError()).assertEqual(gl.NO_ERROR);
            console.info('webgltest shaderPrecisionFormat:', JSON.stringify(shaderPrecisionFormat),
                shaderPrecisionFormat);
            expect(typeof shaderPrecisionFormat).assertEqual("object");
            gl.deleteShader(vShader);
            gl.deleteProgram(program);
            done();
        })


        /**
         * @tc.name   webgl_test_getShaderPrecisionFormat_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SHADER_0025
         * @tc.desc   Test getShaderPrecisionFormat.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_getShaderPrecisionFormat_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getShaderPrecisionFormat_1] getShaderPrecisionFormat");
            getShaderPrecisionFormat((vShader) => {
                gl.getShaderPrecisionFormat(gl.FRAGMENT_SHADER, gl.MEDIUM_FLOAT);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_getShaderPrecisionFormat_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SHADER_0026
         * @tc.desc   Test getShaderPrecisionFormat.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_getShaderPrecisionFormat_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getShaderPrecisionFormat_2] getShaderPrecisionFormat");
            getShaderPrecisionFormat((vShader) => {
                gl.getShaderPrecisionFormat(gl.FRAGMENT_SHADER, gl.LOW_FLOAT);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_getShaderPrecisionFormat_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SHADER_0027
         * @tc.desc   Test getShaderPrecisionFormat.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_getShaderPrecisionFormat_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getShaderPrecisionFormat_3] getShaderPrecisionFormat");
            getShaderPrecisionFormat((vShader) => {
                gl.getShaderPrecisionFormat(gl.FRAGMENT_SHADER, gl.HIGH_FLOAT);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_getShaderPrecisionFormat_4
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SHADER_0028
         * @tc.desc   Test getShaderPrecisionFormat.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_getShaderPrecisionFormat_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getShaderPrecisionFormat_4] getShaderPrecisionFormat");
            getShaderPrecisionFormat((vShader) => {
                gl.getShaderPrecisionFormat(gl.FRAGMENT_SHADER, gl.LOW_INT);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_getShaderPrecisionFormat_5
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SHADER_0029
         * @tc.desc   Test getShaderPrecisionFormat.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_getShaderPrecisionFormat_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getShaderPrecisionFormat_5] getShaderPrecisionFormat");
            getShaderPrecisionFormat((vShader) => {
                gl.getShaderPrecisionFormat(gl.FRAGMENT_SHADER, gl.MEDIUM_INT);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.name   webgl_test_getShaderPrecisionFormat_6
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SHADER_0030
         * @tc.desc   Test getShaderPrecisionFormat.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_getShaderPrecisionFormat_6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getShaderPrecisionFormat_6] getShaderPrecisionFormat");
            getShaderPrecisionFormat((vShader) => {
                gl.getShaderPrecisionFormat(gl.FRAGMENT_SHADER, gl.HIGH_INT);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })
    })
}
