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

import image from "@ohos.multimedia.image";
import fileio from "@ohos.fileio";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import featureAbility from "@ohos.ability.featureAbility";
import { BusinessError } from '@ohos.base';


let filePath: ESObject;
let fdNumber: number;
let globalpixelmap: PixelMap;
let globalimageSource: image.ImageSource;

async function getFd(fileName:string) {
  let context: ESObject = await AppStorage.get('thisContext');
  filePath = context.filesDir + "/" + fileName;
  console.info("image case filePath is " + filePath);
  await fileio
    .open(filePath)
    .then(
      (data) => {
        fdNumber = data;
        console.info("image case open fd success " + fdNumber);
      },
      (err: BusinessError) => {
        console.info("image cese open fd fail" + err);
      }
    )
    .catch((err: BusinessError) => {
      console.info("image case open fd err " + err);
    });
}

async function checkImageInfo(testNum: string, pixelMap: image.PixelMap, width: number, height: number) {
    let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
    let imageWidth: number = imageInfo.size.width;
    console.info(testNum + 'imageWidth is ' + imageWidth);
    expect(imageWidth == width).assertTrue();
    let imageHeight: number = imageInfo.size.height;
    console.info(testNum + 'imageHeight is ' + imageHeight);
    expect(imageHeight == height).assertTrue();
}

async function checkDecode(done: Function, testNum: string, picture: string, decodingOptions: image.DecodingOptions, imageWidth: number, imageHeight: number, pixelX: number, pixelY: number, rowOffset: number, R: number, G: number, B: number, A: number) {
    try {
        await getFd(picture);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info(testNum + " create image source failed");
            expect(false).assertTrue();
            done();
        } else {
            globalimageSource = imageSourceApi;
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                if (err) {
                    console.info(testNum + " createPixelMap error " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                } else {
                    globalpixelmap = pixelmap;
                    expect(pixelmap != undefined).assertTrue();
                    checkImageInfo(testNum, pixelmap, imageWidth, imageHeight);
                    let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                    console.info(testNum + ' input pixel Bytes Number is' + pixelBytesNumber);
                    let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                    pixelmap.readPixelsToBufferSync(colorsBuffer);
                    let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);
                    checkPixelValues(done, testNum, pixelX, pixelY, rowOffset, bufferArr, R, G, B, A);
                    done();
                }
            });
        }
    } catch (error) {
        console.info(testNum + " error: " + error);
        expect(false).assertTrue();
        done();
    }
}

async function checkHeicDecode(done: Function, testNum: string, picture: string, decodingOptions: image.DecodingOptions, imageWidth: number, imageHeight: number, pixelX: number, pixelY: number, rowOffset: number, R: number, G: number, B: number, A: number) {
    try {
        await getFd(picture);
        let imageSourceApi = image.createImageSource(fdNumber);
        expect(imageSourceApi != undefined).assertTrue();
        let isSupportHEIFDecode: boolean = imageSourceApi.supportedFormats.includes("image/heic");
        console.info('isSupportHEIFDecode is ' + isSupportHEIFDecode)
        if (!isSupportHEIFDecode) {
            console.info('device does not support heic');
            globalimageSource = imageSourceApi;
            done();
            return
        } else {
            globalimageSource = imageSourceApi;
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                if (err) {
                    console.info(testNum + " createPixelMap error " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                } else {
                    globalpixelmap = pixelmap;
                    expect(pixelmap != undefined).assertTrue();
                    checkImageInfo(testNum, pixelmap, imageWidth, imageHeight);
                    let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                    console.info(testNum + ' input pixel Bytes Number is' + pixelBytesNumber);
                    let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                    pixelmap.readPixelsToBufferSync(colorsBuffer);
                    let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);
                    checkPixelValues(done, testNum, pixelX, pixelY, rowOffset, bufferArr, R, G, B, A);
                    done();
                }
            });
        }
    } catch (error) {
        console.info(testNum + " error: " + error);
        expect(false).assertTrue();
        done();
    }
}

async function checkDecodeErr(done: Function, testNum: string, picture: string, decodingOptions: image.DecodingOptions) {
    try {
        await getFd(picture);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info(testNum + " create image source failed");
            expect(false).assertTrue();
            done();
        } else {
            globalimageSource = imageSourceApi;
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                if (err) {
                    console.info(testNum + " Successed in expecting createPixelMap fail " + JSON.stringify(err));
                    done();
                } else {
                    console.info(testNum + " Failed to expect createPixelMap fail" + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                }
            });
        }
    } catch (error) {
        console.info(testNum + " error: " + error);
        expect(false).assertTrue();
        done();
    }
}

async function checkHeicDecodeErr(done: Function, testNum: string, picture: string, decodingOptions: image.DecodingOptions) {
    try {
        await getFd(picture);
        let imageSourceApi = image.createImageSource(fdNumber);
        let isSupportHEIFDecode: boolean = imageSourceApi.supportedFormats.includes("image/heic");
        console.info('isSupportHEIFDecode is ' + isSupportHEIFDecode)
        if (!isSupportHEIFDecode) {
            console.info('device does not support heic');
            globalimageSource = imageSourceApi;
            done();
            return
        } else {
            globalimageSource = imageSourceApi;
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                if (err) {
                    console.info(testNum + " Successed in expecting createPixelMap fail " + JSON.stringify(err));
                    done();
                } else {
                    console.info(testNum + " Failed to expect createPixelMap fail" + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                }
            });
        }
    } catch (error) {
        console.info(testNum + " error: " + error);
        expect(false).assertTrue();
        done();
    }
}

async function checkPixelValues(done: Function , testNum: string, x: number, y: number, rowOffset: number, bufferArr: Uint8Array, Red: number | undefined, Green: number | undefined, Blue: number | undefined, Alpha: number | undefined) {
    let index = (y * rowOffset + x) * 4;
    console.info('index is ' + bufferArr[index]);
    console.info('index + 1 is ' + bufferArr[index + 1]);
    console.info('index + 2 is ' + bufferArr[index + 2]);
    console.info('index + 3 is ' + bufferArr[index + 3]);
     if (bufferArr[index] == Red && bufferArr[index + 1] == Green && bufferArr[index + 2] == Blue && bufferArr[index + 3] == Alpha) {
        console.info(testNum + ' Successed in checking pixel values');
        done();
    } else {
        console.info(testNum + ' Failed to check pixel values');
        expect().assertFail();
        done();
    }
}

