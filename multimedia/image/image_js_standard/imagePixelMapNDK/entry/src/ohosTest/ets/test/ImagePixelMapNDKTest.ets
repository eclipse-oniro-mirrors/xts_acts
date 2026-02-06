/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import pixelMapNdkTest from 'libPixelMapNdk.so';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@kit.BasicServicesKit';
import taskpool from '@ohos.taskpool';

const SCALE_FIRST = image.CropAndScaleStrategy.SCALE_FIRST;
const CROP_FIRST = image.CropAndScaleStrategy.CROP_FIRST;
const AUTO = image.AllocatorType.AUTO;
const DMA = image.AllocatorType.DMA;
const SHARE_MEMORY = image.AllocatorType.SHARE_MEMORY;
const RGB_565 = image.PixelMapFormat.RGB_565;
const RGBA_8888 = image.PixelMapFormat.RGBA_8888;
const BGRA_8888 = image.PixelMapFormat.BGRA_8888;
const RGB_888 = image.PixelMapFormat.RGB_888;
const NV21 = image.PixelMapFormat.NV21;
const NV12 = image.PixelMapFormat.NV12;

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

async function decodeTiffTestInTaskPool(
    testNum: string,
    filePath: string,
    desiredInfo: pixelMapNdkTest.decodeOptions
): Promise<boolean> {
    console.log(testNum + " taskpool start");
    try {
        let task = new taskpool.Task(testDecodeTiff, testNum, filePath, desiredInfo);
        let ret = (await taskpool.execute(task)) as boolean;
        console.log(testNum + " taskpool ret: " + ret);
        return ret;
    } catch (error) {
        console.log(testNum + " taskpool: taskpool execute error is " + error);
        return false;
    }
}

@Concurrent
function testDecodeTiff(
    testNum: string,
    filePath: string,
    desiredInfo: pixelMapNdkTest.decodeOptions
): boolean {
    let imageInfo = pixelMapNdkTest.CreatePixelMapAndGetInfo(filePath, desiredInfo);
    if (typeof imageInfo == 'object') {
        let expectedWidth = desiredInfo.width;
        let expectedHeight = desiredInfo.height;
        let expectedPixelFormat = desiredInfo.pixelFormat;
        if (desiredInfo.cropAndScaleStrategy == image.CropAndScaleStrategy.SCALE_FIRST && desiredInfo.desiredRegion) {
          expectedWidth = desiredInfo.desiredRegion.width;
          expectedHeight = desiredInfo.desiredRegion.height;
          expectedPixelFormat = image.PixelMapFormat.RGBA_8888; // SCALE_FIRST模式下，像素格式为RGBA_8888
        }
        let ret = (imageInfo.width == expectedWidth) &&
                  (imageInfo.height == expectedHeight) &&
                  (imageInfo.pixelFormat == expectedPixelFormat) &&
                  (imageInfo.mimeType == desiredInfo.mimeType);
        console.log(testNum + ": expected result = " + JSON.stringify(desiredInfo));
        console.log(testNum + ": CreatePixelMapAndGetInfo result = " + JSON.stringify(imageInfo));
        return ret;
    } else {
        console.log(testNum + ": CreatePixelMapAndGetInfo result is not object!");
        return false;
    }
}

