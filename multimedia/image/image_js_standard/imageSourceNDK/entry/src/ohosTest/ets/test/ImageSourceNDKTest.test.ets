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

import image from "@ohos.multimedia.image";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import fileio from "@ohos.fileio";
import ndkTest from 'libentry.so';
import mdkTest from 'libentryMDK.so';
import { testJpg } from './testImg';
import { BusinessError } from "@kit.BasicServicesKit";
import { common } from '@kit.AbilityKit';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';
import display from '@ohos.display';
import hdrCapability from '@ohos.graphics.hdrCapability';
import fs from '@ohos.file.fs';

const CODE_SUCCESS = 0;
const CODE_ERROR = -1;
const PARA_ERROR_CODE = 7700204;
const ERROR_CODE = 401;
let uiContext: common.UIAbilityContext;
const RANGE_AUTO = image.DecodingDynamicRange.AUTO;
const RANGE_SDR = image.DecodingDynamicRange.SDR;
const RANGE_HDR = image.DecodingDynamicRange.HDR;
let globalImagesource: image.ImageSource | undefined;
let globalPixelMap: image.PixelMap | undefined;
let globalDecoingOption: image.DecodingOptions | undefined;
let isSupportHdr: Boolean;
let isSupportHEIFDecode: boolean;
let isSupportHEICEncode: boolean;

interface RecordKeyValue {
    key: image.PropertyKey,
    value: string
}

function logger(caseName: string): ESObject {
    return {
        myName: caseName,
        log: (msg: string) => {
            console.info(caseName + ' ' + msg);
        }
    };
}

async function getPath(fileName: string): Promise<string> {
    let filePath = "";
    try {
        filePath = uiContext.filesDir + "/" + fileName;
        console.info("image case filePath is " + filePath);
    } catch (error) {
        console.info("image getFd " + error);
    }
    return filePath;
}

async function getFd(fileName: string): Promise<(string | number)[]> {
    let fdNumber:number;
    let filePath:string;
    try {
        filePath = await getPath(fileName);
        console.info("image case filePath is " + filePath);
        await fileio.open(filePath, fs.OpenMode.READ_WRITE, fs.OpenMode.CREATE).then((data) => {
            fdNumber = data;
            console.info("image case open fd success " + fdNumber);
        }, (err:BusinessError) => {
            console.info("image case open fd fail" + err);
        }).catch((err:BusinessError) => {
            console.info("image case open fd err " + err);
        });
    } catch (error) {
        console.info("image getFd " + error);
    }
    return [filePath!, fdNumber!];
}

