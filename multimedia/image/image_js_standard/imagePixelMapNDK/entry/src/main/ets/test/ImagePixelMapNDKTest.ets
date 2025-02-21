// @ts-nocheck
/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'hypium/index'
// @ts-ignore
import ndkTest from 'libImagePixelMapNDKTest.so'

export default function ImagePixelMapNDKTest() {
    describe('ImagePixelMapNDKTest', function () {
        let globalpixelmap;
        const RESULT_SUCCESS = 0;
        const BYTESNUMBER = 16;
        function logger(caseName) {
            return {
                myName: caseName,
                log: function (msg) {
                    console.info(this.myName + ' ' + msg);
                }
            }
        }
        function resulter(done) {
            return {
                myDone: done,
                trueDone: function (criterion) {
                    expect(criterion).assertTrue();
                    this.myDone();
                },
                falseDone: function (criterion) {
                    expect(criterion).assertFalse();
                    this.myDone();
                },
                failDone: function () {
                    expect().assertFail();
                    this.myDone();
                },
                eTrue: function (criterion) {
                    expect(criterion).assertTrue();
                },
                eFalse: function (criterion) {
                    expect(criterion).assertFalse();
                },
            }
        }
        beforeAll(function () { console.info('beforeAll case'); })

        beforeEach(function () { console.info('beforeEach case'); })

        afterEach(async function () {
            if (globalpixelmap != undefined) {
                console.info('globalpixelmap release start');
                try {
                    await globalpixelmap.release();
                } catch (error) {
                    console.info('globalpixelmap release fail');
                }
            }
            console.info('afterEach case');
        })

        afterAll(function () { console.info('afterAll case'); })

        let opts = { width: 4, height: 6, pixelFormat: 4, editable: 1, alphaType: 0, scaleMode: 1 };
        function functionTest(log, res, pixelmap) {
            return {
                myLog: log,
                myRes: res,
                myPixelmap: pixelmap,
                test: function (name, action, want) {
                    this.myLog.log("test " + name + " begin");
                    var result = action(this.myPixelmap);
                    this.myLog.log("test " + name + " result [" + result + "]");
                    if (!want(result)) {
                        this.myLog.log(name + " Failed");
                        this.myRes.trueDone(want(result));
                        return undefined;
                    }
                    return result;
                }
            }
        }
        async function genPixelMap() {
            try {
                const color = new ArrayBuffer(96);
                return ndkTest.createPixelMap(color, opts);
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        }
        async function pixelMapTest(done, testNum, pixelMapInterface, checkResult, ...params) {
            try {
                var log = logger(testNum);
                var res = resulter(done);
                let pixelmap = await genPixelMap();
                if (pixelmap == undefined) {
                    expect(false).assertTrue();
                    done();
                    return;
                }
                globalpixelmap = pixelmap;
                let testFunction1 = functionTest(log, res, pixelmap);
                testFunction1.test(pixelMapInterface,
                    (value) => {
                        return ndkTest[pixelMapInterface](value, ...params);
                    }, (result) => {
                        return checkResult(result);
                    }
                )
                res.trueDone(true);
            } catch (error) {
                console.error(`${testNum} Test exception ` + error);
                expect().assertFail();
                done();
            }
        }
        async function pixelMapErrTest(done, testNum, pixelMapInterface, checkResult, ...params) {
            try {
                var log = logger(testNum);
                var res = resulter(done);
                let pixelmap = await genPixelMap();
                if (pixelmap == undefined) {
                    expect(false).assertTrue();
                    done();
                    return;
                }
                globalpixelmap = pixelmap;
                let testFunction1 = functionTest(log, res, pixelmap);
                testFunction1.test(pixelMapInterface,
                    (value) => {
                        return ndkTest[pixelMapInterface](value, ...params);
                    }, (result) => {
                        return checkResult(result);
                    }
                )
                res.trueDone(true);
            } catch (error) {
                console.error(`${testNum} Test exception ` + error);
                expect().assertFail();
                done();
            }
        }

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0100
         * @tc.name      : createPixelMap
         * @tc.desc      : 1.createPixelMap
         *               : 2.return pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0100', 0, async function (done) {
            try {
                let pixelmap = await genPixelMap();
                if (pixelmap == undefined) {
                    return;
                }
                globalpixelmap = pixelmap;
                expect(true).assertTrue();
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0200
         * @tc.name      : initNativePixelMap
         * @tc.desc      : 1.createPixelMap
         *               : 2.initNativePixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0200', 0, async function (done) {
            const checkResult = (result) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0200', 'initNativePixelMap', checkResult);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0300
         * @tc.name      : createAlphaPixelMap
         * @tc.desc      : 1.createPixelMap
         *               : 2.createAlphaPixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0300', 0, async function (done) {
            const checkResult = (result) => result != undefined;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0300', 'createAlphaPixelMap', checkResult);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0400
         * @tc.name      : getBytesNumberPerRow
         * @tc.desc      : 1.createPixelMap
         *               : 2.getBytesNumberPerRow
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0400', 0, async function (done) {
            const checkResult = (result) => result == BYTESNUMBER;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0400', 'getBytesNumberPerRow', checkResult);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0500
         * @tc.name      : getIsEditable
         * @tc.desc      : 1.createPixelMap
         *               : 2.getIsEditable
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0500', 0, async function (done) {
            const checkResult = (result) => result == opts.editable;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0500', 'getIsEditable', checkResult);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0600
         * @tc.name      : isSupportAlpha
         * @tc.desc      : 1.createPixelMap
         *               : 2.isSupportAlpha
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0600', 0, async function (done) {
            const checkResult = (result) => result == 1;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0600', 'isSupportAlpha', checkResult);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0700
         * @tc.name      : setAlphaAble
         * @tc.desc      : 1.createPixelMap
         *               : 2.setAlphaAble
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0700', 0, async function (done) {
            const checkResult = (result) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0700', 'setAlphaAble', checkResult, 0);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0800
         * @tc.name      : setDensity
         * @tc.desc      : 1.createPixelMap
         *               : 2.setDensity
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0800', 0, async function (done) {
            const checkResult = (result) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0800', 'setDensity', checkResult, 360);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0900
         * @tc.name      : getDensity
         * @tc.desc      : 1.createPixelMap
         *               : 2.getDensity
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0900', 0, async function (done) {
            const checkResult = (result) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0900', 'getDensity', checkResult);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1000
         * @tc.name      : setOpacity
         * @tc.desc      : 1.createPixelMap
         *               : 2.setOpacity
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1000', 0, async function (done) {
            const checkResult = (result) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1000', 'setOpacity', checkResult, 0.5);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1100
         * @tc.name      : scale
         * @tc.desc      : 1.createPixelMap
         *               : 2.scale
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1100', 0, async function (done) {
            const checkResult = (result) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1100', 'scale', checkResult, 1.5, 1.5);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1200
         * @tc.name      : translate
         * @tc.desc      : 1.createPixelMap
         *               : 2.translate
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1200', 0, async function (done) {
            const checkResult = (result) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1200', 'translate', checkResult, 2.0, 3.0);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1300
         * @tc.name      : rotate
         * @tc.desc      : 1.createPixelMap
         *               : 2.rotate
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1300', 0, async function (done) {
            const checkResult = (result) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1300', 'rotate', checkResult, 90);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1400
         * @tc.name      : flip
         * @tc.desc      : 1.createPixelMap
         *               : 2.flip
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1400', 0, async function (done) {
            const checkResult = (result) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1400', 'flip', checkResult, 1, 0);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1500
         * @tc.name      : crop
         * @tc.desc      : 1.createPixelMap
         *               : 2.crop
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1500', 0, async function (done) {
            const checkResult = (result) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1500', 'crop', checkResult, 0, 1, 3, 2);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1600
         * @tc.name      : getImageInfo
         * @tc.desc      : 1.createPixelMap
         *               : 2.getImageInfo
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1600', 0, async function (done) {
            const checkResult = (result) => result != undefined;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1600', 'getImageInfo', checkResult);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1700
         * @tc.name      : accessPixels
         * @tc.desc      : 1.createPixelMap
         *               : 2.accessPixels
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1700', 0, async function (done) {
            const checkResult = (result) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1700', 'accessPixels', checkResult);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1800
         * @tc.name      : unAccessPixels
         * @tc.desc      : 1.createPixelMap
         *               : 2.unAccessPixels
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1800', 0, async function (done) {
            const checkResult = (result) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1800', 'unAccessPixels', checkResult);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0100
         * @tc.name      : setAlphaAble_1
         * @tc.desc      : 1.createPixelMap
         *               : 2.setAlphaAble
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0100', 0, async function (done) {
            const checkResult = (result) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0100', 'setAlphaAble', checkResult, 'a');
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0200
         * @tc.name      : setAlphaAble_2
         * @tc.desc      : 1.createPixelMap
         *               : 2.setAlphaAble
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0200', 0, async function (done) {
            const checkResult = (result) => result == -1;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0200', 'setAlphaAble', checkResult, 66);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0300
         * @tc.name      : setAlphaAble_3
         * @tc.desc      : 1.createPixelMap
         *               : 2.setAlphaAble
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0300', 0, async function (done) {
            const checkResult = (result) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0300', 'setAlphaAble', checkResult,
                { a: 1 });
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0400
        * @tc.name      : setDensity_1
        * @tc.desc      : 1.createPixelMap
        *               : 2.setDensity
        * @tc.size      : MEDIUM
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0400', 0, async function (done) {
            const checkResult = (result) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0400', 'setDensity', checkResult, { a: 1 });
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0500
        * @tc.name      : setDensity_2
        * @tc.desc      : 1.createPixelMap
        *               : 2.setDensity
        * @tc.size      : MEDIUM
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0500', 0, async function (done) {
            const checkResult = (result) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0500', 'setDensity', checkResult,
                'density');
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0600
        * @tc.name      : setDensity_3
        * @tc.desc      : 1.createPixelMap
        *               : 2.setDensity
        * @tc.size      : MEDIUM
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0600', 0, async function (done) {
            const checkResult = (result) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0600', 'setDensity', checkResult, true);
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0700
        * @tc.name      : setOpacity_1
        * @tc.desc      : 1.createPixelMap
        *               : 2.setOpacity
        * @tc.size      : MEDIUM
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0700', 0, async function (done) {
            const checkResult = (result) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0700', 'setOpacity', checkResult, true);
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0800
        * @tc.name      : setOpacity_2
        * @tc.desc      : 1.createPixelMap
        *               : 2.setOpacity
        * @tc.size      : MEDIUM
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0800', 0, async function (done) {
            const checkResult = (result) => result == -1;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0800', 'setOpacity', checkResult, 2);
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0900
        * @tc.name      : setOpacity_3
        * @tc.desc      : 1.createPixelMap
        *               : 2.setOpacity
        * @tc.size      : MEDIUM
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0900', 0, async function (done) {
            const checkResult = (result) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0900', 'setOpacity', checkResult,
                { a: 1 });
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1000
        * @tc.name      : scale_1
        * @tc.desc      : 1.createPixelMap
        *               : 2.scale
        * @tc.size      : MEDIUM
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1000', 0, async function (done) {
            const checkResult = (result) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1000', 'scale', checkResult,
                { a: 10 }, 1.0);
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1100
        * @tc.name      : scale_2
        * @tc.desc      : 1.createPixelMap
        *               : 2.scale
        * @tc.size      : MEDIUM
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1100', 0, async function (done) {
            const checkResult = (result) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1100', 'scale', checkResult, 1.0, null);
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1200
        * @tc.name      : scale_3
        * @tc.desc      : 1.createPixelMap
        *               : 2.scale
        * @tc.size      : MEDIUM
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1200', 0, async function (done) {
            const checkResult = (result) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1200', 'scale', checkResult, true, 1.0);
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1300
        * @tc.name      : translate_1
        * @tc.desc      : 1.createPixelMap
        *               : 2.translate
        * @tc.size      : MEDIUM
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1300', 0, async function (done) {
            const checkResult = (result) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1300', 'translate', checkResult,
                { a: 10 }, 1.0);
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1400
        * @tc.name      : translate_2
        * @tc.desc      : 1.createPixelMap
        *               : 2.translate
        * @tc.size      : MEDIUM
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1400', 0, async function (done) {
            const checkResult = (result) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1400', 'translate', checkResult, 1.0, null);
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1500
        * @tc.name      : translate_3
        * @tc.desc      : 1.createPixelMap
        *               : 2.translate
        * @tc.size      : MEDIUM
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1500', 0, async function (done) {
            const checkResult = (result) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1500', 'translate', checkResult, true, 1.0);
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1600
        * @tc.name      : rotate_1
        * @tc.desc      : 1.createPixelMap
        *               : 2.rotate
        * @tc.size      : MEDIUM
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1600', 0, async function (done) {
            const checkResult = (result) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1600', 'rotate', checkResult, true);
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1700
        * @tc.name      : rotate_2
        * @tc.desc      : 1.createPixelMap
        *               : 2.rotate
        * @tc.size      : MEDIUM
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1700', 0, async function (done) {
            const checkResult = (result) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1700', 'rotate', checkResult, null);
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1800
        * @tc.name      : rotate_3
        * @tc.desc      : 1.createPixelMap
        *               : 2.rotate
        * @tc.size      : MEDIUM
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1800', 0, async function (done) {
            const checkResult = (result) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1800', 'rotate', checkResult, 'a');
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1900
        * @tc.name      : flip_1
        * @tc.desc      : 1.createPixelMap
        *               : 2.flip
        * @tc.size      : MEDIUM
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1900', 0, async function (done) {
            const checkResult = (result) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1900', 'flip', checkResult, { a: 10 });
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2000
        * @tc.name      : flip_2
        * @tc.desc      : 1.createPixelMap
        *               : 2.flip
        * @tc.size      : MEDIUM
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2000', 0, async function (done) {
            const checkResult = (result) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2000', 'flip', checkResult, null);
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2100
        * @tc.name      : flip_3
        * @tc.desc      : 1.createPixelMap
        *               : 2.flip
        * @tc.size      : MEDIUM
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2100', 0, async function (done) {
            const checkResult = (result) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2100', 'flip', checkResult, 'a');
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2200
        * @tc.name      : crop_1
        * @tc.desc      : 1.createPixelMap
        *               : 2.crop
        * @tc.size      : MEDIUM
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2200', 0, async function (done) {
            const checkResult = (result) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2200', 'crop', checkResult, 'a', 1, 3, 2);
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2300
        * @tc.name      : crop_2
        * @tc.desc      : 1.createPixelMap
        *               : 2.crop
        * @tc.size      : MEDIUM
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2300', 0, async function (done) {
            const checkResult = (result) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2300', 'crop', checkResult,
                0, { a: 1 }, 3, 2);
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2400
        * @tc.name      : crop_3
        * @tc.desc      : 1.createPixelMap
        *               : 2.crop
        * @tc.size      : MEDIUM
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2400', 0, async function (done) {
            const checkResult = (result) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2400', 'crop', checkResult, 0, 1, true, 2);
        })
    })
}
