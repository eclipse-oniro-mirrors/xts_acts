/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import { iccbuf } from './testImg2'

let globalpixelmap: PixelMap;
let globalImagesource: image.ImageSource;
let globalPacker: image.ImagePacker;
let isSupportGifEncode:ESObject;


function genPicSource() {
    let data = iccbuf.buffer;
    return image.createImageSource(data);
}

function loger(caseName: string): ESObject {
    return {
        myName: caseName,
        log: (msg: ESObject) => {
            console.info(caseName + ' ' + msg);
        }
    }
}

async function packingCbFail(done: Function, testNum: string, args: ESObject) {
    let logger: ESObject = loger(`${testNum}`)
    try {
        let imageSource = genPicSource();
        logger.log("ImageSource " + (imageSource != undefined));
        if (imageSource == undefined) {
            console.info(`${testNum} create image source failed`);
            expect(false).assertTrue();
            done();
        } else {
            globalImagesource = imageSource;
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == undefined) {
                console.info(`${testNum} create image packer failed`);
                expect(false).assertTrue();
                done();
            } else {
                globalPacker = imagePackerApi;
                imagePackerApi.packing(imageSource, args, (err, data) => {
                    expect(data == undefined).assertTrue();
                    done();
                })
            }
        }
    } catch (error) {
        logger.log('failed ' + error);
        expect(false).assertTrue();
        done();
    }
}

async function packingPromiseFail(done: Function, testNum: string, args: ESObject) {
    let logger: ESObject = loger(`testNum`)
    try {
        let imageSource = genPicSource();
        logger.log("ImageSource " + (imageSource != undefined));
        if (imageSource == undefined) {
            console.info(`${testNum} create image source failed`);
            expect(false).assertTrue();
            done();
        } else {
            globalImagesource = imageSource;
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == undefined) {
                console.info(`${testNum} create image packer failed`);
                expect(false).assertTrue();
                done();
            } else {
                globalPacker = imagePackerApi;
                imagePackerApi.packing(imageSource, args).then(data => {
                    expect(data == undefined).assertTrue();
                    done();
                }).catch((error: ESObject) => {
                    console.log(` ${testNum} error: ` + error);
                    expect(true).assertTrue();
                    done();
                })
            }
        }
    } catch (error) {
        logger.log('failed ' + error);
        expect(false).assertTrue();
        done();
    }
}

