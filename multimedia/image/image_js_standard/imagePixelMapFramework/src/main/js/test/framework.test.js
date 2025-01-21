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
import { testPng, testJpg } from '../../../../../image/src/main/js/test/testImg'
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
        beforeAll(async function () {
            console.info('beforeAll case');
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
    })
}
