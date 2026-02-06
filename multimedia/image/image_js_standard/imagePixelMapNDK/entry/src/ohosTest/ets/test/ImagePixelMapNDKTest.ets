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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
import ndkTest from 'libentry.so'
import { image } from '@kit.ImageKit';
import { BusinessError } from '@kit.BasicServicesKit';

type CallbackFunctionWithPixelMap = (param: PixelMap) => number;
type CallbackFunctionWithNumber = (param: number) => boolean;

function logger(caseName:string): ESObject{
    return {
        myName: caseName,
        log: (msgc: string) => {
            console.info(caseName + ' ' + msgc);
        }
    };
}

function resulter(done:Function): ESObject {
    return {
        myDone: done,
        trueDone: (criterion: boolean) => {
            expect(criterion).assertTrue();
            done();
        },
        falseDone: (criterion: boolean) => {
            expect(criterion).assertFalse();
            done();
        },
        failDone: () => {
            expect().assertFail();
            done();
        },
        eTrue: (criterion: boolean) => {
            expect(criterion).assertTrue();
            done();
        },
        eFalse: (criterion: boolean) => {
            expect(criterion).assertFalse();
            done();
        },
    };
}

interface pixelMapPots {
    width: number,
    height: number,
    pixelFormat: number,
    editable: number,
    alphaType: number,
    scaleMode: number
}

let opts: pixelMapPots = {
    width: 4,
    height: 6,
    pixelFormat: 4,
    editable: 1,
    alphaType: 0,
    scaleMode: 1
};

function functionTest(log: ESObject, res: ESObject, pixelmap: image.PixelMap): ESObject {
    return {
        myLog: log,
        myRes: res,
        myPixelmap: pixelmap,
        test: (name: string, action: CallbackFunctionWithPixelMap, want: CallbackFunctionWithNumber): ESObject => {
            log.log("test " + name + " begin");
            let result = action(pixelmap);
            log.log("test " + name + " result [" + result + "]");
            if (!want(result)) {
                log.log(name + " Failed");
                log.trueDone(want(result));
                return undefined;
            }
            return result;
        }
    };
}

async function getPixelMap(): Promise<PixelMap> {
    let pixelMapRes: PixelMap;
    try {
        const color = new ArrayBuffer(96);
        pixelMapRes = ndkTest.createPixelMap(color, opts);
    } catch (error) {
        console.error("Test exception " + error);
        expect().assertFail();
    }
    return pixelMapRes!;
}

async function pixelMapTest(done: Function, testNum: string, pixelMapInterface: string, checkResult: CallbackFunctionWithNumber, ...params:ESObject[]) {
    try {
        console.info(testNum + 'before pixelMapTest');
        let log: ESObject = logger(testNum);
        let res: ESObject = resulter(done);
        let pixelmap = await getPixelMap();
        console.info(testNum + 'after getPixelMap');
        if (pixelmap == undefined) {
            expect(false).assertTrue();
            done();
        }
        console.info(testNum + 'after pixelmap == undefined');
        let testFunction1: ESObject = functionTest(log, res, pixelmap);
        testFunction1.test(pixelMapInterface, (value: image.PixelMap): number => {
            switch(pixelMapInterface)
            {
                case 'initNativePixelMap':
                {
                    console.info(testNum + 'before initNativePixelMap');
                    let result: number = ndkTest.initNativePixelMap(value, ...params);
                    console.info(testNum + 'after initNativePixelMap');
                    return result;
                }
                case 'createAlphaPixelMap':
                {
                    console.info(testNum + 'before initNativePixelMap');
                    let result: number = ndkTest.createAlphaPixelMap(value, ...params);
                    console.info(testNum + 'after initNativePixelMap');
                    return result;
                }
                case 'getBytesNumberPerRow':
                {
                    console.info(testNum + 'before initNativePixelMap');
                    let result: number = ndkTest.getBytesNumberPerRow(value, ...params);
                    console.info(testNum + 'after initNativePixelMap');
                    return result;
                }
                case 'getIsEditable':
                {
                    console.info(testNum + 'before initNativePixelMap');
                    let result: number = ndkTest.getIsEditable(value, ...params);
                    console.info(testNum + 'after initNativePixelMap');
                    return result;
                }
                case 'isSupportAlpha':
                    {
                        let result: number = ndkTest.isSupportAlpha(value, ...params);
                        return result;
                    }
                case 'setAlphaAble':
                    {
                        let result: number = ndkTest.setAlphaAble(value, ...params);
                        return result;
                    }
                case 'setDensity':
                    {
                        let result: number = ndkTest.setDensity(value, ...params);
                        return result;
                    }
                case 'getDensity':
                {
                    console.info(testNum + 'before getDensity');
                    let result: number = ndkTest.getDensity(value, ...params);
                    console.info(testNum + 'after getDensity');
                    return result;
                }
                case 'setOpacity':
                    {
                        let result: number = ndkTest.setOpacity(value, ...params);
                        return result;
                    }
                case 'scale':
                    {
                        let result: number = ndkTest.scale(value, ...params);
                        return result;
                    }
                case 'translate':
                    {
                        let result: number = ndkTest.translate(value, ...params);
                        return result;
                    }
                case 'rotate':
                    {
                        let result: number = ndkTest.rotate(value, ...params);
                        return result;
                    }
                case 'flip':
                    {
                        let result: number = ndkTest.flip(value, ...params);
                        return result;
                    }
                case 'crop':
                    {
                        let result: number = ndkTest.crop(value, ...params);
                        return result;
                    }
                case 'getImageInfo':
                {
                    let result: number = ndkTest.getImageInfo(value, ...params);
                    return result;
                }
                case 'accessPixels':
                {
                    let result: number = ndkTest.accessPixels(value, ...params);
                    return result;
                }
                case 'unAccessPixels':
                {
                    let result: number = ndkTest.unAccessPixels(value, ...params);
                    return result;
                }
                default :{
                    expect().assertFail();
                    done();
                    return -1;
                }
            }
        }, (result: number) => {
            return checkResult(result);
        });
        res.trueDone(true);
    } catch (error) {
        console.error(`${testNum} Test exception ` + error);
        expect().assertFail();
        done();
    }
}