export default function imageColorSpace() {
    describe('imageColorSpace', () => {

        beforeAll(async () => {
            console.info('beforeAll case');
            isSupportGifEncode = image.createImagePacker().supportedFormats.includes("image/gif");
        })

        beforeEach(() => {
            console.info('beforeEach case');
        })

        afterEach(async () => {
            if (globalpixelmap != undefined) {
                console.info("globalpixelmap release start");
                try {
                    await globalpixelmap.release();
                } catch (error) {
                    console.info("globalpixelmap release fail");
                }
            }
            if (globalImagesource != undefined) {
                console.info("globalImagesource release start");
                try {
                    await globalImagesource.release();
                } catch (error) {
                    console.info("globalImagesource release fail");
                }
            }
            if (globalPacker != undefined) {
                console.info("globalPacker release start");
                try {
                    await globalPacker.release();
                } catch (error) {
                    console.info("globalPacker release fail");
                }
            }
            console.info('afterEach case');
        })

        afterAll(async () => {
            console.info('afterAll case');
        })



        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_DECODE_0100
         * @tc.name      : Decode 
         * @tc.desc      : 1.create imagesource
         *                 2.create pixelmap
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_DECODE_0100', 0, async (done: Function) => {
            let logger: ESObject = loger('SUB_MULTIMEDIA_IMAGE_COLORSPACE_DECODE_0100')
            try {
                let imageSource = genPicSource();
                logger.log("ImageSource " + (imageSource != undefined));
                if (imageSource != undefined) {
                    globalImagesource = imageSource;
                    let pixelMap = await imageSource.createPixelMap();
                    globalpixelmap = pixelMap;
                    logger.log("PixelMap " + pixelMap);
                    logger.log("PixelMap " + (pixelMap != undefined));
                    expect(pixelMap != undefined).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }

        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_DECODE_CALLBACK_0100
         * @tc.name      : Decode -callback
         * @tc.desc      : 1.create imagesource
         *                 2.create pixelmap
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_DECODE_CALLBACK_0100', 0, async (done: Function) => {
            let logger: ESObject = loger('SUB_MULTIMEDIA_IMAGE_COLORSPACE_DECODE_CALLBACK_0100')
            try {
                let imageSource = genPicSource();
                logger.log("ImageSource " + (imageSource != undefined));
                if (imageSource != undefined) {
                    globalImagesource = imageSource;
                    imageSource.createPixelMap((err, pixelMap) => {
                        globalpixelmap = pixelMap;
                        logger.log("PixelMap " + pixelMap);
                        logger.log("PixelMap " + (pixelMap != undefined));
                        expect(pixelMap != undefined).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_CALLBACK_0100
         * @tc.name      : Encode -callback
         * @tc.desc      : 1.create imagesource
         *                 2.createImagePacker
         *                 3.packing
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_CALLBACK_0100', 0, async (done: Function) => {
            let logger: ESObject = loger('SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_CALLBACK_0100')
            let testNum = 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_CALLBACK_0100'
            try {
                let imageSource = genPicSource();
                logger.log("ImageSource " + (imageSource != undefined));
                if (imageSource == undefined) {
                    console.info(`${testNum} create image source failed`);
                    expect(false).assertTrue();
                    done();
                } else {
                    globalImagesource = imageSource;
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info(`${testNum} create image packer failed`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalPacker = imagePackerApi;
                        let packOpts: ESObject = { format: ["image/jpeg"], quality: 90 }
                        imagePackerApi.packing(imageSource, packOpts, (err, data) => {
                            expect(data != undefined).assertTrue();
                            let dataArr = new Uint8Array(data);
                            console.info(`${testNum} dataArr.length=` + dataArr.length);
                            for (let i = 0; i < dataArr.length; i++) {
                                console.info(`dataArr[` + i + `]=` + dataArr[i]);
                            }
                            done();
                        })
                    }
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }

        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_0100
         * @tc.name      : Encode -promise
         * @tc.desc      : 1.create imagesource
         *                 2.createImagePacker
         *                 3.packing
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_0100', 0, async (done: Function) => {
            let logger: ESObject = loger('SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_0100')
            let testNum = 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_0100'
            try {
                let imageSource = genPicSource();
                logger.log("ImageSource " + (imageSource != undefined));
                if (imageSource == undefined) {
                    console.info(`${testNum} create image source failed`);
                    expect(false).assertTrue();
                    done();
                } else {
                    globalImagesource = imageSource;
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info(`${testNum} create image packer failed`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalPacker = imagePackerApi;
                        let packOpts: ESObject = { format: ["image/jpeg"], quality: 90 }
                        imagePackerApi.packing(imageSource, packOpts).then(data => {
                            expect(data != undefined).assertTrue();
                            let dataArr = new Uint8Array(data);
                            console.info(`${testNum} dataArr.length=` + dataArr.length);
                            for (let i = 0; i < dataArr.length; i++) {
                                console.info(`dataArr[` + i + `]=` + dataArr[i]);
                            }

                            done();
                        }).catch((error: ESObject) => {
                            console.log('SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_0100 error: ' + error);
                            expect(false).assertTrue();
                            done();
                        })
                    }
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_CALLBACK_0200
         * @tc.name      : Encode -callback-
         * @tc.desc      : 1.create imagesource
         *                 2.createImagePacker
         *                 3.packing
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_CALLBACK_0200', 0, async (done: Function) => {
            if (isSupportGifEncode) {
                console.info("SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_CALLBACK_0200: The device support gif encode")
                expect(true).assertTrue();
                done();
            } else {
                let packOpts: ESObject = { format: ["image/gif"], quality: 90 }
                packingCbFail(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_CALLBACK_0200', packOpts)
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_CALLBACK_ERROR_FORMAT_0100
         * @tc.name      : Encode -callback-wrong format
         * @tc.desc      : 1.create imagesource
         *                 2.createImagePacker
         *                 3.packing
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_CALLBACK_ERROR_FORMAT_0100', 0, async (done: Function) => {
            let packOpts: ESObject = { format: ["image/jpeg"], quality: 200 }
            packingCbFail(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_CALLBACK_ERROR_FORMAT_0100', packOpts)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_CALLBACK_NO_QUALITY_0100
         * @tc.name      : Encode -callback-no quality
         * @tc.desc      : 1.create imagesource
         *                 2.createImagePacker
         *                 3.packing
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_CALLBACK_NO_QUALITY_0100', 0, async (done: Function) => {
            let packOpts: ESObject = { format: ["image/jpeg"] }
            packingCbFail(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_CALLBACK_NO_QUALITY_0100', packOpts)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_CALLBACK_NO_FORMAT_0100
         * @tc.name      : Encode -callback-no format
         * @tc.desc      : 1.create imagesource
         *                 2.createImagePacker
         *                 3.packing
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_CALLBACK_NO_FORMAT_0100', 0, async (done: Function) => {
            let packOpts: ESObject = { quality: 50 }
            packingCbFail(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_CALLBACK_NO_FORMAT_0100', packOpts)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_0200
         * @tc.name      : Encode -promise
         * @tc.desc      : 1.create imagesource
         *                 2.createImagePacker
         *                 3.packing
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_0200', 0, async (done: Function) => {
            if (isSupportGifEncode) {
                console.info("SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_0200: The device support gif encode")
                expect(true).assertTrue();
                done();
            } else {
                let packOpts: ESObject = { format: ["image/gif"], quality: 90 }
                packingPromiseFail(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_0200', packOpts)
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_0300
         * @tc.name      : Encode -promise
         * @tc.desc      : 1.create imagesource
         *                 2.createImagePacker
         *                 3.packing
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_0300', 0, async (done: Function) => {
            let packOpts: ESObject = { format: ["image/jpeg"], quality: 101 }
            packingPromiseFail(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_0300', packOpts)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_NO_QUALITY_0100
         * @tc.name      : Encode -promise -no quality
         * @tc.desc      : 1.create imagesource
         *                 2.createImagePacker
         *                 3.packing
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_NO_QUALITY_0100', 0, async (done: Function) => {
            let packOpts: ESObject = { format: ["image/jpeg"] }
            packingPromiseFail(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_NO_QUALITY_0100', packOpts)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_NO_FORMAT_0100
         * @tc.name      : Encode -promise -no format
         * @tc.desc      : 1.create imagesource
         *                 2.createImagePacker
         *                 3.packing
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_NO_FORMAT_0100', 0, async (done: Function) => {
            let packOpts: ESObject = { quality: 100 }
            packingPromiseFail(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_NO_FORMAT_0100', packOpts)
        })

    })
}
