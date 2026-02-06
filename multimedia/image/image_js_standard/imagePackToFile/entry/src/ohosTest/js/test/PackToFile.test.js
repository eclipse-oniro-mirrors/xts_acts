/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import featureAbility from "@ohos.ability.featureAbility";
import fileio from "@ohos.fileio";
import resourceManager from '@ohos.resourceManager';

export default function imagePackToFile() {
    describe("imagePackToFile", function () {
        let globalpixelmap;
        let globalPacker;
        let globalImagesource;
        let picSize = {
            pngWidth: 472,
            pngHeight: 75,
            pixelWidth: 6,
            pixelHeight: 4
        }
        const ERROR_CODE = 62980115;

        beforeAll(async function () {
            console.info("beforeAll case");
        });

        beforeEach(function () {
            console.info("beforeEach case");
        });

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
            if (globalPacker != undefined) {
                console.info("globalPacker release start");
                try {
                    await globalPacker.release();
                } catch (error) {
                    console.info("globalPacker release fail");
                }
            }
            console.info("afterEach case");
        });

        afterAll(function () {
            console.info("afterAll case");
        });

        async function getImageSourceData(fileName) {
            try {
                let resMgr = await resourceManager.getResourceManager();
                let value = await resMgr.getRawFileContent(fileName)
                globalImagesource = image.createImageSource(value.buffer);
                console.log('image source ' + (globalImagesource != undefined))
            } catch (error) {
                console.info("getRawFileContent case"+error);
            }
        }

        async function getPixelMapData() {
            let opts = { editable: true, pixelFormat: 2, size: { height: 4, width: 6 } };
            const Color = new ArrayBuffer(96);
            globalpixelmap = await image.createPixelMap(Color, opts);
        }

        async function getWriteFd(fileName) {
            let writeFd = undefined;
            let fPath = undefined;
            try {
                let context = await featureAbility.getContext();
                await context.getCacheDir().then((data) => {
                    fPath = data + "/" + fileName;
                });
                console.info("image getWriteFd fPath is " + fPath);
                writeFd = fileio.openSync(fPath, 0o102, 0o666);
                console.log(`getWriteFd fd: ${JSON.stringify(writeFd)}`);
                if (writeFd !== null) {
                    console.info("getWriteFd file fd created");
                } else {
                    console.info("getWriteFd file fd created error");
                }
                writeFd = fileio.openSync(fPath, 0o2002, 0o666);
                console.log(`getWriteFd fd-re: ${JSON.stringify(writeFd)}`);
                if (writeFd !== null) {
                    console.info("getWriteFd file fd opened : Append Mode");
                } else {
                    console.info("getWriteFd file fd opened : Append Mode failed");
                }
            } catch (error) {
                console.info("image getWriteFd " + error);
            }
            return [fPath, writeFd];
        }

        function packToFilePromise(done, testNum, source, fd, fPath, ops, checkSize) {
            try {
                globalPacker = image.createImagePacker();
                expect(globalPacker != undefined).assertTrue();
                if (globalPacker == undefined) {
                    done();
                    return;
                }
                globalPacker.packToFile(source, fd, ops).then(async () => {
                    try {
                        fileio.closeSync(fd)
                        console.info(`${testNum} file size ${fileio.statSync(fPath).size}`);
                        let imgSource = image.createImageSource(fPath);
                        let info = await imgSource.getImageInfo();
                        console.log(`${testNum} file size ${info.size.width}`);
                        console.log(`${testNum} file size ${info.size.height}`);
                        checkSize(info.size.width, info.size.height)
                        done();
                    } catch (e1) {
                        console.log("packToFilePromise e1: " + e1);
                        expect().assertFail();
                        done();
                    }
                }).catch((error) => {
                    console.log(`${testNum} error: ` + error);
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.log("packToFilePromise error: " + error);
                expect().assertFail();
                done();
            }
        }

        function packToFileCallback(done, testNum, source, fd, fPath, ops, checkSize) {
            try {
                globalPacker = image.createImagePacker();
                expect(globalPacker != undefined).assertTrue();
                if (globalPacker == undefined) {
                    done();
                }
                globalPacker.packToFile(source, fd, ops, async (err) => {
                    try {
                        fileio.closeSync(fd)
                        console.info(`${testNum} file size ${fileio.statSync(fPath).size}`);
                        if (err != undefined) {
                            console.info(`${testNum} pack failerr: ${err}`);
                            expect(false).assertTrue();
                            done();
                        } else {
                            let imgSource = image.createImageSource(fPath);
                            let info = await imgSource.getImageInfo();
                            console.log(`${testNum} file size ${info.size.width}`);
                            console.log(`${testNum} file size ${info.size.height}`);
                            checkSize(info.size.width, info.size.height)
                            done();
                        }
                    } catch (e1) {
                        console.log("packToFileCallback e1: " + e1);
                        expect().assertFail();
                        done();
                    }
                })
            } catch (error) {
                console.log("packToFileCallback error: " + error);
                expect().assertFail();
                done();
            }
        }

        function packToFileCbErr(done, testNum, source, fd, ops, fPath) {
            try {
                globalPacker = image.createImagePacker();
                expect(globalPacker != undefined).assertTrue();
                if (globalPacker == undefined) {
                    expect(false).assertTrue();
                    done();
                    return;
                }
                globalPacker.packToFile(source, fd, ops, (err) => {
                    fileio.closeSync(fd);
                    if (err != undefined) {
                        console.info(`${testNum} pack failerr: ${JSON.stringify(err)}`);
                        console.info(`${testNum} file size ${fileio.statSync(fPath).size}`);
                        expect(err.code == ERROR_CODE).assertTrue();
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }
                })
            } catch (error) {
                console.log("packToFileCallback error: " + error);
                expect().assertFail();
                done();
            }
        }

        async function packToFilePromiseErr(done, testNum, source, fd, ops, fPath) {
            try {
                globalPacker = image.createImagePacker();
                expect(globalPacker != undefined).assertTrue();
                if (globalPacker == undefined) {
                    done();
                    return;
                }
                try {
                    await globalPacker.packToFile(source, fd, ops);
                    fileio.closeSync(fd);
                    expect(false).assertTrue();
                    console.info(`${testNum} packToFile test`);
                    done();
                } catch (error) {
                    fileio.closeSync(fd);
                    console.log(`${testNum} packToFile error: ` + JSON.stringify(error));
                    console.info(`${testNum} file size ${fileio.statSync(fPath).size}`);
                    expect(error.code == ERROR_CODE).assertTrue();
                    done();
                }
            } catch (error) {
                console.log("packToFilePromise error: " + error);
                expect().assertFail();
                done();
            }
        }

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_IMAGE_SOURCE_0100
         * @tc.name      : sub_multimedia_image_packToFile_promise_imagesource_001
         * @tc.desc      : 1.create imagesource
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile with imagesource-jpg
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_IMAGE_SOURCE_0100", Level.LEVEL0, async function (done) {
            await getImageSourceData("test.png")
            expect(globalImagesource != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("promise_image_source.jpg")
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/jpeg", quality: 100 };

            function checkSize(width, height) {
                expect(width == picSize.pngWidth).assertTrue();
                expect(height == picSize.pngHeight).assertTrue();
            }
            packToFilePromise(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_IMAGE_SOURCE_0100",
                globalImagesource, writeFd, fpath, ops, checkSize)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_IMAGE_SOURCE_0200
         * @tc.name      : sub_multimedia_image_packToFile_promise_imagesource_002
         * @tc.desc      : 1.create imagesource-png
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile with imagesource-webp
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_IMAGE_SOURCE_0200", Level.LEVEL0, async function (done) {
            await getImageSourceData("test.png")
            expect(globalImagesource != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("webp_image_source.webp")
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/webp", quality: 100 };

            function checkSize(width, height) {
                expect(width == picSize.pngWidth).assertTrue();
                expect(height == picSize.pngHeight).assertTrue();
            }
            packToFilePromise(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_IMAGE_SOURCE_0200",
                globalImagesource, writeFd, fpath, ops, checkSize)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_IMAGE_SOURCE_0300
         * @tc.name      : sub_multimedia_image_packToFile_promise_imagesource_003
         * @tc.desc      : 1.create imagesource
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile with imagesource-png
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_IMAGE_SOURCE_0300", Level.LEVEL0, async function (done) {
            await getImageSourceData("test.png")
            expect(globalImagesource != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("png_image_source.png")
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/png", quality: 100 };

            function checkSize(width, height) {
                expect(width == picSize.pngWidth).assertTrue();
                expect(height == picSize.pngHeight).assertTrue();
            }
            packToFilePromise(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_IMAGE_SOURCE_0300",
                globalImagesource, writeFd, fpath, ops, checkSize)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_IMAGE_SOURCE_0100
         * @tc.name      : sub_multimedia_image_packToFile_callback_imagesource_001
         * @tc.desc      : 1.create imagesource
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile with imagesource-jpg
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_IMAGE_SOURCE_0100", Level.LEVEL0, async function (done) {
            await getImageSourceData("test.png")
            expect(globalImagesource != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("callback_image_source.jpg")
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/jpeg", quality: 100 };

            function checkSize(width, height) {
                expect(width == picSize.pngWidth).assertTrue();
                expect(height == picSize.pngHeight).assertTrue();
            }
            packToFileCallback(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_IMAGE_SOURCE_0100",
                globalImagesource, writeFd, fpath, ops, checkSize)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_IMAGE_SOURCE_0200
         * @tc.name      : sub_multimedia_image_packToFile_callback_imagesource_002
         * @tc.desc      : 1.create imagesource
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile with imagesource-webp
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_IMAGE_SOURCE_0200", Level.LEVEL0, async function (done) {
            await getImageSourceData("test.png")
            expect(globalImagesource != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("callback_image_source.webp")
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/webp", quality: 100 };

            function checkSize(width, height) {
                expect(width == picSize.pngWidth).assertTrue();
                expect(height == picSize.pngHeight).assertTrue();
            }
            packToFileCallback(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_IMAGE_SOURCE_0200",
                globalImagesource, writeFd, fpath, ops, checkSize)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_IMAGE_SOURCE_0300
         * @tc.name      : sub_multimedia_image_packToFile_callback_imagesource_003
         * @tc.desc      : 1.create imagesource
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile with imagesource-png
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_IMAGE_SOURCE_0300", Level.LEVEL0, async function (done) {
            await getImageSourceData("test.png")
            expect(globalImagesource != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("callback_image_source.png")
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/png", quality: 100 };

            function checkSize(width, height) {
                expect(width == picSize.pngWidth).assertTrue();
                expect(height == picSize.pngHeight).assertTrue();
            }
            packToFileCallback(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_IMAGE_SOURCE_0300",
                globalImagesource, writeFd, fpath, ops, checkSize)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_PIXEL_MAP_0100
         * @tc.name      : sub_multimedia_image_packToFile_promise_pixelmap_001
         * @tc.desc      : 1.create pixelmap
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile with pixelmap-jpg
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_PIXEL_MAP_0100", Level.LEVEL0, async function (done) {
            await getPixelMapData()
            expect(globalpixelmap != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("promise_pixel_map.jpg")
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/jpeg", quality: 100 };

            function checkSize(width, height) {
                expect(width == picSize.pixelWidth).assertTrue();
                expect(height == picSize.pixelHeight).assertTrue();
            }
            packToFilePromise(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_PIXEL_MAP_0100",
                globalpixelmap, writeFd, fpath, ops, checkSize)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_PIXEL_MAP_0200
         * @tc.name      : sub_multimedia_image_packToFile_promise_pixelmap_002
         * @tc.desc      : 1.create pixelmap
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile with pixelmap-webp
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_PIXEL_MAP_0200", Level.LEVEL0, async function (done) {
            await getPixelMapData()
            expect(globalpixelmap != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("promise_pixel_map.webp")
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/webp", quality: 100 };

            function checkSize(width, height) {
                expect(width == picSize.pixelWidth).assertTrue();
                expect(height == picSize.pixelHeight).assertTrue();
            }
            packToFilePromise(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_PIXEL_MAP_0200",
                globalpixelmap, writeFd, fpath, ops, checkSize)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_PIXEL_MAP_0300
         * @tc.name      : sub_multimedia_image_packToFile_promise_pixelmap_003
         * @tc.desc      : 1.create pixelmap
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile with pixelmap-png
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_PIXEL_MAP_0300", Level.LEVEL0, async function (done) {
            await getPixelMapData()
            expect(globalpixelmap != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("promise_pixel_map.png")
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/png", quality: 100 };

            function checkSize(width, height) {
                expect(width == picSize.pixelWidth).assertTrue();
                expect(height == picSize.pixelHeight).assertTrue();
            }
            packToFilePromise(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_PIXEL_MAP_0300",
                globalpixelmap, writeFd, fpath, ops, checkSize)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_PIXEL_MAP_0100
         * @tc.name      : sub_multimedia_image_packToFile_callback_pixelmap_001
         * @tc.desc      : 1.create pixelmap
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile with pixelmap-jpg
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_PIXEL_MAP_0100", Level.LEVEL0, async function (done) {
            await getPixelMapData()
            expect(globalpixelmap != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("callback_pixel_map.jpg")
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/jpeg", quality: 100 };

            function checkSize(width, height) {
                expect(width == picSize.pixelWidth).assertTrue();
                expect(height == picSize.pixelHeight).assertTrue();
            }
            packToFileCallback(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_PIXEL_MAP_0100",
                globalpixelmap, writeFd, fpath, ops, checkSize)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_PIXEL_MAP_0200
         * @tc.name      : sub_multimedia_image_packToFile_callback_pixelmap_002
         * @tc.desc      : 1.create pixelmap
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile with pixelmap-webp
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_PIXEL_MAP_0200", Level.LEVEL0, async function (done) {
            await getPixelMapData()
            expect(globalpixelmap != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("callback_pixel_map.webp")
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/webp", quality: 100 };

            function checkSize(width, height) {
                expect(width == picSize.pixelWidth).assertTrue();
                expect(height == picSize.pixelHeight).assertTrue();
            }
            packToFileCallback(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_PIXEL_MAP_0200",
                globalpixelmap, writeFd, fpath, ops, checkSize)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_PIXEL_MAP_0300
         * @tc.name      : sub_multimedia_image_packToFile_callback_pixelmap_003
         * @tc.desc      : 1.create pixelmap
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile with pixelmap-png
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_PIXEL_MAP_0300", Level.LEVEL0, async function (done) {
            await getPixelMapData()
            expect(globalpixelmap != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("callback_pixel_map.png")
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/png", quality: 100 };

            function checkSize(width, height) {
                expect(width == picSize.pixelWidth).assertTrue();
                expect(height == picSize.pixelHeight).assertTrue();
            }
            packToFileCallback(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_PIXEL_MAP_0300",
                globalpixelmap, writeFd, fpath, ops, checkSize)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_0100
         * @tc.name      : sub_multimedia_image_packToFile_callback_pixelmap_err_001
         * @tc.desc      : 1.create pixelmap
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile no quality
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_0100", Level.LEVEL0, async function (done) {
            await getPixelMapData()
            expect(globalpixelmap != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("callback_pixel_map_erra.jpg");
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/jpeg" };
            packToFileCbErr(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_0100",
                globalpixelmap, writeFd, ops, fpath)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_0200
         * @tc.name      : sub_multimedia_image_packToFile_callback_pixelmap_err_002
         * @tc.desc      : 1.create pixelmap
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile { format: "image/jpeg", quality: 101 }
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_0200", Level.LEVEL0, async function (done) {
            await getPixelMapData()
            expect(globalpixelmap != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("callback_pixel_map_errb.jpg");
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/jpeg", quality: 101 };
            packToFileCbErr(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_0200",
                globalpixelmap, writeFd, ops, fpath)

        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_0300
         * @tc.name      : sub_multimedia_image_packToFile_callback_pixelmap_err_003
         * @tc.desc      : 1.create pixelmap
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile { format: "image/txt", quality: 100 };
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_0300", Level.LEVEL0, async function (done) {
            await getPixelMapData()
            expect(globalpixelmap != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("callback_pixel_map_errc.jpg");
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/txt", quality: 100 };
            packToFileCbErr(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_0300",
                globalpixelmap, writeFd, ops, fpath)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_0100
         * @tc.name      : sub_multimedia_image_packToFile_promise_pixelmap_err_001
         * @tc.desc      : 1.create pixelmap
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile no quality
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_0100", Level.LEVEL0, async function (done) {
            await getPixelMapData()
            expect(globalpixelmap != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("promise_pixel_map_erra.jpg");
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/jpeg" };
            await packToFilePromiseErr(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_0100",
                globalpixelmap, writeFd, ops, fpath)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_0200
         * @tc.name      : sub_multimedia_image_packToFile_promise_pixelmap_err_002
         * @tc.desc      : 1.create pixelmap
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile { format: "image/jpeg", quality: 101 };
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_0200", Level.LEVEL0, async function (done) {
            await getPixelMapData()
            expect(globalpixelmap != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("promise_pixel_map_errb.jpg");
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/jpeg", quality: 101 };
            await packToFilePromiseErr(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_0200",
                globalpixelmap, writeFd, ops, fpath)

        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_0300
         * @tc.name      : sub_multimedia_image_packToFile_promise_pixelmap_err_003
         * @tc.desc      : 1.create pixelmap
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile { format: "image/txt", quality: 100 };
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_0300", Level.LEVEL0, async function (done) {
            await getPixelMapData()
            expect(globalpixelmap != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("promise_pixel_map_errc.jpg");
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/txt", quality: 100 };
            await packToFilePromiseErr(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_0300",
                globalpixelmap, writeFd, ops, fpath)
        });
    });
}