async function pixelMapErrTest(done: Function, testNum: string, pixelMapInterface: string, checkResult: CallbackFunctionWithNumber, ...params:ESObject[]) {
    try {
        let log:ESObject = logger(testNum);
        let res:ESObject = resulter(done);
        let pixelmap = await getPixelMap();
        if (pixelmap == undefined) {
            expect(false).assertTrue();
            done();
            return;
        }
        let testFunction1:ESObject = functionTest(log, res, pixelmap);
        testFunction1.test(pixelMapInterface, (value:image.PixelMap) => {
            switch(pixelMapInterface)
            {
                case 'initNativePixelMap':
                {
                    let result: number = ndkTest.initNativePixelMap(value, ...params);
                    return result;
                }
                case 'createAlphaPixelMap':
                {
                    let result: number = ndkTest.createAlphaPixelMap(value, ...params);
                    return result;
                }
                case 'getBytesNumberPerRow':
                {
                    let result: number = ndkTest.getBytesNumberPerRow(value, ...params);
                    return result;
                }
                case 'getIsEditable':
                {
                    let result: number = ndkTest.getIsEditable(value, ...params);
                    return result;
                }
                case 'isSupportAlpha':
                {
                    let result: number = ndkTest.isSupportAlpha(value, ...params);
                    return result;
                }
                case 'setAlphaAble':
                {
                    let result: number = ndkTest.setAlphaAble(value, ...params);
                    return result;
                }
                case 'setDensity':
                {
                    let result: number = ndkTest.setDensity(value, ...params);
                    return result;
                }
                case 'setOpacity':
                {
                    let result: number = ndkTest.setOpacity(value, ...params);
                    return result;
                }
                case 'scale':
                {
                    let result: number = ndkTest.scale(value, ...params);
                    return result;
                }
                case 'translate':
                {
                    let result: number = ndkTest.translate(value, ...params);
                    return result;
                }
                case 'rotate':
                {
                    let result: number = ndkTest.rotate(value, ...params);
                    return result;
                }
                case 'flip':
                {
                    let result: number = ndkTest.flip(value, ...params);
                    return result;
                }
                case 'crop':
                {
                    let result: number = ndkTest.crop(value, ...params);
                    return result;
                }
                case 'getImageInfo':
                {
                    let result: number = ndkTest.getImageInfo(value, ...params);
                    return result;
                }
                case 'accessPixels':
                {
                    let result: number = ndkTest.accessPixels(value, ...params);
                    return result;
                }
                case 'unAccessPixels':
                {
                    let result: number = ndkTest.unAccessPixels(value, ...params);
                    return result;
                }
                default :{
                    expect().assertFail();
                    done();
                    return -1;
                }
            }
        }, (result: number) => {
            return checkResult(result);
        });
        res.trueDone(true);
    } catch (error) {
        console.error(`${testNum} Test exception ` + error);
        expect().assertFail();
        done();
    }
}