export default function imagePixelLocation() {
    describe("imagePixelLocation", () => {
        beforeAll(async () => {
            console.info("beforeAll case");
        });

        beforeEach(() => {
            console.info("beforeEach case");
        });

        afterEach(async () => {
            if (globalpixelmap != undefined) {
                console.info("globalpixelmap release start");
                try {
                    await globalpixelmap.release();
                } catch (error) {
                    console.info("globalpixelmap release fail");
                    expect().assertFail();
                }
            }
            if (globalimageSource != undefined) {
                console.info('globalimageSource release start');
                try {
                    await globalimageSource.release();
                } catch (error) {
                    console.info('globalimageSource release fail');
                    expect().assertFail();
                }
            }
            console.info("afterEach case");
        });

        afterAll(async () => {
            console.info("afterAll case");
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0100
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode the entire picture
         *                 2、Check four color
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0100", Level.LEVEL0, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0100' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(tag + " create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 256, height: 256 },
                        rotate: 0,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 256, width: 256 }, x: 0, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(tag + " createPixelMap error  " + JSON.stringify(err));
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            checkImageInfo(tag, pixelmap, 256, 256);
                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);
                            checkPixelValues(done, tag, 60, 60, 256, bufferArr, 255, 0, 0, 255);
                            checkPixelValues(done, tag, 200, 60, 256, bufferArr, 0, 255, 0, 255);
                            checkPixelValues(done, tag, 60, 200, 256, bufferArr, 0, 0, 255, 255);
                            checkPixelValues(done, tag, 200, 200, 256, bufferArr, 120, 120, 120, 255);
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0200
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode red part, Zoom out
         *                 2、check red pixel location
         *                 3、check other corners have been cut
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0200", Level.LEVEL1, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0200' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(tag + " create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 128, height: 128 },
                        rotate: 0,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 128, width: 128 }, x: 0, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(tag + " createPixelMap error  " + JSON.stringify(err));
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            checkImageInfo(tag, pixelmap, 128, 128);
                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);
                            checkPixelValues(done, tag, 125, 125, 128, bufferArr, 255, 0, 0, 255);
                            checkPixelValues(done, tag, 200, 200, 256, bufferArr, undefined, undefined, undefined, undefined);
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0300
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode green part, Zoom out
         *                 2、check green pixel location
         *                 3、check other corners have been cut
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0300", Level.LEVEL1, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0300' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(tag + " create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 128, height: 128 },
                        rotate: 0,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 128, width: 128 }, x: 128, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(tag + " createPixelMap error  " + JSON.stringify(err));
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            checkImageInfo(tag, pixelmap, 128, 128);
                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);
                            checkPixelValues(done, tag, 125, 125, 128, bufferArr, 0, 255, 0, 255);
                            checkPixelValues(done, tag, 200, 200, 256, bufferArr, undefined, undefined, undefined, undefined);
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0400
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode blue part, Zoom out
         *                 2、check blue pixel location
         *                 3、check other corners have been cut
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0400", Level.LEVEL1, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0400' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(tag + " create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 128, height: 128 },
                        rotate: 0,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 128, width: 128 }, x: 0, y: 128 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(tag + " createPixelMap error  " + JSON.stringify(err));
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            checkImageInfo(tag, pixelmap, 128, 128);
                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);
                            checkPixelValues(done, tag, 125, 125, 128, bufferArr, 0, 0, 255, 255);
                            checkPixelValues(done, tag, 200, 200, 256, bufferArr, undefined, undefined, undefined, undefined);
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0500
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode grey part, Zoom out
         *                 2、check grey pixel location
         *                 3、check other corners have been cut
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0500", Level.LEVEL1, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0500' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(tag + " create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 128, height: 128 },
                        rotate: 0,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 128, width: 128 }, x: 128, y: 128 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                tag + " createPixelMap error  " +
                                    JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            checkImageInfo(tag, pixelmap, 128, 128);
                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);
                            checkPixelValues(done, tag, 125, 125, 128, bufferArr, 120, 120, 120, 255);
                            checkPixelValues(done, tag, 200, 200, 256, bufferArr, undefined, undefined, undefined, undefined);
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0600
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode red part, Zoom in
         *                 2、check red pixel location
         *                 3、check other corners have been cut
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0600", Level.LEVEL1, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0600' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(tag + " create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 512, height: 512 },
                        rotate: 0,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 128, width: 128 }, x: 0, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                tag + " createPixelMap error  " +
                                    JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            checkImageInfo(tag, pixelmap, 512, 512);
                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);
                            checkPixelValues(done, tag, 500, 500, 512, bufferArr, 255, 0, 0, 255);
                            checkPixelValues(done, tag, 550, 550, 1024, bufferArr, undefined, undefined, undefined, undefined);
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0700
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode green part, Zoom in
         *                 2、check green pixel location
         *                 3、check other corners have been cut
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0700", Level.LEVEL1, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0700' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(tag + " create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 512, height: 512 },
                        rotate: 0,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 128, width: 128 }, x: 128, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                tag + " createPixelMap error  " +
                                    JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            checkImageInfo(tag, pixelmap, 512, 512);
                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);
                            checkPixelValues(done, tag, 500, 500, 512, bufferArr, 0, 255, 0, 255);
                            checkPixelValues(done, tag, 550, 550, 1024, bufferArr, undefined, undefined, undefined, undefined);
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0800
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode blue part, Zoom in
         *                 2、check blue pixel location
         *                 3、check other corners have been cut
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0800", Level.LEVEL1, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0800' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(tag + " create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 512, height: 512 },
                        rotate: 0,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 128, width: 128 }, x: 0, y: 128 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(tag + " createPixelMap error  " + JSON.stringify(err));
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            checkImageInfo(tag, pixelmap, 512, 512);
                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);
                            checkPixelValues(done, tag, 500, 500, 512, bufferArr, 0, 0, 255, 255);
                            checkPixelValues(done, tag, 550, 550, 1024, bufferArr, undefined, undefined, undefined, undefined);
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });
		
		/**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0900
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode grey part, Zoom in
         *                 2、check grey pixel location
         *                 3、check other corners have been cut
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0900", Level.LEVEL1, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0900' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(tag + " create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 512, height: 512 },
                        rotate: 0,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 128, width: 128 }, x: 128, y: 128 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(tag + " createPixelMap error  " + JSON.stringify(err));
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            checkImageInfo(tag, pixelmap, 512, 512);
                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);
                            checkPixelValues(done, tag, 500, 500, 512, bufferArr, 120, 120, 120, 255);
                            checkPixelValues(done, tag, 550, 550, 1024, bufferArr, undefined, undefined, undefined, undefined);
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1000
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode red part, Original image scale
         *                 2、check red pixel location
         *                 3、check other corners have been cut
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1000", Level.LEVEL1, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1000' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(tag + " create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 256, height: 256 },
                        rotate: 0,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 128, width: 128 }, x: 0, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(tag + " createPixelMap error  " + JSON.stringify(err));
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            checkImageInfo(tag, pixelmap, 256, 256);
                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);
                            checkPixelValues(done, tag, 200, 200, 256, bufferArr, 255, 0, 0, 255);
                            checkPixelValues(done, tag, 300, 300, 512, bufferArr, undefined, undefined, undefined, undefined);
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1100
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode green part, Original image scale
         *                 2、check green pixel location
         *                 3、check other corners have been cut
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1100", Level.LEVEL1, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1100' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(tag + " create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 256, height: 256 },
                        rotate: 0,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 128, width: 128 }, x: 128, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(tag + " createPixelMap error  " + JSON.stringify(err));
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            checkImageInfo(tag, pixelmap, 256, 256);
                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);
                            checkPixelValues(done, tag, 200, 200, 256, bufferArr, 0, 255, 0, 255);
                            checkPixelValues(done, tag, 300, 300, 512, bufferArr, undefined, undefined, undefined, undefined);
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1200
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode blue part, Original image scale
         *                 2、check blue pixel location
         *                 3、check other corners have been cut
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1200", Level.LEVEL1, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1200' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(tag + " create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 256, height: 256 },
                        rotate: 0,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 128, width: 128 }, x: 0, y: 128 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(tag + " createPixelMap error  " + JSON.stringify(err));
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            checkImageInfo(tag, pixelmap, 256, 256);
                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);
                            checkPixelValues(done, tag, 200, 200, 256, bufferArr, 0, 0, 255, 255);
                            checkPixelValues(done, tag, 300, 300, 512, bufferArr, undefined, undefined, undefined, undefined);
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1300
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode grey part, Original image scale
         *                 2、check grey pixel location
         *                 3、check other corners have been cut
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1300", Level.LEVEL1, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1300' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(tag + " create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 256, height: 256 },
                        rotate: 0,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 128, width: 128 }, x: 128, y: 128 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(tag + " createPixelMap error  " + JSON.stringify(err));
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            checkImageInfo(tag, pixelmap, 256, 256);
                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);
                            checkPixelValues(done, tag, 200, 200, 256, bufferArr, 120, 120, 120, 255);
                            checkPixelValues(done, tag, 300, 300, 512, bufferArr, undefined, undefined, undefined, undefined);
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1400
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode red part, rotate 45
         *                 2、check red pixel location
         *                 3、check Rotated blank pixels are transparent
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1400", Level.LEVEL1, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1400' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(tag + " create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 362, height: 362 },
                        rotate: 45,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 128, width: 128 }, x: 0, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(tag + " createPixelMap error  " + JSON.stringify(err));
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            // 像素地图始终保持矩形，解码、旋转后，像素地图拉伸，计算得出为像素宽高为原图对角线长度
                            checkImageInfo(tag, pixelmap, 362, 362);
                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);
                            checkPixelValues(done, tag, 200, 200, 362, bufferArr, 255, 0, 0, 255);
                            // 像素地图始终保持矩形，解码、旋转后，像素地图拉伸，但原图比像素地图小，像素地图存在空白，空白处RGBA为0000
                            checkPixelValues(done, tag, 1, 1, 362, bufferArr, 0, 0, 0, 0);
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1500
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode grey part, rotate 135
         *                 2、check grey pixel location
         *                 3、check Rotated blank pixels are transparent
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1500", Level.LEVEL1, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1500' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(tag + " create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 362, height: 362 },
                        rotate: 135,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 128, width: 128 }, x: 128, y: 128 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(tag + " createPixelMap error  " + JSON.stringify(err));
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            // 像素地图始终保持矩形，解码、旋转后，像素地图拉伸，计算得出为像素宽高为原图对角线长度
                            checkImageInfo(tag, pixelmap, 362, 362);
                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);
                            checkPixelValues(done, tag, 200, 200, 362, bufferArr, 120, 120, 120, 255);
                            // 像素地图始终保持矩形，解码、旋转后，像素地图拉伸，但原图比像素地图小，像素地图存在空白，空白处RGBA为0000
                            checkPixelValues(done, tag, 1, 1, 362, bufferArr, 0, 0, 0, 0);
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1600
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode all part, rotate 45
         *                 2、Check that the green area turns red.
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1600", Level.LEVEL1, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1600' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(tag + " create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 256, height: 256 },
                        rotate: 45,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 256, width: 256 }, x: 0, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(tag + " createPixelMap error  " + JSON.stringify(err));
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            checkImageInfo(tag, pixelmap, 256, 256);
                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);
                            // 旋转45度后，原坐标由绿色变成红色
                            checkPixelValues(done, tag, 135, 60, 362, bufferArr, 255, 0, 0, 255);
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0010
         * @tc.name      : DefaultStrategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0010", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0010';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 800, height: 800 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 0, y: 0 }
            };
            await checkDecode(done, tag, 'pixel_bmp_1440x1920.bmp', decodingOptions, 800, 800, 799, 799, 800, 0, 0, 255, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0020
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0020", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0020';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 800, height: 800 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_bmp_1440x1920.bmp', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0030
         * @tc.name      : CropFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0030", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0030';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 800, height: 800 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_bmp_1440x1920.bmp', decodingOptions, 800, 800, 799, 799, 800, 0, 0, 255, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0040
         * @tc.name      : Default Strategy 
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0040", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0040';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440  },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 2000 }, x: -100, y: -100 }
            };
            await checkDecodeErr(done, tag, 'pixel_bmp_1440x1920.bmp', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0050
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0050", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0050';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 2000 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_bmp_1440x1920.bmp', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0060
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0060", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0060';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 2000 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_bmp_1440x1920.bmp', decodingOptions);
        });
                
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0070
         * @tc.name      : Default Strategy 
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0070", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0070';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440  },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 300, height: 300 }, x: 1500, y: 2000 }
            };
            await checkDecodeErr(done, tag, 'pixel_bmp_1440x1920.bmp', decodingOptions);
        });
                
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0080
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0080", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0080';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440  },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 300, height: 300 }, x: 1500, y: 2000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_bmp_1440x1920.bmp', decodingOptions);
        }); 

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0090
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0090", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0090';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440  },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 300, height: 300 }, x: 1500, y: 2000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_bmp_1440x1920.bmp', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0100
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0100", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0100';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 1000, y: 1000 }
            };
            await checkDecode(done, tag, 'pixel_bmp_1440x1920.bmp', decodingOptions, 960, 1440, 200, 200, 960, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0110
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0110", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0110';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 1000, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_bmp_1440x1920.bmp', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0120
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0120", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0120';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 1000, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_bmp_1440x1920.bmp', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0130
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0130", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0130';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 3000 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_bmp_3072x4096.bmp', decodingOptions, 1000, 2000, 950, 1950, 1000, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0140
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0140", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0140';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 3000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_bmp_3072x4096.bmp', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0150
         * @tc.name      : CropFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0150", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0150';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 3000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_bmp_3072x4096.bmp', decodingOptions, 1000, 2000, 950, 1950, 1000, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0160
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0160", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0160';
            let decodingOptions: image.DecodingOptions = {
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_bmp_3072x4096.bmp', decodingOptions, 1000, 1500, 100, 100, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0170
         * @tc.name      : ScaleFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0170", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0170';
            let decodingOptions: image.DecodingOptions = {
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecode(done, tag, 'pixel_bmp_3072x4096.bmp', decodingOptions, 1000, 1500, 100, 100, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0180
         * @tc.name      : CropFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0180", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0180';
            let decodingOptions: image.DecodingOptions = {
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_bmp_3072x4096.bmp', decodingOptions, 1000, 1500, 100, 100, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0190
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0190", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0190';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 1000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_bmp_3072x4096.bmp', decodingOptions, 1000, 1000, 900, 900, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0200
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0200", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0200';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 1000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_bmp_3072x4096.bmp', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0210
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0210", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0210';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 1000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_bmp_3072x4096.bmp', decodingOptions, 1000, 1000, 900, 900, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0220
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0220", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0220';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4000, height: 5000 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_bmp_3072x4096.bmp', decodingOptions, 1000, 2000, 900, 1900, 1000, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0230
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0230", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0230';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4000, height: 5000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_bmp_3072x4096.bmp', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0240
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0240", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0240';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4000, height: 5000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_bmp_3072x4096.bmp', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0250
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0250", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0250';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 2000, height: 3000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: -100, y: -100 }
            };
            await checkDecodeErr(done, tag, 'pixel_bmp_3072x4096.bmp', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0260
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0260", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0260';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 2000, height: 3000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_bmp_3072x4096.bmp', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0270
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0270", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0270';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 2000, height: 3000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_bmp_3072x4096.bmp', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0280
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0280", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0280';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 4000, height: 5000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_bmp_3072x4096.bmp', decodingOptions, 4000, 5000, 3900, 4900, 4000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0290
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0290", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0290';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 4000, height: 5000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecode(done, tag, 'pixel_bmp_3072x4096.bmp', decodingOptions, 1000, 1500, 950, 1450, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0300
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0300", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0300';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 4000, height: 5000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_bmp_3072x4096.bmp', decodingOptions, 4000, 5000, 3900, 4900, 4000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0310
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0310", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0310';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 3072, height: 4096 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4096, height: 6144 }, x: 800, y: 1000 }
            };
            await checkDecode(done, tag, 'pixel_bmp_6144x8192.bmp', decodingOptions, 3072, 4096, 3000, 4000, 3072, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0320
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0320", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0320';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 3072, height: 4096 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4096, height: 6144 }, x: 800, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_bmp_6144x8192.bmp', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0330
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0330", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0330';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 3072, height: 4096 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4096, height: 6144 }, x: 800, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_bmp_6144x8192.bmp', decodingOptions, 3072, 4096, 3000, 4000, 3072, 120, 120, 120, 255);
        });
        
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0340
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0340", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0340';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 240, height: 180 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 240, height: 180 }, x: 0, y: 0 }
            };
            await checkDecode(done, tag, 'pixel_bmp_480x360.bmp', decodingOptions, 240, 180, 200, 150, 240, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0350
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0350", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0350';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 240, height: 180 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 240, height: 180 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecode(done, tag, 'pixel_bmp_480x360.bmp', decodingOptions, 240, 180, 200, 150, 240, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0360
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0360", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0360';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 240, height: 180 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 240, height: 180 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_bmp_480x360.bmp', decodingOptions, 240, 180, 200, 150, 240, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0370
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0370", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0370';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 360, height: 240 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 360, height: 240 }, x: 50, y: 50 }
            };
            await checkDecode(done, tag, 'pixel_bmp_481x361.bmp', decodingOptions, 360, 240, 240, 180, 360, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0380
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0380", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0380';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 360, height: 240 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 360, height: 240 }, x: 50, y: 50 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_bmp_481x361.bmp', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0390
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0390", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0390';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 360, height: 240 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 360, height: 240 }, x: 50, y: 50 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_bmp_481x361.bmp', decodingOptions, 360, 240, 240, 180, 360, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0400
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0400", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0400';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 800, height: 800 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 0, y: 0 }
            };
            await checkDecode(done, tag, 'pixel_gif_1440x1920.gif', decodingOptions, 800, 800, 790, 790, 800, 0, 0, 255, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0410
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0410", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0410';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 800, height: 800 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_gif_1440x1920.gif', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0420
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0420", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0420';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 800, height: 800 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_gif_1440x1920.gif', decodingOptions, 800, 800, 790, 790, 800, 0, 0, 255, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0430
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0430", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0430';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 2000 }, x: -100, y: -100 }
            };
            await checkDecodeErr(done, tag, 'pixel_gif_1440x1920.gif', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0440
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0440", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0440';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 2000 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_gif_1440x1920.gif', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0450
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0450", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0450';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 2000 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_gif_1440x1920.gif', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0460
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0460", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0460';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 300, height: 300 }, x: 1500, y: 2000 }
            };
            await checkDecodeErr(done, tag, 'pixel_gif_1440x1920.gif', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0470
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0470", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0470';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 300, height: 300 }, x: 1500, y: 2000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_gif_1440x1920.gif', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0480
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0480", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0480';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 300, height: 300 }, x: 1500, y: 2000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_gif_1440x1920.gif', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0490
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0490", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0490';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 1000, y: 1000 }
            };
            await checkDecode(done, tag, 'pixel_gif_1440x1920.gif', decodingOptions, 960, 1440, 950, 1400, 960, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0500
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0500", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0500';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 1000, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_gif_1440x1920.gif', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0510
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0510", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0510';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 1000, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_gif_1440x1920.gif', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0520
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0520", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0520';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 3000 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_gif_3072x4096.gif', decodingOptions, 1000, 2000, 950, 1950, 1000, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0530
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0530", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0530';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 3000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_gif_3072x4096.gif', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0540
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0540", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0540';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 3000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_gif_3072x4096.gif', decodingOptions, 1000, 2000, 950, 1950, 1000, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0550
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0550", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0550';
            let decodingOptions: image.DecodingOptions = {
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_gif_3072x4096.gif', decodingOptions, 1000, 1500, 900, 1400, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0560
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0560", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0560';
            let decodingOptions: image.DecodingOptions = {
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecode(done, tag, 'pixel_gif_3072x4096.gif', decodingOptions, 1000, 1500, 900, 1400, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0570
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0570", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0570';
            let decodingOptions: image.DecodingOptions = {
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_gif_3072x4096.gif', decodingOptions, 1000, 1500, 900, 1400, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0580
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0580", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0580';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 1000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_gif_3072x4096.gif', decodingOptions, 1000, 1000, 900, 900, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0590
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0590", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0590';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 1000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_gif_3072x4096.gif', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0600
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0600", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0600';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 1000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_gif_3072x4096.gif', decodingOptions, 1000, 1000, 900, 900, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0610
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0610", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0610';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4000, height: 5000 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_gif_3072x4096.gif', decodingOptions, 1000, 2000, 900, 1900, 1000, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0620
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0620", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0620';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4000, height: 5000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_gif_3072x4096.gif', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0630
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0630", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0630';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4000, height: 5000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_gif_3072x4096.gif', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0640
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0640", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0640';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 2000, height: 3000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: -100, y: -100 }
            };
            await checkDecodeErr(done, tag, 'pixel_gif_3072x4096.gif', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0650
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0650", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0650';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 2000, height: 3000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_gif_3072x4096.gif', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0660
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0660", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0660';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 2000, height: 3000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_gif_3072x4096.gif', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0670
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0670", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0670';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 4000, height: 5000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_gif_3072x4096.gif', decodingOptions, 4000, 5000, 900, 1400, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0680
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0680", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0680';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 4000, height: 5000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecode(done, tag, 'pixel_gif_3072x4096.gif', decodingOptions, 1000, 1500, 900, 1400, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0690
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0690", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0690';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 4000, height: 5000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_gif_3072x4096.gif', decodingOptions, 4000, 5000, 900, 1400, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0700
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0700", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0700';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 3072, height: 4096 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4096, height: 6144 }, x: 800, y: 1000 }
            };
            await checkDecode(done, tag, 'pixel_gif_6144x8192.gif', decodingOptions, 3072, 4096, 3000, 4000, 3072, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0710
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0710", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0710';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 3072, height: 4096 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4096, height: 6144 }, x: 800, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_gif_6144x8192.gif', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0720
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0720", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0720';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 3072, height: 4096 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4096, height: 6144 }, x: 800, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_gif_6144x8192.gif', decodingOptions, 3072, 4096, 900, 1400, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0730
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0730", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0730';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 240, height: 180 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 240, height: 180 }, x: 0, y: 0 }
            };
            await checkDecode(done, tag, 'pixel_gif_480x360.gif', decodingOptions, 240, 180, 200, 150, 240, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0740
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0740", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0740';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 240, height: 180 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 240, height: 180 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecode(done, tag, 'pixel_gif_480x360.gif', decodingOptions, 240, 180, 200, 150, 240, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0750
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0750", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0750';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 240, height: 180 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 240, height: 180 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_gif_480x360.gif', decodingOptions, 240, 180, 200, 150, 240, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0760
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0760", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0760';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 360, height: 240 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 360, height: 240 }, x: 50, y: 50 }
            };
            await checkDecode(done, tag, 'pixel_gif_481x361.gif', decodingOptions, 360, 240, 240, 180, 360, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0770
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0770", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0770';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 360, height: 240 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 360, height: 240 }, x: 50, y: 50 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_gif_481x361.gif', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0780
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0780", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0780';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 360, height: 240 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 360, height: 240 }, x: 50, y: 50 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_gif_481x361.gif', decodingOptions, 360, 240, 240, 180, 360, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0790
         * @tc.name      : DefaultStrategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0790", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0790';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 800, height: 800 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 0, y: 0 }
            };
            await checkHeicDecode(done, tag, 'pixel_heic_1440x1920.heic', decodingOptions, 800, 800, 799, 799, 800, 0, 0, 255, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0800
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0800", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0800';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 800, height: 800 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_heic_1440x1920.heic', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0810
         * @tc.name      : CropFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0810", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0810';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 800, height: 800 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkHeicDecode(done, tag, 'pixel_heic_1440x1920.heic', decodingOptions, 800, 800, 799, 799, 800, 0, 0, 255, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0820
         * @tc.name      : DefaultStrategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0820", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0820';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440  },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 2000 }, x: -100, y: -100 }
            };
            await checkHeicDecodeErr(done, tag, 'pixel_heic_1440x1920.heic', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0830
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0830", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0830';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 2000 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkHeicDecodeErr(done, tag, 'pixel_heic_1440x1920.heic', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0840
         * @tc.name      : CropFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0840", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0840';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 2000 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkHeicDecodeErr(done, tag, 'pixel_heic_1440x1920.heic', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0850
         * @tc.name      : DefaultStrategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0850", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0850';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440  },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 300, height: 300 }, x: 1500, y: 2000 }
            };
            await checkHeicDecodeErr(done, tag, 'pixel_heic_1440x1920.heic', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0860
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0860", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0860';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440  },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 300, height: 300 }, x: 1500, y: 2000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkHeicDecodeErr(done, tag, 'pixel_heic_1440x1920.heic', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0870
         * @tc.name      : CropFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0870", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0870';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440  },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 300, height: 300 }, x: 1500, y: 2000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkHeicDecodeErr(done, tag, 'pixel_heic_1440x1920.heic', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0880
         * @tc.name      : DefaultStrategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0880", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0880';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 1000, y: 1000 }
            };
            await checkHeicDecode(done, tag, 'pixel_heic_1440x1920.heic', decodingOptions, 960, 1440, 200, 200, 960, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0890
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0890", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0890';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 1000, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkHeicDecodeErr(done, tag, 'pixel_heic_1440x1920.heic', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0900
         * @tc.name      : CropFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0900", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0900';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 1000, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkHeicDecodeErr(done, tag, 'pixel_heic_1440x1920.heic', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0910
         * @tc.name      : DefaultStrategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0910", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0910';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 3000 }, x: 300, y: 500 }
            };
            await checkHeicDecode(done, tag, 'pixel_heic_3072x4096.heic', decodingOptions, 1000, 2000, 950, 1950, 1000, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0920
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0920", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0920';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 3000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkHeicDecodeErr(done, tag, 'pixel_heic_3072x4096.heic', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0930
         * @tc.name      : CropFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0930", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0930';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 3000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkHeicDecode(done, tag, 'pixel_heic_3072x4096.heic', decodingOptions, 1000, 2000, 950, 1950, 1000, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0940
         * @tc.name      : DefaultStrategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0940", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0940';
            let decodingOptions: image.DecodingOptions = {
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 }
            };
            await checkHeicDecode(done, tag, 'pixel_heic_3072x4096.heic', decodingOptions, 1000, 1500, 100, 100, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0950
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0950", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0950';
            let decodingOptions: image.DecodingOptions = {
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkHeicDecode(done, tag, 'pixel_heic_3072x4096.heic', decodingOptions, 1000, 1500, 100, 100, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0960
         * @tc.name      : CropFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0960", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0960';
            let decodingOptions: image.DecodingOptions = {
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkHeicDecode(done, tag, 'pixel_heic_3072x4096.heic', decodingOptions, 1000, 1500, 100, 100, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0970
         * @tc.name      : DefaultStrategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0970", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0970';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 1000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 }
            };
            await checkHeicDecode(done, tag, 'pixel_heic_3072x4096.heic', decodingOptions, 1000, 1000, 900, 900, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0980
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0980", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0980';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 1000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkHeicDecodeErr(done, tag, 'pixel_heic_3072x4096.heic', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0990
         * @tc.name      : CropFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0990", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_0990';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 1000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkHeicDecode(done, tag, 'pixel_heic_3072x4096.heic', decodingOptions, 1000, 1000, 900, 900, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1000
         * @tc.name      : DefaultStrategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1000", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1000';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4000, height: 5000 }, x: 300, y: 500 }
            };
            await checkHeicDecode(done, tag, 'pixel_heic_3072x4096.heic', decodingOptions, 1000, 2000, 900, 1900, 1000, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1010
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1010", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1010';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4000, height: 5000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkHeicDecodeErr(done, tag, 'pixel_heic_3072x4096.heic', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1020
         * @tc.name      : CropFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1020", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1020';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4000, height: 5000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkHeicDecodeErr(done, tag, 'pixel_heic_3072x4096.heic', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1030
         * @tc.name      : DefaultStrategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1030", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1030';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 2000, height: 3000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: -100, y: -100 }
            };
            await checkHeicDecodeErr(done, tag, 'pixel_heic_3072x4096.heic', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1040
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1040", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1040';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 2000, height: 3000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkHeicDecodeErr(done, tag, 'pixel_heic_3072x4096.heic', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1050
         * @tc.name      : CropFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1050", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1050';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 2000, height: 3000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkHeicDecodeErr(done, tag, 'pixel_heic_3072x4096.heic', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1060
         * @tc.name      : DefaultStrategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1060", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1060';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 4000, height: 5000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 }
            };
            await checkHeicDecode(done, tag, 'pixel_heic_3072x4096.heic', decodingOptions, 4000, 5000, 3900, 4900, 4000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1070
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1070", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1070';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 4000, height: 5000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkHeicDecode(done, tag, 'pixel_heic_3072x4096.heic', decodingOptions, 1000, 1500, 950, 1450, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1080
         * @tc.name      : CropFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1080", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1080';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 4000, height: 5000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkHeicDecode(done, tag, 'pixel_heic_3072x4096.heic', decodingOptions, 4000, 5000, 3900, 4900, 4000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1100
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1100", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1100';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 3072, height: 4096 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4096, height: 6144 }, x: 800, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkHeicDecodeErr(done, tag, 'pixel_heic_6144x8192.heic', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1120
         * @tc.name      : DefaultStrategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1120", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1120';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 240, height: 180 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 240, height: 180 }, x: 0, y: 0 }
            };
            await checkHeicDecode(done, tag, 'pixel_heic_480x360.heic', decodingOptions, 240, 180, 200, 150, 240, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1130
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1130", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1130';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 240, height: 180 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 240, height: 180 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkHeicDecode(done, tag, 'pixel_heic_480x360.heic', decodingOptions, 240, 180, 200, 150, 240, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1140
         * @tc.name      : CropFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1140", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1140';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 240, height: 180 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 240, height: 180 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkHeicDecode(done, tag, 'pixel_heic_480x360.heic', decodingOptions, 240, 180, 200, 150, 240, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1150
         * @tc.name      : DefaultStrategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1150", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1150';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 360, height: 240 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 360, height: 240 }, x: 50, y: 50 }
            };
            await checkHeicDecode(done, tag, 'pixel_heic_481x361.heic', decodingOptions, 360, 240, 240, 180, 360, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1160
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1160", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1160';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 360, height: 240 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 360, height: 240 }, x: 50, y: 50 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkHeicDecodeErr(done, tag, 'pixel_heic_481x361.heic', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1170
         * @tc.name      : CropFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1170", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1170';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 360, height: 240 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 360, height: 240 }, x: 50, y: 50 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkHeicDecode(done, tag, 'pixel_heic_481x361.heic', decodingOptions, 360, 240, 240, 180, 360, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1180
         * @tc.name      : DefaultStrategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1180", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1180';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 800, height: 800 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 0, y: 0 }
            };
            await checkDecode(done, tag, 'pixel_ico_1440x1920.ico', decodingOptions, 800, 800, 799, 799, 800, 0, 0, 255, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1190
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1190", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1190';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 800, height: 800 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_ico_1440x1920.ico', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1200
         * @tc.name      : CropFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1200", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1200';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 800, height: 800 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_ico_1440x1920.ico', decodingOptions, 800, 800, 799, 799, 800, 0, 0, 255, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1210
         * @tc.name      : Default Strategy 
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1210", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1210';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440  },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 2000 }, x: -100, y: -100 }
            };
            await checkDecodeErr(done, tag, 'pixel_ico_1440x1920.ico', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1220
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1220", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1220';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 2000 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_ico_1440x1920.ico', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1230
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1230", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1230';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 2000 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_ico_1440x1920.ico', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1240
         * @tc.name      : Default Strategy 
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1240", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1240';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440  },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 300, height: 300 }, x: 1500, y: 2000 }
            };
            await checkDecodeErr(done, tag, 'pixel_ico_1440x1920.ico', decodingOptions);
        });
                
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1250
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1250", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1250';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440  },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 300, height: 300 }, x: 1500, y: 2000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_ico_1440x1920.ico', decodingOptions);
        }); 

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1260
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1260", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1260';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440  },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 300, height: 300 }, x: 1500, y: 2000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_ico_1440x1920.ico', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1270
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1270", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1270';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 1000, y: 1000 }
            };
            await checkDecode(done, tag, 'pixel_ico_1440x1920.ico', decodingOptions, 960, 1440, 200, 200, 960, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1280
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1280", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1280';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 1000, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_ico_1440x1920.ico', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1290
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1290", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1290';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 1000, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_ico_1440x1920.ico', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1300
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1300", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1300';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 3000 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_ico_3072x4096.ico', decodingOptions, 1000, 2000, 950, 1950, 1000, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1310
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1310", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1310';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 3000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_ico_3072x4096.ico', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1320
         * @tc.name      : CropFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1320", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1320';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 3000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_ico_3072x4096.ico', decodingOptions, 1000, 2000, 950, 1950, 1000, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1330
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1330", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1330';
            let decodingOptions: image.DecodingOptions = {
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_ico_3072x4096.ico', decodingOptions, 1000, 1500, 100, 100, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1340
         * @tc.name      : ScaleFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1340", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1340';
            let decodingOptions: image.DecodingOptions = {
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecode(done, tag, 'pixel_ico_3072x4096.ico', decodingOptions, 1000, 1500, 100, 100, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1350
         * @tc.name      : CropFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1350", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1350';
            let decodingOptions: image.DecodingOptions = {
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_ico_3072x4096.ico', decodingOptions, 1000, 1500, 100, 100, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1360
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1360", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1360';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 1000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_ico_3072x4096.ico', decodingOptions, 1000, 1000, 900, 900, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1370
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1370", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1370';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 1000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_ico_3072x4096.ico', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1380
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1380", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1380';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 1000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_ico_3072x4096.ico', decodingOptions, 1000, 1000, 900, 900, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1390
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1390", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1390';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4000, height: 5000 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_ico_3072x4096.ico', decodingOptions, 1000, 2000, 900, 900, 1000, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1400
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1400", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1400';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4000, height: 5000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_ico_3072x4096.ico', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1410
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1410", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1410';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4000, height: 5000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_ico_3072x4096.ico', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1420
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1420", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1420';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 2000, height: 3000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: -100, y: -100 }
            };
            await checkDecodeErr(done, tag, 'pixel_ico_3072x4096.ico', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1430
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1430", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1430';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 2000, height: 3000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_ico_3072x4096.ico', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1440
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1440", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1440';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 2000, height: 3000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_ico_3072x4096.ico', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1450
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1450", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1450';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 4000, height: 5000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_ico_3072x4096.ico', decodingOptions, 4000, 5000, 3900, 4900, 4000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1460
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1460", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1460';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 4000, height: 5000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecode(done, tag, 'pixel_ico_3072x4096.ico', decodingOptions, 1000, 1500, 950, 1450, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1470
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1470", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1470';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 4000, height: 5000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_ico_3072x4096.ico', decodingOptions, 4000, 5000, 3900, 4900, 4000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1480
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1480", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1480';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 3072, height: 4096 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4096, height: 6144 }, x: 800, y: 1000 }
            };
            await checkDecode(done, tag, 'pixel_ico_6144x8192.ico', decodingOptions, 3072, 4096, 3000, 4000, 3072, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1490
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1490", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1490';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 3072, height: 4096 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4096, height: 6144 }, x: 800, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_ico_6144x8192.ico', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1500
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1500", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1500';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 3072, height: 4096 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4096, height: 6144 }, x: 800, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_ico_6144x8192.ico', decodingOptions, 3072, 4096, 3000, 4000, 3072, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1510
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1510", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1510';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 240, height: 180 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 240, height: 180 }, x: 0, y: 0 }
            };
            await checkDecode(done, tag, 'pixel_ico_480x360.ico', decodingOptions, 240, 180, 200, 150, 240, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1520
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1520", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1520';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 240, height: 180 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 240, height: 180 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecode(done, tag, 'pixel_ico_480x360.ico', decodingOptions, 240, 180, 200, 150, 240, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1530
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1530", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1530';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 240, height: 180 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 240, height: 180 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_ico_480x360.ico', decodingOptions, 240, 180, 200, 150, 240, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1540
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1540", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1540';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 360, height: 240 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 360, height: 240 }, x: 50, y: 50 }
            };
            await checkDecode(done, tag, 'pixel_ico_481x361.ico', decodingOptions, 360, 240, 240, 180, 360, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1550
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1550", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1550';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 360, height: 240 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 360, height: 240 }, x: 50, y: 50 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_ico_481x361.ico', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1560
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1560", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1560';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 360, height: 240 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 360, height: 240 }, x: 50, y: 50 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_ico_481x361.ico', decodingOptions, 360, 240, 240, 180, 360, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1570
         * @tc.name      : DefaultStrategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1570", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1570';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 800, height: 800 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 0, y: 0 }
            };
            await checkDecode(done, tag, 'pixel_jpg_1440x1920.jpg', decodingOptions, 800, 800, 799, 799, 800, 0, 0, 255, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1580
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1580", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1580';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 800, height: 800 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_jpg_1440x1920.jpg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1590
         * @tc.name      : CropFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1590", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1590';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 800, height: 800 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_jpg_1440x1920.jpg', decodingOptions, 800, 800, 799, 799, 800, 0, 0, 255, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1600
         * @tc.name      : Default Strategy 
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1600", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1600';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440  },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 2000 }, x: -100, y: -100 }
            };
            await checkDecodeErr(done, tag, 'pixel_jpg_1440x1920.jpg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1610
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1610", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1610';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 2000 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_jpg_1440x1920.jpg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1620
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1620", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1620';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 2000 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_jpg_1440x1920.jpg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1630
         * @tc.name      : Default Strategy 
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1630", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1630';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440  },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 300, height: 300 }, x: 1500, y: 2000 }
            };
            await checkDecodeErr(done, tag, 'pixel_jpg_1440x1920.jpg', decodingOptions);
        });
                
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1640
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1640", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1640';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440  },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 300, height: 300 }, x: 1500, y: 2000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_jpg_1440x1920.jpg', decodingOptions);
        }); 

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1650
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1650", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1650';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440  },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 300, height: 300 }, x: 1500, y: 2000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_jpg_1440x1920.jpg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1660
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1660", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1660';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 1000, y: 1000 }
            };
            await checkDecode(done, tag, 'pixel_jpg_1440x1920.jpg', decodingOptions, 960, 1440, 200, 200, 960, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1670
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1670", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1670';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 1000, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_jpg_1440x1920.jpg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1680
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1680", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1680';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 1000, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_jpg_1440x1920.jpg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1690
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1690", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1690';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 3000 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_jpg_3072x4096.jpg', decodingOptions, 1000, 2000, 950, 1950, 1000, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1700
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1700", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1700';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 3000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_jpg_3072x4096.jpg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1710
         * @tc.name      : CropFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1710", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1710';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 3000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_jpg_3072x4096.jpg', decodingOptions, 1000, 2000, 950, 1950, 1000, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1720
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1720", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1720';
            let decodingOptions: image.DecodingOptions = {
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_jpg_3072x4096.jpg', decodingOptions, 1000, 1500, 100, 100, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1730
         * @tc.name      : ScaleFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1730", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1730';
            let decodingOptions: image.DecodingOptions = {
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecode(done, tag, 'pixel_jpg_3072x4096.jpg', decodingOptions, 1000, 1500, 100, 100, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1740
         * @tc.name      : CropFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1740", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1740';
            let decodingOptions: image.DecodingOptions = {
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_jpg_3072x4096.jpg', decodingOptions, 1000, 1500, 100, 100, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1750
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1750", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1750';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 1000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_jpg_3072x4096.jpg', decodingOptions, 1000, 1000, 900, 900, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1760
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1760", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1760';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 1000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_jpg_3072x4096.jpg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1770
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1770", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1770';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 1000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_jpg_3072x4096.jpg', decodingOptions, 1000, 1000, 900, 900, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1780
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1780", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1780';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4000, height: 5000 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_jpg_3072x4096.jpg', decodingOptions, 1000, 2000, 900, 1900, 1000, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1790
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1790", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1790';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4000, height: 5000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_jpg_3072x4096.jpg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1800
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1800", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1800';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4000, height: 5000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_jpg_3072x4096.jpg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1810
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1810", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1810';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 2000, height: 3000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: -100, y: -100 }
            };
            await checkDecodeErr(done, tag, 'pixel_jpg_3072x4096.jpg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1820
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1820", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1820';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 2000, height: 3000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_jpg_3072x4096.jpg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1830
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1830", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1830';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 2000, height: 3000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_jpg_3072x4096.jpg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1840
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1840", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1840';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 4000, height: 5000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_jpg_3072x4096.jpg', decodingOptions, 4000, 5000, 3900, 4900, 4000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1850
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1850", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1850';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 4000, height: 5000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecode(done, tag, 'pixel_jpg_3072x4096.jpg', decodingOptions, 1000, 1500, 950, 1450, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1860
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1860", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1860';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 4000, height: 5000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_jpg_3072x4096.jpg', decodingOptions, 4000, 5000, 3900, 4900, 4000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1870
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1870", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1870';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 3072, height: 4096 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4096, height: 6144 }, x: 800, y: 1000 }
            };
            await checkDecode(done, tag, 'pixel_jpg_6144x8192.jpg', decodingOptions, 3072, 4096, 3000, 4000, 3072, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1880
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1880", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1880';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 3072, height: 4096 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4096, height: 6144 }, x: 800, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_jpg_6144x8192.jpg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1890
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1890", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1890';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 3072, height: 4096 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4096, height: 6144 }, x: 800, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_jpg_6144x8192.jpg', decodingOptions, 3072, 4096, 3000, 4000, 3072, 120, 120, 120, 255);
        });
        
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1900
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1900", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1900';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 240, height: 180 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 240, height: 180 }, x: 0, y: 0 }
            };
            await checkDecode(done, tag, 'pixel_jpg_480x360.jpg', decodingOptions, 240, 180, 200, 150, 240, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1910
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1910", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1910';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 240, height: 180 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 240, height: 180 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecode(done, tag, 'pixel_jpg_480x360.jpg', decodingOptions, 240, 180, 200, 150, 240, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1920
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1920", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1920';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 240, height: 180 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 240, height: 180 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_jpg_480x360.jpg', decodingOptions, 240, 180, 200, 150, 240, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1930
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1930", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1930';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 360, height: 240 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 360, height: 240 }, x: 50, y: 50 }
            };
            await checkDecode(done, tag, 'pixel_jpg_481x361.jpg', decodingOptions, 360, 240, 240, 180, 360, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1940
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1940", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1940';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 360, height: 240 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 360, height: 240 }, x: 50, y: 50 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_jpg_481x361.jpg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1950
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1950", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1950';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 360, height: 240 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 360, height: 240 }, x: 50, y: 50 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_jpg_481x361.jpg', decodingOptions, 360, 240, 240, 180, 360, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1960
         * @tc.name      : DefaultStrategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1960", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1960';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 800, height: 800 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 0, y: 0 }
            };
            await checkDecode(done, tag, 'pixel_png_1440x1920.png', decodingOptions, 800, 800, 799, 799, 800, 0, 0, 255, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1970
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1970", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1970';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 800, height: 800 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_png_1440x1920.png', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1980
         * @tc.name      : CropFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1980", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1980';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 800, height: 800 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_png_1440x1920.png', decodingOptions, 800, 800, 799, 799, 800, 0, 0, 255, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1990
         * @tc.name      : Default Strategy 
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1990", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_1990';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440  },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 2000 }, x: -100, y: -100 }
            };
            await checkDecodeErr(done, tag, 'pixel_png_1440x1920.png', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2000
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2000", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2000';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 2000 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_png_1440x1920.png', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2010
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2010", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2010';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 2000 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_png_1440x1920.png', decodingOptions);
        });
                
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2020
         * @tc.name      : Default Strategy 
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2020", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2020';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440  },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 300, height: 300 }, x: 1500, y: 2000 }
            };
            await checkDecodeErr(done, tag, 'pixel_png_1440x1920.png', decodingOptions);
        });
                
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2030
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2030", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2030';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440  },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 300, height: 300 }, x: 1500, y: 2000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_png_1440x1920.png', decodingOptions);
        }); 

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2040
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2040", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2040';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440  },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 300, height: 300 }, x: 1500, y: 2000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_png_1440x1920.png', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2050
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2050", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2050';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 1000, y: 1000 }
            };
            await checkDecode(done, tag, 'pixel_png_1440x1920.png', decodingOptions, 960, 1440, 200, 200, 960, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2060
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2060", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2060';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 1000, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_png_1440x1920.png', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2070
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2070", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2070';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 1000, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_png_1440x1920.png', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2080
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2080", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2080';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 3000 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_png_3072x4096.png', decodingOptions, 1000, 2000, 950, 1950, 1000, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2090
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2090", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2090';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 3000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_png_3072x4096.png', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2100
         * @tc.name      : CropFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2100", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2100';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 3000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_png_3072x4096.png', decodingOptions, 1000, 2000, 950, 1950, 1000, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2110
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2110", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2110';
            let decodingOptions: image.DecodingOptions = {
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_png_3072x4096.png', decodingOptions, 1000, 1500, 100, 100, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2120
         * @tc.name      : ScaleFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2120", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2120';
            let decodingOptions: image.DecodingOptions = {
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecode(done, tag, 'pixel_png_3072x4096.png', decodingOptions, 1000, 1500, 100, 100, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2130
         * @tc.name      : CropFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2130", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2130';
            let decodingOptions: image.DecodingOptions = {
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_png_3072x4096.png', decodingOptions, 1000, 1500, 100, 100, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2140
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2140", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2140';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 1000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_png_3072x4096.png', decodingOptions, 1000, 1000, 900, 900, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2150
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2150", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2150';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 1000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_png_3072x4096.png', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2160
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2160", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2160';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 1000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_png_3072x4096.png', decodingOptions, 1000, 1000, 900, 900, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2170
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2170", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2170';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4000, height: 5000 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_png_3072x4096.png', decodingOptions, 1000, 2000, 900, 1900, 1000, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2180
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2180", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2180';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4000, height: 5000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_png_3072x4096.png', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2190
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2190", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2190';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4000, height: 5000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_png_3072x4096.png', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2200
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2200", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2200';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 2000, height: 3000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: -100, y: -100 }
            };
            await checkDecodeErr(done, tag, 'pixel_png_3072x4096.png', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2210
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2210", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2210';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 2000, height: 3000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_png_3072x4096.png', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2220
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2220", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2220';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 2000, height: 3000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_png_3072x4096.png', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2230
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2230", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2230';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 4000, height: 5000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_png_3072x4096.png', decodingOptions, 4000, 5000, 3900, 4900, 4000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2240
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2240", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2240';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 4000, height: 5000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecode(done, tag, 'pixel_png_3072x4096.png', decodingOptions, 1000, 1500, 950, 1450, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2250
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2250", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2250';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 4000, height: 5000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_png_3072x4096.png', decodingOptions, 4000, 5000, 3900, 4900, 4000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2260
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2260", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2260';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 3072, height: 4096 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4096, height: 6144 }, x: 800, y: 1000 }
            };
            await checkDecode(done, tag, 'pixel_png_6144x8192.png', decodingOptions, 3072, 4096, 3000, 4000, 3072, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2270
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2270", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2270';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 3072, height: 4096 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4096, height: 6144 }, x: 800, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_png_6144x8192.png', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2280
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2280", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2280';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 3072, height: 4096 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4096, height: 6144 }, x: 800, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_png_6144x8192.png', decodingOptions, 3072, 4096, 3000, 4000, 3072, 120, 120, 120, 255);
        });
        
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2290
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2290", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2290';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 240, height: 180 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 240, height: 180 }, x: 0, y: 0 }
            };
            await checkDecode(done, tag, 'pixel_png_480x360.png', decodingOptions, 240, 180, 200, 150, 240, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2300
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2300", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2300';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 240, height: 180 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 240, height: 180 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecode(done, tag, 'pixel_png_480x360.png', decodingOptions, 240, 180, 200, 150, 240, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2310
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2310", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2310';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 240, height: 180 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 240, height: 180 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_png_480x360.png', decodingOptions, 240, 180, 200, 150, 240, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2320
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2320", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2320';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 360, height: 240 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 360, height: 240 }, x: 50, y: 50 }
            };
            await checkDecode(done, tag, 'pixel_png_481x361.png', decodingOptions, 360, 240, 240, 180, 360, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2330
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2330", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2330';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 360, height: 240 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 360, height: 240 }, x: 50, y: 50 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_png_481x361.png', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2340
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2340", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2340';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 360, height: 240 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 360, height: 240 }, x: 50, y: 50 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_png_481x361.png', decodingOptions, 360, 240, 240, 180, 360, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2350
         * @tc.name      : DefaultStrategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2350", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2350';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 800, height: 800 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 0, y: 0 }
            };
            await checkDecode(done, tag, 'pixel_svg_1440x1920.svg', decodingOptions, 800, 800, 750, 750, 800, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2360
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2360", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2360';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 800, height: 800 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_svg_1440x1920.svg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2370
         * @tc.name      : CropFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2370", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2370';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 800, height: 800 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_svg_1440x1920.svg', decodingOptions, 800, 800, 799, 799, 800, 0, 0, 255, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2380
         * @tc.name      : Default Strategy 
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2380", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2380';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440  },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 2000 }, x: -100, y: -100 }
            };
            await checkDecodeErr(done, tag, 'pixel_svg_1440x1920.svg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2390
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2390", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2390';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 2000 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_svg_1440x1920.svg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2400
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2400", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2400';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 2000 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_svg_1440x1920.svg', decodingOptions);
        });
                
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2410
         * @tc.name      : Default Strategy 
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2410", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2410';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440  },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 300, height: 300 }, x: 1500, y: 2000 }
            };
            await checkDecodeErr(done, tag, 'pixel_svg_1440x1920.svg', decodingOptions);
        });
                
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2420
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2420", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2420';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440  },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 300, height: 300 }, x: 1500, y: 2000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_svg_1440x1920.svg', decodingOptions);
        }); 

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2430
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2430", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2430';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440  },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 300, height: 300 }, x: 1500, y: 2000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_svg_1440x1920.svg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2440
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2440", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2440';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 1000, y: 1000 }
            };
            await checkDecodeErr(done, tag, 'pixel_svg_1440x1920.svg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2450
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2450", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2450';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 1000, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_svg_1440x1920.svg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2460
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2460", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2460';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 1000, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_svg_1440x1920.svg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2470
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2470", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2470';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 3000 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_svg_3072x4096.svg', decodingOptions, 1000, 2000, 950, 1950, 1000, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2480
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2480", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2480';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 3000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_svg_3072x4096.svg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2490
         * @tc.name      : CropFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2490", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2490';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 3000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_svg_3072x4096.svg', decodingOptions, 1000, 2000, 950, 1950, 1000, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2500
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2500", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2500';
            let decodingOptions: image.DecodingOptions = {
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_svg_3072x4096.svg', decodingOptions, 1000, 1500, 100, 100, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2510
         * @tc.name      : ScaleFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2510", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2510';
            let decodingOptions: image.DecodingOptions = {
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecode(done, tag, 'pixel_svg_3072x4096.svg', decodingOptions, 1000, 1500, 100, 100, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2520
         * @tc.name      : CropFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2520", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2520';
            let decodingOptions: image.DecodingOptions = {
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_svg_3072x4096.svg', decodingOptions, 1000, 1500, 100, 100, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2530
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2530", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2530';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 1000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_svg_3072x4096.svg', decodingOptions, 1000, 1000, 900, 900, 1000, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2540
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2540", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2540';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 1000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_svg_3072x4096.svg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2550
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2550", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2550';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 1000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_svg_3072x4096.svg', decodingOptions, 1000, 1000, 900, 900, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2560
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2560", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2560';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4000, height: 5000 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_svg_3072x4096.svg', decodingOptions, 1000, 2000, 900, 1900, 1000, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2570
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2570", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2570';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4000, height: 5000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_svg_3072x4096.svg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2580
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2580", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2580';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4000, height: 5000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_svg_3072x4096.svg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2590
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2590", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2590';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 2000, height: 3000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: -100, y: -100 }
            };
            await checkDecodeErr(done, tag, 'pixel_svg_3072x4096.svg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2600
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2600", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2600';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 2000, height: 3000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_svg_3072x4096.svg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2610
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2610", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2610';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 2000, height: 3000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_svg_3072x4096.svg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2620
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2620", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2620';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 4000, height: 5000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_svg_3072x4096.svg', decodingOptions, 4000, 5000, 3900, 4900, 4000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2630
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2630", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2630';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 4000, height: 5000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecode(done, tag, 'pixel_svg_3072x4096.svg', decodingOptions, 1000, 1500, 950, 1450, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2640
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2640", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2640';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 4000, height: 5000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_svg_3072x4096.svg', decodingOptions, 4000, 5000, 3900, 4900, 4000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2650
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2650", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2650';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 3072, height: 4096 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4096, height: 6144 }, x: 800, y: 1000 }
            };
            await checkDecode(done, tag, 'pixel_svg_6144x8192.svg', decodingOptions, 3072, 4096, 3000, 4000, 3072, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2660
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2660", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2660';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 3072, height: 4096 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4096, height: 6144 }, x: 800, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_svg_6144x8192.svg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2670
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2670", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2670';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 3072, height: 4096 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4096, height: 6144 }, x: 800, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_svg_6144x8192.svg', decodingOptions, 3072, 4096, 3000, 4000, 3072, 120, 120, 120, 255);
        });
        
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2680
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2680", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2680';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 240, height: 180 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 240, height: 180 }, x: 0, y: 0 }
            };
            await checkDecode(done, tag, 'pixel_svg_480x360.svg', decodingOptions, 240, 180, 200, 150, 240, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2690
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2690", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2690';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 240, height: 180 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 240, height: 180 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecode(done, tag, 'pixel_svg_480x360.svg', decodingOptions, 240, 180, 200, 150, 240, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2700
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2700", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2700';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 240, height: 180 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 240, height: 180 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_svg_480x360.svg', decodingOptions, 240, 180, 200, 150, 240, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2710
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2710", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2710';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 360, height: 240 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 360, height: 240 }, x: 50, y: 50 }
            };
            await checkDecode(done, tag, 'pixel_svg_481x361.svg', decodingOptions, 360, 240, 240, 180, 360, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2720
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2720", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2720';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 360, height: 240 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 360, height: 240 }, x: 50, y: 50 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_svg_481x361.svg', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2730
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2730", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2730';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 360, height: 240 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 360, height: 240 }, x: 50, y: 50 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_svg_481x361.svg', decodingOptions, 360, 240, 240, 180, 360, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2740
         * @tc.name      : DefaultStrategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2740", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2740';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 800, height: 800 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 0, y: 0 }
            };
            await checkDecode(done, tag, 'pixel_webp_1440x1920.webp', decodingOptions, 800, 800, 799, 799, 800, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2750
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2750", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2750';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 800, height: 800 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_webp_1440x1920.webp', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2760
         * @tc.name      : CropFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2760", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2760';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 800, height: 800 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_webp_1440x1920.webp', decodingOptions, 800, 800, 799, 799, 800, 0, 0, 255, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2770
         * @tc.name      : Default Strategy 
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2770", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2770';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440  },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 2000 }, x: -100, y: -100 }
            };
            await checkDecodeErr(done, tag, 'pixel_webp_1440x1920.webp', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2780
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2780", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2780';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 2000 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_webp_1440x1920.webp', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2790
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2790", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2790';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 2000 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_webp_1440x1920.webp', decodingOptions);
        });
                
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2800
         * @tc.name      : Default Strategy 
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2800", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2800';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440  },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 300, height: 300 }, x: 1500, y: 2000 }
            };
            await checkDecodeErr(done, tag, 'pixel_webp_1440x1920.webp', decodingOptions);
        });
                
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2810
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2810", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2810';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440  },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 300, height: 300 }, x: 1500, y: 2000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_webp_1440x1920.webp', decodingOptions);
        }); 

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2820
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2820", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2820';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440  },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 300, height: 300 }, x: 1500, y: 2000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_webp_1440x1920.webp', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2830
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2830", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2830';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 1000, y: 1000 }
            };
            await checkDecode(done, tag, 'pixel_webp_1440x1920.webp', decodingOptions, 960, 1440, 200, 200, 960, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2840
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2840", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2840';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 1000, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_webp_1440x1920.webp', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2850
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2850", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2850';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 960, height: 1440 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 500, height: 1000 }, x: 1000, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_webp_1440x1920.webp', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2860
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2860", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2860';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 3000 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_webp_3072x4096.webp', decodingOptions, 1000, 2000, 950, 1950, 1000, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2870
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2870", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2870';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 3000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_webp_3072x4096.webp', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2880
         * @tc.name      : CropFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2880", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2880';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 2000, height: 3000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_webp_3072x4096.webp', decodingOptions, 1000, 2000, 950, 1950, 1000, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2890
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2890", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2890';
            let decodingOptions: image.DecodingOptions = {
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_webp_3072x4096.webp', decodingOptions, 1000, 1500, 100, 100, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2900
         * @tc.name      : ScaleFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2900", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2900';
            let decodingOptions: image.DecodingOptions = {
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecode(done, tag, 'pixel_webp_3072x4096.webp', decodingOptions, 1000, 1500, 100, 100, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2910
         * @tc.name      : CropFirst Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2910", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2910';
            let decodingOptions: image.DecodingOptions = {
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_webp_3072x4096.webp', decodingOptions, 1000, 1500, 100, 100, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2920
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2920", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2920';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 1000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_webp_3072x4096.webp', decodingOptions, 1000, 1000, 900, 900, 1000, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2930
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2930", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2930';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 1000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_webp_3072x4096.webp', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2940
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2940", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2940';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 1000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_webp_3072x4096.webp', decodingOptions, 1000, 1000, 900, 900, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2950
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2950", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2950';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4000, height: 5000 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_webp_3072x4096.webp', decodingOptions, 1000, 2000, 900, 1900, 1000, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2960
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2960", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2960';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4000, height: 5000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_webp_3072x4096.webp', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2970
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2970", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2970';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 1000, height: 2000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4000, height: 5000 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_webp_3072x4096.webp', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2980
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2980", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2980';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 2000, height: 3000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: -100, y: -100 }
            };
            await checkDecodeErr(done, tag, 'pixel_webp_3072x4096.webp', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2990
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2990", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_2990';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 2000, height: 3000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_webp_3072x4096.webp', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3000
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3000", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3000';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 2000, height: 3000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: -100, y: -100 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_webp_3072x4096.webp', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3010
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3010", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3010';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 4000, height: 5000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 }
            };
            await checkDecode(done, tag, 'pixel_webp_3072x4096.webp', decodingOptions, 4000, 5000, 3900, 4900, 4000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3020
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3020", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3020';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 4000, height: 5000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecode(done, tag, 'pixel_webp_3072x4096.webp', decodingOptions, 1000, 1500, 950, 1450, 1000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3030
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3030", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3030';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 4000, height: 5000 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 1000, height: 1500 }, x: 300, y: 500 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_webp_3072x4096.webp', decodingOptions, 4000, 5000, 3900, 4900, 4000, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3040
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3040", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3040';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 3072, height: 4096 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4096, height: 6144 }, x: 800, y: 1000 }
            };
            await checkDecode(done, tag, 'pixel_webp_6144x8192.webp', decodingOptions, 3072, 4096, 3000, 4000, 3072, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3050
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3050", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3050';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 3072, height: 4096 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4096, height: 6144 }, x: 800, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_webp_6144x8192.webp', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3060
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3060", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3060';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 3072, height: 4096 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 4096, height: 6144 }, x: 800, y: 1000 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_webp_6144x8192.webp', decodingOptions, 3072, 4096, 3000, 4000, 3072, 120, 120, 120, 255);
        });
        
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3070
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3070", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3070';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 240, height: 180 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 240, height: 180 }, x: 0, y: 0 }
            };
            await checkDecode(done, tag, 'pixel_webp_480x360.webp', decodingOptions, 240, 180, 200, 150, 240, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3080
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3080", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3080';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 240, height: 180 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 240, height: 180 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecode(done, tag, 'pixel_webp_480x360.webp', decodingOptions, 240, 180, 200, 150, 240, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3090
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3090", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3090';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 240, height: 180 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 240, height: 180 }, x: 0, y: 0 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_webp_480x360.webp', decodingOptions, 240, 180, 200, 150, 240, 255, 0, 0, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3100
         * @tc.name      : Default Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3100", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3100';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 360, height: 240 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 360, height: 240 }, x: 50, y: 50 }
            };
            await checkDecode(done, tag, 'pixel_webp_481x361.webp', decodingOptions, 360, 240, 240, 180, 360, 120, 120, 120, 255);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3110
         * @tc.name      : SCALE_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3110", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3110';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 360, height: 240 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 360, height: 240 }, x: 50, y: 50 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.SCALE_FIRST
            };
            await checkDecodeErr(done, tag, 'pixel_webp_481x361.webp', decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3120
         * @tc.name      : CROP_FIRST Strategy
         * @tc.desc      : 1.get image path,2.createImageSourceFromFd,3.createImageSource,4.createPixelMap by decodingOptions 
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 2
         */
        it("SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3120", Level.LEVEL2, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CROP_AND_SCALE_STRATEGY_3120';
            let decodingOptions: image.DecodingOptions = {
                desiredSize: { width: 360, height: 240 },
                desiredPixelFormat: 3,
                desiredRegion: { size: { width: 360, height: 240 }, x: 50, y: 50 },
                cropAndScaleStrategy : image.CropAndScaleStrategy.CROP_FIRST
            };
            await checkDecode(done, tag, 'pixel_webp_481x361.webp', decodingOptions, 360, 240, 240, 180, 360, 120, 120, 120, 255);
        });

    });
}