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


export default function webgl2_sync() {
    
	describe('webgl2_sync', function () {
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
        function fenceSync(callback, finish) {
            let sync = gl.fenceSync(gl.SYNC_GPU_COMMANDS_COMPLETE, 0);
            expect(sync != null).assertTrue();
            callback(sync);
            finish(gl.isSync(sync));
            gl.deleteSync(sync);
        }
        /**
         * @tc.name   webgl2_test_fenceSync
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0001
         * @tc.desc   Test fenceSync.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_fenceSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_fenceSync] fenceSync");
            let sync = gl.fenceSync(gl.SYNC_GPU_COMMANDS_COMPLETE, 0);
            console.log("webgltest Sync:", sync);
            expect(sync != null).assertTrue();
            console.log("webgltest isSync:", gl.isSync(sync));
            expect(gl.isSync(sync)).assertEqual(true);
            console.log("webgltest delete Sync");
            gl.deleteSync(sync);
            console.log("webgltest isSync:", gl.isSync(sync));
            expect(gl.isSync(sync)).assertEqual(false);
            done();
        });
        /**
         * @tc.name   webgl2_test_fenceSync_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0002
         * @tc.desc   Test fenceSync.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_fenceSync_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_fenceSync] fenceSync");
            fenceSync((sync) => {
                gl.fenceSync(gl.SYNC_GPU_COMMANDS_COMPLETE, null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.name   webgl2_test_fenceSync_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0003
         * @tc.desc   Test fenceSync.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_fenceSync_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_fenceSync] fenceSync");
            fenceSync((sync) => {
                gl.fenceSync(gl.SYNC_GPU_COMMANDS_COMPLETE, undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.name   webgl2_test_fenceSync_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0004
         * @tc.desc   Test fenceSync.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_fenceSync_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_fenceSync] fenceSync");
            fenceSync((sync) => {
                gl.fenceSync(gl.SYNC_GPU_COMMANDS_COMPLETE, false);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.name   webgl2_test_fenceSync_4
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0005
         * @tc.desc   Test fenceSync.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_fenceSync_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_fenceSync] fenceSync");
            fenceSync((sync) => {
                gl.fenceSync(gl.SYNC_GPU_COMMANDS_COMPLETE, 0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function isSync(callback, finish) {
            let sync = gl.fenceSync(gl.SYNC_GPU_COMMANDS_COMPLETE, 0);
            expect(sync != null).assertTrue();
            callback(sync);
            finish(gl.isSync(sync));
            gl.deleteSync(sync);
        }
        /**
         * @tc.name   webgl2_test_isSync
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0006
         * @tc.desc   Test isSync.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_isSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_isSync] isSync");
            let sync = gl.fenceSync(gl.SYNC_GPU_COMMANDS_COMPLETE, 0);
            console.log("webgltest Sync:", sync);
            expect(sync != null).assertTrue();
            console.log("webgltest isSync:", gl.isSync(sync));
            expect(gl.isSync(sync)).assertEqual(true);
            console.log("webgltest delete Sync");
            gl.deleteSync(sync);
            console.log("webgltest isSync:", gl.isSync(sync));
            expect(gl.isSync(sync)).assertEqual(false);
            done();
        });
        /**
         * @tc.name   webgl2_test_isSync_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0007
         * @tc.desc   Test isSync.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_isSync_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_isSync] isSync");
            isSync((sync) => {
                gl.isSync(null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.name   webgl2_test_isSync_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0008
         * @tc.desc   Test isSync.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_isSync_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_isSync] isSync");
            isSync((sync) => {
                gl.isSync(undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function deleteSync(callback, finish) {
            let sync = gl.fenceSync(gl.SYNC_GPU_COMMANDS_COMPLETE, 0);
            expect(sync != null).assertTrue();
            callback(sync);
            finish(gl.isSync(sync));
        }
        /**
         * @tc.name   webgl2_test_deleteSync
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0009
         * @tc.desc   Test deleteSync.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_deleteSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_deleteSync] deleteSync");
            let sync = gl.fenceSync(gl.SYNC_GPU_COMMANDS_COMPLETE, 0);
            console.log("webgltest Sync:", sync);
            expect(sync != null).assertTrue();
            console.log("webgltest isSync:", gl.isSync(sync));
            expect(gl.isSync(sync)).assertEqual(true);
            console.log("webgltest delete Sync");
            gl.deleteSync(sync);
            console.log("webgltest isSync:", gl.isSync(sync));
            expect(gl.isSync(sync)).assertEqual(false);
            done();
        });
        /**
         * @tc.name   webgl2_test_deleteSync_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0010
         * @tc.desc   Test deleteSync.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_deleteSync_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_deleteSync] deleteSync");
            deleteSync((sync) => {
                gl.deleteSync(null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.name   webgl2_test_deleteSync_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0011
         * @tc.desc   Test deleteSync.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_deleteSync_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_deleteSync] deleteSync");
            deleteSync((sync) => {
                gl.deleteSync(undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function clientWaitSync(callback, finish) {
            let sync = gl.fenceSync(gl.SYNC_GPU_COMMANDS_COMPLETE, 0);
            let status = gl.clientWaitSync(sync, gl.SYNC_FLUSH_COMMANDS_BIT, 0);
            expect(sync != null).assertTrue();
            callback(sync, status);
            finish(gl.isSync(sync));
            gl.deleteSync(sync);
        }
        /**
         * @tc.name   webgl2_test_clientWaitSync
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0012
         * @tc.desc   Test clientWaitSync.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_clientWaitSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_clientWaitSync] clientWaitSync");
            let sync = gl.fenceSync(gl.SYNC_GPU_COMMANDS_COMPLETE, 0);
            let status = gl.clientWaitSync(sync, gl.SYNC_FLUSH_COMMANDS_BIT, 0);
            console.log("webgltest clientWaitSync:", gl.isSync(sync));
            expect(gl.isSync(sync)).assertEqual(true);
            console.log("webgltest clientWaitSync:", gl.TIMEOUT_EXPIRED);
            expect(status != gl.WAIT_FAILED).assertTrue();
            gl.getSyncParameter(sync, gl.SYNC_STATUS);
            console.log("webgltest delete Sync");
            gl.deleteSync(sync);
            console.log("webgltest isSync:", gl.isSync(sync));
            expect(gl.isSync(sync)).assertEqual(false);
            done();
        });
        /**
         * @tc.name   webgl2_test_clientWaitSync_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0013
         * @tc.desc   Test clientWaitSync.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_clientWaitSync_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_clientWaitSync] clientWaitSync");
            clientWaitSync((sync) => {
                gl.clientWaitSync(sync, 0, 0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.name   webgl2_test_clientWaitSync_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0014
         * @tc.desc   Test clientWaitSync.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_clientWaitSync_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_clientWaitSync] clientWaitSync");
            clientWaitSync((sync) => {
                gl.clientWaitSync(sync, 1, 0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.name   webgl2_test_clientWaitSync_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0015
         * @tc.desc   Test clientWaitSync.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_clientWaitSync_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_clientWaitSync] clientWaitSync");
            clientWaitSync((sync) => {
                gl.clientWaitSync(sync, null, null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.name   webgl2_test_clientWaitSync_4
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0016
         * @tc.desc   Test clientWaitSync.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_clientWaitSync_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_clientWaitSync] clientWaitSync");
            clientWaitSync((sync) => {
                gl.clientWaitSync(sync, null, 0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.name   webgl2_test_clientWaitSync_5
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0017
         * @tc.desc   Test clientWaitSync.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_clientWaitSync_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_clientWaitSync] clientWaitSync");
            clientWaitSync((sync) => {
                gl.clientWaitSync(sync, undefined, undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.name   webgl2_test_clientWaitSync_6
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0018
         * @tc.desc   Test clientWaitSync.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_clientWaitSync_6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_clientWaitSync] clientWaitSync");
            clientWaitSync((sync) => {
                gl.clientWaitSync(sync, undefined, 0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.name   webgl2_test_clientWaitSync_7
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0019
         * @tc.desc   Test clientWaitSync.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_clientWaitSync_7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_clientWaitSync] clientWaitSync");
            clientWaitSync((sync) => {
                gl.clientWaitSync(sync, false, false);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.name   webgl2_test_clientWaitSync_8
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0020
         * @tc.desc   Test clientWaitSync.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_clientWaitSync_8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_clientWaitSync] clientWaitSync");
            clientWaitSync((sync) => {
                gl.clientWaitSync(sync, false, 0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.name   webgl2_test_clientWaitSync_9
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0021
         * @tc.desc   Test clientWaitSync.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_clientWaitSync_9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_clientWaitSync] clientWaitSync");
            clientWaitSync((sync) => {
                gl.clientWaitSync(sync, gl.SYNC_FLUSH_COMMANDS_BIT, 0);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function waitSync(callback, finish) {
            let sync = gl.fenceSync(gl.SYNC_GPU_COMMANDS_COMPLETE, 0);
            expect(sync != null).assertTrue();
            callback(sync);
            finish(gl.isSync(sync));
            gl.deleteSync(sync);
        }
        /**
         * @tc.name   webgl2_test_waitSync
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0022
         * @tc.desc   Test waitSync.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_waitSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_waitSync] waitSync");
            let sync = gl.fenceSync(gl.SYNC_GPU_COMMANDS_COMPLETE, 0);
            console.log("webgltest gl.waitSync(sync!, 0, gl.TIMEOUT_IGNORED):", gl.waitSync(sync, 0, gl.TIMEOUT_IGNORED));
            console.log("webgltest isSync:", gl.isSync(sync));
            expect(gl.isSync(sync)).assertEqual(true);
            gl.getSyncParameter(sync, gl.SYNC_STATUS);
            console.log("webgltest delete Sync");
            gl.deleteSync(sync);
            console.log("webgltest isSync:", gl.isSync(sync));
            expect(gl.isSync(sync)).assertEqual(false);
            done();
        });
        /**
         * @tc.name   webgl2_test_waitSync_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0023
         * @tc.desc   Test waitSync.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_waitSync_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_waitSync] waitSync");
            waitSync((sync) => {
                gl.waitSync(sync, null, gl.TIMEOUT_IGNORED);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.name   webgl2_test_waitSync_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0024
         * @tc.desc   Test waitSync.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_waitSync_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_waitSync] waitSync");
            waitSync((sync) => {
                gl.waitSync(sync, undefined, gl.TIMEOUT_IGNORED);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.name   webgl2_test_waitSync_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0025
         * @tc.desc   Test waitSync.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_waitSync_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_waitSync] waitSync");
            waitSync((sync) => {
                gl.waitSync(sync, false, gl.TIMEOUT_IGNORED);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.name   webgl2_test_waitSync_4
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0026
         * @tc.desc   Test waitSync.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_waitSync_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_waitSync] waitSync");
            waitSync((sync) => {
                gl.waitSync(sync, 0, gl.TIMEOUT_IGNORED);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function getSyncParameter(callback, finish) {
            let sync = gl.fenceSync(gl.SYNC_GPU_COMMANDS_COMPLETE, 0);
            let status = gl.clientWaitSync(sync, gl.SYNC_FLUSH_COMMANDS_BIT, 0);
            expect(sync != null).assertTrue();
            callback(sync, status);
            finish(gl.isSync(sync));
            gl.deleteSync(sync);
        }
        /**
         * @tc.name   webgl2_test_getSyncParameter
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0027
         * @tc.desc   Test getSyncParameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_getSyncParameter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_getSyncParameter] getSyncParameter");
            let sync = gl.fenceSync(gl.SYNC_GPU_COMMANDS_COMPLETE, 0);
            let status = gl.clientWaitSync(sync, gl.SYNC_FLUSH_COMMANDS_BIT, 0);
            expect(gl.isSync(sync)).assertEqual(true);
            console.log("webgltest getSyncParameter(sync!, gl.SYNC_STATUS):", gl.getSyncParameter(sync, gl.SYNC_STATUS));
            expect(status != gl.WAIT_FAILED).assertTrue();
            console.log("webgltest clientWaitSync:", gl.isSync(sync));
            console.log("webgltest delete Sync");
            gl.deleteSync(sync);
            console.log("webgltest isSync:", gl.isSync(sync));
            expect(gl.isSync(sync)).assertEqual(false);
            done();
        });
        /**
         * @tc.name   webgl2_test_getSyncParameter_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0028
         * @tc.desc   Test getSyncParameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_getSyncParameter_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_getSyncParameter] getSyncParameter");
            getSyncParameter((sync) => {
                gl.getSyncParameter(sync, gl.OBJECT_TYPE);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.name   webgl2_test_getSyncParameter_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0029
         * @tc.desc   Test getSyncParameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_getSyncParameter_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_getSyncParameter] getSyncParameter");
            getSyncParameter((sync) => {
                gl.getSyncParameter(sync, gl.SYNC_CONDITION);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.name   webgl2_test_getSyncParameter_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0030
         * @tc.desc   Test getSyncParameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_getSyncParameter_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_getSyncParameter] getSyncParameter");
            getSyncParameter((sync) => {
                gl.getSyncParameter(sync, gl.SYNC_FLAGS);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.name   webgl2_test_getSyncParameter_4
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SYNC_0031
         * @tc.desc   Test getSyncParameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_getSyncParameter_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_getSyncParameter] getSyncParameter");
            getSyncParameter((sync) => {
                gl.getSyncParameter(sync, gl.SYNC_STATUS);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
    })
}
