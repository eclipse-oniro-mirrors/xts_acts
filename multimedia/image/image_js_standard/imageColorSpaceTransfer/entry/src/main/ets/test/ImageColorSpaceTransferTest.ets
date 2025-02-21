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

import { describe, it, expect } from 'hypium/index'
import featureAbility from '@ohos.ability.featureAbility';
import image from "@ohos.multimedia.image";
import fs from "@ohos.file.fs";
import colorSpaceManager from "@ohos.graphics.colorSpaceManager";
import { BusinessError } from '@ohos.base';

export default function ImageColorSpaceTransferTest() {
    describe('ImageColorSpaceTransferTest', function () {
        const ERR_CODE = 62980115;
        const { ADOBE_RGB_1998, DCI_P3, DISPLAY_P3, SRGB, CUSTOM } = colorSpaceManager.ColorSpace;
        async function getFd(fileName) {
            let context = await featureAbility.getContext();
            let filePath;
            await context.getFilesDir().then((data) => {
                filePath = data + "/" + fileName;
                console.info("image case filePath is " + filePath);
            });
            let file = await fs.open(filePath, 0o0);
            return file.fd
        }
        function Logger(caseName) {
            return {
                myName: caseName,
                log: function (msg) {
                    console.info(this.myName + " " + msg);
                },
            };
        }
        async function createPixelmapTestPromise(done, testNum, colorSpace, gamma, checkColorSpace) {
            let logger = Logger(testNum);
            try {
                let fd = await getFd("colorspace.jpg");
                let imageSource = image.createImageSource(fd);
                logger.log("ImageSource " + (imageSource != undefined));
                if (imageSource != undefined) {
                    let csm: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpace, gamma);
                    let decodingOptions: image.DecodingOptions = { desiredColorSpace: csm };
                    let pixelMap: image.PixelMap = await imageSource.createPixelMap(decodingOptions);
                    logger.log("PixelMap " + pixelMap);
                    if (pixelMap != undefined) {
                        let cs = pixelMap.getColorSpace();
                        let csmn = cs.getColorSpaceName();
                        logger.log('csmn ' + csmn);
                        checkColorSpace(csmn);
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
        async function createPixelmapTestCb(done, testNum, colorSpace, gamma, checkColorSpace) {
            let logger = Logger(testNum);
            try {
                let fd = await getFd("colorspace.jpg");
                let imageSource = image.createImageSource(fd);
                logger.log("ImageSource " + (imageSource != undefined));
                if (imageSource != undefined) {
                    let csm = colorSpaceManager.create(colorSpace, gamma);
                    logger.log('colorSpace name ' + csm.getColorSpaceName());
                    let decodingOptions = { desiredColorSpace: csm };
                    imageSource.createPixelMap(decodingOptions, async (err, pixelMap) => {
                        if (err) {
                            logger.log("PixelMap err " + err);
                            expect(false).assertTrue();
                            done();
                            return;
                        }
                        let cs = pixelMap.getColorSpace();
                        let csmn = cs.getColorSpaceName();
                        logger.log('csmn ' + csmn);
                        checkColorSpace(csmn);
                        done();
                    });
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

        async function applyColorSpacePromiseTest(done, testNum, checkColorSpace, colorSpace, gamma) {
            let logger = Logger(testNum);
            try {
                let fd = await getFd("colorspace.jpg");
                let imageSource = image.createImageSource(fd);
                logger.log("ImageSource " + (imageSource != undefined));
                if (imageSource != undefined) {
                    let pixelMap = await imageSource.createPixelMap();
                    if (pixelMap != undefined) {
                        let csmModify = colorSpaceManager.create(colorSpace, gamma);
                        logger.log("csmModify " + csmModify);
                        pixelMap.applyColorSpace(csmModify).then(async () => {
                            let csm1 = pixelMap.getColorSpace();
                            logger.log("getColorSpace " + csm1);
                            let csmn = csm1.getColorSpaceName();
                            logger.log("getColorSpaceName " + csmn);
                            checkColorSpace(csmn);
                            let pixelSize = pixelMap.getPixelBytesNumber();
                            logger.log(`new pixel size ${pixelSize}`);
                            done();
                        }).catch(error => {
                            logger.log("apply colorSpace failed " + error);
                            expect().assertFail();
                            done();
                        })
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

        async function applyColorSpaceCbTest(done, testNum, checkColorSpace, colorSpace, gamma) {
            let logger = Logger(testNum);
            try {
                let fd = await getFd("colorspace.jpg");
                let imageSource = image.createImageSource(fd);
                logger.log("ImageSource " + (imageSource != undefined));
                if (imageSource != undefined) {
                    let pixelMap = await imageSource.createPixelMap();
                    if (pixelMap != undefined) {
                        let csmModify = colorSpaceManager.create(colorSpace, gamma);
                        pixelMap.applyColorSpace(csmModify, async (err) => {
                            if (err) {
                                expect(false).assertTrue();
                                logger.log("applyColorSpace err " + err);
                                done();
                                return;
                            }
                            let csm1 = pixelMap.getColorSpace();
                            logger.log("getColorSpace " + csm1);
                            let csmn = csm1.getColorSpaceName();
                            logger.log("getColorSpaceName " + csmn);
                            checkColorSpace(csmn);
                            let pixelSize = pixelMap.getPixelBytesNumber();
                            logger.log(`new pixel size ${pixelSize}`);
                            done();
                        })
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

        async function applyColorSpaceCbErrTest(done, testNum, csmModify) {
            let logger = Logger(testNum);
            try {
                let fd = await getFd("colorspace.jpg")
                let imageSource = image.createImageSource(fd);
                logger.log("ImageSource " + (imageSource != undefined));
                if (imageSource != undefined) {
                    let pixelMap = await imageSource.createPixelMap();
                    if (pixelMap != undefined) {
                        pixelMap.applyColorSpace(csmModify, async (err: BusinessError | number) => {
                            logger.log('applyColorSpace failed ' + err);
                            expect(err == ERR_CODE).assertTrue();
                            done();
                        })
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

        async function applyColorSpacePromiseErrTest(done, testNum, csmModify) {
            let logger = Logger(testNum);
            try {
                let fd = await getFd("colorspace.jpg")
                let imageSource = image.createImageSource(fd);
                logger.log("ImageSource " + (imageSource != undefined));
                if (imageSource != undefined) {
                    let pixelMap = await imageSource.createPixelMap();
                    if (pixelMap != undefined) {
                        try {
                            await pixelMap.applyColorSpace(csmModify);
                            expect(false).assertTrue();
                            done();
                        } catch (error) {
                            logger.log('applyColorSpace fail' + error);
                            expect(error == ERR_CODE).assertTrue();
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

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0100
         * @tc.name      : createPixelmap_promise_001
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0100', 0, async function (done) {
            function checkColorSpace(colorSpaceName) {
                expect(colorSpaceName == ADOBE_RGB_1998).assertTrue();
            }
            await createPixelmapTestPromise(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0100',
                colorSpaceManager.ColorSpace.ADOBE_RGB_1998, undefined, checkColorSpace)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0200
         * @tc.name      : createPixelmap_promise_002
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0200', 0, async function (done) {
            function checkColorSpace(colorSpaceName) {
                expect(colorSpaceName == DCI_P3).assertTrue();
            }
            await createPixelmapTestPromise(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0200',
                colorSpaceManager.ColorSpace.DCI_P3, undefined, checkColorSpace)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0300
         * @tc.name      : createPixelmap_promise_003
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0300', 0, async function (done) {
            function checkColorSpace(colorSpaceName) {
                expect(colorSpaceName == DISPLAY_P3).assertTrue();
            }
            await createPixelmapTestPromise(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0300',
                colorSpaceManager.ColorSpace.DISPLAY_P3, undefined, checkColorSpace)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0400
         * @tc.name      : createPixelmap_promise_004
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0400', 0, async function (done) {
            function checkColorSpace(colorSpaceName) {
                expect(colorSpaceName == SRGB).assertTrue();
            }
            await createPixelmapTestPromise(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0400',
                colorSpaceManager.ColorSpace.SRGB, undefined, checkColorSpace)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0500
         * @tc.name      : createPixelmap_promise_005
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0500', 0, async function (done) {
            let bt2020 = {
                redX: 0.708,
                redY: 0.292,
                greenX: 0.170,
                greenY: 0.797,
                blueX: 0.131,
                blueY: 0.046,
                whitePointX: 0.31271,
                whitePointY: 0.32902
            }
            let gamma = 2.4;
            function checkColorSpace(colorSpaceName) {
                expect(colorSpaceName == CUSTOM).assertTrue();
            }
            await createPixelmapTestPromise(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0500',
                bt2020, gamma, checkColorSpace)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0100
         * @tc.name      : createPixelmap_callback_001
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0100', 0, async function (done) {
            function checkColorSpace(colorSpaceName) {
                expect(colorSpaceName == ADOBE_RGB_1998).assertTrue();
            }
            await createPixelmapTestCb(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0100',
                colorSpaceManager.ColorSpace.ADOBE_RGB_1998, undefined, checkColorSpace)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0200
         * @tc.name      : createPixelmap_callback_002
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0200', 0, async function (done) {
            function checkColorSpace(colorSpaceName) {
                expect(colorSpaceName == DCI_P3).assertTrue();
            }
            await createPixelmapTestCb(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0200',
                colorSpaceManager.ColorSpace.DCI_P3, undefined, checkColorSpace)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0300
         * @tc.name      : createPixelmap_callback_003
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0300', 0, async function (done) {
            function checkColorSpace(colorSpaceName) {
                expect(colorSpaceName == DISPLAY_P3).assertTrue();
            }
            await createPixelmapTestCb(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0300',
                colorSpaceManager.ColorSpace.DISPLAY_P3, undefined, checkColorSpace)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0400
         * @tc.name      : createPixelmap_callback_004
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0400', 0, async function (done) {
            function checkColorSpace(colorSpaceName) {
                expect(colorSpaceName == SRGB).assertTrue();
            }
            await createPixelmapTestCb(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0400',
                colorSpaceManager.ColorSpace.SRGB, undefined, checkColorSpace)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0500
         * @tc.name      : createPixelmap_callback_005
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0500', 0, async function (done) {
            let bt2020 = {
                redX: 0.708,
                redY: 0.292,
                greenX: 0.170,
                greenY: 0.797,
                blueX: 0.131,
                blueY: 0.046,
                whitePointX: 0.31271,
                whitePointY: 0.32902
            }
            let gamma = 2.4;
            function checkColorSpace(colorSpaceName) {
                expect(colorSpaceName == CUSTOM).assertTrue();
            }
            await createPixelmapTestCb(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0500',
                bt2020, gamma, checkColorSpace)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0100
         * @tc.name      : applyColorSpace_promise_001
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0100', 0, async function (done) {
            function checkColorSpace(colorSpaceName) {
                expect(colorSpaceName == ADOBE_RGB_1998).assertTrue();
            }
            await applyColorSpacePromiseTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0100',
                checkColorSpace, colorSpaceManager.ColorSpace.ADOBE_RGB_1998, undefined)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0200
         * @tc.name      : applyColorSpace_promise_002
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0200', 0, async function (done) {
            function checkColorSpace(colorSpaceName) {
                expect(colorSpaceName == DCI_P3).assertTrue();
            }
            await applyColorSpacePromiseTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0200',
                checkColorSpace, colorSpaceManager.ColorSpace.DCI_P3, undefined)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0300
         * @tc.name      : applyColorSpace_promise_003
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0300', 0, async function (done) {
            function checkColorSpace(colorSpaceName) {
                expect(colorSpaceName == DISPLAY_P3).assertTrue();
            }
            await applyColorSpacePromiseTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0300',
                checkColorSpace, colorSpaceManager.ColorSpace.DISPLAY_P3, undefined)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0400
         * @tc.name      : applyColorSpace_promise_004
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0400', 0, async function (done) {
            function checkColorSpace(colorSpaceName) {
                expect(colorSpaceName == SRGB).assertTrue();
            }
            await applyColorSpacePromiseTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0400',
                checkColorSpace, colorSpaceManager.ColorSpace.SRGB, undefined)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0500
         * @tc.name      : applyColorSpace_promise_005
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0500', 0, async function (done) {
            let bt2020 = {
                redX: 0.708,
                redY: 0.292,
                greenX: 0.170,
                greenY: 0.797,
                blueX: 0.131,
                blueY: 0.046,
                whitePointX: 0.31271,
                whitePointY: 0.32902
            }
            let gamma = 2.4;
            function checkColorSpace(colorSpaceName) {
                expect(colorSpaceName == CUSTOM).assertTrue();
            }
            await applyColorSpacePromiseTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0500',
                checkColorSpace, bt2020, gamma)
        })

        /**
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0100
         * @tc.name      : applyColorSpace_callback_001
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0100', 0, async function (done) {
            function checkColorSpace(colorSpaceName) {
                expect(colorSpaceName == ADOBE_RGB_1998).assertTrue();
            }
            await applyColorSpaceCbTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0100',
                checkColorSpace, colorSpaceManager.ColorSpace.ADOBE_RGB_1998, undefined)
        })

        /**
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0200
         * @tc.name      : applyColorSpace_callback_002
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0200', 0, async function (done) {
            function checkColorSpace(colorSpaceName) {
                expect(colorSpaceName == DCI_P3).assertTrue();
            }
            await applyColorSpaceCbTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0200',
                checkColorSpace, colorSpaceManager.ColorSpace.DCI_P3, undefined)
        })

        /**
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0300
         * @tc.name      : applyColorSpace_callback_003
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0300', 0, async function (done) {
            function checkColorSpace(colorSpaceName) {
                expect(colorSpaceName == DISPLAY_P3).assertTrue();
            }
            await applyColorSpaceCbTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0300',
                checkColorSpace, colorSpaceManager.ColorSpace.DISPLAY_P3, undefined)
        })

        /**
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0400
         * @tc.name      : applyColorSpace_callback_004
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0400', 0, async function (done) {
            function checkColorSpace(colorSpaceName) {
                expect(colorSpaceName == SRGB).assertTrue();
            }
            await applyColorSpaceCbTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0400',
                checkColorSpace, colorSpaceManager.ColorSpace.SRGB, undefined)
        })

        /**
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0500
         * @tc.name      : applyColorSpace_callback_005
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0500', 0, async function (done) {
            let bt2020 = {
                redX: 0.708,
                redY: 0.292,
                greenX: 0.170,
                greenY: 0.797,
                blueX: 0.131,
                blueY: 0.046,
                whitePointX: 0.31271,
                whitePointY: 0.32902
            }
            let gamma = 2.4;
            function checkColorSpace(colorSpaceName) {
                expect(colorSpaceName == CUSTOM).assertTrue();
            }
            await applyColorSpaceCbTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0500',
                checkColorSpace, bt2020, gamma)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0100
         * @tc.name      : applyColorSpace_callback_err_001
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0100', 0, async function (done) {
            await applyColorSpaceCbErrTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0100',
                'wrong')
        })
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0200
         * @tc.name      : applyColorSpace_callback_err_002
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0200', 0, async function (done) {
            await applyColorSpaceCbErrTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0200',
                100)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0300
         * @tc.name      : applyColorSpace_callback_err_003
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0300', 0, async function (done) {
            await applyColorSpaceCbErrTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0300',
                -100)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0400
         * @tc.name      : applyColorSpace_callback_err_004
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0400', 0, async function (done) {
            await applyColorSpaceCbErrTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0400',
                null)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0100
         * @tc.name      : applyColorSpace_promise_err_001
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0100', 0, async function (done) {
            await applyColorSpacePromiseErrTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0100',
                'wrong')
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0200
         * @tc.name      : applyColorSpace_promise_err_002
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0200', 0, async function (done) {
            await applyColorSpacePromiseErrTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0200',
                100)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0300
         * @tc.name      : applyColorSpace_promise_err_003
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0300', 0, async function (done) {
            await applyColorSpacePromiseErrTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0300',
                -100)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0400
         * @tc.name      : applyColorSpace_promise_err_004
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0400', 0, async function (done) {
            await applyColorSpacePromiseErrTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0400',
                null)
        })
    })
}
