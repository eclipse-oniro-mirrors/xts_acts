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

import image from "@ohos.multimedia.image";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import fileio from "@ohos.fileio";
import display from '@ohos.display';
import hdrCapability from '@ohos.graphics.hdrCapability';
import { BusinessError } from '@kit.BasicServicesKit';
import fs from '@ohos.file.fs';

interface Size {
    width: number,
    height: number
};

interface TestFile {
    fileName?: string,
    packTarget: string,
    size: Size
};

interface  TestFilePack {
    fileName: string,
    packTarget: string,
    size: Size,
    packSource: string
}

interface packOpts {
    format?: string,
    quality?: number
};

export default function imagePackToFileGif() {
    describe("imagePackToFileGif", () => {
        let isSupportGifEncode: boolean;
        let filesDir: string|undefined;
        let cacheDir: string|undefined;
        const ERROR_CODE = 62980115;
        const ERROR_CODE1 = 401;

        beforeAll(async () => {
            console.info("beforeAll case");
            filesDir = AppStorage.get('pathDir')
            cacheDir = AppStorage.get('cacheDir')
            isSupportGifEncode = image.createImagePacker().supportedFormats.includes("image/gif");
        });

        beforeEach(() => {
            console.info("beforeEach case");
        });

        afterEach(async () => {
            console.info("afterEach case");
        });

        afterAll(() => {
            console.info("afterAll case");
        });

        const getImageSourceData = async (fileName: string) => {
            let filePath = ""
            let globalImagesource: image.ImageSource;
            try {
                filePath = filesDir + "/" + fileName;
                globalImagesource = image.createImageSource(filePath);
                return globalImagesource;
            } catch (error) {
                console.info("getRawFileContent case" + error);
                return undefined;
            }
        }

        const getPixelMapData = async () => {
            let opts: image.InitializationOptions = { editable: true, pixelFormat: 2, size: { height: 4, width: 6 } };
            const Color = new ArrayBuffer(96);
            let globalpixelmap = await image.createPixelMap(Color, opts);
            return globalpixelmap;
        }

        const getWriteFd = async (fileName: string) => {
            let writeFd: number = 0;
            try {
                let fPath = cacheDir + "/" + fileName;
                console.info("image getWriteFd fPath is " + fPath);
                writeFd = fileio.openSync(fPath, 0o102, 0o666);
                console.log(`getWriteFd fd: ${JSON.stringify(writeFd)}`);
                if (writeFd !== null) {
                    console.info("getWriteFd file fd created");
                } else {
                    console.info("getWriteFd file fd created error");
                }
                writeFd = fileio.openSync(fPath, 0o2002, 0o666);
                console.log(`getWriteFd fd-re: ${JSON.stringify(writeFd)}`);
                if (writeFd !== null) {
                    console.info("getWriteFd file fd opened : Append Mode");
                } else {
                    console.info("getWriteFd file fd opened : Append Mode failed");
                }
            } catch (error) {
                console.info("image getWriteFd " + error);
            }
            return writeFd;
        }

        const isSupportImageFormat = async (fileName: string, format: string) => {
          let filePath = ""
          let isSupportFormat = false;
          let globalImagesource: image.ImageSource;
          try {
              filePath = filesDir + "/" + fileName;
              globalImagesource = await image.createImageSource(filePath);
              if (globalImagesource != undefined) {
                isSupportFormat = globalImagesource.supportedFormats.includes(format);
                console.info('isSupportFormat is ' + isSupportFormat);
                await globalImagesource.release();
              }
              return isSupportFormat;
          } catch (error) {
              console.info("getRawFileContent case" + error);
              return isSupportFormat;
          }
          return isSupportFormat;
        }

        const createPixelMapList = async (done: Function, picName: string) => {
            console.info("createPixelMapList start");
            let imageSourceApi = await getImageSourceData(picName);
            let pixelMapList: Array<image.PixelMap> = [];
            if (imageSourceApi == undefined) {
                console.info("createImageSource failed");
                expect(false).assertTrue();
                done();
            } else {
                try {
                    pixelMapList = await imageSourceApi.createPixelMapList();
                    if (pixelMapList != undefined) {
                        console.info("createPixelMapList success");
                    } else {
                        console.info("createPixelMapList failed");
                        expect(false).assertTrue();
                        done();
                    }
                } catch (error) {
                    console.info("createPixelMapList error = " + error);
                    expect(false).assertTrue();
                    done();
                }
            }
            return pixelMapList;
        }

        const checkPackToFileForSequenceResult = async (imageSource: image.ImageSource,
            packingOptions: image.PackingOptionsForSequence, testFile: TestFile) => {
            let delayTimeListLength: number = packingOptions.delayTimeList.length;
            let delayTimes = await imageSource.getDelayTimeList();
            let disposalTypes = await imageSource.getDisposalTypeList();
            let loopCount: ESObject = await imageSource.getImageProperties([image.PropertyKey.GIF_LOOP_COUNT]);
            let imageInfo: image.ImageInfo = imageSource.getImageInfoSync();
            console.log(`checkPackToFileForSequenceResult delayTimes ${delayTimes}`);
            console.log(`checkPackToFileForSequenceResult disposalTypes ${disposalTypes}`);
            console.log(`checkPackToFileForSequenceResult loopCount ${loopCount}`);
            console.log(`checkPackToFileForSequenceResult width ${imageInfo.size.width}`);
            console.log(`checkPackToFileForSequenceResult height ${imageInfo.size.height}`);
            expect(imageInfo.size.width == testFile.size.width).assertTrue();
            expect(imageInfo.size.height == testFile.size.height).assertTrue();
            expect(imageInfo.mimeType == "image/gif").assertTrue();
            //对比编码前后的 loopCount
            //GIF编码中设定输出图片循环播放次数的参数，取值范围为[0，65535]。0表示无限循环, 如果没有此字段, 则设置为默认值1；
            if (packingOptions.loopCount != undefined) {
                expect(loopCount.GIFLoopCount == packingOptions.loopCount).assertTrue();
            } else {
                expect(loopCount.GIFLoopCount == 1).assertTrue();
            }
            //对比编码前后的 delayTimesList。delayTimes 的值编码和解码的单位差10倍
            //GIF编码中设定输出图片每一帧的延迟时间。如果不是0，则此字段指定等待时间为参数值*0.01秒。
            //如果长度小于frameCount，则缺失的部分将用delayTimeList最后一个值填充。
            for (let i = 0; i < packingOptions.frameCount; i++) {
                if (i < delayTimeListLength) {
                    expect(delayTimes[i] == packingOptions.delayTimeList[i] * 10).assertTrue();
                } else {
                    expect(delayTimes[i] == packingOptions.delayTimeList[delayTimeListLength -1] * 10).assertTrue();
                }
            }
            //对比编码前后的 disposalTypes。disposalTypes的有效值是0～3，解码的时候0会变成1。
            //0：不需要任何操作  1：保持图形不变  2：恢复背景色  3：恢复到之前的状态。
            if (packingOptions.disposalTypes != undefined) {
                for (let i = 0; i < packingOptions.frameCount; i++) {
                    if (i < packingOptions.disposalTypes.length) {
                        if (packingOptions.disposalTypes[i] == 0) {
                            expect(disposalTypes[i] == 1).assertTrue();
                        } else {
                            expect(disposalTypes[i] == packingOptions.disposalTypes[i]).assertTrue();
                        }
                    } else {
                        expect(disposalTypes[i] == 1).assertTrue();
                    }
                }
            }
        }

        const testPackToFileForSequence = async (done: Function, testNum: string,
            packingOptions: image.PackingOptionsForSequence, testFile: TestFile) => {
            let pixelMapList: Array<image.PixelMap> = [];
            if (testFile.fileName != undefined) {
                pixelMapList = await createPixelMapList(done, testFile.fileName);
            }
            let fpath: string = cacheDir + "/" + testFile.packTarget;
            let writeFd = await getWriteFd(testFile.packTarget)
            console.log(`fpath = ` + fpath);
            console.log(`writeFd = ` + writeFd);

            let globalPacker = image.createImagePacker();
            if (globalPacker == undefined) {
                console.log(`${testNum} createImagePacker failed`);
                expect(false).assertTrue();
                done();
            }
            await globalPacker.packToFileFromPixelmapSequence(pixelMapList, writeFd, packingOptions).then(async () => {
                try {
                    fileio.closeSync(writeFd)
                    console.log(`${testNum} testPackToFileForSequence success`);
                    let imgSource = image.createImageSource(fpath);
                    if (imgSource == undefined) {
                        console.log(`${testNum} create pack file imageSource failed.`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        await checkPackToFileForSequenceResult(imgSource, packingOptions, testFile);
                        await imgSource.release();
                        done();
                    }
                } catch (e1) {
                    console.log("testPackToFileForSequence e1: " + e1);
                    expect().assertFail();
                    done();
                }
            }).catch((error: BusinessError) => {
                console.log(`${testNum} error: ` + JSON.stringify(error));
                expect().assertFail();
                done();
            });
        }

        const testPackToFileForSequenceError = async (done: Function, testNum: string,
            packingOptions: image.PackingOptionsForSequence, testFile: TestFile) => {
            let pixelMapList: Array<image.PixelMap> = [];
            if (testFile.fileName != undefined) {
                await createPixelMapList(done, testFile.fileName);
            }
            let fpath: string = cacheDir + "/" + testFile.packTarget;
            let writeFd = await getWriteFd(testFile.packTarget)
            console.log(`fpath = ` + fpath);
            console.log(`writeFd = ` + writeFd);

            let globalPacker = image.createImagePacker();
            if (globalPacker == undefined) {
                console.log(`${testNum} createImagePacker failed`);
                expect(false).assertTrue();
                done();
            }
            await globalPacker.packToFileFromPixelmapSequence(pixelMapList, writeFd, packingOptions).then(async () => {
                console.log(`${testNum} packToFileFromPixelmapSequence success`);
                expect(false).assertTrue();
                done();
            }).catch((error: BusinessError) => {
                console.log(`${testNum} packToFileFromPixelmapSequence error: ` + JSON.stringify(error));
                console.log(`${testNum} packToFileFromPixelmapSequence error.code: ` + error.code);
                expect(error.code == ERROR_CODE1).assertTrue();
                done();
            });
        }

        const checkPackToFileResult = async (filepath: string, testFilePack: TestFilePack) => {
            let imageSource = image.createImageSource(filepath);
            if (imageSource == undefined) {
                console.log(`create pack file imageSource failed.`);
                return false;
            } else {
                let delayTimes: ESObject = await imageSource.getDelayTimeList();
                let disposalTypes: ESObject = await imageSource.getDisposalTypeList();
                let loopCount: ESObject = await imageSource.getImageProperties([image.PropertyKey.GIF_LOOP_COUNT]);
                let imageInfo: image.ImageInfo = imageSource.getImageInfoSync();
                console.log(`packGifToFile delayTimes ${delayTimes}`);
                console.log(`packGifToFile disposalTypes ${disposalTypes}`);
                console.log(`packGifToFile loopCount ${loopCount}`);
                console.log(`packGifToFile width ${imageInfo.size.width}`);
                console.log(`packGifToFile height ${imageInfo.size.height}`);
                let result = delayTimes == 1000 && disposalTypes == 1 && loopCount.GIFLoopCount == 0 &&
                    imageInfo.size.width == testFilePack.size.width &&
                    imageInfo.size.height == testFilePack.size.height &&
                    imageInfo.mimeType == "image/gif"
                await imageSource.release();
                return result;
            }
        }

        const packGifToFile = async (done: Function, testNum: string, source: ESObject, fd: number,
            packingOptions: image.PackingOption, fPath: string, type:string,
            testFilePack: TestFilePack) => {
            let globalPacker = image.createImagePacker();
            if (globalPacker == undefined) {
                console.log(`${testNum} createImagePacker failed`);
                expect(false).assertTrue();
                done();
            }
            if (type == "callback") {
                globalPacker.packToFile(source, fd, packingOptions, async (err) => {
                    try {
                        fileio.closeSync(fd);
                        if (err != undefined) {
                            console.info(`${testNum} pack fail: ${JSON.stringify(err)}`);
                            expect(false).assertTrue();
                            done();
                        } else {
                            let result = await checkPackToFileResult(fPath, testFilePack);
                            expect(result).assertTrue();
                            done();
                        }
                    } catch(error) {
                        console.log(`${testNum} packToFile failed. ${error}`);
                    }
                })
            } else {
                try {
                    await globalPacker.packToFile(source, fd, packingOptions);
                    fileio.closeSync(fd);
                    console.info(`${testNum} packToFile test success`);
                    let result = await checkPackToFileResult(fPath, testFilePack);
                    expect(result).assertTrue();
                    done();
                } catch (error) {
                    fileio.closeSync(fd);
                    console.log(`${testNum} packToFile error: ` + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                }
            }
        }
        
        const testPackGifToFile = async (done: Function, testNum: string, packingOptions: image.PackingOption,
            type: string, testFilePack: TestFilePack) => {
            let source: ESObject = await getImageSourceData(testFilePack.fileName);
            let globalpixelmap: image.PixelMap;
            let fpath: string = cacheDir + "/" + testFilePack.packTarget;
            let writeFd = await getWriteFd(testFilePack.packTarget)
            if (testFilePack.packSource == "PixelMap") {
                globalpixelmap = await source.createPixelMap();
                source = globalpixelmap;
            }
            await packGifToFile(done, testNum, source, writeFd, packingOptions, fpath, type, testFilePack);
        }

        const packToFileCbErr = async (done: Function, testNum: string, source: ESObject, fd: number,
            ops: ESObject) => {
            let globalPacker: image.ImagePacker;
            try {
                globalPacker = image.createImagePacker();
                expect(globalPacker != undefined).assertTrue();
                if (globalPacker == undefined) {
                    expect(false).assertTrue();
                    done();
                    return;
                }
                await globalPacker.packToFile(source, fd, ops);
                fileio.closeSync(fd);
                expect(false).assertTrue();
                console.info(`${testNum} packToFile test`);
                done();
            } catch (error) {
                fileio.closeSync(fd);
                console.log("packToFileCallback error: " + error);
                console.info(`${testNum} pack failerr: ${JSON.stringify(error)}`);
                console.info(`${testNum} pack failerr: ${error.code}`);
                expect(error.code == ERROR_CODE).assertTrue();
                done();
            }
        }

        const packToFilePromiseErr = async (done: Function, testNum: string, source: ESObject, fd: number,
            ops: ESObject) => {
            let globalPacker: image.ImagePacker;
            try {
                globalPacker = image.createImagePacker();
                expect(globalPacker != undefined).assertTrue();
                if (globalPacker == undefined) {
                    expect(false).assertTrue();
                    done();
                    return;
                }
                try {
                    await globalPacker.packToFile(source, fd, ops);
                    fileio.closeSync(fd);
                    expect(false).assertTrue();
                    console.info(`${testNum} packToFile test`);
                    done();
                } catch (error) {
                    fileio.closeSync(fd);
                    console.log(`${testNum} packToFile error: ` + JSON.stringify(error));
                    console.info(`${testNum} pack failerr: ${error.code}`);
                    expect(error.code == ERROR_CODE).assertTrue();
                    done();
                }
            } catch (error) {
                console.log("packToFilePromise error: " + error);
                expect().assertFail();
                done();
            }
        }

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0100
         * @tc.desc   1.create PixelMap List
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0100", Level.LEVEL0, async (done: Function) => {
            if (!isSupportGifEncode) {
                console.info("This device does not support GIF encoding.")
                done();
            } else {
                let testFile: TestFile = {
                    fileName: "moving_test.gif", packTarget: "pack_multiFrames.gif", size: { width: 198, height: 202 } 
                };
                let packingOptions: image.PackingOptionsForSequence = { 
                    frameCount: 3, delayTimeList: [10, 10, 10], disposalTypes: [3, 1, 0], loopCount: 5
                };
                await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0100",
                    packingOptions, testFile);
            }
        });

         /**
          * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0200
          * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0200
          * @tc.desc   1.create PixelMap List
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL0
          */
         it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0200", Level.LEVEL0, async (done: Function) => {
            if (!isSupportGifEncode) {
                console.info("This device does not support GIF encoding.")
                done();
            } else {
                let testFile: TestFile = {
                    fileName: "test.png", packTarget: "pack_oneFrame.gif", size: { width: 6016, height: 3384 } 
                };
                let packingOptions: image.PackingOptionsForSequence = { 
                    frameCount: 1, delayTimeList: [100], disposalTypes: [3], loopCount: 5
                };
                await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0200",
                    packingOptions, testFile);
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0300
         * @tc.desc   1.create PixelMap List
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0300", Level.LEVEL0, async (done: Function) => {
            if (!isSupportGifEncode) {
                console.info("This device does not support GIF encoding.")
                done();
            } else {
                let testFile: TestFile = {
                    fileName: "moving_test.gif", packTarget: "pack_no_loop.gif", size: { width: 198, height: 202 } 
                };
                let packingOptions: image.PackingOptionsForSequence = { 
                    frameCount: 1, delayTimeList: [200], disposalTypes: [3, 1, 0]
                };
                await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0300",
                    packingOptions, testFile);
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0400
         * @tc.desc   1.create PixelMap List
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0400", Level.LEVEL0, async (done: Function) => {
            if (!isSupportGifEncode) {
                console.info("This device does not support GIF encoding.")
                done();
            } else {
                let testFile: TestFile = {
                    fileName: "test.png", packTarget: "pack_no_disposalTypes.gif", size: { width: 6016, height: 3384 } 
                }
                let packingOptions: image.PackingOptionsForSequence = { 
                    frameCount: 1, delayTimeList: [100], loopCount: 4
                };
                await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0400",
                    packingOptions, testFile);
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0500
         * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0500
         * @tc.desc   1.create PixelMap List
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0500", Level.LEVEL0, async (done: Function) => {
            if (!isSupportGifEncode) {
                console.info("This device does not support GIF encoding.")
                done();
            } else {
                let testFile: TestFile = {
                    fileName: "moving_test.gif", 
                    packTarget: "pack_no_disposalTypes_no_loopCount.gif", 
                    size: { width: 198, height: 202 } 
                }
                let packingOptions: image.PackingOptionsForSequence = { 
                    frameCount: 3, delayTimeList: [10, 10, 10]
                };
                await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0500",
                    packingOptions, testFile);
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0600
         * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0600
         * @tc.desc   1.create PixelMap List
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0600", Level.LEVEL0, async (done: Function) => {
            if (!isSupportGifEncode) {
                console.info("This device does not support GIF encoding.")
                done();
            } else {
                let testFile: TestFile = {
                    fileName: "moving_test.gif", packTarget: "pack_less_frameCount.gif", 
                    size: { width: 198, height: 202 } 
                };
                let packingOptions: image.PackingOptionsForSequence = { 
                    frameCount: 1, delayTimeList: [10, 10, 10], disposalTypes: [3, 1, 0], loopCount: 5
                };
                await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0600",
                    packingOptions, testFile);
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0700
         * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0700
         * @tc.desc   1.create PixelMap List
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0700", Level.LEVEL0, async (done: Function) => {
            if (!isSupportGifEncode) {
                console.info("This device does not support GIF encoding.")
                done();
            } else {
                let testFile: TestFile = {
                    fileName: "moving_test.gif", packTarget: "pack_more_frameCount.gif", 
                    size: { width: 198, height: 202 } 
                };
                let packingOptions: image.PackingOptionsForSequence = { 
                    frameCount: 5, delayTimeList: [10, 10, 10], disposalTypes: [3, 1, 0], loopCount: 5
                };
                await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0700",
                    packingOptions, testFile);
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0800
         * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0800
         * @tc.desc   1.create PixelMap List
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0800", Level.LEVEL0, async (done: Function) => {
            if (!isSupportGifEncode) {
                console.info("This device does not support GIF encoding.")
                done();
            } else {
                let testFile: TestFile = {
                    fileName: "moving_test.gif", packTarget: "pack_less_delayTimeList.gif", 
                    size: { width: 198, height: 202 } 
                };
                let packingOptions: image.PackingOptionsForSequence = { 
                    frameCount: 3, delayTimeList: [10], disposalTypes: [3, 1, 0], loopCount: 5
                };
                await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0800",
                    packingOptions, testFile);
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0900
         * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0900
         * @tc.desc   1.create PixelMap List
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0900", Level.LEVEL0, async (done: Function) => {
            if (!isSupportGifEncode) {
                console.info("This device does not support GIF encoding.")
                done();
            } else {
                let testFile: TestFile = {
                    fileName: "moving_test.gif", packTarget: "pack_more_delayTimeList.gif", 
                    size: { width: 198, height: 202 } 
                };
                let packingOptions: image.PackingOptionsForSequence = { 
                    frameCount: 3, delayTimeList: [10, 10, 10, 20, 30], disposalTypes: [3, 1, 0], loopCount: 5
                };
                await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_0900",
                    packingOptions, testFile);
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1000
         * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1000
         * @tc.desc   1.create PixelMap List
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1000", Level.LEVEL0, async (done: Function) => {
            if (!isSupportGifEncode) {
                console.info("This device does not support GIF encoding.")
                done();
            } else {
                let testFile: TestFile = {
                    fileName: "moving_test.gif", packTarget: "pack_less_disposalTypes.gif", 
                    size: { width: 198, height: 202 } 
                };
                let packingOptions: image.PackingOptionsForSequence = { 
                    frameCount: 3, delayTimeList: [10, 10, 10], disposalTypes: [3], loopCount: 5
                };
                await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1000",
                    packingOptions, testFile);
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1100
         * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1100
         * @tc.desc   1.create PixelMap List
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1100", Level.LEVEL0, async (done: Function) => {
            if (!isSupportGifEncode) {
                console.info("This device does not support GIF encoding.")
                done();
            } else {
                let testFile: TestFile = {
                    fileName: "moving_test.gif", packTarget: "pack_more_disposalTypes.gif", 
                    size: { width: 198, height: 202 } 
                };
                let packingOptions: image.PackingOptionsForSequence = { 
                    frameCount: 3, delayTimeList: [10, 10, 10], disposalTypes: [3, 2, 1, 0], loopCount: 5
                };
                await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1100",
                    packingOptions, testFile);
            }
        });

         /**
          * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1200
          * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1200
          * @tc.desc   1.create PixelMap List
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL0
          */
         it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1200", Level.LEVEL0, async (done: Function) => {
            if (!isSupportGifEncode) {
                console.info("This device does not support GIF encoding.")
                done();
            } else {
                let testFile: TestFile = {
                    fileName: "test.bmp", packTarget: "pack_oneFrame_bmp.gif", size: { width: 1399, height: 1042 } 
                };
                let packingOptions: image.PackingOptionsForSequence = { 
                    frameCount: 1, delayTimeList: [100], disposalTypes: [3], loopCount: 5
                };
                await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1200",
                    packingOptions, testFile);
            }
        });

         /**
          * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1300
          * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1300
          * @tc.desc   1.create PixelMap List
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL0
          */
         it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1300", Level.LEVEL0, async (done: Function) => {
            if (!isSupportGifEncode) {
                console.info("This device does not support GIF encoding.")
                done();
            } else {
                let testFile: TestFile = {
                    fileName: "test.jpg", packTarget: "pack_oneFrame_jpg.gif", size: { width: 1446, height: 1476 } 
                };
                let packingOptions: image.PackingOptionsForSequence = { 
                    frameCount: 1, delayTimeList: [100], disposalTypes: [3], loopCount: 5
                };
                await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1300",
                    packingOptions, testFile);
            }
        });

         /**
          * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1400
          * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1400
          * @tc.desc   1.create PixelMap List
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL0
          */
         it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1400", Level.LEVEL0, async (done: Function) => {
            if (!isSupportGifEncode) {
                console.info("This device does not support GIF encoding.")
                done();
            } else {
                let testFile: TestFile = {
                    fileName: "test.ico", packTarget: "pack_oneFrame_ico.gif", size: { width: 64, height: 64 } 
                };
                let packingOptions: image.PackingOptionsForSequence = { 
                    frameCount: 1, delayTimeList: [100], disposalTypes: [3], loopCount: 5
                };
                await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1400",
                    packingOptions, testFile);
            }
        });

         /**
          * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1500
          * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1500
          * @tc.desc   1.create PixelMap List
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL0
          */
         it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1500", Level.LEVEL0, async (done: Function) => {
            if (!isSupportGifEncode) {
                console.info("This device does not support GIF encoding.")
                done();
            } else {
                let testFile: TestFile = {
                    fileName: "test.svg", packTarget: "pack_oneFrame_svg.gif", size: { width: 400, height: 200 } 
                };
                let packingOptions: image.PackingOptionsForSequence = { 
                    frameCount: 1, delayTimeList: [100], disposalTypes: [3], loopCount: 5
                };
                await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1500",
                    packingOptions, testFile);
            }
        });

         /**
          * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1600
          * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1600
          * @tc.desc   1.create PixelMap List
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL0
          */
         it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1600", Level.LEVEL0, async (done: Function) => {
            if (!isSupportGifEncode) {
                console.info("This device does not support GIF encoding.")
                done();
            } else {
                let testFile: TestFile = {
                    fileName: "test.dng", packTarget: "pack_oneFrame_dng.gif", size: { width: 5976, height: 3992 } 
                };
                let packingOptions: image.PackingOptionsForSequence = {
                    frameCount: 1, delayTimeList: [100], disposalTypes: [3], loopCount: 5
                };
                await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1600",
                    packingOptions, testFile);
            }
        });

         /**
          * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1700
          * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1700
          * @tc.desc   1.create PixelMap List
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL0
          */
         it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1700", Level.LEVEL0, async (done: Function) => {
            if (!isSupportGifEncode) {
                console.info("This device does not support GIF encoding.")
                done();
            } else {
                let testFile: TestFile = {
                    fileName: "test.jpeg", packTarget: "pack_oneFrame_jpeg.gif", size: { width: 3072, height: 4096 }
                };
                let packingOptions: image.PackingOptionsForSequence = {
                    frameCount: 1, delayTimeList: [100], disposalTypes: [3], loopCount: 5
                };
                await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1700",
                    packingOptions, testFile);
            }
        });

         /**
          * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1800
          * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1800
          * @tc.desc   1.create PixelMap List
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL0
          */
         it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1800", Level.LEVEL0, async (done: Function) => {
            if (!isSupportGifEncode) {
                console.info("This device does not support GIF encoding.")
                done();
            } else {
                let testFile: TestFile = {
                    fileName: "test.webp", packTarget: "pack_oneFrame_webp.gif", size: { width: 1212, height: 681 } 
                };
                let packingOptions: image.PackingOptionsForSequence = {
                    frameCount: 1, delayTimeList: [100], disposalTypes: [3], loopCount: 5
                };
                await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1800",
                    packingOptions, testFile);
            }
        });

         /**
          * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1900
          * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1900
          * @tc.desc   1.create PixelMap List
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL0
          */
         it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1900", Level.LEVEL0, async (done: Function) => {
            try {
                if(!fs.accessSync("/sys_prod/etc/VideoProcessingEngine/Image_SR_Model_576x576_20240402.omc")) {
                    done();
                    return
                };
            } catch (error) {
                console.info('can not find path');
            }
            if (!isSupportGifEncode) {
                console.info("This device does not support GIF encoding.")
                done();
            } else {
                let isSupportFormat = await isSupportImageFormat("HDRVividSingleLayer.heic", "image/heic");
                if (!isSupportFormat) {
                    console.info("device is not support imageformat heic");
                    done();
                } else {
                    let testFile: TestFile = {
                        fileName: "HDRVividSingleLayer.heic", packTarget: "pack_oneFrame_heic.gif", 
                        size: { width: 3840, height: 2160 } 
                    };
                    let packingOptions: image.PackingOptionsForSequence = {
                        frameCount: 1, delayTimeList: [100], disposalTypes: [3], loopCount: 5
                    };
                    await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_1900",
                        packingOptions, testFile);
                }
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_0100
         * @tc.desc   1.create PixelMap List
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_0100", Level.LEVEL0, async (done: Function) => {
            if (!isSupportGifEncode) {
                console.info("This device does not support GIF encoding.")
                done();
            } else {
                let testFile: TestFile = {
                    fileName: "moving_test.gif", packTarget: "pack_wrong_frameCount.gif", 
                    size: { width: 198, height: 202 } 
                };
                let packingOptions: image.PackingOptionsForSequence = {
                    frameCount: 0, delayTimeList: [10, 10, 10], disposalTypes: [3, 1, 0], loopCount: 5
                };
                await testPackToFileForSequenceError(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_0100",
                    packingOptions, testFile);
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_0200
         * @tc.desc   1.create PixelMap List
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_0200", Level.LEVEL0, async (done: Function) => {
            if (!isSupportGifEncode) {
                console.info("This device does not support GIF encoding.")
                done();
            } else {
                let testFile: TestFile = {
                    fileName: "moving_test.gif", packTarget: "pack_wrong_delayTimeList.gif", 
                    size: { width: 198, height: 202 } 
                };
                let packingOptions: image.PackingOptionsForSequence = {
                    frameCount: 3, delayTimeList: [0], disposalTypes: [3, 1, 0], loopCount: 5
                };
                await testPackToFileForSequenceError(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_0200",
                    packingOptions, testFile);
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_0300
         * @tc.desc   1.create PixelMap List
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_0300", Level.LEVEL0, async (done: Function) => {
            if (!isSupportGifEncode) {
                console.info("This device does not support GIF encoding.")
                done();
            } else {
                let testFile: TestFile = {
                    fileName: "moving_test.gif", packTarget: "pack_wrong_disposalTypes.gif", 
                    size: { width: 198, height: 202 } 
                };
                let packingOptions: image.PackingOptionsForSequence = {
                    frameCount: 3, delayTimeList: [10, 10, 10], disposalTypes: [3, 4, 5], loopCount: 5
                };
                await testPackToFileForSequenceError(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_0300",
                    packingOptions, testFile);
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_0400
         * @tc.desc   1.create PixelMap List
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_0400", Level.LEVEL0, async (done: Function) => {
            if (!isSupportGifEncode) {
                console.info("This device does not support GIF encoding.")
                done();
            } else {
                let testFile: TestFile = {
                    fileName: "moving_test.gif", packTarget: "pack_wrong_loopCount_1.gif", 
                    size: { width: 198, height: 202 } 
                };
                let packingOptions: image.PackingOptionsForSequence = {
                    frameCount: 3, delayTimeList: [10, 10, 10], disposalTypes: [3, 1, 0], loopCount: -1
                };
                await testPackToFileForSequenceError(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_0400",
                    packingOptions, testFile);
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_0500
         * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_0500
         * @tc.desc   1.create PixelMap List
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_0500", Level.LEVEL0, async (done: Function) => {
            if (!isSupportGifEncode) {
                console.info("This device does not support GIF encoding.")
                done();
            } else {
                let testFile: TestFile = {
                    fileName: "moving_test.gif", packTarget: "pack_wrong_loopCount_65536.gif", 
                    size: { width: 198, height: 202 } 
                };
                let packingOptions: image.PackingOptionsForSequence = {
                    frameCount: 3, delayTimeList: [10, 10, 10], disposalTypes: [3, 1, 0], loopCount: 65536
                };
                await testPackToFileForSequenceError(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_0500",
                    packingOptions, testFile);
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAPLIST_ERROR_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAPLIST_ERROR_0100
         * @tc.desc   1.create PixelMap List
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAPLIST_ERROR_0100", Level.LEVEL0, async (done: Function) => {
            if (!isSupportGifEncode) {
                console.info("This device does not support GIF encoding.")
                done();
            } else {
                let testFile: TestFile = {
                    fileName: undefined, packTarget: "pack_multiFrames_err_0100.gif", 
                    size: { width: 198, height: 202 } 
                };
                let packingOptions: image.PackingOptionsForSequence = { 
                    frameCount: 3, delayTimeList: [10, 10, 10], disposalTypes: [3, 1, 0], loopCount: 5
                };
                await testPackToFileForSequenceError(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAPLIST_ERROR_0100",
                    packingOptions, testFile);
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0100
         * @tc.desc   1.create imagesource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0100", Level.LEVEL0, async (done: Function) => {
            if (!isSupportGifEncode) {
                console.info("This device does not support GIF encoding.")
                done();
            } else {
                let testFilePack: TestFilePack = {
                    fileName: "moving_test.gif", packTarget: "pack_imagesource_to_file_callback.gif", 
                    size: { width: 198, height: 202 }, packSource: "ImageSource"
                };
                let packingOptions: image.PackingOption = { format: "image/gif", quality: 100};
                await testPackGifToFile(done, "SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0100", packingOptions, "callback",
                    testFilePack);
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0200
         * @tc.desc   1.create PixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0200", Level.LEVEL0, async (done: Function) => {
            if (!isSupportGifEncode) {
                console.info("This device does not support GIF encoding.")
                done();
            } else {
                let testFile: TestFilePack = {
                    fileName: "moving_test.gif", packTarget: "pack_pixelmap_to_file_callback.gif", 
                    size: { width: 198, height: 202 }, packSource: "PixelMap"
                };
                let packingOptions: image.PackingOption = { format: "image/gif", quality: 100};
                await testPackGifToFile(done, "SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0200", packingOptions, "callback",
                    testFile);
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0300
         * @tc.desc   1.create imagesource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0300", Level.LEVEL0, async (done: Function) => {
            if (!isSupportGifEncode) {
                console.info("This device does not support GIF encoding.")
                done();
            } else {
                let testFile: TestFilePack = {
                    fileName: "moving_test.gif", packTarget: "pack_imagesource_to_file_promise.gif", 
                    size: { width: 198, height: 202 }, packSource: "ImageSource"
                };
                let packingOptions: image.PackingOption = { format: "image/gif", quality: 100};
                await testPackGifToFile(done, "SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0300", packingOptions, "promise",
                    testFile);
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0400
         * @tc.desc   1.create PixelMap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0400", Level.LEVEL0, async (done: Function) => {
            if (!isSupportGifEncode) {
                console.info("This device does not support GIF encoding.")
                done();
            } else {
                let testFile: TestFilePack = {
                    fileName: "moving_test.gif", packTarget: "pack_pixelmap_to_file_promise.gif", 
                    size: { width: 198, height: 202 }, packSource: "PixelMap"
                };
                let packingOptions: image.PackingOption = { format: "image/gif", quality: 100};
                await testPackGifToFile(done, "SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0400", packingOptions, "promise",
                    testFile);
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_0100
         * @tc.desc   1.create pixelmap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_0100", Level.LEVEL0, async (done: Function) => {
            let globalpixelmap = await getPixelMapData()
            expect(globalpixelmap != undefined).assertTrue();
            let fpath: string = cacheDir + "/" + "pack_multiFrames_err_001.gif";
            let writeFd = await getWriteFd("pack_multiFrames_err_001.gif")
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops: packOpts = { format: "image/gif", quality: 101 };
            packToFileCbErr(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_0100",
                globalpixelmap, writeFd, ops)
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_0200
         * @tc.desc   1.create pixelmap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_0200", Level.LEVEL0, async (done: Function) => {
            let source = await getImageSourceData("moving_test.gif");
            expect(source != undefined).assertTrue();
            let fpath: string = cacheDir + "/" + "pack_multiFrames_err_002.gif";
            let writeFd = await getWriteFd("pack_multiFrames_err_002.gif")
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops: packOpts = { format: "image/gif" };
            packToFileCbErr(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_0200",
                source, writeFd, ops)
        });



        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_0300
         * @tc.desc   1.create pixelmap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_0300", Level.LEVEL0, async (done: Function) => {
            let globalpixelmap = await getPixelMapData()
            expect(globalpixelmap != undefined).assertTrue();
            let fpath: string = cacheDir + "/" + "pack_multiFrames_err_003.gif";
            let writeFd = await getWriteFd("pack_multiFrames_err_003.gif")
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops: packOpts = { format: "image/gif", quality: 101 };
            await packToFilePromiseErr(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_0300",
                globalpixelmap, writeFd, ops)
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_0400
         * @tc.desc   1.create pixelmap
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_0400", Level.LEVEL0, async (done: Function) => {
            let source = await getImageSourceData("moving_test.gif");
            expect(source != undefined).assertTrue();
            let fpath: string = cacheDir + "/" + "pack_multiFrames_err_004.gif";
            let writeFd = await getWriteFd("pack_multiFrames_err_004.gif")
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops: packOpts = { format: "image/gif" };
            await packToFilePromiseErr(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_0400",
                source, writeFd, ops)
        });
    });
}