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

import image from '@ohos.multimedia.image';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Hypium, Level  } from '../../../hypium/index';
import hilog from '@ohos.hilog';
import fs from '@ohos.file.fs';
import { initialize } from './AbilityContextHelper.test';

class Logger {
    testNum: string;

    constructor(testNum: string) {
        this.testNum = testNum;
    }

    log(msg: string) {
        hilog.info(0x0000, "imagePicture", 'case: %{public}s msg:%{public}s', this.testNum, msg);
    }
}

export default function imageColorSpace() {
    let globalpixelmap: image.PixelMap | undefined = undefined;
    let globalImagesource: image.ImageSource | undefined = undefined;
    let globalPacker: image.ImagePacker | undefined = undefined;
    let isSupportGifEncode: boolean;
    let filesDir: string | undefined | null;
    let cacheDir: string | undefined | null;

    describe('imageColorSpace', () => {
        beforeAll(() => {
            console.info('beforeAll case');
            await initialize();
            filesDir = Hypium.get('filesDir') as string | undefined | null;
            cacheDir = Hypium.get('cacheDir') as string | undefined | null;
            isSupportGifEncode = image.createImagePacker().supportedFormats.includes("image/gif");
        })

        beforeEach(() => {
            console.info('beforeEach case');
        })

        afterEach(async () => {
            if (globalpixelmap != undefined) {
                console.info("globalpixelmap release start");
                try {
                    await globalpixelmap!.release();
                } catch (error) {
                    console.info("globalpixelmap release fail");
                }
            }
            if (globalImagesource != undefined) {
                console.info("globalImagesource release start");
                try {
                    await globalImagesource!.release();
                } catch (error) {
                    console.info("globalImagesource release fail");
                }
            }
            if (globalPacker != undefined) {
                console.info("globalPacker release start");
                try {
                    await globalPacker!.release();
                } catch (error) {
                    console.info("globalPacker release fail");
                }
            }
            console.info('afterEach case');
        })

        afterAll(async () => {
            console.info('afterAll case');
        })

    const getBuffer = (fileName: string) => {
        const filePath = filesDir + '/' + fileName;
        let file = fs.openSync(filePath);
        const stats = fs.statSync(filePath);
        const fileSize = stats.size;
        const bufferRead = new ArrayBuffer(fileSize)
        fs.readSync(file.fd, bufferRead)
        return bufferRead;
    }

    const genPicSource = () => {
        let data = getBuffer("iccbuf.jpg")
        return image.createImageSource(data);
    }

    const packingCbFail = async (done: () => void, testNum: string, opts: image.PackingOption) => {
        let logger = new Logger(testNum);
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
                    try {
                        let data = await imagePackerApi.packToData(imageSource, opts);
                        expect(data == undefined).assertTrue();
                        done();
                    } catch (error) {
                        console.log(` ${testNum} error: ` + error);
                        expect(true).assertTrue();
                        done();
                    }
                }
            }
        } catch (error) {
            logger.log('failed ' + error);
            expect(false).assertTrue();
            done();
        }
    }

    const packingPromiseFail = async (done: () => void, testNum: string, opts: image.PackingOption) => {
        let logger = new Logger(testNum);
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
                    try {
                        let data = await imagePackerApi.packToData(imageSource, opts);
                        expect(data == undefined).assertTrue();
                        done();
                    } catch (error) {
                        console.log(` ${testNum} error: ` + error);
                        expect(true).assertTrue();
                        done();
                    }
                }
            }
        } catch (error) {
            logger.log('failed ' + error);
            expect(false).assertTrue();
            done();
        }
    }

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_DECODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_DECODE_STATIC_0100
         * @tc.desc   Decode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_DECODE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
            let logger = new Logger('SUB_MULTIMEDIA_IMAGE_COLORSPACE_DECODE_STATIC_0100');
            try {
                let imageSource = genPicSource();
                logger.log("ImageSource " + (imageSource != undefined));
                if (imageSource != undefined) {
                    globalImagesource = imageSource;
                    let pixelMap = await imageSource.createPixelMap();
                    globalpixelmap = pixelMap!;
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
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_DECODE_CALLBACK_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_DECODE_CALLBACK_STATIC_0100
         * @tc.desc   Decode -callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_DECODE_CALLBACK_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
            let logger = new Logger('SUB_MULTIMEDIA_IMAGE_COLORSPACE_DECODE_CALLBACK_STATIC_0100');
            try {
                let imageSource = genPicSource();
                logger.log("ImageSource " + (imageSource != undefined));
                if (imageSource != undefined) {
                    globalImagesource = imageSource;
                    imageSource.createPixelMap((err, pixelMap) => {
                        globalpixelmap = pixelMap!;
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
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_STATIC_0100
         * @tc.desc   Encode -promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
            let testNum = 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_STATIC_0100'
            let logger = new Logger(testNum);
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
                        let packOpts: image.PackingOption = { format: "image/jpeg", quality: 90 }
                        try {
                            let data = await imagePackerApi.packToData(imageSource, packOpts);
                            expect(data != undefined).assertTrue();
                            let dataArr = new Uint8Array(data);
                            console.info(`${testNum} dataArr.length=` + dataArr.length);
                            for (let i = 0; i < dataArr.length; i++) {
                                hilog.info(0x0000, "SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_STATIC_0100", `dataArr[` + i + `]=` + dataArr[i]);
                            }
                            done();
                        } catch (error) {
                            console.log('SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_STATIC_0100 error: ' + error);
                            expect(false).assertTrue();
                            done();
                        }
                    }
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_CALLBACK_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_CALLBACK_STATIC_0200
         * @tc.desc   Encode -callback-
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_CALLBACK_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
            if (isSupportGifEncode) {
                console.info("SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_CALLBACK_STATIC_0200: The device support gif encode")
		expect(isSupportGifEncode).assertTrue();
                done();
            } else {
                let packOpts: image.PackingOption = { format: "image/gif", quality: 90 }
                packingCbFail(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_CALLBACK_STATIC_0200', packOpts)
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_CALLBACK_ERROR_FORMAT_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_CALLBACK_ERROR_FORMAT_STATIC_0100
         * @tc.desc   Encode -callback-wrong format
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_CALLBACK_ERROR_FORMAT_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
            let packOpts: image.PackingOption = { format: "image/jpeg", quality: 200 }
            packingCbFail(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_CALLBACK_ERROR_FORMAT_STATIC_0100', packOpts)
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_STATIC_0200
         * @tc.desc   Encode -promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
            if (isSupportGifEncode) {
                console.info("SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_STATIC_0200: The device support gif encode")
                expect(isSupportGifEncode).assertTrue();
                done();
            } else {
                let packOpts: image.PackingOption = { format: "image/gif", quality: 90 }
                packingPromiseFail(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_STATIC_0200', packOpts)
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_STATIC_0300
         * @tc.desc   Encode -promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
            let packOpts: image.PackingOption = { format: "image/jpeg", quality: 101 }
            packingPromiseFail(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_STATIC_0300', packOpts)
        })

    })
}
