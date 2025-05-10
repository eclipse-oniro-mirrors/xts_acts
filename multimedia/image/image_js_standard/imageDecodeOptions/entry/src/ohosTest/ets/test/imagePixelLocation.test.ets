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

async function checkPixelValues(done: Function , testNum: string, x: number, y: number, rowOffset: number, bufferArr: Uint8Array, Red: number | undefined, Green: number | undefined, Blue: number | undefined, Alpha: number | undefined) {
    let index = (y * rowOffset + x) * 4;
    console.info('index is ' + bufferArr[index]);
    console.info('index + 1 is ' + bufferArr[index + 1]);
    console.info('index + 2 is ' + bufferArr[index + 2]);
    console.info('index + 3 is ' + bufferArr[index + 3]);
    if (bufferArr[index] == Red && bufferArr[index + 1] == Green && bufferArr[index + 2] == Blue && bufferArr[index + 3] == Alpha) {
        console.info(testNum + ' Successed in checking pixel values');
        expect(true).assertTrue();
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
                }
            }
            if (globalimageSource != undefined) {
                console.info('globalimageSource release start');
                try {
                    await globalimageSource.release();
                } catch (error) {
                    console.info('globalimageSource release fail');
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
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0200", Level.LEVEL0, async (done: Function) => {
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
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0300", Level.LEVEL0, async (done: Function) => {
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
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0400", Level.LEVEL0, async (done: Function) => {
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
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0500", Level.LEVEL0, async (done: Function) => {
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
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0600", Level.LEVEL0, async (done: Function) => {
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
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0700", Level.LEVEL0, async (done: Function) => {
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
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0800", Level.LEVEL0, async (done: Function) => {
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
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0900", Level.LEVEL0, async (done: Function) => {
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
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1000", Level.LEVEL0, async (done: Function) => {
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
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1100", Level.LEVEL0, async (done: Function) => {
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
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1200", Level.LEVEL0, async (done: Function) => {
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
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1300", Level.LEVEL0, async (done: Function) => {
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
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1400", Level.LEVEL0, async (done: Function) => {
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
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1500", Level.LEVEL0, async (done: Function) => {
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
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1600", 0, async (done: Function) => {
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

    });
}
