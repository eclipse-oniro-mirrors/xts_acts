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

import {checkError, createProgram, getColorUint8Array} from './WebGL1';


export default function webgl1_attribute() {
    
	describe('webgl1_attribute', function () {
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

        let getVertexAttribDesc = (attrib) => {
            // 返回当前绑定的 WebGLBuffer。
            let bufferBinding = gl.getVertexAttrib(attrib, gl.VERTEX_ATTRIB_ARRAY_BUFFER_BINDING);
            // 返回一个 GLint，指示顶点数组元素的大小。
            let size = gl.getVertexAttrib(attrib, gl.VERTEX_ATTRIB_ARRAY_SIZE);
            // 返回一个 GLboolean，如果在此索引处启用了顶点属性，则该 GLboolean 为 true。 否则为假。
            let enable = gl.getVertexAttrib(attrib, gl.VERTEX_ATTRIB_ARRAY_ENABLED);
            // 返回一个 GLint，指示数组中连续元素之间的字节数。 0 表示元素是连续的。
            let stride = gl.getVertexAttrib(attrib, gl.VERTEX_ATTRIB_ARRAY_STRIDE);
            // 返回表示数组类型的 GLenum。 其中之一 gl.BYTE  gl.UNSIGNED_BYTE gl.SHORT,gl.UNSIGNED_SHORT gl.FLOAT
            let type = gl.getVertexAttrib(attrib, gl.VERTEX_ATTRIB_ARRAY_TYPE);
            // 返回一个 GLboolean，如果对给定索引处的顶点属性数组规范化定点数据类型，则该 GLboolean 为 true。
            let normalized = gl.getVertexAttrib(attrib, gl.VERTEX_ATTRIB_ARRAY_NORMALIZED)
            // 返回一个 Float32Array（包含 4 个元素），表示给定索引处顶点属性的当前值。
            let vertex = gl.getVertexAttrib(attrib, gl.CURRENT_VERTEX_ATTRIB);
            return {bufferBinding, size, enable, stride, type, normalized, vertex}
        }

        function getAttribLocationTemp(callback, finish) {
            let vSource = `
            attribute vec4 a_Position;
            attribute float a_PointSize;
            void main(){
                gl_Position = a_Position;
                gl_PointSize = a_PointSize;
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
            callback(p);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            if (finish) finish();
        }

        /**
         * 验证此方法是否返回了给定WebGLProgram对象中某属性的下标指向位置
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0001
         * @tc.name webgl_test_getAttribLocation
         * @tc.desc Test getAttribLocation.
         */
        it('webgl_test_getAttribLocation', 0, async function (done) {
            console.info("webgltest [webgl_test_getAttribLocation] getAttribLocation");
            let vSource = `
            attribute vec4 a_Position;
            attribute float a_PointSize;
            void main(){
                gl_Position = a_Position;
                gl_PointSize = a_PointSize;
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
            let a_Position = gl.getAttribLocation(p.program, "a_Position");
            console.info("webgltest vertexShader source :", vSource);
            console.info("webgltest attribute a_Position:", a_Position);
            expect(a_Position >= 0).assertTrue();
            let a_PositionErr = gl.getAttribLocation(p.program, "a_Position_Err");
            console.info("webgltest attribute a_PositionErr:", a_PositionErr);
            expect(a_PositionErr).assertEqual(-1);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0002
         * @tc.name webgl_test_getAttribLocation_1
         * @tc.desc Test getAttribLocation.
         */
        it('webgl_test_getAttribLocation_1', 0, async function (done) {
            console.info("webgltest [webgl_test_getAttribLocation_1] getAttribLocation");
            getAttribLocationTemp((p) => {
                let attr = gl.getAttribLocation(p.program, 0);
                console.info("webgltest ", attr);
                expect(attr).assertEqual(-1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0003
         * @tc.name webgl_test_getAttribLocation_2
         * @tc.desc Test getAttribLocation.
         */
        it('webgl_test_getAttribLocation_2', 0, async function (done) {
            console.info("webgltest [webgl_test_getAttribLocation_1] getAttribLocation");
            getAttribLocationTemp((p) => {
                let attr = gl.getAttribLocation(p.program, undefined);
                console.info("webgltest ", attr);
                expect(attr).assertEqual(-1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0004
         * @tc.name webgl_test_getAttribLocation_3
         * @tc.desc Test getAttribLocation.
         */
        it('webgl_test_getAttribLocation_3', 0, async function (done) {
            console.info("webgltest [webgl_test_getAttribLocation_1] getAttribLocation");
            getAttribLocationTemp((p) => {
                let attr = gl.getAttribLocation(p.program, null);
                console.info("webgltest ", attr);
                expect(attr).assertEqual(-1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })

        /**
         * 验证getActiveAttrib方法是否返回一个WebGLActiveInfo对象，并包含在WebGLProgram中给到位置的一个顶点属性的尺寸、类型和名称。
         */
        function getActiveAttrib(callback, finish) {
            let vSource = `
            attribute vec4 a_Position;
            void main(){
                gl_Position = a_Position;
                gl_PointSize = 10.0;
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
            callback(p);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            if (finish) finish();
        }


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0005
         * @tc.name webgl_test_getActiveAttrib
         * @tc.desc Test getActiveAttrib.
         */
        it('webgl_test_getActiveAttrib', 0, async function (done) {
            console.info("webgltest [webgl_test_getActiveAttrib] getActiveAttrib");
            let vSource = `
            attribute vec4 a_Position;
            void main(){
                gl_Position = a_Position;
                gl_PointSize = 10.0;
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

            console.info("webgltest vertex shader source:", vSource);
            let attribCount = gl.getProgramParameter(p.program, gl.ACTIVE_ATTRIBUTES);
            console.info("webgltest attribCount:", attribCount);
            let activeAttrib = gl.getActiveAttrib(p.program, 0);
            console.info("webgltest ", activeAttrib);
            expect(activeAttrib.name).assertEqual("a_Position");
            expect(activeAttrib.type).assertEqual(gl.FLOAT_VEC4);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0006
         * @tc.name webgl_test_getActiveAttrib_1
         * @tc.desc Test getActiveAttrib.
         */
        it('webgl_test_getActiveAttrib_1', 0, async function (done) {
            console.info("webgltest [webgl_test_getActiveAttrib_1] getActiveAttrib");
            getActiveAttrib((p) => {
                let activeAttrib = gl.getActiveAttrib(p.program, 10);
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
                console.info("webgltest ", activeAttrib);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0007
         * @tc.name webgl_test_getActiveAttrib_2
         * @tc.desc Test getActiveAttrib.
         */
        it('webgl_test_getActiveAttrib_2', 0, async function (done) {
            console.info("webgltest [webgl_test_getActiveAttrib_2] getActiveAttrib");
            getActiveAttrib((p) => {
                let activeAttrib = gl.getActiveAttrib(p.program, null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
                console.info("webgltest ", activeAttrib);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0008
         * @tc.name webgl_test_getActiveAttrib_3
         * @tc.desc Test getActiveAttrib.
         */
        it('webgl_test_getActiveAttrib_3', 0, async function (done) {
            console.info("webgltest [webgl_test_getActiveAttrib_3] getActiveAttrib");
            getActiveAttrib((p) => {
                let activeAttrib = gl.getActiveAttrib(p.program, -1);
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
                console.info("webgltest ", activeAttrib);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })

        /**
         * 验证vertexAttrib1f方法是否可以给顶点 attibute 变量的1个分量赋值
         */
        function vertexAttrib1f(callback, finish) {
            let vSource = `
            attribute float a_PointSize;
            void main(){
                gl_Position = vec4(0.5, 0.5, 1, 1.0);
                gl_PointSize = a_PointSize;
            }
        `;
            let fSource = `
            precision mediump float;
            uniform vec4 u_FragColor;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            callback(p);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            if (finish) finish();
        }


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0009
         * @tc.name webgl_test_vertexAttrib1f
         * @tc.desc Test vertexAttrib1f.
         */
        it('webgl_test_vertexAttrib1f', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib1f] vertexAttrib1f");
            let vSource = `
            attribute float a_PointSize;
            void main(){
                gl_Position = vec4(0.5, 0.5, 1, 1.0);
                gl_PointSize = a_PointSize;
            }
        `;
            let fSource = `
            precision mediump float;
            uniform vec4 u_FragColor;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            console.info("webgltest vertex shader source:", vSource);
            let a_PointSize = gl.getAttribLocation(p.program, "a_PointSize");
            console.info("webgltest vertexAttrib1f( 100.0) ");
            gl.vertexAttrib1f(a_PointSize, 100.0);
            let vertexAttrib = gl.getVertexAttrib(a_PointSize, gl.CURRENT_VERTEX_ATTRIB);
            console.log(vertexAttrib);
            console.info("webgltest a_PointSize value: ", vertexAttrib[0]);
            expect(vertexAttrib[0]).assertEqual(100);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0010
         * @tc.name webgl_test_vertexAttrib1f_1
         * @tc.desc Test vertexAttrib1f.
         */
        it('webgl_test_vertexAttrib1f_1', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib1f_1] vertexAttrib1f");
            vertexAttrib1f((p) => {
                let a_PointSize = gl.getAttribLocation(p.program, "a_PointSize");
                gl.vertexAttrib1f(a_PointSize, 100);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0011
         * @tc.name webgl_test_vertexAttrib1f_2
         * @tc.desc Test vertexAttrib1f.
         */
        it('webgl_test_vertexAttrib1f_2', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib1f_1] vertexAttrib1f");
            vertexAttrib1f((p) => {
                let a_PointSize = gl.getAttribLocation(p.program, "a_PointSize");
                gl.vertexAttrib1f(a_PointSize, null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0012
         * @tc.name webgl_test_vertexAttrib1f_3
         * @tc.desc Test vertexAttrib1f.
         */
        it('webgl_test_vertexAttrib1f_3', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib1f_1] vertexAttrib1f");
            vertexAttrib1f((p) => {
                let a_PointSize = gl.getAttribLocation(p.program, "a_PointSize");
                gl.vertexAttrib1f(a_PointSize, -100);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0013
         * @tc.name webgl_test_vertexAttrib1f_4
         * @tc.desc Test vertexAttrib1f.
         */
        it('webgl_test_vertexAttrib1f_4', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib1f_4] vertexAttrib1f");
            vertexAttrib1f((p) => {
                let a_PointSize = gl.getAttribLocation(p.program, "a_PointSize");
                gl.vertexAttrib1f(null, null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        /**
         * 验证vertexAttrib2f方法是否可以给顶点 attibute 变量的2个分量赋值
         */
        function vertexAttrib2f(callback, verify) {
            let vSource = `
            attribute float a_PointSize;
            void main(){
                gl_Position = vec4(0.5, 0.5, 1, 1.0);
                gl_PointSize = a_PointSize;
            }
        `;
            let fSource = `
            precision mediump float;
            uniform vec4 u_FragColor;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            console.info("webgltest vertex shader source:", vSource);
            let a_PointSize = gl.getAttribLocation(p.program, "a_PointSize");
            callback(a_PointSize);
            let vertexAttrib = gl.getVertexAttrib(a_PointSize, gl.CURRENT_VERTEX_ATTRIB);
            console.info("webgltest a_PointSize value: ", vertexAttrib);
            verify(vertexAttrib);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0014
         * @tc.name webgl_test_vertexAttrib2f
         * @tc.desc Test vertexAttrib2f.
         */
        it('webgl_test_vertexAttrib2f', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib2f] vertexAttrib2f");
            let vSource = `
            attribute float a_PointSize;
            void main(){
                gl_Position = vec4(0.5, 0.5, 1, 1.0);
                gl_PointSize = a_PointSize;
            }
        `;
            let fSource = `
            precision mediump float;
            uniform vec4 u_FragColor;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            console.info("webgltest vertex shader source:", vSource);
            let a_PointSize = gl.getAttribLocation(p.program, "a_PointSize");
            console.info("webgltest vertexAttrib2f( 100.0, 100.0) ");
            gl.vertexAttrib2f(a_PointSize, 100.0, 100);
            let vertexAttrib = gl.getVertexAttrib(a_PointSize, gl.CURRENT_VERTEX_ATTRIB);
            console.info("webgltest a_PointSize value: ", vertexAttrib);
            expect(vertexAttrib[0]).assertEqual(100);
            expect(vertexAttrib[1]).assertEqual(100);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0015
         * @tc.name webgl_test_vertexAttrib2f_1
         * @tc.desc Test vertexAttrib2f.
         */
        it('webgl_test_vertexAttrib2f_1', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib2f_1] vertexAttrib2f");
            vertexAttrib2f((attrib) => {
                gl.vertexAttrib2f(attrib, null, null);
            }, (attrib) => {
                expect(attrib[0]).assertEqual(0);
                expect(attrib[1]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0016
         * @tc.name webgl_test_vertexAttrib2f_2
         * @tc.desc Test vertexAttrib2f.
         */
        it('webgl_test_vertexAttrib2f_2', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib2f_2] vertexAttrib2f");
            vertexAttrib2f((attrib) => {
                gl.vertexAttrib2f(attrib, -100, -100);
            }, (attrib) => {
                expect(attrib[0]).assertEqual(-100);
                expect(attrib[1]).assertEqual(-100);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0017
         * @tc.name webgl_test_vertexAttrib2f_3
         * @tc.desc Test vertexAttrib2f.
         */
        it('webgl_test_vertexAttrib2f_3', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib2f_3] vertexAttrib2f");
            vertexAttrib2f((attrib) => {
                gl.vertexAttrib2f(-1, -200, -100);
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            }, (attrib) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })

        /**
         * 验证vertexAttrib3f方法是否可以给顶点 attibute 变量的3个分量赋值
         */
        function vertexAttrib3f(callback, finish) {
            let vSource = `
            attribute float a_PointSize;
            void main(){
                gl_Position = vec4(0.5, 0.5, 1, 1.0);
                gl_PointSize = a_PointSize;
            }
        `;
            let fSource = `
            precision mediump float;
            uniform vec4 u_FragColor;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            console.info("webgltest vertex shader source:", vSource);
            let a_PointSize = gl.getAttribLocation(p.program, "a_PointSize");
            callback(a_PointSize);
            let vertexAttrib = gl.getVertexAttrib(a_PointSize, gl.CURRENT_VERTEX_ATTRIB);
            finish(vertexAttrib);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0018
         * @tc.name webgl_test_vertexAttrib3f
         * @tc.desc Test vertexAttrib3f.
         */
        it('webgl_test_vertexAttrib3f', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib3f] vertexAttrib3f");
            let vSource = `
            attribute float a_PointSize;
            void main(){
                gl_Position = vec4(0.5, 0.5, 1, 1.0);
                gl_PointSize = a_PointSize;
            }
        `;
            let fSource = `
            precision mediump float;
            uniform vec4 u_FragColor;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            console.info("webgltest vertex shader source:", vSource);
            let a_PointSize = gl.getAttribLocation(p.program, "a_PointSize");
            console.info("webgltest vertexAttrib3f( 100.0, 100.0, 100.0) ");
            gl.vertexAttrib3f(a_PointSize, 100.0, 100.0, 100.0);
            let vertexAttrib = gl.getVertexAttrib(a_PointSize, gl.CURRENT_VERTEX_ATTRIB);
            console.info("webgltest a_PointSize value: ", vertexAttrib);
            expect(vertexAttrib[0]).assertEqual(100);
            expect(vertexAttrib[1]).assertEqual(100);
            expect(vertexAttrib[2]).assertEqual(100);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0019
         * @tc.name webgl_test_vertexAttrib3f_1
         * @tc.desc Test vertexAttrib3f.
         */
        it('webgl_test_vertexAttrib3f_1', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib3f_1] vertexAttrib3f");
            vertexAttrib3f((attrib) => {
                gl.vertexAttrib3f(attrib, null, null, null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (attrib) => {
                expect(attrib[0]).assertEqual(0);
                expect(attrib[1]).assertEqual(0);
                expect(attrib[2]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0020
         * @tc.name webgl_test_vertexAttrib3f_2
         * @tc.desc Test vertexAttrib3f.
         */
        it('webgl_test_vertexAttrib3f_2', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib3f_2] vertexAttrib3f");
            vertexAttrib3f((attrib) => {
                gl.vertexAttrib3f(attrib, -1, -1, -1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (attrib) => {
                expect(attrib[0]).assertEqual(-1);
                expect(attrib[1]).assertEqual(-1);
                expect(attrib[2]).assertEqual(-1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0021
         * @tc.name webgl_test_vertexAttrib3f_3
         * @tc.desc Test vertexAttrib3f.
         */
        it('webgl_test_vertexAttrib3f_3', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib3f_3] vertexAttrib3f");
            vertexAttrib3f((attrib) => {
                gl.vertexAttrib3f(attrib, undefined, undefined, undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (attrib) => {
                expect(attrib[0].toString()).assertEqual("NaN");
                expect(attrib[1].toString()).assertEqual("NaN");
                expect(attrib[2].toString()).assertEqual("NaN");
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0022
         * @tc.name webgl_test_vertexAttrib3f_4
         * @tc.desc Test vertexAttrib3f.
         */
        it('webgl_test_vertexAttrib3f_4', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib3f_4] vertexAttrib3f");
            vertexAttrib3f((attrib) => {
                gl.vertexAttrib3f(-1, null, null, null);
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            }, (attrib) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        /**
         * 验证vertexAttrib4f方法是否可以给顶点 attibute 变量的4个分量赋值
         */
        function vertexAttrib4f(callback, finish) {
            let vSource = `
            attribute float a_PointSize;
            void main(){
                gl_Position = vec4(0.5, 0.5, 1, 1.0);
                gl_PointSize = a_PointSize;
            }
        `;
            let fSource = `
            precision mediump float;
            uniform vec4 u_FragColor;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            console.info("webgltest vertex shader source:", vSource);
            let a_PointSize = gl.getAttribLocation(p.program, "a_PointSize");
            callback(a_PointSize);
            let vertexAttrib = gl.getVertexAttrib(a_PointSize, gl.CURRENT_VERTEX_ATTRIB);
            finish(vertexAttrib);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0023
         * @tc.name webgl_test_vertexAttrib4f
         * @tc.desc Test vertexAttrib4f.
         */
        it('webgl_test_vertexAttrib4f', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib4f] vertexAttrib4f");
            let vSource = `
            attribute float a_PointSize;
            void main(){
                gl_Position = vec4(0.5, 0.5, 1, 1.0);
                gl_PointSize = a_PointSize;
            }
        `;
            let fSource = `
            precision mediump float;
            uniform vec4 u_FragColor;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            console.info("webgltest vertex shader source:", vSource);
            let a_PointSize = gl.getAttribLocation(p.program, "a_PointSize");
            console.info("webgltest vertexAttrib4f( 100.0, 100.0, 100.0,100.0) ");
            gl.vertexAttrib4f(a_PointSize, 100.0, 100.0, 100.0, 100.0);
            let vertexAttrib = gl.getVertexAttrib(a_PointSize, gl.CURRENT_VERTEX_ATTRIB);
            console.info("webgltest a_PointSize value: ", vertexAttrib);
            expect(vertexAttrib[0]).assertEqual(100);
            expect(vertexAttrib[1]).assertEqual(100);
            expect(vertexAttrib[2]).assertEqual(100);
            expect(vertexAttrib[3]).assertEqual(100);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0024
         * @tc.name webgl_test_vertexAttrib4f_1
         * @tc.desc Test vertexAttrib4f.
         */
        it('webgl_test_vertexAttrib4f_1', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib4f_1] vertexAttrib4f");
            vertexAttrib4f((attrib) => {
                gl.vertexAttrib4f(attrib, null, null, null, null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (attrib) => {
                expect(attrib[0]).assertEqual(0);
                expect(attrib[1]).assertEqual(0);
                expect(attrib[2]).assertEqual(0);
                expect(attrib[3]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0025
         * @tc.name webgl_test_vertexAttrib4f_2
         * @tc.desc Test vertexAttrib4f.
         */
        it('webgl_test_vertexAttrib4f_2', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib4f_2] vertexAttrib4f");
            vertexAttrib4f((attrib) => {
                gl.vertexAttrib4f(attrib, -1, -1, -1, -1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (attrib) => {
                expect(attrib[0]).assertEqual(-1);
                expect(attrib[1]).assertEqual(-1);
                expect(attrib[2]).assertEqual(-1);
                expect(attrib[3]).assertEqual(-1);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0026
         * @tc.name webgl_test_vertexAttrib4f_3
         * @tc.desc Test vertexAttrib4f.
         */
        it('webgl_test_vertexAttrib4f_3', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib4f_3] vertexAttrib4f");
            vertexAttrib4f((attrib) => {
                gl.vertexAttrib4f(attrib, undefined, undefined, undefined, undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (attrib) => {
                expect(attrib[0].toString()).assertEqual("NaN");
                expect(attrib[1].toString()).assertEqual("NaN");
                expect(attrib[2].toString()).assertEqual("NaN");
                expect(attrib[3].toString()).assertEqual("NaN");
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0027
         * @tc.name webgl_test_vertexAttrib4f_4
         * @tc.desc Test vertexAttrib4f.
         */
        it('webgl_test_vertexAttrib4f_4', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib4f_4] vertexAttrib4f");
            vertexAttrib4f((attrib) => {
                gl.vertexAttrib4f(-1, 0, 0, 0, 0);
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            }, (attrib) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        /**
         * 验证vertexAttrib1fv方法是否可以给顶点 attibute 变量的第一个向量值
         */
        function vertexAttrib1fv(callback, finish) {
            let vSource = `
            attribute float a_PointSize;
            void main(){
                gl_Position = vec4(0.5, 0.5, 1, 1.0);
                gl_PointSize = a_PointSize;
            }
        `;
            let fSource = `
            precision mediump float;
            uniform vec4 u_FragColor;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            console.info("webgltest vertex shader source:", vSource);
            let a_PointSize = gl.getAttribLocation(p.program, "a_PointSize");
            callback(a_PointSize);
            let vertexAttrib = gl.getVertexAttrib(a_PointSize, gl.CURRENT_VERTEX_ATTRIB);
            finish(vertexAttrib);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0028
         * @tc.name webgl_test_vertexAttrib1fv
         * @tc.desc Test vertexAttrib1fv.
         */
        it('webgl_test_vertexAttrib1fv', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib1fv] vertexAttrib1fv");
            let vSource = `
            attribute float a_PointSize;
            void main(){
                gl_Position = vec4(0.5, 0.5, 1, 1.0);
                gl_PointSize = a_PointSize;
            }
        `;
            let fSource = `
            precision mediump float;
            uniform vec4 u_FragColor;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            console.info("webgltest vertex shader source:", vSource);
            let a_PointSize = gl.getAttribLocation(p.program, "a_PointSize");
            console.info("webgltest vertexAttrib1fv(a_PointSize,new Float32Array([100.0, 100.0, 100.0, 100.0])) ");
            gl.vertexAttrib1fv(a_PointSize, new Float32Array([100.0, 100.0, 100.0, 100.0]));
            let vertexAttrib = gl.getVertexAttrib(a_PointSize, gl.CURRENT_VERTEX_ATTRIB);
            console.info("webgltest a_PointSize value: ", vertexAttrib);
            expect(vertexAttrib[0]).assertEqual(100);
            expect(vertexAttrib[1] != 100).assertTrue();
            expect(vertexAttrib[2] != 100).assertTrue();
            expect(vertexAttrib[3] != 100).assertTrue();
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0029
         * @tc.name webgl_test_vertexAttrib1fv_1
         * @tc.desc Test vertexAttrib1fv.
         */
        it('webgl_test_vertexAttrib1fv_1', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib1fv_1] vertexAttrib1fv");
            vertexAttrib1fv((attrib) => {
                gl.vertexAttrib1fv(attrib, new Float32Array([-100.0]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (attrib) => {
                expect(attrib[0]).assertEqual(-100);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0030
         * @tc.name webgl_test_vertexAttrib1fv_2
         * @tc.desc Test vertexAttrib1fv.
         */
        it('webgl_test_vertexAttrib1fv_2', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib1fv_2] vertexAttrib1fv");
            vertexAttrib1fv((attrib) => {
                gl.vertexAttrib1fv(attrib, new Float32Array([undefined]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (attrib) => {
                expect(attrib[0].toString()).assertEqual("NaN");
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0031
         * @tc.name webgl_test_vertexAttrib1fv_3
         * @tc.desc Test vertexAttrib1fv.
         */
        it('webgl_test_vertexAttrib1fv_3', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib1fv_3] vertexAttrib1fv");
            vertexAttrib1fv((attrib) => {
                gl.vertexAttrib1fv(attrib, new Float32Array([null]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (attrib) => {
                expect(attrib[0]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0032
         * @tc.name webgl_test_vertexAttrib1fv_4
         * @tc.desc Test vertexAttrib1fv.
         */
        it('webgl_test_vertexAttrib1fv_4', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib1fv_4] vertexAttrib1fv");
            vertexAttrib1fv((attrib) => {
                gl.vertexAttrib1fv(attrib, new Float32Array([-100]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (attrib) => {
                expect(attrib[0]).assertEqual(-100);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        /**
         * 验证vertexAttrib2fv方法是否可以给顶点 attibute 变量的第2个向量值
         */
        function vertexAttrib2fv(callback, finish) {
            let vSource = `
            attribute float a_PointSize;
            void main(){
                gl_Position = vec4(0.5, 0.5, 1, 1.0);
                gl_PointSize = a_PointSize;
            }
        `;
            let fSource = `
            precision mediump float;
            uniform vec4 u_FragColor;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            console.info("webgltest vertex shader source:", vSource);
            let a_PointSize = gl.getAttribLocation(p.program, "a_PointSize");
            callback(a_PointSize);
            let vertexAttrib = gl.getVertexAttrib(a_PointSize, gl.CURRENT_VERTEX_ATTRIB);
            finish(vertexAttrib);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0033
         * @tc.name webgl_test_vertexAttrib2fv
         * @tc.desc Test vertexAttrib2fv.
         */
        it('webgl_test_vertexAttrib2fv', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib2fv] vertexAttrib2fv");
            let vSource = `
            attribute float a_PointSize;
            void main(){
                gl_Position = vec4(0.5, 0.5, 1, 1.0);
                gl_PointSize = a_PointSize;
            }
        `;
            let fSource = `
            precision mediump float;
            uniform vec4 u_FragColor;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            console.info("webgltest vertex shader source:", vSource);
            let a_PointSize = gl.getAttribLocation(p.program, "a_PointSize");
            console.info("webgltest vertexAttrib2fv(a_PointSize,new Float32Array([100.0, 100.0, 100.0, 100.0])) ");
            gl.vertexAttrib2fv(a_PointSize, new Float32Array([100.0, 100.0, 100.0, 100.0]));
            let vertexAttrib = gl.getVertexAttrib(a_PointSize, gl.CURRENT_VERTEX_ATTRIB);
            console.info("webgltest a_PointSize value: ", vertexAttrib);
            expect(vertexAttrib[0]).assertEqual(100);
            expect(vertexAttrib[1]).assertEqual(100);
            expect(vertexAttrib[2] != 100).assertTrue();
            expect(vertexAttrib[3] != 100).assertTrue();
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0034
         * @tc.name webgl_test_vertexAttrib2fv_1
         * @tc.desc Test vertexAttrib2fv.
         */
        it('webgl_test_vertexAttrib2fv_1', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib2fv_1] vertexAttrib2fv");
            vertexAttrib2fv((attrib) => {
                gl.vertexAttrib2fv(attrib, new Float32Array([-100.0, -100.0]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (attrib) => {
                expect(attrib[0]).assertEqual(-100);
                expect(attrib[1]).assertEqual(-100);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0035
         * @tc.name webgl_test_vertexAttrib2fv_2
         * @tc.desc Test vertexAttrib2fv.
         */
        it('webgl_test_vertexAttrib2fv_2', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib2fv_2] vertexAttrib2fv");
            vertexAttrib2fv((attrib) => {
                gl.vertexAttrib2fv(attrib, new Float32Array([undefined, undefined]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (attrib) => {
                expect(attrib[0].toString()).assertEqual("NaN");
                expect(attrib[1].toString()).assertEqual("NaN");
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0036
         * @tc.name webgl_test_vertexAttrib2fv_3
         * @tc.desc Test vertexAttrib2fv.
         */
        it('webgl_test_vertexAttrib2fv_3', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib2fv_3] vertexAttrib2fv");
            vertexAttrib2fv((attrib) => {
                gl.vertexAttrib2fv(attrib, new Float32Array([null, null]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (attrib) => {
                expect(attrib[0]).assertEqual(0);
                expect(attrib[1]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0037
         * @tc.name webgl_test_vertexAttrib2fv_4
         * @tc.desc Test vertexAttrib2fv.
         */
        it('webgl_test_vertexAttrib2fv_4', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib2fv_4] vertexAttrib2fv");
            vertexAttrib2fv((attrib) => {
                gl.vertexAttrib2fv(attrib, new Float32Array([-100, 100]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (attrib) => {
                expect(attrib[0]).assertEqual(-100);
                expect(attrib[1]).assertEqual(100);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        /**
         * 验证vertexAttrib3fv方法是否可以给顶点 attibute 变量的第3个向量值
         */
        function vertexAttrib3fv(callback, finish) {
            let vSource = `
            attribute float a_PointSize;
            void main(){
                gl_Position = vec4(0.5, 0.5, 1, 1.0);
                gl_PointSize = a_PointSize;
            }
        `;
            let fSource = `
            precision mediump float;
            uniform vec4 u_FragColor;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            console.info("webgltest vertex shader source:", vSource);
            let a_PointSize = gl.getAttribLocation(p.program, "a_PointSize");
            callback(a_PointSize);
            let vertexAttrib = gl.getVertexAttrib(a_PointSize, gl.CURRENT_VERTEX_ATTRIB);
            finish(vertexAttrib);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0038
         * @tc.name webgl_test_vertexAttrib3fv
         * @tc.desc Test vertexAttrib3fv.
         */
        it('webgl_test_vertexAttrib3fv', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib3fv] vertexAttrib3fv");
            let vSource = `
            attribute float a_PointSize;
            void main(){
                gl_Position = vec4(0.5, 0.5, 1, 1.0);
                gl_PointSize = a_PointSize;
            }
        `;
            let fSource = `
            precision mediump float;
            uniform vec4 u_FragColor;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            console.info("webgltest vertex shader source:", vSource);
            let a_PointSize = gl.getAttribLocation(p.program, "a_PointSize");
            console.info("webgltest vertexAttrib3fv(a_PointSize,new Float32Array([100.0, 100.0, 100.0, 100.0])) ");
            gl.vertexAttrib3fv(a_PointSize, new Float32Array([100.0, 100.0, 100.0, 100.0]));
            let vertexAttrib = gl.getVertexAttrib(a_PointSize, gl.CURRENT_VERTEX_ATTRIB);
            console.info("webgltest a_PointSize value: ", vertexAttrib);
            expect(vertexAttrib[0]).assertEqual(100);
            expect(vertexAttrib[1]).assertEqual(100);
            expect(vertexAttrib[2]).assertEqual(100);
            expect(vertexAttrib[3] != 100).assertTrue();
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0039
         * @tc.name webgl_test_vertexAttrib3fv_1
         * @tc.desc Test vertexAttrib3fv.
         */
        it('webgl_test_vertexAttrib3fv_1', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib3fv_1] vertexAttrib3fv");
            vertexAttrib3fv((attrib) => {
                gl.vertexAttrib3fv(attrib, new Float32Array([-100.0, -100.0, -100.0]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (attrib) => {
                expect(attrib[0]).assertEqual(-100);
                expect(attrib[1]).assertEqual(-100);
                expect(attrib[2]).assertEqual(-100);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0040
         * @tc.name webgl_test_vertexAttrib3fv_2
         * @tc.desc Test vertexAttrib3fv.
         */
        it('webgl_test_vertexAttrib3fv_2', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib3fv_2] vertexAttrib3fv");
            vertexAttrib3fv((attrib) => {
                gl.vertexAttrib3fv(attrib, new Float32Array([undefined, undefined, undefined]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (attrib) => {
                expect(attrib[0].toString()).assertEqual("NaN");
                expect(attrib[1].toString()).assertEqual("NaN");
                expect(attrib[2].toString()).assertEqual("NaN");
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0041
         * @tc.name webgl_test_vertexAttrib3fv_3
         * @tc.desc Test vertexAttrib3fv.
         */
        it('webgl_test_vertexAttrib3fv_3', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib3fv_3] vertexAttrib3fv");
            vertexAttrib3fv((attrib) => {
                gl.vertexAttrib3fv(attrib, new Float32Array([null, null, null]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (attrib) => {
                expect(attrib[0]).assertEqual(0);
                expect(attrib[1]).assertEqual(0);
                expect(attrib[2]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0042
         * @tc.name webgl_test_vertexAttrib3fv_4
         * @tc.desc Test vertexAttrib3fv.
         */
        it('webgl_test_vertexAttrib3fv_4', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib3fv_4] vertexAttrib3fv");
            vertexAttrib3fv((attrib) => {
                gl.vertexAttrib3fv(-1, new Float32Array([-100, 100, 100]));
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            }, (attrib) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        /**
         * 验证vertexAttrib4fv方法是否可以给顶点 attibute 变量的第4个向量值
         */
        function vertexAttrib4fv(callback, finish) {
            let vSource = `
            attribute float a_PointSize;
            void main(){
                gl_Position = vec4(0.5, 0.5, 1, 1.0);
                gl_PointSize = a_PointSize;
            }
        `;
            let fSource = `
            precision mediump float;
            uniform vec4 u_FragColor;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            console.info("webgltest vertex shader source:", vSource);
            let a_PointSize = gl.getAttribLocation(p.program, "a_PointSize");
            callback(a_PointSize);
            let vertexAttrib = gl.getVertexAttrib(a_PointSize, gl.CURRENT_VERTEX_ATTRIB);
            finish(vertexAttrib);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0043
         * @tc.name webgl_test_vertexAttrib4fv
         * @tc.desc Test vertexAttrib4fv.
         */
        it('webgl_test_vertexAttrib4fv', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib4fv] vertexAttrib4fv");
            let vSource = `
            attribute float a_PointSize;
            void main(){
                gl_Position = vec4(0.5, 0.5, 1, 1.0);
                gl_PointSize = a_PointSize;
            }
        `;
            let fSource = `
            precision mediump float;
            uniform vec4 u_FragColor;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            console.info("webgltest vertex shader source:", vSource);
            let a_PointSize = gl.getAttribLocation(p.program, "a_PointSize");
            console.info("webgltest vertexAttrib4fv(a_PointSize,new Float32Array([100.0, 100.0, 100.0, 100.0])) ");
            gl.vertexAttrib4fv(a_PointSize, new Float32Array([100.0, 100.0, 100.0, 100.0]));
            let vertexAttrib = gl.getVertexAttrib(a_PointSize, gl.CURRENT_VERTEX_ATTRIB);
            console.info("webgltest a_PointSize value: ", vertexAttrib);
            expect(vertexAttrib[0]).assertEqual(100);
            expect(vertexAttrib[1]).assertEqual(100);
            expect(vertexAttrib[2]).assertEqual(100);
            expect(vertexAttrib[3]).assertEqual(100);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0044
         * @tc.name webgl_test_vertexAttrib4fv_1
         * @tc.desc Test vertexAttrib4fv.
         */
        it('webgl_test_vertexAttrib4fv_1', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib4fv_1] vertexAttrib4fv");
            vertexAttrib4fv((attrib) => {
                gl.vertexAttrib4fv(attrib, new Float32Array([-100.0, -100.0, -100.0, -100.0]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (attrib) => {
                expect(attrib[0]).assertEqual(-100);
                expect(attrib[1]).assertEqual(-100);
                expect(attrib[2]).assertEqual(-100);
                expect(attrib[3]).assertEqual(-100);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0045
         * @tc.name webgl_test_vertexAttrib4fv_2
         * @tc.desc Test vertexAttrib4fv.
         */
        it('webgl_test_vertexAttrib4fv_2', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib4fv_2] vertexAttrib4fv");
            vertexAttrib4fv((attrib) => {
                gl.vertexAttrib4fv(attrib, new Float32Array([undefined, undefined, undefined, undefined]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (attrib) => {
                expect(attrib[0].toString()).assertEqual("NaN");
                expect(attrib[1].toString()).assertEqual("NaN");
                expect(attrib[2].toString()).assertEqual("NaN");
                expect(attrib[3].toString()).assertEqual("NaN");
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0046
         * @tc.name webgl_test_vertexAttrib4fv_3
         * @tc.desc Test vertexAttrib4fv.
         */
        it('webgl_test_vertexAttrib4fv_3', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib4fv_3] vertexAttrib4fv");
            vertexAttrib4fv((attrib) => {
                gl.vertexAttrib4fv(attrib, new Float32Array([null, null, null, null]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (attrib) => {
                expect(attrib[0]).assertEqual(0);
                expect(attrib[1]).assertEqual(0);
                expect(attrib[2]).assertEqual(0);
                expect(attrib[3]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0047
         * @tc.name webgl_test_vertexAttrib4fv_4
         * @tc.desc Test vertexAttrib4fv.
         */
        it('webgl_test_vertexAttrib4fv_4', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttrib4fv_4] vertexAttrib4fv");
            vertexAttrib4fv((attrib) => {
                gl.vertexAttrib4fv(-1, new Float32Array([-100, 100, 100, 100]));
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            }, (attrib) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        /**
         * 验证getVertexAttrib方法 是否能够返回关于给定位置顶点属性的信息。
         */
        function getVertexAttrib(callback, finish) {
            let vSource = `
            attribute float a_PointSize;
            void main(){
                gl_Position = vec4(0.5, 0.5, 1, 1.0);
                gl_PointSize = a_PointSize;
            }
        `;
            let fSource = `
            precision mediump float;
            uniform vec4 u_FragColor;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            console.info("webgltest vertex shader source:", vSource);
            let a_PointSize = gl.getAttribLocation(p.program, "a_PointSize");
            callback(a_PointSize);
            let vertexAttrib = gl.getVertexAttrib(a_PointSize, gl.CURRENT_VERTEX_ATTRIB);
            finish(vertexAttrib);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0048
         * @tc.name webgl_test_getVertexAttrib
         * @tc.desc Test getVertexAttrib.
         */
        it('webgl_test_getVertexAttrib', 0, async function (done) {
            console.info("webgltest [webgl_test_getVertexAttrib] getVertexAttrib");
            let vSource = `
            attribute float a_PointSize;
            void main(){
                gl_Position = vec4(0.5, 0.5, 1, 1.0);
                gl_PointSize = a_PointSize;
            }
        `;
            let fSource = `
            precision mediump float;
            uniform vec4 u_FragColor;
            void main(){
                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
            }
        `
            let p = createProgram(gl, vSource, fSource);
            console.info("webgltest vertex shader source:", vSource);
            let a_PointSize = gl.getAttribLocation(p.program, "a_PointSize");
            console.info("webgltest vertexAttrib4fv(a_PointSize,new Float32Array([100.0, 100.0, 100.0, 100.0]));");
            gl.vertexAttrib4fv(a_PointSize, new Float32Array([100.0, 100.0, 100.0, 100.0]));
            console.info("webgltest gl.getVertexAttrib(a_PointSize, gl.CURRENT_VERTEX_ATTRIB);");
            let vertexAttrib = gl.getVertexAttrib(a_PointSize, gl.CURRENT_VERTEX_ATTRIB);
            console.info("webgltest a_PointSize value: ", vertexAttrib);
            expect(vertexAttrib[0]).assertEqual(100);
            expect(vertexAttrib[1]).assertEqual(100);
            expect(vertexAttrib[2]).assertEqual(100);
            expect(vertexAttrib[3]).assertEqual(100);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0049
         * @tc.name webgl_test_getVertexAttrib_1
         * @tc.desc Test getVertexAttrib.
         */
        it('webgl_test_getVertexAttrib_1', 0, async function (done) {
            console.info("webgltest [webgl_test_getVertexAttrib_1] getVertexAttrib");
            getVertexAttrib((attrib) => {
                gl.vertexAttrib4fv(attrib, new Float32Array([-100.0, -100.0, -100.0, -100.0]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (attrib) => {
                expect(attrib[0]).assertEqual(-100);
                expect(attrib[1]).assertEqual(-100);
                expect(attrib[2]).assertEqual(-100);
                expect(attrib[3]).assertEqual(-100);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        });


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0050
         * @tc.name webgl_test_getVertexAttrib_2
         * @tc.desc Test getVertexAttrib.
         */
        it('webgl_test_getVertexAttrib_2', 0, async function (done) {
            console.info("webgltest [webgl_test_getVertexAttrib_2] getVertexAttrib");
            getVertexAttrib((attrib) => {
                gl.vertexAttrib4fv(attrib, new Float32Array([undefined, undefined, undefined, undefined]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (attrib) => {
                expect(attrib[0].toString()).assertEqual("NaN");
                expect(attrib[1].toString()).assertEqual("NaN");
                expect(attrib[2].toString()).assertEqual("NaN");
                expect(attrib[3].toString()).assertEqual("NaN");
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0051
         * @tc.name webgl_test_getVertexAttrib_3
         * @tc.desc Test getVertexAttrib.
         */
        it('webgl_test_getVertexAttrib_3', 0, async function (done) {
            console.info("webgltest [webgl_test_getVertexAttrib_3] getVertexAttrib");
            getVertexAttrib((attrib) => {
                gl.vertexAttrib4fv(attrib, new Float32Array([null, null, null, null]));
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (attrib) => {
                expect(attrib[0]).assertEqual(0);
                expect(attrib[1]).assertEqual(0);
                expect(attrib[2]).assertEqual(0);
                expect(attrib[3]).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0052
         * @tc.name webgl_test_getVertexAttrib_4
         * @tc.desc Test getVertexAttrib.
         */
        it('webgl_test_getVertexAttrib_4', 0, async function (done) {
            console.info("webgltest [webgl_test_getVertexAttrib_4] getVertexAttrib");
            getVertexAttrib((attrib) => {
                gl.vertexAttrib4fv(-1, new Float32Array([-100, 100, 100, 100]));
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            }, (attrib) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        /**
         * WebGL API 的 WebGLRenderingContext.vertexAttribPointer（）
         * 方法绑定了当前绑定到 gl 的缓冲区。
         * ARRAY_BUFFER到当前顶点缓冲区对象的通用顶点属性并指定其布局。
         */
        function vertexAttribPointer(callback, finish) {
            let vSource = `
            attribute vec4 a_Position;
            attribute vec4 a_Color;
            uniform mat4 u_ModelViewMatrix;
            varying vec4 v_Color;
            void main() {
                gl_Position = u_ModelViewMatrix * a_Position;
                v_Color = a_Color;
            }
        `;
            let fSource = `
            precision mediump float;
            varying vec4 v_Color;
            void main() {
                gl_FragColor = v_Color;
            }
        `
            let p = createProgram(gl, vSource, fSource);
            console.info("webgltest vertex shader source:", vSource);

            let arr = new Float32Array([
                0.0, 0.5, -0.4, 0.4, 1.0, 0.4,
                -0.5, -0.5, -0.4, 0.4, 1.0, 0.4,
                0.5, -0.5, -0.4, 1.0, 0.4, 0.4,

                0.5, 0.4, -0.2, 1.0, 0.4, 0.4,
                -0.5, 0.4, -0.2, 1.0, 1.0, 0.4,
                0.0, -0.6, -0.2, 1.0, 1.0, 0.4,

                0.0, 0.5, 0.0, 0.4, 0.4, 1.0,
                -0.5, -0.5, 0.0, 0.4, 0.4, 1.0,
                0.5, -0.5, 0.0, 1.0, 0.4, 0.4,
            ]);
            let FSIZE = arr.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer(); // 创建缓冲区
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer); // 绑定缓冲区
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW); // 将数据写入缓冲区对象
            let a_Position = gl.getAttribLocation(p.program, 'a_Position'); // 获取attribute变量地址
            let info = getVertexAttribDesc(a_Position);
            callback(a_Position);
            gl.enableVertexAttribArray(a_Position); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)
            info = getVertexAttribDesc(a_Position);
            finish(info);
            gl.disableVertexAttribArray(a_Position);
            gl.deleteBuffer(buffer);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0053
         * @tc.name webgl_test_vertexAttribPointer
         * @tc.desc Test vertexAttribPointer.
         */
        it('webgl_test_vertexAttribPointer', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttribPointer] vertexAttribPointer");
            let vSource = `
            attribute vec4 a_Position;
            attribute vec4 a_Color;
            uniform mat4 u_ModelViewMatrix;
            varying vec4 v_Color;
            void main() {
                gl_Position = u_ModelViewMatrix * a_Position;
                v_Color = a_Color;
            }
        `;
            let fSource = `
            precision mediump float;
            varying vec4 v_Color;
            void main() {
                gl_FragColor = v_Color;
            }
        `
            let p = createProgram(gl, vSource, fSource);
            console.info("webgltest vertex shader source:", vSource);

            let arr = new Float32Array([
                0.0, 0.5, -0.4, 0.4, 1.0, 0.4,
                -0.5, -0.5, -0.4, 0.4, 1.0, 0.4,
                0.5, -0.5, -0.4, 1.0, 0.4, 0.4,

                0.5, 0.4, -0.2, 1.0, 0.4, 0.4,
                -0.5, 0.4, -0.2, 1.0, 1.0, 0.4,
                0.0, -0.6, -0.2, 1.0, 1.0, 0.4,

                0.0, 0.5, 0.0, 0.4, 0.4, 1.0,
                -0.5, -0.5, 0.0, 0.4, 0.4, 1.0,
                0.5, -0.5, 0.0, 1.0, 0.4, 0.4,
            ]);
            let FSIZE = arr.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer(); // 创建缓冲区
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer); // 绑定缓冲区
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW); // 将数据写入缓冲区对象

            let a_Position = gl.getAttribLocation(p.program, 'a_Position'); // 获取attribute变量地址
            let info = getVertexAttribDesc(a_Position);
            console.info("webgltest ", JSON.stringify(info));
            expect(info.bufferBinding).assertEqual(null);
            console.info("webgltest gl.vertexAttribPointer(a_Position, 3, gl.FLOAT, false, FSIZE * 6, 0); ");
            gl.vertexAttribPointer(a_Position, 3, gl.FLOAT, false, FSIZE * 6, 0); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_Position); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)
            info = getVertexAttribDesc(a_Position);
            console.info("webgltest ", JSON.stringify(info));
            expect(info.bufferBinding).assertEqual(buffer);
            expect(info.size).assertEqual(3);
            expect(info.type).assertEqual(gl.FLOAT);
            expect(info.normalized).assertEqual(false);
            expect(info.stride).assertEqual(FSIZE * 6);
            gl.disableVertexAttribArray(a_Position);
            gl.deleteBuffer(buffer);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0054
         * @tc.name webgl_test_vertexAttribPointer_1
         * @tc.desc Test vertexAttribPointer.
         */
        it('webgl_test_vertexAttribPointer_1', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttribPointer_1] vertexAttribPointer");
            vertexAttribPointer((attrib) => {
                gl.vertexAttribPointer(attrib, 2, gl.FLOAT, false, 0, 0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (info) => {
                expect(info.size).assertEqual(2);
                expect(info.type).assertEqual(gl.FLOAT);
                expect(info.normalized).assertEqual(false);
                expect(info.stride).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0055
         * @tc.name webgl_test_vertexAttribPointer_2
         * @tc.desc Test vertexAttribPointer.
         */
        it('webgl_test_vertexAttribPointer_2', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttribPointer_2] vertexAttribPointer");
            vertexAttribPointer((attrib) => {
                gl.vertexAttribPointer(-1, 2, gl.FLOAT, false, 0, 0);
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            }, (info) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0056
         * @tc.name webgl_test_vertexAttribPointer_3
         * @tc.desc Test vertexAttribPointer.
         */
        it('webgl_test_vertexAttribPointer_3', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttribPointer_3] vertexAttribPointer");
            vertexAttribPointer((attrib) => {
                gl.vertexAttribPointer(attrib, 2, gl.BYTE, false, 0, 0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (info) => {
                expect(info.size).assertEqual(2);
                expect(info.type).assertEqual(gl.BYTE);
                expect(info.normalized).assertEqual(false);
                expect(info.stride).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0057
         * @tc.name webgl_test_vertexAttribPointer_4
         * @tc.desc Test vertexAttribPointer.
         */
        it('webgl_test_vertexAttribPointer_4', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttribPointer_4] vertexAttribPointer");
            vertexAttribPointer((attrib) => {
                gl.vertexAttribPointer(attrib, 3, gl.SHORT, false, 0, 0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (info) => {
                expect(info.size).assertEqual(3);
                expect(info.type).assertEqual(gl.SHORT);
                expect(info.normalized).assertEqual(false);
                expect(info.stride).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0058
         * @tc.name webgl_test_vertexAttribPointer_5
         * @tc.desc Test vertexAttribPointer.
         */
        it('webgl_test_vertexAttribPointer_5', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttribPointer_5] vertexAttribPointer");
            vertexAttribPointer((attrib) => {
                gl.vertexAttribPointer(attrib, 3, gl.UNSIGNED_BYTE, false, 0, 0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (info) => {
                expect(info.size).assertEqual(3);
                expect(info.type).assertEqual(gl.UNSIGNED_BYTE);
                expect(info.normalized).assertEqual(false);
                expect(info.stride).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0059
         * @tc.name webgl_test_vertexAttribPointer_6
         * @tc.desc Test vertexAttribPointer.
         */
        it('webgl_test_vertexAttribPointer_6', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttribPointer_6] vertexAttribPointer");
            vertexAttribPointer((attrib) => {
                gl.vertexAttribPointer(attrib, 3, gl.UNSIGNED_SHORT, false, 0, 0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (info) => {
                expect(info.size).assertEqual(3);
                expect(info.type).assertEqual(gl.UNSIGNED_SHORT);
                expect(info.normalized).assertEqual(false);
                expect(info.stride).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0060
         * @tc.name webgl_test_vertexAttribPointer_7
         * @tc.desc Test vertexAttribPointer.
         */
        it('webgl_test_vertexAttribPointer_7', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttribPointer_7] vertexAttribPointer");
            vertexAttribPointer((attrib) => {
                gl.vertexAttribPointer(attrib, 3, gl.UNSIGNED_SHORT, true, 0, 0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (info) => {
                expect(info.size).assertEqual(3);
                expect(info.type).assertEqual(gl.UNSIGNED_SHORT);
                expect(info.normalized).assertEqual(true);
                expect(info.stride).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0061
         * @tc.name webgl_test_vertexAttribPointer_8
         * @tc.desc Test vertexAttribPointer.
         */
        it('webgl_test_vertexAttribPointer_8', 0, async function (done) {
            console.info("webgltest [webgl_test_vertexAttribPointer_8] vertexAttribPointer");
            vertexAttribPointer((attrib) => {
                gl.vertexAttribPointer(attrib, 3, gl.UNSIGNED_SHORT, true, 2, 0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (info) => {
                console.log(info);
                expect(info.size).assertEqual(3);
                expect(info.type).assertEqual(gl.UNSIGNED_SHORT);
                expect(info.normalized).assertEqual(true);
                expect(info.stride).assertEqual(2);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        /**
         * enableVertexAttribArray方法再给定的索引位置打开通用顶点数组。
         */
        function enableVertexAttribArray(callback, finish) {
            let vSource = `
            attribute vec4 a_Position;
            attribute vec4 a_Color;
            uniform mat4 u_ModelViewMatrix;
            varying vec4 v_Color;
            void main() {
                gl_Position = u_ModelViewMatrix * a_Position;
                v_Color = a_Color;
            }
        `;
            let fSource = `
            precision mediump float;
            varying vec4 v_Color;
            void main() {
                gl_FragColor = v_Color;
            }
        `
            let p = createProgram(gl, vSource, fSource);
            console.info("webgltest vertex shader source:", vSource);

            let arr = new Float32Array([
                0.0, 0.5, -0.4, 0.4, 1.0, 0.4,
                -0.5, -0.5, -0.4, 0.4, 1.0, 0.4,
                0.5, -0.5, -0.4, 1.0, 0.4, 0.4,

                0.5, 0.4, -0.2, 1.0, 0.4, 0.4,
                -0.5, 0.4, -0.2, 1.0, 1.0, 0.4,
                0.0, -0.6, -0.2, 1.0, 1.0, 0.4,

                0.0, 0.5, 0.0, 0.4, 0.4, 1.0,
                -0.5, -0.5, 0.0, 0.4, 0.4, 1.0,
                0.5, -0.5, 0.0, 1.0, 0.4, 0.4,
            ]);
            let FSIZE = arr.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer(); // 创建缓冲区
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer); // 绑定缓冲区
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW); // 将数据写入缓冲区对象
            let a_Position = gl.getAttribLocation(p.program, 'a_Position'); // 获取attribute变量地址
            let info = getVertexAttribDesc(a_Position);
            console.info("webgltest enable:", info.enable);
            gl.vertexAttribPointer(a_Position, 3, gl.FLOAT, false, FSIZE * 6, 0); // 将缓冲区对象分配给一个attribute变量
            callback(a_Position);
            info = getVertexAttribDesc(a_Position);
            finish(info);
            gl.disableVertexAttribArray(a_Position); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)
            gl.deleteBuffer(buffer);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0062
         * @tc.name webgl_test_enableVertexAttribArray
         * @tc.desc Test enableVertexAttribArray.
         */
        it('webgl_test_enableVertexAttribArray', 0, async function (done) {
            console.info("webgltest [webgl_test_enableVertexAttribArray] enableVertexAttribArray");
            let vSource = `
            attribute vec4 a_Position;
            attribute vec4 a_Color;
            uniform mat4 u_ModelViewMatrix;
            varying vec4 v_Color;
            void main() {
                gl_Position = u_ModelViewMatrix * a_Position;
                v_Color = a_Color;
            }
        `;
            let fSource = `
            precision mediump float;
            varying vec4 v_Color;
            void main() {
                gl_FragColor = v_Color;
            }
        `
            let p = createProgram(gl, vSource, fSource);
            console.info("webgltest vertex shader source:", vSource);

            let arr = new Float32Array([
                0.0, 0.5, -0.4, 0.4, 1.0, 0.4,
                -0.5, -0.5, -0.4, 0.4, 1.0, 0.4,
                0.5, -0.5, -0.4, 1.0, 0.4, 0.4,

                0.5, 0.4, -0.2, 1.0, 0.4, 0.4,
                -0.5, 0.4, -0.2, 1.0, 1.0, 0.4,
                0.0, -0.6, -0.2, 1.0, 1.0, 0.4,

                0.0, 0.5, 0.0, 0.4, 0.4, 1.0,
                -0.5, -0.5, 0.0, 0.4, 0.4, 1.0,
                0.5, -0.5, 0.0, 1.0, 0.4, 0.4,
            ]);
            let FSIZE = arr.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW);

            let a_Position = gl.getAttribLocation(p.program, 'a_Position');
            let info = getVertexAttribDesc(a_Position);
            console.info("webgltest enable:", info.enable);
            gl.vertexAttribPointer(a_Position, 3, gl.FLOAT, false, FSIZE * 6, 0);
            expect(info.enable).assertEqual(false);
            console.info("webgltest gl.enableVertexAttribArray(a_Position);");
            gl.enableVertexAttribArray(a_Position);
            info = getVertexAttribDesc(a_Position);
            console.info("webgltest enable:", info.enable);
            expect(info.enable).assertEqual(true);
            gl.disableVertexAttribArray(a_Position);
            gl.deleteBuffer(buffer);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0063
         * @tc.name webgl_test_enableVertexAttribArray_1
         * @tc.desc Test enableVertexAttribArray.
         */
        it('webgl_test_enableVertexAttribArray_1', 0, async function (done) {
            console.info("webgltest [webgl_test_enableVertexAttribArray_1] enableVertexAttribArray");
            enableVertexAttribArray((attrib) => {
                gl.enableVertexAttribArray(attrib);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (info) => {
                expect(info.enable).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0064
         * @tc.name webgl_test_enableVertexAttribArray_2
         * @tc.desc Test enableVertexAttribArray.
         */
        it('webgl_test_enableVertexAttribArray_2', 0, async function (done) {
            console.info("webgltest [webgl_test_enableVertexAttribArray_2] enableVertexAttribArray");
            enableVertexAttribArray((attrib) => {
                gl.enableVertexAttribArray(-1);
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            }, (info) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        /**
         * enableVertexAttribArray方法再给定的索引位置关闭通用顶点数组。
         */

        function disableVertexAttribArray(callback, finish) {
            let vSource = `
            attribute vec4 a_Position;
            attribute vec4 a_Color;
            uniform mat4 u_ModelViewMatrix;
            varying vec4 v_Color;
            void main() {
                gl_Position = u_ModelViewMatrix * a_Position;
                v_Color = a_Color;
            }
        `;
            let fSource = `
            precision mediump float;
            varying vec4 v_Color;
            void main() {
                gl_FragColor = v_Color;
            }
        `
            let p = createProgram(gl, vSource, fSource);
            console.info("webgltest vertex shader source:", vSource);

            let arr = new Float32Array([
                0.0, 0.5, -0.4, 0.4, 1.0, 0.4,
                -0.5, -0.5, -0.4, 0.4, 1.0, 0.4,
                0.5, -0.5, -0.4, 1.0, 0.4, 0.4,

                0.5, 0.4, -0.2, 1.0, 0.4, 0.4,
                -0.5, 0.4, -0.2, 1.0, 1.0, 0.4,
                0.0, -0.6, -0.2, 1.0, 1.0, 0.4,

                0.0, 0.5, 0.0, 0.4, 0.4, 1.0,
                -0.5, -0.5, 0.0, 0.4, 0.4, 1.0,
                0.5, -0.5, 0.0, 1.0, 0.4, 0.4,
            ]);

            let FSIZE = arr.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW);

            let a_Position = gl.getAttribLocation(p.program, 'a_Position');
            let info = getVertexAttribDesc(a_Position);
            console.info("webgltest enable:", info.enable);
            gl.vertexAttribPointer(a_Position, 3, gl.FLOAT, false, FSIZE * 6, 0);
            gl.enableVertexAttribArray(a_Position);
            info = getVertexAttribDesc(a_Position);
            callback(a_Position);
            info = getVertexAttribDesc(a_Position);
            finish(info);
            gl.deleteBuffer(buffer);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0065
         * @tc.name webgl_test_disableVertexAttribArray
         * @tc.desc Test disableVertexAttribArray.
         */
        it('webgl_test_disableVertexAttribArray', 0, async function (done) {
            console.info("webgltest [webgl_test_disableVertexAttribArray] disableVertexAttribArray");
            let vSource = `
            attribute vec4 a_Position;
            attribute vec4 a_Color;
            uniform mat4 u_ModelViewMatrix;
            varying vec4 v_Color;
            void main() {
                gl_Position = u_ModelViewMatrix * a_Position;
                v_Color = a_Color;
            }
        `;
            let fSource = `
            precision mediump float;
            varying vec4 v_Color;
            void main() {
                gl_FragColor = v_Color;
            }
        `
            let p = createProgram(gl, vSource, fSource);
            console.info("webgltest vertex shader source:", vSource);

            let arr = new Float32Array([
                0.0, 0.5, -0.4, 0.4, 1.0, 0.4,
                -0.5, -0.5, -0.4, 0.4, 1.0, 0.4,
                0.5, -0.5, -0.4, 1.0, 0.4, 0.4,

                0.5, 0.4, -0.2, 1.0, 0.4, 0.4,
                -0.5, 0.4, -0.2, 1.0, 1.0, 0.4,
                0.0, -0.6, -0.2, 1.0, 1.0, 0.4,

                0.0, 0.5, 0.0, 0.4, 0.4, 1.0,
                -0.5, -0.5, 0.0, 0.4, 0.4, 1.0,
                0.5, -0.5, 0.0, 1.0, 0.4, 0.4,
            ]);

            let FSIZE = arr.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer(); // 创建缓冲区
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer); // 绑定缓冲区
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW); // 将数据写入缓冲区对象

            let a_Position = gl.getAttribLocation(p.program, 'a_Position'); // 获取attribute变量地址
            let info = getVertexAttribDesc(a_Position);
            console.info("webgltest enable:", info.enable);
            gl.vertexAttribPointer(a_Position, 3, gl.FLOAT, false, FSIZE * 6, 0); // 将缓冲区对象分配给一个attribute变量
            expect(info.enable).assertEqual(false);
            console.info("webgltest gl.enableVertexAttribArray(a_Position);");
            gl.enableVertexAttribArray(a_Position); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)
            info = getVertexAttribDesc(a_Position);
            console.info("webgltest enable:", info.enable);
            expect(info.enable).assertEqual(true);
            console.info("webgltest gl.disableVertexAttribArray(a_Position);");
            gl.disableVertexAttribArray(a_Position);
            info = getVertexAttribDesc(a_Position);
            console.info("webgltest enable:", info.enable);
            expect(info.enable).assertEqual(false);
            gl.deleteBuffer(buffer);
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0066
         * @tc.name webgl_test_disableVertexAttribArray_1
         * @tc.desc Test disableVertexAttribArray.
         */
        it('webgl_test_disableVertexAttribArray_1', 0, async function (done) {
            console.info("webgltest [webgl_test_disableVertexAttribArray_1] disableVertexAttribArray");
            disableVertexAttribArray((attrib) => {
                gl.disableVertexAttribArray(attrib);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (info) => {
                expect(info.enable).assertEqual(false);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0067
         * @tc.name webgl_test_disableVertexAttribArray_2
         * @tc.desc Test disableVertexAttribArray.
         */
        it('webgl_test_disableVertexAttribArray_2', 0, async function (done) {
            console.info("webgltest [webgl_test_disableVertexAttribArray_2] disableVertexAttribArray");
            disableVertexAttribArray((attrib) => {
                gl.disableVertexAttribArray(-1);
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
                gl.disableVertexAttribArray(attrib);
            }, (info) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0068
         * @tc.name webgl_test_disableVertexAttribArray_3
         * @tc.desc Test disableVertexAttribArray.
         */
        it('webgl_test_disableVertexAttribArray_3', 0, async function (done) {
            console.info("webgltest [webgl_test_disableVertexAttribArray_3] disableVertexAttribArray");
            disableVertexAttribArray((attrib) => {
                gl.disableVertexAttribArray(null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
                gl.disableVertexAttribArray(attrib);
            }, (info) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        /**
         * bindAttribLocation方法将通用顶点索引绑定到属性变量
         */
        function bindAttribLocation(callback, finish) {
            let vSource = `
            attribute vec4 a_Position;
            attribute vec4 a_Color;
            varying vec4 v_Color;
            void main() {
                gl_Position = a_Position;
                v_Color = a_Color;
            }
        `;
            let fSource = `
            precision mediump float;
            varying vec4 v_Color;
            void main() {
                gl_FragColor = v_Color;
            }
        `
            let p = createProgram(gl, vSource, fSource, (it) => {
                gl.bindAttribLocation(it, 11, "a_Position");
            });
            let a_Position = gl.getAttribLocation(p.program, "a_Position");
            callback(p.program, a_Position);
            gl.linkProgram(p.program);
            a_Position = gl.getAttribLocation(p.program, "a_Position");
            finish(a_Position)
            gl.bindAttribLocation(p.program, 0, "a_Position");
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0069
         * @tc.name webgl_test_bindAttribLocation
         * @tc.desc Test bindAttribLocation.
         */
        it('webgl_test_bindAttribLocation', 0, async function (done) {
            console.info("webgltest [webgl_test_bindAttribLocation] bindAttribLocation");
            let vSource = `
            attribute vec4 a_Position;
            attribute vec4 a_Color;
            varying vec4 v_Color;
            void main() {
                gl_Position = a_Position;
                v_Color = a_Color;
            }
        `;
            let fSource = `
            precision mediump float;
            varying vec4 v_Color;
            void main() {
                gl_FragColor = v_Color;
            }
        `
            let p = createProgram(gl, vSource, fSource, (it) => {
                console.info("webgltest gl.bindAttribLocation(it, 11, 'a_Position');");
                gl.bindAttribLocation(it, 11, "a_Position");
            });
            let a_Position = gl.getAttribLocation(p.program, "a_Position");
            console.info("webgltest a_Position:", a_Position);
            expect(a_Position).assertEqual(11);
            console.info("webgltest gl.bindAttribLocation(p.program, 12, 'a_Position');");
            gl.bindAttribLocation(p.program, 12, "a_Position");
            console.info("webgltest gl.linkProgram(p.program);");
            gl.linkProgram(p.program);
            a_Position = gl.getAttribLocation(p.program, "a_Position");
            console.info("webgltest a_Position:", a_Position);
            expect(a_Position).assertEqual(12);
            gl.bindAttribLocation(p.program, 0, "a_Position");
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0070
         * @tc.name webgl_test_bindAttribLocation_1
         * @tc.desc Test bindAttribLocation.
         */
        it('webgl_test_bindAttribLocation_1', 0, async function (done) {
            console.info("webgltest [webgl_test_bindAttribLocation_1] bindAttribLocation");
            bindAttribLocation((program, attrib) => {
                gl.bindAttribLocation(program, 12, "a_Position");
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (attrib) => {
                expect(attrib).assertEqual(12);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0071
         * @tc.name webgl_test_bindAttribLocation_2
         * @tc.desc Test bindAttribLocation.
         */
        it('webgl_test_bindAttribLocation_2', 0, async function (done) {
            console.info("webgltest [webgl_test_bindAttribLocation_2] bindAttribLocation");
            bindAttribLocation((program, attrib) => {
                gl.bindAttribLocation(program, 12, "a");
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (attrib) => {
                expect(attrib).assertEqual(11);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0072
         * @tc.name webgl_test_bindAttribLocation_3
         * @tc.desc Test bindAttribLocation.
         */
        it('webgl_test_bindAttribLocation_3', 0, async function (done) {
            console.info("webgltest [webgl_test_bindAttribLocation_3] bindAttribLocation");
            bindAttribLocation((program, attrib) => {
                gl.bindAttribLocation(program, null, null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (attrib) => {
                expect(attrib).assertEqual(11);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0073
         * @tc.name webgl_test_bindAttribLocation_4
         * @tc.desc Test bindAttribLocation.
         */
        it('webgl_test_bindAttribLocation_4', 0, async function (done) {
            console.info("webgltest [webgl_test_bindAttribLocation_4] bindAttribLocation");
            bindAttribLocation((program, attrib) => {
                gl.bindAttribLocation(program, -1, attrib);
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            }, (attrib) => {
                expect(attrib).assertEqual(11);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        /**
         * 返回指定顶点属性的地址
         */
        function getVertexAttribOffset(callback, finish) {
            let vSource = `
            attribute vec4 a_Position;
            attribute vec4 a_Color;
            uniform mat4 u_ModelViewMatrix;
            varying vec4 v_Color;
            void main() {
                gl_Position = u_ModelViewMatrix * a_Position;
                v_Color = a_Color;
            }
        `;
            let fSource = `
            precision mediump float;
            varying vec4 v_Color;
            void main() {
                gl_FragColor = v_Color;
            }
        `
            let p = createProgram(gl, vSource, fSource);
            console.info("webgltest vertex shader source:", vSource);
            let arr = new Float32Array([
                0.0, 0.5, -0.4, 0.4, 1.0, 0.4,
                -0.5, -0.5, -0.4, 0.4, 1.0, 0.4,
                0.5, -0.5, -0.4, 1.0, 0.4, 0.4,

                0.5, 0.4, -0.2, 1.0, 0.4, 0.4,
                -0.5, 0.4, -0.2, 1.0, 1.0, 0.4,
                0.0, -0.6, -0.2, 1.0, 1.0, 0.4,

                0.0, 0.5, 0.0, 0.4, 0.4, 1.0,
                -0.5, -0.5, 0.0, 0.4, 0.4, 1.0,
                0.5, -0.5, 0.0, 1.0, 0.4, 0.4,
            ]);

            let FSIZE = arr.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer(); // 创建缓冲区
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer); // 绑定缓冲区
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW); // 将数据写入缓冲区对象
            let a_Position = gl.getAttribLocation(p.program, 'a_Position'); // 获取attribute变量地址
            gl.vertexAttribPointer(a_Position, 3, gl.FLOAT, false, FSIZE * 6, 0); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_Position); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)
            let positionOffset = gl.getVertexAttribOffset(a_Position, gl.VERTEX_ATTRIB_ARRAY_POINTER);
            let a_Color = gl.getAttribLocation(gl.program, 'a_Color'); // 获取attribute变量地址
            callback(a_Color, FSIZE);
            let colorOffset = gl.getVertexAttribOffset(a_Color, gl.VERTEX_ATTRIB_ARRAY_POINTER);
            finish(colorOffset, FSIZE);
            gl.enableVertexAttribArray(a_Color); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)
            gl.disableVertexAttribArray(a_Position);
            gl.disableVertexAttribArray(a_Color);
            gl.deleteBuffer(buffer)
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
        }

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0074
         * @tc.name webgl_test_getVertexAttribOffset
         * @tc.desc Test getVertexAttribOffset.
         */
        it('webgl_test_getVertexAttribOffset', 0, async function (done) {
            console.info("webgltest [webgl_test_getVertexAttribOffset] getVertexAttribOffset");
            let vSource = `
            attribute vec4 a_Position;
            attribute vec4 a_Color;
            uniform mat4 u_ModelViewMatrix;
            varying vec4 v_Color;
            void main() {
                gl_Position = u_ModelViewMatrix * a_Position;
                v_Color = a_Color;
            }
        `;
            let fSource = `
            precision mediump float;
            varying vec4 v_Color;
            void main() {
                gl_FragColor = v_Color;
            }
        `
            let p = createProgram(gl, vSource, fSource);
            console.info("webgltest vertex shader source:", vSource);

            let arr = new Float32Array([
                0.0, 0.5, -0.4, 0.4, 1.0, 0.4,
                -0.5, -0.5, -0.4, 0.4, 1.0, 0.4,
                0.5, -0.5, -0.4, 1.0, 0.4, 0.4,

                0.5, 0.4, -0.2, 1.0, 0.4, 0.4,
                -0.5, 0.4, -0.2, 1.0, 1.0, 0.4,
                0.0, -0.6, -0.2, 1.0, 1.0, 0.4,

                0.0, 0.5, 0.0, 0.4, 0.4, 1.0,
                -0.5, -0.5, 0.0, 0.4, 0.4, 1.0,
                0.5, -0.5, 0.0, 1.0, 0.4, 0.4,
            ]);

            let FSIZE = arr.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer(); // 创建缓冲区
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer); // 绑定缓冲区
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW); // 将数据写入缓冲区对象

            let a_Position = gl.getAttribLocation(p.program, 'a_Position'); // 获取attribute变量地址
            console.info("webgltest gl.vertexAttribPointer(a_Position, 3, gl.FLOAT, false, FSIZE * 6, 0);");
            gl.vertexAttribPointer(a_Position, 3, gl.FLOAT, false, FSIZE * 6, 0); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_Position); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)
            let positionOffset = gl.getVertexAttribOffset(a_Position, gl.VERTEX_ATTRIB_ARRAY_POINTER);
            console.info("webgltest positionOffset:", positionOffset);
            let a_Color = gl.getAttribLocation(gl.program, 'a_Color'); // 获取attribute变量地址
            console.info("webgltest gl.vertexAttribPointer(a_Color, 3, gl.FLOAT, false, FSIZE * 6, FSIZE * 3);");
            gl.vertexAttribPointer(a_Color, 3, gl.FLOAT, false, FSIZE * 6, FSIZE * 3); // 将缓冲区对象分配给一个attribute变量
            let colorOffset = gl.getVertexAttribOffset(a_Color, gl.VERTEX_ATTRIB_ARRAY_POINTER);
            gl.enableVertexAttribArray(a_Color); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)
            console.info("webgltest colorOffset:", colorOffset);
            console.info("webgltest FSIZE:", FSIZE);
            expect(positionOffset).assertEqual(0);
            expect(colorOffset).assertEqual(FSIZE * 3);
            gl.disableVertexAttribArray(a_Position);
            gl.disableVertexAttribArray(a_Color);
            gl.deleteBuffer(buffer)
            gl.deleteShader(p.vertexShader);
            gl.deleteShader(p.fragmentShader);
            gl.deleteProgram(p.program);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0075
         * @tc.name webgl_test_getVertexAttribOffset_1
         * @tc.desc Test getVertexAttribOffset.
         */
        it('webgl_test_getVertexAttribOffset_1', 0, async function (done) {
            console.info("webgltest [webgl_test_getVertexAttribOffset_1] getVertexAttribOffset");
            getVertexAttribOffset((val, FSIZE) => {
                gl.vertexAttribPointer(val, 3, gl.FLOAT, false, FSIZE * 6, FSIZE * 3);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (val, FSIZE) => {
                expect(val).assertEqual(FSIZE * 3);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0076
         * @tc.name webgl_test_getVertexAttribOffset_2
         * @tc.desc Test getVertexAttribOffset.
         */
        it('webgl_test_getVertexAttribOffset_2', 0, async function (done) {
            console.info("webgltest [webgl_test_getVertexAttribOffset_2] getVertexAttribOffset");
            getVertexAttribOffset((val, FSIZE) => {
                gl.vertexAttribPointer(val, 3, gl.FLOAT, false, FSIZE * 6, -FSIZE * 3);
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            }, (val, FSIZE) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0077
         * @tc.name webgl_test_getVertexAttribOffset_3
         * @tc.desc Test getVertexAttribOffset.
         */
        it('webgl_test_getVertexAttribOffset_3', 0, async function (done) {
            console.info("webgltest [webgl_test_getVertexAttribOffset_3] getVertexAttribOffset");
            getVertexAttribOffset((val, FSIZE) => {
                gl.vertexAttribPointer(val, 3, gl.FLOAT, false, FSIZE * 6, null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (val, FSIZE) => {
                expect(val).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0078
         * @tc.name webgl_test_getVertexAttribOffset_4
         * @tc.desc Test getVertexAttribOffset.
         */
        it('webgl_test_getVertexAttribOffset_4', 0, async function (done) {
            console.info("webgltest [webgl_test_getVertexAttribOffset_4] getVertexAttribOffset");
            getVertexAttribOffset((val, FSIZE) => {
                gl.vertexAttribPointer(val, 3, gl.FLOAT, false, FSIZE * 6, undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (val, FSIZE) => {
                expect(val).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        /**
         * drawArrays 用于从向量数组中绘制图元
         */
        function drawArrays(callback, finish) {
            let srcViewport = gl.getParameter(gl.VIEWPORT);
            let {program, vertexShader, fragmentShader} = createProgram(gl, `
                attribute vec4 a_Position;
                attribute float a_PointSize;
                attribute vec4 a_Color;
                varying vec4 v_Color;
                void main(){
                    gl_Position = a_Position;
                    gl_PointSize = a_PointSize;
                    v_Color = a_Color;
                }
            `, `
                precision mediump float;
                varying vec4 v_Color;
                void main(){
                    gl_FragColor = v_Color;
                }
            `);
            gl.clearColor(0.92, 0.92, 0.92, 1);
            gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT | gl.STENCIL_BUFFER_BIT);
            let arr = new Float32Array([
                0.0, 0.5, 20.0, 1.0, 0.0, 0.0,
                -0.5, -0.5, 40.0, 0.0, 1.0, 0.0,
                0.5, -0.5, 60.0, 0.0, 0.0, 1.0,
            ]);
            let FSIZE = arr.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer(); // 创建缓冲区
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer); // 绑定缓冲区
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW); // 将数据写入缓冲区对象

            let a_Position = gl.getAttribLocation(gl.program, 'a_Position'); // 获取attribute变量地址
            gl.vertexAttribPointer(a_Position, 2, gl.FLOAT, false, FSIZE * 6, 0); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_Position); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)

            let a_PointSize = gl.getAttribLocation(gl.program, 'a_PointSize');
            gl.vertexAttribPointer(a_PointSize, 1, gl.FLOAT, false, FSIZE * 6, FSIZE * 2);
            gl.enableVertexAttribArray(a_PointSize); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)

            let a_Color = gl.getAttribLocation(gl.program, 'a_Color');
            gl.vertexAttribPointer(a_Color, 3, gl.FLOAT, false, FSIZE * 6, FSIZE * 3);
            gl.enableVertexAttribArray(a_Color); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)

            let n = arr.length / 6;
            gl.viewport(0, 0, 800, 800);
            callback(n)
            finish()
            gl.viewport(srcViewport[0],srcViewport[1],srcViewport[2],srcViewport[3]);
            gl.disableVertexAttribArray(a_Position);
            gl.disableVertexAttribArray(a_PointSize);
            gl.disableVertexAttribArray(a_Color);
            gl.deleteBuffer(buffer);
            gl.detachShader(program, vertexShader);
            gl.deleteShader(vertexShader);
            gl.detachShader(program, fragmentShader);
            gl.deleteShader(fragmentShader);
            gl.deleteProgram(program);
            gl.flush();
        }

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0079
         * @tc.name webgl_test_drawArrays
         * @tc.desc Test drawArrays.
         */
        it('webgl_test_drawArrays', 0, async function (done) {
            console.info("webgltest [webgl_test_drawArrays] drawArrays");
            let srcViewport = gl.getParameter(gl.VIEWPORT);
            let {program, vertexShader, fragmentShader} = createProgram(gl, `
                attribute vec4 a_Position;
                attribute float a_PointSize;
                attribute vec4 a_Color;
                varying vec4 v_Color;
                void main(){
                    gl_Position = a_Position;
                    gl_PointSize = a_PointSize;
                    v_Color = a_Color;
                }
            `, `
                precision mediump float;
                varying vec4 v_Color;
                void main(){
                    gl_FragColor = v_Color;
                }
            `);
            gl.clearColor(0.92, 0.92, 0.92, 1);
            gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT | gl.STENCIL_BUFFER_BIT);
            let arr = new Float32Array([
                0.0, 0.5, 20.0, 1.0, 0.0, 0.0,
                -0.5, -0.5, 40.0, 0.0, 1.0, 0.0,
                0.5, -0.5, 60.0, 0.0, 0.0, 1.0,
            ]);
            let FSIZE = arr.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer(); // 创建缓冲区
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer); // 绑定缓冲区
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW); // 将数据写入缓冲区对象

            let a_Position = gl.getAttribLocation(gl.program, 'a_Position'); // 获取attribute变量地址
            gl.vertexAttribPointer(a_Position, 2, gl.FLOAT, false, FSIZE * 6, 0); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_Position); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)

            let a_PointSize = gl.getAttribLocation(gl.program, 'a_PointSize');
            gl.vertexAttribPointer(a_PointSize, 1, gl.FLOAT, false, FSIZE * 6, FSIZE * 2);
            gl.enableVertexAttribArray(a_PointSize); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)

            let a_Color = gl.getAttribLocation(gl.program, 'a_Color');
            gl.vertexAttribPointer(a_Color, 3, gl.FLOAT, false, FSIZE * 6, FSIZE * 3);
            gl.enableVertexAttribArray(a_Color); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)

            let n = arr.length / 6;
            gl.viewport(0, 0, 800, 800);
            gl.drawArrays(gl.TRIANGLES, 0, n);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.disableVertexAttribArray(a_Position);
            gl.disableVertexAttribArray(a_PointSize);
            gl.disableVertexAttribArray(a_Color);
            gl.deleteBuffer(buffer);
            gl.detachShader(program, vertexShader);
            gl.deleteShader(vertexShader);
            gl.detachShader(program, fragmentShader);
            gl.deleteShader(fragmentShader);
            gl.deleteProgram(program);
            gl.flush();
            gl.viewport(srcViewport[0],srcViewport[1],srcViewport[2],srcViewport[3]);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0080
         * @tc.name webgl_test_drawArrays_1
         * @tc.desc Test drawArrays.
         */
        it('webgl_test_drawArrays_1', 0, async function (done) {
            console.info("webgltest [webgl_test_drawArrays_1] drawArrays");
            drawArrays((n) => {
                gl.drawArrays(gl.TRIANGLES, 0, -1);
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0081
         * @tc.name webgl_test_drawArrays_2
         * @tc.desc Test drawArrays.
         */
        it('webgl_test_drawArrays_2', 0, async function (done) {
            console.info("webgltest [webgl_test_drawArrays_2] drawArrays");
            drawArrays((n) => {
                gl.drawArrays(gl.TRIANGLES, 0, null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0082
         * @tc.name webgl_test_drawArrays_3
         * @tc.desc Test drawArrays.
         */
        it('webgl_test_drawArrays_3', 0, async function (done) {
            console.info("webgltest [webgl_test_drawArrays_3] drawArrays");
            drawArrays((n) => {
                gl.drawArrays(gl.TRIANGLES, -1, null);
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0083
         * @tc.name webgl_test_drawArrays_4
         * @tc.desc Test drawArrays.
         */
        it('webgl_test_drawArrays_4', 0, async function (done) {
            console.info("webgltest [webgl_test_drawArrays_4] drawArrays");
            drawArrays((n) => {
                gl.drawArrays(gl.POINTS, 0, n);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0084
         * @tc.name webgl_test_drawArrays_5
         * @tc.desc Test drawArrays.
         */
        it('webgl_test_drawArrays_5', 0, async function (done) {
            console.info("webgltest [webgl_test_drawArrays_5] drawArrays");
            drawArrays((n) => {
                gl.drawArrays(gl.LINE_STRIP, 0, n);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0085
         * @tc.name webgl_test_drawArrays_6
         * @tc.desc Test drawArrays.
         */
        it('webgl_test_drawArrays_6', 0, async function (done) {
            console.info("webgltest [webgl_test_drawArrays_6] drawArrays");
            drawArrays((n) => {
                gl.drawArrays(gl.LINE_LOOP, 0, n);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0086
         * @tc.name webgl_test_drawArrays_7
         * @tc.desc Test drawArrays.
         */
        it('webgl_test_drawArrays_7', 0, async function (done) {
            console.info("webgltest [webgl_test_drawArrays_7] drawArrays");
            drawArrays((n) => {
                gl.drawArrays(gl.LINES, 0, n);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0087
         * @tc.name webgl_test_drawArrays_8
         * @tc.desc Test drawArrays.
         */
        it('webgl_test_drawArrays_8', 0, async function (done) {
            console.info("webgltest [webgl_test_drawArrays_8] drawArrays");
            drawArrays((n) => {
                gl.drawArrays(gl.TRIANGLE_STRIP, 0, n);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0088
         * @tc.name webgl_test_drawArrays_9
         * @tc.desc Test drawArrays.
         */
        it('webgl_test_drawArrays_9', 0, async function (done) {
            console.info("webgltest [webgl_test_drawArrays_9] drawArrays");
            drawArrays((n) => {
                gl.drawArrays(gl.TRIANGLE_FAN, 0, n);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })

        /**
         * drawElements 从数组数据渲染图元
         */
        function drawElements(callback, finish) {
            let srcViewport = gl.getParameter(gl.VIEWPORT);
            let {program, vertexShader, fragmentShader} = createProgram(gl, `
                attribute vec4 a_Position;
                attribute vec4 a_Color;
                uniform mat4 u_MvpMatrix;
                varying vec4 v_Color;
                void main() {
                    gl_Position = u_MvpMatrix * a_Position;
                    v_Color = a_Color;
                }
            `, `
                precision mediump float;
                varying vec4 v_Color;
                void main() {
                    gl_FragColor = v_Color;
                }
            `);
            let arr = new Float32Array([
                1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
                -1.0, 1.0, 1.0, 1.0, 0.0, 1.0,
                -1.0, -1.0, 1.0, 1.0, 0.0, 0.0,
                1.0, -1.0, 1.0, 1.0, 1.0, 0.0,

                1.0, -1.0, -1.0, 0.0, 1.0, 0.0,
                1.0, 1.0, -1.0, 0.0, 1.0, 1.0,
                -1.0, 1.0, -1.0, 0.0, 0.0, 1.0,
                -1.0, -1.0, -1.0, 0.0, 0.0, 0.0,
            ]);
            let indices = new Uint8Array([
                0, 1, 2, 0, 2, 3,
                0, 3, 4, 0, 4, 5,
                0, 5, 6, 0, 6, 1,
                1, 6, 7, 1, 7, 2,
                7, 4, 3, 7, 3, 2,
                4, 7, 6, 4, 6, 5,
            ]);
            let FSIZE = arr.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer(); // 创建缓冲区
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer); // 绑定缓冲区
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW); // 将数据写入缓冲区对象

            let a_Position = gl.getAttribLocation(gl.program, 'a_Position'); // 获取attribute变量地址
            gl.vertexAttribPointer(a_Position, 3, gl.FLOAT, false, FSIZE * 6, 0); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_Position); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)

            let a_Color = gl.getAttribLocation(gl.program, 'a_Color'); // 获取attribute变量地址
            gl.vertexAttribPointer(a_Color, 3, gl.FLOAT, false, FSIZE * 6, FSIZE * 3); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_Color); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)

            let indexBuffer = gl.createBuffer();
            gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, indexBuffer);
            gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, indices, gl.STATIC_DRAW);

            let u_MvpMatrix = gl.getUniformLocation(gl.program, 'u_MvpMatrix');
            gl.clearColor(0.92, 0.92, 0.92, 1);
            gl.clear(gl.COLOR_BUFFER_BIT);
            let srcEnable = gl.isEnabled(gl.DEPTH_TEST);
            gl.enable(gl.DEPTH_TEST);
            gl.enable(gl.POLYGON_OFFSET_FILL);
            gl.polygonOffset(1.0, 1.0);
            gl.uniformMatrix4fv(u_MvpMatrix, false, new Float32Array([
                3.4, -0.5, -0.3, -0.3,
                0, 3.4, -0.3, -0.3,
                -1.4, -1.2, -0.8, -0.8,
                -0.4, -0.5, 6.3, 8.1,
            ]));
            gl.viewport(0, 0, 800, 800);
            callback(indices.length);
            finish();
            gl.viewport(srcViewport[0],srcViewport[1],srcViewport[2],srcViewport[3]);
            gl.disableVertexAttribArray(a_Position);
            gl.disableVertexAttribArray(a_Color);
            gl.bindBuffer(gl.ARRAY_BUFFER, null);
            gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, null);
            gl.deleteBuffer(buffer);
            gl.deleteBuffer(indexBuffer);
            gl.deleteShader(vertexShader);
            gl.deleteShader(fragmentShader);
            gl.deleteProgram(program);
            if (srcEnable) {
                gl.enable(gl.DEPTH_TEST);
            } else {
                gl.disable(gl.DEPTH_TEST);
            }
            gl.disable(gl.POLYGON_OFFSET_FILL);
            gl.flush();
        }

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0089
         * @tc.name webgl_test_drawElements
         * @tc.desc Test drawElements.
         */
        it('webgl_test_drawElements', 0, async function (done) {
            console.info("webgltest [webgl_test_drawElements] drawElements");
            let srcViewport = gl.getParameter(gl.VIEWPORT);
            let {program, vertexShader, fragmentShader} = createProgram(gl, `
                attribute vec4 a_Position;
                attribute vec4 a_Color;
                uniform mat4 u_MvpMatrix;
                varying vec4 v_Color;
                void main() {
                    gl_Position = u_MvpMatrix * a_Position;
                    v_Color = a_Color;
                }
            `, `
                precision mediump float;
                varying vec4 v_Color;
                void main() {
                    gl_FragColor = v_Color;
                }
            `);
            let arr = new Float32Array([
                1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
                -1.0, 1.0, 1.0, 1.0, 0.0, 1.0,
                -1.0, -1.0, 1.0, 1.0, 0.0, 0.0,
                1.0, -1.0, 1.0, 1.0, 1.0, 0.0,

                1.0, -1.0, -1.0, 0.0, 1.0, 0.0,
                1.0, 1.0, -1.0, 0.0, 1.0, 1.0,
                -1.0, 1.0, -1.0, 0.0, 0.0, 1.0,
                -1.0, -1.0, -1.0, 0.0, 0.0, 0.0,
            ]);
            let indices = new Uint8Array([
                0, 1, 2, 0, 2, 3,
                0, 3, 4, 0, 4, 5,
                0, 5, 6, 0, 6, 1,
                1, 6, 7, 1, 7, 2,
                7, 4, 3, 7, 3, 2,
                4, 7, 6, 4, 6, 5,
            ]);
            let FSIZE = arr.BYTES_PER_ELEMENT;
            let buffer = gl.createBuffer(); // 创建缓冲区
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer); // 绑定缓冲区
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW); // 将数据写入缓冲区对象

            let a_Position = gl.getAttribLocation(gl.program, 'a_Position'); // 获取attribute变量地址
            gl.vertexAttribPointer(a_Position, 3, gl.FLOAT, false, FSIZE * 6, 0); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_Position); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)

            let a_Color = gl.getAttribLocation(gl.program, 'a_Color'); // 获取attribute变量地址
            gl.vertexAttribPointer(a_Color, 3, gl.FLOAT, false, FSIZE * 6, FSIZE * 3); // 将缓冲区对象分配给一个attribute变量
            gl.enableVertexAttribArray(a_Color); // 开启attribute变量(连接a_Position变量与分配给它的缓冲区对象)

            let indexBuffer = gl.createBuffer();
            gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, indexBuffer);
            gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, indices, gl.STATIC_DRAW);

            let u_MvpMatrix = gl.getUniformLocation(gl.program, 'u_MvpMatrix');

            gl.viewport(0, 0, gl.drawingBufferWidth, gl.drawingBufferHeight);
            gl.clearColor(0.92, 0.92, 0.92, 1);
            gl.clear(gl.COLOR_BUFFER_BIT);
            let srcEnable = gl.isEnabled(gl.DEPTH_TEST);
            gl.enable(gl.DEPTH_TEST);
            gl.enable(gl.POLYGON_OFFSET_FILL);
            gl.polygonOffset(1.0, 1.0);
            gl.uniformMatrix4fv(u_MvpMatrix, false, new Float32Array([
                3.4, -0.5, -0.3, -0.3,
                0, 3.4, -0.3, -0.3,
                -1.4, -1.2, -0.8, -0.8,
                -0.4, -0.5, 6.3, 8.1,
            ]));
            gl.drawElements(gl.TRIANGLES, indices.length, gl.UNSIGNED_BYTE, 0);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.viewport(srcViewport[0],srcViewport[1],srcViewport[2],srcViewport[3]);
            gl.disableVertexAttribArray(a_Position);
            gl.disableVertexAttribArray(a_Color);
            gl.bindBuffer(gl.ARRAY_BUFFER, null);
            gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, null);
            gl.deleteBuffer(buffer);
            gl.deleteBuffer(indexBuffer);
            gl.deleteShader(vertexShader);
            gl.deleteShader(fragmentShader);
            gl.deleteProgram(program);
            if (srcEnable) {
                gl.enable(gl.DEPTH_TEST);
            } else {
                gl.disable(gl.DEPTH_TEST);
            }
            gl.disable(gl.POLYGON_OFFSET_FILL);
            gl.flush();
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0090
         * @tc.name webgl_test_drawElements_1
         * @tc.desc Test drawElements.
         */
        it('webgl_test_drawElements_1', 0, async function (done) {
            console.info("webgltest [webgl_test_drawElements_1] drawElements");
            drawElements((n) => {
                gl.drawElements(gl.TRIANGLES, n, gl.UNSIGNED_BYTE, 0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0091
         * @tc.name webgl_test_drawElements_2
         * @tc.desc Test drawElements.
         */
        it('webgl_test_drawElements_2', 0, async function (done) {
            console.info("webgltest [webgl_test_drawElements_2] drawElements");
            drawElements((n) => {
                gl.drawElements(gl.POINTS, n, gl.UNSIGNED_BYTE, 0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0092
         * @tc.name webgl_test_drawElements_3
         * @tc.desc Test drawElements.
         */
        it('webgl_test_drawElements_3', 0, async function (done) {
            console.info("webgltest [webgl_test_drawElements_3] drawElements");
            drawElements((n) => {
                gl.drawElements(gl.LINE_STRIP, n, gl.UNSIGNED_BYTE, 0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0093
         * @tc.name webgl_test_drawElements_4
         * @tc.desc Test drawElements.
         */
        it('webgl_test_drawElements_4', 0, async function (done) {
            console.info("webgltest [webgl_test_drawElements_4] drawElements");
            drawElements((n) => {
                gl.drawElements(gl.LINE_LOOP, n, gl.UNSIGNED_BYTE, 0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0094
         * @tc.name webgl_test_drawElements_5
         * @tc.desc Test drawElements.
         */
        it('webgl_test_drawElements_5', 0, async function (done) {
            console.info("webgltest [webgl_test_drawElements_5] drawElements");
            drawElements((n) => {
                gl.drawElements(gl.LINES, n, gl.UNSIGNED_BYTE, 0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0095
         * @tc.name webgl_test_drawElements_6
         * @tc.desc Test drawElements.
         */
        it('webgl_test_drawElements_6', 0, async function (done) {
            console.info("webgltest [webgl_test_drawElements_6] drawElements");
            drawElements((n) => {
                gl.drawElements(gl.TRIANGLE_STRIP, n, gl.UNSIGNED_BYTE, 0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0096
         * @tc.name webgl_test_drawElements_7
         * @tc.desc Test drawElements.
         */
        it('webgl_test_drawElements_7', 0, async function (done) {
            console.info("webgltest [webgl_test_drawElements_7] drawElements");
            drawElements((n) => {
                gl.drawElements(gl.TRIANGLE_FAN, n, gl.UNSIGNED_BYTE, 0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0097
         * @tc.name webgl_test_drawElements_8
         * @tc.desc Test drawElements.
         */
        it('webgl_test_drawElements_8', 0, async function (done) {
            console.info("webgltest [webgl_test_drawElements_8] drawElements");
            drawElements((n) => {
                gl.drawElements(gl.TRIANGLES, n, gl.UNSIGNED_SHORT, 0);
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0098
         * @tc.name webgl_test_drawElements_9
         * @tc.desc Test drawElements.
         */
        it('webgl_test_drawElements_9', 0, async function (done) {
            console.info("webgltest [webgl_test_drawElements_9] drawElements");
            drawElements((n) => {
                gl.drawElements(gl.TRIANGLES, n, gl.UNSIGNED_INT, 0);
                expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0099
         * @tc.name webgl_test_drawElements_10
         * @tc.desc Test drawElements.
         */
        it('webgl_test_drawElements_10', 0, async function (done) {
            console.info("webgltest [webgl_test_drawElements_10] drawElements");
            drawElements((n) => {
                gl.drawElements(gl.TRIANGLES, n, gl.UNSIGNED_BYTE, -1);
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ATTRIBUTE_0100
         * @tc.name webgl_test_drawElements_11
         * @tc.desc Test drawElements.
         */
        it('webgl_test_drawElements_11', 0, async function (done) {
            console.info("webgltest [webgl_test_drawElements_11] drawElements");
            drawElements((n) => {
                gl.drawElements(gl.TRIANGLES, n, gl.UNSIGNED_BYTE, null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            })
            done();
        })
    })
}
