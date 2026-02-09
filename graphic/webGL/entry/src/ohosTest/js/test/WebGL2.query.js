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


export default function webgl2_query() {
    
	describe('webgl2_query', function () {
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
         * @tc.name   webgl2_test_createQuery
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_QUERY_0001
         * @tc.desc   Test createQuery.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_createQuery', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_createQuery] createQuery");
            let query = gl.createQuery();
            console.log("webgltest Query:", query);
            expect(query != null).assertTrue();
            gl.beginQuery(gl.ANY_SAMPLES_PASSED, query);
            console.log("webgltest isQuery:", gl.isQuery(query));
            expect(gl.isQuery(query)).assertEqual(true);
            console.log("webgltest delete Query");
            gl.deleteQuery(query);
            console.log("webgltest isQuery:", gl.isQuery(query));
            expect(gl.isQuery(query)).assertEqual(false);
            done();
        });
        // Method deletes the given Web GL Query object. This method is invalid if the program has been deleted.
        function deleteQuery(callback, finish) {
            let query = gl.createQuery();
            expect(query != null).assertTrue();
            expect(gl.isQuery(query)).assertFalse();
            callback(query);
            finish(gl.isQuery(query));
        }
        /**
         * @tc.name   webgl2_test_deleteQuery
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_QUERY_0002
         * @tc.desc   Test deleteQuery.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_deleteQuery', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_deleteQuery] deleteQuery");
            let query = gl.createQuery();
            console.log("webgltest Query:", query);
            expect(query != null).assertTrue();
            gl.beginQuery(gl.ANY_SAMPLES_PASSED, query);
            console.log("webgltest isQuery:", gl.isQuery(query));
            expect(gl.isQuery(query)).assertEqual(true);
            console.log("webgltest delete Query");
            gl.deleteQuery(query);
            console.log("webgltest isQuery:", gl.isQuery(query));
            expect(gl.isQuery(query)).assertEqual(false);
            done();
        });
        /**
         * @tc.name   webgl_test_deleteQuery_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_QUERY_0003
         * @tc.desc   Test deleteQuery.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_deleteQuery_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_deleteQuery_1] deleteQuery");
            deleteQuery((query) => {
                gl.deleteQuery(null);
                checkError(gl);
            }, (isQuery) => {
                expect(isQuery).assertEqual(false);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.name   webgl_test_deleteQuery_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_QUERY_0004
         * @tc.desc   Test deleteQuery.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_deleteQuery_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_deleteQuery_2] deleteQuery");
            deleteQuery((query) => {
                gl.deleteQuery(undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isQuery) => {
                expect(isQuery).assertEqual(false);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.name   webgl_test_deleteQuery_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_QUERY_0005
         * @tc.desc   Test deleteQuery.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl_test_deleteQuery_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_deleteQuery_2] deleteQuery");
            deleteQuery((query) => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isQuery) => {
                expect(isQuery).assertEqual(false);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        // Return true if the passed Web GL Query is valid, false otherwise.
        function isQuery(callback, finish) {
            let query = gl.createQuery();
            expect(query != null).assertTrue();
            gl.beginQuery(gl.ANY_SAMPLES_PASSED, query);
            callback(query);
            finish(gl.isQuery(query));
            gl.deleteQuery(query);
        }
        /**
         * @tc.name   webgl2_test_isQuery
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_QUERY_0006
         * @tc.desc   Test isQuery.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_isQuery', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_isQuery] isQuery");
            let query = gl.createQuery();
            console.log("webgltest Query:", query);
            expect(query != null).assertTrue();
            gl.beginQuery(gl.ANY_SAMPLES_PASSED, query);
            console.log("webgltest isQuery:", gl.isQuery(query));
            expect(gl.isQuery(query)).assertEqual(true);
            console.log("webgltest delete Query");
            gl.deleteQuery(query);
            console.log("webgltest isQuery:", gl.isQuery(query));
            expect(gl.isQuery(query)).assertEqual(false);
            done();
        });
        /**
         * @tc.name   webgl2_test_isQuery_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_QUERY_0007
         * @tc.desc   Test isQuery.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_isQuery_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_isQuery_1] isQuery");
            isQuery((query) => {
                gl.isQuery(null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.name   webgl2_test_isQuery_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_QUERY_0008
         * @tc.desc   Test isQuery.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_isQuery_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_isQuery_2] isQuery");
            isQuery((query) => {
                gl.isQuery(undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        // enable asynchronous queries for web gl query
        function beginQuery(callback, finish) {
            let query = gl.createQuery();
            expect(query != null).assertTrue();
            callback(query);
            finish(gl.isQuery(query));
            gl.deleteQuery(query);
        }
        /**
         * @tc.name   webgl2_test_beginQuery
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_QUERY_0009
         * @tc.desc   Test beginQuery.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_beginQuery', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_beginQuery] beginQuery");
            let query = gl.createQuery();
            console.log("webgltest Query:", query);
            expect(query != null).assertTrue();
            console.log("webgltest isQuery:", gl.isQuery(query));
            expect(gl.isQuery(query)).assertEqual(false);
            gl.beginQuery(gl.ANY_SAMPLES_PASSED, query);
            console.log("webgltest beginQuery()");
            console.log("webgltest isQuery:", gl.isQuery(query));
            expect(gl.isQuery(query)).assertEqual(true);
            gl.deleteQuery(query);
            console.log("webgltest delete Query");
            console.log("webgltest isQuery:", gl.isQuery(query));
            expect(gl.isQuery(query)).assertEqual(false);
            done();
        });
        /**
         * @tc.name   webgl2_test_beginQuery_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_QUERY_0010
         * @tc.desc   Test beginQuery.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_beginQuery_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_beginQuery] beginQuery");
            beginQuery((query) => {
                gl.beginQuery(gl.ANY_SAMPLES_PASSED_CONSERVATIVE, query);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.name   webgl2_test_beginQuery_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_QUERY_0011
         * @tc.desc   Test beginQuery.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_beginQuery_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_beginQuery] beginQuery");
            beginQuery((query) => {
                gl.beginQuery(gl.TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN, query);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.name   webgl2_test_beginQuery_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_QUERY_0012
         * @tc.desc   Test beginQuery.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_beginQuery_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_beginQuery] beginQuery");
            beginQuery((query) => {
                gl.beginQuery(gl.ANY_SAMPLES_PASSED, query);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function endQuery(callback, finish) {
            let query = gl.createQuery();
            let query2 = gl.createQuery();
            expect(query != null).assertTrue();
            gl.beginQuery(gl.ANY_SAMPLES_PASSED_CONSERVATIVE, query);
            gl.beginQuery(gl.TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN, query2);
            callback(query, query2);
            finish(gl.isQuery(query));
            gl.deleteQuery(query);
            gl.deleteQuery(query2);
        }
        /**
         * @tc.name   webgl2_test_endQuery
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_QUERY_0013
         * @tc.desc   Test endQuery.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_endQuery', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_endQuery] endQuery");
            let query = gl.createQuery();
            let currentQuery = gl.getQuery(gl.ANY_SAMPLES_PASSED, gl.CURRENT_QUERY);
            console.log("webgltest Query:", query);
            expect(query != null).assertTrue();
            gl.beginQuery(gl.ANY_SAMPLES_PASSED, query);
            console.log("webgltest isQuery:", gl.isQuery(query));
            expect(gl.isQuery(query)).assertEqual(true);
            gl.endQuery(gl.ANY_SAMPLES_PASSED);
            console.log("webgltest endQuery():", currentQuery);
            gl.deleteQuery(query);
            console.log("webgltest delete Query");
            console.log("webgltest isQuery:", gl.isQuery(query));
            expect(gl.isQuery(query)).assertEqual(false);
            done();
        });
        /**
         * @tc.name   webgl2_test_endQuery_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_QUERY_0014
         * @tc.desc   Test endQuery.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_endQuery_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_endQuery] endQuery");
            endQuery((query) => {
                gl.endQuery(gl.ANY_SAMPLES_PASSED_CONSERVATIVE);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.name   webgl2_test_endQuery_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_QUERY_0015
         * @tc.desc   Test endQuery.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_endQuery_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_endQuery] endQuery");
            endQuery((query) => {
                gl.endQuery(gl.TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function getQuery(callback, finish) {
            let query = gl.createQuery();
            let query2 = gl.createQuery();
            expect(query != null).assertTrue();
            gl.beginQuery(gl.ANY_SAMPLES_PASSED_CONSERVATIVE, query);
            gl.beginQuery(gl.TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN, query2);
            callback(query, query2);
            finish(gl.isQuery(query));
            gl.deleteQuery(query);
            gl.deleteQuery(query2);
        }
        /**
         * @tc.name   webgl2_test_getQuery
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_QUERY_0016
         * @tc.desc   Test getQuery.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_getQuery', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_getQuery] getQuery");
            let query = gl.createQuery();
            let currentQuery = gl.getQuery(gl.ANY_SAMPLES_PASSED, gl.CURRENT_QUERY);
            console.log("webgltest Query:", query);
            expect(query != null).assertTrue();
            gl.beginQuery(gl.ANY_SAMPLES_PASSED, query);
            console.log("webgltest isQuery:", gl.isQuery(query));
            expect(gl.isQuery(query)).assertEqual(true);
            console.log("webgltest gl.getQuery(gl.ANY_SAMPLES_PASSED, gl.CURRENT_QUERY):", currentQuery);
            gl.endQuery(gl.ANY_SAMPLES_PASSED);
            console.log("webgltest isQuery:", gl.isQuery(query));
            expect(gl.isQuery(query)).assertEqual(true);
            gl.deleteQuery(query);
            console.log("webgltest delete Query");
            console.log("webgltest isQuery:", gl.isQuery(query));
            expect(gl.isQuery(query)).assertEqual(false);
            done();
        });
        /**
         * @tc.name   webgl2_test_getQuery_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_QUERY_0017
         * @tc.desc   Test getQuery.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_getQuery_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_getQuery] getQuery");
            getQuery((query) => {
                gl.getQuery(gl.ANY_SAMPLES_PASSED_CONSERVATIVE, gl.CURRENT_QUERY);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.name   webgl2_test_getQuery_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_QUERY_0018
         * @tc.desc   Test getQuery.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_getQuery_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_getQuery] getQuery");
            getQuery((query) => {
                gl.getQuery(gl.TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN, gl.CURRENT_QUERY);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.name   webgl2_test_getQuery_3
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_QUERY_0019
         * @tc.desc   Test getQuery.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_getQuery_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_getQuery] getQuery");
            getQuery((query) => {
                gl.getQuery(gl.ANY_SAMPLES_PASSED, gl.CURRENT_QUERY);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function getQueryParameter(callback, finish) {
            let query = gl.createQuery();
            expect(query != null).assertTrue();
            gl.beginQuery(gl.ANY_SAMPLES_PASSED, query);
            gl.endQuery(gl.ANY_SAMPLES_PASSED);
            callback(query);
            finish(gl.isQuery(query));
            gl.deleteQuery(query);
        }
        /**
         * @tc.name   webgl2_test_getQueryParameter
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_QUERY_0020
         * @tc.desc   Test getQueryParameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_getQueryParameter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_getQueryParameter] getQueryParameter");
            let query = gl.createQuery();
            console.log("webgltest Query:", query);
            expect(query != null).assertTrue();
            gl.beginQuery(gl.ANY_SAMPLES_PASSED, query);
            console.log("webgltest isQuery:", gl.isQuery(query));
            expect(gl.isQuery(query)).assertEqual(true);
            gl.endQuery(gl.ANY_SAMPLES_PASSED);
            console.log("webgltest gl.getQueryParameter(query!, gl.QUERY_RESULT):", gl.getQueryParameter(query, gl.QUERY_RESULT));
            console.log("webgltest isQuery:", gl.isQuery(query));
            expect(gl.isQuery(query)).assertEqual(true);
            gl.deleteQuery(query);
            console.log("webgltest delete Query");
            console.log("webgltest isQuery:", gl.isQuery(query));
            expect(gl.isQuery(query)).assertEqual(false);
            done();
        });
        /**
         * @tc.name   webgl2_test_getQueryParameter_1
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_QUERY_0021
         * @tc.desc   Test getQueryParameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_getQueryParameter_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_getQueryParameter] getQueryParameter");
            getQueryParameter((query) => {
                gl.getQueryParameter(query, gl.QUERY_RESULT_AVAILABLE);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.name   webgl2_test_getQueryParameter_2
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_QUERY_0022
         * @tc.desc   Test getQueryParameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('webgl2_test_getQueryParameter_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_getQueryParameter] getQueryParameter");
            getQueryParameter((query) => {
                gl.getQueryParameter(query, gl.QUERY_RESULT);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
    })
}
