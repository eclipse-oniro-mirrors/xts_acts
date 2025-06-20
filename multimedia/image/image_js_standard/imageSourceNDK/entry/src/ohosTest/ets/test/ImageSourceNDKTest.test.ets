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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import fileio from "@ohos.fileio";
import ndkTest from 'libentry.so';
import mdkTest from 'libentryMDK.so';
import { testJpg } from './testImg';
import { BusinessError } from "@kit.BasicServicesKit";
import { common } from '@kit.AbilityKit';

const CODE_SUCCESS = 0;
const CODE_ERROR = -1;
let uiContext: common.UIAbilityContext;

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
        await fileio.open(filePath, 0o2, 0o777).then((data) => {
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

export default function ImageSourceNDKTest() {
    describe('ImageSourceNDKTest', () => {
        beforeAll(() => {
            uiContext = globalThis.uiContext
            console.info('beforeAll case');
        });
        beforeEach(() => {
            console.info('beforeEach case');
        });
        afterEach(() => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0100', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0200', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0300', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0400', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0500', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0600', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0700', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0800', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0900', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_1000', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_1100', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_1200', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_1300', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_FROM_FD_0100', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_BUFFER', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_FROM_DATA', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_PATH', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_FROM_URI', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_FROM_RAWFILE', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_INCREMENTAL', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_INCREMENTAL_FROM_DATA', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_INITNATIVE', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_GIF_0100', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_BMP_0200', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_JPG_0300', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_WEBP_0400', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_PNG_0500', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_SVG_0600', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_0700', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_0800', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_0900', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_1000', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_1100', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_1200', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_1300', 0, async (done: Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_PIXEL_MAP_LIST', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_DELAY_TIME', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_FRAME_COUNT', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_SUPPORTED_FORMATS', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_INFO', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0100', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0200', 0, async (done: Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0300', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0400', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0500', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0600', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0700', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0800', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0900', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_1000', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_1100', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_1200', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_1300', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_UPDATE_DATA', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0100', 0, async (done :Function) => {

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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0200', 0, async (done :Function) => {

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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0300', 0, async (done :Function) => {

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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0400', 0, async (done :Function) => {

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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0500', 0, async (done :Function) => {

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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0600', 0, async (done :Function) => {

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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0700', 0, async (done :Function) => {

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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0800', 0, async (done :Function) => {

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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0900', 0, async (done :Function) => {

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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0100', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0200', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0300', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0400', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0500', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0600', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0700', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0800', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_ERR_0100', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_ERR_0200', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_ERR_0300', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_ERR_0400', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_ERR_0100', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_ERR_0200', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_ERR_0300', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_ERR_0400', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_ERR_0100', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_ERR_0200', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_ERR_0300', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0100', 0, async (done :Function) => {
            let mlg:ESObject = logger("SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0100");
            mlg.log('SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0100 start');
            let fdResult = await getFd('moving_test_loop5.gif');
            let path: string = fdResult[0] as string;
            let fd:number = fdResult[1]  as number;
            mlg.log('fd = ' + fd);
            let loopcount = mdkTest.JsGetImageProperty(fd, 'GIFLoopCount');
            if (loopcount == 5) {
                mlg.log('loopcount = ' + loopcount);
                expect(true).assertTrue();
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
        it('SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0200', 0, async (done :Function) => {
            let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0200");
            mlg.log('SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0200 start');
            let fdResult = await getFd('moving_test_loop1.gif');
            let path: string = fdResult[0] as string;
            let fd:number = fdResult[1]  as number;
            mlg.log('fd = ' + fd);
            let loopcount = mdkTest.JsGetImageProperty(fd, 'GIFLoopCount');
            if (loopcount == 1) {
                mlg.log('loopcount = ' + loopcount);
                expect(true).assertTrue();
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
        it('SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0300', 0, async (done :Function) => {
            let mlg:ESObject = logger("SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0300");
            mlg.log('SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0300 start');
            let fdResult = await getFd('moving_test_loop0.gif');
            let path: string = fdResult[0] as string;
            let fd:number = fdResult[1]  as number;
            mlg.log('fd = ' + fd);
            let loopcount: number = mdkTest.JsGetImageProperty(fd, 'GIFLoopCount');
            if (loopcount == 0) {
                mlg.log('loopcount = ' + loopcount);
                expect(true).assertTrue();
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
        it('SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0400', 0, async (done :Function) => {
            let mlg:ESObject = logger("SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0400");
            mlg.log('SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0400 start');
            let fdResult = await getFd('text.jpg');
            let path: string = fdResult[0] as string;
            let fd:number = fdResult[1]  as number;
            mlg.log('fd = ' + fd);
            let loopcount = mdkTest.JsGetImageProperty(fd, 'GIFLoopCount');
            if (loopcount == undefined) {
                mlg.log('loopcount = ' + loopcount);
                expect(true).assertTrue();
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
        it('SUB_MULTIMEDIA_IMAGE_NATIVE_MODIFYIMAGEPROPERTY_LOOPCOUNT_PROMISE_0100', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_NATIVE_MODIFYIMAGEPROPERTY_LOOPCOUNT_PROMISE_0200', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_NATIVE_MODIFYIMAGEPROPERTY_LOOPCOUNT_PROMISE_0300', 0, async (done :Function) => {
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
        it('SUB_MULTIMEDIA_IMAGE_NATIVE_MODIFYIMAGEPROPERTY_LOOPCOUNT_PROMISE_0400', 0, async (done :Function) => {
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
    })
}