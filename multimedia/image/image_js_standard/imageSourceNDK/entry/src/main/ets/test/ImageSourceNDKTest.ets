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
import resourceManager from "@ohos.resourceManager";
import fileio from "@ohos.fileio";
import ndkTest from 'libImageSourceNDKTest.so';
import { testJpg } from './testImg';

export default function ImageSourceNDKTest() {
    describe('ImageSourceNDKTest', function () {
        const CODE_SUCCESS = 0;
        const CODE_ERROR = -1;
        const { BITS_PER_SAMPLE, ORIENTATION, IMAGE_LENGTH, IMAGE_WIDTH, GPS_LATITUDE, GPS_LONGITUDE, GPS_LATITUDE_REF,
            GPS_LONGITUDE_REF, DATE_TIME_ORIGINAL } = image.PropertyKey;
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

        async function getPath(fileName: string) {
            let filePath = ""
            try {
                let context = await featureAbility.getContext();
                await context.getFilesDir().then((data) => {
                    filePath = data + "/" + fileName;
                });
                console.info("image case filePath is " + filePath);
            } catch (error) {
                console.info("image getFd " + error);
            }
            return filePath;
        }
        async function getFd(fileName) {
            let fdNumber = undefined;
            let filePath = undefined;
            try {
                filePath = await getPath(fileName);
                console.info("image case filePath is " + filePath);
                await fileio.open(filePath, 0o2, 0o777).then((data) => {
                    fdNumber = data;
                    console.info("image case open fd success " + fdNumber);
                }, (err) => {
                    console.info("image case open fd fail" + err);
                }).catch((err) => {
                    console.info("image case open fd err " + err);
                });
            } catch (error) {
                console.info("image getFd " + error);
            }
            return [filePath, fdNumber];
        }

        function checkNdkRes(res) {
            expect(res != undefined).assertTrue();
            expect(res.code == CODE_SUCCESS).assertTrue();
        }
        async function imageSourceCreateTest(done, testNum, picName, source) {
            try {
                let log = logger(testNum);
                let path, fd;
                [path, fd] = await getFd(picName);
                let imageSourceOps = {
                    density: 240
                };
                const sources = {
                    fd: fd, path: path, buffer: testJpg.buffer
                };
                let res = ndkTest.create(sources[source], imageSourceOps);
                log.log("imageSourceCreate res " + JSON.stringify(res));
                checkNdkRes(res);
                expect(res.result != undefined).assertTrue();
                return res;
            } catch (error) {
                log.log("Test exception1 " + error);
                expect().assertFail();
                done();
            }
        }
        async function imageSourceCreateFromFdTest(done, testNum, picName) {
            try {
                let log = logger(testNum);
                let path, fd;
                [path, fd] = await getFd(picName);
                let imageSourceOps = {
                    density: 240
                };
                let res = ndkTest.createFromFd(fd, imageSourceOps);
                log.log("imageSourceCreateFromFd res " + JSON.stringify(res));
                checkNdkRes(res);
                expect(res.result != undefined).assertTrue();
                return res;
            } catch (error) {
                log.log("Test exception1 " + error);
                expect().assertFail();
                done();
            }
        }
        async function imageSourceCreateFromUriTest(done, testNum, picName) {
            try {
                let log = logger(testNum);
                let path, fd;
                [path, fd] = await getFd(picName);
                let imageSourceOps = {
                    density: 240
                };
                let res = ndkTest.createFromUri(path, imageSourceOps);
                log.log("imageSourceCreateFromUri res " + JSON.stringify(res));
                checkNdkRes(res);
                expect(res.result != undefined).assertTrue();
                return res;
            } catch (error) {
                log.log("Test exception1 " + error);
                expect().assertFail();
                done();
            }
        }
        async function imageSourceCreateFromDataTest(done, testNum) {
            try {
                let log = logger(testNum);
                let imageSourceOps = {
                    density: 240
                };
                let res = ndkTest.createFromData(testJpg.buffer, imageSourceOps);
                log.log("imageSourceCreateFromData res " + JSON.stringify(res));
                checkNdkRes(res);
                expect(res.result != undefined).assertTrue();
                return res;
            } catch (error) {
                log.log("Test exception1 " + error);
                expect().assertFail();
                done();
            }
        }
        async function imageSourceCreateFromRawFileTest(done, testNum) {
            try {
                let log = logger(testNum);
                let imageSourceOps = {
                    density: 240
                };
                resourceManager.getResourceManager().then(mgr => {
                    if (mgr == undefined) {
                        console.info("getResourceManager is failed");
                    }
                    mgr.getRawFd("test/rawfile.png").then(rawfile => {
                        let res = ndkTest.createFromRawFile(rawfile, imageSourceOps);
                        checkNdkRes(res);
                        expect(res.result != undefined).assertTrue();
                        done();
                    })
                })
            } catch (error) {
                log.log("Test exception1 " + error);
                expect().assertFail();
                done();
            }
        }
        async function createPixelMap(done, testNum, picName) {
            try {
                let res = await imageSourceCreateTest(done, testNum, picName, "fd");
                let decodingOps = {
                    editable: true,
                    fitDensity: 220
                };
                let pixelMapRes = ndkTest.createPixelMap(res.result, decodingOps);
                checkNdkRes(pixelMapRes);
                expect(pixelMapRes.result != undefined).assertTrue();
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        }
        async function release(done, testNum, pictureName) {
            try {
                let log = logger(testNum);
                let res = await imageSourceCreateTest(done, testNum, pictureName, "fd");

                let releaseRes = ndkTest.release(res.result);
                checkNdkRes(releaseRes);
                log.log("release result " + releaseRes.code);
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        }
        async function getImageProperty(done, testNum, key, checkProps) {
            try {
                let log = logger(testNum);
                let res = await imageSourceCreateTest(done, testNum, "test_exif.jpg", "fd");
                let imagePropertyRes = ndkTest.getImageProperty(res.result, key);
                expect(imagePropertyRes != undefined).assertTrue();
                expect(imagePropertyRes.code == CODE_SUCCESS).assertTrue();
                log.log("Image property " + imagePropertyRes.result);
                checkProps(imagePropertyRes.result);
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        }
        async function modify(done, testNum, prop, checkProps) {
            try {

                let log = logger(testNum);
                let res = await imageSourceCreateTest(done, testNum, "test_exif.jpg", "fd");
                let propertyModifyRes = ndkTest.modifyImageProperty(res.result, prop.key, prop.value);
                checkNdkRes(propertyModifyRes);
                log.log("Image property modify " + propertyModifyRes.code);
                let imagePropertyRes = ndkTest.getImageProperty(res.result, prop.key);
                expect(imagePropertyRes != undefined).assertTrue();
                expect(imagePropertyRes.code == CODE_SUCCESS).assertTrue();
                log.log("Image property " + imagePropertyRes.result);
                checkProps(imagePropertyRes.result);
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        }
        async function modifyErr(done, testNum, key, value) {
            try {
                let log = logger(testNum)
                let res = await imageSourceCreateTest(done, testNum, "test_exif.jpg", "fd");
                let propertyModifyRes = ndkTest.modifyImageProperty(res.result, key, value);
                log.log("res " + JSON.stringify(propertyModifyRes));
                expect(propertyModifyRes.code == CODE_ERROR).assertTrue();
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        }
        async function getImagePropertyErr(done, testNum, key) {
            try {
                let log = logger(testNum)
                let res = await imageSourceCreateTest(done, testNum, "test_exif.jpg", "fd");
                let imagePropertyRes = ndkTest.getImageProperty(res.result, key);
                log.log("res " + JSON.stringify(imagePropertyRes));
                expect(imagePropertyRes.code == CODE_ERROR).assertTrue();
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        }
        function createImageSourceErr(done, testNum, source) {
            try {
                let log = logger(testNum);
                let imageSourceOps = {
                    density: 240
                };
                let res = ndkTest.create(source, imageSourceOps);
                log.log("res " + JSON.stringify(res));
                expect(res.code == CODE_ERROR).assertTrue();
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        }

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0100
         * @tc.name      : createImageSource -gif
         * @tc.desc      : 1.get fd
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0100', 0, async function (done) {
            await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0100", "moving_test.gif", "fd");
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0200
         * @tc.name      : createImageSource -jpg
         * @tc.desc      : 1.get fd
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0200', 0, async function (done) {
            await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0200", "test.jpg", "fd");
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0300
         * @tc.name      : createImageSource -bmp
         * @tc.desc      : 1.get fd
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0300', 0, async function (done) {
            await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0300", "test.bmp", "fd");
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0400
         * @tc.name      : createImageSource -png
         * @tc.desc      : 1.get fd
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0400', 0, async function (done) {
            await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0400", "test.png", "fd");
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0500
         * @tc.name      : createImageSource -webp
         * @tc.desc      : 1.get fd
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0500', 0, async function (done) {
            await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0500", "test_large.webp", "fd");
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0600
         * @tc.name      : createImageSource -svg
         * @tc.desc      : 1.get fd
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0600', 0, async function (done) {
            await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0600", "test_large.svg", "fd");
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0700
         * @tc.name      : createImageSource -dng
         * @tc.desc      : 1.get fd
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0700', 0, async function (done) {
            await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0700", "test_dng.dng", "fd");
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0800
         * @tc.name      : createImageSource -raw
         * @tc.desc      : 1.get fd
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0800', 0, async function (done) {
            await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0800", "test.nrw", "fd");
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0900
         * @tc.name      : createImageSource -raw
         * @tc.desc      : 1.get fd
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0900', 0, async function (done) {
            await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_0900", "test.cr2", "fd");
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_1000
         * @tc.name      : createImageSource -raw
         * @tc.desc      : 1.get fd
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_1000', 0, async function (done) {
            await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_1000", "test.arw", "fd");
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_1100
         * @tc.name      : createImageSource -raw
         * @tc.desc      : 1.get fd
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_1100', 0, async function (done) {
            await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_1100", "test.pef", "fd");
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_1200
         * @tc.name      : createImageSource -raw
         * @tc.desc      : 1.get fd
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_1200', 0, async function (done) {
            await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_1200", "test.raf", "fd");
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_1300
         * @tc.name      : createImageSource -raw
         * @tc.desc      : 1.get fd
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_1300', 0, async function (done) {
            await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_FD_1300", "test.rw2", "fd");
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_FROM_FD_0100
         * @tc.name      : createImageSourceFromFd -jpg
         * @tc.desc      : 1.get fd
         *                 2.createImageSourceFromFd
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_FROM_FD_0100', 0, async function (done) {
            await imageSourceCreateFromFdTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_FROM_FD_0100", "test.jpg");
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_BUFFER
         * @tc.name      : createImageSource -buffer
         * @tc.desc      : 1.get image buffer
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_BUFFER', 0, async function (done) {
            await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_BUFFER", "test.jpg", "buffer");
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_FROM_DATA
         * @tc.name      : createImageSourceFromData
         * @tc.desc      : 1.get image buffer
         *                 2.createImageSourceFromData
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_FROM_DATA', 0, async function (done) {
            await imageSourceCreateFromDataTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_FROM_DATA");
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_PATH
         * @tc.name      : createImageSource -path
         * @tc.desc      : 1.get image path
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_PATH', 0, async function (done) {
            await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_BY_PATH", "moving_test.gif", "path");
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_FROM_URI
         * @tc.name      : createImageSourceFromUri
         * @tc.desc      : 1.get image path
         *                 2.createImageSourceFromUri
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_FROM_URI', 0, async function (done) {
            await imageSourceCreateFromUriTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_FROM_URI", "moving_test.gif");
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_FROM_RAWFILE
         * @tc.name      : createImageSourceFromRawFile
         * @tc.desc      : 1.get image rawfiledescriptor
         *                 2.createImageSourceFromRawFile
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_FROM_RAWFILE', 0, async function (done) {
            await imageSourceCreateFromRawFileTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_FROM_RAWFILE");
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_INCREMENTAL
         * @tc.name      : createIncremental
         * @tc.desc      : 1.set imageSourceOps
         *                 2.createIncremental
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_INCREMENTAL', 0, async function (done) {
            try {
                let log = logger("SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_INCREMENTAL")
                let imageSourceOps = {
                    density: 240
                };

                let res = ndkTest.createIncremental(new ArrayBuffer(1), imageSourceOps);
                log.log("res " + JSON.stringify(res));
                checkNdkRes(res);
                expect(res.result != undefined).assertTrue();
                done();
            } catch (error) {
                console.error("Test exception " + JSON.stringify(error));
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_INCREMENTAL_FROM_DATA
         * @tc.name      : createIncremental
         * @tc.desc      : 1.set imageSourceOps
         *                 2.createIncremental
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_INCREMENTAL_FROM_DATA', 0, async function (done) {
            try {
                let log = logger("SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_INCREMENTAL_FROM_DATA")
                let imageSourceOps = {
                    density: 240
                };

                let res = ndkTest.createIncrementalFromData(new ArrayBuffer(1), imageSourceOps);
                log.log("res " + JSON.stringify(res));
                checkNdkRes(res);
                expect(res.result != undefined).assertTrue();
                done();
            } catch (error) {
                console.error("Test exception " + JSON.stringify(error));
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_INITNATIVE
         * @tc.name      : initNative
         * @tc.desc      : 1.create imageSource
         *                 2.initNative
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_INITNATIVE', 0, async function (done) {
            try {
                let res = await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_INITNATIVE", "moving_test.gif", "fd");
                let initRes = ndkTest.initNative(res.result);
                checkNdkRes(initRes);
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_GIF_0100
         * @tc.name      : createPixelMap -gif
         * @tc.desc      : 1.create imageSource
         *                 2.createPixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_GIF_0100', 0, async function (done) {
            createPixelMap(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_GIF_0100", "moving_test.gif");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_BMP_0200
         * @tc.name      : createPixelMap -bmp
         * @tc.desc      : 1.create imageSource
         *                 2.createPixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_BMP_0200', 0, async function (done) {
            createPixelMap(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_BMP_0200", "test.bmp");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_JPG_0300
         * @tc.name      : createPixelMap -jpg
         * @tc.desc      : 1.create imageSource
         *                 2.createPixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_JPG_0300', 0, async function (done) {
            createPixelMap(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_JPG_0300", "test.jpg");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_WEBP_0400
         * @tc.name      : createPixelMap -webp
         * @tc.desc      : 1.create imageSource
         *                 2.createPixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_WEBP_0400', 0, async function (done) {
            createPixelMap(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_WEBP_0400", "test_large.webp");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_PNG_0500
         * @tc.name      : createPixelMap -png
         * @tc.desc      : 1.create imageSource
         *                 2.createPixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_PNG_0500', 0, async function (done) {
            createPixelMap(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_PNG_0500", "test.png");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_SVG_0600
         * @tc.name      : createPixelMap -svg
         * @tc.desc      : 1.create imageSource
         *                 2.createPixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_SVG_0600', 0, async function (done) {
            createPixelMap(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_SVG_0600", "test_large.svg");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_0700
         * @tc.name      : createPixelMap -raw
         * @tc.desc      : 1.create imageSource
         *                 2.createPixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_0700', 0, async function (done) {
            createPixelMap(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_0700", "test_dng.dng");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_0800
         * @tc.name      : createPixelMap -raw
         * @tc.desc      : 1.create imageSource
         *                 2.createPixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_0800', 0, async function (done) {
            createPixelMap(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_0800", "test.nrw");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_0900
         * @tc.name      : createPixelMap -raw
         * @tc.desc      : 1.create imageSource
         *                 2.createPixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_0900', 0, async function (done) {
            createPixelMap(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_0900", "test.cr2");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_1000
         * @tc.name      : createPixelMap -raw
         * @tc.desc      : 1.create imageSource
         *                 2.createPixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_1000', 0, async function (done) {
            createPixelMap(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_1000", "test.arw");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_1100
         * @tc.name      : createPixelMap -raw
         * @tc.desc      : 1.create imageSource
         *                 2.createPixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_1100', 0, async function (done) {
            createPixelMap(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_1100", "test.pef");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_1200
         * @tc.name      : createPixelMap -raw
         * @tc.desc      : 1.create imageSource
         *                 2.createPixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_1200', 0, async function (done) {
            createPixelMap(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_1200", "test.raf");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_1300
         * @tc.name      : createPixelMap -raw
         * @tc.desc      : 1.create imageSource
         *                 2.createPixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_1300', 0, async function (done) {
            createPixelMap(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATEPIXELMAP_RAW_1300", "test.rw2");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_PIXEL_MAP_LIST
         * @tc.name      : createPixelMapList
         * @tc.desc      : 1.create imageSource
         *                 2.createPixelMapList
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_PIXEL_MAP_LIST', 0, async function (done) {
            try {
                let log = logger("SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_PIXEL_MAP_LIST");
                let res = await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_PIXEL_MAP_LIST", "moving_test.gif",
                    "fd");
                let decodingOps = {
                    fitDensity: 240
                };
                let pixelMapListRes = ndkTest.createPixelMapList(res.result, decodingOps);
                checkNdkRes(pixelMapListRes);
                expect(pixelMapListRes.result != undefined).assertTrue();
                expect(Array.isArray(pixelMapListRes.result)).assertTrue();
                log.log("Pixelmap list size " + pixelMapListRes.result.length);
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_DELAY_TIME
         * @tc.name      : getDelayTime
         * @tc.desc      : 1.create imageSource
         *                 2.getDelayTime
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_DELAY_TIME', 0, async function (done) {
            try {
                let log = logger("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_DELAY_TIME");
                let res = await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_DELAY_TIME", "moving_test.gif", "fd");
                let delayTimeListRes = ndkTest.getDelayTime(res.result);
                checkNdkRes(delayTimeListRes);
                expect(delayTimeListRes.result != undefined).assertTrue();
                expect(Array.isArray(delayTimeListRes.result)).assertTrue();
                log.log("Delay time list size " + delayTimeListRes.result.length);
                delayTimeListRes.result.forEach(element => {
                    log.log("Delay time " + element);
                });
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_FRAME_COUNT
         * @tc.name      : getFrameCount
         * @tc.desc      : 1.create imageSource
         *                 2.getFrameCount
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_FRAME_COUNT', 0, async function (done) {
            try {
                let log = logger("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_FRAME_COUNT");
                let res = await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_FRAME_COUNT", "moving_test.gif", "fd");
                let frameCountRes = ndkTest.getFrameCount(res.result);
                checkNdkRes(frameCountRes);
                expect(frameCountRes.result != undefined).assertTrue();
                expect(frameCountRes.result != 0).assertTrue();
                log.log("Frame count " + frameCountRes.result);
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_SUPPORTED_FORMATS
         * @tc.name      : getSupportedFormats
         * @tc.desc      : 1.getSupportedFormats
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_SUPPORTED_FORMATS', 0, async function (done) {
            try {
                let log = logger("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_SUPPORTED_FORMATS");
                let supportedFormatListRes = ndkTest.getSupportedFormats();
                checkNdkRes(supportedFormatListRes);
                expect(supportedFormatListRes.result != undefined).assertTrue();
                expect(Array.isArray(supportedFormatListRes.result)).assertTrue();
                log.log("Supported format list size " + supportedFormatListRes.result.length);
                supportedFormatListRes.result.forEach(element => {
                    log.log("Supported format " + element);
                });
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_INFO
         * @tc.name      : getImageInfo
         * @tc.desc      : 1.create imageSource
         *               : 2.getImageInfo
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_INFO', 0, async function (done) {
            try {
                let log = logger("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_INFO");
                let res = await imageSourceCreateTest(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_INFO", "moving_test.gif", "fd");
                let index = 0;
                let imageInfoRes = ndkTest.getImageInfo(res.result, index);
                checkNdkRes(imageInfoRes);
                log.log("Image Info " + JSON.stringify(imageInfoRes.result));
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0100
         * @tc.name      : release -gif
         * @tc.desc      : 1.create imageSource
         *               : 2.release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0100', 0, async function (done) {
            release(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0100", "moving_test.gif");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0200
         * @tc.name      : release -bmp
         * @tc.desc      : 1.create imageSource
         *               : 2.release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0200', 0, async function (done) {
            release(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0200", "test.bmp");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0300
         * @tc.name      : release -png
         * @tc.desc      : 1.create imageSource
         *               : 2.release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0300', 0, async function (done) {
            release(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0300", "test.png");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0400
         * @tc.name      : release -jpg
         * @tc.desc      : 1.create imageSource
         *               : 2.release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0400', 0, async function (done) {
            release(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0400", "test.jpg");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0500
         * @tc.name      : release -webp
         * @tc.desc      : 1.create imageSource
         *               : 2.release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0500', 0, async function (done) {
            release(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0500", "test_large.webp");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0600
         * @tc.name      : release -svg
         * @tc.desc      : 1.create imageSource
         *               : 2.release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0600', 0, async function (done) {
            release(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0600", "test_large.svg");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0700
         * @tc.name      : release -raw
         * @tc.desc      : 1.create imageSource
         *               : 2.release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0700', 0, async function (done) {
            release(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0700", "test_dng.dng");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0800
         * @tc.name      : release -raw
         * @tc.desc      : 1.create imageSource
         *               : 2.release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0800', 0, async function (done) {
            release(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0800", "test.nrw");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0900
         * @tc.name      : release -raw
         * @tc.desc      : 1.create imageSource
         *               : 2.release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0900', 0, async function (done) {
            release(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_0900", "test.cr2");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_1000
         * @tc.name      : release -raw
         * @tc.desc      : 1.create imageSource
         *               : 2.release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_1000', 0, async function (done) {
            release(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_1000", "test.arw");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_1100
         * @tc.name      : release -raw
         * @tc.desc      : 1.create imageSource
         *               : 2.release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_1100', 0, async function (done) {
            release(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_1100", "test.pef");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_1200
         * @tc.name      : release -raw
         * @tc.desc      : 1.create imageSource
         *               : 2.release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_1200', 0, async function (done) {
            release(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_1200", "test.raf");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_1300
         * @tc.name      : release -raw
         * @tc.desc      : 1.create imageSource
         *               : 2.release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_1300', 0, async function (done) {
            release(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_IMAGE_RELEASE_1300", "test.rw2");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_UPDATE_DATA
         * @tc.name      : updateData
         * @tc.desc      : 1.createIncremental
         *               : 2.updateData
         *               : 3.createPixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_UPDATE_DATA', 0, async function (done) {
            try {
                let log = logger("SUB_MULTIMEDIA_IMAGE_SOURCENDK_UPDATE_DATA")
                let imageSourceOps = {
                    density: 240
                };
                let res = ndkTest.createIncremental(new ArrayBuffer(1), imageSourceOps);
                if (res.result == undefined) {
                    done();
                    return;
                }
                let updateOps = {
                    buffer: testJpg.buffer,
                    offset: 0,
                    updateLength: testJpg.buffer.byteLength,
                    isCompleted: true
                };
                let updateRes = ndkTest.updateData(res.result, updateOps);
                checkNdkRes(updateRes);
                log.log("Image update Data " + updateRes.code)

                let decodingOps = {
                    editable: true,
                    fitDensity: 220
                };
                let pixelMapRes = ndkTest.createPixelMap(res.result, decodingOps);
                checkNdkRes(pixelMapRes);
                expect(pixelMapRes.result != undefined).assertTrue();
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0100
         * @tc.name      : getImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0100', 0, async function (done) {
            function checkProps(result) {
                expect(result == "8, 8, 8").assertTrue();
            }
            getImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0100", BITS_PER_SAMPLE, checkProps);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0200
         * @tc.name      : getImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0200', 0, async function (done) {
            function checkProps(result) {
                expect(result == "Top-right").assertTrue();
            }
            getImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0200", ORIENTATION, checkProps);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0300
         * @tc.name      : getImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0300', 0, async function (done) {
            function checkProps(result) {
                expect(result == "4608").assertTrue();
            }
            getImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0300", IMAGE_LENGTH, checkProps);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0400
         * @tc.name      : getImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0400', 0, async function (done) {
            function checkProps(result) {
                expect(result == "3456").assertTrue();
            }
            getImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0400", IMAGE_WIDTH, checkProps);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0500
         * @tc.name      : getImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0500', 0, async function (done) {
            function checkProps(result) {
                expect(result.search("38") != -1).assertTrue();
            }
            getImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0500", GPS_LATITUDE, checkProps);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0600
         * @tc.name      : getImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0600', 0, async function (done) {
            function checkProps(result) {
                expect(result.search("9") != -1).assertTrue();
            }
            getImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0600", GPS_LONGITUDE, checkProps);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0700
         * @tc.name      : getImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0700', 0, async function (done) {
            function checkProps(result) {
                expect(result == "N").assertTrue();
            }
            getImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0700", GPS_LATITUDE_REF, checkProps);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0800
         * @tc.name      : getImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0800', 0, async function (done) {
            function checkProps(result) {
                expect(result == "W").assertTrue();
            }
            getImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0800", GPS_LONGITUDE_REF, checkProps);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0900
         * @tc.name      : getImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0900', 0, async function (done) {
            function checkProps(result) {
                expect(result == "2022:06:02 15:51:35").assertTrue();
            }
            getImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_0900", DATE_TIME_ORIGINAL, checkProps);
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0100
        * @tc.name      : modifyImageProperty
        * @tc.desc      : 1.create imageSource
        *               : 2.modifyImageProperty
        * @tc.size      : MEDIUM
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0100', 0, async function (done) {
            let prop = { key: ORIENTATION, value: "4" };
            function checkProps(result) {
                expect(result == "Bottom-left").assertTrue();
            }
            modify(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0100", prop, checkProps);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0200
         * @tc.name      : modifyImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.modifyImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0200', 0, async function (done) {
            let prop = { key: BITS_PER_SAMPLE, value: "4, 4, 4" };
            function checkProps(result) {
                expect(result == "4, 4, 4").assertTrue();
            }
            modify(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0200", prop, checkProps);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0300
         * @tc.name      : modifyImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.modifyImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0300', 0, async function (done) {
            let prop = { key: GPS_LATITUDE, value: "114,57" };
            function checkProps(result) {
                expect(result.search("2") != -1).assertTrue();
            }
            modify(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0300", prop, checkProps);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0400
         * @tc.name      : modifyImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.modifyImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0400', 0, async function (done) {
            let prop = { key: GPS_LONGITUDE, value: "116,58" };
            function checkProps(result) {
                expect(result.search("2") != -1).assertTrue();
            }
            modify(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0400", prop, checkProps);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0500
         * @tc.name      : modifyImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.modifyImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0500', 0, async function (done) {
            let prop = { key: GPS_LATITUDE_REF, value: "N" };
            function checkProps(result) {
                expect(result == "N").assertTrue();
            }
            modify(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0500", prop, checkProps);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0600
         * @tc.name      : modifyImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.modifyImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0600', 0, async function (done) {
            let prop = { key: GPS_LONGITUDE_REF, value: "W" };
            function checkProps(result) {
                expect(result == "W").assertTrue();
            }
            modify(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0600", prop, checkProps);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0700
         * @tc.name      : modifyImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.modifyImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0700', 0, async function (done) {
            let prop = { key: IMAGE_WIDTH, value: "500" };
            function checkProps(result) {
                expect(result == "500").assertTrue();
            }
            modify(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0700", prop, checkProps);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0800
         * @tc.name      : modifyImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.modifyImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0800', 0, async function (done) {
            let prop = { key: IMAGE_LENGTH, value: "800" };
            function checkProps(result) {
                expect(result == "800").assertTrue();
            }
            modify(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_0800", prop, checkProps);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_ERR_0100
         * @tc.name      : modifyImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.modifyImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_ERR_0100', 0, async function (done) {
            await modifyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_ERR_0100", "null", "100");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_ERR_0200
         * @tc.name      : modifyImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.modifyImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_ERR_0200', 0, async function (done) {
            await modifyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_ERR_0200", " GPSLongitudeRef", "12345");
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_ERR_0300
        * @tc.name      : modifyImageProperty
        * @tc.desc      : 1.create imageSource
        *               : 2.modifyImageProperty
        * @tc.size      : MEDIUM
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_ERR_0300', 0, async function (done) {
            await modifyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_ERR_0300", "GPSLatitude", "{a:3}");
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_ERR_0400
        * @tc.name      : modifyImageProperty
        * @tc.desc      : 1.create imageSource
        *               : 2.modifyImageProperty
        * @tc.size      : MEDIUM
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_ERR_0400', 0, async function (done) {
            await modifyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_IMAGE_PROPERTY_ERR_0400", "1000", "ImageLength");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_ERR_0100
         * @tc.name      : getImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_ERR_0100', 0, async function (done) {
            getImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_ERR_0100", "aa");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_ERR_0200
         * @tc.name      : getImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_ERR_0200', 0, async function (done) {
            getImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_ERR_0200", "12");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_ERR_0300
         * @tc.name      : getImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_ERR_0300', 0, async function (done) {
            getImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_ERR_0300", "true");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_ERR_0400
         * @tc.name      : getImageProperty
         * @tc.desc      : 1.create imageSource
         *               : 2.getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_ERR_0400', 0, async function (done) {
            getImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_IMAGE_PROPERTY_ERR_0400", "abc,123");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_ERR_0100
         * @tc.name      : createImageSource fd<0
         * @tc.desc      : 1.get fd
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_ERR_0100', 0, async function (done) {
            createImageSourceErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_ERR_0100", -1);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_ERR_0200
         * @tc.name      : createImageSource -wrong uri
         * @tc.desc      : 1.get path
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_ERR_0200', 0, async function (done) {
            createImageSourceErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_ERR_0200", "file:///multimedia/test.jpg");
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_ERR_0300
         * @tc.name      : createImageSource -fd string
         * @tc.desc      : 1.get fd
         *                 2.createImageSource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_ERR_0300', 0, async function (done) {
            createImageSourceErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_CREATE_ERR_0300", "fd");
        })
    })
}