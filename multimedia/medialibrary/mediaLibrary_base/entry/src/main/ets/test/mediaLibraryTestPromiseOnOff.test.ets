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

import {
    sleep,
    IMAGE_TYPE,
    VIDEO_TYPE,
    AUDIO_TYPE,
    FILE_TYPE,
    checkAssetsCount,
    fetchOps,
    albumFetchOps,
    checkAlbumsCount,
    FILEKEY,
    fileFetchOption,
} from "../../../../../../common";

export default function mediaLibraryTestPromiseOnOffTest(abilityContext) {
    describe("mediaLibraryTestPromiseOnOffTest", function () {
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

        const onTest = async (done, testNum, type, fetchOps) => {
            try {
                let count = 0;
                media.on(type, () => {
                    count++;
                });
                const fetchFileResult = await media.getFileAssets(fetchOps);
                let checkAssetCountPass = await checkAssetsCount(testNum, fetchFileResult, 1);
                expect(checkAssetCountPass).assertTrue();
                const asset = await fetchFileResult.getFirstObject();
                asset.title = testNum + asset.title;
                await asset.commitModify();
                await sleep(1000);
                expect(count).assertEqual(1);
                fetchFileResult.close();
                done();
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        };
        const offTest = async (done, testNum, type, fetchOps) => {
            try {
                let count = 0;
                media.on(type, () => {
                    console.info(`${testNum}:: on`);
                    count++;
                });
                const fetchFileResult = await media.getFileAssets(fetchOps);
                console.info(`${testNum}:: fetchFileResult :${fetchFileResult.getCount()}`);
                let checkAssetCountPass = await checkAssetsCount(testNum, fetchFileResult, 1);
                expect(checkAssetCountPass).assertTrue();
                const asset = await fetchFileResult.getFirstObject();
                asset.title = testNum + asset.title;
                media.off(type);
                await asset.commitModify();
                await sleep(1000);
                console.info(`${testNum}:: count :${count}`);
                expect(count).assertEqual(0);
                fetchFileResult.close();
                done();
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        };
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_PROMISE_ON_001
         * @tc.name      : ON
         * @tc.desc      : ON Image ASSET
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_PROMISE_ON_001", 0, async function (done) {
            let type = "imageChange";
            let testNum = "SUB_MEDIA_MEDIALIBRARY_PROMISE_ON_001";
            let currentFetchOps = fetchOps(testNum, "Pictures/On/", IMAGE_TYPE);
            await onTest(done, testNum, type, currentFetchOps);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_PROMISE_ON_002
         * @tc.name      : ON
         * @tc.desc      : ON Video ASSET
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_PROMISE_ON_002", 0, async function (done) {
            let type = "videoChange";
            let testNum = "SUB_MEDIA_MEDIALIBRARY_PROMISE_ON_002";
            let currentFetchOps = fetchOps(testNum, "Videos/On/", VIDEO_TYPE);
            await onTest(done, testNum, type, currentFetchOps);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_PROMISE_ON_003
         * @tc.name      : ON
         * @tc.desc      : ON Audio ASSET
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_PROMISE_ON_003", 0, async function (done) {
            let type = "audioChange";
            let testNum = "SUB_MEDIA_MEDIALIBRARY_PROMISE_ON_003";
            let currentFetchOps = fetchOps(testNum, "Audios/On/", AUDIO_TYPE);
            await onTest(done, testNum, type, currentFetchOps);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_PROMISE_ON_004
         * @tc.name      : ON
         * @tc.desc      : ON File ASSET
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_PROMISE_ON_004", 0, async function (done) {
            let type = "fileChange";
            let testNum = "SUB_MEDIA_MEDIALIBRARY_PROMISE_ON_004";
            let currentFetchOps = fetchOps(testNum, "Documents/On/", FILE_TYPE);
            await onTest(done, testNum, type, currentFetchOps);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_PROMISE_ON_005
         * @tc.name      : ON
         * @tc.desc      : ON ALBUM
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_PROMISE_ON_005", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_PROMISE_ON_005";
            try {
                let count = 0;
                media.on("albumChange", () => {
                    count++;
                });
                const selections = FILEKEY.ALBUM_NAME + '= ?';
                const currentFetchOp = fileFetchOption(testNum, selections, ['Screenshots']);
                const albumList = await media.getAlbums(currentFetchOp);
                console.info(`${testNum} albumList: ${albumList.length}`)
                const albumCountPass = await checkAlbumsCount(testNum, albumList, 1);
                expect(albumCountPass).assertTrue();
                const album = albumList[0];
                const oldName = album.albumName;
                console.info(`${testNum} oldName: ${oldName}`)
                album.albumName = testNum + album.albumName;
                await album.commitModify();
                await sleep(1000);
                album.albumName = oldName;
                await album.commitModify();
                expect(count).assertEqual(1);
                done();
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_PROMISE_ON_006
         * @tc.name      : ON
         * @tc.desc      : ON DEVICE ASSET
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_PROMISE_ON_006", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_PROMISE_ON_006";
            try {
                let count = 0;
                media.on("deviceChange", () => {
                    console.info("MediaLibraryTest : on 006 callback");
                    count++;
                });
                let currentFetchOps = fetchOps(testNum, "Documents/deviceOn/", FILE_TYPE);
                const fetchFileResult = await media.getFileAssets(currentFetchOps);
                const asset = await fetchFileResult.getFirstObject();
                asset.title = testNum + asset.title;
                await asset.commitModify();
                await sleep(1000);
                expect(count).assertEqual(0);
                fetchFileResult.close();
                done();
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                media.off("deviceChange");
                done();
            }
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_PROMISE_ON_007
         * @tc.name      : ON
         * @tc.desc      : ON REMOTE_FILE ASSET
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_PROMISE_ON_007", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_PROMISE_ON_007";
            try {
                let count = 0;
                media.on("remoteFileChange", () => {
                    console.info("MediaLibraryTest : on 007 callback");
                    count++;
                });

                let currentFetchOps = fetchOps(testNum, "Documents/remoteOn/", FILE_TYPE);
                const fetchFileResult = await media.getFileAssets(currentFetchOps);
                const asset = await fetchFileResult.getFirstObject();
                asset.title = testNum + asset.title;
                await asset.commitModify();
                await sleep(1000);
                expect(count == 0).assertTrue();
                fetchFileResult.close();
                done();
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                media.off("remoteFileChange");
                done();
            }
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_PROMISE_OFF_001
         * @tc.name      : off
         * @tc.desc      : off Image ASSET
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_PROMISE_OFF_001", 0, async function (done) {
            let type = "imageChange";
            let testNum = "SUB_MEDIA_MEDIALIBRARY_PROMISE_OFF_001";
            let currentFetchOps = fetchOps(testNum, "Pictures/Off/", IMAGE_TYPE);
            await offTest(done, testNum, type, currentFetchOps);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_PROMISE_OFF_002
         * @tc.name      : off
         * @tc.desc      : off video ASSET
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_PROMISE_OFF_002", 0, async function (done) {
            let type = "videoChange";
            let testNum = "SUB_MEDIA_MEDIALIBRARY_PROMISE_OFF_002";
            let currentFetchOps = fetchOps(testNum, "Videos/Off/", VIDEO_TYPE);
            await offTest(done, testNum, type, currentFetchOps);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_PROMISE_OFF_003
         * @tc.name      : off
         * @tc.desc      : off audio ASSET
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_PROMISE_OFF_003", 0, async function (done) {
            let type = "audioChange";
            let testNum = "SUB_MEDIA_MEDIALIBRARY_PROMISE_OFF_003";
            let currentFetchOps = fetchOps(testNum, "Audios/Off/", AUDIO_TYPE);
            await offTest(done, testNum, type, currentFetchOps);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_PROMISE_OFF_004
         * @tc.name      : off
         * @tc.desc      : off file ASSET
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_PROMISE_OFF_004", 0, async function (done) {
            let type = "fileChange";
            let testNum = "SUB_MEDIA_MEDIALIBRARY_PROMISE_OFF_004";
            let currentFetchOps = fetchOps(testNum, "Documents/Off/", FILE_TYPE);
            await offTest(done, testNum, type, currentFetchOps);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_PROMISE_OFF_005
         * @tc.name      : off
         * @tc.desc      : off album
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_PROMISE_OFF_005", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_PROMISE_OFF_005";
            try {
                let count = 0;
                media.on("albumChange", () => {
                    count++;
                });
                await sleep(300);
                media.off("albumChange");
                let currentFetchOps = albumFetchOps(testNum, "Screenshots");
                const albumList = await media.getAlbums(currentFetchOps);
                const albumCountPass = await checkAlbumsCount(testNum, albumList, 1);
                expect(albumCountPass).assertTrue();
                const album = albumList[0];
                const oldName = album.albumName;
                album.albumName = album.albumName + testNum;
                await sleep(1000);
                await album.commitModify();
                await sleep(300);
                album.albumName = oldName;
                await album.commitModify();
                expect(count).assertEqual(0);
                done();
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_PROMISE_OFF_006
         * @tc.name      : off
         * @tc.desc      : off device ASSET
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_PROMISE_OFF_006", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_PROMISE_OFF_006";
            try {
                media.on("deviceChange", () => {
                    console.info(`${testNum}:: failed`);
                    expect(false).assertTrue();
                    media.off("deviceChange");
                    done();
                });
                await sleep(1000);
                let currentFetchOps = fetchOps(testNum, "Documents/On/", FILE_TYPE);
                const fetchFileResult = await media.getFileAssets(currentFetchOps);
                const asset = await fetchFileResult.getFirstObject();
                asset.title = testNum + asset.title;
                media.off("deviceChange");
                await sleep(1000);
                await asset.commitModify();
                await sleep(1000);
                fetchFileResult.close();
                done();
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                media.off("fileChange");
                done();
            }
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_PROMISE_OFF_007
         * @tc.name      : off
         * @tc.desc      : off remoteFile ASSET
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_PROMISE_OFF_007", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_PROMISE_OFF_007";
            try {
                media.on("remoteFileChange", () => {
                    console.info(`${testNum} failed`);
                    expect(false).assertTrue();
                    media.off("remoteFileChange");
                    done();
                });
                await sleep(1000);

                media.off("remoteFileChange");
                let currentFetchOps = fetchOps(testNum, "Documents/On/", FILE_TYPE);
                const fetchFileResult = await media.getFileAssets(currentFetchOps);
                const asset = await fetchFileResult.getFirstObject();
                asset.title = testNum + asset.title;
                await sleep(1000);
                await asset.commitModify();
                await sleep(1000);
                fetchFileResult.close();
                done();
            } catch (error) {
                console.info(`MediaLibraryTest : off 007 failed, error: ${error}`);
                expect(false).assertTrue();
                media.off("fileChange");
                done();
            }
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_PROMISE_RELEASE_001
         * @tc.name      : release
         * @tc.desc      : Release MediaLibrary instance
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_PROMISE_RELEASE_001", 0, async function (done) {
            try {
                await media.release();
                console.info("MediaLibraryTest : release 001 passed");
                expect(true).assertTrue();
                done();
            } catch (error) {
                console.info(`MediaLibraryTest : release 001 failed, error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        });
    });
}
