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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import featureAbility from '@ohos.ability.featureAbility';
import image from "@ohos.multimedia.image";
import fs from "@ohos.file.fs";
import colorSpaceManager from "@ohos.graphics.colorSpaceManager";
import { BusinessError } from '@ohos.base';


const ERR_CODE = 62980115;
const ADOBE_RGB_1998: number = colorSpaceManager.ColorSpace.ADOBE_RGB_1998
const DCI_P3: number = colorSpaceManager.ColorSpace.DCI_P3
const DISPLAY_P3: number = colorSpaceManager.ColorSpace.DISPLAY_P3
const SRGB: number = colorSpaceManager.ColorSpace.SRGB
const CUSTOM: number = colorSpaceManager.ColorSpace.CUSTOM

async function getFd(fileName:string) {
   let context: ESObject = await AppStorage.get('thisContext');
    let filePath:ESObject;
    filePath = context.filesDir + "/" + fileName;
    console.info("image case filePath is " + filePath);
    let file = await fs.open(filePath, 0o0);
    return file.fd
}
function Logger(caseName:string):ESObject {
    return {
        myName: caseName,
        log: (msg:string)=> {
            console.info(caseName + " " + msg);
        },
    };
}
async function createPixelmapTestPromise(done:Function, testNum:string, colorSpace:ESObject, gamma:ESObject, checkColorSpace:ESObject) {
    let logger:ESObject = Logger(testNum);
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
                await pixelMap.release();
                logger.log("Success in releasing pixelMap")
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
async function createPixelmapTestCb(done:Function, testNum:string, colorSpace:ESObject, gamma:ESObject, checkColorSpace:ESObject) {
    let logger:ESObject = Logger(testNum);
    try {
        let fd = await getFd("colorspace.jpg");
        let imageSource = image.createImageSource(fd);
        logger.log("ImageSource " + (imageSource != undefined));
        if (imageSource != undefined) {
            let csm = colorSpaceManager.create(colorSpace, gamma);
            logger.log('colorSpace name ' + csm.getColorSpaceName());
            let decodingOptions: image.DecodingOptions = { desiredColorSpace: csm };
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
                await pixelMap.release();
                logger.log("Success in releasing pixelMap")
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

async function applyColorSpacePromiseTest(done:Function, testNum:string, checkColorSpace:Function, colorSpace:ESObject, gamma:ESObject) {
    let logger:ESObject = Logger(testNum);
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
                    await pixelMap.release();
                    logger.log("Success in releasing pixelMap")
                    done();
                }).catch((error:BusinessError) => {
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

async function applyColorSpaceCbTest(done:Function, testNum:string, checkColorSpace:Function, colorSpace:ESObject, gamma:ESObject) {
    let logger:ESObject = Logger(testNum);
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
                    await pixelMap.release();
                    logger.log("Success in releasing pixelMap")
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

async function applyColorSpaceCbErrTest(done:Function, testNum:string, csmModify:ESObject) {
    let logger:ESObject = Logger(testNum);
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
                await pixelMap.release();
                logger.log("Success in releasing pixelMap");
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

async function applyColorSpacePromiseErrTest(done:Function, testNum:string, csmModify:ESObject) {
    let logger:ESObject = Logger(testNum);
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
                await pixelMap.release();
                logger.log("Success in releasing pixelMap");
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

export default function ImageColorSpaceTransferTest() {
    describe('ImageColorSpaceTransferTest', ()=> {


        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0100
         * @tc.desc   1.create imagesource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0100', Level.LEVEL0, async (done:Function)=> {
            let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
                expect(colorSpaceName == ADOBE_RGB_1998).assertTrue();
            }
            await createPixelmapTestPromise(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0100',
                colorSpaceManager.ColorSpace.ADOBE_RGB_1998, undefined, checkColorSpace)
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0200
         * @tc.desc   1.create imagesource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0200', Level.LEVEL0, async (done:Function)=> {
            let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
                expect(colorSpaceName == DCI_P3).assertTrue();
            }
            await createPixelmapTestPromise(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0200',
                colorSpaceManager.ColorSpace.DCI_P3, undefined, checkColorSpace)
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0300
         * @tc.desc   1.create imagesource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0300', Level.LEVEL0, async (done:Function)=> {
            let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
                expect(colorSpaceName == DISPLAY_P3).assertTrue();
            }
            await createPixelmapTestPromise(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0300',
                colorSpaceManager.ColorSpace.DISPLAY_P3, undefined, checkColorSpace)
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0400
         * @tc.desc   1.create imagesource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0400', Level.LEVEL0, async (done:Function)=> {
            let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
                expect(colorSpaceName == SRGB).assertTrue();
            }
            await createPixelmapTestPromise(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0400',
                colorSpaceManager.ColorSpace.SRGB, undefined, checkColorSpace)
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0500
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0500
         * @tc.desc   1.create imagesource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0500', Level.LEVEL0, async (done:Function)=> {
            let bt2020:ESObject = {
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
            let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
                expect(colorSpaceName == CUSTOM).assertTrue();
            }
            await createPixelmapTestPromise(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0500',
                bt2020, gamma, checkColorSpace)
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0100
         * @tc.desc   1.create imagesource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0100', Level.LEVEL0, async (done:Function)=> {
            let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
                expect(colorSpaceName == ADOBE_RGB_1998).assertTrue();
            }
            await createPixelmapTestCb(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0100',
                colorSpaceManager.ColorSpace.ADOBE_RGB_1998, undefined, checkColorSpace)
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0200
         * @tc.desc   1.create imagesource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0200', Level.LEVEL0, async (done:Function)=> {
            let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
                expect(colorSpaceName == DCI_P3).assertTrue();
            }
            await createPixelmapTestCb(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0200',
                colorSpaceManager.ColorSpace.DCI_P3, undefined, checkColorSpace)
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0300
         * @tc.desc   1.create imagesource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0300', Level.LEVEL0, async (done:Function)=> {
            let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
                expect(colorSpaceName == DISPLAY_P3).assertTrue();
            }
            await createPixelmapTestCb(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0300',
                colorSpaceManager.ColorSpace.DISPLAY_P3, undefined, checkColorSpace)
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0400
         * @tc.desc   1.create imagesource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0400', Level.LEVEL0, async (done:Function)=> {
            let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
                expect(colorSpaceName == SRGB).assertTrue();
            }
            await createPixelmapTestCb(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0400',
                colorSpaceManager.ColorSpace.SRGB, undefined, checkColorSpace)
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0500
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0500
         * @tc.desc   1.create imagesource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0500', Level.LEVEL0, async (done:Function)=> {
            let bt2020:ESObject = {
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
            let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
                expect(colorSpaceName == CUSTOM).assertTrue();
            }
            await createPixelmapTestCb(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0500',
                bt2020, gamma, checkColorSpace)
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0100
         * @tc.desc   1.create imagesource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0100', Level.LEVEL0, async (done:Function)=> {
            let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
                expect(colorSpaceName == ADOBE_RGB_1998).assertTrue();
            }
            await applyColorSpacePromiseTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0100',
                checkColorSpace, colorSpaceManager.ColorSpace.ADOBE_RGB_1998, undefined)
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0200
         * @tc.desc   1.create imagesource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0200', Level.LEVEL0, async (done:Function)=> {
            let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
                expect(colorSpaceName == DCI_P3).assertTrue();
            }
            await applyColorSpacePromiseTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0200',
                checkColorSpace, colorSpaceManager.ColorSpace.DCI_P3, undefined)
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0300
         * @tc.desc   1.create imagesource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0300', Level.LEVEL0, async (done:Function)=> {
            let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
                expect(colorSpaceName == DISPLAY_P3).assertTrue();
            }
            await applyColorSpacePromiseTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0300',
                checkColorSpace, colorSpaceManager.ColorSpace.DISPLAY_P3, undefined)
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0400
         * @tc.desc   1.create imagesource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0400', Level.LEVEL0, async (done:Function)=> {
            let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
                expect(colorSpaceName == SRGB).assertTrue();
            }
            await applyColorSpacePromiseTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0400',
                checkColorSpace, colorSpaceManager.ColorSpace.SRGB, undefined)
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0500
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0500
         * @tc.desc   1.create imagesource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0500', Level.LEVEL0, async (done:Function)=> {
            let bt2020:ESObject = {
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
            let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
                expect(colorSpaceName == CUSTOM).assertTrue();
            }
            await applyColorSpacePromiseTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0500',
                checkColorSpace, bt2020, gamma)
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0100
         * @tc.desc   1.create imagesource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0100', Level.LEVEL0, async (done:Function)=> {
            let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
                expect(colorSpaceName == ADOBE_RGB_1998).assertTrue();
            }
            await applyColorSpaceCbTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0100',
                checkColorSpace, colorSpaceManager.ColorSpace.ADOBE_RGB_1998, undefined)
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0200
         * @tc.desc   1.create imagesource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0200', Level.LEVEL0, async (done:Function)=> {
            let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
                expect(colorSpaceName == DCI_P3).assertTrue();
            }
            await applyColorSpaceCbTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0200',
                checkColorSpace, colorSpaceManager.ColorSpace.DCI_P3, undefined)
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0300
         * @tc.desc   1.create imagesource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0300', Level.LEVEL0, async (done:Function)=> {
            let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
                expect(colorSpaceName == DISPLAY_P3).assertTrue();
            }
            await applyColorSpaceCbTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0300',
                checkColorSpace, colorSpaceManager.ColorSpace.DISPLAY_P3, undefined)
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0400
         * @tc.desc   1.create imagesource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0400', Level.LEVEL0, async (done:Function)=> {
            let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
                expect(colorSpaceName == SRGB).assertTrue();
            }
            await applyColorSpaceCbTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0400',
                checkColorSpace, colorSpaceManager.ColorSpace.SRGB, undefined)
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0500
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0500
         * @tc.desc   1.create imagesource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0500', Level.LEVEL0, async (done:Function)=> {
            let bt2020:ESObject = {
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
            let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
                expect(colorSpaceName == CUSTOM).assertTrue();
            }
            await applyColorSpaceCbTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0500',
                checkColorSpace, bt2020, gamma)
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0100
         * @tc.desc   1.create imagesource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0100', Level.LEVEL0, async (done:Function)=> {
            await applyColorSpaceCbErrTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0100',
                'wrong')
        })
        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0200
         * @tc.desc   1.create imagesource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0200', Level.LEVEL0, async (done:Function)=> {
            await applyColorSpaceCbErrTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0200',
                100)
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0300
         * @tc.desc   1.create imagesource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0300', Level.LEVEL0, async (done:Function)=> {
            await applyColorSpaceCbErrTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0300',
                -100)
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0400
         * @tc.desc   1.create imagesource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0400', Level.LEVEL0, async (done:Function)=> {
            await applyColorSpaceCbErrTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0400',
                null)
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0100
         * @tc.desc   1.create imagesource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0100', Level.LEVEL0, async (done:Function)=> {
            await applyColorSpacePromiseErrTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0100',
                'wrong')
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0200
         * @tc.desc   1.create imagesource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0200', Level.LEVEL0, async (done:Function)=> {
            await applyColorSpacePromiseErrTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0200',
                100)
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0300
         * @tc.desc   1.create imagesource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0300', Level.LEVEL0, async (done:Function)=> {
            await applyColorSpacePromiseErrTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0300',
                -100)
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0400
         * @tc.desc   1.create imagesource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0400', Level.LEVEL0, async (done:Function)=> {
            await applyColorSpacePromiseErrTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0400',
                null)
        })
    })
}