function getFdFilesDir (fileName: string) {
    const uri: string = uiContext.filesDir + "/" + fileName;
    const file: fs.File = fs.openSync(uri, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    return file.fd;
}

function checkNdkRes(res: ESObject) {
    expect(res != undefined).assertTrue();
    console.info('checkNdkRes res != undefined');
    expect(res.code == CODE_SUCCESS).assertTrue();
    console.info('checkNdkRes res.code == CODE_SUCCESS');
}

async function imageSourceCreateTest(done: Function, testNum: string, picName: string, source: string): Promise<ndkTest.resValue> {
    let res: ndkTest.resImageSource;
    try {
        let log:ESObject = logger(testNum);
        let fdResult = await getFd(picName);
        let path: string = fdResult[0] as string;
        let fd: number = fdResult[1]  as number;
        let imageSourceOps: ESObject = {
            density: 240
        };
        const sources:ESObject = {
            'fd': fd, 'path': path, 'buffer': testJpg.buffer
        };
        res = ndkTest.create(sources[source], imageSourceOps);
        log.log("imageSourceCreate res " + JSON.stringify(res));
        checkNdkRes(res);
        expect(res.result != undefined).assertTrue();
        console.info('imageSourceCreate res != null')
        return res;
    } catch (error) {
        let log:ESObject = logger(testNum);
        log.log("Test exception1 " + error);
        expect().assertFail();
        done();
    }
    return res!;
}

async function imageSourceCreateFromFdTest(done: Function, testNum: string, picName: string): Promise<ndkTest.resValue> {
    let res: ndkTest.resImageSource;
    try {
        let log:ESObject = logger(testNum);
        let fdResult = await getFd(picName);
        let path: string = fdResult[0] as string;
        let fd:number = fdResult[1]  as number;
        let imageSourceOps:ESObject = {
            density: 240
        };
        res = ndkTest.createFromFd(fd, imageSourceOps);
        log.log("imageSourceCreateFromFd res " + JSON.stringify(res));
        checkNdkRes(res);
        expect(res.result != undefined).assertTrue();
        return res;
    } catch (error) {
        let log:ESObject = logger(testNum);
        log.log("Test exception1 " + error);
        expect().assertFail();
        done();
    }
    return res!;
}

async function imageSourceCreateFromUriTest(done: Function, testNum: string, picName: string): Promise<ndkTest.resValue> {
    let res: ndkTest.resImageSource;
    try {
        let log:ESObject = logger(testNum);
        let fdResult = await getFd(picName);
        let path: string = fdResult[0] as string;
        let fd:number = fdResult[1]  as number;
        let imageSourceOps: ESObject = {
            density: 240
        };
        res = ndkTest.createFromUri(path, imageSourceOps);
        log.log("imageSourceCreateFromUri res " + JSON.stringify(res));
        checkNdkRes(res);
        expect(res.result != undefined).assertTrue();
        return res;
    } catch (error) {
        let log:ESObject = logger(testNum);
        log.log("Test exception1 " + error);
        expect().assertFail();
        done();
    }
    return res!;
}

async function imageSourceCreateFromDataTest(done: Function, testNum: string): Promise<ndkTest.resValue> {
    let res: ndkTest.resImageSource;
    try {
        let log: ESObject = logger(testNum);
        let imageSourceOps: ESObject = {
            density: 240
        };
        res = ndkTest.createFromData(testJpg.buffer, imageSourceOps);
        log.log("imageSourceCreateFromData res " + JSON.stringify(res));
        checkNdkRes(res);
        expect(res.result != undefined).assertTrue();
        return res;
    } catch (error) {
        let log: ESObject = logger(testNum);
        log.log("Test exception1 " + error);
        expect().assertFail();
        done();
    }
    return res!;
}

async function imageSourceCreateFromRawFileTest(done :Function, testNum: string) {
    try {
        let imageSourceOps: ESObject = {
            density: 240
        };
        uiContext.resourceManager.getRawFd("test/rawfile.png").then(rawfile => {
            let res: ndkTest.resImageSource = ndkTest.createFromRawFile(rawfile, imageSourceOps);
            checkNdkRes(res);
            expect(res.result != undefined).assertTrue();
            done();})
    } catch (error) {
        let log: ESObject = logger(testNum);
        log.log("Test exception1 " + error);
        expect().assertFail();
        done();
    }
}

async function createPixelMap(done :Function, testNum: string, picName: string) {
    try {
        let res: ndkTest.resImageSource = await imageSourceCreateTest(done, testNum, picName, "fd");
        let imageSize: ESObject = {
            width: 0,
            height: 0
        }
        let imageRegion: ESObject = {
            x: 0,
            y: 0,
            width: 0,
            height: 0
        }
        let decodingOps: ESObject = {
            editable: true,
            fitDensity: 220,
            pixelFormat: 0,
            index: 0,
            sampleSize: 0,
            rotate: 0,
            size: imageSize,
            region: imageRegion
        };
        let pixelMapRes: ndkTest.resPixelMap = ndkTest.createPixelMap(res.result, decodingOps);
        checkNdkRes(pixelMapRes);
        expect(pixelMapRes.result != undefined).assertTrue();
        console.info("pixelMapRes.result != undefined");
        done();
    } catch (error) {
        console.info('pixelMapRes.result == undefined');
        console.error("Test exception " + error);
        expect().assertFail();
        done();
    }
}

async function release(done :Function, testNum: string, pictureName: string) {
    try {
        let log: ESObject = logger(testNum);
        let res: ndkTest.resImageSource = await imageSourceCreateTest(done, testNum, pictureName, "fd");
        let releaseRes: ndkTest.resValue = ndkTest.release(res.result);
        checkNdkRes(releaseRes);
        log.log("release result " + releaseRes.code);
        done();
    } catch (error) {
        console.error("Test exception " + error);
        expect().assertFail();
        done();
    }
}

async function getImageProperty(done :Function, testNum: string, key: string, checkProps: ESObject) {
    try {
        let log: ESObject = logger(testNum);
        let res: ndkTest.resImageSource = await imageSourceCreateTest(done, testNum, "test_exif.jpg", "fd");
        let imagePropertyRes: ndkTest.resImageProperty = ndkTest.getImageProperty(res.result, key);
        expect(imagePropertyRes != undefined).assertTrue();
        expect(imagePropertyRes.code == CODE_SUCCESS).assertTrue();
        log.log("Image property " + imagePropertyRes.result);
        checkProps(imagePropertyRes.result);
        done();
    } catch (error) {
        console.error("Test exception " + error);
        expect().assertFail();
        done();
    }
}

async function modify(done :Function, testNum: string, prop: ESObject, checkProps: ESObject) {
    try {
        let log: ESObject = logger(testNum);
        let res: ndkTest.resImageSource = await imageSourceCreateTest(done, testNum, "test_exif.jpg", "fd");
        let propertyModifyRes: ndkTest.resValue = ndkTest.modifyImageProperty(res.result, prop.key, prop.value);
        checkNdkRes(propertyModifyRes);
        log.log("Image property modify " + propertyModifyRes.code);
        let imagePropertyRes: ndkTest.resImageProperty = ndkTest.getImageProperty(res.result, prop.key);
        expect(imagePropertyRes != undefined).assertTrue();
        expect(imagePropertyRes.code == CODE_SUCCESS).assertTrue();
        log.log("Image property " + imagePropertyRes.result);
        checkProps(imagePropertyRes.result);
        done();
    } catch (error) {
        console.error("Test exception " + error);
        expect().assertFail();
        done();
    }
}

async function modifyErr(done :Function, testNum: string, key: string, value: string) {
    try {
        let log: ESObject = logger(testNum);
        let res: ndkTest.resImageSource = await imageSourceCreateTest(done, testNum, "test_exif.jpg", "fd");
        let propertyModifyRes: ndkTest.resValue = ndkTest.modifyImageProperty(res.result, key, value);
        log.log("res " + JSON.stringify(propertyModifyRes));
        expect(propertyModifyRes.code == CODE_ERROR).assertTrue();
        done();
    } catch (error) {
        console.error("Test exception " + error);
        expect().assertFail();
        done();
    }
}

async function getImagePropertyErr(done :Function, testNum: string, key: string) {
    try {
        let log: ESObject = logger(testNum);
        let res: ndkTest.resImageSource = await imageSourceCreateTest(done, testNum, "test_exif.jpg", "fd");
        let imagePropertyRes: ndkTest.resImageProperty = ndkTest.getImageProperty(res.result, key);
        log.log("res " + JSON.stringify(imagePropertyRes));
        expect(imagePropertyRes.code == CODE_ERROR).assertTrue();
        done();
    } catch (error) {
        console.error("Test exception " + error);
        expect().assertFail();
        done();
    }
}

function createImageSourceErr(done :Function, testNum: string, source: string) {
    try {
        let log: ESObject = logger(testNum);
        let imageSourceOps: ESObject = {
            density: 240
        };
        let res: ndkTest.resImageSource = ndkTest.create(source, imageSourceOps);
        log.log("res " + JSON.stringify(res));
        expect(res.code == CODE_ERROR).assertTrue();
        done();
    } catch (error) {
        console.error("Test exception " + error);
        expect().assertFail();
        done();
    }
}

async function testGetPixelMapForColorSpace(done: Function, testNum: string, picName: string,
    colorSpaceName: colorSpaceManager.ColorSpace, checkProps: Function, desiredDynamicRange: image.DecodingDynamicRange) {
    let log: ESObject = logger(testNum);
    log.log(`Starting test: ${testNum}`);

    let fdResult = await getFd(picName);
    let fd: number = fdResult[1] as number;
    let imageSource: image.ImageSource = mdkTest.createImageSource(fd);
    globalImagesource = imageSource;
    let opts: image.DecodingOptions = mdkTest.createDecodingOptions();
    if (opts == undefined) {
        log.log('Failed to create DecodingOptions.');
        expect(false).assertTrue();
        done();
    }
    globalDecoingOption = opts;
    mdkTest.SetDesiredDynamicRangeToDecodingOptions(opts, desiredDynamicRange);

    let errorCode: number = mdkTest.setDecodingOptColorSpace(opts, colorSpaceName);
    if (errorCode == CODE_ERROR) {
        log.log("Failed to unsupported color space. errorCode : " + errorCode);
        expect(errorCode == CODE_ERROR).assertTrue();
        done();
    }
    let decodingColorSpace: number = mdkTest.getDecodingOptColorSpace(opts);
    if (decodingColorSpace == undefined) {
        log.log("DecodingOptions color space verification failed.");
        expect(false).assertTrue();
        done();
    }
    log.log(`DecodingOptions color space verified: ${decodingColorSpace}`);
    expect(decodingColorSpace == colorSpaceName).assertTrue();

    let pixelMap: image.PixelMap = mdkTest.createPixelmap(fd, opts);
    if (pixelMap == undefined) {
        log.log('Failed to create PixelMap.');
        expect(false).assertTrue();
        done();
    }
    globalPixelMap = pixelMap;
    let pixelMapColorSpace: number = mdkTest.getPixelMapForColorSpace(pixelMap);
    if (pixelMapColorSpace == undefined) {
        log.log('Failed to get PixelMap color space.');
        expect(false).assertTrue();
        done();
    }
    log.log(`PixelMap color space verified: ${pixelMapColorSpace}`);
    checkProps(pixelMapColorSpace);
    done();
}

function testCreatePackOptions (format: string, quality: number, needsPackProperties: boolean) {
    let packOpt: image.PackingOption = mdkTest.CreatePackingOptions();
    mdkTest.SetMimeTypeToTestPackingOptions(packOpt, format);
    mdkTest.SetQualityToTestPackingOptions(packOpt, quality);
    mdkTest.SetNeedsPackPropertiesToTestPackingOptions(packOpt, needsPackProperties);
    return packOpt;
}

async function checkMakerNoteInfo(done: Function, testNum: string, imageSource: image.ImageSource, prop: RecordKeyValue) {
    let log: ESObject = logger(testNum);
    try {
    let makerNote: string | number = mdkTest.GetMakerNoteImageProperty(imageSource, prop.key);
    if (makerNote != undefined && typeof(makerNote) != "number") {
        if (prop.value == "HW") {
            expect(makerNote == "HwMnoteCaptureMode:0").assertTrue();
        } else {
            expect(makerNote == prop.value).assertTrue();
        }
        log.log("get imageSource MaterNote: " + makerNote);
    }
    log.log("checkMakerNoteInfo successfully");
    } catch (error) {
        log.log("getImageProperty error: " + error);
        expect(false).assertTrue();
        done();
    }
}

async function imagePackerPackToFile(done: Function, testNum: string, fd: number, packOpts: image.PackingOption,
    writeFd: number) {
    let log: ESObject = logger(testNum);
    try {
        let opts: image.DecodingOptions = mdkTest.createDecodingOptions();
        if (opts == undefined) {
            log.log('Failed to create DecodingOptions.');
            expect(false).assertTrue();
            done();
        }
        let pixelMap: image.PixelMap = mdkTest.createPixelmap(fd, opts);
        if (pixelMap == undefined) {
            log.log('Failed to create PixelMap.');
            expect(false).assertTrue();
            done();
        }
        let errorCode: number = mdkTest.testPackPixelMapToFile(pixelMap, packOpts, writeFd);
        expect(errorCode == CODE_SUCCESS).assertTrue();
        log.log("ImagePacker PackToFile success.");
        mdkTest.releaseDecodingOptions(opts);
        mdkTest.releasePixelMap(pixelMap);
    } catch (error) {
        log.log("testPackPixelMapToFile error: " + error);
        expect(false).assertFail();
        done();
    }
}

async function testModifyMakerNoteImageProperty(done :Function, testNum: string, picName: string,
    prop: RecordKeyValue, isEncoding: boolean, packOpts?: image.PackingOption, writeFd?: number) {
        let log: ESObject = logger(testNum);
    try {
        let fd: number = getFdFilesDir(picName);
        let imageSource: image.ImageSource = mdkTest.createImageSource(fd);
        if (imageSource == undefined) {
            log.log('create image source failed.');
            expect(false).assertTrue();
            done();
        }
        let errCode: number = mdkTest.ModifyMakerNoteImageProperty(imageSource, prop.key, prop.value);
        if (errCode != CODE_SUCCESS) {
            log.log('Failed to modify image property.');
            expect(false).assertTrue();
            done();
        }
        if (isEncoding && writeFd != undefined && packOpts != undefined) {
            await imagePackerPackToFile(done, testNum, fd, packOpts, writeFd);
            let imageSourceApi: image.ImageSource = mdkTest.createImageSource(writeFd);
            await checkMakerNoteInfo(done, testNum, imageSourceApi, prop);
            if (imageSourceApi != undefined) {
                mdkTest.releaseImageSource(imageSourceApi);
                log.log("releaseImageSource successfully");
            }
        } else {
            await checkMakerNoteInfo(done, testNum, imageSource, prop);
        }
        [fd, writeFd].forEach((descriptor) => {
            if (descriptor != undefined) {
                fileio.closeSync(descriptor);
            }
        });
        if (imageSource != undefined) {
            mdkTest.releaseImageSource(imageSource);
            log.log("releaseImageSource successfully");
        }
        done();
    } catch (error) {
        log.log("testModifyMakerNoteImageProperty error: " + error);
        expect(false).assertTrue();
        done();
    }
}

async function testModifyMakerNoteImagePropertyErr(done :Function, testNum: string, picName: string, prop: RecordKeyValue) {
    let log: ESObject = logger(testNum);
    try {
        let fd: number = getFdFilesDir(picName);
        let imageSource: image.ImageSource = mdkTest.createImageSource(fd);
        if (imageSource == undefined) {
            log.log('create image source failed.');
            expect(false).assertTrue();
            done();
        }
        let errCode: number = mdkTest.ModifyMakerNoteImageProperty(imageSource, prop.key, prop.value);
        if (errCode == ERROR_CODE) {
            log.log('ModifyMakerNoteImageProperty promise: ' + errCode);
            expect(errCode == ERROR_CODE).assertTrue();
        } else {
            log.log('ModifyMakerNoteImageProperty error: ' + errCode);
            expect(false).assertTrue();
        }
        if (fd != undefined) {
            fs.closeSync(fd);
        }
        if (imageSource != undefined) {
            mdkTest.releaseImageSource(imageSource);
            log.log("releaseImageSource successfully");
        }
        done();
    } catch (error) {
        log.log("testModifyMakerNoteImageProperty error: " + error);
        expect(false).assertTrue();
        done();
    }
}

async function testGetMakerNoteImagePropertyErr(done :Function, testNum: string, picName: string) {
    let log: ESObject = logger(testNum);
    try {
        let fd: number = getFdFilesDir(picName);
        let imageSource: image.ImageSource = mdkTest.createImageSource(fd);
        if (imageSource == undefined) {
            log.log('create image source failed.');
            expect(false).assertTrue();
            done();
        }
        let makerNote: string | number = mdkTest.GetMakerNoteImageProperty(imageSource, image.PropertyKey.MAKER_NOTE);
        if (makerNote != undefined && typeof(makerNote) == "number") {
            log.log('GetMakerNoteImageProperty promise: ' + makerNote);
            expect(makerNote == ERROR_CODE).assertTrue();
            done();
        } else {
            log.log('GetMakerNoteImageProperty promise: ' + makerNote);
            expect(false).assertTrue();
        }
        if (fd != undefined) {
            fs.closeSync(fd);
        }
        if (imageSource != undefined) {
            mdkTest.releaseImageSource(imageSource);
            log.log("releaseImageSource successfully");
        }
        done();
    } catch (error) {
        log.log("testGetMakerNoteImagePropertyErr error: " + error);
        expect(false).assertTrue();
        done();
    }
}

export default function ImageSourceNDKTest() {
    describe('ImageSourceNDKTest', () => {
        beforeAll(async () => {
            uiContext = globalThis.uiContext;
            isSupportHEIFDecode =
                image.createImageSource(uiContext.filesDir + '/' + "test.jpg").supportedFormats.includes("image/heic");
            isSupportHdr = !display.getDefaultDisplaySync().hdrFormats.includes(hdrCapability.HDRFormat.NONE) &&
                display.getDefaultDisplaySync().hdrFormats.length != 0;
            isSupportHEICEncode = image.createImagePacker().supportedFormats.includes("image/heic");
            console.info('beforeAll case');
        });
        beforeEach(() => {
            console.info('beforeEach case');
        });
        afterEach(() => {
            if (globalImagesource != undefined) {
                console.info("globalImagesource release start");
                try {
                    mdkTest.releaseImageSource(globalImagesource);
                    globalImagesource = undefined;
                } catch (error) {
                  console.info("globalImagesource release fail");
                }
            }
            if (globalDecoingOption != undefined) {
                console.info("globalDecoingOption release start");
                try {
                    mdkTest.releaseDecodingOptions(globalDecoingOption);
                    globalDecoingOption = undefined;
                } catch (error) {
                  console.info("globalDecoingOption release fail");
                }
            }
            if (globalPixelMap != undefined) {
              console.info("globalPixelMap release start");
              try {
                  mdkTest.releasePixelMap(globalPixelMap);
                  globalPixelMap = undefined;
              } catch (error) {
                console.info("globalPixelMap release fail");
              }
            }
            console.info('afterEach case');
        });
        afterAll(() => {
            console.info('afterAll case');
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0100
         * @tc.name      : createImageSource -gif
         * @tc.desc      : 1.get fd
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0100', Level.LEVEL0, async (done :Function) => {
            await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0100", "moving_test.gif",
                "fd");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0200
         * @tc.name      : createImageSource -jpg
         * @tc.desc      : 1.get fd
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0200', Level.LEVEL0, async (done :Function) => {
            await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0200", "test.jpg", "fd");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0300
         * @tc.name      : createImageSource -bmp
         * @tc.desc      : 1.get fd
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0300', Level.LEVEL0, async (done :Function) => {
            await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0300", "test.bmp", "fd");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0400
         * @tc.name      : createImageSource -png
         * @tc.desc      : 1.get fd
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0400', Level.LEVEL0, async (done :Function) => {
            await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0400", "test.png", "fd");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0500
         * @tc.name      : createImageSource -webp
         * @tc.desc      : 1.get fd
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0500', Level.LEVEL0, async (done :Function) => {
            await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0500", "test_large.webp",
                "fd");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0600
         * @tc.name      : createImageSource -svg
         * @tc.desc      : 1.get fd
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0600', Level.LEVEL0, async (done :Function) => {
            await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0600", "test_large.svg",
                "fd");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0700
         * @tc.name      : createImageSource -dng
         * @tc.desc      : 1.get fd
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0700', Level.LEVEL0, async (done :Function) => {
            await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0700", "test_dng.dng", "fd");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0800
         * @tc.name      : createImageSource -raw
         * @tc.desc      : 1.get fd
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0800', Level.LEVEL0, async (done :Function) => {
            await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0800", "test.nrw", "fd");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0900
         * @tc.name      : createImageSource -raw
         * @tc.desc      : 1.get fd
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0900', Level.LEVEL0, async (done :Function) => {
            await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0900", "test.cr2", "fd");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_1000
         * @tc.name      : createImageSource -raw
         * @tc.desc      : 1.get fd
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_1000', Level.LEVEL0, async (done :Function) => {
            await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_1000", "test.arw", "fd");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_1100
         * @tc.name      : createImageSource -raw
         * @tc.desc      : 1.get fd
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_1100', Level.LEVEL0, async (done :Function) => {
            await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_1100", "test.pef", "fd");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_1200
         * @tc.name      : createImageSource -raw
         * @tc.desc      : 1.get fd
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_1200', Level.LEVEL0, async (done :Function) => {
            await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_1200", "test.raf", "fd");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_1300
         * @tc.name      : createImageSource -raw
         * @tc.desc      : 1.get fd
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_1300', Level.LEVEL0, async (done :Function) => {
            await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_1300", "test.rw2", "fd");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_FROM_FD_0100
         * @tc.name      : createImageSourceFromFd -jpg
         * @tc.desc      : 1.get fd
         *                 2.createImageSourceFromFd
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_FROM_FD_0100', Level.LEVEL0, async (done :Function) => {
            await imageSourceCreateFromFdTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_FROM_FD_0100", "test.jpg");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_BUFFER
         * @tc.name      : createImageSource -buffer
         * @tc.desc      : 1.get image buffer
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_BUFFER', Level.LEVEL0, async (done :Function) => {
            await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_BUFFER", "test.jpg", "buffer");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_FROM_DATA
         * @tc.name      : createImageSourceFromData
         * @tc.desc      : 1.get image buffer
         *                 2.createImageSourceFromData
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_FROM_DATA', Level.LEVEL0, async (done :Function) => {
            await imageSourceCreateFromDataTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_FROM_DATA");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_PATH
         * @tc.name      : createImageSource -path
         * @tc.desc      : 1.get image path
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_PATH', Level.LEVEL0, async (done :Function) => {
            await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_PATH", "moving_test.gif",
                "path");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_FROM_URI
         * @tc.name      : createImageSourceFromUri
         * @tc.desc      : 1.get image path
         *                 2.createImageSourceFromUri
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_FROM_URI', Level.LEVEL0, async (done :Function) => {
            await imageSourceCreateFromUriTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_FROM_URI",
                "moving_test.gif");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_FROM_RAWFILE
         * @tc.name      : createImageSourceFromRawFile
         * @tc.desc      : 1.get image rawfiledescriptor
         *                 2.createImageSourceFromRawFile
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_FROM_RAWFILE', Level.LEVEL0, async (done :Function) => {
            await imageSourceCreateFromRawFileTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_FROM_RAWFILE");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_INCREMENTAL
         * @tc.name      : createIncremental
         * @tc.desc      : 1.set imageSourceOps
         *                 2.createIncremental
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_INCREMENTAL', Level.LEVEL0, async (done :Function) => {
            try {
                let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_INCREMENTAL");
                let imageSourceOps: ESObject = {
                    density: 240
                };
                let res: ndkTest.resImageSource = ndkTest.createIncremental(new ArrayBuffer(1), imageSourceOps);
                log.log("res " + JSON.stringify(res));
                checkNdkRes(res);
                expect(res.result != undefined).assertTrue();
                done();
            } catch (error) {
                console.error("Test exception " + JSON.stringify(error));
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_INCREMENTAL_FROM_DATA
         * @tc.name      : createIncremental
         * @tc.desc      : 1.set imageSourceOps
         *                 2.createIncremental
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_INCREMENTAL_FROM_DATA', Level.LEVEL0, async (done :Function) => {
            try {
                let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_INCREMENTAL_FROM_DATA");
                let imageSourceOps: ESObject = {
                    density: 240
                };
                let res: ndkTest.resImageSource = ndkTest.createIncrementalFromData(new ArrayBuffer(1), imageSourceOps);
                log.log("res " + JSON.stringify(res));
                checkNdkRes(res);
                expect(res.result != undefined).assertTrue();
                done();
            } catch (error) {
                console.error("Test exception " + JSON.stringify(error));
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_INITNATIVE
         * @tc.name      : initNative
         * @tc.desc      : 1.create imageSource
         *                 2.initNative
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_INITNATIVE', Level.LEVEL0, async (done :Function) => {
            try {
                let res: ndkTest.resImageSource = await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_INITNATIVE", "moving_test.gif", "fd");
                let initRes: ndkTest.resValue = ndkTest.initNative(res.result);
                checkNdkRes(initRes);
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_GIF_0100
         * @tc.name      : createPixelMap -gif
         * @tc.desc      : 1.create imageSource
         *                 2.createPixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_GIF_0100', Level.LEVEL0, async (done :Function) => {
            await createPixelMap(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_GIF_0100", "moving_test.gif");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_BMP_0200
         * @tc.name      : createPixelMap -bmp
         * @tc.desc      : 1.create imageSource
         *                 2.createPixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_BMP_0200', Level.LEVEL0, async (done :Function) => {
            await createPixelMap(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_BMP_0200", "test.bmp");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_JPG_0300
         * @tc.name      : createPixelMap -jpg
         * @tc.desc      : 1.create imageSource
         *                 2.createPixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_JPG_0300', Level.LEVEL0, async (done :Function) => {
            await createPixelMap(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_JPG_0300", "test.jpg");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_WEBP_0400
         * @tc.name      : createPixelMap -webp
         * @tc.desc      : 1.create imageSource
         *                 2.createPixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_WEBP_0400', Level.LEVEL0, async (done :Function) => {
            await createPixelMap(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_WEBP_0400", "test_large.webp");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_PNG_0500
         * @tc.name      : createPixelMap -png
         * @tc.desc      : 1.create imageSource
         *                 2.createPixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_PNG_0500', Level.LEVEL0, async (done :Function) => {
            await createPixelMap(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_PNG_0500", "test.png");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_SVG_0600
         * @tc.name      : createPixelMap -svg
         * @tc.desc      : 1.create imageSource
         *                 2.createPixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_SVG_0600', Level.LEVEL0, async (done :Function) => {
            await createPixelMap(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_SVG_0600", "test_large.svg");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_0700
         * @tc.name      : createPixelMap -raw
         * @tc.desc      : 1.create imageSource
         *                 2.createPixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_0700', Level.LEVEL0, async (done :Function) => {
            await createPixelMap(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_0700", "test_dng.dng");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_0800
         * @tc.name      : createPixelMap -raw
         * @tc.desc      : 1.create imageSource
         *                 2.createPixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_0800', Level.LEVEL0, async (done :Function) => {
            await createPixelMap(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_0800", "test.nrw");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_0900
         * @tc.name      : createPixelMap -raw
         * @tc.desc      : 1.create imageSource
         *                 2.createPixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_0900', Level.LEVEL0, async (done :Function) => {
            await createPixelMap(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_0900", "test.cr2");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_1000
         * @tc.name      : createPixelMap -raw
         * @tc.desc      : 1.create imageSource
         *                 2.createPixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_1000', Level.LEVEL0, async (done :Function) => {
            await createPixelMap(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_1000", "test.arw");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_1100
         * @tc.name      : createPixelMap -raw
         * @tc.desc      : 1.create imageSource
         *                 2.createPixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_1100', Level.LEVEL0, async (done :Function) => {
            await createPixelMap(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_1100", "test.pef");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_1200
         * @tc.name      : createPixelMap -raw
         * @tc.desc      : 1.create imageSource
         *                 2.createPixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_1200', Level.LEVEL0, async (done :Function) => {
            await createPixelMap(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_1200", "test.raf");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_1300
         * @tc.name      : createPixelMap -raw
         * @tc.desc      : 1.create imageSource
         *                 2.createPixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_1300', Level.LEVEL0, async (done: Function) => {
            await createPixelMap(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_1300", "test.rw2");
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_PIXEL_MAP_LIST
         * @tc.name      : createPixelMapList
         * @tc.desc      : 1.create imageSource
         *                 2.createPixelMapList
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_PIXEL_MAP_LIST', Level.LEVEL0, async (done :Function) => {
            try {
                let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_PIXEL_MAP_LIST");
                let res: ndkTest.resImageSource = await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_PIXEL_MAP_LIST",
                    "moving_test.gif", "fd");
                let decodingOps: ESObject = {
                    fitDensity: 240,
                    sampleSize: 0
                };
                let pixelMapListRes: ndkTest.resPixelMapList = ndkTest.createPixelMapList(res.result, decodingOps);
                checkNdkRes(pixelMapListRes);
                console.info('checkNdkRes(pixelMapListRes)');
                expect(pixelMapListRes.result != undefined).assertTrue();
                console.info('pixelMapListRes.result != undefined');
                expect(Array.isArray(pixelMapListRes.result)).assertTrue();
                console.info('isArray(pixelMapListRes.result)');
                log.log("Pixelmap list size " + pixelMapListRes.result.length);
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_DELAY_TIME
         * @tc.name      : getDelayTime
         * @tc.desc      : 1.create imageSource
         *                 2.getDelayTime
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_DELAY_TIME', Level.LEVEL0, async (done :Function) => {
            try {
                let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_DELAY_TIME");
                let res: ndkTest.resImageSource = await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_DELAY_TIME",
                    "moving_test.gif", "fd");
                let delayTimeListRes: ndkTest.resDelayTimeList = ndkTest.getDelayTime(res.result);
                checkNdkRes(delayTimeListRes);
                expect(delayTimeListRes.result != undefined).assertTrue();
                console.info('delayTimeListRes.result != undefined');
                expect(Array.isArray(delayTimeListRes.result)).assertTrue();
                console.info('isArray(delayTimeListRes.result)');
                log.log("Delay time list size " + delayTimeListRes.result.length);
                delayTimeListRes.result.forEach((element: number) => {
                    log.log("Delay time " + element);
                });
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_FRAME_COUNT
         * @tc.name      : getFrameCount
         * @tc.desc      : 1.create imageSource
         *                 2.getFrameCount
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_FRAME_COUNT', Level.LEVEL0, async (done :Function) => {
            try {
                let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_FRAME_COUNT");
                let res: ndkTest.resImageSource = await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_FRAME_COUNT",
                    "moving_test.gif", "fd");
                let frameCountRes: ndkTest.resFrameCount = ndkTest.getFrameCount(res.result);
                checkNdkRes(frameCountRes);
                expect(frameCountRes.result != undefined).assertTrue();
                expect(frameCountRes.result != 0).assertTrue();
                log.log("Frame count " + frameCountRes.result);
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_SUPPORTED_FORMATS
         * @tc.name      : getSupportedFormats
         * @tc.desc      : 1.getSupportedFormats
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_SUPPORTED_FORMATS', Level.LEVEL0, async (done :Function) => {
            try {
                let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_SUPPORTED_FORMATS");
                let supportedFormatListRes: ndkTest.resSupportedFormatList = ndkTest.getSupportedFormats();
                checkNdkRes(supportedFormatListRes);
                expect(supportedFormatListRes.result != undefined).assertTrue();
                expect(Array.isArray(supportedFormatListRes.result)).assertTrue();
                log.log("Supported format list size " + supportedFormatListRes.result.length);
                supportedFormatListRes.result.forEach((element: string) => {
                    log.log("Supported format " + element);
                });
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_INFO
         * @tc.name      : getImageInfo
         * @tc.desc      : 1.create imageSource
         *               : 2.getImageInfo
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_INFO', Level.LEVEL0, async (done :Function) => {
            try {
                let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_INFO");
                let res: ndkTest.resImageSource = await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_INFO",
                    "moving_test.gif", "fd");
                let index = 0;
                let imageInfoRes: ndkTest.resImageInfo = ndkTest.getImageInfo(res.result, index);
                checkNdkRes(imageInfoRes);
                log.log("Image Info " + JSON.stringify(imageInfoRes.result));
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0100
         * @tc.name      : release -gif
         * @tc.desc      : 1.create imageSource
         *               : 2.release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0100', Level.LEVEL0, async (done :Function) => {
            release(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0100", "moving_test.gif");
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0200
         * @tc.name      : release -bmp
         * @tc.desc      : 1.create imageSource
         *               : 2.release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0200', Level.LEVEL0, async (done: Function) => {
            release(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0200", "test.bmp");
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0300
         * @tc.name      : release -png
         * @tc.desc      : 1.create imageSource
         *               : 2.release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0300', Level.LEVEL0, async (done :Function) => {
            release(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0300", "test.png");
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0400
         * @tc.name      : release -jpg
         * @tc.desc      : 1.create imageSource
         *               : 2.release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0400', Level.LEVEL0, async (done :Function) => {
            release(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0400", "test.jpg");
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0500
         * @tc.name      : release -webp
         * @tc.desc      : 1.create imageSource
         *               : 2.release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0500', Level.LEVEL0, async (done :Function) => {
            release(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0500", "test_large.webp");
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0600
         * @tc.name      : release -svg
         * @tc.desc      : 1.create imageSource
         *               : 2.release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0600', Level.LEVEL0, async (done :Function) => {
            release(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0600", "test_large.svg");
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0700
         * @tc.name      : release -raw
         * @tc.desc      : 1.create imageSource
         *               : 2.release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0700', Level.LEVEL0, async (done :Function) => {
            release(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0700", "test_dng.dng");
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0800
         * @tc.name      : release -raw
         * @tc.desc      : 1.create imageSource
         *               : 2.release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0800', Level.LEVEL0, async (done :Function) => {
            release(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0800", "test.nrw");
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0900
         * @tc.name      : release -raw
         * @tc.desc      : 1.create imageSource
         *               : 2.release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0900', Level.LEVEL0, async (done :Function) => {
            release(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0900", "test.cr2");
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_1000
         * @tc.name      : release -raw
         * @tc.desc      : 1.create imageSource
         *               : 2.release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_1000', Level.LEVEL0, async (done :Function) => {
            release(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_1000", "test.arw");
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_1100
         * @tc.name      : release -raw
         * @tc.desc      : 1.create imageSource
         *               : 2.release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_1100', Level.LEVEL0, async (done :Function) => {
            release(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_1100", "test.pef");
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_1200
         * @tc.name      : release -raw
         * @tc.desc      : 1.create imageSource
         *               : 2.release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_1200', Level.LEVEL0, async (done :Function) => {
            release(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_1200", "test.raf");
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_1300
         * @tc.name      : release -raw
         * @tc.desc      : 1.create imageSource
         *               : 2.release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_1300', Level.LEVEL0, async (done :Function) => {
            release(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_1300", "test.rw2");
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_UPDATE_DATA
         * @tc.name      : updateData
         * @tc.desc      : 1.createIncremental
         *               : 2.updateData
         *               : 3.createPixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_UPDATE_DATA', Level.LEVEL0, async (done :Function) => {
            try {
                let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_SOURCENDK_UPDATE_DATA");
                let imageSourceOps: ESObject = {
                    density: 240
                };
                let res: ndkTest.resImageSource = ndkTest.createIncremental(new ArrayBuffer(1), imageSourceOps);
                if (res.result == undefined) {
                    done();
                    return;
                }
                let updateOps: ESObject = {
                    buffer: testJpg.buffer,
                    offset: 0,
                    updateLength: testJpg.buffer.byteLength,
                    isCompleted: true
                };
                let updateRes: ndkTest.resValue = ndkTest.updateData(res.result, updateOps);
                checkNdkRes(updateRes);
                log.log("Image update Data " + updateRes.code);
                let decodingOps: ESObject = {
                    editable: true,
                    fitDensity: 220
                };
                let pixelMapRes: ndkTest.resPixelMap = ndkTest.createPixelMap(res.result, decodingOps);
                checkNdkRes(pixelMapRes);
                expect(pixelMapRes.result != undefined).assertTrue();
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0100
         * @tc.name      : getImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0100', Level.LEVEL0, async (done :Function) => {

            let checkProps = (result: string) => {
                expect(result == "8, 8, 8").assertTrue();
            }

            getImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0100", image.PropertyKey.BITS_PER_SAMPLE,
                checkProps);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0200
         * @tc.name      : getImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0200', Level.LEVEL0, async (done :Function) => {

            let checkProps = (result: string) => {
                expect(result == "Top-right").assertTrue();
            }

            getImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0200", image.PropertyKey.ORIENTATION, checkProps);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0300
         * @tc.name      : getImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0300', Level.LEVEL0, async (done :Function) => {

            let checkProps = (result: string) => {
                expect(result == "4608").assertTrue();
            }

            getImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0300", image.PropertyKey.IMAGE_LENGTH, checkProps);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0400
         * @tc.name      : getImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0400', Level.LEVEL0, async (done :Function) => {

            let checkProps = (result: string) => {
                expect(result == "3456").assertTrue();
            }

            getImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0400", image.PropertyKey.IMAGE_WIDTH, checkProps);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0500
         * @tc.name      : getImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0500', Level.LEVEL0, async (done :Function) => {

            let checkProps = (result: string) => {
                expect(result.search("38") != -1).assertTrue();
            }

            getImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0500", image.PropertyKey.GPS_LATITUDE, checkProps);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0600
         * @tc.name      : getImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0600', Level.LEVEL0, async (done :Function) => {

            let checkProps = (result: string) => {
                expect(result.search("9") != -1).assertTrue();
            }

            getImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0600", image.PropertyKey.GPS_LONGITUDE, checkProps);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0700
         * @tc.name      : getImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0700', Level.LEVEL0, async (done :Function) => {

            let checkProps = (result: string) => {
                expect(result == "N").assertTrue();
            }

            getImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0700", image.PropertyKey.GPS_LATITUDE_REF,
                checkProps);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0800
         * @tc.name      : getImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0800', Level.LEVEL0, async (done :Function) => {

            let checkProps = (result: string) => {
                expect(result == "W").assertTrue();
            }

            getImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0800", image.PropertyKey.GPS_LONGITUDE_REF,
                checkProps);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0900
         * @tc.name      : getImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0900', Level.LEVEL0, async (done :Function) => {

            let checkProps = (result: string) => {
                expect(result == "2022:06:02 15:51:35").assertTrue();
            }

            getImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0900", image.PropertyKey.DATE_TIME_ORIGINAL,
                checkProps);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0100
         * @tc.name      : modifyImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.modifyImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0100', Level.LEVEL0, async (done :Function) => {
            let prop: ESObject = {
                key: image.PropertyKey.ORIENTATION,
                value: "4"
            };

            let checkProps = (result: string) => {
                expect(result == "Bottom-left").assertTrue();
            }

            modify(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0100", prop, checkProps);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0200
         * @tc.name      : modifyImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.modifyImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0200', Level.LEVEL0, async (done :Function) => {
            let prop: ESObject = {
                key: image.PropertyKey.BITS_PER_SAMPLE, value: "4, 4, 4"
            };

            let checkProps = (result: string) => {
                expect(result == "4, 4, 4").assertTrue();
            }

            modify(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0200", prop, checkProps);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0300
         * @tc.name      : modifyImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.modifyImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0300', Level.LEVEL0, async (done :Function) => {
            let prop:ESObject = {
                key: image.PropertyKey.GPS_LATITUDE, value: "114,57"
            };

            let checkProps = (result: string) => {
                expect(result.search("2") != -1).assertTrue();
            }

            modify(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0300", prop, checkProps);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0400
         * @tc.name      : modifyImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.modifyImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0400', Level.LEVEL0, async (done :Function) => {
            let prop: ESObject = {
                key: image.PropertyKey.GPS_LONGITUDE, value: "116,58"
            };

            let checkProps = (result: string) => {
                expect(result.search("2") != -1).assertTrue();
            }

            modify(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0400", prop, checkProps);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0500
         * @tc.name      : modifyImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.modifyImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0500', Level.LEVEL0, async (done :Function) => {
            let prop: ESObject = {
                key: image.PropertyKey.GPS_LATITUDE_REF, value: "N"
            };

            let checkProps = (result: string) => {
                expect(result == "N").assertTrue();
            }

            modify(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0500", prop, checkProps);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0600
         * @tc.name      : modifyImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.modifyImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0600', Level.LEVEL0, async (done :Function) => {
            let prop: ESObject = {
                key: image.PropertyKey.GPS_LONGITUDE_REF, value: "W"
            };

            let checkProps = (result: string) => {
                expect(result == "W").assertTrue();
            }

            modify(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0600", prop, checkProps);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0700
         * @tc.name      : modifyImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.modifyImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0700', Level.LEVEL0, async (done :Function) => {
            let prop:ESObject = {
                key: image.PropertyKey.IMAGE_WIDTH, value: "500"
            };

            let checkProps = (result: string) => {
                expect(result == "500").assertTrue();
            }

            modify(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0700", prop, checkProps);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0800
         * @tc.name      : modifyImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.modifyImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0800', Level.LEVEL0, async (done :Function) => {
            let prop: ESObject = {
                key: image.PropertyKey.IMAGE_LENGTH, value: "800"
            };

            let checkProps = (result: string) => {
                expect(result == "800").assertTrue();
            }

            modify(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0800", prop, checkProps);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_ERR_0100
         * @tc.name      : modifyImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.modifyImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_ERR_0100', Level.LEVEL0, async (done :Function) => {
            await modifyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_ERR_0100", "null", "100");
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_ERR_0200
         * @tc.name      : modifyImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.modifyImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_ERR_0200', Level.LEVEL0, async (done :Function) => {
            await modifyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_ERR_0200", " GPSLongitudeRef",
                "12345");
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_ERR_0300
         * @tc.name      : modifyImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.modifyImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_ERR_0300', Level.LEVEL0, async (done :Function) => {
            await modifyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_ERR_0300", "GPSLatitude",
                "{a:3}");
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_ERR_0400
         * @tc.name      : modifyImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.modifyImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_ERR_0400', Level.LEVEL0, async (done :Function) => {
            await modifyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_ERR_0400", "1000",
                "ImageLength");
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_ERR_0100
         * @tc.name      : getImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_ERR_0100', Level.LEVEL0, async (done :Function) => {
            getImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_ERR_0100", "aa");
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_ERR_0200
         * @tc.name      : getImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_ERR_0200', Level.LEVEL0, async (done :Function) => {
            getImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_ERR_0200", "12");
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_ERR_0300
         * @tc.name      : getImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_ERR_0300', Level.LEVEL0, async (done :Function) => {
            getImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_ERR_0300", "true");
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_ERR_0400
         * @tc.name      : getImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_ERR_0400', Level.LEVEL0, async (done :Function) => {
            getImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_ERR_0400", "abc,123");
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_ERR_0100
         * @tc.name      : createImageSource fd<0
         * @tc.desc      : 1.get fd
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_ERR_0100', Level.LEVEL0, async (done :Function) => {
            createImageSourceErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_ERR_0100", '-1');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_ERR_0200
         * @tc.name      : createImageSource -wrong uri
         * @tc.desc      : 1.get path
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_ERR_0200', Level.LEVEL0, async (done :Function) => {
            createImageSourceErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_ERR_0200", "file:///multimedia/test.jpg");
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_ERR_0300
         * @tc.name      : createImageSource -fd string
         * @tc.desc      : 1.get fd
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_ERR_0300', Level.LEVEL0, async (done :Function) => {
            createImageSourceErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_ERR_0300", "fd");
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0100
         * @tc.name      : test OH_ImageSourceNative_GetImageProperty obtains the loop count 5 of gif
         * @tc.desc      : 1. get file description
         *                 2. get loop count
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0100', Level.LEVEL0, async (done :Function) => {
            let mlg:ESObject = logger("SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0100");
            mlg.log('SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0100 start');
            let fdResult = await getFd('moving_test_loop5.gif');
            let path: string = fdResult[0] as string;
            let fd:number = fdResult[1]  as number;
            mlg.log('fd = ' + fd);
            let loopcount = mdkTest.JsGetImageProperty(fd, 'GIFLoopCount');
            if (loopcount == 5) {
                mlg.log('loopcount = ' + loopcount);
                done();
                return;
            } else {
                mlg.log('JsGetImageProperty failed');
                expect(false).assertTrue();
                done();
                return;
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0200
         * @tc.name      : test OH_ImageSourceNative_GetImageProperty obtains the loop count 1 of gif
         * @tc.desc      : 1. get file description
         *                 2. get loop count
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0200', Level.LEVEL0, async (done :Function) => {
            let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0200");
            mlg.log('SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0200 start');
            let fdResult = await getFd('moving_test_loop1.gif');
            let path: string = fdResult[0] as string;
            let fd:number = fdResult[1]  as number;
            mlg.log('fd = ' + fd);
            let loopcount = mdkTest.JsGetImageProperty(fd, 'GIFLoopCount');
            if (loopcount == 1) {
                mlg.log('loopcount = ' + loopcount);
                done();
                return;
            } else {
                mlg.log('JsGetImageProperty failed');
                expect(false).assertTrue();
                done();
                return;
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0300
         * @tc.name      : test OH_ImageSourceNative_GetImageProperty obtains the loop count infinite of gif
         * @tc.desc      : 1. get file description
         *                 2. get loop count
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0300', Level.LEVEL0, async (done :Function) => {
            let mlg:ESObject = logger("SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0300");
            mlg.log('SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0300 start');
            let fdResult = await getFd('moving_test_loop0.gif');
            let path: string = fdResult[0] as string;
            let fd:number = fdResult[1]  as number;
            mlg.log('fd = ' + fd);
            let loopcount: number = mdkTest.JsGetImageProperty(fd, 'GIFLoopCount');
            if (loopcount == 0) {
                mlg.log('loopcount = ' + loopcount);
                done();
                return;
            } else {
                mlg.log('JsGetImageProperty failed');
                expect(false).assertTrue();
                done();
                return;
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0400
         * @tc.name      : test OH_ImageSourceNative_GetImageProperty obtains the loop count error of jpg
         * @tc.desc      : 1. get file description
         *                 2. get loop count
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0400', Level.LEVEL0, async (done :Function) => {
            let mlg:ESObject = logger("SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0400");
            mlg.log('SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0400 start');
            let fdResult = await getFd('text.jpg');
            let path: string = fdResult[0] as string;
            let fd:number = fdResult[1]  as number;
            mlg.log('fd = ' + fd);
            let loopcount = mdkTest.JsGetImageProperty(fd, 'GIFLoopCount');
            if (loopcount == undefined) {
                mlg.log('loopcount = ' + loopcount);
                done();
                return;
            } else {
                mlg.log('JsGetImageProperty failed');
                expect(false).assertTrue();
                done();
                return;
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_NATIVE_MODIFYIMAGEPROPERTY_LOOPCOUNT_PROMISE_0100
         * @tc.name      : test OH_ImageSourceNative_ModifyImageProperty modify the loop count 5 of gif error
         * @tc.desc      : 1. get file description
         *                 2. modify loop count
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_NATIVE_MODIFYIMAGEPROPERTY_LOOPCOUNT_PROMISE_0100', Level.LEVEL0, async (done :Function) => {
            let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_NATIVE_MODIFYIMAGEPROPERTY_LOOPCOUNT_PROMISE_0100");
            mlg.log('SUB_MULTIMEDIA_IMAGE_NATIVE_MODIFYIMAGEPROPERTY_LOOPCOUNT_PROMISE_0100 start');
            let fdResult = await getFd('moving_test_loop5.gif');
            let path: string = fdResult[0] as string;
            let fd:number = fdResult[1]  as number;
            mlg.log('fd = ' + fd);
            let result = mdkTest.JsModifyImageProperty(fd, 'GIFLoopCount', '3');
            expect(result == undefined).assertTrue();
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_NATIVE_MODIFYIMAGEPROPERTY_LOOPCOUNT_PROMISE_0200
         * @tc.name      : test OH_ImageSourceNative_ModifyImageProperty modify the loop count 1 of gif error
         * @tc.desc      : 1. get file description
         *                 2. modify loop count
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_NATIVE_MODIFYIMAGEPROPERTY_LOOPCOUNT_PROMISE_0200', Level.LEVEL0, async (done :Function) => {
            let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_NATIVE_MODIFYIMAGEPROPERTY_LOOPCOUNT_PROMISE_0200");
            mlg.log('SUB_MULTIMEDIA_IMAGE_NATIVE_MODIFYIMAGEPROPERTY_LOOPCOUNT_PROMISE_0200 start');
            let fdResult = await getFd('moving_test_loop1.gif');
            let path: string = fdResult[0] as string;
            let fd:number = fdResult[1]  as number;
            mlg.log('fd = ' + fd);
            let result = mdkTest.JsModifyImageProperty(fd, 'GIFLoopCount', '3');
            expect(result == undefined).assertTrue();
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_NATIVE_MODIFYIMAGEPROPERTY_LOOPCOUNT_PROMISE_0300
         * @tc.name      : test OH_ImageSourceNative_ModifyImageProperty modify the loop count infinite of gif error
         * @tc.desc      : 1. get file description
         *                 2. modify loop count
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_NATIVE_MODIFYIMAGEPROPERTY_LOOPCOUNT_PROMISE_0300', Level.LEVEL0, async (done :Function) => {
            let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_NATIVE_MODIFYIMAGEPROPERTY_LOOPCOUNT_PROMISE_0300");
            mlg.log('SUB_MULTIMEDIA_IMAGE_NATIVE_MODIFYIMAGEPROPERTY_LOOPCOUNT_PROMISE_0300 start');
            let fdResult = await getFd('moving_test_loop0.gif');
            let path: string = fdResult[0] as string;
            let fd:number = fdResult[1]  as number;
            mlg.log('fd = ' + fd);
            let result = mdkTest.JsModifyImageProperty(fd, 'GIFLoopCount', '3');
            expect(result == undefined).assertTrue();
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_NATIVE_MODIFYIMAGEPROPERTY_LOOPCOUNT_PROMISE_0400
         * @tc.name      : test OH_ImageSourceNative_ModifyImageProperty modify the loop count error of jpg error
         * @tc.desc      : 1. get file description
         *                 2. modify loop count
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_NATIVE_MODIFYIMAGEPROPERTY_LOOPCOUNT_PROMISE_0400', Level.LEVEL0, async (done :Function) => {
            let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_NATIVE_MODIFYIMAGEPROPERTY_LOOPCOUNT_PROMISE_0400");
            mlg.log('SUB_MULTIMEDIA_IMAGE_NATIVE_MODIFYIMAGEPROPERTY_LOOPCOUNT_PROMISE_0400 start');
            let fdResult = await getFd('text.jpg');
            let path: string = fdResult[0] as string;
            let fd:number = fdResult[1]  as number;
            mlg.log('fd = ' + fd);
            let result = mdkTest.JsModifyImageProperty(fd, 'GIFLoopCount', '3');
            expect(result == undefined).assertTrue();
            done();
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0100
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0100
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.test.jpg
         *                 3.ColorSpace.ADOBE_RGB_1998 = 1
         *                 4.testGetPixelMapForColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0100',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0100");
            let checkProps = (result: number) => {
                expect(result == colorSpaceManager.ColorSpace.ADOBE_RGB_1998).assertTrue();
                log.log("checkProps success.");
            }
            await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0100",
                "test.jpg", colorSpaceManager.ColorSpace.ADOBE_RGB_1998, checkProps, RANGE_SDR);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0200
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0200
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.test.jpg
         *                 3.ColorSpace.DCI_P3 = 2
         *                 4.testGetPixelMapForColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0200',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0200");
            let checkProps = (result: number) => {
                expect(result == colorSpaceManager.ColorSpace.DCI_P3).assertTrue();
                log.log("checkProps success.");
            }
            await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0200",
                "test.jpg", colorSpaceManager.ColorSpace.DCI_P3, checkProps, RANGE_SDR);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0300
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0300
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.test.jpg
         *                 3.ColorSpace.DISPLAY_P3 = 3
         *                 4.testGetPixelMapForColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0300',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0300");
            let checkProps = (result: number) => {
                expect(result == colorSpaceManager.ColorSpace.DISPLAY_P3).assertTrue();
                log.log("checkProps success.");
            }
            await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0300",
                "test.jpg", colorSpaceManager.ColorSpace.DISPLAY_P3, checkProps, RANGE_SDR);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0400
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0400
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.test.jpg
         *                 3.ColorSpace.SRGB = 4
         *                 4.testGetPixelMapForColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0400',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0400");
            let checkProps = (result: number) => {
                expect(result == colorSpaceManager.ColorSpace.SRGB).assertTrue();
                log.log("checkProps success.");
            }
            await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0400",
                "test.jpg", 4, checkProps, RANGE_SDR);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0500
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0500
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.test_exif.png
         *                 3.ColorSpace.BT709 = 6
         *                 4.testGetPixelMapForColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0500',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0500");
            let checkProps = (result: number) => {
                expect(result == 6).assertTrue();
                log.log("checkProps success.");
            }
            await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0500",
                "test_exif.png", colorSpaceManager.ColorSpace.BT709, checkProps, RANGE_SDR);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0600
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0600
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.test_exif.png
         *                 3.ColorSpace.BT601_EBU = 7
         *                 4.testGetPixelMapForColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0600',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0600");
            let checkProps = (result: number) => {
                expect(result == 7).assertTrue();
                log.log("checkProps success.");
            }
            await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0600",
                "test_exif.png", colorSpaceManager.ColorSpace.BT601_EBU, checkProps, RANGE_SDR);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0700
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0700
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.test_exif.png
         *                 3.ColorSpace.BT601_SMPTE_C = 8
         *                 4.testGetPixelMapForColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0700',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0700");

            let checkProps = (result: number) => {
                expect(result == 8).assertTrue();
                log.log("checkProps success.");
            }
            await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0700",
                "test_exif.png", 8, checkProps, RANGE_SDR);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0800
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0800
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.test_dng.dng
         *                 3.ColorSpace.BT2020_HLG = 9
         *                 4.testGetPixelMapForColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0800',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0800");
            let checkProps = (result: number) => {
                expect(result == 9).assertTrue();
                log.log("checkProps success.");
            }
            await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0800",
                "test_dng.dng", colorSpaceManager.ColorSpace.BT2020_HLG, checkProps, RANGE_SDR);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0900
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0900
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.test_dng.dng
         *                 3.ColorSpace.BT2020_PQ = 10
         *                 4.testGetPixelMapForColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0900',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0900");
            let checkProps = (result: number) => {
                expect(result == colorSpaceManager.ColorSpace.BT2020_PQ).assertTrue();
                log.log("checkProps success.");
            }
            await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0900",
                "test_dng.dng", colorSpaceManager.ColorSpace.BT2020_PQ, checkProps, RANGE_SDR);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1000
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1000
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.test_dng.dng
         *                 3.ColorSpace.P3_HLG = 11
         *                 4.testGetPixelMapForColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1000',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1000");
            let checkProps = (result: number) => {
                expect(result == colorSpaceManager.ColorSpace.P3_HLG).assertTrue();
                log.log("checkProps success.");
            }
            await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1000",
                "test_dng.dng", 11, checkProps, RANGE_SDR);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1100
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1100
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.test_dng.dng
         *                 3.ColorSpace.P3_PQ = 12
         *                 4.testGetPixelMapForColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1100',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1100");
            let checkProps = (result: number) => {
                expect(result == colorSpaceManager.ColorSpace.P3_PQ).assertTrue();
                log.log("checkProps success.");
            }
            await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1100",
                "test_dng.dng", colorSpaceManager.ColorSpace.P3_PQ, checkProps, RANGE_SDR);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1200
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1200
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.test.bmp
         *                 3.ColorSpace.ADOBE_RGB_1998_LIMIT = 13
         *                 4.testGetPixelMapForColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1200',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1200");
            let checkProps = (result: number) => {
                expect(result == colorSpaceManager.ColorSpace.ADOBE_RGB_1998_LIMIT).assertTrue();
                log.log("checkProps success.");
            }
            await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1200",
                "test.bmp", colorSpaceManager.ColorSpace.ADOBE_RGB_1998_LIMIT, checkProps, RANGE_SDR);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1300
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1300
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.test.bmp
         *                 3.ColorSpace.DISPLAY_P3_LIMIT = 14
         *                 4.testGetPixelMapForColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1300',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1300");
            let checkProps = (result: number) => {
                expect(result == colorSpaceManager.ColorSpace.DISPLAY_P3_LIMIT).assertTrue();
                log.log("checkProps success.");
            }
            await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1300",
                "test.bmp", 14, checkProps, RANGE_SDR);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1400
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1400
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.test.bmp
         *                 3.ColorSpace.SRGB_LIMIT = 15
         *                 4.testGetPixelMapForColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1400',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1400");
            let checkProps = (result: number) => {
                expect(result == colorSpaceManager.ColorSpace.SRGB_LIMIT).assertTrue();
                log.log("checkProps success.");
            }
            await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1400",
                "test.bmp", colorSpaceManager.ColorSpace.SRGB_LIMIT, checkProps, RANGE_SDR);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1500
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1500
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.test.bmp
         *                 3.ColorSpace.BT709_LIMIT = 16
         *                 4.testGetPixelMapForColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1500',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1500");
            let checkProps = (result: number) => {
                expect(result == colorSpaceManager.ColorSpace.BT709_LIMIT).assertTrue();
                log.log("checkProps success.");
            }
            await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1500",
                "test.bmp", colorSpaceManager.ColorSpace.BT709_LIMIT, checkProps, RANGE_SDR);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1600
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1600
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.test.webp
         *                 3.ColorSpace.BT601_EBU_LIMIT = 17
         *                 4.testGetPixelMapForColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1600',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1600");
            let checkProps = (result: number) => {
                expect(result == colorSpaceManager.ColorSpace.BT601_EBU_LIMIT).assertTrue();
                log.log("checkProps success.");
            }
            await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1600",
                "test.webp", 17, checkProps, RANGE_SDR);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1700
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1700
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.test.webp
         *                 3.ColorSpace.BT601_SMPTE_C_LIMIT = 18
         *                 4.testGetPixelMapForColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1700',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1700");
            let checkProps = (result: number) => {
                expect(result == colorSpaceManager.ColorSpace.BT601_SMPTE_C_LIMIT).assertTrue();
                log.log("checkProps success.");
            }
            await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1700",
                "test.webp", colorSpaceManager.ColorSpace.BT601_SMPTE_C_LIMIT, checkProps, RANGE_SDR);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1800
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1800
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.test.webp
         *                 3.ColorSpace.BT2020_HLG_LIMIT = 19
         *                 4.testGetPixelMapForColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1800',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1800");
            let checkProps = (result: number) => {
                expect(result == colorSpaceManager.ColorSpace.BT2020_HLG_LIMIT).assertTrue();
                log.log("checkProps success.");
            }
            await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1800",
                "test.webp", colorSpaceManager.ColorSpace.BT2020_HLG_LIMIT, checkProps, RANGE_SDR);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1900
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1900
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.test.webp
         *                 3.ColorSpace.BT2020_PQ_LIMIT = 20
         *                 4.testGetPixelMapForColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1900',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1900");
            let checkProps = (result: number) => {
                expect(result == colorSpaceManager.ColorSpace.BT2020_PQ_LIMIT).assertTrue();
                log.log("checkProps success.");
            }
            await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_1900",
                "test.webp", 20, checkProps, RANGE_SDR);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2000
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2000
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.moving_test.gif
         *                 3.ColorSpace.P3_HLG_LIMIT = 21
         *                 4.testGetPixelMapForColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2000',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2000");
            let checkProps = (result: number) => {
                expect(result == colorSpaceManager.ColorSpace.P3_HLG_LIMIT).assertTrue();
                log.log("checkProps success.");
            }
            await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2000",
                "moving_test.gif", colorSpaceManager.ColorSpace.P3_HLG_LIMIT, checkProps, RANGE_SDR);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2100
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2100
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.moving_test.gif
         *                 3.ColorSpace.P3_PQ_LIMIT = 22
         *                 4.testGetPixelMapForColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2100',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2100");
            let checkProps = (result: number) => {
                expect(result == colorSpaceManager.ColorSpace.P3_PQ_LIMIT).assertTrue();
                log.log("checkProps success.");
            }
            await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2100",
                "moving_test.gif", colorSpaceManager.ColorSpace.P3_PQ_LIMIT, checkProps, RANGE_SDR);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2200
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2200
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.moving_test.gif
         *                 3.ColorSpace.LINEAR_P3 = 23
         *                 4.testGetPixelMapForColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2200',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2200");
            let checkProps = (result: number) => {
                expect(result == colorSpaceManager.ColorSpace.LINEAR_P3).assertTrue();
                log.log("checkProps success.");
            }
            await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2200",
                "moving_test.gif", 23, checkProps, RANGE_SDR);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2300
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2300
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.moving_test.gif
         *                 3.ColorSpace.LINEAR_SRGB = 24
         *                 4.testGetPixelMapForColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2300',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2300");
            let checkProps = (result: number) => {
                expect(result == colorSpaceManager.ColorSpace.LINEAR_SRGB).assertTrue();
                log.log("checkProps success.");
            }
            await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2300",
                "moving_test.gif", 24, checkProps, RANGE_SDR);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2400
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2400
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.test.ico
         *                 3.ColorSpace.LINEAR_BT709 = LINEAR_SRGB = 24
         *                 4.testGetPixelMapForColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2400',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2400");
            let checkProps = (result: number) => {
                expect(result == colorSpaceManager.ColorSpace.LINEAR_SRGB).assertTrue();
                log.log("checkProps success.");
            }
            await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2400",
                "test.ico", colorSpaceManager.ColorSpace.LINEAR_BT709, checkProps, RANGE_SDR);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2500
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2500
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.test.ico
         *                 3.ColorSpace.LINEAR_BT2020 = 25
         *                 4.testGetPixelMapForColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2500',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2500");
            let checkProps = (result: number) => {
                expect(result == colorSpaceManager.ColorSpace.LINEAR_BT2020).assertTrue();
                log.log("checkProps success.");
            }
            await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2500",
                "test.ico", 25, checkProps, RANGE_SDR);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2600
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2600
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.test.ico
         *                 3.ColorSpace.DISPLAY_SRGB = SRGB = 4
         *                 4.testGetPixelMapForColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2600',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2600");
            let checkProps = (result: number) => {
                expect(result == colorSpaceManager.ColorSpace.SRGB).assertTrue();
                log.log("checkProps success.");
            }
            await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2600",
                "test.ico", colorSpaceManager.ColorSpace.DISPLAY_SRGB, checkProps, RANGE_SDR);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2700
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2700
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.test.ico
         *                 3.ColorSpace.DISPLAY_P3_SRGB = DISPLAY_P3 = 3
         *                 4.testGetPixelMapForColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2700',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2700");
            let checkProps = (result: number) => {
                expect(result == colorSpaceManager.ColorSpace.DISPLAY_P3).assertTrue();
                log.log("checkProps success.");
            }
            await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2700",
                "test.ico", colorSpaceManager.ColorSpace.DISPLAY_P3_SRGB, checkProps, RANGE_SDR);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2800
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2800
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.test.jpg
         *                 3.ColorSpace.DISPLAY_P3_HLG = P3_HLG = 11
         *                 4.testGetPixelMapForColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2800',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2900");
            let checkProps = (result: number) => {
                expect(result == colorSpaceManager.ColorSpace.P3_HLG).assertTrue();
                log.log("checkProps success.");
            }
            await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2800",
                "test.jpg", colorSpaceManager.ColorSpace.DISPLAY_P3_HLG, checkProps, RANGE_SDR);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2900
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2900
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.test.jpg
         *                 3.ColorSpace.DISPLAY_P3_PQ = P3_PQ = 12
         *                 4.testGetPixelMapForColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2900',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2900");
            let checkProps = (result: number) => {
                expect(result == colorSpaceManager.ColorSpace.P3_PQ).assertTrue();
                log.log("checkProps success.");
            }
            await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_2900",
                "test.jpg", colorSpaceManager.ColorSpace.DISPLAY_P3_PQ, checkProps, RANGE_SDR);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_3000
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_3000
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.all_auxtype.heic
         *                 3.ColorSpace.ADOBE_RGB_1998 = 1
         *                 4.testGetPixelMapForColorSpace
         *                 5.pixelMapColorSpace = ColorSpace.BT2020_HLG = 9
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_3000',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done :Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_3000");
            if (!fs.accessSync("/sys_prod/lib64/VideoProcessingEngine/libaihdr_engine.so")) {
              done();
              return
            }
            if (!isSupportHEIFDecode || !isSupportHdr) {
                if (!isSupportHEIFDecode) {
                    log.log("device is not support heif decode");
                } else {
                    log.log("device is not support HDR");
                }
                done();
            } else {
                let checkProps = (result: number) => {
                    expect(result == colorSpaceManager.ColorSpace.BT2020_HLG).assertTrue();
                    log.log("checkProps success.");
                }
                await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_3000",
                    "all_auxtype.heic", colorSpaceManager.ColorSpace.ADOBE_RGB_1998, checkProps, RANGE_HDR);
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_3100
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_3100
         * @tc.desc      : testGetPixelMapForColorSpace
         *                 1.create imageSource
         *                 2.CUVAHdr.jpg
         *                 3.ColorSpace.DISPLAY_P3 = 3
         *                 4.testGetPixelMapForColorSpace
         *                 5.pixelMapColorSpace = ColorSpace.BT2020_HLG = 9
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_3100',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done :Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_3100");
            if (!fs.accessSync("/sys_prod/lib64/VideoProcessingEngine/libaihdr_engine.so")) {
              done();
              return
            }
            if (!isSupportHEIFDecode || !isSupportHdr) {
                if (!isSupportHEIFDecode) {
                    log.log("device is not support heif decode");
                } else {
                    log.log("device is not support HDR");
                }
                done();
            } else {
                let checkProps = (result: number) => {
                    expect(result == colorSpaceManager.ColorSpace.BT2020_HLG).assertTrue();
                    log.log("checkProps success.");
                }
                await testGetPixelMapForColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_3100",
                    "CUVAHdr.jpg", colorSpaceManager.ColorSpace.DISPLAY_P3, checkProps, RANGE_HDR);
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_ERR_0100
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_ERR_0100
         * @tc.desc      : setDecodingOptColorSpace
         *                 1.set ColorSpace is 0
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_ERR_0100',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done :Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_ERR_0100");
            let opts: image.DecodingOptions = mdkTest.createDecodingOptions();
            globalDecoingOption = opts;
            if (opts == undefined) {
                log.log('Failed to create DecodingOptions.');
                expect(false).assertTrue();
                done();
            }
            let errorCode: number = mdkTest.setDecodingOptColorSpace(opts, 0);
            log.log("Failed to set ColorSpace nullPtr. errorCode : " + errorCode);
            expect(errorCode == PARA_ERROR_CODE).assertTrue();
            done();
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_ERR_0200
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_ERR_0200
         * @tc.desc      : setDecodingOptColorSpace
         *                 1.create imageSource
         *                 2.ColorSpace.CUSTOM = 5
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_ERR_0200',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_ERR_0200");
            let opts: image.DecodingOptions = mdkTest.createDecodingOptions();
            globalDecoingOption = opts;
            if (opts == undefined) {
                log.log('Failed to create DecodingOptions.');
                expect(false).assertTrue();
                done();
            }
            let errorCode: number = mdkTest.setDecodingOptColorSpace(opts, colorSpaceManager.ColorSpace.CUSTOM);
            log.log("Failed to set ColorSpace nullPtr. errorCode : " + errorCode);
            expect(errorCode == PARA_ERROR_CODE).assertTrue();
            done();
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_ERR_0300
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_ERR_0300
         * @tc.desc      : setDecodingOptColorSpace
         *                 1.set ColorSpace is 26
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_ERR_0300',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done :Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_ERR_0300");
            let opts: image.DecodingOptions = mdkTest.createDecodingOptions();
            globalDecoingOption = opts;
            if (opts == undefined) {
                log.log('Failed to create DecodingOptions.');
                expect(false).assertTrue();
                done();
            }
            let errorCode: number = mdkTest.setDecodingOptColorSpace(opts, 26);
            log.log("Failed to set ColorSpace nullPtr. errorCode : " + errorCode);
            expect(errorCode == PARA_ERROR_CODE).assertTrue();
            done();
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_ERR_0400
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_ERR_0400
         * @tc.desc      : setDecodingOptColorSpaceErr
         *                 1.set DecodingOptions nullPtr
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_ERR_0400',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done :Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_ERR_0400");
            let errorCode: number = mdkTest.setDecodingOptColorSpaceErr();
            log.log("Failed to set DecodingOpt nullPtr. errorCode : " + errorCode);
            expect(errorCode == PARA_ERROR_CODE).assertTrue();
            done();
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_GET_COLOR_SPACE_ERR_0500
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_GET_COLOR_SPACE_ERR_0500
         * @tc.desc      : getDecodingOptColorSpaceErr
         *                 1.get DecodingOptions nullPtr
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_GET_COLOR_SPACE_ERR_0500',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done :Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_GET_COLOR_SPACE_ERR_0500");
            let errorCode: number = mdkTest.getDecodingOptColorSpaceErr();
            log.log("Failed to set DecodingOpt nullPtr. errorCode : " + errorCode);
            expect(errorCode == PARA_ERROR_CODE).assertTrue();
            done();
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_GET_COLOR_SPACE_ERR_0600
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_GET_COLOR_SPACE_ERR_0600
         * @tc.desc      : getDecodingOptColorSpaceErr
         *                 1.get colorSpace nullPtr
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_GET_COLOR_SPACE_ERR_0600',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done :Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_GET_COLOR_SPACE_ERR_0600");
            let opts: image.DecodingOptions = mdkTest.createDecodingOptions();
            globalDecoingOption = opts;
            let errorCode: number = mdkTest.getDecodingOptColorSpaceErr(opts);
            log.log("Failed to set DecodingOpt nullPtr. errorCode : " + errorCode);
            expect(errorCode == PARA_ERROR_CODE).assertTrue();
            done();
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0100
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0100
         * @tc.desc      : test Modify Maker Note Image Property, get Maker Note Image Property
         *                 1.create imageSource
         *                 2.call ModifyMakerNoteImageProperty, GetMakerNoteImageProperty
         *                 3.Use test_exif.jpg format images
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0100',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let writeFd: number = getFdFilesDir("test_makernote_XXX.jpeg");
            let packOpts: image.PackingOption = testCreatePackOptions("image/jpeg", 98, true);

            let prop: RecordKeyValue = {
                key: image.PropertyKey.MAKER_NOTE, value: "XXX"
            };
            await testModifyMakerNoteImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0100",
                "test_exif.jpg", prop, true, packOpts, writeFd);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0200
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0200
         * @tc.desc      : test Modify Maker Note Image Property, get Maker Note Image Property
         *                 1.create imagesource
         *                 2.call ModifyMakerNoteImageProperty, GetMakerNoteImageProperty
         *                 3.Use test_exif_v3.heic format images
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0200",
          TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
          if (!isSupportHEIFDecode || !isSupportHEICEncode) {
            if (!isSupportHEIFDecode) {
              console.info(`SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0200 device is not support heif decode`);
            } else {
              console.info(`SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0200 device is not support heic encode`);
            }
            done();
          } else {
            let writeFd: number = getFdFilesDir("test_makernote_heic.heic");
            let packOpts: image.PackingOption = testCreatePackOptions("image/heic", 98, true);
      
            let prop: RecordKeyValue = {
              key: image.PropertyKey.MAKER_NOTE, value: "XXXXXXXXXXXXXX"
            };
            await testModifyMakerNoteImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0200",
              "test_exif_v3.heic", prop, true, packOpts, writeFd);
          }
        });
    
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0300
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0300
         * @tc.desc      : test Modify Maker Note Image Property, get Maker Note Image Property
         *                 1.create imagesource
         *                 2.call ModifyMakerNoteImageProperty, GetMakerNoteImageProperty
         *                 3.Use test_exif.png format images
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0300",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done :Function) => {
            let writeFd: number = getFdFilesDir("test_makernote_png.png");
            let packOpts: image.PackingOption = testCreatePackOptions("image/png", 98, true);
        
            let prop: RecordKeyValue = {
                key: image.PropertyKey.MAKER_NOTE, value: "123456789"
            };
            await testModifyMakerNoteImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0300",
                "test_exif.png", prop, true, packOpts, writeFd);
        });
    
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0400
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0400
         * @tc.desc      : test Modify Maker Note Image Property, get Maker Note Image Property
         *                 1.create imagesource
         *                 2.call ModifyMakerNoteImageProperty, GetMakerNoteImageProperty
         *                 3.Use test_exif_v2.webp format images
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0400",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done :Function) => {
            let prop: RecordKeyValue = {
                key: image.PropertyKey.MAKER_NOTE, value: "!@#$%^&*()"
            };
            await testModifyMakerNoteImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0400",
                "test_exif_v2.webp", prop, false);
        });
    
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0500
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0500
         * @tc.desc      : test Modify Maker Note Image Property, get Maker Note Image Property
         *                 1.create imagesource
         *                 2.call ModifyMakerNoteImageProperty, GetMakerNoteImageProperty
         *                 3.Use test_dng.dng format images
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0500",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done :Function) => {
            let prop: RecordKeyValue = {
                key: image.PropertyKey.MAKER_NOTE, value: "manufacturer_information"
            };
            await testModifyMakerNoteImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0500",
                "test_dng.dng", prop, false);
        });
    
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0600
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0600
         * @tc.desc      : test Modify Maker Note Image Property, get Maker Note Image Property
         *                 1.create imagesource
         *                 2.call ModifyMakerNoteImageProperty, GetMakerNoteImageProperty
         *                 3.Use test.jpg format images
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0600",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let prop: RecordKeyValue = {
                key: image.PropertyKey.MAKER_NOTE, value: "QWERTYUIOP"
            };
            await testModifyMakerNoteImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0600",
                "test.jpg", prop, false);
        });
    
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0700
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0700
         * @tc.desc      : test get Maker Note Image Property
         *                 1.create imagesource
         *                 2.call GetMakerNoteImageProperty
         *                 3.Use food.jpg format images
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0700",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0700");
            let writeFd: number = getFdFilesDir("food.jpg");
            let imageSourceApi: image.ImageSource = mdkTest.createImageSource(writeFd);
            fs.closeSync(writeFd!!);
            let makerNote: string | number = mdkTest.GetMakerNoteImageProperty(imageSourceApi, image.PropertyKey.MAKER_NOTE);
            if (makerNote != undefined && typeof(makerNote) != "number") {
                log.log('GetMakerNoteImageProperty promise: ' + makerNote);
                if (imageSourceApi != undefined) {
                    mdkTest.releaseImageSource(imageSourceApi);
                }
                done();
            } else {
                log.log('GetMakerNoteImageProperty error: ' + makerNote);
                if (imageSourceApi != undefined) {
                    mdkTest.releaseImageSource(imageSourceApi);
                }
                expect(false).assertTrue();
                done();
            }
        });
    
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0800
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0800
         * @tc.desc      : test Modify Maker Note Image Property, get Maker Note Image Property
         *                 1.create imagesource
         *                 2.call ModifyMakerNoteImageProperty, GetMakerNoteImageProperty
         *                 3.Use food.jpg format images
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0800",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let prop: RecordKeyValue = {
                key: image.PropertyKey.MAKER_NOTE, value: "QWE!@#123"
            };
            await testModifyMakerNoteImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0800",
                "food.jpg", prop, false);
        });
    
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0900
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0900
         * @tc.desc      : test Modify Maker Note Image Property, get Maker Note Image Property
         *                 1.create imagesource
         *                 2.call ModifyMakerNoteImageProperty, GetMakerNoteImageProperty
         *                 3.Use food_notHW.jpg format images
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0900",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let prop: RecordKeyValue = {
                key: image.PropertyKey.MAKER_NOTE, value: "123456"
            };
            await testModifyMakerNoteImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0900",
                "food_notHW.jpg", prop, false);
        });
    
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_1000
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_1000
         * @tc.desc      : test Modify Maker Note Image Property, get Maker Note Image Property
         *                 1.create imagesource
         *                 2.call ModifyMakerNoteImageProperty, GetMakerNoteImageProperty
         *                 3.Use food_notHW.jpg format images
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_1000",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let prop: RecordKeyValue = {
                key: image.PropertyKey.MAKER_NOTE, value: "HW"
            };
            await testModifyMakerNoteImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_1000",
                "food_notHW.jpg", prop, false);
        });
    
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_1100
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_1100
         * @tc.desc      : test Modify Maker Note Image Property
         *                 1.create imagesource
         *                 2.call ModifyMakerNoteImageProperty
         *                 3.test_exif.jpg write characters longer than 64*1024
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_1100",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let str: string = new Array(64*1024-1).fill('A').join('');
            str = str.substring(0, 64*1024-1).padEnd(64*1024-1, 'Hello World');
            let prop: RecordKeyValue = {
                key: image.PropertyKey.MAKER_NOTE, value: str
            };
            await testModifyMakerNoteImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_1100",
                "test_exif.png", prop, false);
        });
    
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0100
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0100
         * @tc.desc      : test Modify Maker Note Image Property
         *                 1.create imagesource
         *                 2.call ModifyMakerNoteImageProperty
         *                 3.Use test.bmp format images
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0100",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let prop: RecordKeyValue = {
                key: image.PropertyKey.MAKER_NOTE, value: "123456789"
            };
            await testModifyMakerNoteImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0100",
                "test.bmp", prop);
        });
    
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0200
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0200
         * @tc.desc      : test Modify Maker Note Image Property
         *                 1.create imagesource
         *                 2.call ModifyMakerNoteImageProperty
         *                 3.Use moving_test.gif format images
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0200",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let prop: RecordKeyValue = {
                key: image.PropertyKey.MAKER_NOTE, value: "123456789"
            };
            await testModifyMakerNoteImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0200",
                "moving_test.gif", prop);
        });
    
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0300
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0300
         * @tc.desc      : test Modify Maker Note Image Property
         *                 1.create imagesource
         *                 2.call ModifyMakerNoteImageProperty
         *                 3.Use test.ico format images
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0300",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let prop: RecordKeyValue = {
                key: image.PropertyKey.MAKER_NOTE, value: "123456789"
            };
            await testModifyMakerNoteImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0300",
                "test.ico", prop);
        });
    
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0400
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0400
         * @tc.desc      : test Modify Maker Note Image Property
         *                 1.create imagesource
         *                 2.call ModifyMakerNoteImageProperty
         *                 3.Use test_large.svg format images
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0400",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let prop: RecordKeyValue = {
                key: image.PropertyKey.MAKER_NOTE, value: "123456789"
            };
            await testModifyMakerNoteImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0400",
                "test_large.svg", prop);
        });
    
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0500
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0500
         * @tc.desc      : test Modify Maker Note Image Property
         *                 1.create imagesource
         *                 2.call ModifyMakerNoteImageProperty
         *                 3.test_exif.jpg write characters that are less than or equal to 0
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0500",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let prop: RecordKeyValue = {
                key: image.PropertyKey.MAKER_NOTE, value: ""
            };
            await testModifyMakerNoteImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0500",
                "test_exif.jpg", prop);
        });
    
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0600
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0600
         * @tc.desc      : test Modify Maker Note Image Property
         *                 1.create imagesource
         *                 2.call ModifyMakerNoteImageProperty
         *                 3.test_exif.jpg write characters longer than 64*1024
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0600",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            let str: string = new Array(64*1024).fill('A').join('');
            str = str.substring(0, 64*1024).padEnd(64*1024, 'Hello World');
            let prop: RecordKeyValue = {
                key: image.PropertyKey.MAKER_NOTE, value: str
            };
            await testModifyMakerNoteImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0600",
                "test_exif.jpg", prop);
        });
    
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_0700
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_0700
         * @tc.desc      : test Get Maker Note Image Property
         *                 1.create imagesource
         *                 2.call GetMakerNoteImageProperty
         *                 3.Use test.bmp format images
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_0700",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            await testGetMakerNoteImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_0700",
                "test.bmp");
        });
    
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_0800
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_0800
         * @tc.desc      : test Get Maker Note Image Property
         *                 1.create imagesource
         *                 2.call GetMakerNoteImageProperty
         *                 3.Use moving_test.gif format images
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_0800",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            await testGetMakerNoteImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_0800",
                "moving_test.gif");
        });
    
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_0900
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_0900
         * @tc.desc      : test Get Maker Note Image Property
         *                 1.create imagesource
         *                 2.call GetMakerNoteImageProperty
         *                 3.Use test.ico format images
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_0900",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            await testGetMakerNoteImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_0900",
                "test.ico");
        });
    
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_1000
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_1000
         * @tc.desc      : test Get Maker Note Image Property
         *                 1.create imagesource
         *                 2.call GetMakerNoteImageProperty
         *                 3.Use test_large.svg format images
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_1000",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            await testGetMakerNoteImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_1000",
                "test_large.svg");
        });
    
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_1100
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_1100
         * @tc.desc      : test get Maker Note Image Property
         *                 1.create imagesource
         *                 2.call GetMakerNoteImageProperty
         *                 3.testExif.jpg no makernote info
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_1100",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            await testGetMakerNoteImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_1100",
                "testExif.jpg");
        });
    
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_1200
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_1200
         * @tc.desc      : test get Maker Note Image Property
         *                 1.create imagesource
         *                 2.call GetMakerNoteImageProperty
         *                 3.food_notHW2.jpg
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_1200",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            await testGetMakerNoteImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_1200",
                "food_notHW2.jpg");
        });
    })
}