export default function ImagePixelMapNDKTest() {
    describe('ImagePixelMapNDKTest', () => {
        let isSupportTiff: Boolean;
        let globalpixelmap:image.PixelMap;
        let filesDir: string|undefined;
        const RESULT_SUCCESS = 0;
        const BYTESNUMBER = 16;
        const test_wbmp = 'test.wbmp';

        beforeAll(() => {
            console.info('beforeAll case');
            filesDir = AppStorage.get('pathDir');
            isSupportTiff =
                image.getImageSourceSupportedFormats().includes("image/tiff");
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
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0100
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
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
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0200
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            const checkResult = (result: number) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0200', 'initNativePixelMap', checkResult);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0300
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            const checkResult = (result: number) => result != undefined;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0300', 'createAlphaPixelMap', checkResult);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0400
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == BYTESNUMBER;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0400', 'getBytesNumberPerRow', checkResult);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0500
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0500
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == opts.editable;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0500', 'getIsEditable', checkResult);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0600
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0600
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == 1;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0600', 'isSupportAlpha', checkResult);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0700
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0700
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0700', 'setAlphaAble', checkResult, 0);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0800
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0800
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0800', 'setDensity', checkResult, 360);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0900
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0900
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_0900', 'getDensity', checkResult);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1000
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1000
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1000', 'setOpacity', checkResult, 0.5);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1100
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1100
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1100', 'scale', checkResult, 1.5, 1.5);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1200
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1200
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1200', 'translate', checkResult, 2.0, 3.0);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1300
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1300
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1300', 'rotate', checkResult, 90);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1400
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1400
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1400', 'flip', checkResult, 1, 0);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1500
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1500
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1500', 'crop', checkResult, 0, 1, 3, 2);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1600
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1600
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result != undefined;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1600', 'getImageInfo', checkResult);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1700
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1700
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1700', 'accessPixels', checkResult);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1800
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1800
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == RESULT_SUCCESS;
            await pixelMapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_1800', 'unAccessPixels', checkResult);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0100
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0100', 'setAlphaAble', checkResult, 'a');
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0200
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == -1;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0200', 'setAlphaAble', checkResult, 66);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0300
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0300', 'setAlphaAble', checkResult, {
                a: 1
            });
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0400
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0400', 'setDensity', checkResult, {
                a: 1
            });
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0500
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0500
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0500', 'setDensity', checkResult,
                'density');
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0600
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0600
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0600', 'setDensity', checkResult, true);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0700
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0700
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0700', 'setOpacity', checkResult, true);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0800
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0800
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == -1;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0800', 'setOpacity', checkResult, 2);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0900
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0900
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_0900', 'setOpacity', checkResult, {
                a: 1
            });
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1000
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1000
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1000', 'scale', checkResult, {
                a: 10
            }, 1.0);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1100
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1100
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1100', 'scale', checkResult, 1.0, null);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1200
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1200
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1200', 'scale', checkResult, true, 1.0);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1300
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1300
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1300', 'translate', checkResult, {
                a: 10
            }, 1.0);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1400
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1400
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1400', 'translate', checkResult, 1.0,
                null);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1500
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1500
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1500', 'translate', checkResult, true,
                1.0);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1600
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1600
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1600', 'rotate', checkResult, true);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1700
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1700
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1700', 'rotate', checkResult, null);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1800
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1800
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1800', 'rotate', checkResult, 'a');
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1900
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1900
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_1900', 'flip', checkResult, {
                a: 10
            });
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2000
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2000
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2000', 'flip', checkResult, null);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2100
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2100
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2100', 'flip', checkResult, 'a');
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2200
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2200
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2200', 'crop', checkResult, 'a', 1, 3, 2);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2300
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2300
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2300', 'crop', checkResult, 0, {
                a: 1
            }, 3, 2);
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2400
         * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2400
         * @tc.desc   1.createPixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done:Function) => {
            const checkResult = (result:number) => result == undefined;
            await pixelMapErrTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPNDK_ERR_2400', 'crop', checkResult, 0, 1, true,
                2);
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0100
         * @tc.desc   1.create pixelmap object by imageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0100', Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0100";
            let expectInfo: pixelMapNdkTest.decodeOptions = {
                width: 256,
                height: 256,
                pixelFormat: image.PixelMapFormat.RGBA_8888,
                mimeType: "image/wbmp"
            };
            let filePath = filesDir + "/" + test_wbmp;
            let imageInfo = pixelMapNdkTest.CreatePixelMapAndGetInfo(filePath, expectInfo);
            if (typeof imageInfo == 'object') {
                let ret = (imageInfo.width == 256) &&
                        (imageInfo.height == 256) &&
                        (imageInfo.pixelFormat == image.PixelMapFormat.RGBA_8888) &&
                        (imageInfo.mimeType == expectInfo.mimeType);
                console.log(testNum + ": CreatePixelMapAndGetInfo result = " + JSON.stringify(imageInfo));
                console.log(testNum + ": expected result = " + JSON.stringify(imageInfo));
                expect(ret).assertTrue();
            } else {
                console.log(testNum + ": CreatePixelMapAndGetInfo result is not object!");
                expect(false).assertTrue();
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0200
         * @tc.desc   1.create pixelmap object by imageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0200', Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0200";
            let filePath = filesDir + "/" + test_wbmp;
            let imageInfo = pixelMapNdkTest.CreatePixelMapAndGetInfo(filePath);
            if (typeof imageInfo == 'object') {
                let ret = (imageInfo.width != undefined) &&
                        (imageInfo.height != undefined) &&
                        (imageInfo.pixelFormat != undefined) &&
                        (imageInfo.mimeType == "image/wbmp");
                console.log(testNum + ": CreatePixelMapAndGetInfo result = " + JSON.stringify(imageInfo));
                console.log(testNum + ": expected result = " + JSON.stringify(imageInfo));
                expect(ret).assertTrue();
            } else {
                console.log(testNum + ": CreatePixelMapAndGetInfo result is not object!");
                expect(false).assertTrue();
            }
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0100
         * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0100
         * @tc.desc        1.create pixelmap object by imageSource
         *                 2.set DecodingOptions
         *                 3.verify pixelmap info
         * @tc.size        MediumTest
         * @tc.type        Functional
         * @tc.level       Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0100', Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0100";
            if (!isSupportTiff) {
                console.info(testNum + "device is not support tiff");
                done();
                return;
            }
            let filePath = filesDir + "/" + "1920x1080_Deflate.tiff";
            let desiredInfo: pixelMapNdkTest.decodeOptions = {
                width: 2048,
                height: 2048,
                pixelFormat: RGB_565,
                mimeType: "image/tiff"
            };
            let ret = await decodeTiffTestInTaskPool(testNum, filePath, desiredInfo);
            expect(ret).assertTrue();
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0200
         * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0200
         * @tc.desc        1.create pixelmap object by imageSource
         *                 2.set DecodingOptions
         *                 3.verify pixelmap info
         * @tc.size        MediumTest
         * @tc.type        Functional
         * @tc.level       Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0200', Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0200";
            if (!isSupportTiff) {
                console.info(testNum + "device is not support tiff");
                done();
                return;
            }
            let filePath = filesDir + "/" + "1920x1080_G3.tiff";
            let desiredInfo: pixelMapNdkTest.decodeOptions = {
                width: 2048,
                height: 2048,
                pixelFormat: RGB_565,
                mimeType: "image/tiff"
            };
            let ret = await decodeTiffTestInTaskPool(testNum, filePath, desiredInfo);
            expect(ret).assertTrue();
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0300
         * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0300
         * @tc.desc        1.create pixelmap object by imageSource
         *                 2.set DecodingOptions
         *                 3.verify pixelmap info
         * @tc.size        MediumTest
         * @tc.type        Functional
         * @tc.level       Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0300', Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0300";
            if (!isSupportTiff) {
                console.info(testNum + "device is not support tiff");
                done();
                return;
            }
            let filePath = filesDir + "/" + "1920x1080_G4.tiff";
            let desiredInfo: pixelMapNdkTest.decodeOptions = {
                width: 2048,
                height: 2048,
                pixelFormat: RGB_565,
                mimeType: "image/tiff"
            };
            let ret = await decodeTiffTestInTaskPool(testNum, filePath, desiredInfo);
            expect(ret).assertTrue();
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0400
         * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0400
         * @tc.desc        1.create pixelmap object by imageSource
         *                 2.set DecodingOptions
         *                 3.verify pixelmap info
         * @tc.size        MediumTest
         * @tc.type        Functional
         * @tc.level       Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0400', Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0400";
            if (!isSupportTiff) {
                console.info(testNum + "device is not support tiff");
                done();
                return;
            }
            let filePath = filesDir + "/" + "1920x1080_Jpeg.tiff";
            let desiredInfo: pixelMapNdkTest.decodeOptions = {
                width: 2048,
                height: 2048,
                pixelFormat: RGB_565,
                mimeType: "image/tiff"
            };
            let ret = await decodeTiffTestInTaskPool(testNum, filePath, desiredInfo);
            expect(ret).assertTrue();
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0500
         * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0500
         * @tc.desc        1.create pixelmap object by imageSource
         *                 2.set DecodingOptions
         *                 3.verify pixelmap info
         * @tc.size        MediumTest
         * @tc.type        Functional
         * @tc.level       Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0500', Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0500";
            if (!isSupportTiff) {
                console.info(testNum + "device is not support tiff");
                done();
                return;
            }
            let filePath = filesDir + "/" + "1920x1080_Lzw.tiff";
            let desiredInfo: pixelMapNdkTest.decodeOptions = {
                width: 4096,
                height: 4096,
                pixelFormat: RGBA_8888,
                mimeType: "image/tiff"
            };
            let ret = await decodeTiffTestInTaskPool(testNum, filePath, desiredInfo);
            expect(ret).assertTrue();
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0600
         * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0600
         * @tc.desc        1.create pixelmap object by imageSource
         *                 2.set DecodingOptions
         *                 3.verify pixelmap info
         * @tc.size        MediumTest
         * @tc.type        Functional
         * @tc.level       Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0600', Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0600";
            if (!isSupportTiff) {
                console.info(testNum + "device is not support tiff");
                done();
                return;
            }
            let filePath = filesDir + "/" + "1920x1080_Next.tiff";
            let desiredInfo: pixelMapNdkTest.decodeOptions = {
                width: 4096,
                height: 4096,
                pixelFormat: RGBA_8888,
                mimeType: "image/tiff"
            };
            let ret = await decodeTiffTestInTaskPool(testNum, filePath, desiredInfo);
            expect(ret).assertTrue();
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0700
         * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0700
         * @tc.desc        1.create pixelmap object by imageSource
         *                 2.set DecodingOptions
         *                 3.verify pixelmap info
         * @tc.size        MediumTest
         * @tc.type        Functional
         * @tc.level       Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0700', Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0700";
            if (!isSupportTiff) {
                console.info(testNum + "device is not support tiff");
                done();
                return;
            }
            let filePath = filesDir + "/" + "1920x1080_none.tiff";
            let desiredInfo: pixelMapNdkTest.decodeOptions = {
                width: 4096,
                height: 4096,
                pixelFormat: RGBA_8888,
                mimeType: "image/tiff"
            };
            let ret = await decodeTiffTestInTaskPool(testNum, filePath, desiredInfo);
            expect(ret).assertTrue();
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0800
         * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0800
         * @tc.desc        1.create pixelmap object by imageSource
         *                 2.set DecodingOptions
         *                 3.verify pixelmap info
         * @tc.size        MediumTest
         * @tc.type        Functional
         * @tc.level       Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0800', Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0800";
            if (!isSupportTiff) {
                console.info(testNum + "device is not support tiff");
                done();
                return;
            }
            let filePath = filesDir + "/" + "1920x1080_Packbits.tiff";
            let desiredInfo: pixelMapNdkTest.decodeOptions = {
                width: 4096,
                height: 4096,
                pixelFormat: RGBA_8888,
                mimeType: "image/tiff"
            };
            let ret = await decodeTiffTestInTaskPool(testNum, filePath, desiredInfo);
            expect(ret).assertTrue();
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0900
         * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0900
         * @tc.desc        1.create pixelmap object by imageSource
         *                 2.set DecodingOptions
         *                 3.verify pixelmap info
         * @tc.size        MediumTest
         * @tc.type        Functional
         * @tc.level       Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0900', Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_0900";
            if (!isSupportTiff) {
                console.info(testNum + "device is not support tiff");
                done();
                return;
            }
            let filePath = filesDir + "/" + "1920x1080_PixarLog_RGB.tiff";
            let desiredInfo: pixelMapNdkTest.decodeOptions = {
                width: 4096,
                height: 4096,
                pixelFormat: BGRA_8888,
                mimeType: "image/tiff"
            };
            let ret = await decodeTiffTestInTaskPool(testNum, filePath, desiredInfo);
            expect(ret).assertTrue();
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_1000
         * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_1000
         * @tc.desc        1.create pixelmap object by imageSource
         *                 2.set DecodingOptions
         *                 3.verify pixelmap info
         * @tc.size        MediumTest
         * @tc.type        Functional
         * @tc.level       Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_1000', Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_1000";
            if (!isSupportTiff) {
                console.info(testNum + "device is not support tiff");
                done();
                return;
            }
            let filePath = filesDir + "/" + "1920x1080_SGILOG_gray16.tiff";
            let desiredInfo: pixelMapNdkTest.decodeOptions = {
                width: 4096,
                height: 4096,
                pixelFormat: BGRA_8888,
                mimeType: "image/tiff",
                desiredRegion: { x: 0, y: 0, width: 150, height: 150 },
                cropAndScaleStrategy: CROP_FIRST
            };
            let ret = await decodeTiffTestInTaskPool(testNum, filePath, desiredInfo);
            expect(ret).assertTrue();
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_1100
         * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_1100
         * @tc.desc        1.create pixelmap object by imageSource
         *                 2.set DecodingOptions
         *                 3.verify pixelmap info
         * @tc.size        MediumTest
         * @tc.type        Functional
         * @tc.level       Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_1100', Level.LEVEL0, async (done: Function) => {
            let testNum = "SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_TIFF_NATIVE_1100";
            if (!isSupportTiff) {
                console.info(testNum + "device is not support tiff");
                done();
                return;
            }
            let filePath = filesDir + "/" + "thunderscan-1920x1080.tiff";
            let desiredInfo: pixelMapNdkTest.decodeOptions = {
                width: 4096,
                height: 4096,
                pixelFormat: BGRA_8888,
                mimeType: "image/tiff",
                desiredRegion: { x: 0, y: 0, width: 150, height: 150 },
                cropAndScaleStrategy: SCALE_FIRST
            };
            let ret = await decodeTiffTestInTaskPool(testNum, filePath, desiredInfo);
            expect(ret).assertTrue();
            done();
        })
    })
}
