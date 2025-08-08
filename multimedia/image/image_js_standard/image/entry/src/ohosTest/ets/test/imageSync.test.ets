/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { testPng, testJpg } from './testImg.test'
import colorSpaceManager from "@ohos.graphics.colorSpaceManager"
import common from '@ohos.app.ability.common'
import fs from '@ohos.file.fs'

let testContext: common.UIAbilityContext;

export default function imageSync() {
    describe('imageSync', () => {
        let filePath: string;
        let fdNumber: number;
        let globalpixelmap: image.PixelMap;
        beforeAll(async () => {
            testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
            console.info('beforeAll case');
        });
        beforeEach(() => {
            console.info('beforeEach case');
        });
        afterEach(async () => {
            if (globalpixelmap != undefined) {
                console.info('globalpixelmap release start');
                try {
                    await globalpixelmap.release();
                } catch (error) {
                    console.info('globalpixelmap release fail');
                }
            }
            console.info('afterEach case');
        });
        afterAll(async () => {
            console.info('afterAll case');
        });

        let sleep = (ms?: number | undefined): Promise<void> => {
            return new Promise(resolve => setTimeout(resolve, ms));
        }

        let getFd = async (fileName: number | string) => {
            let pathDir = testContext.filesDir;
            filePath = pathDir + '/' + fileName;
            try {
                let file = fs.openSync(filePath);
                fdNumber = file.fd;
                console.info('image case fdNumber is ' + fdNumber);
            } catch (err) {
                console.info("image case open fd errss " + JSON.stringify(err));
            }
        }

        let testGetImageInfo = async (done: Function, testNum: string, fileName: string, imageWidth: number, imageHeight: number, mimeType: string, index: number | null) => {
            try {
                await getFd(fileName);
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(`${testNum} create image source failed `);
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info(`${testNum} create image source success `);
                    let imageInfo: image.ImageInfo;
                    if (index != null) {
                        imageInfo = imageSourceApi.getImageInfoSync(index);
                    } else {
                        imageInfo = imageSourceApi.getImageInfoSync();
                    }
                    console.info(imageInfo + 'imageInfo 000 ');
                    expect(imageInfo != undefined).assertTrue();
                    expect(imageInfo.size.width).assertEqual(imageWidth);
                    expect(imageInfo.size.height).assertEqual(imageHeight);
                    expect(imageInfo.density == undefined).assertTrue();
                    expect(imageInfo.stride == undefined).assertTrue();
                    expect(imageInfo.pixelFormat == 0).assertTrue();
                    expect(imageInfo.alphaType == 0).assertTrue();
                    expect(imageInfo.mimeType).assertEqual(mimeType);
                    console.info(`${testNum} imageInfo: `);
                    console.info('imageInfo.size.width: ' + imageInfo.size.width);
                    console.info('imageInfo.size.height: ' + imageInfo.size.height);
                    console.info('imageInfo.density: ' + imageInfo.density);
                    console.info('imageInfo.stride: ' + imageInfo.stride);
                    console.info('imageInfo.pixelFormat: ' + imageInfo.pixelFormat);
                    console.info('imageInfo.alphaType: ' + imageInfo.alphaType);
                    console.info('imageInfo.mimeType: ' + imageInfo.mimeType);
                    console.log(`${testNum} success`);
                    done();
                }
            } catch (error) {
                console.info(`${testNum} error  ` + error);
                expect(false).assertTrue();
                done();
            }
        }

        let getImageInfoInvaildIndex = async (done: Function, testNum: string, fileName: string, index: number) => {
            try {
                await getFd(fileName);
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(`${testNum} create image source failed`);
                    expect(false).assertTrue();
                    done();
                } else {
                    let imageInfo = imageSourceApi.getImageInfoSync(index);
                    expect(imageInfo == undefined).assertTrue();
                    console.info(`${testNum} success`);
                    done();
                }
            } catch (error) {
                console.info(`${testNum} error: ` + error);
                expect(false).assertTrue();
                done();
            }
        }

        let testCreateIncrementalSourcePixelMap = async(done: Function, testNum: string, buffer: Uint8Array) => {
            try {
                let testimagebuffer = buffer;
                console.info(`${testNum} start image buffer length: ` + testimagebuffer.length);
                let bufferSize = testimagebuffer.length;
                let offset = 0;
                const incSouce = image.CreateIncrementalSource(new ArrayBuffer(1));
                let ret: ESObject;
                let isFinished = false;
                while (offset < testimagebuffer.length) {
                    let oneStep = testimagebuffer.slice(offset, offset + bufferSize);
                    console.info(`${testNum} one step length: ` + oneStep.length);
                    if (oneStep.length < bufferSize) {
                        isFinished = true;
                    }
                    ret = await incSouce.updateData(oneStep, isFinished, 0, oneStep.length);
                    if (!ret) {
                        console.info(`${testNum} updateData failed`);
                        expect(ret).assertTrue();
                        break;
                    }
                    offset = offset + oneStep.length;
                    console.info(`${testNum} offset: ` + offset);
                }
                if (ret) {
                    console.info(`${testNum} updateData success`);
                    let decodingOptions: image.DecodingOptions | undefined = {
                        sampleSize: 1
                    };
                    let pixelmap = incSouce.createPixelMapSync(decodingOptions);
                    console.info(`${testNum} pixelmap: ` + pixelmap);
                    expect(pixelmap != undefined).assertTrue();
                    done();
                } else {
                    done();
                }
            } catch (error) {
                console.info(`${testNum} error: ` + error);
            }
        }

        let testCreatePixelMap = async (done: Function, testNum: string, fileName: string, opts: image.DecodingOptions | null) => {
            try {
                await getFd(fileName);
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(`${testNum} create image source failed`);
                    expect(false).assertTrue();
                    done();
                } else {
                    if (opts != null) {
                        if (opts.desiredSize == undefined) {
                            opts.desiredSize = {
                                width: 1446, height: 1476
                            };
                        }
                        globalpixelmap = imageSourceApi.createPixelMapSync(opts);
                    } else {
                        let csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB);
                        opts = {
                            editable: false,
                            desiredSize: {
                                width: 1446, height: 1476
                            },
                            desiredPixelFormat: 3,
                            fitDensity: 0,
                            desiredColorSpace: csm
                        };
                        globalpixelmap = imageSourceApi.createPixelMapSync();
                    }
                    let pixelMapInfo = await globalpixelmap.getImageInfo();
                    let pixelColorSpace = globalpixelmap.getColorSpace().getColorSpaceName();
                    let pixelGamma = globalpixelmap.getColorSpace().getGamma();
                    console.info(`${testNum} pixelmap info: `);
                    expect(globalpixelmap != undefined).assertTrue();
                    expect(pixelMapInfo.size.width == opts?.desiredSize?.width).assertTrue();
                    expect(pixelMapInfo.size.height == opts?.desiredSize?.height).assertTrue();
                    expect(pixelMapInfo.pixelFormat == opts.desiredPixelFormat).assertTrue();
                    expect(globalpixelmap.isEditable == opts.editable).assertTrue();
                    expect(globalpixelmap.getDensity() == opts.fitDensity).assertTrue();
                    expect(pixelColorSpace == opts?.desiredColorSpace?.getColorSpaceName()
                        || pixelColorSpace == colorSpaceManager.ColorSpace.CUSTOM).assertTrue();
                    expect(pixelGamma == opts?.desiredColorSpace?.getGamma()).assertTrue();
                    console.info('pixelmap width: ' + pixelMapInfo.size.width);
                    console.info('pixelmap height: ' + pixelMapInfo.size.height);
                    console.info('pixelmap editable: ' + globalpixelmap.isEditable);
                    console.info('pixelmap pixel format: ' + pixelMapInfo.pixelFormat);
                    console.info('pixelmap density: ' + globalpixelmap.getDensity());
                    console.info('pixelmap color space name: ' + pixelColorSpace);
                    console.info('pixelmap color space gamma: ' + pixelGamma);
                    console.info(`${testNum} success`);
                    done();
                }
            } catch (error) {
                console.info(`${testNum} error: ` + error);
                expect(false).assertTrue();
                done();
            }
        }

        let createPixelMapInvaildOpt = async(done: Function, testNum: string, fileName: string, opts: image.DecodingOptions) => {
            try {
                await getFd(fileName);
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(`${testNum} create image source failed`);
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info(`${testNum} create pixelmap failed with invalid options`);
                    globalpixelmap = imageSourceApi.createPixelMapSync(opts);
                    expect(globalpixelmap == undefined).assertTrue();
                    console.info(`${testNum} success`);
                    done();
                }
            } catch (error) {
                console.info(`${testNum} error: ` + error);
                expect(false).assertTrue();
                done();
            }
        }

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_0100
         * @tc.name      : test all information with getImageInfoSync for jpg
         * @tc.desc      : 1.create jpg imagesource
         *                 2.call getImageInfoSync(index:0)
         *                 3.return imageinfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_0100', 0, async (done: Function) => {
            testGetImageInfo(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_0100", "test.jpg", 1446, 1476, "image/jpeg",
                0);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_0200
         * @tc.name      : test all information with getImageInfoSync for bmp
         * @tc.desc      : 1.create bmp imagesource
         *                 2.call getImageInfoSync(index:0)
         *                 3.return imageinfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_0200', 0, async (done: Function) => {
            testGetImageInfo(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_0200", "test.bmp", 1399, 1042, "image/bmp",
                0);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_0300
         * @tc.name      : test all information with getImageInfoSync for png
         * @tc.desc      : 1.create png imagesource
         *                 2.call getImageInfoSync(index:0)
         *                 3.return imageinfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_0300', 0, async (done: Function) => {
            testGetImageInfo(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_0300", "test.png", 6016, 3384, "image/png",
                0);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_0400
         * @tc.name      : test all information with getImageInfoSync for gif
         * @tc.desc      : 1.create gif imagesource
         *                 2.call getImageInfoSync(index:0)
         *                 3.return imageinfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_0400', 0, async (done: Function) => {
            testGetImageInfo(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_0400", "test.gif", 6016, 3384, "image/gif",
                0);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_0500
         * @tc.name      : test all information with getImageInfoSync for dng
         * @tc.desc      : 1.create dng imagesource
         *                 2.call getImageInfoSync(index:0)
         *                 3.return imageinfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_0500', 0, async (done: Function) => {
            testGetImageInfo(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_0500", "test.dng", 5976, 3992, "image/raw",
                0);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_0600
         * @tc.name      : test all information with getImageInfoSync for webp
         * @tc.desc      : 1.create webp imagesource
         *                 2.call getImageInfoSync(index:0)
         *                 3.return imageinfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_0600', 0, async (done: Function) => {
            testGetImageInfo(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_0600", "test_large.webp", 1212, 681,
                "image/webp", 0);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_0700
         * @tc.name      : test all information with getImageInfoSync for svg
         * @tc.desc      : 1.create svg imagesource
         *                 2.call getImageInfoSync(index:0)
         *                 3.return imageinfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_0700', 0, async (done: Function) => {
            testGetImageInfo(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_0700", "test_large.svg", 2136, 1968,
                "image/svg+xml", 0);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_0800
         * @tc.name      : test all information with getImageInfoSync for ico
         * @tc.desc      : 1.create ico imagesource
         *                 2.call getImageInfoSync(index:0)
         *                 3.return imageinfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_0800', 0, async (done: Function) => {
            testGetImageInfo(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_0800", "test.ico", 64, 64, "image/x-ico", 0);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_0900
         * @tc.name      : test getImageInfoSync for wrong suffix image
         * @tc.desc      : 1.create wrong suffix imagesource
         *                 2.call getImageInfoSync(index:0)
         *                 3.return imageinfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_0900', 0, async (done: Function) => {
            testGetImageInfo(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_0900", "test.123", 6016, 3384, "image/bmp",
                0);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_0100
         * @tc.name      : test getImageInfoSync with index1 for one frame gif
         * @tc.desc      : 1.create one frame gif imagesource
         *                 2.call getImageInfoSync(index:1)
         *                 3.return imageinfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_0100', 0, async (done: Function) => {
            getImageInfoInvaildIndex(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_0100", "test.gif", 1);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_0200
         * @tc.name      : test getImageInfoSync with index-1 for one frame gif
         * @tc.desc      : 1.create gif imagesource
         *                 2.call getImageInfoSync(index:-1)
         *                 3.return imageinfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_0200', 0, async (done: Function) => {
            getImageInfoInvaildIndex(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_0200", "test.gif", -1);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_0300
         * @tc.name      : test getImageInfoSync with index1 for gif
         * @tc.desc      : 1.create gif imagesource
         *                 2.call getImageInfoSync(index:1)
         *                 3.return imageinfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_0300', 0, async (done: Function) => {
            testGetImageInfo(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_0300", "moving_test.gif", 198, 202,
                "image/gif", 1);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_0400
         * @tc.name      : test getImageInfoSync with index1 for one frame webp
         * @tc.desc      : 1.create jpg imagesource
         *                 2.call getImageInfoSync(index:1)
         *                 3.return imageinfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_0400', 0, async (done: Function) => {
            getImageInfoInvaildIndex(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_0400", "test_large.webp", 1);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_0500
         * @tc.name      : test getImageInfoSync with index1 for webp
         * @tc.desc      : 1.create jpg imagesource
         *                 2.call getImageInfoSync(index:1)
         *                 3.return imageinfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_0500', 0, async (done: Function) => {
            testGetImageInfo(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_0500", "moving_test.webp", 658, 494,
                "image/webp", 1);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_0600
         * @tc.name      : test getImageInfoSync with index null for jpg
         * @tc.desc      : 1.create jpg imagesource
         *                 2.call getImageInfoSync(index:null)
         *                 3.return imageinfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_0600', 0, async (done: Function) => {
            testGetImageInfo(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_0600", "test.jpg", 1446, 1476,
                "image/jpeg", null);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_0100
         * @tc.name      : test createPixelMapSync with buffer data png
         * @tc.desc      : 1.create png incremental source
         *                 2.update data
         *                 3.create pixelmap sync
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_0100', 0, async (done: Function) => {
            testCreateIncrementalSourcePixelMap(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_0100", testPng);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_0200
         * @tc.name      : test createPixelMapSync with buffer data jpg
         * @tc.desc      : 1.create jpg incremental source
         *                 2.update data
         *                 3.create pixelmap sync
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_0200', 0, async (done: Function) => {
            testCreateIncrementalSourcePixelMap(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_0200", testJpg);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_0300
         * @tc.name      : test createPixelMapSync with decodingOption index0
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions-index0
         *                 3.create PixelMap
         *                 4.return PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_0300', 0, async (done: Function) => {
            // let csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998, 2.3);
            let csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998)
            let decodingOptions: image.DecodingOptions = {
                index: 0,
                sampleSize: 1,
                rotate: 10,
                editable: true,
                desiredSize: {
                    width: 100, height: 20
                },
                desiredRegion: {
                    size: {
                        height: 1, width: 2
                    }, x: 0, y: 0
                },
                desiredPixelFormat: 2,
                fitDensity: 240,
                desiredColorSpace: csm,
                desiredDynamicRange: 0
            };
            testCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_0300", "test.jpg", decodingOptions);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_0400
         * @tc.name      : test createPixelMapSync with decodingOption index-1
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions-index-1
         *                 3.create PixelMap
         *                 4.return PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_0400', 0, async (done: Function) => {
            let decodingOptions: image.DecodingOptions = {
                index: -1,
                sampleSize: 1,
                rotate: 10,
                editable: true,
                desiredSize: {
                    width: 1, height: 2
                },
                desiredRegion: {
                    size: {
                        height: 1, width: 2
                    }, x: 0, y: 0
                },
                desiredPixelFormat: 2,
                fitDensity: 240
            };
            createPixelMapInvaildOpt(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_0400", "test.jpg", decodingOptions);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_0500
         * @tc.name      : test createPixelMapSync with decodingOption sampleSize
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions-sampleSize
         *                 3.create PixelMap
         *                 4.return PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_0500', 0, async (done: Function) => {
            let csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3);
            let decodingOptions: image.DecodingOptions = {
                index: 0,
                sampleSize: 1,
                rotate: 10,
                editable: true,
                desiredSize: {
                    width: 100, height: 20
                },
                desiredRegion: {
                    size: {
                        height: 1, width: 2
                    }, x: 0, y: 0
                },
                desiredPixelFormat: 2,
                fitDensity: 240,
                desiredColorSpace: csm
            };
            testCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_0500", "test.jpg", decodingOptions);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_0600
         * @tc.name      : test createPixelMapSync with decodingOption rotate
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions-rotate
         *                 3.create PixelMap
         *                 4.return PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_0600', 0, async (done: Function) => {
            // let csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3, 2.4);
            let csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3);
            let decodingOptions: image.DecodingOptions = {
                index: 0,
                sampleSize: 1,
                rotate: 30,
                editable: true,
                desiredSize: {
                    width: 10, height: 10
                },
                desiredRegion: {
                    size: {
                        height: 10, width: 10
                    }, x: 0, y: 0
                },
                desiredPixelFormat: 2,
                fitDensity: 200,
                desiredColorSpace: csm
            };
            testCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_0600", "test.jpg", decodingOptions);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_0700
         * @tc.name      : test createPixelMapSync with decodingOption editable
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions-editable
         *                 3.create PixelMap
         *                 4.return PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_0700', 0, async (done: Function) => {
            // let csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB, 1.9);
            let csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB);
            let decodingOptions: image.DecodingOptions = {
                index: 0,
                sampleSize: 1,
                rotate: 30,
                editable: true,
                desiredSize: {
                    width: 10, height: 10
                },
                desiredRegion: {
                    size: {
                        height: 10, width: 10
                    }, x: 1, y: 1
                },
                desiredPixelFormat: 2,
                fitDensity: 200,
                desiredColorSpace: csm
            };
            testCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_0700", "test.jpg", decodingOptions);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_0800
         * @tc.name      : test createPixelMapSync with decodingOption desiredSize
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions-desiredSize
         *                 3.create PixelMap
         *                 4.return PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_0800', 0, async (done: Function) => {
            // let csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB, 2.4);
            let csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB);
            let decodingOptions: image.DecodingOptions = {
                index: 0,
                sampleSize: 1,
                rotate: 50,
                editable: false,
                desiredSize: {
                    width: 10, height: 20
                },
                desiredRegion: {
                    size: {
                        height: 10, width: 20
                    }, x: 0, y: 0
                },
                desiredPixelFormat: 3,
                fitDensity: 150,
                desiredColorSpace: csm
            };
            testCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_0800", "test.jpg", decodingOptions);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_0900
         * @tc.name      : test createPixelMapSync with decodingOption desiredRegion
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions-desiredRegion
         *                 3.create PixelMap
         *                 4.return PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_0900', 0, async (done: Function) => {
            let primaries: colorSpaceManager.ColorSpacePrimaries = {
                redX: 0.64,
                redY: 0.33,
                greenX: 0.3,
                greenY: 0.6,
                blueX: 0.15,
                blueY: 0.06,
                whitePointX: 0.3127,
                whitePointY: 0.3290
            };
            let csm = colorSpaceManager.create(primaries, 2.875);
            let decodingOptions: image.DecodingOptions = {
                index: 0,
                sampleSize: 1,
                rotate: 50,
                editable: false,
                desiredSize: {
                    width: 1, height: 2
                },
                desiredRegion: {
                    size: {
                        height: 1, width: 2
                    }, x: 0, y: 0
                },
                desiredPixelFormat: 3,
                fitDensity: 150,
                desiredColorSpace: csm
            };
            testCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_0900", "test.jpg", decodingOptions);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_1000
         * @tc.name      : test createPixelMapSync with decodingOption desiredPixelFormat
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions-desiredPixelFormat
         *                 3.create PixelMap
         *                 4.return PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_1000', 0, async (done: Function) => {
            // let csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998_LIMIT, undefined);
            let csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998_LIMIT);
            let decodingOptions: image.DecodingOptions = {
                index: 0,
                sampleSize: 1,
                rotate: 70,
                editable: false,
                desiredSize: {
                    width: 10, height: 20
                },
                desiredRegion: {
                    size: {
                        height: 1, width: 2
                    }, x: 30, y: 30
                },
                desiredPixelFormat: 3,
                fitDensity: 100,
                desiredColorSpace: csm
            };
            testCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_1000", "test.jpg", decodingOptions);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_1100
         * @tc.name      : test createPixelMapSync with decodingOption fitDensity
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions-fitDensity
         *                 3.create PixelMap
         *                 4.return PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_1100', 0, async (done: Function) => {
            // let csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_SRGB, undefined);
            let csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_SRGB);
            let decodingOptions: image.DecodingOptions = {
                index: 0,
                sampleSize: 1,
                rotate: 70,
                editable: false,
                desiredSize: {
                    width: 10, height: 20
                },
                desiredRegion: {
                    size: {
                        height: 30, width: 30
                    }, x: 30, y: 30
                },
                desiredPixelFormat: 3,
                fitDensity: 100,
                desiredColorSpace: csm
            };
            testCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_1100", "test.jpg", decodingOptions);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_1200
         * @tc.name      : test createPixelMapSync with decodingOption desiredColorSpace
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions-desiredColorSpace
         *                 3.create PixelMap
         *                 4.return PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_1200', 0, async (done: Function) => {
            let csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_SRGB);
            let decodingOptions: image.DecodingOptions = {
                index: 0,
                sampleSize: 1,
                editable: false,
                desiredPixelFormat: 3,
                fitDensity: 50,
                desiredColorSpace: csm
            };
            testCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_1200", "test.jpg", decodingOptions);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_1300
         * @tc.name      : test createPixelMapSync with decodingOption null
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions-null
         *                 3.create PixelMap
         *                 4.return PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_1300', 0, async (done: Function) => {
            testCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_1300", "test.jpg", null);
        });
    })
}