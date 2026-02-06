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


export default function webgl1_buffer() {
    
	describe('webgl1_buffer', function () {
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

        /**
         * 创建并初始化一个用于储存顶点数据或着色数据的WebGLBuffer对象
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0001
         * @tc.name webgl_test_createBuffer
         * @tc.desc Test createBuffer.
         */
        it('webgl_test_createBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_createBuffer] createBuffer");
            let buffer = gl.createBuffer();
            console.info("webgltest ", buffer);
            expect(buffer != null).assertTrue();
            console.info("webgltest isBuffer:", gl.isBuffer(buffer));
            expect(gl.isBuffer(buffer) == false).assertTrue();
            console.info("webgltest gl.bindBuffer(gl.ARRAY_BUFFER, buffer);");
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            console.info("webgltest isBuffer:", gl.isBuffer(buffer));
            expect(gl.isBuffer(buffer) == true).assertTrue();
            gl.deleteBuffer(buffer);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })

        /**
         * 判定 给定的WebGLBuffer是否有效
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0002
         * @tc.name webgl_test_isBuffer
         * @tc.desc Test isBuffer.
         */
        it('webgl_test_isBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_isBuffer] isBuffer");
            let buffer = gl.createBuffer();
            console.info("webgltest ", buffer);
            expect(buffer != null).assertTrue();
            console.info("webgltest isBuffer:", gl.isBuffer(buffer));
            expect(gl.isBuffer(buffer) == false).assertTrue();
            console.info("webgltest gl.bindBuffer(gl.ARRAY_BUFFER, buffer);");
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            console.info("webgltest isBuffer:", gl.isBuffer(buffer));
            expect(gl.isBuffer(buffer) == true).assertTrue();
            gl.deleteBuffer(buffer);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0003
         * @tc.name webgl_test_isBuffer_1
         * @tc.desc Test isBuffer.
         */
        it('webgl_test_isBuffer_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_isBuffer_1] isBuffer");
            gl.isBuffer(null);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0004
         * @tc.name webgl_test_isBuffer_2
         * @tc.desc Test isBuffer.
         */
        it('webgl_test_isBuffer_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_isBuffer_2] isBuffer");
            gl.isBuffer(undefined);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * 将给定的 WebGLBuffer 绑定到目标
         */
        function bindBuffer(callback, finish) {
            let buffer = gl.createBuffer();
            expect(buffer != null).assertTrue();
            callback(buffer);
            finish(gl.isBuffer(buffer));
            gl.deleteBuffer(buffer);
        }


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0005
         * @tc.name webgl_test_bindBuffer
         * @tc.desc Test bindBuffer.
         */
        it('webgl_test_bindBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_bindBuffer] bindBuffer");
            let buffer = gl.createBuffer();
            console.info("webgltest ", buffer);
            expect(buffer != null).assertTrue();
            console.info("webgltest isBuffer:", gl.isBuffer(buffer));
            expect(gl.isBuffer(buffer)).assertFalse();
            console.info("webgltest bindBuffer()");
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            expect(gl.isBuffer(buffer)).assertTrue();
            console.info("webgltest isBuffer:", gl.isBuffer(buffer));
            gl.deleteBuffer(buffer);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0006
         * @tc.name webgl_test_bindBuffer_1
         * @tc.desc Test bindBuffer.
         */
        it('webgl_test_bindBuffer_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_bindBuffer_1] bindBuffer");
            bindBuffer((buffer) => {
                gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isBind) => {
                expect(isBind).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0007
         * @tc.name webgl_test_bindBuffer_2
         * @tc.desc Test bindBuffer.
         */
        it('webgl_test_bindBuffer_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_bindBuffer_2] bindBuffer");
            bindBuffer((buffer) => {
                gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, buffer);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isBind) => {
                expect(isBind).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0008
         * @tc.name webgl_test_bindBuffer_3
         * @tc.desc Test bindBuffer.
         */
        it('webgl_test_bindBuffer_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_bindBuffer_3] bindBuffer");
            bindBuffer((buffer) => {
                gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isBind) => {
                expect(isBind).assertEqual(false);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0009
         * @tc.name webgl_test_bindBuffer_4
         * @tc.desc Test bindBuffer.
         */
        it('webgl_test_bindBuffer_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_bindBuffer_4] bindBuffer");
            bindBuffer((buffer) => {
                gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isBind) => {
                expect(isBind).assertEqual(false);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })

        /**
         * 删除给定的 WebGLBuffer 对象
         */
        function deleteBuffer(callback, finish) {
            let buffer = gl.createBuffer();
            expect(buffer != null).assertTrue();
            expect(gl.isBuffer(buffer)).assertFalse();
            callback(buffer);
            finish(gl.isBuffer(buffer));
        }

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0010
         * @tc.name webgl_test_deleteBuffer
         * @tc.desc Test deleteBuffer.
         */
        it('webgl_test_deleteBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_deleteBuffer] deleteBuffer");
            let buffer = gl.createBuffer();
            console.info("webgltest ", buffer);
            expect(buffer != null).assertTrue();
            console.info("webgltest isBuffer:", gl.isBuffer(buffer));
            expect(gl.isBuffer(buffer)).assertFalse();
            console.info("webgltest bindBuffer()");
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            expect(gl.isBuffer(buffer)).assertTrue();
            console.info("webgltest isBuffer:", gl.isBuffer(buffer));
            console.info("webgltest deleteBuffer()");
            gl.deleteBuffer(buffer);
            expect(gl.isBuffer(buffer)).assertFalse();
            console.info("webgltest isBuffer:", gl.isBuffer(buffer));
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0011
         * @tc.name webgl_test_deleteBuffer_1
         * @tc.desc Test deleteBuffer.
         */
        it('webgl_test_deleteBuffer_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_deleteBuffer_1] deleteBuffer");
            deleteBuffer((buffer) => {
                gl.deleteBuffer(buffer);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isDelete) => {
                expect(isDelete).assertEqual(false);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0012
         * @tc.name webgl_test_deleteBuffer_2
         * @tc.desc Test deleteBuffer.
         */
        it('webgl_test_deleteBuffer_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_deleteBuffer_2] deleteBuffer");
            deleteBuffer((buffer) => {
                gl.deleteBuffer(null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isDelete) => {
                expect(isDelete).assertEqual(false);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0013
         * @tc.name webgl_test_deleteBuffer_3
         * @tc.desc Test deleteBuffer.
         */
        it('webgl_test_deleteBuffer_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_deleteBuffer_3] deleteBuffer");
            deleteBuffer((buffer) => {
                gl.deleteBuffer(undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isDelete) => {
                expect(isDelete).assertEqual(false);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })

        /**
         * 创建并初始化了 Buffer 对象的数据存储区
         */
        function bufferData(callback, finish) {
            let arr = new Float32Array([
                0.0, 0.5, -0.5, 0.5, 1.0, 0.5,
            ]);
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            callback(arr);
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW);
            let bufferSize = gl.getBufferParameter(gl.ARRAY_BUFFER, gl.BUFFER_SIZE);
            finish(bufferSize, arr);
            gl.deleteBuffer(buffer);
        }

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0014
         * @tc.name webgl_test_bufferData
         * @tc.desc Test bufferData.
         */
        it('webgl_test_bufferData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_bufferData] bufferData - TypedArray");
            let arr = new Float32Array([
                0.0, 0.5, -0.5, 0.5, 1.0, 0.5,
            ]);
            console.info("webgltest arr:", arr);
            console.info("webgltest arr.BYTES_PER_ELEMENT:", arr.BYTES_PER_ELEMENT);
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            console.info("webgltest gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW);")
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW);
            let bufferSize = gl.getBufferParameter(gl.ARRAY_BUFFER, gl.BUFFER_SIZE);
            console.info("webgltest bufferSize:", bufferSize);
            expect(bufferSize).assertEqual(arr.length * arr.BYTES_PER_ELEMENT);
            gl.deleteBuffer(buffer);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })

        /**
         * 创建并初始化了 Buffer 对象的数据存储区
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0015
         * @tc.name webgl_test_bufferData_1
         * @tc.desc Test bufferData.
         */
        it('webgl_test_bufferData_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_bufferData_1] bufferData - ArrayBuffer");
            let arr = new Float32Array([
                0.0, 0.5, -0.5, 0.5, 1.0, 0.5,
            ]);
            console.info("webgltest arr:", arr);
            console.info("webgltest arr.BYTES_PER_ELEMENT:", arr.BYTES_PER_ELEMENT);
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            console.info("webgltest gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW);")
            gl.bufferData(gl.ARRAY_BUFFER, arr.buffer, gl.STATIC_DRAW);
            let bufferSize = gl.getBufferParameter(gl.ARRAY_BUFFER, gl.BUFFER_SIZE);
            console.info("webgltest bufferSize:", bufferSize);
            expect(bufferSize).assertEqual(arr.length * arr.BYTES_PER_ELEMENT);
            gl.deleteBuffer(buffer);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0016
         * @tc.name webgl_test_bufferData_2
         * @tc.desc Test bufferData.
         */
        it('webgl_test_bufferData_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_bufferData_2] bufferData");
            bufferData((arr) => {
                gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (bufferSize, arr) => {
                expect(bufferSize).assertEqual(arr.length * arr.BYTES_PER_ELEMENT);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0017
         * @tc.name webgl_test_bufferData_3
         * @tc.desc Test bufferData.
         */
        it('webgl_test_bufferData_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_bufferData_3] bufferData");
            bufferData((arr) => {
                gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, arr, gl.STATIC_DRAW);
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            }, (bufferSize, arr) => {
                expect(bufferSize).assertEqual(arr.length * arr.BYTES_PER_ELEMENT);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0018
         * @tc.name webgl_test_bufferData_4
         * @tc.desc Test bufferData.
         */
        it('webgl_test_bufferData_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_bufferData_4] bufferData");
            bufferData((arr) => {
                gl.bufferData(gl.ARRAY_BUFFER, arr, gl.DYNAMIC_DRAW);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (bufferSize, arr) => {
                expect(bufferSize).assertEqual(arr.length * arr.BYTES_PER_ELEMENT);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0019
         * @tc.name webgl_test_bufferData_5
         * @tc.desc Test bufferData.
         */
        it('webgl_test_bufferData_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_bufferData_5] bufferData");
            bufferData((arr) => {
                gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STREAM_DRAW);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (bufferSize, arr) => {
                expect(bufferSize).assertEqual(arr.length * arr.BYTES_PER_ELEMENT);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0020
         * @tc.name webgl_test_bufferData_6
         * @tc.desc Test bufferData.
         */
        it('webgl_test_bufferData_6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_bufferData_6] bufferData");
            bufferData((arr) => {
                gl.bufferData(gl.ARRAY_BUFFER, null, gl.STREAM_DRAW);
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            }, (bufferSize, arr) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0021
         * @tc.name webgl_test_bufferData_7
         * @tc.desc Test bufferData.
         */
        it('webgl_test_bufferData_7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_bufferData_7] bufferData");
            bufferData((arr) => {
                gl.bufferData(gl.ARRAY_BUFFER, undefined, gl.STREAM_DRAW);
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            }, (bufferSize, arr) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0022
         * @tc.name webgl_test_bufferData_8
         * @tc.desc Test bufferData.
         */
        it('webgl_test_bufferData_8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_bufferData_8] bufferData");
            bufferData((arr) => {
                gl.bufferData(gl.ARRAY_BUFFER, -1, gl.STREAM_DRAW);
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            }, (bufferSize, arr) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })

        /**
         * 创建并初始化了 Buffer 对象的数据存储区
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0023
         * @tc.name webgl_test_bufferData_9
         * @tc.desc Test bufferData.
         */
        it('webgl_test_bufferData_9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_bufferData_9] bufferData - number");
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            console.info("webgltest gl.bufferData(gl.ARRAY_BUFFER, 1024, gl.STATIC_DRAW);")
            gl.bufferData(gl.ARRAY_BUFFER, 1024, gl.STATIC_DRAW);
            let bufferSize = gl.getBufferParameter(gl.ARRAY_BUFFER, gl.BUFFER_SIZE);
            console.info("testwebgl bufferSize:", bufferSize);
            expect(bufferSize).assertEqual(1024);
            gl.deleteBuffer(buffer);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })

        /**
         * 获取缓冲区的信息。
         */
        function getBufferParameter(callback, finish) {
            let arr = new Float32Array([
                0.0, 0.5, -0.5, 0.5, 1.0, 0.5,
            ]);
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW);
            callback(arr);
            finish();
            gl.deleteBuffer(buffer);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
        }

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0024
         * @tc.name webgl_test_getBufferParameter
         * @tc.desc Test getBufferParameter.
         */
        it('webgl_test_getBufferParameter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_getBufferParameter] getBufferParameter");
            let arr = new Float32Array([
                0.0, 0.5, -0.5, 0.5, 1.0, 0.5,
            ]);
            console.info("webgltest arr:", arr);
            console.info("webgltest arr.BYTES_PER_ELEMENT:", arr.BYTES_PER_ELEMENT);
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            console.info("webgltest gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW);")
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW);
            console.info("webgltest gl.getBufferParameter(gl.ARRAY_BUFFER,gl.BUFFER_SIZE);")
            let bufferSize = gl.getBufferParameter(gl.ARRAY_BUFFER, gl.BUFFER_SIZE);
            console.info("webgltest bufferSize:", bufferSize);
            expect(bufferSize == arr.length * arr.BYTES_PER_ELEMENT).assertTrue();
            console.info("webgltest gl.bufferData(gl.ARRAY_BUFFER, 1024, gl.STATIC_DRAW);")
            gl.bufferData(gl.ARRAY_BUFFER, 1024, gl.STATIC_DRAW);
            console.info("webgltest gl.getBufferParameter(gl.ARRAY_BUFFER,gl.BUFFER_SIZE);")
            bufferSize = gl.getBufferParameter(gl.ARRAY_BUFFER, gl.BUFFER_SIZE);
            console.info("testwebgl bufferSize:", bufferSize);
            expect(bufferSize).assertEqual(1024);
            gl.deleteBuffer(buffer);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0025
         * @tc.name webgl_test_getBufferParameter_1
         * @tc.desc Test getBufferParameter.
         */
        it('webgl_test_getBufferParameter_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getBufferParameter_1] getBufferParameter");
            getBufferParameter((arr) => {
                let bufferSize = gl.getBufferParameter(gl.ARRAY_BUFFER, gl.BUFFER_SIZE);
                expect(bufferSize == arr.length * arr.BYTES_PER_ELEMENT).assertTrue();
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0026
         * @tc.name webgl_test_getBufferParameter_2
         * @tc.desc Test getBufferParameter.
         */
        it('webgl_test_getBufferParameter_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getBufferParameter_2] getBufferParameter");
            getBufferParameter((arr) => {
                let bufferSize = gl.getBufferParameter(gl.ELEMENT_ARRAY_BUFFER, gl.BUFFER_SIZE);
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0027
         * @tc.name webgl_test_getBufferParameter_3
         * @tc.desc Test getBufferParameter.
         */
        it('webgl_test_getBufferParameter_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getBufferParameter_3] getBufferParameter");
            getBufferParameter((arr) => {
                let bufferSize = gl.getBufferParameter(gl.ARRAY_BUFFER, gl.BUFFER_USAGE);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })

        /**
         * RenderBuffer
         * 创建并初始化 WebGLRenderbuffer 对象。
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0028
         * @tc.name webgl_test_createRenderbuffer
         * @tc.desc Test createRenderbuffer.
         */
        it('webgl_test_createRenderbuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_createRenderbuffer] createRenderbuffer");
            let renderbuffer = gl.createRenderbuffer();
            console.info("webgltest  createRenderbuffer:", renderbuffer);
            expect(renderbuffer != null).assertTrue();
            console.info("webgltest  isRenderbuffer:", gl.isRenderbuffer(renderbuffer));
            expect(gl.isRenderbuffer(renderbuffer)).assertEqual(false);
            console.info("webgltest  gl.bindRenderbuffer(gl.RENDERBUFFER, renderbuffer);");
            gl.bindRenderbuffer(gl.RENDERBUFFER, renderbuffer);
            console.info("webgltest  isRenderbuffer:", gl.isRenderbuffer(renderbuffer));
            expect(gl.isRenderbuffer(renderbuffer)).assertEqual(true);
            gl.deleteRenderbuffer(renderbuffer);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })

        /**
         * 删除 WebGLRenderbuffer 对象
         */
        function deleteRenderbuffer(callback, finish) {
            let renderbuffer = gl.createRenderbuffer();
            expect(renderbuffer != null).assertTrue();
            gl.bindRenderbuffer(gl.RENDERBUFFER, renderbuffer);
            callback(renderbuffer);
            finish(gl.isRenderbuffer(renderbuffer));
            gl.deleteRenderbuffer(renderbuffer);
        }

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0029
         * @tc.name webgl_test_deleteRenderbuffer
         * @tc.desc Test deleteRenderbuffer.
         */
        it('webgl_test_deleteRenderbuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_deleteRenderbuffer] deleteRenderbuffer");
            let renderbuffer = gl.createRenderbuffer();
            console.info("webgltest  createRenderbuffer:", renderbuffer);
            expect(renderbuffer != null).assertTrue();
            console.info("webgltest  isRenderbuffer:", gl.isRenderbuffer(renderbuffer));
            expect(gl.isRenderbuffer(renderbuffer)).assertEqual(false);
            console.info("webgltest  gl.bindRenderbuffer(gl.RENDERBUFFER, renderbuffer);");
            gl.bindRenderbuffer(gl.RENDERBUFFER, renderbuffer);
            console.info("webgltest  isRenderbuffer:", gl.isRenderbuffer(renderbuffer));
            expect(gl.isRenderbuffer(renderbuffer)).assertEqual(true);
            console.info("webgltest  gl.deleteRenderbuffer(renderbuffer);");
            gl.deleteRenderbuffer(renderbuffer);
            console.info("webgltest  isRenderbuffer:", gl.isRenderbuffer(renderbuffer));
            expect(gl.isRenderbuffer(renderbuffer)).assertEqual(false);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0030
         * @tc.name webgl_test_deleteRenderbuffer_1
         * @tc.desc Test deleteRenderbuffer.
         */
        it('webgl_test_deleteRenderbuffer_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_deleteRenderbuffer_1] deleteRenderbuffer");
            deleteRenderbuffer((renderbuffer) => {
                gl.deleteRenderbuffer(renderbuffer);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isDelete) => {
                expect(isDelete).assertEqual(false);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0031
         * @tc.name webgl_test_deleteRenderbuffer_2
         * @tc.desc Test deleteRenderbuffer.
         */
        it('webgl_test_deleteRenderbuffer_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_deleteRenderbuffer_2] deleteRenderbuffer");
            deleteRenderbuffer((renderbuffer) => {
                gl.deleteRenderbuffer(null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isDelete) => {
                expect(isDelete).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0032
         * @tc.name webgl_test_deleteRenderbuffer_3
         * @tc.desc Test deleteRenderbuffer.
         */
        it('webgl_test_deleteRenderbuffer_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_deleteRenderbuffer_3] deleteRenderbuffer");
            deleteRenderbuffer((renderbuffer) => {
                gl.deleteRenderbuffer(undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isDelete) => {
                expect(isDelete).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })

        /**
         * 获取关于渲染缓冲区的信息
         */
        function getRenderbufferParameter(callback) {
            let buf = gl.createRenderbuffer();
            gl.bindRenderbuffer(gl.RENDERBUFFER, buf);
            callback(buf);
            gl.deleteRenderbuffer(buf);
        }

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0033
         * @tc.name webgl_test_getRenderbufferParameter
         * @tc.desc Test getRenderbufferParameter.
         */
        it('webgl_test_getRenderbufferParameter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getRenderbufferParameter] getRenderbufferParameter");
            let buf = gl.createRenderbuffer();
            gl.bindRenderbuffer(gl.RENDERBUFFER, buf);
            console.info("webgltest RENDERBUFFER_WIDTH:",
                gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_WIDTH));
            console.info("webgltest RENDERBUFFER_HEIGHT:",
                gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_HEIGHT));
            expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_WIDTH)).assertEqual(0);
            expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_HEIGHT)).assertEqual(0);
            console.info("webgltest gl.renderbufferStorage(gl.RENDERBUFFER, gl.RGBA4, 256, 256);");
            gl.renderbufferStorage(gl.RENDERBUFFER, gl.RGBA4, 256, 256);
            console.info("webgltest RENDERBUFFER_WIDTH:",
                gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_WIDTH));
            console.info("webgltest RENDERBUFFER_HEIGHT:",
                gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_HEIGHT));
            expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_WIDTH)).assertEqual(256);
            expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_HEIGHT)).assertEqual(256);
            gl.deleteRenderbuffer(buf);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0034
         * @tc.name webgl_test_getRenderbufferParameter_1
         * @tc.desc Test getRenderbufferParameter.
         */
        it('webgl_test_getRenderbufferParameter_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getRenderbufferParameter_1] getRenderbufferParameter");
            getRenderbufferParameter((buf) => {
                console.info("webgltest RENDERBUFFER_WIDTH:",
                    gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_WIDTH));
                expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_WIDTH)).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0035
         * @tc.name webgl_test_getRenderbufferParameter_2
         * @tc.desc Test getRenderbufferParameter.
         */
        it('webgl_test_getRenderbufferParameter_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getRenderbufferParameter_2] getRenderbufferParameter");
            getRenderbufferParameter((buf) => {
                console.info("webgltest RENDERBUFFER_WIDTH:",
                    gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_WIDTH));
                expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_WIDTH)).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0036
         * @tc.name webgl_test_getRenderbufferParameter_3
         * @tc.desc Test getRenderbufferParameter.
         */
        it('webgl_test_getRenderbufferParameter_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getRenderbufferParameter_3] getRenderbufferParameter");
            getRenderbufferParameter((buf) => {
                console.info("webgltest RENDERBUFFER_INTERNAL_FORMAT:",
                    gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_INTERNAL_FORMAT));
                expect(gl.getRenderbufferParameter(gl.RENDERBUFFER,
                    gl.RENDERBUFFER_INTERNAL_FORMAT)).assertEqual(gl.RGBA4);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0037
         * @tc.name webgl_test_getRenderbufferParameter_4
         * @tc.desc Test getRenderbufferParameter.
         */
        it('webgl_test_getRenderbufferParameter_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getRenderbufferParameter_4] getRenderbufferParameter");
            getRenderbufferParameter((buf) => {
                console.info("webgltest RENDERBUFFER_GREEN_SIZE:",
                    gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_GREEN_SIZE));
                expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_GREEN_SIZE)>=0).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0038
         * @tc.name webgl_test_getRenderbufferParameter_5
         * @tc.desc Test getRenderbufferParameter.
         */
        it('webgl_test_getRenderbufferParameter_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getRenderbufferParameter_5] getRenderbufferParameter");
            getRenderbufferParameter((buf) => {
                console.info("webgltest RENDERBUFFER_BLUE_SIZE:",
                    gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_BLUE_SIZE));
                expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_BLUE_SIZE)>=0).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0039
         * @tc.name webgl_test_getRenderbufferParameter_6
         * @tc.desc Test getRenderbufferParameter.
         */
        it('webgl_test_getRenderbufferParameter_6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getRenderbufferParameter_6] getRenderbufferParameter");
            getRenderbufferParameter((buf) => {
                console.info("webgltest RENDERBUFFER_RED_SIZE:",
                    gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_RED_SIZE));
                expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_RED_SIZE)>=0).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0040
         * @tc.name webgl_test_getRenderbufferParameter_7
         * @tc.desc Test getRenderbufferParameter.
         */
        it('webgl_test_getRenderbufferParameter_7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getRenderbufferParameter_7] getRenderbufferParameter");
            getRenderbufferParameter((buf) => {
                console.info("webgltest RENDERBUFFER_ALPHA_SIZE:",
                    gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_ALPHA_SIZE));
                expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_ALPHA_SIZE)>=0).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0041
         * @tc.name webgl_test_getRenderbufferParameter_8
         * @tc.desc Test getRenderbufferParameter.
         */
        it('webgl_test_getRenderbufferParameter_8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getRenderbufferParameter_8] getRenderbufferParameter");
            getRenderbufferParameter((buf) => {
                console.info("webgltest RENDERBUFFER_DEPTH_SIZE:",
                    gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_DEPTH_SIZE));
                expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_DEPTH_SIZE)>=0).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0042
         * @tc.name webgl_test_getRenderbufferParameter_9
         * @tc.desc Test getRenderbufferParameter.
         */
        it('webgl_test_getRenderbufferParameter_9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getRenderbufferParameter_9] getRenderbufferParameter");
            getRenderbufferParameter((buf) => {
                console.info("webgltest RENDERBUFFER_STENCIL_SIZE:",
                    gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_STENCIL_SIZE));
                expect(gl.getRenderbufferParameter(gl.RENDERBUFFER,
                    gl.RENDERBUFFER_STENCIL_SIZE)>=0).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })

        /**
         * 判定传入的WebGLRenderbuffer是否有效
         */
        function isRenderbuffer(callback) {
            let renderbuffer = gl.createRenderbuffer();
            expect(renderbuffer != null).assertTrue();
            expect(gl.isRenderbuffer(renderbuffer)).assertEqual(false);
            gl.bindRenderbuffer(gl.RENDERBUFFER, renderbuffer);
            callback(renderbuffer);
            gl.deleteRenderbuffer(renderbuffer);
        }

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0043
         * @tc.name webgl_test_isRenderbuffer
         * @tc.desc Test isRenderbuffer.
         */
        it('webgl_test_isRenderbuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_isRenderbuffer] isRenderbuffer");
            let renderbuffer = gl.createRenderbuffer();
            console.info("webgltest  createRenderbuffer:", renderbuffer);
            expect(renderbuffer != null).assertTrue();
            console.info("webgltest  isRenderbuffer:", gl.isRenderbuffer(renderbuffer));
            expect(gl.isRenderbuffer(renderbuffer)).assertEqual(false);
            console.info("webgltest  gl.bindRenderbuffer(gl.RENDERBUFFER, renderbuffer);");
            gl.bindRenderbuffer(gl.RENDERBUFFER, renderbuffer);
            console.info("webgltest  isRenderbuffer:", gl.isRenderbuffer(renderbuffer));
            expect(gl.isRenderbuffer(renderbuffer)).assertEqual(true);
            console.info("webgltest  gl.deleteRenderbuffer(renderbuffer);");
            gl.deleteRenderbuffer(renderbuffer);
            console.info("webgltest  isRenderbuffer:", gl.isRenderbuffer(renderbuffer));
            expect(gl.isRenderbuffer(renderbuffer)).assertEqual(false);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0044
         * @tc.name webgl_test_isRenderbuffer_1
         * @tc.desc Test isRenderbuffer.
         */
        it('webgl_test_isRenderbuffer_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_isRenderbuffer_1] isRenderbuffer");
            isRenderbuffer((renderbuffer) => {
                expect(gl.isRenderbuffer(renderbuffer)).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0045
         * @tc.name webgl_test_isRenderbuffer_2
         * @tc.desc Test isRenderbuffer.
         */
        it('webgl_test_isRenderbuffer_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_isRenderbuffer_2] isRenderbuffer");
            isRenderbuffer((renderbuffer) => {
                expect(gl.isRenderbuffer(null)).assertEqual(false);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0046
         * @tc.name webgl_test_isRenderbuffer_3
         * @tc.desc Test isRenderbuffer.
         */
        it('webgl_test_isRenderbuffer_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_isRenderbuffer_3] isRenderbuffer");
            isRenderbuffer((renderbuffer) => {
                expect(gl.isRenderbuffer(undefined)).assertEqual(false);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })

        /**
         * 将给定的 WebGLRenderbuffer 绑定到一个目标
         */
        function bindRenderbuffer(callback, finish) {
            let buf = gl.createRenderbuffer();
            let renderBufferBinding = gl.getParameter(gl.RENDERBUFFER_BINDING);
            console.info("webgltest renderBufferBinding:", renderBufferBinding);
            callback(buf);
            renderBufferBinding = gl.getParameter(gl.RENDERBUFFER_BINDING);
            finish(renderBufferBinding, buf);
            gl.deleteRenderbuffer(buf);
        }

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0047
         * @tc.name webgl_test_bindRenderbuffer
         * @tc.desc Test bindRenderbuffer.
         */
        it('webgl_test_bindRenderbuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_bindRenderbuffer] bindRenderbuffer");
            let buf = gl.createRenderbuffer();
            let renderBufferBinding = gl.getParameter(gl.RENDERBUFFER_BINDING);
            console.info("webgltest renderBufferBinding:", renderBufferBinding);
            console.info("webgltest gl.bindRenderbuffer(gl.RENDERBUFFER,renderBuffer);");
            gl.bindRenderbuffer(gl.RENDERBUFFER, buf);
            renderBufferBinding = gl.getParameter(gl.RENDERBUFFER_BINDING);
            console.info("webgltest renderBufferBinding:", renderBufferBinding);
            expect(renderBufferBinding == buf).assertTrue();
            gl.deleteRenderbuffer(buf);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0048
         * @tc.name webgl_test_bindRenderbuffer_1
         * @tc.desc Test bindRenderbuffer.
         */
        it('webgl_test_bindRenderbuffer_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_bindRenderbuffer_1] bindRenderbuffer");
            bindRenderbuffer((buf) => {
                gl.bindRenderbuffer(gl.RENDERBUFFER, buf);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (renderBufferBinding, buf) => {
                expect(renderBufferBinding).assertEqual(buf);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0049
         * @tc.name webgl_test_bindRenderbuffer_2
         * @tc.desc Test bindRenderbuffer.
         */
        it('webgl_test_bindRenderbuffer_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_bindRenderbuffer_2] bindRenderbuffer");
            bindRenderbuffer((buf) => {
                gl.bindRenderbuffer(gl.RENDERBUFFER, null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (renderBufferBinding, buf) => {
                expect(renderBufferBinding).assertEqual(null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0050
         * @tc.name webgl_test_bindRenderbuffer_3
         * @tc.desc Test bindRenderbuffer.
         */
        it('webgl_test_bindRenderbuffer_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_bindRenderbuffer_3] bindRenderbuffer");
            bindRenderbuffer((buf) => {
                gl.bindRenderbuffer(gl.RENDERBUFFER, undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (renderBufferBinding, buf) => {
                expect(renderBufferBinding).assertEqual(null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })

        /**
         * 创建并初始化一个renderbuffer对象的数据存储。
         */
        function renderbufferStorage(callback, finish) {
            let buf = gl.createRenderbuffer();
            gl.bindRenderbuffer(gl.RENDERBUFFER, buf);
            callback(buf);
            finish(buf);
            gl.deleteRenderbuffer(buf);
        }

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0051
         * @tc.name webgl_test_renderbufferStorage
         * @tc.desc Test renderbufferStorage.
         */
        it('webgl_test_renderbufferStorage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_renderbufferStorage] renderbufferStorage");
            let buf = gl.createRenderbuffer();
            gl.bindRenderbuffer(gl.RENDERBUFFER, buf);
            console.info("webgltest RENDERBUFFER_WIDTH:",
                gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_WIDTH));
            console.info("webgltest RENDERBUFFER_HEIGHT:",
                gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_HEIGHT));
            expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_WIDTH)).assertEqual(0);
            expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_HEIGHT)).assertEqual(0);
            console.info("webgltest gl.renderbufferStorage(gl.RENDERBUFFER, gl.RGBA4, 256, 256);");
            gl.renderbufferStorage(gl.RENDERBUFFER, gl.RGBA4, 256, 256);
            console.info("webgltest RENDERBUFFER_WIDTH:",
                gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_WIDTH));
            console.info("webgltest RENDERBUFFER_HEIGHT:",
                gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_HEIGHT));
            expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_WIDTH)).assertEqual(256);
            expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_HEIGHT)).assertEqual(256);
            gl.deleteRenderbuffer(buf);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0052
         * @tc.name webgl_test_renderbufferStorage_1
         * @tc.desc Test renderbufferStorage.
         */
        it('webgl_test_renderbufferStorage_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_renderbufferStorage_1] renderbufferStorage");
            renderbufferStorage((buf) => {
                gl.renderbufferStorage(gl.RENDERBUFFER, gl.RGBA4, 256, 256);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (buf) => {
                expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_WIDTH)).assertEqual(256);
                expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_HEIGHT)).assertEqual(256);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0053
         * @tc.name webgl_test_renderbufferStorage_2
         * @tc.desc Test renderbufferStorage.
         */
        it('webgl_test_renderbufferStorage_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_renderbufferStorage_2] renderbufferStorage");
            renderbufferStorage((buf) => {
                gl.renderbufferStorage(gl.RENDERBUFFER, gl.RGB565, 256, 256);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (buf) => {
                expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_WIDTH)).assertEqual(256);
                expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_HEIGHT)).assertEqual(256);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0054
         * @tc.name webgl_test_renderbufferStorage_3
         * @tc.desc Test renderbufferStorage.
         */
        it('webgl_test_renderbufferStorage_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_renderbufferStorage_3] renderbufferStorage");
            renderbufferStorage((buf) => {
                gl.renderbufferStorage(gl.RENDERBUFFER, gl.RGB5_A1, 256, 256);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (buf) => {
                expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_WIDTH)).assertEqual(256);
                expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_HEIGHT)).assertEqual(256);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0055
         * @tc.name webgl_test_renderbufferStorage_4
         * @tc.desc Test renderbufferStorage.
         */
        it('webgl_test_renderbufferStorage_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_renderbufferStorage_4] renderbufferStorage");
            renderbufferStorage((buf) => {
                gl.renderbufferStorage(gl.RENDERBUFFER, gl.DEPTH_COMPONENT16, 256, 256);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (buf) => {
                expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_WIDTH)).assertEqual(256);
                expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_HEIGHT)).assertEqual(256);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0056
         * @tc.name webgl_test_renderbufferStorage_5
         * @tc.desc Test renderbufferStorage.
         */
        it('webgl_test_renderbufferStorage_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_renderbufferStorage_5] renderbufferStorage");
            renderbufferStorage((buf) => {
                gl.renderbufferStorage(gl.RENDERBUFFER, gl.STENCIL_INDEX8, 256, 256);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (buf) => {
                expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_WIDTH)).assertEqual(256);
                expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_HEIGHT)).assertEqual(256);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0057
         * @tc.name webgl_test_renderbufferStorage_6
         * @tc.desc Test renderbufferStorage.
         */
        it('webgl_test_renderbufferStorage_6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_renderbufferStorage_6] renderbufferStorage");
            renderbufferStorage((buf) => {
                gl.renderbufferStorage(gl.RENDERBUFFER, gl.DEPTH_STENCIL, 256, 256);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (buf) => {
                expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_WIDTH)).assertEqual(256);
                expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_HEIGHT)).assertEqual(256);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0058
         * @tc.name webgl_test_renderbufferStorage_7
         * @tc.desc Test renderbufferStorage.
         */
        it('webgl_test_renderbufferStorage_7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_renderbufferStorage_7] renderbufferStorage");
            renderbufferStorage((buf) => {
                gl.renderbufferStorage(gl.RENDERBUFFER, gl.RGBA4, 0, 0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (buf) => {
                expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_WIDTH)).assertEqual(0);
                expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_HEIGHT)).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0059
         * @tc.name webgl_test_renderbufferStorage_8
         * @tc.desc Test renderbufferStorage.
         */
        it('webgl_test_renderbufferStorage_8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_renderbufferStorage_8] renderbufferStorage");
            renderbufferStorage((buf) => {
                gl.renderbufferStorage(gl.RENDERBUFFER, gl.RGBA4, -1, -1);
                expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            }, (buf) => {
                expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_WIDTH)).assertEqual(0);
                expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_HEIGHT)).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0060
         * @tc.name webgl_test_renderbufferStorage_9
         * @tc.desc Test renderbufferStorage.
         */
        it('webgl_test_renderbufferStorage_9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_renderbufferStorage_9] renderbufferStorage");
            renderbufferStorage((buf) => {
                gl.renderbufferStorage(gl.RENDERBUFFER, gl.RGBA4, null, null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (buf) => {
                expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_WIDTH)).assertEqual(0);
                expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_HEIGHT)).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0061
         * @tc.name webgl_test_renderbufferStorage_10
         * @tc.desc Test renderbufferStorage.
         */
        it('webgl_test_renderbufferStorage_10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_renderbufferStorage_10] renderbufferStorage");
            renderbufferStorage((buf) => {
                gl.renderbufferStorage(gl.RENDERBUFFER, gl.RGBA4, undefined, undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (buf) => {
                expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_WIDTH)).assertEqual(0);
                expect(gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_HEIGHT)).assertEqual(0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })

        /**
         * FrameBuffer
         * 创建和初始化WebGLFramebuffer 对象
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0062
         * @tc.name webgl_test_createFramebuffer
         * @tc.desc Test createFramebuffer.
         */
        it('webgl_test_createFramebuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_createFramebuffer] createFramebuffer");
            let buf = gl.createFramebuffer();
            console.info("webgltest newFramebuffer:", buf);
            expect(buf != null).assertTrue();
            console.log("webgltest isFramebuffer() ", gl.isFramebuffer(buf));
            expect(gl.isFramebuffer(buf)).assertEqual(false);
            console.info("webgltest gl.bindFramebuffer(gl.FRAMEBUFFER, buf);");
            gl.bindFramebuffer(gl.FRAMEBUFFER, buf);
            console.log("webgltest isFramebuffer() ", gl.isFramebuffer(buf));
            expect(gl.isFramebuffer(buf)).assertEqual(true);
            checkFrameBufferStatus();
            gl.deleteFramebuffer(buf);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })

        /**
         * 绑定WebGLFramebuffer 对象到一个目标
         */
        function bindFramebuffer(callback, finish) {
            let buf = gl.createFramebuffer();
            expect(buf != null).assertTrue();
            expect(gl.isFramebuffer(buf)).assertEqual(false);
            callback(buf);
            finish(gl.isFramebuffer(buf));
            checkFrameBufferStatus();
            gl.deleteFramebuffer(buf);
        }

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0063
         * @tc.name webgl_test_bindFramebuffer
         * @tc.desc Test bindFramebuffer.
         */
        it('webgl_test_bindFramebuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_bindFramebuffer] bindFramebuffer");
            let buf = gl.createFramebuffer();
            console.info("webgltest newFramebuffer:", buf);
            expect(buf != null).assertTrue();
            console.log("webgltest isFramebuffer() ", gl.isFramebuffer(buf));
            expect(gl.isFramebuffer(buf)).assertEqual(false);
            console.info("webgltest gl.bindFramebuffer(gl.FRAMEBUFFER, buf);");
            gl.bindFramebuffer(gl.FRAMEBUFFER, buf);
            console.log("webgltest isFramebuffer() ", gl.isFramebuffer(buf));
            expect(gl.isFramebuffer(buf)).assertEqual(true);
            checkFrameBufferStatus();
            gl.deleteFramebuffer(buf);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0064
         * @tc.name webgl_test_bindFramebuffer_1
         * @tc.desc Test bindFramebuffer.
         */
        it('webgl_test_bindFramebuffer_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_bindFramebuffer_1] bindFramebuffer");
            bindFramebuffer((buf) => {
                gl.bindFramebuffer(gl.FRAMEBUFFER, buf);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isFramebuffer) => {
                expect(isFramebuffer).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0065
         * @tc.name webgl_test_bindFramebuffer_2
         * @tc.desc Test bindFramebuffer.
         */
        it('webgl_test_bindFramebuffer_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_bindFramebuffer_2] bindFramebuffer");
            bindFramebuffer((buf) => {
                gl.bindFramebuffer(gl.FRAMEBUFFER, null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isFramebuffer) => {
                expect(isFramebuffer).assertEqual(false);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0066
         * @tc.name webgl_test_bindFramebuffer_3
         * @tc.desc Test bindFramebuffer.
         */
        it('webgl_test_bindFramebuffer_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_bindFramebuffer_3] bindFramebuffer");
            bindFramebuffer((buf) => {
                gl.bindFramebuffer(gl.FRAMEBUFFER, undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isFramebuffer) => {
                expect(isFramebuffer).assertEqual(false);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })

        /**
         * 删除WebGLFramebuffer 对象
         */
        function deleteFramebuffer(callback, finish) {
            let buf = gl.createFramebuffer();
            expect(buf != null).assertTrue();
            expect(gl.isFramebuffer(buf)).assertEqual(false);
            gl.bindFramebuffer(gl.FRAMEBUFFER, buf);
            callback(buf);
            finish(gl.isFramebuffer(buf));
            gl.deleteFramebuffer(buf);
        }

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0067
         * @tc.name webgl_test_deleteFramebuffer
         * @tc.desc Test deleteFramebuffer.
         */
        it('webgl_test_deleteFramebuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_deleteFramebuffer] deleteFramebuffer");
            let buf = gl.createFramebuffer();
            console.info("webgltest newFramebuffer:", buf);
            expect(buf != null).assertTrue();
            expect(gl.isFramebuffer(buf)).assertEqual(false);
            console.info("webgltest gl.bindFramebuffer(gl.FRAMEBUFFER, buf);");
            gl.bindFramebuffer(gl.FRAMEBUFFER, buf);
            console.log("webgltest isFramebuffer() ", gl.isFramebuffer(buf));
            expect(gl.isFramebuffer(buf)).assertEqual(true);
            console.log("webgltest gl.deleteFramebuffer(buf);");
            gl.deleteFramebuffer(buf);
            console.log("webgltest isFramebuffer() ", gl.isFramebuffer(buf));
            expect(gl.isFramebuffer(buf)).assertEqual(false);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0068
         * @tc.name webgl_test_deleteFramebuffer_1
         * @tc.desc Test deleteFramebuffer.
         */
        it('webgl_test_deleteFramebuffer_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_deleteFramebuffer_1] deleteFramebuffer");
            deleteFramebuffer((buf) => {
                gl.deleteFramebuffer(buf);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isFramebuffer) => {
                expect(isFramebuffer).assertEqual(false);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0069
         * @tc.name webgl_test_deleteFramebuffer_2
         * @tc.desc Test deleteFramebuffer.
         */
        it('webgl_test_deleteFramebuffer_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_deleteFramebuffer_2] deleteFramebuffer");
            deleteFramebuffer((buf) => {
                gl.deleteFramebuffer(null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isFramebuffer) => {
                expect(isFramebuffer).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0070
         * @tc.name webgl_test_deleteFramebuffer_3
         * @tc.desc Test deleteFramebuffer.
         */
        it('webgl_test_deleteFramebuffer_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_deleteFramebuffer_3] deleteFramebuffer");
            deleteFramebuffer((buf) => {
                gl.deleteFramebuffer(undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isFramebuffer) => {
                expect(isFramebuffer).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })

        function checkFrameBufferStatus() {
            let status = gl.checkFramebufferStatus(gl.FRAMEBUFFER);
            switch (status) {
                case gl.FRAMEBUFFER_COMPLETE:
                    console.info("webgltest checkFramebufferStatus FRAMEBUFFER_COMPLETE");
                    break;
                case gl.FRAMEBUFFER_INCOMPLETE_ATTACHMENT:
                    console.info("webgltest checkFramebufferStatus FRAMEBUFFER_INCOMPLETE_ATTACHMENT");
                    break;
                case gl.FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT:
                    console.info("webgltest checkFramebufferStatus FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT");
                    break;
                case gl.FRAMEBUFFER_INCOMPLETE_DIMENSIONS:
                    console.info("webgltest checkFramebufferStatus FRAMEBUFFER_INCOMPLETE_DIMENSIONS");
                    break;
                case gl.FRAMEBUFFER_UNSUPPORTED:
                    console.info("webgltest checkFramebufferStatus FRAMEBUFFER_UNSUPPORTED");
                    break;
            }
            return status;
        }

        /**
         * 检查WebGLFramebuffer对象的完整性状态
         */
        function checkFramebufferStatus(callback) {
            let buf = gl.createFramebuffer();
            gl.bindFramebuffer(gl.FRAMEBUFFER, buf);
            callback(buf);
            gl.deleteFramebuffer(buf);
        }

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0071
         * @tc.name webgl_test_checkFramebufferStatus
         * @tc.desc Test checkFramebufferStatus.
         */
        it('webgl_test_checkFramebufferStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_checkFramebufferStatus] checkFramebufferStatus");
            let buf = gl.createFramebuffer();
            console.info("webgltest newFramebuffer:", buf);
            expect(buf != null).assertTrue();
            let status = checkFrameBufferStatus();
            expect(status == gl.FRAMEBUFFER_COMPLETE).assertEqual(true);
            console.info("webgltest gl.bindFramebuffer(gl.FRAMEBUFFER, buf);");
            gl.bindFramebuffer(gl.FRAMEBUFFER, buf);
            expect(gl.isFramebuffer(buf)).assertEqual(true);
            status = checkFrameBufferStatus();
            expect(status == gl.FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT).assertEqual(true);
            gl.deleteFramebuffer(buf);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0072
         * @tc.name webgl_test_checkFramebufferStatus_1
         * @tc.desc Test checkFramebufferStatus.
         */
        it('webgl_test_checkFramebufferStatus_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_checkFramebufferStatus_1] checkFramebufferStatus");
            checkFramebufferStatus((buf) => {
                let status = gl.checkFramebufferStatus(gl.FRAMEBUFFER);
                expect(status == gl.FRAMEBUFFER_COMPLETE).assertEqual(false);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })

        /**
         * 判定给定的WebGLFramebuffer是否有效
         */
        function isFramebuffer(callback) {
            let buf = gl.createFramebuffer();
            expect(gl.isFramebuffer(buf)).assertEqual(false);
            gl.bindFramebuffer(gl.FRAMEBUFFER, buf);
            callback(buf);
            gl.deleteFramebuffer(buf);
        }

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0073
         * @tc.name webgl_test_isFramebuffer
         * @tc.desc Test isFramebuffer.
         */
        it('webgl_test_isFramebuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_isFramebuffer] isFramebuffer");
            let buf = gl.createFramebuffer();
            console.info("webgltest newFramebuffer:", buf);
            expect(buf != null).assertTrue();
            console.log("webgltest isFramebuffer() ", gl.isFramebuffer(buf));
            expect(gl.isFramebuffer(buf)).assertEqual(false);
            console.info("webgltest gl.bindFramebuffer(gl.FRAMEBUFFER, buf);");
            gl.bindFramebuffer(gl.FRAMEBUFFER, buf);
            console.log("webgltest isFramebuffer() ", gl.isFramebuffer(buf));
            expect(gl.isFramebuffer(buf)).assertEqual(true);
            checkFrameBufferStatus();
            gl.deleteFramebuffer(buf);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0074
         * @tc.name webgl_test_isFramebuffer_1
         * @tc.desc Test isFramebuffer.
         */
        it('webgl_test_isFramebuffer_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_isFramebuffer_1] isFramebuffer");
            isFramebuffer((buf) => {
                expect(gl.isFramebuffer(buf)).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0075
         * @tc.name webgl_test_isFramebuffer_2
         * @tc.desc Test isFramebuffer.
         */
        it('webgl_test_isFramebuffer_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_isFramebuffer_2] isFramebuffer");
            isFramebuffer((buf) => {
                expect(gl.isFramebuffer(null)).assertEqual(false);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0076
         * @tc.name webgl_test_isFramebuffer_3
         * @tc.desc Test isFramebuffer.
         */
        it('webgl_test_isFramebuffer_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_isFramebuffer_3] isFramebuffer");
            isFramebuffer((buf) => {
                expect(gl.isFramebuffer(undefined)).assertEqual(false);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })

        /**
         * WebGL API 的 WebGLRenderingContext.framebufferRenderbuffer（）
         * 方法将 WebGLRenderbuffer 对象附加到 WebGLFramebuffer 对象。
         */
        function framebufferRenderbuffer(callback, finish) {
            let framebuffer = gl.createFramebuffer();
            gl.bindFramebuffer(gl.FRAMEBUFFER, framebuffer);
            let renderbuffer = gl.createRenderbuffer();
            gl.bindRenderbuffer(gl.RENDERBUFFER, renderbuffer);
            callback(framebuffer, renderbuffer);
            let object = gl.getFramebufferAttachmentParameter(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0,
                gl.FRAMEBUFFER_ATTACHMENT_OBJECT_NAME,);
            finish(object, framebuffer, renderbuffer);
            gl.deleteRenderbuffer(renderbuffer);
            gl.deleteFramebuffer(framebuffer);
        }

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0077
         * @tc.name webgl_test_framebufferRenderbuffer
         * @tc.desc Test framebufferRenderbuffer.
         */
        it('webgl_test_framebufferRenderbuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_framebufferRenderbuffer] framebufferRenderbuffer");
            let framebuffer = gl.createFramebuffer();
            console.info("webgltest framebuffer:", framebuffer);
            gl.bindFramebuffer(gl.FRAMEBUFFER, framebuffer);
            expect(gl.isFramebuffer(framebuffer)).assertEqual(true);
            let renderbuffer = gl.createRenderbuffer();
            console.info("webgltest renderbuffer:", renderbuffer);
            gl.bindRenderbuffer(gl.RENDERBUFFER, renderbuffer);
            expect(gl.isRenderbuffer(renderbuffer)).assertEqual(true);
            gl.framebufferRenderbuffer(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.RENDERBUFFER, renderbuffer);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            let object = gl.getFramebufferAttachmentParameter(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0,
                gl.FRAMEBUFFER_ATTACHMENT_OBJECT_NAME,);
            console.info("webgltest getFramebufferAttachmentParameter:", object);
            expect(object).assertEqual(renderbuffer);
            gl.deleteRenderbuffer(renderbuffer);
            gl.deleteFramebuffer(framebuffer);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0078
         * @tc.name webgl_test_framebufferRenderbuffer_1
         * @tc.desc Test framebufferRenderbuffer.
         */
        it('webgl_test_framebufferRenderbuffer_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_framebufferRenderbuffer_1] framebufferRenderbuffer");
            framebufferRenderbuffer((framebuffer, renderbuffer) => {
                gl.framebufferRenderbuffer(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.RENDERBUFFER, renderbuffer);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (object, framebuffer, renderbuffer) => {
                expect(object).assertEqual(renderbuffer);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0079
         * @tc.name webgl_test_framebufferRenderbuffer_2
         * @tc.desc Test framebufferRenderbuffer.
         */
        it('webgl_test_framebufferRenderbuffer_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_framebufferRenderbuffer_2] framebufferRenderbuffer");
            framebufferRenderbuffer((framebuffer, renderbuffer) => {
                gl.framebufferRenderbuffer(gl.FRAMEBUFFER, gl.DEPTH_ATTACHMENT, gl.RENDERBUFFER, renderbuffer);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (object, framebuffer, renderbuffer) => {
                expect(object).assertEqual(null);
                expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0080
         * @tc.name webgl_test_framebufferRenderbuffer_3
         * @tc.desc Test framebufferRenderbuffer.
         */
        it('webgl_test_framebufferRenderbuffer_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_framebufferRenderbuffer_3] framebufferRenderbuffer");
            framebufferRenderbuffer((framebuffer, renderbuffer) => {
                gl.framebufferRenderbuffer(gl.FRAMEBUFFER, gl.STENCIL_ATTACHMENT, gl.RENDERBUFFER, renderbuffer);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (object, framebuffer, renderbuffer) => {
                expect(object).assertEqual(null);
                expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0081
         * @tc.name webgl_test_framebufferRenderbuffer_4
         * @tc.desc Test framebufferRenderbuffer.
         */
        it('webgl_test_framebufferRenderbuffer_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_framebufferRenderbuffer_4] framebufferRenderbuffer");
            framebufferRenderbuffer((framebuffer, renderbuffer) => {
                gl.framebufferRenderbuffer(gl.FRAMEBUFFER, gl.DEPTH_STENCIL_ATTACHMENT, gl.RENDERBUFFER, renderbuffer);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (object, framebuffer, renderbuffer) => {
                expect(object).assertEqual(null);
                expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0082
         * @tc.name webgl_test_framebufferRenderbuffer_5
         * @tc.desc Test framebufferRenderbuffer.
         */
        it('webgl_test_framebufferRenderbuffer_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_framebufferRenderbuffer_5] framebufferRenderbuffer");
            framebufferRenderbuffer((framebuffer, renderbuffer) => {
                gl.framebufferRenderbuffer(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.RENDERBUFFER, null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (object, framebuffer, renderbuffer) => {
                expect(object).assertEqual(null);
                expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0083
         * @tc.name webgl_test_framebufferRenderbuffer_6
         * @tc.desc Test framebufferRenderbuffer.
         */
        it('webgl_test_framebufferRenderbuffer_6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_framebufferRenderbuffer_6] framebufferRenderbuffer");
            framebufferRenderbuffer((framebuffer, renderbuffer) => {
                gl.framebufferRenderbuffer(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.RENDERBUFFER, undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (object, framebuffer, renderbuffer) => {
                expect(object).assertEqual(null);
                expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            });
            done();
        })

        /**
         * 获取帧缓冲区连接的相关信息。
         */
        function getFramebufferAttachmentParameter(callback, finish) {
            let framebuffer = gl.createFramebuffer();
            gl.bindFramebuffer(gl.FRAMEBUFFER, framebuffer);
            let renderbuffer = gl.createRenderbuffer();
            gl.bindRenderbuffer(gl.RENDERBUFFER, renderbuffer);
            gl.framebufferRenderbuffer(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.RENDERBUFFER, renderbuffer);
            callback(framebuffer, renderbuffer);
            finish(framebuffer, renderbuffer);
            gl.deleteRenderbuffer(renderbuffer);
            gl.deleteFramebuffer(framebuffer);
        }

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0084
         * @tc.name webgl_test_getFramebufferAttachmentParameter
         * @tc.desc Test getFramebufferAttachmentParameter.
         */
        it('webgl_test_getFramebufferAttachmentParameter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getFramebufferAttachmentParameter] getFramebufferAttachmentParameter");
            let framebuffer = gl.createFramebuffer();
            console.info("webgltest framebuffer:", framebuffer);
            gl.bindFramebuffer(gl.FRAMEBUFFER, framebuffer);
            expect(gl.isFramebuffer(framebuffer)).assertEqual(true);
            let renderbuffer = gl.createRenderbuffer();
            console.info("webgltest renderbuffer:", renderbuffer);
            gl.bindRenderbuffer(gl.RENDERBUFFER, renderbuffer);
            expect(gl.isRenderbuffer(renderbuffer)).assertEqual(true);
            gl.framebufferRenderbuffer(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.RENDERBUFFER, renderbuffer);
            let object = gl.getFramebufferAttachmentParameter(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0,
                gl.FRAMEBUFFER_ATTACHMENT_OBJECT_NAME);
            console.info("webgltest gl.getFramebufferAttachmentParameter(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.FRAMEBUFFER_ATTACHMENT_OBJECT_NAME); ", object);
            expect(object).assertEqual(renderbuffer);
            gl.deleteRenderbuffer(renderbuffer);
            gl.deleteFramebuffer(framebuffer);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0085
         * @tc.name webgl_test_getFramebufferAttachmentParameter_1
         * @tc.desc Test getFramebufferAttachmentParameter.
         */
        it('webgl_test_getFramebufferAttachmentParameter_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getFramebufferAttachmentParameter_1] getFramebufferAttachmentParameter");
            getFramebufferAttachmentParameter((framebuffer, renderbuffer) => {
                let object = gl.getFramebufferAttachmentParameter(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0,
                gl.FRAMEBUFFER_ATTACHMENT_OBJECT_NAME);
                expect(object).assertEqual(renderbuffer);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (framebuffer, renderbuffer) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0086
         * @tc.name webgl_test_getFramebufferAttachmentParameter_2
         * @tc.desc Test getFramebufferAttachmentParameter.
         */
        it('webgl_test_getFramebufferAttachmentParameter_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getFramebufferAttachmentParameter_2] getFramebufferAttachmentParameter");
            getFramebufferAttachmentParameter((framebuffer, renderbuffer) => {
                let object = gl.getFramebufferAttachmentParameter(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0,
                gl.FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (framebuffer, renderbuffer) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0087
         * @tc.name webgl_test_getFramebufferAttachmentParameter_3
         * @tc.desc Test getFramebufferAttachmentParameter.
         */
        it('webgl_test_getFramebufferAttachmentParameter_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getFramebufferAttachmentParameter_3] getFramebufferAttachmentParameter");
            getFramebufferAttachmentParameter((framebuffer, renderbuffer) => {
                let object = gl.getFramebufferAttachmentParameter(gl.FRAMEBUFFER, gl.DEPTH_ATTACHMENT,
                gl.FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL);
                expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            }, (framebuffer, renderbuffer) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0088
         * @tc.name webgl_test_getFramebufferAttachmentParameter_4
         * @tc.desc Test getFramebufferAttachmentParameter.
         */
        it('webgl_test_getFramebufferAttachmentParameter_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getFramebufferAttachmentParameter_4] getFramebufferAttachmentParameter");
            getFramebufferAttachmentParameter((framebuffer, renderbuffer) => {
                let object = gl.getFramebufferAttachmentParameter(gl.FRAMEBUFFER, gl.STENCIL_ATTACHMENT,
                gl.FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE);
                expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            }, (framebuffer, renderbuffer) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0089
         * @tc.name webgl_test_getFramebufferAttachmentParameter_5
         * @tc.desc Test getFramebufferAttachmentParameter.
         */
        it('webgl_test_getFramebufferAttachmentParameter_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getFramebufferAttachmentParameter_5] getFramebufferAttachmentParameter");
            getFramebufferAttachmentParameter((framebuffer, renderbuffer) => {
                let object = gl.getFramebufferAttachmentParameter(gl.FRAMEBUFFER, gl.DEPTH_STENCIL_ATTACHMENT,
                gl.FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE);
                expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            }, (framebuffer, renderbuffer) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0090
         * @tc.name webgl_test_getFramebufferAttachmentParameter_6
         * @tc.desc Test getFramebufferAttachmentParameter.
         */
        it('webgl_test_getFramebufferAttachmentParameter_6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getFramebufferAttachmentParameter_6] getFramebufferAttachmentParameter");
            getFramebufferAttachmentParameter((framebuffer, renderbuffer) => {
                let object = gl.getFramebufferAttachmentParameter(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0,
                gl.FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL);
                expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            }, (framebuffer, renderbuffer) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0091
         * @tc.name webgl_test_getFramebufferAttachmentParameter_7
         * @tc.desc Test getFramebufferAttachmentParameter.
         */
        it('webgl_test_getFramebufferAttachmentParameter_7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgltest [webgl_test_getFramebufferAttachmentParameter_7] getFramebufferAttachmentParameter");
            getFramebufferAttachmentParameter((framebuffer, renderbuffer) => {
                let object = gl.getFramebufferAttachmentParameter(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0,
                gl.FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE);
                expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            }, (framebuffer, renderbuffer) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })

        /**
         * 更新缓冲区对象的数据储存集
         */
        function bufferSubData(callback, finish) {
            let arr = new Float32Array([
                0.0, 0.5, -0.5, 0.5, 1.0, 0.5,
            ]);
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW);
            let bufferSize = gl.getBufferParameter(gl.ARRAY_BUFFER, gl.BUFFER_SIZE);
            expect(bufferSize == arr.length * arr.BYTES_PER_ELEMENT).assertTrue();
            callback(arr);
            finish();
            gl.deleteBuffer(buffer);
        }

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0092
         * @tc.name webgl_test_bufferSubData
         * @tc.desc Test bufferSubData.
         */
        it('webgl_test_bufferSubData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_bufferSubData] bufferSubData");
            let arr = new Float32Array([
                0.0, 0.5, -0.5, 0.5, 1.0, 0.5,
            ]);
            console.info("webgltest arr:", arr);
            console.info("webgltest arr.BYTES_PER_ELEMENT:", arr.BYTES_PER_ELEMENT);
            let buffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
            console.info("webgltest gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW);")
            gl.bufferData(gl.ARRAY_BUFFER, arr, gl.STATIC_DRAW);
            let bufferSize = gl.getBufferParameter(gl.ARRAY_BUFFER, gl.BUFFER_SIZE);
            console.info("webgltest bufferSize:", bufferSize);
            expect(bufferSize == arr.length * arr.BYTES_PER_ELEMENT).assertTrue();
            console.info("webgltest gl.bufferSubData(gl.ARRAY_BUFFER, 0, arr);")
            gl.bufferSubData(gl.ARRAY_BUFFER, 0, arr);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.deleteBuffer(buffer);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0093
         * @tc.name webgl_test_bufferSubData_1
         * @tc.desc Test bufferSubData.
         */
        it('webgl_test_bufferSubData_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_bufferSubData_1] bufferSubData");
            bufferSubData((arr) => {
                gl.bufferSubData(gl.ARRAY_BUFFER, 0, arr);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_BUFFER_0094
         * @tc.name webgl_test_bufferSubData_2
         * @tc.desc Test bufferSubData.
         */
        it('webgl_test_bufferSubData_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_bufferSubData_2] bufferSubData");
            bufferSubData((arr) => {
                gl.bufferSubData(gl.ELEMENT_ARRAY_BUFFER, 0, arr);
                expect(checkError(gl)).assertEqual(gl.INVALID_OPERATION);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        })
    })
}
