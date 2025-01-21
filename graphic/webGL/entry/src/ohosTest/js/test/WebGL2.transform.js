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


export default function webgl2_transform() {
    
	describe('webgl2_transform', function () {
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
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TRANSFORM_0001
         * @tc.name webgl2_test_createTransformFeedback
         * @tc.desc Test createTransformFeedback.
         */
        it('webgl2_test_createTransformFeedback', 0, async function (done) {
            console.info("webgl2test [webgl2_test_createTransformFeedback] createTransformFeedback");
            let tf = gl.createTransformFeedback();
            console.info("webgltest tf:", tf);
            expect(tf != null).assertEqual(true);
            gl.deleteTransformFeedback(tf);
            checkError(gl);
            done();
        });
        function deleteTransformFeedback(callback, finish) {
            let transformFeedback = gl.createTransformFeedback();
            gl.bindTransformFeedback(gl.TRANSFORM_FEEDBACK, transformFeedback);
            callback(transformFeedback);
            finish();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TRANSFORM_0002
         * @tc.name webgl2_test_deleteTransformFeedback
         * @tc.desc Test deleteTransformFeedback.
         */
        it('webgl2_test_deleteTransformFeedback', 0, async function (done) {
            console.info("webgl2test [webgl2_test_deleteTransformFeedback] deleteTransformFeedback");
            let transformFeedback = gl.createTransformFeedback();
            gl.bindTransformFeedback(gl.TRANSFORM_FEEDBACK, transformFeedback);
            console.info("webgltest isTransformFeedback", gl.isTransformFeedback(transformFeedback));
            expect(gl.isTransformFeedback(transformFeedback)).assertEqual(true);
            console.info("webgltest deleteTransformFeedback");
            gl.deleteTransformFeedback(transformFeedback);
            console.info("webgltest isTransformFeedback", gl.isTransformFeedback(transformFeedback));
            expect(gl.isTransformFeedback(transformFeedback)).assertEqual(false);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TRANSFORM_0003
         * @tc.name webgl2_test_deleteTransformFeedback_1
         * @tc.desc Test deleteTransformFeedback.
         */
        it('webgl2_test_deleteTransformFeedback_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_deleteTransformFeedback_1] deleteTransformFeedback");
            deleteTransformFeedback((transformFeedback) => {
                gl.deleteTransformFeedback(null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TRANSFORM_0004
         * @tc.name webgl2_test_deleteTransformFeedback_2
         * @tc.desc Test deleteTransformFeedback.
         */
        it('webgl2_test_deleteTransformFeedback_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_deleteTransformFeedback_2] deleteTransformFeedback");
            deleteTransformFeedback((transformFeedback) => {
                gl.deleteTransformFeedback(undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function isTransformFeedback(callback, finish) {
            let transformFeedback = gl.createTransformFeedback();
            gl.bindTransformFeedback(gl.TRANSFORM_FEEDBACK, transformFeedback);
            callback(transformFeedback);
            gl.deleteTransformFeedback(transformFeedback);
            finish();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TRANSFORM_0005
         * @tc.name webgl2_test_isTransformFeedback
         * @tc.desc Test isTransformFeedback.
         */
        it('webgl2_test_isTransformFeedback', 0, async function (done) {
            console.info("webgl2test [webgl2_test_isTransformFeedback] isTransformFeedback");
            let transformFeedback = gl.createTransformFeedback();
            expect(gl.isTransformFeedback(transformFeedback)).assertEqual(false);
            gl.bindTransformFeedback(gl.TRANSFORM_FEEDBACK, transformFeedback);
            expect(gl.isTransformFeedback(transformFeedback)).assertEqual(true);
            gl.deleteTransformFeedback(transformFeedback);
            expect(gl.isTransformFeedback(transformFeedback)).assertEqual(false);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TRANSFORM_0006
         * @tc.name webgl2_test_isTransformFeedback_1
         * @tc.desc Test isTransformFeedback.
         */
        it('webgl2_test_isTransformFeedback_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_isTransformFeedback_1] isTransformFeedback");
            isTransformFeedback((transformFeedback) => {
                gl.isTransformFeedback(undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TRANSFORM_0007
         * @tc.name webgl2_test_isTransformFeedback_2
         * @tc.desc Test isTransformFeedback.
         */
        it('webgl2_test_isTransformFeedback_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_isTransformFeedback_2] isTransformFeedback");
            isTransformFeedback((transformFeedback) => {
                gl.isTransformFeedback(null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function bindTransformFeedback(callback, finish) {
            let transformFeedback = gl.createTransformFeedback();
            callback(transformFeedback);
            gl.deleteTransformFeedback(transformFeedback);
            finish();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TRANSFORM_0008
         * @tc.name webgl2_test_bindTransformFeedback
         * @tc.desc Test bindTransformFeedback.
         */
        it('webgl2_test_bindTransformFeedback', 0, async function (done) {
            console.info("webgl2test [webgl2_test_bindTransformFeedback] bindTransformFeedback ");
            let transformFeedback = gl.createTransformFeedback();
            expect(gl.getParameter(gl.TRANSFORM_FEEDBACK_BINDING)).assertEqual(null);
            gl.bindTransformFeedback(gl.TRANSFORM_FEEDBACK, transformFeedback);
            expect(gl.getParameter(gl.TRANSFORM_FEEDBACK_BINDING)).assertEqual(transformFeedback);
            gl.deleteTransformFeedback(transformFeedback);
            expect(gl.getParameter(gl.TRANSFORM_FEEDBACK_BINDING)).assertEqual(null);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TRANSFORM_0009
         * @tc.name webgl2_test_bindTransformFeedback_1
         * @tc.desc Test bindTransformFeedback.
         */
        it('webgl2_test_bindTransformFeedback_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_bindTransformFeedback_1] bindTransformFeedback");
            bindTransformFeedback((transformFeedback) => {
                gl.bindTransformFeedback(null, transformFeedback);
            }, () => {
                expect(checkError(gl)).assertEqual(1280);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TRANSFORM_0010
         * @tc.name webgl2_test_bindTransformFeedback_2
         * @tc.desc Test bindTransformFeedback.
         */
        it('webgl2_test_bindTransformFeedback_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_bindTransformFeedback_2] bindTransformFeedback");
            bindTransformFeedback((transformFeedback) => {
                gl.bindTransformFeedback(undefined, transformFeedback);
            }, () => {
                expect(checkError(gl)).assertEqual(1280);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TRANSFORM_0011
         * @tc.name webgl2_test_bindTransformFeedback_3
         * @tc.desc Test bindTransformFeedback.
         */
        it('webgl2_test_bindTransformFeedback_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_bindTransformFeedback_3] bindTransformFeedback");
            bindTransformFeedback((transformFeedback) => {
                gl.bindTransformFeedback(gl.TRANSFORM_FEEDBACK, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TRANSFORM_0012
         * @tc.name webgl2_test_bindTransformFeedback_4
         * @tc.desc Test bindTransformFeedback.
         */
        it('webgl2_test_bindTransformFeedback_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_bindTransformFeedback_4] bindTransformFeedback");
            bindTransformFeedback((transformFeedback) => {
                gl.bindTransformFeedback(gl.TRANSFORM_FEEDBACK, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function beginTransformFeedback(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                in vec2 a_position;
                out vec2 v_position;
                void main(){
                    gl_Position = vec4(a_position,0, 1);
                    v_position = a_position;
                }
            `, `#version 300 es
                precision mediump float;
                in vec2 v_position;
                out vec4 o_color;
                void main(){
                    o_color = vec4(v_position.x,v_position.y,0.3, 1);
                }
            `);
            gl.transformFeedbackVaryings(p.program, ["v_position"], gl.INTERLEAVED_ATTRIBS);
            gl.linkProgram(p.program);
            gl.useProgram(p.program);
            let varyingInfo = gl.getTransformFeedbackVarying(p.program, 0);
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            gl.bufferData(gl.ARRAY_BUFFER, new Float32Array([
                0.5, 0.5,
                0.5, -0.5,
                -0.5, -0.5,
            ]), gl.STATIC_DRAW);
            let vPosition = gl.getAttribLocation(p.program, "a_position");
            gl.enableVertexAttribArray(vPosition);
            gl.vertexAttribPointer(vPosition, 2, gl.FLOAT, false, 0, 0);
            let transformFeedback = gl.createTransformFeedback();
            gl.bindTransformFeedback(gl.TRANSFORM_FEEDBACK, transformFeedback);
            let transformFeedbackBuffer = gl.createBuffer();
            gl.bindBuffer(gl.TRANSFORM_FEEDBACK_BUFFER, transformFeedbackBuffer);
            gl.bufferData(gl.TRANSFORM_FEEDBACK_BUFFER, 2 * 6 * Float32Array.BYTES_PER_ELEMENT, gl.STATIC_DRAW);
            gl.bindBufferBase(gl.TRANSFORM_FEEDBACK_BUFFER, 0, transformFeedbackBuffer);
            callback(transformFeedback);
            gl.clearColor(0.6, 0.6, 0.6, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLES, 0, 3);
            gl.drawArrays(gl.TRIANGLES, 0, 3);
            gl.endTransformFeedback();
            let readBuffer = new Float32Array(new ArrayBuffer(2 * 6 * Float32Array.BYTES_PER_ELEMENT));
            gl.getBufferSubData(gl.TRANSFORM_FEEDBACK_BUFFER, 0, readBuffer); // ARRAY_BUFFER，TRANSFORM_FEEDBACK_BUFFER
            gl.bindBuffer(gl.TRANSFORM_FEEDBACK_BUFFER, null);
            gl.bindTransformFeedback(gl.TRANSFORM_FEEDBACK, null);
            gl.bindBuffer(gl.ARRAY_BUFFER, null);
            gl.deleteBuffer(buffer);
            gl.deleteBuffer(transformFeedbackBuffer);
            gl.deleteTransformFeedback(transformFeedback);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            finish();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TRANSFORM_0013
         * @tc.name webgl2_test_beginTransformFeedback
         * @tc.desc Test beginTransformFeedback.
         */
        it('webgl2_test_beginTransformFeedback', 0, async function (done) {
            console.info("webgl2test [webgl2_test_beginTransformFeedback] beginTransformFeedback");
            let p = createProgram(gl, `#version 300 es
                in vec2 a_position;
                out vec2 v_position;
                void main(){
                    gl_Position = vec4(a_position,0, 1);
                    v_position = a_position;
                }
            `, `#version 300 es
                precision mediump float;
                in vec2 v_position;
                out vec4 o_color;
                void main(){
                    o_color = vec4(v_position.x,v_position.y,0.3, 1);
                }
            `);
            gl.transformFeedbackVaryings(p.program, ["v_position"], gl.INTERLEAVED_ATTRIBS);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.linkProgram(p.program);
            gl.useProgram(p.program);
            let varyingInfo = gl.getTransformFeedbackVarying(p.program, 0);
            console.info("webgltest varyingInfo", varyingInfo.type, varyingInfo.size, varyingInfo.name);
            expect(varyingInfo.type).assertEqual(gl.FLOAT_VEC2);
            expect(varyingInfo.size).assertEqual(1);
            expect(varyingInfo.name).assertEqual("v_position");
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            gl.bufferData(gl.ARRAY_BUFFER, new Float32Array([
                0.5, 0.5,
                0.5, -0.5,
                -0.5, -0.5,
            ]), gl.STATIC_DRAW);
            let vPosition = gl.getAttribLocation(p.program, "a_position");
            gl.enableVertexAttribArray(vPosition);
            gl.vertexAttribPointer(vPosition, 2, gl.FLOAT, false, 0, 0);
            let transformFeedback = gl.createTransformFeedback();
            gl.bindTransformFeedback(gl.TRANSFORM_FEEDBACK, transformFeedback);
            let transformFeedbackBuffer = gl.createBuffer(); // cache for reading transformation feedback results
            gl.bindBuffer(gl.TRANSFORM_FEEDBACK_BUFFER, transformFeedbackBuffer);
            gl.bufferData(gl.TRANSFORM_FEEDBACK_BUFFER, 2 * 6 * Float32Array.BYTES_PER_ELEMENT, gl.STATIC_DRAW);
            gl.bindBufferBase(gl.TRANSFORM_FEEDBACK_BUFFER, 0, transformFeedbackBuffer);
            gl.beginTransformFeedback(gl.TRIANGLES);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.clearColor(0.6, 0.6, 0.6, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLES, 0, 3);
            gl.drawArrays(gl.TRIANGLES, 0, 3);
            gl.endTransformFeedback();
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            let readBuffer = new Float32Array(new ArrayBuffer(2 * 6 * Float32Array.BYTES_PER_ELEMENT));
            gl.getBufferSubData(gl.TRANSFORM_FEEDBACK_BUFFER, 0, readBuffer); // ARRAY_BUFFER，TRANSFORM_FEEDBACK_BUFFER
            console.log(readBuffer); // the transform feedback was read
            expect(readBuffer[0]).assertEqual(0.5);
            expect(readBuffer[1]).assertEqual(0.5);
            expect(readBuffer[2]).assertEqual(0.5);
            expect(readBuffer[3]).assertEqual(-0.5);
            expect(readBuffer[4]).assertEqual(-0.5);
            expect(readBuffer[5]).assertEqual(-0.5);
            expect(readBuffer[6]).assertEqual(0.5);
            expect(readBuffer[7]).assertEqual(0.5);
            expect(readBuffer[8]).assertEqual(0.5);
            expect(readBuffer[9]).assertEqual(-0.5);
            expect(readBuffer[10]).assertEqual(-0.5);
            expect(readBuffer[11]).assertEqual(-0.5);
            gl.bindBuffer(gl.TRANSFORM_FEEDBACK_BUFFER, null);
            gl.bindTransformFeedback(gl.TRANSFORM_FEEDBACK, null);
            gl.bindBuffer(gl.ARRAY_BUFFER, null);
            gl.deleteBuffer(buffer);
            gl.deleteBuffer(transformFeedbackBuffer);
            gl.deleteTransformFeedback(transformFeedback);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TRANSFORM_0014
         * @tc.name webgl2_test_beginTransformFeedback_1
         * @tc.desc Test beginTransformFeedback.
         */
        it('webgl2_test_beginTransformFeedback_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_beginTransformFeedback_1] beginTransformFeedback");
            beginTransformFeedback((transformFeedback) => {
                gl.beginTransformFeedback(gl.LINES);
            }, () => {
                expect(checkError(gl)).assertEqual(1282);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TRANSFORM_0015
         * @tc.name webgl2_test_beginTransformFeedback_2
         * @tc.desc Test beginTransformFeedback.
         */
        it('webgl2_test_beginTransformFeedback_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_beginTransformFeedback_2] beginTransformFeedback");
            beginTransformFeedback((transformFeedback) => {
                gl.beginTransformFeedback(gl.POINTS);
            }, () => {
                expect(checkError(gl)).assertEqual(1282);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TRANSFORM_0016
         * @tc.name webgl2_test_beginTransformFeedback_3
         * @tc.desc Test beginTransformFeedback.
         */
        it('webgl2_test_beginTransformFeedback_3', 0, async function (done) {
            console.info("webgl2test [webgl2_test_beginTransformFeedback_3] beginTransformFeedback");
            beginTransformFeedback((transformFeedback) => {
                gl.beginTransformFeedback(null);
            }, () => {
                expect(checkError(gl)).assertEqual(1282);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TRANSFORM_0017
         * @tc.name webgl2_test_beginTransformFeedback_4
         * @tc.desc Test beginTransformFeedback.
         */
        it('webgl2_test_beginTransformFeedback_4', 0, async function (done) {
            console.info("webgl2test [webgl2_test_beginTransformFeedback_4] beginTransformFeedback");
            beginTransformFeedback((transformFeedback) => {
                gl.beginTransformFeedback(true);
            }, () => {
                expect(checkError(gl)).assertEqual(1282);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TRANSFORM_0018
         * @tc.name webgl2_test_beginTransformFeedback_5
         * @tc.desc Test beginTransformFeedback.
         */
        it('webgl2_test_beginTransformFeedback_5', 0, async function (done) {
            console.info("webgl2test [webgl2_test_beginTransformFeedback_5] beginTransformFeedback");
            beginTransformFeedback((transformFeedback) => {
                gl.beginTransformFeedback(1);
            }, () => {
                expect(checkError(gl)).assertEqual(1282);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TRANSFORM_0019
         * @tc.name webgl2_test_beginTransformFeedback_6
         * @tc.desc Test beginTransformFeedback.
         */
        it('webgl2_test_beginTransformFeedback_6', 0, async function (done) {
            console.info("webgl2test [webgl2_test_beginTransformFeedback_6] beginTransformFeedback");
            beginTransformFeedback((transformFeedback) => {
                gl.beginTransformFeedback("1");
            }, () => {
                expect(checkError(gl)).assertEqual(1282);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TRANSFORM_0020
         * @tc.name webgl2_test_endTransformFeedback
         * @tc.desc Test endTransformFeedback.
         */
        it('webgl2_test_endTransformFeedback', 0, async function (done) {
            console.info("webgl2test [webgl2_test_endTransformFeedback] endTransformFeedback");
            let p = createProgram(gl, `#version 300 es
                in vec2 a_position;
                out vec2 v_position;
                void main(){
                    gl_Position = vec4(a_position,0, 1);
                    v_position = a_position;
                }
            `, `#version 300 es
                precision mediump float;
                in vec2 v_position;
                out vec4 o_color;
                void main(){
                    o_color = vec4(v_position.x,v_position.y,0.3, 1);
                }
            `);
            gl.transformFeedbackVaryings(p.program, ["v_position"], gl.INTERLEAVED_ATTRIBS);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.linkProgram(p.program);
            gl.useProgram(p.program);
            let varyingInfo = gl.getTransformFeedbackVarying(p.program, 0);
            console.info("webgltest varyingInfo", varyingInfo.type, varyingInfo.size, varyingInfo.name);
            expect(varyingInfo.type).assertEqual(gl.FLOAT_VEC2);
            expect(varyingInfo.size).assertEqual(1);
            expect(varyingInfo.name).assertEqual("v_position");
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            gl.bufferData(gl.ARRAY_BUFFER, new Float32Array([
                0.5, 0.5,
                0.5, -0.5,
                -0.5, -0.5,
            ]), gl.STATIC_DRAW);
            let vPosition = gl.getAttribLocation(p.program, "a_position");
            gl.enableVertexAttribArray(vPosition);
            gl.vertexAttribPointer(vPosition, 2, gl.FLOAT, false, 0, 0);
            let transformFeedback = gl.createTransformFeedback();
            gl.bindTransformFeedback(gl.TRANSFORM_FEEDBACK, transformFeedback);
            let transformFeedbackBuffer = gl.createBuffer();
            gl.bindBuffer(gl.TRANSFORM_FEEDBACK_BUFFER, transformFeedbackBuffer);
            gl.bufferData(gl.TRANSFORM_FEEDBACK_BUFFER, 2 * 6 * Float32Array.BYTES_PER_ELEMENT, gl.STATIC_DRAW);
            gl.bindBufferBase(gl.TRANSFORM_FEEDBACK_BUFFER, 0, transformFeedbackBuffer);
            gl.beginTransformFeedback(gl.TRIANGLES);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.clearColor(0.6, 0.6, 0.6, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLES, 0, 3);
            gl.drawArrays(gl.TRIANGLES, 0, 3);
            gl.endTransformFeedback();
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            let readBuffer = new Float32Array(new ArrayBuffer(2 * 6 * Float32Array.BYTES_PER_ELEMENT));
            gl.getBufferSubData(gl.TRANSFORM_FEEDBACK_BUFFER, 0, readBuffer); // ARRAY_BUFFER，TRANSFORM_FEEDBACK_BUFFER
            console.log(readBuffer); // the transform feedback was read
            expect(readBuffer[0]).assertEqual(0.5);
            expect(readBuffer[1]).assertEqual(0.5);
            expect(readBuffer[2]).assertEqual(0.5);
            expect(readBuffer[3]).assertEqual(-0.5);
            expect(readBuffer[4]).assertEqual(-0.5);
            expect(readBuffer[5]).assertEqual(-0.5);
            expect(readBuffer[6]).assertEqual(0.5);
            expect(readBuffer[7]).assertEqual(0.5);
            expect(readBuffer[8]).assertEqual(0.5);
            expect(readBuffer[9]).assertEqual(-0.5);
            expect(readBuffer[10]).assertEqual(-0.5);
            expect(readBuffer[11]).assertEqual(-0.5);
            gl.bindBuffer(gl.TRANSFORM_FEEDBACK_BUFFER, null);
            gl.bindTransformFeedback(gl.TRANSFORM_FEEDBACK, null);
            gl.bindBuffer(gl.ARRAY_BUFFER, null);
            gl.deleteBuffer(buffer);
            gl.deleteBuffer(transformFeedbackBuffer);
            gl.deleteTransformFeedback(transformFeedback);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            checkError(gl);
            done();
        });
        function transformFeedbackVaryings(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                in vec2 a_position;
                out vec2 v_position;
                void main(){
                    gl_Position = vec4(a_position,0, 1);
                    v_position = a_position;
                }
            `, `#version 300 es
                precision mediump float;
                in vec2 v_position;
                out vec4 o_color;
                void main(){
                    o_color = vec4(v_position.x,v_position.y,0.3, 1);
                }
            `);
            callback(p);
            gl.linkProgram(p.program);
            gl.useProgram(p.program);
            let varyingInfo = gl.getTransformFeedbackVarying(p.program, 0);
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            gl.bufferData(gl.ARRAY_BUFFER, new Float32Array([
                0.5, 0.5,
                0.5, -0.5,
                -0.5, -0.5,
            ]), gl.STATIC_DRAW);
            let vPosition = gl.getAttribLocation(p.program, "a_position");
            gl.enableVertexAttribArray(vPosition);
            gl.vertexAttribPointer(vPosition, 2, gl.FLOAT, false, 0, 0);
            let transformFeedback = gl.createTransformFeedback();
            gl.bindTransformFeedback(gl.TRANSFORM_FEEDBACK, transformFeedback);
            let transformFeedbackBuffer = gl.createBuffer(); // cache for reading transformation feedback results
            gl.bindBuffer(gl.TRANSFORM_FEEDBACK_BUFFER, transformFeedbackBuffer);
            gl.bufferData(gl.TRANSFORM_FEEDBACK_BUFFER, 2 * 6 * Float32Array.BYTES_PER_ELEMENT, gl.STATIC_DRAW);
            gl.bindBufferBase(gl.TRANSFORM_FEEDBACK_BUFFER, 0, transformFeedbackBuffer);
            gl.beginTransformFeedback(gl.TRIANGLES);
            gl.clearColor(0.6, 0.6, 0.6, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLES, 0, 3);
            gl.drawArrays(gl.TRIANGLES, 0, 3);
            gl.endTransformFeedback();
            let readBuffer = new Float32Array(new ArrayBuffer(2 * 6 * Float32Array.BYTES_PER_ELEMENT));
            gl.getBufferSubData(gl.TRANSFORM_FEEDBACK_BUFFER, 0, readBuffer); // ARRAY_BUFFER，TRANSFORM_FEEDBACK_BUFFER
            gl.bindBuffer(gl.TRANSFORM_FEEDBACK_BUFFER, null);
            gl.bindTransformFeedback(gl.TRANSFORM_FEEDBACK, null);
            gl.bindBuffer(gl.ARRAY_BUFFER, null);
            gl.deleteBuffer(buffer);
            gl.deleteBuffer(transformFeedbackBuffer);
            gl.deleteTransformFeedback(transformFeedback);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            gl.flush();
            finish();
            checkError(gl);
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TRANSFORM_0021
         * @tc.name webgl2_test_transformFeedbackVaryings
         * @tc.desc Test transformFeedbackVaryings.
         */
        it('webgl2_test_transformFeedbackVaryings', 0, async function (done) {
            console.info("webgl2test [webgl2_test_transformFeedbackVaryings] transformFeedbackVaryings");
            let p = createProgram(gl, `#version 300 es
                in vec2 a_position;
                out vec2 v_position;
                void main(){
                    gl_Position = vec4(a_position,0, 1);
                    v_position = a_position;
                }
            `, `#version 300 es
                precision mediump float;
                in vec2 v_position;
                out vec4 o_color;
                void main(){
                    o_color = vec4(v_position.x,v_position.y,0.3, 1);
                }
            `);
            gl.transformFeedbackVaryings(p.program, ["v_position"], gl.INTERLEAVED_ATTRIBS);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.linkProgram(p.program);
            gl.useProgram(p.program);
            let varyingInfo = gl.getTransformFeedbackVarying(p.program, 0);
            console.info("webgltest varyingInfo", varyingInfo.type, varyingInfo.size, varyingInfo.name);
            expect(varyingInfo.type).assertEqual(gl.FLOAT_VEC2);
            expect(varyingInfo.size).assertEqual(1);
            expect(varyingInfo.name).assertEqual("v_position");
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            gl.bufferData(gl.ARRAY_BUFFER, new Float32Array([
                0.5, 0.5,
                0.5, -0.5,
                -0.5, -0.5,
            ]), gl.STATIC_DRAW);
            let vPosition = gl.getAttribLocation(p.program, "a_position");
            gl.enableVertexAttribArray(vPosition);
            gl.vertexAttribPointer(vPosition, 2, gl.FLOAT, false, 0, 0);
            let transformFeedback = gl.createTransformFeedback();
            gl.bindTransformFeedback(gl.TRANSFORM_FEEDBACK, transformFeedback);
            let transformFeedbackBuffer = gl.createBuffer(); // cache for reading transformation feedback results
            gl.bindBuffer(gl.TRANSFORM_FEEDBACK_BUFFER, transformFeedbackBuffer);
            gl.bufferData(gl.TRANSFORM_FEEDBACK_BUFFER, 2 * 6 * Float32Array.BYTES_PER_ELEMENT, gl.STATIC_DRAW);
            gl.bindBufferBase(gl.TRANSFORM_FEEDBACK_BUFFER, 0, transformFeedbackBuffer);
            gl.beginTransformFeedback(gl.TRIANGLES);
            gl.clearColor(0.6, 0.6, 0.6, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLES, 0, 3);
            gl.drawArrays(gl.TRIANGLES, 0, 3);
            gl.endTransformFeedback();
            let readBuffer = new Float32Array(new ArrayBuffer(2 * 6 * Float32Array.BYTES_PER_ELEMENT));
            gl.getBufferSubData(gl.TRANSFORM_FEEDBACK_BUFFER, 0, readBuffer); // ARRAY_BUFFER，TRANSFORM_FEEDBACK_BUFFER
            console.log(readBuffer); // the transform feedback was read
            expect(readBuffer[0]).assertEqual(0.5);
            expect(readBuffer[1]).assertEqual(0.5);
            expect(readBuffer[2]).assertEqual(0.5);
            expect(readBuffer[3]).assertEqual(-0.5);
            expect(readBuffer[4]).assertEqual(-0.5);
            expect(readBuffer[5]).assertEqual(-0.5);
            expect(readBuffer[6]).assertEqual(0.5);
            expect(readBuffer[7]).assertEqual(0.5);
            expect(readBuffer[8]).assertEqual(0.5);
            expect(readBuffer[9]).assertEqual(-0.5);
            expect(readBuffer[10]).assertEqual(-0.5);
            expect(readBuffer[11]).assertEqual(-0.5);
            gl.bindBuffer(gl.TRANSFORM_FEEDBACK_BUFFER, null);
            gl.bindTransformFeedback(gl.TRANSFORM_FEEDBACK, null);
            gl.bindBuffer(gl.ARRAY_BUFFER, null);
            gl.deleteBuffer(buffer);
            gl.deleteBuffer(transformFeedbackBuffer);
            gl.deleteTransformFeedback(transformFeedback);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            gl.flush();
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TRANSFORM_0022
         * @tc.name webgl2_test_transformFeedbackVaryings_1
         * @tc.desc Test transformFeedbackVaryings.
         */
        it('webgl2_test_transformFeedbackVaryings_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_transformFeedbackVaryings_1] transformFeedbackVaryings");
            transformFeedbackVaryings((p) => {
                gl.transformFeedbackVaryings(p.program, ["v_position"], null);
                expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TRANSFORM_0023
         * @tc.name webgl2_test_transformFeedbackVaryings_2
         * @tc.desc Test transformFeedbackVaryings.
         */
        it('webgl2_test_transformFeedbackVaryings_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_transformFeedbackVaryings_2] transformFeedbackVaryings");
            transformFeedbackVaryings((p) => {
                gl.transformFeedbackVaryings(p.program, ["v_position"], undefined);
                expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            });
            done();
        });
        function getTransformFeedbackVarying(callback, finish) {
            let p = createProgram(gl, `#version 300 es
                in vec2 a_position;
                out vec2 v_position;
                void main(){
                    gl_Position = vec4(a_position,0, 1);
                    v_position = a_position;
                }
            `, `#version 300 es
                precision mediump float;
                in vec2 v_position;
                out vec4 o_color;
                void main(){
                    o_color = vec4(v_position.x,v_position.y,0.3, 1);
                }
            `);
            gl.transformFeedbackVaryings(p.program, ["v_position"], gl.INTERLEAVED_ATTRIBS);
            gl.linkProgram(p.program);
            gl.useProgram(p.program);
            callback(p);
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            gl.bufferData(gl.ARRAY_BUFFER, new Float32Array([
                0.5, 0.5,
                0.5, -0.5,
                -0.5, -0.5,
            ]), gl.STATIC_DRAW);
            let vPosition = gl.getAttribLocation(p.program, "a_position");
            gl.enableVertexAttribArray(vPosition);
            gl.vertexAttribPointer(vPosition, 2, gl.FLOAT, false, 0, 0);
            let transformFeedback = gl.createTransformFeedback();
            gl.bindTransformFeedback(gl.TRANSFORM_FEEDBACK, transformFeedback);
            let transformFeedbackBuffer = gl.createBuffer(); // cache for reading transformation feedback results
            gl.bindBuffer(gl.TRANSFORM_FEEDBACK_BUFFER, transformFeedbackBuffer);
            gl.bufferData(gl.TRANSFORM_FEEDBACK_BUFFER, 2 * 6 * Float32Array.BYTES_PER_ELEMENT, gl.STATIC_DRAW);
            gl.bindBufferBase(gl.TRANSFORM_FEEDBACK_BUFFER, 0, transformFeedbackBuffer);
            gl.beginTransformFeedback(gl.TRIANGLES);
            gl.clearColor(0.6, 0.6, 0.6, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLES, 0, 3);
            gl.drawArrays(gl.TRIANGLES, 0, 3);
            gl.endTransformFeedback();
            let readBuffer = new Float32Array(new ArrayBuffer(2 * 6 * Float32Array.BYTES_PER_ELEMENT));
            gl.getBufferSubData(gl.TRANSFORM_FEEDBACK_BUFFER, 0, readBuffer); // ARRAY_BUFFER，TRANSFORM_FEEDBACK_BUFFER
            gl.bindBuffer(gl.TRANSFORM_FEEDBACK_BUFFER, null);
            gl.bindTransformFeedback(gl.TRANSFORM_FEEDBACK, null);
            gl.bindBuffer(gl.ARRAY_BUFFER, null);
            gl.deleteBuffer(buffer);
            gl.deleteBuffer(transformFeedbackBuffer);
            gl.deleteTransformFeedback(transformFeedback);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            gl.flush();
            finish();
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TRANSFORM_0024
         * @tc.name webgl2_test_getTransformFeedbackVarying
         * @tc.desc Test getTransformFeedbackVarying.
         */
        it('webgl2_test_getTransformFeedbackVarying', 0, async function (done) {
            console.info("webgl2test [webgl2_test_getTransformFeedbackVarying] getTransformFeedbackVarying");
            let p = createProgram(gl, `#version 300 es
                in vec2 a_position;
                out vec2 v_position;
                void main(){
                    gl_Position = vec4(a_position,0, 1);
                    v_position = a_position;
                }
            `, `#version 300 es
                precision mediump float;
                in vec2 v_position;
                out vec4 o_color;
                void main(){
                    o_color = vec4(v_position.x,v_position.y,0.3, 1);
                }
            `);
            gl.transformFeedbackVaryings(p.program, ["v_position"], gl.INTERLEAVED_ATTRIBS);
            checkError(gl);
            gl.linkProgram(p.program);
            gl.useProgram(p.program);
            let varyingInfo = gl.getTransformFeedbackVarying(p.program, 0);
            console.info("webgltest varyingInfo", varyingInfo.type, varyingInfo.size, varyingInfo.name);
            expect(varyingInfo.type).assertEqual(gl.FLOAT_VEC2);
            expect(varyingInfo.size).assertEqual(1);
            expect(varyingInfo.name).assertEqual("v_position");
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            gl.bufferData(gl.ARRAY_BUFFER, new Float32Array([
                0.5, 0.5,
                0.5, -0.5,
                -0.5, -0.5,
            ]), gl.STATIC_DRAW);
            let vPosition = gl.getAttribLocation(p.program, "a_position");
            gl.enableVertexAttribArray(vPosition);
            gl.vertexAttribPointer(vPosition, 2, gl.FLOAT, false, 0, 0);
            let transformFeedback = gl.createTransformFeedback();
            gl.bindTransformFeedback(gl.TRANSFORM_FEEDBACK, transformFeedback);
            let transformFeedbackBuffer = gl.createBuffer(); // cache for reading transformation feedback results
            gl.bindBuffer(gl.TRANSFORM_FEEDBACK_BUFFER, transformFeedbackBuffer);
            gl.bufferData(gl.TRANSFORM_FEEDBACK_BUFFER, 2 * 6 * Float32Array.BYTES_PER_ELEMENT, gl.STATIC_DRAW);
            gl.bindBufferBase(gl.TRANSFORM_FEEDBACK_BUFFER, 0, transformFeedbackBuffer);
            gl.beginTransformFeedback(gl.TRIANGLES);
            gl.clearColor(0.6, 0.6, 0.6, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLES, 0, 3);
            gl.drawArrays(gl.TRIANGLES, 0, 3);
            gl.endTransformFeedback();
            let readBuffer = new Float32Array(new ArrayBuffer(2 * 6 * Float32Array.BYTES_PER_ELEMENT));
            gl.getBufferSubData(gl.TRANSFORM_FEEDBACK_BUFFER, 0, readBuffer); // ARRAY_BUFFER，TRANSFORM_FEEDBACK_BUFFER
            console.log(readBuffer); // theTransformFeedbackWasRead
            expect(readBuffer[0]).assertEqual(0.5);
            expect(readBuffer[1]).assertEqual(0.5);
            expect(readBuffer[2]).assertEqual(0.5);
            expect(readBuffer[3]).assertEqual(-0.5);
            expect(readBuffer[4]).assertEqual(-0.5);
            expect(readBuffer[5]).assertEqual(-0.5);
            expect(readBuffer[6]).assertEqual(0.5);
            expect(readBuffer[7]).assertEqual(0.5);
            expect(readBuffer[8]).assertEqual(0.5);
            expect(readBuffer[9]).assertEqual(-0.5);
            expect(readBuffer[10]).assertEqual(-0.5);
            expect(readBuffer[11]).assertEqual(-0.5);
            gl.bindBuffer(gl.TRANSFORM_FEEDBACK_BUFFER, null);
            gl.bindTransformFeedback(gl.TRANSFORM_FEEDBACK, null);
            gl.bindBuffer(gl.ARRAY_BUFFER, null);
            gl.deleteBuffer(buffer);
            gl.deleteBuffer(transformFeedbackBuffer);
            gl.deleteTransformFeedback(transformFeedback);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            gl.flush();
            checkError(gl);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TRANSFORM_0025
         * @tc.name webgl2_test_getTransformFeedbackVarying_1
         * @tc.desc Test getTransformFeedbackVarying.
         */
        it('webgl2_test_getTransformFeedbackVarying_1', 0, async function (done) {
            console.info("webgl2test [webgl2_test_getTransformFeedbackVarying_1] getTransformFeedbackVarying");
            getTransformFeedbackVarying((p) => {
                let varyingInfo = gl.getTransformFeedbackVarying(p.program, null);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TRANSFORM_0026
         * @tc.name webgl2_test_getTransformFeedbackVarying_2
         * @tc.desc Test getTransformFeedbackVarying.
         */
        it('webgl2_test_getTransformFeedbackVarying_2', 0, async function (done) {
            console.info("webgl2test [webgl2_test_getTransformFeedbackVarying_2] getTransformFeedbackVarying");
            getTransformFeedbackVarying((p) => {
                let varyingInfo = gl.getTransformFeedbackVarying(p.program, undefined);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TRANSFORM_0027
         * @tc.name webgl2_test_pauseTransformFeedback
         * @tc.desc Test pauseTransformFeedback.
         */
        it('webgl2_test_pauseTransformFeedback', 0, async function (done) {
            console.info("webgl2test [webgl2_test_pauseTransformFeedback] pauseTransformFeedback");
            let p = createProgram(gl, `#version 300 es
                in vec3 a_position;
                out vec3 v_position;
                void main(){
                    gl_Position = vec4(a_position, 1);
                    v_position = a_position;
                }
            `, `#version 300 es
                precision mediump float;
                in vec3 v_position;
                out vec4 o_color;
                void main(){
                    o_color = vec4(v_position.x,v_position.y,v_position.z, 1);
                }
            `);
            gl.transformFeedbackVaryings(p.program, ["v_position"], gl.INTERLEAVED_ATTRIBS);
            checkError(gl);
            gl.linkProgram(p.program);
            gl.useProgram(p.program);
            let varyingInfo = gl.getTransformFeedbackVarying(p.program, 0);
            console.info("webgltest varyingInfo", varyingInfo.type, varyingInfo.size, varyingInfo.name);
            expect(varyingInfo.type).assertEqual(gl.FLOAT_VEC3);
            expect(varyingInfo.size).assertEqual(1);
            expect(varyingInfo.name).assertEqual("v_position");
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            gl.bufferData(gl.ARRAY_BUFFER, new Float32Array([
                0.5, 0.5, 0.0,
                0.5, -0.5, 0.0,
                -0.5, -0.5, 0.0,
            ]), gl.STATIC_DRAW);
            let vPosition = gl.getAttribLocation(p.program, "a_position");
            gl.enableVertexAttribArray(vPosition);
            gl.vertexAttribPointer(vPosition, 3, gl.FLOAT, false, 0, 0);
            let transformFeedback = gl.createTransformFeedback();
            gl.bindTransformFeedback(gl.TRANSFORM_FEEDBACK, transformFeedback);
            let transformFeedbackBuffer = gl.createBuffer(); // cache for reading transformation feedback results
            gl.bindBuffer(gl.TRANSFORM_FEEDBACK_BUFFER, transformFeedbackBuffer);
            gl.bufferData(gl.TRANSFORM_FEEDBACK_BUFFER, 3 * 3 * 4, gl.STATIC_DRAW);
            gl.bindBufferBase(gl.TRANSFORM_FEEDBACK_BUFFER, 0, transformFeedbackBuffer);
            gl.beginTransformFeedback(gl.TRIANGLES);
            gl.clearColor(0.6, 0.6, 0.6, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLES, 0, 3);
            gl.flush();
            gl.pauseTransformFeedback();
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.drawArrays(gl.TRIANGLES, 0, 3);
            gl.flush();
            gl.resumeTransformFeedback();
            gl.endTransformFeedback();
            let readBuffer = new Float32Array(new ArrayBuffer(3 * 3 * Float32Array.BYTES_PER_ELEMENT));
            gl.getBufferSubData(gl.TRANSFORM_FEEDBACK_BUFFER, 0, readBuffer); // ARRAY_BUFFER，TRANSFORM_FEEDBACK_BUFFER
            console.log(readBuffer); // the transform feedback was read
            expect(readBuffer[0]).assertEqual(0.5);
            expect(readBuffer[1]).assertEqual(0.5);
            expect(readBuffer[2]).assertEqual(0.0);
            expect(readBuffer[3]).assertEqual(0.5);
            expect(readBuffer[4]).assertEqual(-0.5);
            expect(readBuffer[5]).assertEqual(0.0);
            expect(readBuffer[6]).assertEqual(-0.5);
            expect(readBuffer[7]).assertEqual(-0.5);
            gl.bindBuffer(gl.TRANSFORM_FEEDBACK_BUFFER, null);
            gl.bindTransformFeedback(gl.TRANSFORM_FEEDBACK, null);
            gl.bindBuffer(gl.ARRAY_BUFFER, null);
            gl.deleteBuffer(buffer);
            gl.deleteBuffer(transformFeedbackBuffer);
            gl.deleteTransformFeedback(transformFeedback);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            gl.disableVertexAttribArray(vPosition);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TRANSFORM_0028
         * @tc.name webgl2_test_resumeTransformFeedback
         * @tc.desc Test resumeTransformFeedback.
         */
        it('webgl2_test_resumeTransformFeedback', 0, async function (done) {
            console.info("webgl2test [webgl2_test_resumeTransformFeedback] resumeTransformFeedback");
            let p = createProgram(gl, `#version 300 es
                in vec3 a_position;
                out vec3 v_position;
                void main(){
                    gl_Position = vec4(a_position, 1);
                    v_position = a_position;
                }
            `, `#version 300 es
                precision mediump float;
                in vec3 v_position;
                out vec4 o_color;
                void main(){
                    o_color = vec4(v_position.x,v_position.y,v_position.z, 1);
                }
            `);
            gl.transformFeedbackVaryings(p.program, ["v_position"], gl.INTERLEAVED_ATTRIBS);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.linkProgram(p.program);
            gl.useProgram(p.program);
            let varyingInfo = gl.getTransformFeedbackVarying(p.program, 0);
            console.info("webgltest varyingInfo", varyingInfo.type, varyingInfo.size, varyingInfo.name);
            expect(varyingInfo.type).assertEqual(gl.FLOAT_VEC3);
            expect(varyingInfo.size).assertEqual(1);
            expect(varyingInfo.name).assertEqual("v_position");
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            gl.bufferData(gl.ARRAY_BUFFER, new Float32Array([
                0.5, 0.5, 0.0,
                0.5, -0.5, 0.0,
                -0.5, -0.5, 0.0,
            ]), gl.STATIC_DRAW);
            let vPosition = gl.getAttribLocation(p.program, "a_position");
            gl.enableVertexAttribArray(vPosition);
            gl.vertexAttribPointer(vPosition, 3, gl.FLOAT, false, 0, 0);
            let transformFeedback = gl.createTransformFeedback();
            gl.bindTransformFeedback(gl.TRANSFORM_FEEDBACK, transformFeedback);
            let transformFeedbackBuffer = gl.createBuffer(); // cache for reading transformation feedback results
            gl.bindBuffer(gl.TRANSFORM_FEEDBACK_BUFFER, transformFeedbackBuffer);
            gl.bufferData(gl.TRANSFORM_FEEDBACK_BUFFER, 3 * 3 * 4, gl.STATIC_DRAW);
            gl.bindBufferBase(gl.TRANSFORM_FEEDBACK_BUFFER, 0, transformFeedbackBuffer);
            gl.beginTransformFeedback(gl.TRIANGLES);
            gl.clearColor(0.6, 0.6, 0.6, 1.0);
            gl.clear(gl.COLOR_BUFFER_BIT);
            gl.drawArrays(gl.TRIANGLES, 0, 3);
            gl.flush();
            gl.pauseTransformFeedback();
            gl.drawArrays(gl.TRIANGLES, 0, 3);
            gl.flush();
            gl.resumeTransformFeedback();
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.endTransformFeedback();
            let readBuffer = new Float32Array(new ArrayBuffer(3 * 3 * Float32Array.BYTES_PER_ELEMENT));
            gl.getBufferSubData(gl.TRANSFORM_FEEDBACK_BUFFER, 0, readBuffer); // ARRAY_BUFFER，TRANSFORM_FEEDBACK_BUFFER
            console.log(readBuffer); // the transform feedback was read
            expect(readBuffer[0]).assertEqual(0.5);
            expect(readBuffer[1]).assertEqual(0.5);
            expect(readBuffer[2]).assertEqual(0.0);
            expect(readBuffer[3]).assertEqual(0.5);
            expect(readBuffer[4]).assertEqual(-0.5);
            expect(readBuffer[5]).assertEqual(0.0);
            expect(readBuffer[6]).assertEqual(-0.5);
            expect(readBuffer[7]).assertEqual(-0.5);
            gl.bindBuffer(gl.TRANSFORM_FEEDBACK_BUFFER, null);
            gl.bindTransformFeedback(gl.TRANSFORM_FEEDBACK, null);
            gl.bindBuffer(gl.ARRAY_BUFFER, null);
            gl.deleteBuffer(buffer);
            gl.deleteBuffer(transformFeedbackBuffer);
            gl.deleteTransformFeedback(transformFeedback);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            gl.disableVertexAttribArray(vPosition);
            done();
        });
    })
}
