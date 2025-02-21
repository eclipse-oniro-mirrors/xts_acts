/*
 * Copyright (C) 2022-2023 Huawei Device Co., Ltd.
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

import mediaLibrary from "@ohos.multimedia.mediaLibrary";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "deccjsunit/index";
import fileio from "@ohos.fileio";
import image from "@ohos.multimedia.image";

import {
    sleep,
    IMAGE_TYPE,
    VIDEO_TYPE,
    AUDIO_TYPE,
    checkPresetsAssets,
    checkAssetsCount,
    fetchOps,
    getPermission,
} from "../../../../../../common";
export default function getThumbnailCallback(abilityContext) {
    describe("getThumbnailCallback", function () {
        console.info('MediaLibraryTest:getMediaLibrary IN');
        image.createPixelMap(new ArrayBuffer(4096), { size: { height: 1, width: 2 } }).then((pixelmap) => {});
        const media = mediaLibrary.getMediaLibrary(abilityContext);
        console.info('MediaLibraryTest:getMediaLibrary OUT');
        let fileKeyObj = mediaLibrary.FileKey;

        beforeAll(async function () {
            console.info("beforeAll case");
            await getPermission(null, abilityContext);
            await checkPresetsAssets(media, "ActsMediaLibraryGetThumbnailTest");
        });
        beforeEach(function () {
            console.info("beforeEach case");
        });
        afterEach(async function () {
            console.info("afterEach case");
            await sleep();
        });
        afterAll(function () {
            console.info("afterAll case");
        });

        function fetchThumbnailOps(id){
            return{
                selections:fileKeyObj.ID + '= ? AND '+'lcd is not null'+' AND '+'thumbnail is not null',
                selectionArgs:[id+''],
            };
        }

        function fetchOpsNew(path,type){
            return{
                selections:fileKeyObj.RELATIVE_PATH + '= ? AND '+fileKeyObj.MEDIA_TYPE + '=?',
                selectionArgs:[path,type.toString()],
                order:fileKeyObj.DATE_ADDED,
            };
        }

        function checkCount(done,testNum,count){
            console.info('${testNum}::count:${count}');
            if(count <= 0){
                console.info('${testNum}::resources is empty');
                expect(false).assertTrue();
                done();
                return false;
            }
            return true;
        }

        async function testGetThumbnail(done, testNum, dOp, size) {
            try {
                let fetchFileResult = await media.getFileAssets(dOp);
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, 1);
                if (!checkAssetCountPass) return;
                let asset = await fetchFileResult.getFirstObject();
                if (size == "default") {
                    size = { width: 256, height: 256 };
                    asset.getThumbnail(async (err, pixelmap) => {
                        await pixelmap.getImageInfo((err, info) => {
                            expect(info.size.width).assertEqual(size.width);
                            expect(info.size.height).assertEqual(size.height);
                            done();
                        });
                    });
                } else {
                    asset.getThumbnail(size, async (err, pixelmap) => {
                        await pixelmap.getImageInfo((err, info) => {
                            expect(info.size.width).assertEqual(size.width);
                            expect(info.size.height).assertEqual(size.height);
                            done();
                        });
                    });
                }
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        async function testGetThumbnailError(done, testNum, dOp, size) {
            try {
                let fetchFileResult = await media.getFileAssets(dOp);
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, 1);
                if (!checkAssetCountPass) return;
                let asset = await fetchFileResult.getFirstObject();
                asset.getThumbnail(size, async (err, pixelmap) => {
                    if (err) {
                        console.info(`${testNum}:: err :${err}`);
                        expect(true).assertTrue();
                        done();
                        return;
                    }
                    if (pixelmap == undefined) {
                        expect(true).assertTrue();
                        done();
                    } else {
                        const info = await pixelmap.getImageInfo();
                        console.info(`${testNum} pixel width: ${info.size.width}`);
                        console.info(`${testNum} pixel height: ${info.size.height}`);
                        expect(info.size.width == size.width || info.size.height == size.height).assertFalse();
                        done();
                    }
                });
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        async function testGetThumbnailTypeError(done, testNum, dOp, size) {
            try {
                let fetchFileResult = await media.getFileAssets(dOp);
                let count = fetchFileResult.getCount();
                if (!checkCount(done,testNum,count)) return;
                let asset = await fetchFileResult.getFirstObject();
                asset.getThumbnail(size, async (err, pixelmap) => {
                    expect(false).assertTrue();
                    done();
                });
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(true).assertTrue();
                done();
            }
        }

        async function copyFile(fd1, fd2){
            let stat = await fileio.fstat(fd1);
            let buf = new ArrayBuffer(stat.size);
            await fileio.read(fd1,buf);
            await fileio.write(fd2,buf);
        }
        
        // ------------------------------ image type start -----------------------
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_001_01
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(image) by { width: 128, height: 128 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_001_01", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_001_01";
            let dOp = fetchOps(testNum, "Pictures/Thumbnail/", IMAGE_TYPE);
            let size = { width: 128, height: 128 };
            await testGetThumbnail(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_001_02
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(image) by { width: 128, height: 256 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_001_02", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_001_02";
            let dOp = fetchOps(testNum, "Pictures/Thumbnail/", IMAGE_TYPE);
            let size = { width: 128, height: 256 };
            await testGetThumbnail(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_001_03
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(image) by no arg
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_001_03", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_001_03";
            let dOp = fetchOps(testNum, "Pictures/Thumbnail/", IMAGE_TYPE);
            let size = "default";
            await testGetThumbnail(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_001_04
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(image) by { width: 1, height: 1 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_001_04", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_001_04";
            let dOp = fetchOps(testNum, "Pictures/Thumbnail/", IMAGE_TYPE);
            let size = { width: 1, height: 1 };
            await testGetThumbnail(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_001_05
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(image) by { width: 0, height: 0 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_001_05", 3, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_001_05";
            let dOp = fetchOps(testNum, "Pictures/Thumbnail/", IMAGE_TYPE);
            let size = { width: 0, height: 0 };
            await testGetThumbnailError(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_001_06
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(image) by { width: -128, height: -128 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_001_06", 3, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_001_06";
            let dOp = fetchOps(testNum, "Pictures/Thumbnail/", IMAGE_TYPE);
            let size = { width: -128, height: -128 };
            await testGetThumbnailError(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_001_07
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(image) by { width: 1024, height: 1024 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_001_07", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_001_07";
            let dOp = fetchOps(testNum, "Pictures/Thumbnail/", IMAGE_TYPE);
            let size = { width: 1024, height: 1024 };
            await testGetThumbnail(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_001_03
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(image) by 1
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_001_03", 3, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_001_03";
            let dOp = fetchOpsNew('Pictures/Thumbnail/', IMAGE_TYPE);
            let size = 1;
            await testGetThumbnailTypeError(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_001_04
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(image) by 'str'
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_001_04", 3, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_001_04";
            let dOp = fetchOpsNew('Pictures/Thumbnail/', IMAGE_TYPE);
            let size = "str";
            await testGetThumbnailTypeError(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_001_05
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(image) by true
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_001_05", 3, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_001_05";
            let dOp = fetchOpsNew('Pictures/Thumbnail/', IMAGE_TYPE);
            let size = true;
            await testGetThumbnailTypeError(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_001_06
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(image) by false
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_001_06", 3, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_001_06";
            let dOp = fetchOpsNew('Pictures/Thumbnail/', IMAGE_TYPE);
            let size = false;
            await testGetThumbnailTypeError(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_001_07
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(image) by null
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_001_07", 3, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_001_07";
            let dOp = fetchOpsNew('Pictures/Thumbnail/', IMAGE_TYPE);
            let size = null;
            await testGetThumbnailTypeError(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_001_08
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(image) by {width: 99999, height: 99999}
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_001_08", 3, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_001_08";
            let dOp = fetchOpsNew('Pictures/Thumbnail/', IMAGE_TYPE);
            let size = { width: 99999, height: 99999 };
            await testGetThumbnailError(done, testNum, dOp, size);
        });
        // ------------------------------image type end--------------------------

        // ------------------------------video type start -----------------------
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_002_01
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(video) by { width: 128, height: 128 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_002_01", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_002_01";
            let dOp = fetchOps(testNum, "Videos/Thumbnail/", VIDEO_TYPE);
            let size = { width: 128, height: 128 };
            await testGetThumbnail(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_002_02
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(video) by { width: 128, height: 256 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_002_02", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_002_02";
            let dOp = fetchOps(testNum, "Videos/Thumbnail/", VIDEO_TYPE);
            let size = { width: 128, height: 256 };
            await testGetThumbnail(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_002_03
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(video) by no arg
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_002_03", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_002_03";
            let dOp = fetchOps(testNum, "Videos/Thumbnail/", VIDEO_TYPE);
            let size = "default";
            await testGetThumbnail(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_002_04
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(video) by { width: 1, height: 1 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_002_04", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_002_04";
            let dOp = fetchOps(testNum, "Videos/Thumbnail/", VIDEO_TYPE);
            let size = { width: 1, height: 1 };
            await testGetThumbnail(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_002_05
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(video) by { width: 0, height: 0 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_002_05", 3, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_002_05";
            let dOp = fetchOps(testNum, "Videos/Thumbnail/", VIDEO_TYPE);
            let size = { width: 0, height: 0 };
            await testGetThumbnailError(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_002_06
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(video) by { width: -128, height: -128 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_002_06", 3, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_002_06";
            let dOp = fetchOps(testNum, "Videos/Thumbnail/", VIDEO_TYPE);
            let size = { width: -128, height: -128 };
            await testGetThumbnailError(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_002_07
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(video) by { width: 1024, height: 1024 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_002_07", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_002_07";
            let dOp = fetchOps(testNum, "Videos/Thumbnail/", VIDEO_TYPE);
            let size = { width: 1024, height: 1024 };
            await testGetThumbnail(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_002_03
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(video) by 1
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_002_03", 3, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_002_03";
            let dOp = fetchOpsNew('Videos/Thumbnail/', VIDEO_TYPE);
            let size = 1;
            await testGetThumbnailTypeError(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_002_04
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(video) by 'str'
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_002_04", 3, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_002_04";
            let dOp = fetchOpsNew('Videos/Thumbnail/', VIDEO_TYPE);
            let size = 'str';
            await testGetThumbnailTypeError(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_002_05
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(video) by true
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_002_05", 3, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_002_05";
            let dOp = fetchOpsNew('Videos/Thumbnail/', VIDEO_TYPE);
            let size = true;
            await testGetThumbnailTypeError(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_002_06
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(video) by false
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_002_06", 3, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_002_06";
            let dOp = fetchOpsNew('Videos/Thumbnail/', VIDEO_TYPE);
            let size = false;
            await testGetThumbnailTypeError(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_002_07
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(video) by null
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_002_07", 3, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_002_07";
            let dOp = fetchOpsNew('Videos/Thumbnail/', VIDEO_TYPE);
            let size = null;
            await testGetThumbnailTypeError(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_002_08
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(video) by {width: 99999, height: 99999}
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_002_08", 3, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_002_08";
            let dOp = fetchOpsNew('Videos/Thumbnail/', VIDEO_TYPE);
            let size = { width: 99999, height: 99999 };
            await testGetThumbnailError(done, testNum, dOp, size);
        });
        // ------------------------------video type end--------------------------

        // ------------------------------audio type start -----------------------
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_003_01
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by { width: 128, height: 128 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_003_01", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_003_01";
            let dOp = fetchOps(testNum, "Audios/Thumbnail/", AUDIO_TYPE);
            let size = { width: 128, height: 128 };
            await testGetThumbnail(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_003_02
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by { width: 128, height: 256 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_003_02", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_003_02";
            let dOp = fetchOps(testNum, "Audios/Thumbnail/", AUDIO_TYPE);
            let size = { width: 128, height: 256 };
            await testGetThumbnail(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_003_03
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by no arg
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_003_03", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_003_03";
            let dOp = fetchOps(testNum, "Audios/Thumbnail/", AUDIO_TYPE);
            let size = "default";
            await testGetThumbnail(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_003_04
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by { width: 1, height: 1 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_003_04", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_003_04";
            let dOp = fetchOps(testNum, "Audios/Thumbnail/", AUDIO_TYPE);
            let size = { width: 1, height: 1 };
            await testGetThumbnail(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_003_05
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by { width: 0, height: 0 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_003_05", 3, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_003_05";
            let dOp = fetchOps(testNum, "Audios/Thumbnail/", AUDIO_TYPE);
            let size = { width: 0, height: 0 };
            await testGetThumbnailError(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_003_06
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by { width: -128, height: -128 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_003_06", 3, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_003_06";
            let dOp = fetchOps(testNum, "Audios/Thumbnail/", AUDIO_TYPE);
            let size = { width: -128, height: -128 };
            await testGetThumbnailError(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_003_07
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by { width: 1024, height: 1024 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_003_07", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_CALLBACK_003_07";
            let dOp = fetchOps(testNum, "Audios/Thumbnail/", AUDIO_TYPE);
            let size = { width: 1024, height: 1024 };
            await testGetThumbnail(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_003_03
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by 1
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_003_03", 3, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_003_03";
            let dOp = fetchOpsNew('Audios/Thumbnail/', AUDIO_TYPE);
            let size = 1;
            await testGetThumbnailTypeError(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_003_04
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by 'str'
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_003_04", 3, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_003_04";
            let dOp = fetchOpsNew('Audios/Thumbnail/', AUDIO_TYPE);
            let size = 'str';
            await testGetThumbnailTypeError(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_003_05
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by true
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_003_05", 3, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_003_05";
            let dOp = fetchOpsNew('Audios/Thumbnail/', AUDIO_TYPE);
            let size = true;
            await testGetThumbnailTypeError(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_003_06
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by false
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_003_06", 3, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_003_06";
            let dOp = fetchOpsNew('Audios/Thumbnail/', AUDIO_TYPE);
            let size = false;
            await testGetThumbnailTypeError(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_003_07
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by null
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_003_07", 3, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_003_07";
            let dOp = fetchOpsNew('Audios/Thumbnail/', AUDIO_TYPE);
            let size = null;
            await testGetThumbnailTypeError(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_003_08
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by {width: 99999, height: 99999}
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_003_08", 3, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_ERROR_CALLBACK_003_08";
            let dOp = fetchOpsNew('Audios/Thumbnail/', AUDIO_TYPE);
            let size = { width: 99999, height: 99999 };
            await testGetThumbnailError(done, testNum, dOp, size);
        });
        // ------------------------------audio type end--------------------------
    });
}