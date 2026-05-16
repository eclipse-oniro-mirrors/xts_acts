/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import ndkTest from 'libImageGetMimeType.so';
import fs from '@ohos.file.fs';
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import resourceManager from '@ohos.resourceManager';
import hdrCapability from '@ohos.graphics.hdrCapability';
import display from '@ohos.display';

export default function ImageGetMimeTypeTest() {
  describe('ImageGetMimeTypeTest', () => {
    let isSupportHEIFDecode: boolean;
    let isSupportHdr: Boolean;
    let fileDir: string | undefined;
    let testContext: common.UIAbilityContext;
        beforeAll(() => {
            console.info('beforeAll case');
            testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
            fileDir = AppStorage.get('pathDir');
            isSupportHEIFDecode =
                image.createImageSource(fileDir + '/' + "test.jpg").supportedFormats.includes("image/heic");
            isSupportHdr =
                !display.getDefaultDisplaySync().hdrFormats.includes(hdrCapability.HDRFormat.NONE) &&
                display.getDefaultDisplaySync().hdrFormats.length != 0;
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

        const getFilePath = (fileName: string) => {
            let filePath: string = fileDir + '/' + fileName;
            console.log('filePath:', filePath);
            return filePath;
        }

        const getFd = async (fileName: string) => {
            let filePath: string = fileDir + '/' + fileName;
            console.log('filePath:', filePath)
            let file = fs.openSync(filePath);
            let fileFd: number = file.fd;
            return fileFd;
        }

        const getBuffer = async (fileName: string) => {
            let filePath: string = fileDir + '/' + fileName;
            console.log('filePath:', filePath)
            let file = fs.openSync(filePath);
            const stats = fs.statSync(filePath);
            const fileSize = stats.size;
            const bufferRead = new ArrayBuffer(fileSize)
            fs.readSync(file.fd, bufferRead)
            let buffer = bufferRead
            return buffer;
        }

        const imageSourceGetMimeTypeTest = async (done: Function, testTag: string, picName: string, expName: string,
            type: string) => {
            try {
                console.info("imageSourceGetMimeTypeTest testNum: " + testTag + " picName: " + picName);
                let res: string = '';
                if (type == 'uri') {
                    let filePath: string = getFilePath(picName);
                    console.info(`${testTag} getFilePath result filePath: ${filePath}`);
                    res = ndkTest.JsImageSourceGetMimeType_Uri(filePath);
                }
                if (type == 'fd') {
                    let fileFd: number = await getFd(picName);
                    console.info(`${testTag} getFd result fileFd: ${fileFd}`);
                    res = ndkTest.JsImageSourceGetMimeType_Fd(fileFd);
                }
                if (type == 'data') {
                    let buffer: ArrayBuffer = await getBuffer(picName);
                    console.info(`${testTag} getBuffer result buffer: ${buffer}`);
                    res = ndkTest.JsImageSourceGetMimeType_Data(buffer);
                }
                if (type == 'rawfile') {
                    const resourceMgr: resourceManager.ResourceManager =
                        testContext.createModuleContext("entry_test").resourceManager;
                    const rawFileDescriptor: resourceManager.RawFileDescriptor = await resourceMgr.getRawFd(picName);
                    res = ndkTest.JsImageSourceGetMimeType_RawFile(rawFileDescriptor.fd, rawFileDescriptor.offset,
                        rawFileDescriptor.length);
                }

                if (res == undefined) {
                    console.info(testTag + "imageSourceGetMimeTypeTest undefined");
                    expect(res == undefined).assertFail();
                    done();
                    return;
                } else {
                    console.info(testTag + "imageSourceGetMimeTypeTest success mimeType: " + res);
                    expect(res == expName).assertTrue();
                    done();
                    return;
                }
            } catch {
                console.info("imageSourceGetMimeTypeTest failed testNum: " + testTag);
                expect().assertFail();
                done();
            }
        }

       const getMimeTypeTestError = async (done: Function, testTag: string, flag: boolean) => {
            try {
                let res:number;
                if (flag) {
                    res = ndkTest.imageSourceGetMimeTypeTest_Error01();
                } else {
                    let filePath: string = getFilePath("test.jpg");
                    res = ndkTest.imageSourceGetMimeTypeTest_Error02(filePath);
                }
                if (res == undefined) {
                    console.info(testTag + "getMimeTypeTestError undefined");
                    expect(res == undefined).assertFail();
                    done();
                    return;
                } else {
                    console.info(testTag + "getMimeTypeTestError success res: " + res);
                    expect(res == 7700204).assertTrue();
                    done();
                    return;
                }
            } catch {
                console.info(testTag + "getMimeTypeTestError failed testNum: " + testTag);
                expect().assertFail();
                done();
            }
        }

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0100
         * @tc.desc   imageSourceGetMimeType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            await imageSourceGetMimeTypeTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0100",
                "test.png", "image/png", "uri");
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0200
         * @tc.desc   imageSourceGetMimeType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            await imageSourceGetMimeTypeTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0200",
                "test.jpeg", "image/jpeg", "fd");
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0300
         * @tc.desc   imageSourceGetMimeType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            await imageSourceGetMimeTypeTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0300",
                "test.jpg", "image/jpeg", "data");
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0400
         * @tc.desc   imageSourceGetMimeType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            await imageSourceGetMimeTypeTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0400",
                "test.bmp", "image/bmp", "rawfile");
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0500
         * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0500
         * @tc.desc   imageSourceGetMimeType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            await imageSourceGetMimeTypeTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0500",
                "test.gif", "image/gif", "uri");
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0600
         * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0600
         * @tc.desc   imageSourceGetMimeType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            await imageSourceGetMimeTypeTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0600",
                "moving_test.webp", "image/webp", "fd");
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0700
         * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0700
         * @tc.desc   imageSourceGetMimeType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            await imageSourceGetMimeTypeTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0700",
                "test.ico", "image/x-icon", "data");
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0800
         * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0800
         * @tc.desc   imageSourceGetMimeType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            await imageSourceGetMimeTypeTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0800",
                "test.dng", "image/x-adobe-dng", "rawfile");
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0900
         * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0900
         * @tc.desc   imageSourceGetMimeType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            if (!isSupportHEIFDecode) {
                console.info("device is not support heif decode");
                done();
            } else {
                await imageSourceGetMimeTypeTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_0900",
                    "HDRVividSingleLayer.heic", "image/heic", "uri");
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1000
         * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1000
         * @tc.desc   imageSourceGetMimeType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            await imageSourceGetMimeTypeTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1000",
                "mimeType_test.cr2", "image/x-canon-cr2", "fd");
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1100
         * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1100
         * @tc.desc   imageSourceGetMimeType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            await imageSourceGetMimeTypeTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1100",
                "mimeType_test.raf", "image/x-fuji-raf", "data");
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1200
         * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1200
         * @tc.desc   imageSourceGetMimeType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            await imageSourceGetMimeTypeTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1200",
                "mimeType_test.nef", "image/x-nikon-nef", "uri");
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1300
         * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1300
         * @tc.desc   imageSourceGetMimeType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            await imageSourceGetMimeTypeTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1300",
                "mimeType_test.nrw", "image/x-nikon-nrw", "uri");
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1400
         * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1400
         * @tc.desc   imageSourceGetMimeType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            await imageSourceGetMimeTypeTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1400",
                "mimeType_test.orf", "image/x-olympus-orf", "uri");
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1500
         * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1500
         * @tc.desc   imageSourceGetMimeType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            await imageSourceGetMimeTypeTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1500",
                "mimeType_test.rw2", "image/x-panasonic-rw2", "uri");
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1600
         * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1600
         * @tc.desc   imageSourceGetMimeType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            await imageSourceGetMimeTypeTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1600",
                "mimeType_test.pef", "image/x-pentax-pef", "uri");
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1700
         * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1700
         * @tc.desc   imageSourceGetMimeType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            await imageSourceGetMimeTypeTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1700",
                "mimeType_test.srw", "image/x-samsung-srw", "uri");
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1800
         * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1800
         * @tc.desc   imageSourceGetMimeType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            await imageSourceGetMimeTypeTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1800",
                "mimeType_test.arw", "image/x-sony-arw", "uri");
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1900
         * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1900
         * @tc.desc   imageSourceGetMimeType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            await imageSourceGetMimeTypeTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_1900",
                "test.wbmp", "image/wbmp", "uri");
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0100
         * @tc.desc   imageSourceGetMimeType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            await imageSourceGetMimeTypeTest(done,
                "SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0100", "wrong_suffix_png.gif",
                "image/png", "uri");
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0200
         * @tc.desc   imageSourceGetMimeType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            await imageSourceGetMimeTypeTest(done,
                "SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0200", "wrong_suffix_jpeg.png",
                "image/jpeg", "fd");
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0300
         * @tc.desc   imageSourceGetMimeType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            await imageSourceGetMimeTypeTest(done,
                "SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0300", "wrong_suffix_jpg.jpeg",
                "image/jpeg", "data");
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0400
         * @tc.desc   imageSourceGetMimeType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            await imageSourceGetMimeTypeTest(done,
                "SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0400", "wrong_suffix_bmp.dng",
                "image/bmp", "rawfile");
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0500
         * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0500
         * @tc.desc   imageSourceGetMimeType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            await imageSourceGetMimeTypeTest(done,
                "SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0500", "wrong_suffix_gif.tiff",
                "image/gif", "uri");
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0600
         * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0600
         * @tc.desc   imageSourceGetMimeType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            await imageSourceGetMimeTypeTest(done,
                "SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0600", "wrong_suffix_webp.ico",
                "image/webp", "fd");
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0700
         * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0700
         * @tc.desc   imageSourceGetMimeType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            await imageSourceGetMimeTypeTest(done,
                "SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0700", "wrong_suffix_ico.svg",
                "image/x-icon", "data");
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0800
         * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0800
         * @tc.desc   imageSourceGetMimeType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            await imageSourceGetMimeTypeTest(done,
                "SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0800", "wrong_suffix_dng.jpg",
                "image/x-adobe-dng", "rawfile");
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0900
         * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0900
         * @tc.desc   imageSourceGetMimeType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: Function) => {
            if (!isSupportHEIFDecode) {
                console.info("device is not support heif decode");
                done();
            } else {
                await imageSourceGetMimeTypeTest(done,
                    "SUB_MULTIMEDIA_IMAGE_SOURCE_IMAGESOURCEGETMIMETYPE_WRONG_SUFFIX_0900", "wrong_suffix_heic.png",
                    "image/heic", "uri");
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_GETMIMETYPE_ERROR_0100
         * @tc.number SUB_MULTIMEDIA_GETMIMETYPE_ERROR_0100
         * @tc.desc   imageSourceGetMimeType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_GETMIMETYPE_ERROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            await getMimeTypeTestError(done, "SUB_MULTIMEDIA_GETMIMETYPE_ERROR_0100", true);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_GETMIMETYPE_ERROR_0200
         * @tc.number SUB_MULTIMEDIA_GETMIMETYPE_ERROR_0200
         * @tc.desc   imageSourceGetMimeType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_GETMIMETYPE_ERROR_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            await getMimeTypeTestError(done, "SUB_MULTIMEDIA_GETMIMETYPE_ERROR_0200", false);
        })
    })
}