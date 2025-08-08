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


export default function webgl2_sampler() {
    
	describe('webgl2_sampler', function () {
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
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0001
         * @tc.name webgl2_test_createSampler
         * @tc.desc Test createSampler.
         */
        it('webgl2_test_createSampler', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_createSampler] createSampler");
            let sampler = gl.createSampler();
            console.log("webgltest Sampler:", sampler);
            expect(sampler != null).assertTrue();
            console.log("webgltest isSampler:", gl.isSampler(sampler));
            expect(gl.isSampler(sampler)).assertEqual(true);
            console.log("webgltest delete Sampler");
            gl.deleteSampler(sampler);
            console.log("webgltest isSampler:", gl.isSampler(sampler));
            expect(gl.isSampler(sampler)).assertEqual(false);
            done();
        });
        // Method deletes the given Web GL Sampler object. This method is invalid if the program has been deleted.
        function deleteSampler(callback, finish) {
            let sampler = gl.createSampler();
            expect(sampler != null).assertTrue();
            callback(sampler);
            finish(gl.isSampler(sampler));
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0002
         * @tc.name webgl2_test_deleteSampler
         * @tc.desc Test deleteSampler.
         */
        it('webgl2_test_deleteSampler', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_deleteSampler] deleteSampler");
            let sampler = gl.createSampler();
            console.log("webgltest Sampler:", sampler);
            expect(sampler != null).assertTrue();
            console.log("webgltest isSampler:", gl.isSampler(sampler));
            expect(gl.isSampler(sampler)).assertEqual(true);
            console.log("webgltest delete Sampler");
            gl.deleteSampler(sampler);
            console.log("webgltest isSampler:", gl.isSampler(sampler));
            expect(gl.isSampler(sampler)).assertEqual(false);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0003
         * @tc.name webgl2_test_deleteSampler_1
         * @tc.desc Test deleteSampler.
         */
        it('webgl2_test_deleteSampler_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_deleteSampler] deleteSampler");
            deleteSampler((sampler) => {
                gl.deleteSampler(null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0004
         * @tc.name webgl2_test_deleteSampler_2
         * @tc.desc Test deleteSampler.
         */
        it('webgl2_test_deleteSampler_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_deleteSampler] deleteSampler");
            deleteSampler((sampler) => {
                gl.deleteSampler(undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function isSampler(callback, finish) {
            let sampler = gl.createSampler();
            expect(sampler != null).assertTrue();
            callback(sampler);
            finish(gl.isSampler(sampler));
            gl.deleteSampler(sampler);
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0005
         * @tc.name webgl2_test_isSampler
         * @tc.desc Test isSampler.
         */
        it('webgl2_test_isSampler', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_isSampler] isSampler");
            let sampler = gl.createSampler();
            console.log("webgltest Sampler:", sampler);
            expect(sampler != null).assertTrue();
            console.log("webgltest isSampler:", gl.isSampler(sampler));
            expect(gl.isSampler(sampler)).assertEqual(true);
            console.log("webgltest delete Sampler");
            gl.deleteSampler(sampler);
            console.log("webgltest isSampler:", gl.isSampler(sampler));
            expect(gl.isSampler(sampler)).assertEqual(false);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0006
         * @tc.name webgl2_test_isSampler_1
         * @tc.desc Test isSampler.
         */
        it('webgl2_test_isSampler_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_isSampler] isSampler");
            isSampler((sampler) => {
                gl.isSampler(null);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0007
         * @tc.name webgl2_test_isSampler_2
         * @tc.desc Test isSampler.
         */
        it('webgl2_test_isSampler_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_isSampler] isSampler");
            isSampler((sampler) => {
                gl.isSampler(undefined);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, () => {
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function bindSampler(callback, finish) {
            let sampler = gl.createSampler();
            let texture = gl.createTexture();
            gl.activeTexture(gl.TEXTURE0);
            gl.bindTexture(gl.TEXTURE_2D, texture);
            gl.samplerParameteri(sampler, gl.TEXTURE_MAG_FILTER, gl.NEAREST);
            callback(sampler, texture);
            finish(gl.isSampler(sampler));
            gl.deleteSampler(sampler);
            gl.deleteTexture(texture);
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0008
         * @tc.name webgl2_test_bindSampler
         * @tc.desc Test bindSampler.
         */
        it('webgl2_test_bindSampler', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_bindSampler] bindSampler");
            let sampler = gl.createSampler();
            let texture = gl.createTexture();
            console.log("webgltest ", sampler);
            expect(sampler != null).assertTrue();
            console.log("webgltest isSampler:", gl.isSampler(sampler));
            expect(gl.isSampler(sampler)).assertTrue();
            gl.activeTexture(gl.TEXTURE0);
            gl.bindTexture(gl.TEXTURE_2D, texture);
            gl.bindSampler(0, sampler);
            gl.samplerParameteri(sampler, gl.TEXTURE_MAG_FILTER, gl.NEAREST);
            console.log("webgltest bindSampler()");
            console.log("webgltest gl.samplerParameteri:", gl.getSamplerParameter(sampler, gl.TEXTURE_COMPARE_FUNC));
            console.log("webgltest delete Sampler");
            gl.deleteSampler(sampler);
            expect(gl.isSampler(sampler)).assertFalse();
            console.log("webgltest isSampler:", gl.isSampler(sampler));
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0009
         * @tc.name webgl2_test_bindSampler_1
         * @tc.desc Test bindSampler.
         */
        it('webgl2_test_bindSampler_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_bindSampler] bindSampler");
            bindSampler((sampler) => {
                gl.bindSampler(null, sampler);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isSampler) => {
                expect(isSampler).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0010
         * @tc.name webgl2_test_bindSampler_2
         * @tc.desc Test bindSampler.
         */
        it('webgl2_test_bindSampler_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_bindSampler] bindSampler");
            bindSampler((sampler) => {
                gl.bindSampler(undefined, sampler);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isSampler) => {
                expect(isSampler).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0011
         * @tc.name webgl2_test_bindSampler_3
         * @tc.desc Test bindSampler.
         */
        it('webgl2_test_bindSampler_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_bindSampler] bindSampler");
            bindSampler((sampler) => {
                gl.bindSampler(1, sampler);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isSampler) => {
                expect(isSampler).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0012
         * @tc.name webgl2_test_bindSampler_4
         * @tc.desc Test bindSampler.
         */
        it('webgl2_test_bindSampler_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_bindSampler] bindSampler");
            bindSampler((sampler) => {
                gl.bindSampler(2, sampler);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isSampler) => {
                expect(isSampler).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0013
         * @tc.name webgl2_test_bindSampler_5
         * @tc.desc Test bindSampler.
         */
        it('webgl2_test_bindSampler_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_bindSampler] bindSampler");
            bindSampler((sampler) => {
                gl.bindSampler(3, sampler);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isSampler) => {
                expect(isSampler).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0014
         * @tc.name webgl2_test_bindSampler_6
         * @tc.desc Test bindSampler.
         */
        it('webgl2_test_bindSampler_6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_bindSampler] bindSampler");
            bindSampler((sampler) => {
                gl.bindSampler(4, sampler);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isSampler) => {
                expect(isSampler).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0015
         * @tc.name webgl2_test_bindSampler_7
         * @tc.desc Test bindSampler.
         */
        it('webgl2_test_bindSampler_7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_bindSampler] bindSampler");
            bindSampler((sampler) => {
                gl.bindSampler(5, sampler);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isSampler) => {
                expect(isSampler).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0016
         * @tc.name webgl2_test_bindSampler_8
         * @tc.desc Test bindSampler.
         */
        it('webgl2_test_bindSampler_8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_bindSampler] bindSampler");
            bindSampler((sampler) => {
                gl.bindSampler(6, sampler);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isSampler) => {
                expect(isSampler).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0017
         * @tc.name webgl2_test_bindSampler_9
         * @tc.desc Test bindSampler.
         */
        it('webgl2_test_bindSampler_9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_bindSampler] bindSampler");
            bindSampler((sampler) => {
                gl.bindSampler(7, sampler);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isSampler) => {
                expect(isSampler).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0018
         * @tc.name webgl2_test_bindSampler_10
         * @tc.desc Test bindSampler.
         */
        it('webgl2_test_bindSampler_10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_bindSampler] bindSampler");
            bindSampler((sampler) => {
                gl.bindSampler(8, sampler);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isSampler) => {
                expect(isSampler).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0019
         * @tc.name webgl2_test_bindSampler_11
         * @tc.desc Test bindSampler.
         */
        it('webgl2_test_bindSampler_11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_bindSampler] bindSampler");
            bindSampler((sampler) => {
                gl.bindSampler(false, sampler);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isSampler) => {
                expect(isSampler).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function samplerParameteri(callback, finish) {
            let sampler = gl.createSampler();
            let texture = gl.createTexture();
            gl.activeTexture(gl.TEXTURE0);
            gl.bindTexture(gl.TEXTURE_2D, texture);
            gl.bindSampler(0, sampler);
            callback(sampler, texture);
            finish(gl.isSampler(sampler));
            gl.deleteSampler(sampler);
            gl.deleteTexture(texture);
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0020
         * @tc.name webgl2_test_samplerParameteri
         * @tc.desc Test samplerParameteri.
         */
        it('webgl2_test_samplerParameteri', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_samplerParameteri] samplerParameteri");
            let sampler = gl.createSampler();
            let texture = gl.createTexture();
            gl.activeTexture(gl.TEXTURE0);
            gl.bindTexture(gl.TEXTURE_2D, texture);
            gl.bindSampler(0, sampler);
            console.log("webgltest gl.getSamplerParameter(sampler, gl.TEXTURE_MIN_FILTER):", gl.getSamplerParameter(sampler, gl.TEXTURE_MIN_FILTER));
            expect(gl.getSamplerParameter(sampler, gl.TEXTURE_MIN_FILTER) == gl.NEAREST_MIPMAP_LINEAR).assertTrue();
            console.log("webgltest gl.samplerParameteri(sampler, gl.TEXTURE_MIN_FILTER, gl.LINEAR)");
            gl.samplerParameteri(sampler, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
            console.log("webgltest gl.getSamplerParameter(sampler, gl.TEXTURE_MIN_FILTER):", gl.getSamplerParameter(sampler, gl.TEXTURE_MIN_FILTER));
            expect(gl.getSamplerParameter(sampler, gl.TEXTURE_MIN_FILTER) == gl.LINEAR).assertTrue();
            gl.samplerParameteri(sampler, gl.TEXTURE_MIN_FILTER, gl.NEAREST_MIPMAP_LINEAR);
            gl.deleteSampler(sampler);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0021
         * @tc.name webgl2_test_samplerParameteri_1
         * @tc.desc Test samplerParameteri.
         */
        it('webgl2_test_samplerParameteri_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_samplerParameteri] samplerParameteri");
            samplerParameteri((sampler) => {
                gl.samplerParameteri(sampler, gl.TEXTURE_MAX_LOD, gl.LINEAR);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isSampler) => {
                expect(isSampler).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0022
         * @tc.name webgl2_test_samplerParameteri_2
         * @tc.desc Test samplerParameteri.
         */
        it('webgl2_test_samplerParameteri_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_samplerParameteri] samplerParameteri");
            samplerParameteri((sampler) => {
                gl.samplerParameteri(sampler, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isSampler) => {
                expect(isSampler).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0023
         * @tc.name webgl2_test_samplerParameteri_3
         * @tc.desc Test samplerParameteri.
         */
        it('webgl2_test_samplerParameteri_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_samplerParameteri] samplerParameteri");
            samplerParameteri((sampler) => {
                gl.samplerParameteri(sampler, gl.TEXTURE_MIN_LOD, gl.LINEAR);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isSampler) => {
                expect(isSampler).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function samplerParameterf(callback, finish) {
            let sampler = gl.createSampler();
            let texture = gl.createTexture();
            gl.activeTexture(gl.TEXTURE0);
            gl.bindTexture(gl.TEXTURE_2D, texture);
            gl.bindSampler(0, sampler);
            callback(sampler, texture);
            finish(gl.isSampler(sampler));
            gl.deleteSampler(sampler);
            gl.deleteTexture(texture);
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0024
         * @tc.name webgl2_test_samplerParameterf
         * @tc.desc Test samplerParameterf.
         */
        it('webgl2_test_samplerParameterf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgl2test [webgl2_test_samplerParameterf] samplerParameterf");
            let sampler = gl.createSampler();
            let texture = gl.createTexture();
            gl.activeTexture(gl.TEXTURE0);
            gl.bindTexture(gl.TEXTURE_2D, texture);
            gl.bindSampler(0, sampler);
            console.log("webgltest gl.getSamplerParameter(sampler, gl.TEXTURE_MAX_LOD):", gl.getSamplerParameter(sampler, gl.TEXTURE_MAX_LOD));
            expect(gl.getSamplerParameter(sampler, gl.TEXTURE_MAX_LOD) == 1000).assertTrue();
            console.log("webgltest gl.samplerParameteri(sampler, gl.TEXTURE_MAX_LOD, gl.LINEAR)");
            gl.samplerParameterf(sampler, gl.TEXTURE_MAX_LOD, gl.LINEAR);
            console.log("webgltest gl.getSamplerParameter(sampler, gl.TEXTURE_MAX_LOD):", gl.getSamplerParameter(sampler, gl.TEXTURE_MAX_LOD));
            expect(gl.getSamplerParameter(sampler, gl.TEXTURE_MAX_LOD) == gl.LINEAR).assertTrue();
            gl.samplerParameteri(sampler, gl.TEXTURE_MAX_LOD, gl.NEAREST_MIPMAP_LINEAR);
            gl.deleteSampler(sampler);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0025
         * @tc.name webgl2_test_samplerParameterf_1
         * @tc.desc Test samplerParameterf.
         */
        it('webgl2_test_samplerParameterf_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_samplerParameterf] samplerParameterf");
            samplerParameterf((sampler) => {
                gl.samplerParameterf(sampler, gl.TEXTURE_MAX_LOD, gl.LINEAR);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isSampler) => {
                expect(isSampler).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0026
         * @tc.name webgl2_test_samplerParameterf_2
         * @tc.desc Test samplerParameterf.
         */
        it('webgl2_test_samplerParameterf_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_samplerParameterf] samplerParameterf");
            samplerParameterf((sampler) => {
                gl.samplerParameterf(sampler, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isSampler) => {
                expect(isSampler).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0027
         * @tc.name webgl2_test_samplerParameterf_3
         * @tc.desc Test samplerParameterf.
         */
        it('webgl2_test_samplerParameterf_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_samplerParameterf] samplerParameterf");
            samplerParameterf((sampler) => {
                gl.samplerParameterf(sampler, gl.TEXTURE_MIN_LOD, gl.LINEAR);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isSampler) => {
                expect(isSampler).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        function getSamplerParameter(callback, finish) {
            let sampler = gl.createSampler();
            let texture = gl.createTexture();
            gl.activeTexture(gl.TEXTURE0);
            gl.bindTexture(gl.TEXTURE_2D, texture);
            gl.bindSampler(0, sampler);
            callback(sampler, texture);
            finish(gl.isSampler(sampler));
            gl.deleteSampler(sampler);
            gl.deleteTexture(texture);
        }
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0028
         * @tc.name webgl2_test_getSamplerParameter
         * @tc.desc Test getSamplerParameter.
         */
        it('webgl2_test_getSamplerParameter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_getSamplerParameter] getSamplerParameter");
            let sampler = gl.createSampler();
            let texture = gl.createTexture();
            gl.activeTexture(gl.TEXTURE0);
            gl.bindTexture(gl.TEXTURE_2D, texture);
            gl.bindSampler(0, sampler);
            console.log("webgltest gl.getSamplerParameter(sampler!, gl.TEXTURE_MIN_FILTER):", gl.getSamplerParameter(sampler, gl.TEXTURE_MIN_FILTER));
            expect(gl.getSamplerParameter(sampler, gl.TEXTURE_MIN_FILTER) == gl.NEAREST_MIPMAP_LINEAR).assertTrue();
            console.log("webgltest gl.getSamplerParameter(sampler!, gl.TEXTURE_MIN_FILTER, gl.LINEAR)");
            gl.samplerParameteri(sampler, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
            console.log("webgltest gl.getSamplerParameter(sampler!, gl.TEXTURE_MIN_FILTER):", gl.getSamplerParameter(sampler, gl.TEXTURE_MIN_FILTER));
            expect(gl.getSamplerParameter(sampler, gl.TEXTURE_MIN_FILTER) == gl.LINEAR).assertTrue();
            gl.samplerParameteri(sampler, gl.TEXTURE_MIN_FILTER, gl.NEAREST_MIPMAP_LINEAR);
            gl.deleteSampler(sampler);
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0029
         * @tc.name webgl2_test_getSamplerParameter_1
         * @tc.desc Test getSamplerParameter.
         */
        it('webgl2_test_getSamplerParameter_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_getSamplerParameter] getSamplerParameter");
            getSamplerParameter((sampler) => {
                gl.getSamplerParameter(sampler, gl.TEXTURE_COMPARE_FUNC);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isSampler) => {
                expect(isSampler).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0030
         * @tc.name webgl2_test_getSamplerParameter_2
         * @tc.desc Test getSamplerParameter.
         */
        it('webgl2_test_getSamplerParameter_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_getSamplerParameter] getSamplerParameter");
            getSamplerParameter((sampler) => {
                gl.getSamplerParameter(sampler, gl.TEXTURE_COMPARE_MODE);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isSampler) => {
                expect(isSampler).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0031
         * @tc.name webgl2_test_getSamplerParameter_3
         * @tc.desc Test getSamplerParameter.
         */
        it('webgl2_test_getSamplerParameter_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_getSamplerParameter] getSamplerParameter");
            getSamplerParameter((sampler) => {
                gl.getSamplerParameter(sampler, gl.TEXTURE_MAX_LOD);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isSampler) => {
                expect(isSampler).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0032
         * @tc.name webgl2_test_getSamplerParameter_4
         * @tc.desc Test getSamplerParameter.
         */
        it('webgl2_test_getSamplerParameter_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_getSamplerParameter] getSamplerParameter");
            getSamplerParameter((sampler) => {
                gl.getSamplerParameter(sampler, gl.TEXTURE_MIN_FILTER);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isSampler) => {
                expect(isSampler).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0033
         * @tc.name webgl2_test_getSamplerParameter_5
         * @tc.desc Test getSamplerParameter.
         */
        it('webgl2_test_getSamplerParameter_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_getSamplerParameter] getSamplerParameter");
            getSamplerParameter((sampler) => {
                gl.getSamplerParameter(sampler, gl.TEXTURE_MIN_LOD);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isSampler) => {
                expect(isSampler).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0034
         * @tc.name webgl2_test_getSamplerParameter_6
         * @tc.desc Test getSamplerParameter.
         */
        it('webgl2_test_getSamplerParameter_6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_getSamplerParameter] getSamplerParameter");
            getSamplerParameter((sampler) => {
                gl.getSamplerParameter(sampler, gl.TEXTURE_WRAP_R);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isSampler) => {
                expect(isSampler).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0035
         * @tc.name webgl2_test_getSamplerParameter_7
         * @tc.desc Test getSamplerParameter.
         */
        it('webgl2_test_getSamplerParameter_7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_getSamplerParameter] getSamplerParameter");
            getSamplerParameter((sampler) => {
                gl.getSamplerParameter(sampler, gl.TEXTURE_WRAP_S);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isSampler) => {
                expect(isSampler).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_SAMPLER_0036
         * @tc.name webgl2_test_getSamplerParameter_8
         * @tc.desc Test getSamplerParameter.
         */
        it('webgl2_test_getSamplerParameter_8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
            console.info("webgl2test [webgl2_test_getSamplerParameter] getSamplerParameter");
            getSamplerParameter((sampler) => {
                gl.getSamplerParameter(sampler, gl.TEXTURE_WRAP_T);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            }, (isSampler) => {
                expect(isSampler).assertEqual(true);
                expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            });
            done();
        });
    })
}
