/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import image from '@ohos.multimedia.image'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import { base64Image, scale2x1, translate3x1, rotate90, flipH, testBmp, testGif, crop3x3, scale1x4, setAlpha8, translate1x3 } from './testImg2'
import { testPng, testJpg } from './testImg'
import fs from "@ohos.file.fs";
import featureAbility from '@ohos.ability.featureAbility'
import hdrCapability from '@ohos.graphics.hdrCapability';
import display from '@ohos.display';

export default function imagePixelMapFramework() {
    describe('imagePixelMapFramework', function () {
        let globalpixelmap;
        let globalImagesource;
        let globalreceiver;
        const WIDTH = 8192;
        const HEIGHT = 8;
        const CAPACITY = 8;
        const DEVICE_CODE = 801;
        const { JPEG: FORMATJPEG } = image.ImageFormat;
        const { RGB_565, RGBA_8888, BGRA_8888, RGB_888, ALPHA_8, RGBA_F16, NV21, NV12,
            RGBA_1010102, YCBCR_P010, YCRCB_P010 } = image.PixelMapFormat;
        const CONVERTPIXELFOMAT_ERRORCODE = 62980115;
        let context;
        let filesDir;
        beforeAll(async function () {
            console.info('beforeAll case');
            context = await featureAbility.getContext();
            filesDir = await context.getFilesDir();
        })

        beforeEach(function () {
            console.info('beforeEach case');
        })

        afterEach(async function () {
            if (globalpixelmap != undefined) {
                console.info("globalpixelmap release start");
                try {
                    await globalpixelmap.release();
                } catch (error) {
                    console.info("globalpixelmap release fail");
                }
            }
            if (globalImagesource != undefined) {
                console.info("globalpixelmap release start");
                try {
                    await globalImagesource.release();
                } catch (error) {
                    console.info("globalImagesource release fail");
                }
            }
            console.info('afterEach case');
        })

        afterAll(async function () {
            console.info('afterAll case');
        })
        const ERROT_CODE = 62980115;
        function genPicSource() {
            var data = testPng.buffer;
            return image.createImageSource(data);
        }

        async function genPixelMap() {
            var color = new ArrayBuffer(96);
            var bufferArr = new Uint8Array(color);
            for (var i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }

            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            return image.createPixelMap(color, opts);
        }

        function loger(caseName) {
            return {
                myName: caseName,
                log: function (msg) {
                    console.info(this.myName + ' ' + msg);
                }
            }
        }

        function fNumber(num) {
            if (num > 99) {
                return "" + num;
            }
            if (num > 9) {
                return "" + num;
            }
            return " " + num;
        }

        function dumpArray(logger, arr, row) {
            var tmpS = ''
            for (var i = 0; i < arr.length; i++) {
                tmpS = tmpS + fNumber(arr[i]) + ", "
                if (i % row == (row - 1)) {
                    logger.log(tmpS);
                    tmpS = '';
                }
            }
        }

        async function checkPixelMapInterface(done, logger, pixelMap, orgInfo, sizeCheck, data) {
            var newInfo = await pixelMap.getImageInfo()
            sizeCheck(done, logger, orgInfo, newInfo)
            var pixelSize = pixelMap.getPixelBytesNumber();
            logger.log(`new pixel size ${pixelSize}`);
            var readBuffer = new ArrayBuffer(pixelSize);
            await pixelMap.readPixelsToBuffer(readBuffer);
            var bufferArr2 = new Uint8Array(readBuffer);
            for (var i = 0; i < bufferArr2.length; i++) {
                if (bufferArr2[i] != data[i]) {
                    logger.log(`pixel[${i}] current[${bufferArr2[i]}] target[${data[i]}]`);
                    expect(false).assertTrue();
                    done();
                    break;
                }
            }
            expect(true).assertTrue();
            done();
        }

        async function pixelMapModifySizeTest(done, testNum, type, pixelMapInterface, sizeCheck, data, ...params) {
            let logger = loger(testNum)
            try {
                var pixelMap = await genPixelMap()
                logger.log("pixelMap " + (pixelMap != undefined));
                if (pixelMap != undefined) {
                    globalpixelmap = pixelMap;
                    var orgInfo = await pixelMap.getImageInfo()

                    if (type == 'callback') {
                        pixelMap[pixelMapInterface](...params, async () => {
                            await checkPixelMapInterface(done, logger, pixelMap, orgInfo, sizeCheck, data)
                        })
                    } else {
                        await pixelMap[pixelMapInterface](...params);
                        await checkPixelMapInterface(done, logger, pixelMap, orgInfo, sizeCheck, data)
                    }
                } else {
                    logger.log('create pixelMap fail ');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        }

        async function checkAlphaPixelmap(done, logger, alphaPixelMap) {
            logger.log("AlphaPixelMap " + alphaPixelMap);
            if (alphaPixelMap != undefined) {
                globalpixelmap = alphaPixelMap;
                var imageInfo = await alphaPixelMap.getImageInfo();
                logger.log("AlphaPixelMap pixelformat " + imageInfo.pixelFormat);
                expect(imageInfo.pixelFormat == 6).assertTrue();
                done();
            } else {
                logger.log('creat alphaPixelMap failed');
                expect(false).assertTrue();
                done();
            }
        }

        async function createAlphaPixelmapTest(done, testNum, type, imageData) {
            let logger = loger(testNum)
            try {
                let imageSource = image.createImageSource(imageData);
                logger.log("ImageSource " + (imageSource != undefined));
                if (imageSource != undefined) {
                    globalImagesource = imageSource;
                    let pixelMap = await imageSource.createPixelMap();
                    logger.log("PixelMap " + pixelMap);
                    if (pixelMap != undefined) {
                        globalpixelmap = pixelMap;
                        if (type == 'callback') {
                            pixelMap.createAlphaPixelmap(async (err, alphaPixelMap) => {
                                await checkAlphaPixelmap(done, logger, alphaPixelMap)
                            })
                        } else {
                            var alphaPixelMap = await pixelMap.createAlphaPixelmap();
                            await checkAlphaPixelmap(done, logger, alphaPixelMap)
                        }
                    } else {
                        logger.log('creat pixelMap failed');
                        expect(false).assertTrue();
                        done();
                    }
                } else {
                    logger.log('creat ImageSource failed');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        }

        async function sleep(times = 200) {
            await new Promise((res) =>
                setTimeout(() => {
                    res();
                }, times)
            );
        }
        
        async function checkStridePixelmap(done, logger, stridePixelMap) {
            logger.log("StridePixelMap " + stridePixelMap);
            if (stridePixelMap != undefined) {
                globalpixelmap = stridePixelMap;
                var imageInfo = await stridePixelMap.getImageInfo();
                logger.log("StridePixelMap pixelformat " + imageInfo.pixelFormat);
                expect(imageInfo.stride == imageInfo.size.width * 4).assertTrue();
                done();
            } else {
                logger.log('creat stridePixelMap failed');
                expect(false).assertTrue();
                done();
            }
        }

        async function createStridePixelmapTest(done, testNum, imageData) {
            let logger = loger(testNum);
            try {
                let imageSource = image.createImageSource(imageData);
                logger.log("ImageSource " + (imageSource != undefined));
                if (imageSource != undefined) {
                    globalImagesource = imageSource;
                    let pixelMap = await imageSource.createPixelMap();
                    logger.log("PixelMap " + pixelMap);
                    if (pixelMap != undefined) {
                        globalpixelmap = pixelMap;
                        await checkStridePixelmap(done, logger, pixelMap)
                        expect(true).assertTrue();
                        done();
                    }else{
                        logger.log('creat pixelMap failed');
                        expect(false).assertTrue();
                        done();
                    }
                } else {
                    logger.log('creat ImageSource failed');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        }

        async function getDensityTest(done, testNum, imageData, decodingOptions) {
            let logger = loger(testNum)
            try {
                var sourceOptions = { sourceDensity: 120 };
                let imageSource = image.createImageSource(imageData, sourceOptions);
                logger.log("ImageSource " + (imageSource != undefined));
                if (imageSource != undefined) {
                    globalImagesource = imageSource;
                    let pixelMap = await imageSource.createPixelMap(decodingOptions);
                    logger.log("PixelMap " + pixelMap);
                    if (pixelMap != undefined) {
                        globalpixelmap = pixelMap;
                        var density = pixelMap.getDensity();
                        logger.log("Density " + density);
                        expect(decodingOptions ? (density == 240) : (density == 120)).assertTrue();
                        done();
                    } else {
                        logger.log('creat pixelMap failed ');
                        expect(false).assertTrue();
                        done();
                    }
                } else {
                    logger.log('creat imageSource failed ');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        }

        async function setDensityTest(done, testNum, imageData) {
            let logger = loger(testNum)
            try {
                var sourceOptions = { sourceDensity: 120 };
                let imageSource = image.createImageSource(imageData, sourceOptions);
                logger.log("ImageSource " + (imageSource != undefined));
                if (imageSource != undefined) {
                    globalImagesource = imageSource;
                    let pixelMap = await imageSource.createPixelMap();
                    logger.log("PixelMap " + pixelMap);
                    if (pixelMap != undefined) {
                        globalpixelmap = pixelMap;
                        var density = pixelMap.getDensity();
                        logger.log("Density1 " + density);
                        pixelMap.setDensity(360);
                        density = pixelMap.getDensity();
                        logger.log("Density2 " + density);
                        expect(density == 360).assertTrue();
                        done();
                    } else {
                        logger.log('creat pixelMap failed ');
                        expect(false).assertTrue();
                        done();
                    }
                } else {
                    logger.log('creat imageSource failed ');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        }

        async function isStrideAlignmentTest(done, testNum, imageData) {
            let logger = loger(testNum)
            try {
                var sourceOptions = { sourceDensity: 120 };
                let imageSource = image.createImageSource(imageData, sourceOptions);
                logger.log("ImageSource " + (imageSource != undefined));
                if (imageSource != undefined) {
                    globalImagesource = imageSource;
                    let pixelMap = await imageSource.createPixelMap();
                    logger.log("PixelMap " + pixelMap);
                    if (pixelMap != undefined) {
                        globalpixelmap = pixelMap;
                        let ret = pixelMap.isStrideAlignment;
                        let imageInfo = await pixelMap.getImageInfo();
                        logger.log("pixelMap.isStrideAlignment " + ret);
                        if (ret == false) {
                            expect(imageInfo.size.width * 4 == imageInfo.stride, true).assertTrue();
                        } else {
                            if ((imageInfo.size.width  % 64) && (imageInfo.size.width > 512)) {
                                expect(imageInfo.size.width * 4 == imageInfo.stride, true).assertTrue();
                            } else {
                                expect(imageInfo.size.width * 4 == imageInfo.stride, false).assertTrue();
                            }
                        }
                        done();
                        if (ret == undefined) {
                            logger.log("pixelMap.isStrideAlignment is undefined");
                        }
                        done();
                    } else {
                        logger.log('creat pixelMap failed ');
                        expect(false).assertTrue();
                        done();
                    }
                } else {
                    logger.log('creat imageSource failed ');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        }

        async function pixelMapModifySizeTestErr(done, testNum, type, pixelMapInterface, ...params) {
            let logger = loger(testNum)
            try {
                var pixelMap = await genPixelMap();
                logger.log("pixelMap " + (pixelMap != undefined));
                if (pixelMap != undefined) {
                    globalpixelmap = pixelMap;
                    if (type == 'callback') {
                        pixelMap[pixelMapInterface](...params, async (error) => {
                            expect(error == ERROT_CODE);
                            done();
                        })
                    } else {
                        try {
                            await pixelMap[pixelMapInterface](...params);
                            expect(false).assertTrue();
                            done();
                        } catch (error) {
                            expect(error == ERROT_CODE);
                            done();
                        }
                    }
                } else {
                    logger.log('create pixelMap fail ');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        }

        async function opacityErr(done, testNum, param, type) {
            let logger = loger(testNum)
            try {
                var pixelMap = await genPixelMap();
                logger.log("pixelMap " + (pixelMap != undefined));
                if (pixelMap != undefined) {
                    globalpixelmap = pixelMap;
                    if (type == 'callback') {
                        pixelMap.opacity(param, (err) => {
                            expect(err == ERROT_CODE).assertTrue();
                            done();
                        })
                    } else {
                        try {
                            await pixelMap.opacity(param)
                            expect(false).assertTrue();
                            done();
                        } catch (error) {
                            expect(error == ERROT_CODE).assertTrue();
                            done();
                        }
                    }
                } else {
                    logger.log('creat pixelMap failed ');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        }

        async function setAlphaAbleErr(done, testNum, param) {
            let logger = loger(testNum)
            try {
                let imageSource = genPicSource();
                logger.log("ImageSource " + (imageSource != undefined));
                if (imageSource != undefined) {
                    globalImagesource = imageSource;
                    let pixelMap = await imageSource.createPixelMap();
                    logger.log("PixelMap " + pixelMap);
                    if (pixelMap != undefined) {
                        globalpixelmap = pixelMap;
                        try {
                            pixelMap.setAlphaAble(param);
                            expect(false).assertTrue();
                            done();
                        } catch (error) {
                            expect(error == ERROT_CODE);
                            done();
                        }
                    } else {
                        logger.log('create pixelmap failed ');
                        expect(false).assertTrue();
                        done();
                    }
                } else {
                    logger.log('create imagesource failed ');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        }

        async function setDensityErr(done, testNum, imageData, param) {
            let logger = loger(testNum)
            try {
                var sourceOptions = { sourceDensity: 120 };
                let imageSource = image.createImageSource(imageData, sourceOptions);
                logger.log("ImageSource " + (imageSource != undefined));
                if (imageSource != undefined) {
                    globalImagesource = imageSource;
                    let pixelMap = await imageSource.createPixelMap();
                    logger.log("PixelMap " + pixelMap);
                    if (pixelMap != undefined) {
                        globalpixelmap = pixelMap;
                        try {
                            pixelMap.setDensity(param);
                            expect(false).assertTrue();
                            done();
                        } catch (error) {
                            expect(true).assertTrue();
                            logger.log('err message: ' + error);
                            done();
                        }
                    } else {
                        logger.log('creat pixelMap failed ');
                        expect(false).assertTrue();
                        done();
                    }
                } else {
                    logger.log('creat imageSource failed ');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        }

        async function dumpPixelmap(logger, pixelmap) {
            var imageInfo = await pixelmap.getImageInfo();
            var pixelSize = pixelmap.getPixelBytesNumber();
            var readBuffer = new ArrayBuffer(pixelSize);
            await pixelmap.readPixelsToBuffer(readBuffer);
            var bufferArr = new Uint8Array(readBuffer);
            dumpArray(logger, bufferArr, imageInfo.size.width * 4);
        }

        function getBufferSize(height, width, format) {
            switch (format) {
                case RGBA_1010102:
                case RGBA_8888:
                case BGRA_8888:
                    return height * width * 4;
                case RGBA_F16:
                    return height * width * 8;
                case RGB_565:
                    return height * width * 2;
                case RGB_888:
                    return height * width * 3;
                case NV12:
                case NV21:
                    return height * width + ((height + 1) / 2) * ((width + 1) / 2) * 2;
                case YCBCR_P010:
                case YCRCB_P010:
                    return (height * width + (((height + 1) / 2) * ((width + 1) / 2) * 2)) * 2;
                default:
                    return 0;
            }
        }

        function getBuffer(fileName) {
            let filePath = filesDir + '/' + fileName;
            console.log('filePath:', filePath)
            let file = fs.openSync(filePath);
            const stats = fs.statSync(filePath);
            const fileSize = stats.size;
            const bufferRead = new ArrayBuffer(fileSize)
            fs.readSync(file.fd, bufferRead)
            return bufferRead;
        }
        
        async function createPixelMapByFormat(expectFormat) {
            let fileName;
            if (expectFormat == 10 || expectFormat == 11 || expectFormat == 12) {
                fileName = "CUVAHdrMulti.jpg";
            } else {
                fileName = "JPG-480360-YUV311.jpg";
            }
            let buffer = await getBuffer(fileName);
            let imageSource = image.createImageSource(buffer);
            let decodingOpt;
            if (expectFormat == 10 || expectFormat == 11 || expectFormat == 12) {
                decodingOpt = {
                    editable: true,
                    desiredPixelFormat: expectFormat,
                    desiredDynamicRange: image.DecodingDynamicRange.HDR
                } 
            } else if (expectFormat == 8 || expectFormat == 9) {
                decodingOpt = {
                    editable: true,
                    desiredPixelFormat: expectFormat
                }
            } else {
                decodingOpt = {
                    editable: true,
                    desiredPixelFormat: 8
                }
            }
            let pixelMap = await imageSource.createPixelMap(decodingOpt);
            if (pixelMap.getImageInfoSync().pixelFormat != expectFormat) {
                try {
                    await pixelMap.convertPixelFormat(expectFormat);
                } catch (error) {
                    console.info(`convertPixelFormat:${expectFormat} failed. ` + error)
                }
            }
            return pixelMap;
        }

        const checkConvertResult = (newInfo, dstPixelFormat) => {
            console.info("converted to dstPixelFormat : " + newInfo.pixelFormat);
            console.info(`pixelMap isHdr: ${newInfo.isHdr}`);
            let ret = newInfo.pixelFormat == dstPixelFormat;
            if (dstPixelFormat == RGBA_1010102 || dstPixelFormat == YCBCR_P010 || dstPixelFormat == YCRCB_P010) {
                ret = ret && (newInfo.isHdr == true);
            } else {
                ret = ret && (newInfo.isHdr == false);
            }
            return ret;
        }

        async function testConvertPixelFormat(done, testNum, srcPixelFormat, dstPixelFormat) {
            let logger = loger(testNum);
            try {
                let pixelMap = await createPixelMapByFormat(srcPixelFormat);
                if (pixelMap != undefined) {
                    globalpixelmap = pixelMap;
                    let orgImageInfo = pixelMap.getImageInfoSync();
                    expect(orgImageInfo.pixelFormat == srcPixelFormat).assertTrue();
                    await pixelMap.convertPixelFormat(dstPixelFormat);
                    let newImageInfo = pixelMap.getImageInfoSync();
                    expect(checkConvertResult(newImageInfo, dstPixelFormat)).assertTrue();
                    done();
                } else {
                    logger.log("pixelmap is undefined.");
                    expect().assertFail();
                    done();
                }
            } catch (error) {
                logger.log("failed. " + error);
                expect().assertFail();
                done();
            }
        }

        async function testConvertPixelFormatErr(done, testNum, srcPixelFormat, dstPixelFormat) {
            let logger = loger(testNum);
            try {
                let pixelMap = await createPixelMapByFormat(srcPixelFormat);
                if (pixelMap != undefined) {
                    globalpixelmap = pixelMap;
                    let orgImageInfo = pixelMap.getImageInfoSync();
                    expect(orgImageInfo.pixelFormat == srcPixelFormat).assertTrue();
                    await pixelMap.convertPixelFormat(dstPixelFormat);
                    expect(false).assertTrue();
                    done();
                } else {
                    logger.log("pixelmap is undefined.");
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log("failed. " + JSON.stringify(error));
                expect(error.code == CONVERTPIXELFOMAT_ERRORCODE).assertTrue();
                done();
            }
        }

        const isSupportHdr = () => {
            return !display.getDefaultDisplaySync().hdrFormats.includes(hdrCapability.HDRFormat.NONE) &&
              display.getDefaultDisplaySync().hdrFormats.length != 0
        }

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_BASE64_0100
         * @tc.name      : BASE64 Image
         * @tc.desc      : 1.create imagesource with base64Image
         *               : 2.create pixelmap
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_BASE64_0100', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_BASE64_0100')
            try {
                const imageSource = image.createImageSource(base64Image)
                logger.log("ImageSource " + (imageSource != undefined));
                if (imageSource != undefined) {
                    globalImagesource = imageSource;
                    let pixelMap = await imageSource.createPixelMap();
                    globalpixelmap = pixelMap;
                    logger.log("PixelMap " + (pixelMap != undefined));
                    expect(pixelMap != undefined).assertTrue();
                    done();
                } else {
                    logger.log("ImageSource undefined");
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_PROMISE_0100
         * @tc.name      : Pixelmap Scale-promise
         * @tc.desc      : 1.create pixelmap
         *               : 2.call scale
         *               : 3.get pixelbytesnumber
         *               : 4.read pixels to buffer
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_PROMISE_0100', 0, async function (done) {
            function sizeCheck(done, logger, orgInfo, newInfo) {
                if (newInfo.size.width != orgInfo.size.width * 2) {
                    logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
                    expect(false).assertTrue();
                    done()
                }
            }
            await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_PROMISE_0100', 'promise', 'scale', sizeCheck, scale2x1, 2.0, 1.0)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_PROMISE_0200
         * @tc.name      : Pixelmap Scale-promise
         * @tc.desc      : 1.create pixelmap
         *               : 2.call scale
         *               : 3.get pixelbytesnumber
         *               : 4.read pixels to buffer
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_PROMISE_0200', 0, async function (done) {
            function sizeCheck(done, logger, orgInfo, newInfo) {
                if (newInfo.size.height != orgInfo.size.height * 4) {
                    logger.log(`org height ${orgInfo.size.height}, new height ${newInfo.size.height} `);
                    expect(false).assertTrue();
                    done()
                }
            }
            await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_PROMISE_0200', 'promise', 'scale', sizeCheck, scale1x4, 1.0, 4.0)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_CALLBACK_0100
         * @tc.name      : Pixelmap Scale-callback
         * @tc.desc      : 1.create pixelmap
         *               : 2.call scale
         *               : 3.get pixelbytesnumber
         *               : 4.read pixels to buffer
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_CALLBACK_0100', 0, async function (done) {
            function sizeCheck(done, logger, orgInfo, newInfo) {
                if (newInfo.size.height != orgInfo.size.height * 4) {
                    logger.log(`org height ${orgInfo.size.height}, new height ${newInfo.size.height} `);
                    expect(false).assertTrue();
                    done()
                }
            }
            await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_CALLBACK_0100', 'callback', 'scale', sizeCheck, scale1x4, 1.0, 4.0)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_PROMISE_0100
         * @tc.name      : Pixelmap Translate -promise
         * @tc.desc      : 1.create pixelmap
         *               : 2.call translate
         *               : 3.get pixelbytesnumber
         *               : 4.read pixels to buffer
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_PROMISE_0100', 0, async function (done) {
            function sizeCheck(done, logger, orgInfo, newInfo) {
                if (newInfo.size.width != orgInfo.size.width + 3) {
                    logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
                    expect(false).assertTrue();
                    done();
                }
            }
            await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_PROMISE_0100', 'promise', 'translate', sizeCheck, translate3x1, 3.0, 1.0)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_PROMISE_0200
         * @tc.name      : Pixelmap Translate-promise
         * @tc.desc      : 1.create pixelmap
         *               : 2.call translate
         *               : 3.get pixelbytesnumber
         *               : 4.read pixels to buffer
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_PROMISE_0200', 0, async function (done) {
            function sizeCheck(done, logger, orgInfo, newInfo) {
                if (newInfo.size.height != orgInfo.size.height + 3) {
                    logger.log(`org height ${orgInfo.size.height}, new height ${newInfo.size.height} `);
                    expect(false).assertTrue();
                    done();
                }
            }
            await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_PROMISE_0200', 'promise', 'translate', sizeCheck, translate1x3, 1.0, 3.0)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_CALLBACK_0100
         * @tc.name      : Pixelmap Translate-callback
         * @tc.desc      : 1.create pixelmap
         *               : 2.call translate
         *               : 3.get pixelbytesnumber
         *               : 4.read pixels to buffer
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_CALLBACK_0100', 0, async function (done) {
            function sizeCheck(done, logger, orgInfo, newInfo) {
                if (newInfo.size.height != orgInfo.size.height + 3) {
                    logger.log(`org height ${orgInfo.size.height}, new height ${newInfo.size.height} `);
                    expect(false).assertTrue();
                    done();
                }
            }
            await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_CALLBACK_0100', 'callback', 'translate', sizeCheck, translate1x3, 1.0, 3.0)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_PROMISE_0100
         * @tc.name      : Pixelmap Rotate-promise
         * @tc.desc      : 1.create pixelmap
         *               : 2.call rotate
         *               : 3.get pixelbytesnumber
         *               : 4.read pixels to buffer
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_PROMISE_0100', 0, async function (done) {
            function sizeCheck(done, logger, orgInfo, newInfo) {
                if (newInfo.size.width != orgInfo.size.height) {
                    logger.log(`org height ${orgInfo.size.height}, new width ${newInfo.size.width} `);
                    expect(false).assertTrue();
                    done();
                }
            }
            await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_PROMISE_0100', 'promise', 'rotate', sizeCheck, rotate90, 90.0)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_CALLBACK_0100
         * @tc.name      : Pixelmap Rotate-callback
         * @tc.desc      : 1.create pixelmap
         *               : 2.call rotate
         *               : 3.get pixelbytesnumber
         *               : 4.read pixels to buffer
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_CALLBACK_0100', 0, async function (done) {
            function sizeCheck(done, logger, orgInfo, newInfo) {
                if (newInfo.size.width != orgInfo.size.height) {
                    logger.log(`org height ${orgInfo.size.height}, new width ${newInfo.size.width} `);
                    expect(false).assertTrue();
                    done();
                }
            }
            await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_CALLBACK_0100', 'callback', 'rotate', sizeCheck, rotate90, 90.0)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_PROMISE_0100
         * @tc.name      : Pixelmap Flip-promise
         * @tc.desc      : 1.create pixelmap
         *               : 2.call flip
         *               : 3.get pixelbytesnumber
         *               : 4.read pixels to buffer
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_PROMISE_0100', 0, async function (done) {
            function sizeCheck(done, logger, orgInfo, newInfo) {
                if (newInfo.size.width != orgInfo.size.width) {
                    logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
                    expect(false).assertTrue();
                    done();
                }
            }
            await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_PROMISE_0100', 'promise', 'flip', sizeCheck, flipH, false, true)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_CALLBACK_0100
         * @tc.name      : Pixelmap Flip-callback
         * @tc.desc      : 1.create pixelmap
         *               : 2.call flip
         *               : 3.get pixelbytesnumber
         *               : 4.read pixels to buffer
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_CALLBACK_0100', 0, async function (done) {
            function sizeCheck(done, logger, orgInfo, newInfo) {
                if (newInfo.size.width != orgInfo.size.width) {
                    logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
                    expect(false).assertTrue();
                    done();
                }
            }
            await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_CALLBACK_0100', 'callback', 'flip', sizeCheck, flipH, false, true)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_ISSUPPORTALPHA_SETSUPPORTALPHA_0100
         * @tc.name      : isSupportAlpha SetSupportAlpha
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.call setAlphaAble
         *               : 4.call isSupportAlpha
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_ISSUPPORTALPHA_SETSUPPORTALPHA_0100', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_ISSUPPORTALPHA_SETSUPPORTALPHA_0100')
            try {
                let imageSource = genPicSource();
                logger.log("ImageSource " + (imageSource != undefined));
                if (imageSource != undefined) {
                    globalImagesource = imageSource;
                    let pixelMap = await imageSource.createPixelMap();
                    logger.log("PixelMap " + pixelMap);
                    if (pixelMap != undefined) {
                        globalpixelmap = pixelMap;
                        var supportAlpha = pixelMap.isSupportAlpha();
                        logger.log("isSupportAlpha before " + supportAlpha);
                        pixelMap.setAlphaAble(false);
                        var supportAlpha1 = pixelMap.isSupportAlpha();
                        logger.log("isSupportAlpha after " + supportAlpha1);
                        expect(supportAlpha1 == false).assertTrue();
                        done();
                    } else {
                        logger.log('create pixelmap failed ');
                        expect(false).assertTrue();
                        done();
                    }
                } else {
                    logger.log('create imagesource failed ');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        })
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_PROMISE_0100
         * @tc.name      : createAlphaPixelmap-promise
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.create AlphaPixelmap
         *               : 4.call getImageInfo
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_PROMISE_0100', 0, async function (done) {
            var imageData = testPng.buffer;
            await createAlphaPixelmapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_PROMISE_0100', 'promise', imageData);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_CALLBACK_0100
         * @tc.name      : createAlphaPixelmap-callback
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.create AlphaPixelmap
         *               : 4.call getImageInfo
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_CALLBACK_0100', 0, async function (done) {
            var imageData = testPng.buffer;
            await createAlphaPixelmapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_CALLBACK_0100', 'callback', imageData);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_0100
         * @tc.name      : createAlphaPixelmap-Jpg
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.create AlphaPixelmap
         *               : 4.call getImageInfo
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_0100', 0, async function (done) {
            var imageData = testJpg.buffer;
            await createAlphaPixelmapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_0100', 'promise', imageData);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_0200
         * @tc.name      : createAlphaPixelmap
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.create AlphaPixelmap
         *               : 4.call getImageInfo
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_0200', 0, async function (done) {
            var imageData = testBmp.buffer;
            await createAlphaPixelmapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_0200', 'promise', imageData);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_0300
         * @tc.name      : createAlphaPixelmap
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.create AlphaPixelmap
         *               : 4.call getImageInfo
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_0300', 0, async function (done) {
            var imageData = testGif.buffer;
            await createAlphaPixelmapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_0300', 'promise', imageData);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETALPHA_PROMISE_0100
         * @tc.name      : setAlpha-promise
         * @tc.desc      : 1.create pixelmap
         *               : 2.setAlpha
         *               : 3.get PixelBytesNumber
         *               : 4.read Pixels To Buffer
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETALPHA_PROMISE_0100', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETALPHA_PROMISE_0100')
            try {
                var pixelMap = await genPixelMap()
                logger.log("pixelMap " + (pixelMap != undefined));
                if (pixelMap != undefined) {
                    globalpixelmap = pixelMap;
                    await pixelMap.opacity(0.8)
                    var pixelSize = pixelMap.getPixelBytesNumber();
                    logger.log(`new pixel size ${pixelSize}`);
                    var readBuffer = new ArrayBuffer(pixelSize);
                    await pixelMap.readPixelsToBuffer(readBuffer);
                    var bufferArr2 = new Uint8Array(readBuffer);
                    for (var i = 0; i < bufferArr2.length; i++) {
                        if (bufferArr2[i] != setAlpha8[i]) {
                            logger.log(`pixel[${i}] current[${bufferArr2[i]}] target[${setAlpha8[i]}]`);
                            expect(false).assertTrue();
                            break;
                        }
                    }
                    expect(true).assertTrue();
                    done();
                } else {
                    logger.log('creat pixelMap failed ');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETALPHA_CALLBACK_0100
         * @tc.name      : setAlpha -callback
         * @tc.desc      : 1.create pixelmap
         *               : 2.setAlpha
         *               : 3.get PixelBytesNumber
         *               : 4.read Pixels To Buffer
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETALPHA_CALLBACK_0100', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETALPHA_CALLBACK_0100')
            try {
                var pixelMap = await genPixelMap()
                logger.log("pixelMap " + (pixelMap != undefined));
                if (pixelMap != undefined) {
                    globalpixelmap = pixelMap;
                    pixelMap.opacity(0.8, async (err) => {
                        var pixelSize = pixelMap.getPixelBytesNumber();
                        logger.log(`new pixel size ${pixelSize}`);
                        var readBuffer = new ArrayBuffer(pixelSize);
                        await pixelMap.readPixelsToBuffer(readBuffer);
                        var bufferArr2 = new Uint8Array(readBuffer);
                        for (var i = 0; i < bufferArr2.length; i++) {
                            if (bufferArr2[i] != setAlpha8[i]) {
                                logger.log(`pixel[${i}] current[${bufferArr2[i]}] target[${setAlpha8[i]}]`);
                                expect(false).assertTrue();
                                break;
                            }
                        }
                        expect(true).assertTrue();
                        done();
                    })
                } else {
                    logger.log('creat pixelMap failed ');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SOURCEOPTIONS_GETDENSITY_FITDENSITY_0100
         * @tc.name      : SourceOptions getDensity fitDensity
         * @tc.desc      : 1.create ImageSource
         *               : 2.create PixelMap
         *               : 3.getDensity
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SOURCEOPTIONS_GETDENSITY_FITDENSITY_0100', 0, async function (done) {
            var imageData = testPng.buffer;
            await getDensityTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SOURCEOPTIONS_GETDENSITY_FITDENSITY_0100', imageData)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_FITDENSITY_0100
         * @tc.name      : fitDensity
         * @tc.desc      : 1.create ImageSource
         *               : 2.create PixelMap with fitDensity
         *               : 3.getDensity
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_FITDENSITY_0100', 0, async function (done) {
            var imageData = testPng.buffer;
            let decodingOptions = { fitDensity: 240 };
            await getDensityTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_FITDENSITY_0100', imageData, decodingOptions)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_FITDENSITY_0200
         * @tc.name      : setDensity
         * @tc.desc      : 1.create ImageSource
         *               : 2.create PixelMap
         *               : 3.set Density
         *               : 4.getDensity
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_FITDENSITY_0200', 0, async function (done) {
            var imageData = testPng.buffer;
            await setDensityTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_FITDENSITY_0200', imageData)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SOURCEOPTIONS_GETDENSITY_FITDENSITY_0200
         * @tc.name      : SourceOptions getDensity fitDensity
         * @tc.desc      : 1.create ImageSource
         *               : 2.create PixelMap
         *               : 3.getDensity
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SOURCEOPTIONS_GETDENSITY_FITDENSITY_0200', 0, async function (done) {
            var imageData = testJpg.buffer;
            await getDensityTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SOURCEOPTIONS_GETDENSITY_FITDENSITY_0200', imageData)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SOURCEOPTIONS_GETDENSITY_FITDENSITY_0300
         * @tc.name      : SourceOptions getDensity fitDensity
         * @tc.desc      : 1.create ImageSource
         *               : 2.create PixelMap
         *               : 3.getDensity
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SOURCEOPTIONS_GETDENSITY_FITDENSITY_0300', 0, async function (done) {
            var imageData = testBmp.buffer;
            await getDensityTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SOURCEOPTIONS_GETDENSITY_FITDENSITY_0300', imageData)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SOURCEOPTIONS_GETDENSITY_FITDENSITY_0400
         * @tc.name      : SourceOptions getDensity fitDensity
         * @tc.desc      : 1.create ImageSource
         *               : 2.create PixelMap
         *               : 3.getDensity
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SOURCEOPTIONS_GETDENSITY_FITDENSITY_0400', 0, async function (done) {
            var imageData = testGif.buffer;
            await getDensityTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SOURCEOPTIONS_GETDENSITY_FITDENSITY_0400', imageData)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_FITDENSITY_0300
         * @tc.name      : fitDensity-JPG
         * @tc.desc      : 1.create ImageSource
         *               : 2.create PixelMap with fitDensity
         *               : 3.getDensity
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_FITDENSITY_0300', 0, async function (done) {
            var imageData = testJpg.buffer;
            let decodingOptions = { fitDensity: 240 };
            await getDensityTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_FITDENSITY_0300', imageData, decodingOptions)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_FITDENSITY_0400
         * @tc.name      : fitDensity-bmp
         * @tc.desc      : 1.create ImageSource
         *               : 2.create PixelMap with fitDensity
         *               : 3.getDensity
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_FITDENSITY_0400', 0, async function (done) {
            var imageData = testBmp.buffer;
            let decodingOptions = { fitDensity: 240 };
            await getDensityTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_FITDENSITY_0400', imageData, decodingOptions)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_FITDENSITY_0500
         * @tc.name      : fitDensity-gif
         * @tc.desc      : 1.create ImageSource
         *               : 2.create PixelMap with fitDensity
         *               : 3.getDensity
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_FITDENSITY_0500', 0, async function (done) {
            var imageData = testGif.buffer;
            let decodingOptions = { fitDensity: 240 };
            await getDensityTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_FITDENSITY_0500', imageData, decodingOptions)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETDENSITY_0100
         * @tc.name      : setDensity-Jpg
         * @tc.desc      : 1.create ImageSource
         *               : 2.create PixelMap
         *               : 3.set Density
         *               : 4.getDensity
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETDENSITY_0100', 0, async function (done) {
            var imageData = testJpg.buffer;
            await setDensityTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETDENSITY_0100', imageData)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETDENSITY_0200
         * @tc.name      : setDensity-bmp
         * @tc.desc      : 1.create ImageSource
         *               : 2.create PixelMap
         *               : 3.set Density
         *               : 4.getDensity
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETDENSITY_0200', 0, async function (done) {
            var imageData = testBmp.buffer;
            await setDensityTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETDENSITY_0200', imageData)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETDENSITY_0300
         * @tc.name      : setDensity-gif
         * @tc.desc      : 1.create ImageSource
         *               : 2.create PixelMap
         *               : 3.set Density
         *               : 4.getDensity
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETDENSITY_0300', 0, async function (done) {
            var imageData = testGif.buffer;
            await setDensityTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETDENSITY_0300', imageData)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_PROMISE_0100
         * @tc.name      : crop-promise
         * @tc.desc      : 1.create PixelMap
         *               : 2.crop
         *               : 3.getImageInfo
         *               : 4.getPixelBytesNumber
         *               : 5.readPixelsToBuffer
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_PROMISE_0100', 0, async function (done) {
            var region = { size: { height: 3, width: 3 }, x: 1, y: 1 };
            function sizeCheck(done, logger, orgInfo, newInfo) {
                orgInfo = region;
                if (newInfo.size.width != orgInfo.size.width) {
                    logger.log(`orgInfo width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
                    expect(false).assertTrue();
                    done();
                }
            }
            await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_PROMISE_0100', 'promise', 'crop', sizeCheck, crop3x3, region)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_CALLBACK_0100
         * @tc.name      : crop -callback
         * @tc.desc      : 1.create PixelMap
         *               : 2.crop
         *               : 3.getImageInfo
         *               : 4.getPixelBytesNumber
         *               : 5.readPixelsToBuffer
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_CALLBACK_0100', 0, async function (done) {
            var region = { size: { height: 3, width: 3 }, x: 1, y: 1 };
            function sizeCheck(done, logger, orgInfo, newInfo) {
                orgInfo = region;
                if (newInfo.size.width != orgInfo.size.width) {
                    logger.log(`orgInfo width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
                    expect(false).assertTrue();
                    done();
                }
            }
            await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_CALLBACK_0100', 'callback', 'crop', sizeCheck, crop3x3, region)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_ERROR_PROMISE_0100
         * @tc.name      : Pixelmap Scale-promise-wrong x
         * @tc.desc      : 1.create pixelmap
         *               : 2.call scale
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_ERROR_PROMISE_0100', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_ERROR_PROMISE_0100', 'promise', 'scale', { a: 10 }, 1.0)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_ERROR_PROMISE_0200
         * @tc.name      : Pixelmap Scale-promise-wrong x
         * @tc.desc      : 1.create pixelmap
         *               : 2.call scale
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_ERROR_PROMISE_0200', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_ERROR_PROMISE_0200', 'promise', 'scale', 'a', 1.0)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_ERROR_PROMISE_0300
         * @tc.name      : Pixelmap Scale-promise-wrong y
         * @tc.desc      : 1.create pixelmap
         *               : 2.call scale
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_ERROR_PROMISE_0300', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_ERROR_PROMISE_0300', 'promise', 'scale', 1.0, null)

        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_ERROR_PROMISE_0400
         * @tc.name      : Pixelmap Scale-promise-wrong y
         * @tc.desc      : 1.create pixelmap
         *               : 2.call scale
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_ERROR_PROMISE_0400', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_ERROR_PROMISE_0400', 'promise', 'scale', 1.0, true)

        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_ERROR_CALLBACK_0100
         * @tc.name      : Pixelmap Scale-callback-wrong x
         * @tc.desc      : 1.create pixelmap
         *               : 2.call scale
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_ERROR_CALLBACK_0100', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_ERROR_CALLBACK_0100', 'callback', 'scale', { a: 10 }, 1.0)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_ERROR_CALLBACK_0200
         * @tc.name      : Pixelmap Scale-callback-wrong x
         * @tc.desc      : 1.create pixelmap
         *               : 2.call scale
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_ERROR_CALLBACK_0200', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_ERROR_CALLBACK_0200', 'callback', 'scale', 'a', 1.0)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_ERROR_CALLBACK_0300
         * @tc.name      : Pixelmap Scale-callback-wrong y
         * @tc.desc      : 1.create pixelmap
         *               : 2.call scale
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_ERROR_CALLBACK_0300', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_ERROR_CALLBACK_0300', 'callback', 'scale', 1.0, null)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_ERROR_CALLBACK_0400
         * @tc.name      : Pixelmap Scale-callback-wrong y
         * @tc.desc      : 1.create pixelmap
         *               : 2.call scale
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_ERROR_CALLBACK_0400', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_SCALE_ERROR_CALLBACK_0400', 'callback', 'scale', 1.0, true)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_ERROR_PROMISE_0100
         * @tc.name      : Pixelmap Translate -promise-wrong x
         * @tc.desc      : 1.create pixelmap
         *               : 2.call translate
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_ERROR_PROMISE_0100', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_ERROR_PROMISE_0100', 'promise', 'translate', { a: 10 }, 1.0)
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_ERROR_PROMISE_0200
        * @tc.name      : Pixelmap Translate -promise-wrong x
        * @tc.desc      : 1.create pixelmap
        *               : 2.call translate
        * @tc.size      : MEDIUM 
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_ERROR_PROMISE_0200', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_ERROR_PROMISE_0200', 'promise', 'translate', 'a', 1.0)
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_ERROR_PROMISE_0300
        * @tc.name      : Pixelmap Translate -promise-wrong y
        * @tc.desc      : 1.create pixelmap
        *               : 2.call translate
        * @tc.size      : MEDIUM 
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_ERROR_PROMISE_0300', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_ERROR_PROMISE_0300', 'promise', 'translate', 1.0, null)
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_ERROR_PROMISE_0400
        * @tc.name      : Pixelmap Translate -promise-wrong y
        * @tc.desc      : 1.create pixelmap
        *               : 2.call translate
        * @tc.size      : MEDIUM 
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_ERROR_PROMISE_0400', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_ERROR_PROMISE_0400', 'promise', 'translate', 1.0, false)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_ERROR_CALLBACK_0100
         * @tc.name      : Pixelmap Translate -callback-wrong x
         * @tc.desc      : 1.create pixelmap
         *               : 2.call translate
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_ERROR_CALLBACK_0100', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_ERROR_CALLBACK_0100', 'callback', 'translate', { a: 10 }, 1.0)
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_ERROR_CALLBACK_0200
        * @tc.name      : Pixelmap Translate -callback-wrong x
        * @tc.desc      : 1.create pixelmap
        *               : 2.call translate
        * @tc.size      : MEDIUM 
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_ERROR_CALLBACK_0200', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_ERROR_CALLBACK_0200', 'callback', 'translate', 'a', 1.0)
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_ERROR_CALLBACK_0300
        * @tc.name      : Pixelmap Translate -callback-wrong y
        * @tc.desc      : 1.create pixelmap
        *               : 2.call translate
        * @tc.size      : MEDIUM 
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_ERROR_CALLBACK_0300', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_ERROR_CALLBACK_0300', 'callback', 'translate', 1.0, null)
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_ERROR_CALLBACK_0400
        * @tc.name      : Pixelmap Translate -callback-wrong y
        * @tc.desc      : 1.create pixelmap
        *               : 2.call translate
        * @tc.size      : MEDIUM 
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_ERROR_CALLBACK_0400', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_TRANSLATE_ERROR_CALLBACK_0400', 'callback', 'translate', 1.0, false)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_ERROR_ANGLE_PROMISE_0100
         * @tc.name      : Pixelmap Rotate-promise-wrong angle
         * @tc.desc      : 1.create pixelmap
         *               : 2.call rotate
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_ERROR_ANGLE_PROMISE_0100', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_ERROR_ANGLE_PROMISE_0100', 'promise', 'rotate', 'a')
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_ERROR_ANGLE_PROMISE_0200
         * @tc.name      : Pixelmap Rotate-promise-wrong angle
         * @tc.desc      : 1.create pixelmap
         *               : 2.call rotate
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_ERROR_ANGLE_PROMISE_0200', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_ERROR_ANGLE_PROMISE_0200', 'promise', 'rotate', { a: 10 })
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_ERROR_ANGLE_PROMISE_0300
         * @tc.name      : Pixelmap Rotate-promise-wrong angle
         * @tc.desc      : 1.create pixelmap
         *               : 2.call rotate
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_ERROR_ANGLE_PROMISE_0300', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_ERROR_ANGLE_PROMISE_0300', 'promise', 'rotate', null)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_ERROR_ANGLE_PROMISE_0400
         * @tc.name      : Pixelmap Rotate-promise-wrong angle
         * @tc.desc      : 1.create pixelmap
         *               : 2.call rotate
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_ERROR_ANGLE_PROMISE_0400', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_ERROR_ANGLE_PROMISE_0400', 'promise', 'rotate', false)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_ERROR_ANGLE_CALLBACK_0100
         * @tc.name      : Pixelmap Rotate-callback-wrong angle
         * @tc.desc      : 1.create pixelmap
         *               : 2.call rotate
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_ERROR_ANGLE_CALLBACK_0100', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_ERROR_ANGLE_CALLBACK_0100', 'callback', 'rotate', 'a')
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_ERROR_ANGLE_CALLBACK_0200
         * @tc.name      : Pixelmap Rotate-callback-wrong angle
         * @tc.desc      : 1.create pixelmap
         *               : 2.call rotate
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_ERROR_ANGLE_CALLBACK_0200', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_ERROR_ANGLE_CALLBACK_0200', 'callback', 'rotate', { a: 10 })
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_ERROR_ANGLE_CALLBACK_0300
         * @tc.name      : Pixelmap Rotate-callback-wrong angle
         * @tc.desc      : 1.create pixelmap
         *               : 2.call rotate
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_ERROR_ANGLE_CALLBACK_0300', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_ERROR_ANGLE_CALLBACK_0300', 'callback', 'rotate', null)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_ERROR_ANGLE_CALLBACK_0400
         * @tc.name      : Pixelmap Rotate-callback-wrong angle
         * @tc.desc      : 1.create pixelmap
         *               : 2.call rotate
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_ERROR_ANGLE_CALLBACK_0400', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_ERROR_ANGLE_CALLBACK_0400', 'callback', 'rotate', false)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_ERROR_PROMISE_0100
         * @tc.name      : Pixelmap Flip-promise-wrong x
         * @tc.desc      : 1.create pixelmap
         *               : 2.call flip
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_ERROR_PROMISE_0100', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_ERROR_PROMISE_0100', 'promise', 'flip', 'false', true)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_ERROR_PROMISE_0200
         * @tc.name      : Pixelmap Flip-promise-wrong x
         * @tc.desc      : 1.create pixelmap
         *               : 2.call flip
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_ERROR_PROMISE_0200', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_ERROR_PROMISE_0200', 'promise', 'flip', 1, true)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_ERROR_PROMISE_0300
         * @tc.name      : Pixelmap Flip-promise-wrong y
         * @tc.desc      : 1.create pixelmap
         *               : 2.call flip
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_ERROR_PROMISE_0300', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_ERROR_PROMISE_0300', 'promise', 'flip', true, { a: 10 })
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_ERROR_PROMISE_0400
         * @tc.name      : Pixelmap Flip-promise-wrong y
         * @tc.desc      : 1.create pixelmap
         *               : 2.call flip
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_ERROR_PROMISE_0400', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_ERROR_PROMISE_0400', 'promise', 'flip', true, null)
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_ERROR_CALLBACK_0100
        * @tc.name      : Pixelmap Flip-callback-wrong x
        * @tc.desc      : 1.create pixelmap
        *               : 2.call flip
        * @tc.size      : MEDIUM 
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_ERROR_CALLBACK_0100', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_ERROR_CALLBACK_0100', 'callback', 'flip', 'false', true)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_ERROR_CALLBACK_0200
         * @tc.name      : Pixelmap Flip-callback-wrong x
         * @tc.desc      : 1.create pixelmap
         *               : 2.call flip
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_ERROR_CALLBACK_0200', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_ERROR_CALLBACK_0200', 'callback', 'flip', 1, true)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_ERROR_CALLBACK_0300
         * @tc.name      : Pixelmap Flip-callback-wrong y
         * @tc.desc      : 1.create pixelmap
         *               : 2.call flip
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_ERROR_CALLBACK_0300', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_ERROR_CALLBACK_0300', 'callback', 'flip', true, { a: 10 })
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_ERROR_CALLBACK_0400
         * @tc.name      : Pixelmap Flip-callback-wrong y
         * @tc.desc      : 1.create pixelmap
         *               : 2.call flip
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_ERROR_CALLBACK_0400', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_ERROR_CALLBACK_0400', 'callback', 'flip', true, null)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETSUPPORTALPHA_ERROR_ALPHA_0100
         * @tc.name      : SetSupportAlpha-wrong alpha
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.call setAlphaAble
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETSUPPORTALPHA_ERROR_ALPHA_0100', 0, async function (done) {
            setAlphaAbleErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETSUPPORTALPHA_ERROR_ALPHA_0100', 'a')
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETSUPPORTALPHA_ERROR_ALPHA_0200
         * @tc.name      : SetSupportAlpha-wrong alpha
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.call setAlphaAble
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETSUPPORTALPHA_ERROR_ALPHA_0200', 0, async function (done) {
            setAlphaAbleErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETSUPPORTALPHA_ERROR_ALPHA_0200', { a: 1 })
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETSUPPORTALPHA_ERROR_ALPHA_0300
         * @tc.name      : SetSupportAlpha-wrong alpha
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.call setAlphaAble
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETSUPPORTALPHA_ERROR_ALPHA_0300', 0, async function (done) {
            setAlphaAbleErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETSUPPORTALPHA_ERROR_ALPHA_0300', null)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETSUPPORTALPHA_ERROR_ALPHA_0400
         * @tc.name      : SetSupportAlpha-wrong alpha
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.call setAlphaAble
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETSUPPORTALPHA_ERROR_ALPHA_0400', 0, async function (done) {
            setAlphaAbleErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETSUPPORTALPHA_ERROR_ALPHA_0400', 1)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_PROMISE_SIZE_0100
         * @tc.name      : crop-promise- size: { height: 3, width: 3 }, x: -1, y: 1
         * @tc.desc      : 1.create PixelMap
         *               : 2.crop
         *               : 3.getImageInfo
         *               : 4.getPixelBytesNumber
         *               : 5.readPixelsToBuffer
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_PROMISE_SIZE_0100', 0, async function (done) {
            var region = { size: { height: 3, width: 3 }, x: -1, y: 1 };
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_PROMISE_SIZE_0100', 'promise', 'crop', region)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_PROMISE_SIZE_0200
         * @tc.name      : crop-promise-size: { height: 3, width: 3 }, x: 1, y: -1
         * @tc.desc      : 1.create PixelMap
         *               : 2.crop
         *               : 3.getImageInfo
         *               : 4.getPixelBytesNumber
         *               : 5.readPixelsToBuffer
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_PROMISE_SIZE_0200', 0, async function (done) {
            var region = { size: { height: 3, width: 3 }, x: 1, y: -1 };
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_PROMISE_SIZE_0200', 'promise', 'crop', region)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_PROMISE_SIZE_0300
         * @tc.name      : crop-promise-size: { height: 3, width: -3 }, x: 1, y: 1
         * @tc.desc      : 1.create PixelMap
         *               : 2.crop
         *               : 3.getImageInfo
         *               : 4.getPixelBytesNumber
         *               : 5.readPixelsToBuffer
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_PROMISE_SIZE_0300', 0, async function (done) {
            var region = { size: { height: 3, width: -3 }, x: 1, y: 1 };
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_PROMISE_SIZE_0300', 'promise', 'crop', region)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_PROMISE_SIZE_0400
         * @tc.name      : crop-promise-size: { height: -3, width: 3 }, x: 1, y: 1
         * @tc.desc      : 1.create PixelMap
         *               : 2.crop
         *               : 3.getImageInfo
         *               : 4.getPixelBytesNumber
         *               : 5.readPixelsToBuffer
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_PROMISE_SIZE_0400', 0, async function (done) {
            var region = { size: { height: -3, width: 3 }, x: 1, y: 1 };
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_PROMISE_SIZE_0400', 'promise', 'crop', region)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_CALLBACK_SIZE_0100
         * @tc.name      : crop-callback-size: { height: 3, width: 3 }, x: -1, y: 1
         * @tc.desc      : 1.create PixelMap
         *               : 2.crop
         *               : 3.getImageInfo
         *               : 4.getPixelBytesNumber
         *               : 5.readPixelsToBuffer
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_CALLBACK_SIZE_0100', 0, async function (done) {
            var region = { size: { height: 3, width: 3 }, x: -1, y: 1 };
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_CALLBACK_SIZE_0100', 'callback', 'crop', region)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_CALLBACK_SIZE_0200
         * @tc.name      : crop-callback-size: { height: 3, width: 3 }, x: 1, y: -1
         * @tc.desc      : 1.create PixelMap
         *               : 2.crop
         *               : 3.getImageInfo
         *               : 4.getPixelBytesNumber
         *               : 5.readPixelsToBuffer
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_CALLBACK_SIZE_0200', 0, async function (done) {
            var region = { size: { height: 3, width: 3 }, x: 1, y: -1 };
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_CALLBACK_SIZE_0200', 'callback', 'crop', region)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_CALLBACK_SIZE_0300
         * @tc.name      : crop-callback-size: { height: 3, width: -3 }, x: 1, y: 1
         * @tc.desc      : 1.create PixelMap
         *               : 2.crop
         *               : 3.getImageInfo
         *               : 4.getPixelBytesNumber
         *               : 5.readPixelsToBuffer
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_CALLBACK_SIZE_0300', 0, async function (done) {
            var region = { size: { height: 3, width: -3 }, x: 1, y: 1 };
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_CALLBACK_SIZE_0300', 'callback', 'crop', region)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_CALLBACK_SIZE_0400
         * @tc.name      : crop-callback-size: { height: -3, width: 3 }, x: 1, y: 1
         * @tc.desc      : 1.create PixelMap
         *               : 2.crop
         *               : 3.getImageInfo
         *               : 4.getPixelBytesNumber
         *               : 5.readPixelsToBuffer
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_CALLBACK_SIZE_0400', 0, async function (done) {
            var region = { size: { height: -3, width: 3 }, x: 1, y: 1 };
            await pixelMapModifySizeTestErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_CALLBACK_SIZE_0400', 'callback', 'crop', region)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETDENSITY_GIF_ERROR_DENSITY_0100
         * @tc.name      : setDensity-gif-wrong density
         * @tc.desc      : 1.create ImageSource
         *               : 2.create PixelMap
         *               : 3.set Density
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETDENSITY_GIF_ERROR_DENSITY_0100', 0, async function (done) {
            var imageData = testGif.buffer;
            setDensityErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETDENSITY_GIF_ERROR_DENSITY_0100', imageData, null)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETDENSITY_GIF_ERROR_DENSITY_0200
         * @tc.name      : setDensity-gif-wrong density
         * @tc.desc      : 1.create ImageSource
         *               : 2.create PixelMap
         *               : 3.set Density
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETDENSITY_GIF_ERROR_DENSITY_0200', 0, async function (done) {
            var imageData = testGif.buffer;
            setDensityErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETDENSITY_GIF_ERROR_DENSITY_0200', imageData, 'a')
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETDENSITY_GIF_ERROR_DENSITY_0300
         * @tc.name      : setDensity-gif-wrong density
         * @tc.desc      : 1.create ImageSource
         *               : 2.create PixelMap
         *               : 3.set Density
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETDENSITY_GIF_ERROR_DENSITY_0300', 0, async function (done) {
            var imageData = testGif.buffer;
            setDensityErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETDENSITY_GIF_ERROR_DENSITY_0300', imageData, true)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETDENSITY_GIF_ERROR_DENSITY_0400
         * @tc.name      : setDensity-gif-wrong density
         * @tc.desc      : 1.create ImageSource
         *               : 2.create PixelMap
         *               : 3.set Density
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETDENSITY_GIF_ERROR_DENSITY_0400', 0, async function (done) {
            var imageData = testGif.buffer;
            setDensityErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_SETDENSITY_GIF_ERROR_DENSITY_0400', imageData, { a: 1 })
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_OPACITY_PROMISE_ERROR_ALPHA_0100
         * @tc.name      : opacity-promise-wrong alpha
         * @tc.desc      : 1.create pixelmap
         *               : 2.opacity
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_OPACITY_PROMISE_ERROR_ALPHA_0100', 0, async function (done) {
            opacityErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_OPACITY_PROMISE_ERROR_ALPHA_0100', { a: 1 }, 'Promise')
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_OPACITY_PROMISE_ERROR_ALPHA_0200
         * @tc.name      : opacity-promise-wrong alpha
         * @tc.desc      : 1.create pixelmap
         *               : 2.opacity
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_OPACITY_PROMISE_ERROR_ALPHA_0200', 0, async function (done) {
            opacityErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_OPACITY_PROMISE_ERROR_ALPHA_0200', 'a', 'Promise')
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_OPACITY_PROMISE_ERROR_ALPHA_0300
         * @tc.name      : opacity-promise-wrong alpha
         * @tc.desc      : 1.create pixelmap
         *               : 2.opacity
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_OPACITY_PROMISE_ERROR_ALPHA_0300', 0, async function (done) {
            opacityErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_OPACITY_PROMISE_ERROR_ALPHA_0300', null, 'Promise')
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_OPACITY_PROMISE_ERROR_ALPHA_0400
         * @tc.name      : opacity-promise-wrong alpha
         * @tc.desc      : 1.create pixelmap
         *               : 2.opacity
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_OPACITY_PROMISE_ERROR_ALPHA_0400', 0, async function (done) {
            opacityErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_OPACITY_PROMISE_ERROR_ALPHA_0400', 2, 'Promise')
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_OPACITY_CALLBACK_ERROR_ALPHA_0100
         * @tc.name      : opacity-callback-wrong alpha
         * @tc.desc      : 1.create pixelmap
         *               : 2.opacity
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_OPACITY_CALLBACK_ERROR_ALPHA_0100', 0, async function (done) {
            opacityErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_OPACITY_CALLBACK_ERROR_ALPHA_0100', { a: 1 }, 'callback')
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_OPACITY_CALLBACK_ERROR_ALPHA_0200
         * @tc.name      : opacity-callback-wrong alpha
         * @tc.desc      : 1.create pixelmap
         *               : 2.opacity
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_OPACITY_CALLBACK_ERROR_ALPHA_0200', 0, async function (done) {
            opacityErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_OPACITY_CALLBACK_ERROR_ALPHA_0200', 'a', 'callback')
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_OPACITY_CALLBACK_ERROR_ALPHA_0300
         * @tc.name      : opacity-callback-wrong alpha
         * @tc.desc      : 1.create pixelmap
         *               : 2.opacityErr
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_OPACITY_CALLBACK_ERROR_ALPHA_0300', 0, async function (done) {
            opacityErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_OPACITY_CALLBACK_ERROR_ALPHA_0300', null, 'callback')
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_OPACITY_CALLBACK_ERROR_ALPHA_0400
         * @tc.name      : opacity-callback-wrong alpha
         * @tc.desc      : 1.create pixelmap
         *               : 2.opacity
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_OPACITY_CALLBACK_ERROR_ALPHA_0400', 0, async function (done) {
            opacityErr(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_OPACITY_CALLBACK_ERROR_ALPHA_0400', 2, 'callback')
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_ISSTRIDEALIGNMENT_0100
         * @tc.name      : isStrideAlignment
         * @tc.desc      : 1.create ImageSource
         *               : 2.create PixelMap with isStrideAlignment
         *               : 3.isStrideAlignment
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_ISSTRIDEALIGNMENT_0100', 0, async function (done) {
            var imageData = testPng.buffer;
            await isStrideAlignmentTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_ISSTRIDEALIGNMENT_0100', imageData)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEPIXELMAPFROMSURFACE_0100
         * @tc.name      : on
         * @tc.desc      : 1.create ImageReceiver
         *                 2.createPixelMapFromSurface
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEPIXELMAPFROMSURFACE_0100", 0, async function (done) {
            var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMATJPEG, CAPACITY);
            if (receiver == undefined) {
                expect(false).assertTrue();
                done();
                return;
            } else {
                globalreceiver = receiver;
                var error = receiver.checkDeviceTest;
                if (DEVICE_CODE == error) {
                    expect(error == DEVICE_CODE).assertTrue();
                    done();
                    return;
                }
                let pass = false;
                receiver.on("imageArrival", (err) => {
                    if (err) {
                        console.info("SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEPIXELMAPFROMSURFACE_0100 on err" + err);
                        expect(false).assertTrue();
                        done();
                        return;
                    } else {
                        pass = true;
                        console.info("SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEPIXELMAPFROMSURFACE_0100 on call back IN");
                    }
                });
                receiver.getReceivingSurfaceId().then((id) => {
                    logger.log('SurfaceId success'+ id);
                    expect(isString(id)).assertTrue();
                    let region = { size: { height: 3, width: 3 }, x: 1, y: 1 };
                    image.createPixelMapFromSurface(id, region).then((pixelMap) =>{
                        logger.log("PixelMap " + pixelMap);
                        if (pixelMap != undefined) {
                            globalpixelmap = pixelMap;
                            pixelMap.getImageInfo().then((imageInfo) => {
                                if(imageInfo  == undefined) {
                                    logger.log('failed to obtain the image pixel map information');
                                    expect(false).assertTrue();
                                    done();
                                } else if (imageInfo.size.height == 3 && imageInfo.size.width == 3) {
                                    logger.log('success in obtaining the pixelmap information');
                                    expect(true).assertTrue();
                                    done();
                                }
                            })
                        } else {
                            expect(true).assertTrue();
                            done();
                        }
                        done();
                        return;
                    }).catch ((error) =>{
                        expect(true).assertTrue();
                        done();
                    })
                })
                var dummy = receiver.test;
                await sleep(2000);
                expect(pass).assertTrue();
                done();
                return;
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0100
         * @tc.name      : test convert pixelformat RGBA_1010102 to NV21
         * @tc.desc      : 1.create RGBA_1010102 pixelmap
         *                 2.call convertPixelFormat(NV21)
         *                 3.get pixelformat
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0100', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0100')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
              await testConvertPixelFormat(
                  done,
                  "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0100",
                  RGBA_1010102,
                  NV21
              );
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0200
         * @tc.name      : test convert pixelformat RGBA_1010102 to NV12
         * @tc.desc      : 1.create RGBA_1010102 pixelmap
         *                 2.call convertPixelFormat(NV12)
         *                 3.get pixelformat
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0200', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0200')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormat(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0200",
                    RGBA_1010102,
                    NV12
                );
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0300
         * @tc.name      : test convert pixelformat RGBA_1010102 to YCRCB_P010
         * @tc.desc      : 1.create RGBA_1010102 pixelmap
         *                 2.call convertPixelFormat(YCRCB_P010)
         *                 3.get pixelformat
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0300', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0300')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormat(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0300",
                    RGBA_1010102,
                    YCRCB_P010
                );
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0400
         * @tc.name      : test convert pixelformat RGBA_1010102 to YCBCR_P010
         * @tc.desc      : 1.create RGBA_1010102 pixelmap
         *                 2.call convertPixelFormat(YCBCR_P010)
         *                 3.get pixelformat
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0400', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0400')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormat(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0400",
                    RGBA_1010102,
                    YCBCR_P010
                );
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0500
         * @tc.name      : test convert pixelformat YCBCR_P010 to RGB_565
         * @tc.desc      : 1.create YCBCR_P010 pixelmap
         *                 2.call convertPixelFormat(RGB_565)
         *                 3.get pixelformat
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0500', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0500')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormat(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0500",
                    YCBCR_P010,
                    RGB_565
                );
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0600
         * @tc.name      : test convert pixelformat YCBCR_P010 to RGBA_8888
         * @tc.desc      : 1.create YCBCR_P010 pixelmap
         *                 2.call convertPixelFormat(RGBA_8888)
         *                 3.get pixelformat
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0600', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0600')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormat(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0600",
                    YCBCR_P010,
                    RGBA_8888
                );
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0700
         * @tc.name      : test convert pixelformat YCBCR_P010 to BGRA_8888
         * @tc.desc      : 1.create YCBCR_P010 pixelmap
         *                 2.call convertPixelFormat(BGRA_8888)
         *                 3.get pixelformat
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0700', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0700')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormat(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0700",
                    YCBCR_P010,
                    BGRA_8888
                );
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0800
         * @tc.name      : test convert pixelformat YCBCR_P010 to RGB_888
         * @tc.desc      : 1.create YCBCR_P010 pixelmap
         *                 2.call convertPixelFormat(RGB_888)
         *                 3.get pixelformat
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0800', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0800')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormat(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0800",
                    YCBCR_P010,
                    RGB_888
                );
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0900
         * @tc.name      : test convert pixelformat YCBCR_P010 to RGBA_F16
         * @tc.desc      : 1.create YCBCR_P010 pixelmap
         *                 2.call convertPixelFormat(RGBA_F16)
         *                 3.get pixelformat
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0900', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0900')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormat(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_0900",
                    YCBCR_P010,
                    RGBA_F16
                );
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1000
         * @tc.name      : test convert pixelformat YCRCB_P010 to RGB_565
         * @tc.desc      : 1.create YCRCB_P010 pixelmap
         *                 2.call convertPixelFormat(RGB_565)
         *                 3.get pixelformat
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1000', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1000')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormat(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1000",
                    YCRCB_P010,
                    RGB_565
                );
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1100
         * @tc.name      : test convert pixelformat YCRCB_P010 to RGBA_8888
         * @tc.desc      : 1.create YCRCB_P010 pixelmap
         *                 2.call convertPixelFormat(RGBA_8888)
         *                 3.get pixelformat
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1100', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1100')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormat(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1100",
                    YCRCB_P010,
                    RGBA_8888
                );
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1200
         * @tc.name      : test convert pixelformat YCRCB_P010 to BGRA_8888
         * @tc.desc      : 1.create YCRCB_P010 pixelmap
         *                 2.call convertPixelFormat(BGRA_8888)
         *                 3.get pixelformat
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1200', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1200')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormat(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1200",
                    YCRCB_P010,
                    BGRA_8888
                );
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1300
         * @tc.name      : test convert pixelformat YCRCB_P010 to RGB_888
         * @tc.desc      : 1.create YCRCB_P010 pixelmap
         *                 2.call convertPixelFormat(RGB_888)
         *                 3.get pixelformat
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1300', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1300')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormat(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1300",
                    YCRCB_P010,
                    RGB_888
                );
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1400
         * @tc.name      : test convert pixelformat YCRCB_P010 to RGBA_F16
         * @tc.desc      : 1.create YCRCB_P010 pixelmap
         *                 2.call convertPixelFormat(RGBA_F16)
         *                 3.get pixelformat
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1400', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1400')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormat(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1400",
                    YCRCB_P010,
                    RGBA_F16
                );
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1500
         * @tc.name      : test convert pixelformat NV21 to RGBA_1010102
         * @tc.desc      : 1.create RGBA_1010102 pixelmap
         *                 2.call convertPixelFormat(NV21)
         *                 3.get pixelformat
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1500', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1500')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormat(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1500",
                    NV21,
                    RGBA_1010102
                );
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1600
         * @tc.name      : test convert pixelformat NV12 to RGBA_1010102
         * @tc.desc      : 1.create RGBA_1010102 pixelmap
         *                 2.call convertPixelFormat(NV12)
         *                 3.get pixelformat
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1600', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1600')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormat(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1600",
                    NV12,
                    RGBA_1010102
                );
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1700
         * @tc.name      : test convert pixelformat YCRCB_P010 to RGBA_1010102
         * @tc.desc      : 1.create RGBA_1010102 pixelmap
         *                 2.call convertPixelFormat(YCRCB_P010)
         *                 3.get pixelformat
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1700', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1700')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormat(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1700",
                    YCRCB_P010,
                    RGBA_1010102
                );
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1800
         * @tc.name      : test convert pixelformat YCBCR_P010 to RGBA_1010102
         * @tc.desc      : 1.create RGBA_1010102 pixelmap
         *                 2.call convertPixelFormat(YCBCR_P010)
         *                 3.get pixelformat
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1800', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1800')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormat(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1800",
                    YCBCR_P010,
                    RGBA_1010102
                );
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1900
         * @tc.name      : test convert pixelformat RGB_565 to YCBCR_P010
         * @tc.desc      : 1.create YCBCR_P010 pixelmap
         *                 2.call convertPixelFormat(RGB_565)
         *                 3.get pixelformat
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1900', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1900')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormat(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_1900",
                    RGB_565,
                    YCBCR_P010
                );
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2000
         * @tc.name      : test convert pixelformat RGBA_8888 to YCBCR_P010
         * @tc.desc      : 1.create YCBCR_P010 pixelmap
         *                 2.call convertPixelFormat(RGBA_8888)
         *                 3.get pixelformat
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2000', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2000')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormat(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2000",
                    RGBA_8888,
                    YCBCR_P010
                );
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2100
         * @tc.name      : test convert pixelformat BGRA_8888 to YCBCR_P010
         * @tc.desc      : 1.create YCBCR_P010 pixelmap
         *                 2.call convertPixelFormat(BGRA_8888)
         *                 3.get pixelformat
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2100', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2100')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormat(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2100",
                    BGRA_8888,
                    YCBCR_P010
                );
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2200
         * @tc.name      : test convert pixelformat RGB_888 to YCBCR_P010
         * @tc.desc      : 1.create YCBCR_P010 pixelmap
         *                 2.call convertPixelFormat(RGB_888)
         *                 3.get pixelformat
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2200', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2200')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormat(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2200",
                    RGB_888,
                    YCBCR_P010
                );
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2300
         * @tc.name      : test convert pixelformat RGBA_F16 to YCBCR_P010
         * @tc.desc      : 1.create YCBCR_P010 pixelmap
         *                 2.call convertPixelFormat(RGBA_F16)
         *                 3.get pixelformat
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2300', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2300')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormat(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2300",
                    RGBA_F16,
                    YCBCR_P010
                );
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2400
         * @tc.name      : test convert pixelformat RGB_565 to YCRCB_P010
         * @tc.desc      : 1.create YCRCB_P010 pixelmap
         *                 2.call convertPixelFormat(RGB_565)
         *                 3.get pixelformat
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2400', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2400')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormat(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2400",
                    RGB_565,
                    YCRCB_P010
                );
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2500
         * @tc.name      : test convert pixelformat RGBA_8888 to YCRCB_P010
         * @tc.desc      : 1.create YCRCB_P010 pixelmap
         *                 2.call convertPixelFormat(RGBA_8888)
         *                 3.get pixelformat
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2500', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2500')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormat(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2500",
                    RGBA_8888,
                    YCRCB_P010
                );
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2600
         * @tc.name      : test convert pixelformat BGRA_8888 to YCRCB_P010
         * @tc.desc      : 1.create YCRCB_P010 pixelmap
         *                 2.call convertPixelFormat(BGRA_8888)
         *                 3.get pixelformat
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2600', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2600')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormat(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2600",
                    BGRA_8888,
                    YCRCB_P010
                );
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2700
         * @tc.name      : test convert pixelformat RGB_888 to YCRCB_P010
         * @tc.desc      : 1.create YCRCB_P010 pixelmap
         *                 2.call convertPixelFormat(RGB_888)
         *                 3.get pixelformat
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2700', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2700')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormat(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2700",
                    RGB_888,
                    YCRCB_P010
                );
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2800
         * @tc.name      : test convert pixelformat RGBA_F16 to YCRCB_P010
         * @tc.desc      : 1.create YCRCB_P010 pixelmap
         *                 2.call convertPixelFormat(RGBA_F16)
         *                 3.get pixelformat
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2800', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2800')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormat(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_FUNC_2800",
                    RGBA_F16,
                    YCRCB_P010
                );
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0100
         * @tc.name      : test convert pixelformat RGBA_1010102 to RGB_565
         * @tc.desc      : 1.create RGBA_1010102 pixelmap
         *                 2.call convertPixelFormat(RGB_565)
         *                 3.check error code
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0100', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0100')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormatErr(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0100",
                    RGBA_1010102,
                    RGB_565
                );
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0200
         * @tc.name      : test convert pixelformat RGBA_1010102 to RGBA_8888
         * @tc.desc      : 1.create RGBA_1010102 pixelmap
         *                 2.call convertPixelFormat(RGBA_8888)
         *                 3.check error code
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0200', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0200')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormatErr(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0200",
                    RGBA_1010102,
                    RGBA_8888
                );
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0300
         * @tc.name      : test convert pixelformat RGBA_1010102 to BGRA_8888
         * @tc.desc      : 1.create RGBA_1010102 pixelmap
         *                 2.call convertPixelFormat(BGRA_8888)
         *                 3.check error code
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0300', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0300')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormatErr(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0300",
                    RGBA_1010102,
                    BGRA_8888
                );
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0400
         * @tc.name      : test convert pixelformat RGBA_1010102 to RGB_888
         * @tc.desc      : 1.create RGBA_1010102 pixelmap
         *                 2.call convertPixelFormat(RGB_888)
         *                 3.check error code
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0400', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0400')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormatErr(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0400",
                    RGBA_1010102,
                    RGB_888
                );
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0500
         * @tc.name      : test convert pixelformat RGBA_1010102 to RGBA_F16
         * @tc.desc      : 1.create RGBA_1010102 pixelmap
         *                 2.call convertPixelFormat(RGBA_F16)
         *                 3.check error code
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0500', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0500')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormatErr(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0500",
                    RGBA_1010102,
                    RGBA_F16
                );
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0600
         * @tc.name      : test convert pixelformat YCBCR_P010 to NV21
         * @tc.desc      : 1.create YCBCR_P010 pixelmap
         *                 2.call convertPixelFormat(NV21)
         *                 3.check error code
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0600', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0600')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormatErr(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0600",
                    YCBCR_P010,
                    NV21
                );
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0700
         * @tc.name      : test convert pixelformat YCBCR_P010 to NV12
         * @tc.desc      : 1.create YCBCR_P010 pixelmap
         *                 2.call convertPixelFormat(NV12)
         *                 3.check error code
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0700', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0700')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormatErr(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0700",
                    YCBCR_P010,
                    NV12
                );
            }
        });
         /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0800
         * @tc.name      : test convert pixelformat YCRCB_P010 to NV21
         * @tc.desc      : 1.create YCRCB_P010 pixelmap
         *                 2.call convertPixelFormat(NV21)
         *                 3.check error code
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
         it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0800', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0800')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormatErr(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0800",
                    YCRCB_P010,
                    NV21
                );
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0900
         * @tc.name      : test convert pixelformat YCRCB_P010 to NV12
         * @tc.desc      : 1.create YCRCB_P010 pixelmap
         *                 2.call convertPixelFormat(NV12)
         *                 3.check error code
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0900', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0900')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormatErr(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_0900",
                    YCRCB_P010,
                    NV12
                );
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_1000
         * @tc.name      : test convert pixelformat YCRCB_P010 to YCBCR_P010
         * @tc.desc      : 1.create YCRCB_P010 pixelmap
         *                 2.call convertPixelFormat(YCBCR_P010)
         *                 3.check error code
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_1000', 0, async function (done) {
            let logger = loger('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_1000')
            if (!isSupportHdr()) {
                logger.log('device is not support hdr');
                expect(true).assertTrue();
                done();
            } else {
                await testConvertPixelFormatErr(
                    done,
                    "SUB_MULTIMEDIA_IMAGE_PIXELMAP_CONVERTPIXELFORMAT_ERROR_1000",
                    YCRCB_P010,
                    YCBCR_P010
                );
            }
        });
    })
}