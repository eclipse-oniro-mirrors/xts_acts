// @ts-nocheck
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

import image from "@ohos.multimedia.image";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'hypium/index';
import featureAbility from "@ohos.ability.featureAbility";
import fileio from "@ohos.fileio";
import ndkTest from 'libImagePackingNDKTest.so';
import resourceManager from '@ohos.resourceManager';

export default function ImagePackingNDKTest() {
    describe('ImagePackingNDKTest', function () {
        const CODE_SUCCESS = 0;
        const ERR_CODE = 62980115;
        beforeAll(function () {
            console.info('beforeAll case');
        })

        beforeEach(function () {
            console.info('beforeEach case');
        })

        afterEach(function () {
            console.info('afterEach case');
        })

        afterAll(function () {
            console.info('afterAll case');
        })
        function logger(caseName) {
            return {
                myName: caseName,
                log: function (msg) {
                    console.info(this.myName + ' ' + msg);
                }
            }
        }

        async function getWriteFd(fileName) {
            let fdNumber = undefined;
            let filePath = undefined;
            try {
                let context = await featureAbility.getContext();
                await context.getCacheDir().then((data) => {
                    filePath = data + "/" + fileName;
                });
                console.info("image getWriteFd filePath is " + filePath);
                fdNumber = fileio.openSync(filePath, 0o102, 0o666);
                console.log(`getWriteFd fd: ${JSON.stringify(fdNumber)}`);
                if (fdNumber !== null) {
                    console.info("getWriteFd file fd created");
                } else {
                    console.info("getWriteFd file fd created error");
                }

                fdNumber = fileio.openSync(filePath, 0o2002, 0o666);
                console.log(`getWriteFd fd-re: ${JSON.stringify(fdNumber)}`);
                if (fdNumber !== null) {
                    console.info("getWriteFd file fd opened : Append Mode");
                } else {
                    console.info("getWriteFd file fd opened : Append Mode failed");
                }
            } catch (error) {
                console.info("image getWriteFd " + error);
            }
            return [filePath, fdNumber];
        }

        function checkNdkRes(res) {
            expect(res != undefined).assertTrue();
            expect(res.code == CODE_SUCCESS).assertTrue();
        }

        async function createTestImageSource(picName) {
            try {
                let resMgr = await resourceManager.getResourceManager();
                let value = await resMgr.getRawFileContent(picName)
                return image.createImageSource(value.buffer);
            } catch (error) {
                console.info("getRawFileContent case error " + error);
            }
        }

        async function createTestPixelMap() {
            const Color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 2, size: { height: 4, width: 6 } };
            return await image.createPixelMap(Color, opts)
        }

        async function createTest(done, testNum) {
            try {
                let log = logger(testNum);
                let packer = ndkTest.create()
                checkNdkRes(packer)
                expect(packer.result != undefined).assertTrue();
                log.log("packer create finished");
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        }

        async function nativeInitTest(done, testNum) {
            try {
                let log = logger(testNum);
                let packer = ndkTest.create()
                if (packer == undefined || packer.code != CODE_SUCCESS || packer.result == undefined) {
                    log.log("packer create failed");
                    expect().assertFail();
                    done();
                    return
                }
                let initRes = ndkTest.initNative(packer.result);
                checkNdkRes(initRes);
                log.log("packer init native finished");
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        }

        async function packToDataTest(done, testNum, source, packOpts) {
            try {
                let log = logger(testNum);
                let packer = ndkTest.create()
                if (packer == undefined || packer.code != CODE_SUCCESS || packer.result == undefined) {
                    log.log("packer create failed");
                    expect().assertFail();
                    done();
                    return
                }
                let packingRes = ndkTest.packToData(packer.result, source, packOpts);
                checkNdkRes(packingRes);
                expect(packingRes.result != undefined).assertTrue();
                log.log("packer packingRes.result " + JSON.stringify(new Uint8Array(packingRes.result).length));
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        }

        async function packToFileTest(done, testNum, source, writeFd, packOpts) {
            try {
                let log = logger(testNum);
                let packer = ndkTest.create()
                if (packer == undefined || packer.code != CODE_SUCCESS || packer.result == undefined) {
                    log.log("packer create failed");
                    expect().assertFail();
                    done();
                    return
                }
                let packingRes = ndkTest.packToFile(packer.result, source, writeFd, packOpts);
                log.log(`packingRes : ${JSON.stringify(packingRes)}`)
                checkNdkRes(packingRes);
                ndkTest.release(packer.result);
                packer.result.release();
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        }

        async function releaseTest(done, testNum) {
            try {
                let log = logger(testNum);
                let packer = ndkTest.create()
                if (packer == undefined || packer.code != CODE_SUCCESS || packer.result == undefined) {
                    log.log("packer create failed");
                    expect().assertFail();
                    done();
                    return
                }

                let releaseRes = ndkTest.release(packer.result);
                checkNdkRes(releaseRes);
                log.log("release result " + releaseRes.code);
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        }

        async function packToDataErrTest(done, testNum, source, packOpts) {
            try {
                let log = logger(testNum);
                let packer = ndkTest.create()
                if (packer == undefined || packer.code != CODE_SUCCESS || packer.result == undefined) {
                    log.log("packer create failed");
                    expect().assertFail();
                    done();
                    return
                }
                let packingRes = ndkTest.packToData(packer.result, source, packOpts);
                log.log("packer packingRes.result " + JSON.stringify(packingRes));
                expect(packingRes.code == ERR_CODE).assertTrue();
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        }

        async function packToFileErrTest(done, testNum, source, writeFd, packOpts) {
            try {
                let log = logger(testNum);
                let packer = ndkTest.create()
                if (packer == undefined || packer.code != CODE_SUCCESS || packer.result == undefined) {
                    log.log("packer create failed");
                    expect().assertFail();
                    done();
                    return
                }
                let packingRes = ndkTest.packToFile(packer.result, source, writeFd, packOpts);
                log.log(`packingRes : ${JSON.stringify(packingRes)}`)
                expect(packingRes.code == ERR_CODE).assertTrue();
                ndkTest.release(packer.result);
                packer.result.release();
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        }

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_CREATE_0100
         * @tc.name      : sub_multimedia_image_packerndk_create
         * @tc.desc      : 1.packingtestndk create
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_CREATE_0100', 0, async function (done) {
            await createTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_CREATE_0100");
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_INIT_NATIVE_0100
         * @tc.name      : sub_multimedia_image_packerndk_native_init
         * @tc.desc      : 1.packingtestndk create
         *                 2.packingtestndk native init
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_INIT_NATIVE_0100', 0, async function (done) {
            await nativeInitTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_INIT_NATIVE_0100");
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_JPG_DATA_0100
         * @tc.name      : sub_multimedia_image_packerndk_pack_image_source_to_jpg_data
         * @tc.desc      : 1.packingtestndk create
         *               : 2.create image source-png
         *                 3.packing image source to array buffer-jpeg
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_JPG_DATA_0100', 0, async function (done) {
            let source = await createTestImageSource("test.png")
            expect(source != undefined).assertTrue();
            let packOpts = { format: "image/jpeg", quality: 100 };
            await packToDataTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_JPG_DATA_0100", source,
                packOpts)
            await source.release()
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_JPG_FILE_0100
         * @tc.name      : sub_multimedia_image_packerndk_pack_image_source_into_jpg_file
         * @tc.desc      : 1.packingtestndk create
         *               : 2.create image source-png
         *               : 3.packing image source into a writtable file-jpeg
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_JPG_FILE_0100', 0, async function (done) {
            let log = logger("SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_JPG_FILE_0100");
            let source = await createTestImageSource("test.png")
            expect(source != undefined).assertTrue();
            let path, fd;
            [path, fd] = await getWriteFd("test_write_image_source.jpg")
            expect(fd != undefined).assertTrue();
            let packOpts = { format: "image/jpeg", quality: 100 };
            await packToFileTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_JPG_FILE_0100", source,
                fd, packOpts)
            fileio.closeSync(fd)
            log.log(`file size: ${JSON.stringify(fileio.statSync(path).size)}`)
            let size = fileio.statSync(path).size
            expect(size != 0).assertTrue();
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_WEBP_DATA_0200
         * @tc.name      : sub_multimedia_image_packerndk_pack_image_source_to_webp_data
         * @tc.desc      : 1.packingtestndk create
         *               : 2.create image source-png
         *               : 3.packing image source to array buffer-webp
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_WEBP_DATA_0200', 0, async function (done) {
            let source = await createTestImageSource("test.png")
            expect(source != undefined).assertTrue();
            let packOpts = { format: "image/webp", quality: 100 };
            await packToDataTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_WEBP_DATA_0200", source,
                packOpts)
            await source.release()
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_WEBP_FILE_0200
         * @tc.name      : sub_multimedia_image_packerndk_pack_image_source_into_webp_file
         * @tc.desc      : 1.packingtestndk create
         *               : 2.create image source-png
         *               : 3.packing image source into a writtable file-webp
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_WEBP_FILE_0200', 0, async function (done) {
            let log = logger("SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_WEBP_FILE_0200");
            let source = await createTestImageSource("test.png")
            expect(source != undefined).assertTrue();
            console.log('image source ' + (source != undefined))
            let path, fd;
            [path, fd] = await getWriteFd("test_write_image_source.webp")
            expect(fd != undefined).assertTrue();
            let packOpts = { format: "image/webp", quality: 100 };
            await packToFileTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_WEBP_FILE_0200", source,
                fd, packOpts)
            fileio.closeSync(fd)
            log.log(`file size: ${JSON.stringify(fileio.statSync(path).size)}`)
            let size = fileio.statSync(path).size
            expect(size != 0).assertTrue();
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_PNG_DATA_0300
         * @tc.name      : sub_multimedia_image_packerndk_pack_image_source_to_png_data
         * @tc.desc      : 1.packingtestndk create
         *               : 2.create image source-png
         *               : 3.packing image source to array buffer-png
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_PNG_DATA_0300', 0, async function (done) {
            let source = await createTestImageSource("test.png")
            expect(source != undefined).assertTrue();
            let packOpts = { format: "image/png", quality: 100 };
            await packToDataTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_PNG_DATA_0300", source,
                packOpts)
            await source.release()
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_PNG_FILE_0300
         * @tc.name      : sub_multimedia_image_packerndk_pack_image_source_into_png_file
         * @tc.desc      : 1.packingtestndk create
         *               : 2.create image source-png
         *               : 3.packing image source into a writtable file-png
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_PNG_FILE_0300', 0, async function (done) {
            let log = logger("SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_PNG_FILE_0300");
            let source = await createTestImageSource("test.png")
            expect(source != undefined).assertTrue();

            let path, fd;
            [path, fd] = await getWriteFd("test_write_image_source.png")
            expect(fd != undefined).assertTrue();
            let packOpts = { format: "image/png", quality: 100 };
            await packToFileTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_PNG_FILE_0300", source,
                fd, packOpts)
            fileio.closeSync(fd)
            log.log(`file size: ${JSON.stringify(fileio.statSync(path).size)}`)
            let size = fileio.statSync(path).size
            expect(size != 0).assertTrue();
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_JPG_DATA_0400
         * @tc.name      : sub_multimedia_image_packerndk_pack_pixelmap_to_jpg_data
         * @tc.desc      : 1.packingtestndk create
         *                 2.packing pixelmap to array buffer-jpg
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_JPG_DATA_0400', 0, async function (done) {
            let source = await createTestPixelMap()
            expect(source != undefined).assertTrue();
            let packOpts = { format: "image/jpeg", quality: 100 };
            await packToDataTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_JPG_DATA_0400", source,
                packOpts)
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_JPG_FILE_0400
         * @tc.name      : sub_multimedia_image_packerndk_pack_pixelmap_into_jpg_file
         * @tc.desc      : 1.packingtestndk create
         *                 2.packing pixelmap into a writtable file-jpg
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_JPG_FILE_0400', 0, async function (done) {
            let log = logger("SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_JPG_FILE_0400");
            let source = await createTestPixelMap()
            expect(source != undefined).assertTrue();
            let path, fd;
            [path, fd] = await getWriteFd("test_write_pixel_map.jpg")
            expect(fd != undefined).assertTrue();
            let packOpts = { format: "image/jpeg", quality: 100 };
            await packToFileTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_JPG_FILE_0400", source, fd,
                packOpts)
            fileio.closeSync(fd)
            log.log(`file size: ${JSON.stringify(fileio.statSync(path).size)}`)
            let size = fileio.statSync(path).size
            expect(size != 0).assertTrue();
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_WEBP_DATA_0500
         * @tc.name      : sub_multimedia_image_packerndk_pack_pixelmap_to_webp_data
         * @tc.desc      : 1.packingtestndk create
         *                 2.packing pixelmap to array buffer-webp
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_WEBP_DATA_0500', 0, async function (done) {
            let source = await createTestPixelMap()
            expect(source != undefined).assertTrue();
            let packOpts = { format: "image/webp", quality: 100 };
            await packToDataTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_WEBP_DATA_0500", source,
                packOpts)
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_WEBP_FILE_0500
         * @tc.name      : sub_multimedia_image_packerndk_pack_pixelmap_into_webp_file
         * @tc.desc      : 1.packingtestndk create
         *                 2.packing pixelmap into a writtable file-webp
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_WEBP_FILE_0500', 0, async function (done) {
            let log = logger("SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_WEBP_FILE_0500");
            let source = await createTestPixelMap()
            console.log('pixel map ' + (source != undefined))
            expect(source != undefined).assertTrue();
            let path, fd;
            [path, fd] = await getWriteFd("test_write_pixel_map.webp")
            expect(fd != undefined).assertTrue();
            let packOpts = { format: "image/webp", quality: 100 };
            await packToFileTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_WEBP_FILE_0500", source, fd,
                packOpts)
            fileio.closeSync(fd)
            log.log(`file size: ${JSON.stringify(fileio.statSync(path).size)}`)
            let size = fileio.statSync(path).size
            expect(size != 0).assertTrue();
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_PNG_DATA_0600
         * @tc.name      : sub_multimedia_image_packerndk_pack_pixelmap_to_png_data
         * @tc.desc      : 1.packingtestndk create
         *                 2.packing pixelmap to array buffer-png
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_PNG_DATA_0600', 0, async function (done) {
            let source = await createTestPixelMap()
            expect(source != undefined).assertTrue();
            let packOpts = { format: "image/png", quality: 100 };
            await packToDataTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_PNG_DATA_0600", source,
                packOpts)
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_PNG_FILE_0600
         * @tc.name      : sub_multimedia_image_packerndk_pack_pixelmap_into_png_file
         * @tc.desc      : 1.packingtestndk create
         *                 2.packing pixelmap into a writtable file-png
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_PNG_FILE_0600', 0, async function (done) {
            let log = logger("SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_PNG_FILE_0600");
            let source = await createTestPixelMap()
            expect(source != undefined).assertTrue();
            let path, fd;
            [path, fd] = await getWriteFd("test_write_pixel_map.png")
            expect(fd != undefined).assertTrue();
            let packOpts = { format: "image/png", quality: 100 };
            await packToFileTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_PNG_FILE_0600", source, fd,
                packOpts)
            fileio.closeSync(fd)
            log.log(`file size: ${JSON.stringify(fileio.statSync(path).size)}`)
            let size = fileio.statSync(path).size
            expect(size != 0).assertTrue();
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_RELEASE_0100
         * @tc.name      : sub_multimedia_image_packerndk_native_release
         * @tc.desc      : 1.packingtestndk create
         *                 2.packingtestndk native release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_RELEASE_0100', 0, async function (done) {
            await releaseTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_RELEASE_0100");
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_DATA_ERR_0100
         * @tc.name      : sub_multimedia_image_packerndk_pack_image_source_to_data_err_001
         * @tc.desc      : 1.packingtestndk create
         *               : 2.create image source-png
         *               : 3.packing image source to array buffer-format: "image/txt"
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_DATA_ERR_0100', 0, async function (done) {
            let source = await createTestImageSource("test.png")
            expect(source != undefined).assertTrue();
            let packOpts = { format: "image/txt", quality: 100 };
            await packToDataErrTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_DATA_ERR_0100", source,
                packOpts)
            await source.release()
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_DATA_ERR_0200
         * @tc.name      : sub_multimedia_image_packerndk_pack_image_source_to_data_err_002
         * @tc.desc      : 1.packingtestndk create
         *               : 2.create image source-png
         *               : 3.packing image source to array buffer-quality: 101
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_DATA_ERR_0200', 0, async function (done) {
            let source = await createTestImageSource("test.png")
            expect(source != undefined).assertTrue();
            let packOpts = { format: "image/jpeg", quality: 101 };
            await packToDataErrTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_DATA_ERR_0200", source,
                packOpts)
            await source.release()
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_DATA_ERR_0300
         * @tc.name      : sub_multimedia_image_packerndk_pack_image_source_to_data_err_003
         * @tc.desc      : 1.packingtestndk create
         *               : 2.create image source-png
         *               : 3.packing image source to array buffer-no quality
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_DATA_ERR_0300', 0, async function (done) {
            let source = await createTestImageSource("test.png")
            expect(source != undefined).assertTrue();
            let packOpts = { format: "image/jpeg" };
            await packToDataErrTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_DATA_ERR_0300", source,
                packOpts)
            await source.release()
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_DATA_ERR_0400
         * @tc.name      : sub_multimedia_image_packerndk_pack_image_source_to_data_err_004
         * @tc.desc      : 1.packingtestndk create
         *               : 2.create image source-png
         *               : 3.packing image source to array buffer-no format
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_DATA_ERR_0400', 0, async function (done) {
            let source = await createTestImageSource("test.png")
            expect(source != undefined).assertTrue();
            let packOpts = { quality: 10 };
            await packToDataErrTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_DATA_ERR_0400", source,
                packOpts)
            await source.release()
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_FILE_ERR_0100
         * @tc.name      : sub_multimedia_image_packerndk_pack_imagesource_into_file_err_001
         * @tc.desc      : 1.packingtestndk create
         *                 2.packing imagesource into a writtable file-format: "image/txt"
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_FILE_ERR_0100', 0, async function (done) {
            let source = await createTestImageSource("test.png")
            expect(source != undefined).assertTrue();
            let path, fd;
            [path, fd] = await getWriteFd("test_write_pixel_map_erra.jpeg")
            expect(fd != undefined).assertTrue();
            let packOpts = { format: "image/txt", quality: 100 };
            await packToFileErrTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_FILE_ERR_0100", source,
                fd, packOpts)
            fileio.closeSync(fd)
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_FILE_ERR_0200
         * @tc.name      : sub_multimedia_image_packerndk_pack_imagesource_into_file_err_002
         * @tc.desc      : 1.packingtestndk create
         *                 2.packing imagesource into a writtable file-quality: 101
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_FILE_ERR_0200', 0, async function (done) {
            let source = await createTestImageSource("test.png")
            expect(source != undefined).assertTrue();
            let path, fd;
            [path, fd] = await getWriteFd("test_write_pixel_map_errb.jpeg")
            expect(fd != undefined).assertTrue();
            let packOpts = { format: "image/jpeg", quality: 101 };
            await packToFileErrTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_FILE_ERR_0200", source,
                fd, packOpts)
            fileio.closeSync(fd)
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_FILE_ERR_0300
         * @tc.name      : sub_multimedia_image_packerndk_pack_imagesource_into_file_err_003
         * @tc.desc      : 1.packingtestndk create
         *                 2.packing imagesource into a writtable file-no quality
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_FILE_ERR_0300', 0, async function (done) {
            let source = await createTestImageSource("test.png")
            expect(source != undefined).assertTrue();
            let path, fd;
            [path, fd] = await getWriteFd("test_write_pixel_map_errc.jpeg")
            expect(fd != undefined).assertTrue();
            let packOpts = { format: "image/jpeg" };
            await packToFileErrTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_FILE_ERR_0300", source,
                fd, packOpts)
            fileio.closeSync(fd)
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_FILE_ERR_0400
         * @tc.name      : sub_multimedia_image_packerndk_pack_imagesource_into_file_err_004
         * @tc.desc      : 1.packingtestndk create
         *                 2.packing imagesource into a writtable file-no quality
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_FILE_ERR_0400', 0, async function (done) {
            let source = await createTestImageSource("test.png")
            expect(source != undefined).assertTrue();
            let path, fd;
            [path, fd] = await getWriteFd("test_write_pixel_map_errc.jpeg")
            expect(fd != undefined).assertTrue();
            let packOpts = { quality: 10 };
            await packToFileErrTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_FILE_ERR_0400", source,
                fd, packOpts)
            fileio.closeSync(fd)
            done();
        })
    })
}