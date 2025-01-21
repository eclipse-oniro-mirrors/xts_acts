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
    AUDIO_TYPE,
    VIDEO_TYPE,
    FILE_TYPE,
    fetchOps,
    albumFetchOps,
} from "../../../../../../common";

export default function trashPromise(abilityContext) {
    describe("trashPromise", function () {
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
        afterAll(async function () {
            console.info("afterAll case");
        });

        const media = mediaLibrary.getMediaLibrary(abilityContext);
        async function setTrash(done, testNum, databasefFetchOps, ablumFetchOps, noAlbum = false) {
            try {
                // database info
                let databaseFetchFileResult = await media.getFileAssets(databasefFetchOps);
                let count = databaseFetchFileResult.getCount();
                console.info(`${testNum} count: ${count}`);

                //album info
                if (!noAlbum) {
                    var albumList = await media.getAlbums(ablumFetchOps);
                    var album = albumList[0];
                    var albumFetchFileResult = await album.getFileAssets();
                    var albumFilesCount = albumFetchFileResult.getCount();
                    expect(albumFilesCount).assertEqual(count);
                    albumFetchFileResult.close();
                }

                // file info
                let asset = await databaseFetchFileResult.getFirstObject();
                await asset.trash(true);
                let istrash = await asset.isTrash();
                console.info(`${testNum} istrash: ${istrash}`);
                expect(istrash).assertTrue();
                databaseFetchFileResult = await media.getFileAssets(databasefFetchOps);
                let databaseCount = databaseFetchFileResult.getCount();
                expect(databaseCount).assertEqual(count - 1);
                //album info
                if (!noAlbum) {
                    var albumList = await media.getAlbums(ablumFetchOps);
                    var album = albumList[0];
                    var albumFetchFileResult = await album.getFileAssets();
                    var albumFilesCount = albumFetchFileResult.getCount();
                    expect(databaseCount).assertEqual(count - 1);
                    albumFetchFileResult.close();
                }

                await asset.trash(false);
                databaseFetchFileResult.close();
                done();
            } catch (error) {
                console.info(`${testNum} error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        async function trashError(done, testNum, databasefFetchOps, value) {
            try {
                let databaseFetchFileResult = await media.getFileAssets(databasefFetchOps);
                try {
                    let asset = await databaseFetchFileResult.getFirstObject();
                    let count = databaseFetchFileResult.getCount();
                    try {
                        await asset.trash(value);
                        expect(false).assertTrue();
                        databaseFetchFileResult.close();
                        done();
                    } catch (error) {
                        console.info(`${testNum} error: ${error}`);
                        databaseFetchFileResult.close();
                        databaseFetchFileResult = await media.getFileAssets(databasefFetchOps);
                        let count2 = databaseFetchFileResult.getCount();
                        expect(count).assertEqual(count2);
                        databaseFetchFileResult.close();
                        done();
                    }
                } catch (error) {
                    console.info(`${testNum} error: ${error}`);
                    expect(false).assertTrue();
                    databaseFetchFileResult.close();
                    done();
                }                
            } catch (error) {
                console.info(`${testNum} error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        async function recovery(done, testNum, databasefFetchOps, ablumFetchOps, noAlbum) {
            try {
                let databaseFetchFileResult = await media.getFileAssets(databasefFetchOps);
                let count = databaseFetchFileResult.getCount();
                //album info
                if (!noAlbum) {
                    let albumList = await media.getAlbums(ablumFetchOps);
                    let album = albumList[0];
                    let albumFetchFileResult = await album.getFileAssets();
                    let albumFilesCount = albumFetchFileResult.getCount();
                    expect(albumFilesCount).assertEqual(count);
                    albumFetchFileResult.close();
                }

                let asset = await databaseFetchFileResult.getFirstObject();
                await asset.trash(true);
                databaseFetchFileResult = await media.getFileAssets(databasefFetchOps);
                let databaseCount = databaseFetchFileResult.getCount();
                expect(databaseCount).assertEqual(count - 1);

                await asset.trash(false);
                databaseFetchFileResult = await media.getFileAssets(databasefFetchOps);
                databaseCount = databaseFetchFileResult.getCount();
                expect(databaseCount).assertEqual(count);
                //album info
                if (!noAlbum) {
                    let albumList = await media.getAlbums(ablumFetchOps);
                    let album = albumList[0];
                    let albumFetchFileResult = await album.getFileAssets();
                    let albumFilesCount = albumFetchFileResult.getCount();
                    expect(albumFilesCount).assertEqual(count);
                    albumFetchFileResult.close();
                }

                databaseFetchFileResult.close();
                done();
            } catch (error) {
                console.info(`${testNum} error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        }
        /**
         * @tc.number	 : SUB_MEDIA_MEDIALIBRARY_TRASH_PROMISE_01_001
         * @tc.name 	 : trash
         * @tc.desc 	 : image asset Trash by true
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_TRASH_PROMISE_01_001", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_TRASH_PROMISE_01_001";
            let assetOps = fetchOps(testNum, "Camera/", IMAGE_TYPE);
            let albumOps = albumFetchOps(testNum, "Camera");
            let noAlbum = false;
            await setTrash(done, testNum, assetOps, albumOps, noAlbum);
        });

        /**
         * @tc.number	 : SUB_MEDIA_MEDIALIBRARY_TRASH_PROMISE_01_002
         * @tc.name 	 : trash
         * @tc.desc 	 : video asset Trash by true
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_TRASH_PROMISE_01_002", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_TRASH_PROMISE_01_002";
            let assetOps = fetchOps(testNum, "Videos/ScreenRecordings/", VIDEO_TYPE);
            let albumOps = albumFetchOps(testNum, "ScreenRecordings");
            let noAlbum = false;
            await setTrash(done, testNum, assetOps, albumOps, noAlbum);
        });

        /**
         * @tc.number	 : SUB_MEDIA_MEDIALIBRARY_TRASH_PROMISE_01_003
         * @tc.name 	 : trash
         * @tc.desc 	 : audio asset Trash by true
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_TRASH_PROMISE_01_003", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_TRASH_PROMISE_01_003";
            let assetOps = fetchOps(testNum, "Audios/trash/", AUDIO_TYPE);
            let albumOps = undefined;
            let noAlbum = true;
            await setTrash(done, testNum, assetOps, albumOps, noAlbum);
        });

        /**
         * @tc.number	 : SUB_MEDIA_MEDIALIBRARY_TRASH_PROMISE_01_004
         * @tc.name 	 : trash
         * @tc.desc 	 : file asset Trash by true
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_TRASH_PROMISE_01_004", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_TRASH_PROMISE_01_004";
            let assetOps = fetchOps(testNum, "Documents/trash/", FILE_TYPE);
            let albumOps = undefined;
            let noAlbum = true;
            await setTrash(done, testNum, assetOps, albumOps, noAlbum);
        });

        /**
         * @tc.number	 : SUB_MEDIA_MEDIALIBRARY_TRASH_ERROR_PROMISE_02_001
         * @tc.name 	 : trash
         * @tc.desc 	 : image asset Trash by 1
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_TRASH_ERROR_PROMISE_02_001", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_TRASH_ERROR_PROMISE_02_001";
            let assetOps = fetchOps(testNum, "Camera/", IMAGE_TYPE);
            let value = 1;
            await trashError(done, testNum, assetOps, value);
        });

        /**
         * @tc.number	 : SUB_MEDIA_MEDIALIBRARY_TRASH_ERROR_PROMISE_02_002
         * @tc.name 	 : trash
         * @tc.desc 	 : image asset Trash by 'abc'
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_TRASH_ERROR_PROMISE_02_002", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_TRASH_ERROR_PROMISE_02_002";
            let assetOps = fetchOps(testNum, "Camera/", IMAGE_TYPE);
            let value = "abc";
            await trashError(done, testNum, assetOps, value);
        });

        /**
         * @tc.number	 : SUB_MEDIA_MEDIALIBRARY_TRASH_ERROR_PROMISE_02_003
         * @tc.name 	 : trash
         * @tc.desc 	 : image asset Trash by {a:10}
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_TRASH_ERROR_PROMISE_02_003", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_TRASH_ERROR_PROMISE_02_003";
            let assetOps = fetchOps(testNum, "Camera/", IMAGE_TYPE);
            let value = { a: 10 };
            await trashError(done, testNum, assetOps, value);
        });

        /**
         * @tc.number	 : SUB_MEDIA_MEDIALIBRARY_TRASH_ERROR_PROMISE_02_004
         * @tc.name 	 : trash
         * @tc.desc 	 : image asset Trash by undefined
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_TRASH_ERROR_PROMISE_02_004", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_TRASH_ERROR_PROMISE_02_004";
            let assetOps = fetchOps(testNum, "Camera/", IMAGE_TYPE);
            let value = undefined;
            await trashError(done, testNum, assetOps, value);
        });

        /**
         * @tc.number	 : SUB_MEDIA_MEDIALIBRARY_TRASH_ERROR_PROMISE_02_005
         * @tc.name 	 : trash
         * @tc.desc 	 : image asset Trash by null
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_TRASH_ERROR_PROMISE_02_005", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_TRASH_ERROR_PROMISE_02_005";
            let assetOps = fetchOps(testNum, "Camera/", IMAGE_TYPE);
            let value = null;
            await trashError(done, testNum, assetOps, value);
        });

        /**
         * @tc.number : SUB_MEDIA_MEDIALIBRARY_TRASH_RECOVERY_PROMISE_03_001
         * @tc.name 	 : trash
         * @tc.desc 	 : image asset Trash by false
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_TRASH_RECOVERY_PROMISE_03_001", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_TRASH_RECOVERY_PROMISE_03_001";
            let assetOps = fetchOps(testNum, "Camera/", IMAGE_TYPE);
            let albumOps = albumFetchOps(testNum, "Camera");
            let noAlbum = false;
            await recovery(done, testNum, assetOps, albumOps, noAlbum);
        });

        /**
         * @tc.number : SUB_MEDIA_MEDIALIBRARY_TRASH_RECOVERY_PROMISE_03_002
         * @tc.name 	 : trash
         * @tc.desc 	 : video asset Trash by false
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_TRASH_RECOVERY_PROMISE_03_002", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_TRASH_RECOVERY_PROMISE_03_002";
            let assetOps = fetchOps(testNum, "Videos/ScreenRecordings/", VIDEO_TYPE);
            let albumOps = albumFetchOps(testNum, "ScreenRecordings");
            let noAlbum = false;
            await recovery(done, testNum, assetOps, albumOps, noAlbum);
        });

        /**
         * @tc.number : SUB_MEDIA_MEDIALIBRARY_TRASH_RECOVERY_PROMISE_03_003
         * @tc.name 	 : trash
         * @tc.desc 	 : audio asset Trash by false
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_TRASH_RECOVERY_PROMISE_03_003", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_TRASH_RECOVERY_PROMISE_03_003";
            let assetOps = fetchOps(testNum, "Audios/trash/", AUDIO_TYPE);
            let albumOps = undefined;
            let noAlbum = true;
            await recovery(done, testNum, assetOps, albumOps, noAlbum);
        });

        /**
         * @tc.number : SUB_MEDIA_MEDIALIBRARY_TRASH_RECOVERY_PROMISE_03_004
         * @tc.name 	 : trash
         * @tc.desc 	 : file asset Trash by false
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_TRASH_RECOVERY_PROMISE_03_004", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_TRASH_RECOVERY_PROMISE_03_004";
            let assetOps = fetchOps(testNum, "Documents/trash/", FILE_TYPE);
            let albumOps = undefined;
            let noAlbum = true;
            await recovery(done, testNum, assetOps, albumOps, noAlbum);
        });
    });
}