export default function ImagePixelMapNDKTest() {
    describe('ImagePixelMapNDKTest', () => {
        let globalpixelmap:image.PixelMap;
        const RESULT_SUCCESS = 0;
        const BYTESNUMBER = 16;

        beforeAll(() => {
            console.info('beforeAll case');
        });
        beforeEach(() => {
            console.info('beforeEach case');
        });
        afterEach(async () => {
            if (globalpixelmap != undefined) {
                console.info('globalpixelmap release start');
                try {
                    await globalpixelmap.release();
                } catch (error) {
                    console.info('globalpixelmap release fail');
                }
            }
            console.info('afterEach case');
        });
        afterAll(() => {
            console.info('afterAll case');
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0100
         * @tc.name      : createPixelMap
         * @tc.desc      : 1.createPixelMap
         *               : 2.return pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            try {
                let pixelmap = await getPixelMap();
                if (pixelmap == undefined) {
                    return;
                }
                globalpixelmap = pixelmap;
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0200
         * @tc.name      : initNativePixelMap
         * @tc.desc      : 1.createPixelMap
         *               : 2.initNativePixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            const checkResult = (result: number) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0200', 'initNativePixelMap', checkResult);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0300
         * @tc.name      : createAlphaPixelMap
         * @tc.desc      : 1.createPixelMap
         *               : 2.createAlphaPixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            const checkResult = (result: number) => result != undefined;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0300', 'createAlphaPixelMap', checkResult);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0400
         * @tc.name      : getBytesNumberPerRow
         * @tc.desc      : 1.createPixelMap
         *               : 2.getBytesNumberPerRow
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == BYTESNUMBER;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0400', 'getBytesNumberPerRow', checkResult);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0500
         * @tc.name      : getIsEditable
         * @tc.desc      : 1.createPixelMap
         *               : 2.getIsEditable
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == opts.editable;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0500', 'getIsEditable', checkResult);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0600
         * @tc.name      : isSupportAlpha
         * @tc.desc      : 1.createPixelMap
         *               : 2.isSupportAlpha
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == 1;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0600', 'isSupportAlpha', checkResult);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0700
         * @tc.name      : setAlphaAble
         * @tc.desc      : 1.createPixelMap
         *               : 2.setAlphaAble
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0700', 'setAlphaAble', checkResult, 0);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0800
         * @tc.name      : setDensity
         * @tc.desc      : 1.createPixelMap
         *               : 2.setDensity
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0800', 'setDensity', checkResult, 360);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0900
         * @tc.name      : getDensity
         * @tc.desc      : 1.createPixelMap
         *               : 2.getDensity
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0900', 'getDensity', checkResult);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1000
         * @tc.name      : setOpacity
         * @tc.desc      : 1.createPixelMap
         *               : 2.setOpacity
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1000', 'setOpacity', checkResult, 0.5);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1100
         * @tc.name      : scale
         * @tc.desc      : 1.createPixelMap
         *               : 2.scale
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1100', 'scale', checkResult, 1.5, 1.5);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1200
         * @tc.name      : translate
         * @tc.desc      : 1.createPixelMap
         *               : 2.translate
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1200', 'translate', checkResult, 2.0, 3.0);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1300
         * @tc.name      : rotate
         * @tc.desc      : 1.createPixelMap
         *               : 2.rotate
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1300', 'rotate', checkResult, 90);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1400
         * @tc.name      : flip
         * @tc.desc      : 1.createPixelMap
         *               : 2.flip
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1400', 'flip', checkResult, 1, 0);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1500
         * @tc.name      : crop
         * @tc.desc      : 1.createPixelMap
         *               : 2.crop
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1500', 'crop', checkResult, 0, 1, 3, 2);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1600
         * @tc.name      : getImageInfo
         * @tc.desc      : 1.createPixelMap
         *               : 2.getImageInfo
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result != undefined;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1600', 'getImageInfo', checkResult);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1700
         * @tc.name      : accessPixels
         * @tc.desc      : 1.createPixelMap
         *               : 2.accessPixels
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1700', 'accessPixels', checkResult);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1800
         * @tc.name      : unAccessPixels
         * @tc.desc      : 1.createPixelMap
         *               : 2.unAccessPixels
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1800', 'unAccessPixels', checkResult);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0100
         * @tc.name      : setAlphaAble_1
         * @tc.desc      : 1.createPixelMap
         *               : 2.setAlphaAble
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0100', 'setAlphaAble', checkResult, 'a');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0200
         * @tc.name      : setAlphaAble_2
         * @tc.desc      : 1.createPixelMap
         *               : 2.setAlphaAble
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == -1;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0200', 'setAlphaAble', checkResult, 66);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0300
         * @tc.name      : setAlphaAble_3
         * @tc.desc      : 1.createPixelMap
         *               : 2.setAlphaAble
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0300', 'setAlphaAble', checkResult, {
                a: 1
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0400
         * @tc.name      : setDensity_1
         * @tc.desc      : 1.createPixelMap
         *               : 2.setDensity
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0400', 'setDensity', checkResult, {
                a: 1
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0500
         * @tc.name      : setDensity_2
         * @tc.desc      : 1.createPixelMap
         *               : 2.setDensity
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0500', 'setDensity', checkResult,
                'density');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0600
         * @tc.name      : setDensity_3
         * @tc.desc      : 1.createPixelMap
         *               : 2.setDensity
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0600', 'setDensity', checkResult, true);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0700
         * @tc.name      : setOpacity_1
         * @tc.desc      : 1.createPixelMap
         *               : 2.setOpacity
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0700', 'setOpacity', checkResult, true);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0800
         * @tc.name      : setOpacity_2
         * @tc.desc      : 1.createPixelMap
         *               : 2.setOpacity
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == -1;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0800', 'setOpacity', checkResult, 2);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0900
         * @tc.name      : setOpacity_3
         * @tc.desc      : 1.createPixelMap
         *               : 2.setOpacity
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0900', 'setOpacity', checkResult, {
                a: 1
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1000
         * @tc.name      : scale_1
         * @tc.desc      : 1.createPixelMap
         *               : 2.scale
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1000', 'scale', checkResult, {
                a: 10
            }, 1.0);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1100
         * @tc.name      : scale_2
         * @tc.desc      : 1.createPixelMap
         *               : 2.scale
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1100', 'scale', checkResult, 1.0, null);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1200
         * @tc.name      : scale_3
         * @tc.desc      : 1.createPixelMap
         *               : 2.scale
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1200', 'scale', checkResult, true, 1.0);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1300
         * @tc.name      : translate_1
         * @tc.desc      : 1.createPixelMap
         *               : 2.translate
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1300', 'translate', checkResult, {
                a: 10
            }, 1.0);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1400
         * @tc.name      : translate_2
         * @tc.desc      : 1.createPixelMap
         *               : 2.translate
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1400', 'translate', checkResult, 1.0,
                null);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1500
         * @tc.name      : translate_3
         * @tc.desc      : 1.createPixelMap
         *               : 2.translate
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1500', 'translate', checkResult, true,
                1.0);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1600
         * @tc.name      : rotate_1
         * @tc.desc      : 1.createPixelMap
         *               : 2.rotate
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1600', 'rotate', checkResult, true);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1700
         * @tc.name      : rotate_2
         * @tc.desc      : 1.createPixelMap
         *               : 2.rotate
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1700', 'rotate', checkResult, null);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1800
         * @tc.name      : rotate_3
         * @tc.desc      : 1.createPixelMap
         *               : 2.rotate
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1800', 'rotate', checkResult, 'a');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1900
         * @tc.name      : flip_1
         * @tc.desc      : 1.createPixelMap
         *               : 2.flip
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1900', 'flip', checkResult, {
                a: 10
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2000
         * @tc.name      : flip_2
         * @tc.desc      : 1.createPixelMap
         *               : 2.flip
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2000', 'flip', checkResult, null);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2100
         * @tc.name      : flip_3
         * @tc.desc      : 1.createPixelMap
         *               : 2.flip
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2100', 'flip', checkResult, 'a');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2200
         * @tc.name      : crop_1
         * @tc.desc      : 1.createPixelMap
         *               : 2.crop
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2200', 'crop', checkResult, 'a', 1, 3, 2);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2300
         * @tc.name      : crop_2
         * @tc.desc      : 1.createPixelMap
         *               : 2.crop
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2300', 'crop', checkResult, 0, {
                a: 1
            }, 3, 2);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2400
         * @tc.name      : crop_3
         * @tc.desc      : 1.createPixelMap
         *               : 2.crop
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2400', 'crop', checkResult, 0, 1, true,
                2);
        });
    })
}
