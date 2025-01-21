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

import mediaLibrary from "@ohos.multimedia.mediaLibrary";
import fileio from "@ohos.fileio";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "deccjsunit/index";
import {
    sleep,
    IMAGE_TYPE,
    VIDEO_TYPE,
    AUDIO_TYPE,
    FILE_TYPE,
    checkAssetsCount,
    fetchOps,
    isNum,
    fileIdFetchOps,
} from "../../../../../../common";
export default function fileAssetTestPromiseTest(abilityContext) {
    describe("fileAssetTestPromiseTest", function () {
        const media = mediaLibrary.getMediaLibrary(abilityContext);
        beforeAll(async function () {
            console.info("beforeAll case");
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

        const rwOpenTest = async function (done, testNum, fetchOp, assetProps, expectCount) {
            let asset, asset1;
            let fd, fd1;
            try {
                let fetchFileResult = await media.getFileAssets(fetchOp);
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, expectCount);
                if (!checkAssetCountPass) return;
                const dataList = await fetchFileResult.getAllObject();
                asset = dataList[0];
                fd = await asset.open("rw");
                expect(isNum(fd)).assertTrue();
                let buf = new ArrayBuffer(4096);
                let res = await fileio.read(fd, buf);
                expect(res.bytesRead).assertEqual(assetProps.bytesRead);
                asset1 = dataList[1];
                fd1 = await asset1.open("r");
                expect(isNum(fd1)).assertTrue();
                let buf1 = new ArrayBuffer(4096);
                await fileio.read(fd1, buf1);
                let write = await fileio.write(fd, buf1);
                expect(write).assertEqual(assetProps.write);
                console.info(`res.bytesRead:${res.bytesRead},write:${write}`);
                console.info(`fd1:${fd1},fd:${fd}`);
                await asset.close(fd);
                await asset1.close(fd1);
                await sleep(50);
                let newFetchFileResult = await media.getFileAssets(fileIdFetchOps(testNum, asset.id));
                checkAssetCountPass = await checkAssetsCount(done, testNum, newFetchFileResult, 1);
                if (!checkAssetCountPass) return;
                let newAsset = await newFetchFileResult.getFirstObject();
                expect(newAsset.dateModified != asset.dateModified).assertTrue();
                done();
            } catch (error) {
                console.info(`${testNum} :: error: ${error}`);
                await asset.close(fd);
                await asset1.close(fd1);
                expect().assertFail();
                done();
            }
        };
        const rOpenTest = async function (done, testNum, fetchOp, assetProps, expectCount) {
            let asset;
            let fd;
            try {
                let fetchFileResult = await media.getFileAssets(fetchOp);
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, expectCount);
                if (!checkAssetCountPass) return;
                const dataList = await fetchFileResult.getAllObject();
                asset = dataList[0];
                fd = await asset.open("r");
                expect(isNum(fd)).assertTrue();
                let buf = new ArrayBuffer(4096);
                let res = await fileio.read(fd, buf);
                console.log(" bytesRead: " + res.bytesRead);
                expect(res.bytesRead).assertEqual(assetProps.bytesRead);
                try {
                    await fileio.write(fd, buf);
                    expect().assertFail();
                } catch (error) {
                    expect(true).assertTrue();
                    await asset.close(fd);
                    done();
                }
            } catch (error) {
                console.info(`${testNum} :: error: ${error}`);
                expect().assertFail();
                await asset.close(fd);
                done();
            }
        };

        const wOpenTest = async function (done, testNum, fetchOp, assetProps, expectCount) {
            let asset, asset1;
            let fd, fd1;
            try {
                let fetchFileResult = await media.getFileAssets(fetchOp);
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, expectCount);
                if (!checkAssetCountPass) return;
                const dataList = await fetchFileResult.getAllObject();
                asset = dataList[0];
                asset1 = dataList[1];

                fd = await asset.open("w");
                expect(isNum(fd)).assertTrue();
                fd1 = await asset1.open("r");
                let buf = new ArrayBuffer(4096);
                await fileio.read(fd1, buf);
                let write = await fileio.write(fd, buf);
                console.info(`${testNum} :: write: ${write}`);
                expect(write).assertEqual(assetProps.write);
                fetchFileResult.close();
                done();
            } catch (error) {
                console.info(`${testNum} :: error: ${error}`);
                expect(false).assertTrue();
                await asset.close(fd);
                await asset1.close(fd1);
                done();
            }
        };

        const closeTest = async function (done, testNum, fetchOp) {
            let asset;
            let fd;
            try {
                let fetchFileResult = await media.getFileAssets(fetchOp);
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, 2);
                if (!checkAssetCountPass) return;
                const asset = await fetchFileResult.getFirstObject();
                fd = await asset.open("r");
                expect(isNum(fd)).assertTrue();
                await asset.close(fd);
                let count = 0;
                let buf = new ArrayBuffer(4096);
                try {
                    await fileio.read(fd, buf);
                } catch (error) {
                    count++;
                }
                try {
                    await fileio.write(fd, buf);
                } catch (error) {
                    count++;
                }
                await sleep(1000);
                expect(count).assertEqual(2);
                done();
            } catch (error) {
                console.info(`${testNum} error:${error}`);
                await asset.close(fd);
                expect(false).assertTrue();
                done();
            }
        };

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_01
         * @tc.name      : open('rw')
         * @tc.desc      : open -rw the type of FILE
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_01", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_01";
            let assetProps = {
                bytesRead: 10,
                write: 4096,
            };
            let fetchOp = fetchOps(testNum, "Documents/RW/", FILE_TYPE);
            let expectCount = 2;
            await rwOpenTest(done, testNum, fetchOp, assetProps, expectCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_02
         * @tc.name      : open('r')
         * @tc.desc      : open -r the type of FILE
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_02", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_02";
            let assetProps = {
                bytesRead: 10,
                write: 4096,
            };
            let fetchOp = fetchOps(testNum, "Documents/R/", FILE_TYPE);
            let expectCount = 2;
            await rOpenTest(done, testNum, fetchOp, assetProps, expectCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_03
         * @tc.name      : open('w')
         * @tc.desc      : open -w the type of FILE
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_03", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_03";
            let assetProps = {
                write: 4096,
            };
            let fetchOp = fetchOps(testNum, "Documents/W/", FILE_TYPE);
            let expectCount = 2;
            await wOpenTest(done, testNum, fetchOp, assetProps, expectCount);
        });

        // //======================== FILE END ==================================

        //======================== IMAGE BEGIN ==================================
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_07
         * @tc.name      : open('rw')
         * @tc.desc      : open -rw the type of IMAGE
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_07", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_07";
            let assetProps = {
                bytesRead: 4096,
                write: 4096,
            };
            let fetchOp = fetchOps(testNum, "Pictures/RW/", IMAGE_TYPE);
            let expectCount = 2;
            await rwOpenTest(done, testNum, fetchOp, assetProps, expectCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_08
         * @tc.name      : open('r')
         * @tc.desc      : open -r the type of IMAGE
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_08", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_08";
            let assetProps = {
                bytesRead: 4096,
            };
            let fetchOp = fetchOps(testNum, "Pictures/R/", IMAGE_TYPE);
            let expectCount = 2;
            await rOpenTest(done, testNum, fetchOp, assetProps, expectCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_09
         * @tc.name      : open('w')
         * @tc.desc      : open -w the type of IMAGE
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_09", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_09";
            let assetProps = {
                write: 4096,
            };
            let fetchOp = fetchOps(testNum, "Pictures/W/", IMAGE_TYPE);
            let expectCount = 2;
            await wOpenTest(done, testNum, fetchOp, assetProps, expectCount);
        });

        //======================== IMAGE END ==================================

        //======================== AUDIO BEGIN ==================================
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_10
         * @tc.name      : open('rw')
         * @tc.desc      : open -rw the type of AUDIO
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_10", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_10";
            let assetProps = {
                bytesRead: 4096,
                write: 4096,
            };
            let fetchOp = fetchOps(testNum, "Audios/RW/", AUDIO_TYPE);
            let expectCount = 2;
            await rwOpenTest(done, testNum, fetchOp, assetProps, expectCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_11
         * @tc.name      : open('r')
         * @tc.desc      : open -r the type of AUDIO
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_11", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_11";
            let assetProps = {
                bytesRead: 4096,
            };
            let fetchOp = fetchOps(testNum, "Audios/R/", AUDIO_TYPE);
            let expectCount = 2;
            await rOpenTest(done, testNum, fetchOp, assetProps, expectCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_12
         * @tc.name      : open('w')
         * @tc.desc      : open -w the type of AUDIO
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_12", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_12";
            let assetProps = {
                write: 4096,
            };
            let fetchOp = fetchOps(testNum, "Audios/W/", AUDIO_TYPE);
            let expectCount = 2;
            await wOpenTest(done, testNum, fetchOp, assetProps, expectCount);
        });

        //======================== AUDIO END ==================================

        //======================== VIDEO BEGIN ==================================
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_13
         * @tc.name      : open('rw')
         * @tc.desc      : open -rw the type of VIDEO
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_13", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_13";
            let assetProps = {
                bytesRead: 4096,
                write: 4096,
            };
            let fetchOp = fetchOps(testNum, "Videos/RW/", VIDEO_TYPE);
            let expectCount = 2;
            await rwOpenTest(done, testNum, fetchOp, assetProps, expectCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_14
         * @tc.name      : open('r')
         * @tc.desc      : open -r the type of VIDEO
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_14", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_14";
            let assetProps = {
                bytesRead: 4096,
            };
            let fetchOp = fetchOps(testNum, "Videos/R/", VIDEO_TYPE);
            let expectCount = 2;
            await rOpenTest(done, testNum, fetchOp, assetProps, expectCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_15
         * @tc.name      : open('w')
         * @tc.desc      : open -w the type of VIDEO
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_15", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_15";
            let assetProps = {
                write: 4096,
            };
            let fetchOp = fetchOps(testNum, "Videos/W/", VIDEO_TYPE);
            let expectCount = 2;
            await wOpenTest(done, testNum, fetchOp, assetProps, expectCount);
        });

        //======================== VIDEO END ==================================

        //======================== CLOSE BEGIN ================================

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_31
         * @tc.name      : close
         * @tc.desc      : asset close the type of file
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_31", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_31";
            let fetchOp = fetchOps(testNum, "Documents/openClose/", FILE_TYPE);
            await closeTest(done, testNum, fetchOp);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_33
         * @tc.name      : close
         * @tc.desc      : asset close the type of image
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_33", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_33";
            let fetchOp = fetchOps(testNum, "Pictures/openClose/", IMAGE_TYPE);
            await closeTest(done, testNum, fetchOp);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_34
         * @tc.name      : close
         * @tc.desc      : asset close the type of audio
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_34", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_34";
            let fetchOp = fetchOps(testNum, "Audios/openClose/", AUDIO_TYPE);
            await closeTest(done, testNum, fetchOp);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_35
         * @tc.name      : close
         * @tc.desc      : asset close the type of video
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_35", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_35";
            let fetchOp = fetchOps(testNum, "Videos/openClose/", VIDEO_TYPE);
            await closeTest(done, testNum, fetchOp);
        });

        //======================== CLOSE BEGIN ================================
    });
}
