/*
 * Copyright (C) 2022-2024 Huawei Device Co., Ltd.
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
    checkPresetsAssets,
} from "../../../../../../common";

export default function trashCallback(abilityContext) {
    describe("trashCallback", function () {
        beforeAll(async function () {
            console.info("beforeAll case");
            await checkPresetsAssets(media, "ActsMediaLibraryTrashJsTest");
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

        async function setTrash(done, testNum, assetOps, albumOps, noAlbum) {
            try {
                // database info
                let databaseFetchFileResult = await media.getFileAssets(assetOps);
                let count = databaseFetchFileResult.getCount();
                console.info(`${testNum} count: ${count}`);
                //album info
                if (!noAlbum) {
                    let albumList = await media.getAlbums(albumOps);
                    let album = albumList[0];
                    let albumFetchFileResult = await album.getFileAssets();
                    let albumFilesCount = albumFetchFileResult.getCount();
                    expect(albumFilesCount).assertEqual(count);
                    albumFetchFileResult.close();
                }
                // file info
                let asset = await databaseFetchFileResult.getFirstObject();
                databaseFetchFileResult.close();
                let istrash = await asset.isTrash();
                expect(istrash).assertFalse();
                // trash operation
                asset.trash(true, async (err) => {
                    try {
                        if (err) {
                            console.info(`${testNum} err: ${err}`);
                            expect(false).assertTrue();
                        } else {
                            const trashState = await asset.isTrash();
                            expect(trashState).assertTrue();
                            // after trash database info
                            databaseFetchFileResult = await media.getFileAssets(assetOps);
                            let databaseCount = databaseFetchFileResult.getCount();
                            expect(databaseCount).assertEqual(count - 1);
                            //album info
                            if (!noAlbum) {
                                let albumList = await media.getAlbums(albumOps);
                                let album = albumList[0];
                                let albumFetchFileResult = await album.getFileAssets();
                                let albumFilesCount = albumFetchFileResult.getCount();
                                albumFetchFileResult.close();
                                expect(albumFilesCount).assertEqual(count - 1);
                            }
                            await asset.trash(false);
                            databaseFetchFileResult.close();
                        }
                    } catch (error) {
                        console.info(`${testNum} failed, error: ${error}`);
                        expect(false).assertTrue();
                    }
                    done();
                });
            } catch (error) {
                console.info(`${testNum} error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        async function recovery(done, testNum, assetOps, albumOps, noAlbum) {
            try {
                let databaseFetchFileResult = await media.getFileAssets(assetOps);
                let count = databaseFetchFileResult.getCount();
                let asset = await databaseFetchFileResult.getFirstObject();
                await asset.trash(true);
                let istrash = await asset.isTrash();
                expect(istrash).assertTrue();
                asset.trash(false, async (err) => {
                    try {
                        if (err) {
                            console.info(`${testNum} err: ${err}`);
                            expect(false).assertTrue();
                        } else {
                            let trashState = await asset.isTrash();
                            expect(!trashState).assertTrue();

                            databaseFetchFileResult = await media.getFileAssets(assetOps);
                            let databaseCount = databaseFetchFileResult.getCount();
                            expect(databaseCount).assertEqual(count);
                            if (!noAlbum) {
                                let albumList = await media.getAlbums(albumOps);
                                let album = albumList[0];
                                let albumFetchFileResult = await album.getFileAssets();
                                let albumFilesCount = albumFetchFileResult.getCount();
                                expect(albumFilesCount).assertEqual(count);
                                albumFetchFileResult.close();
                            }
                        }
                    } catch (error) {
                        console.info(`${testNum} error: ${error}`);
                    }
                    databaseFetchFileResult.close();
                    done();
                });
            } catch (error) {
                console.info(`${testNum} failed, error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        }
        async function trashError(done, testNum, assetOps, value) {
            try {
                let databaseFetchFileResult = await media.getFileAssets(assetOps);
                try {
                    let asset = await databaseFetchFileResult.getFirstObject();
                    let count = databaseFetchFileResult.getCount();
                    console.info(`${testNum}count:${count}`);
                    try {
                        asset.trash(value, async (err) => {
                            if (err) {
                                console.info(`${testNum} err: ${err}`);
                                expect(false).assertTrue();
                                databaseFetchFileResult.close();
                                done();
                                return;
                            }
                            expect(false).assertTrue();
                            databaseFetchFileResult.close();
                            done();
                        });
                    } catch (error) {
                        console.info(`${testNum} error: ${error}`);
                        databaseFetchFileResult.close();
                        databaseFetchFileResult = await media.getFileAssets(assetOps);
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

        /**
         * @tc.number	 : SUB_MEDIA_MEDIALIBRARY_TRASH_CALLBACK_01_001
         * @tc.name 	 : trash
         * @tc.desc 	 : image asset Trash by true
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_TRASH_CALLBACK_01_001", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_TRASH_CALLBACK_01_001";
            let assetOps = fetchOps(testNum, "Camera/", IMAGE_TYPE);
            let albumOps = albumFetchOps(testNum, "Camera");
            let noAlbum = false;
            await setTrash(done, testNum, assetOps, albumOps, noAlbum);
        });

        /**
         * @tc.number	 : SUB_MEDIA_MEDIALIBRARY_TRASH_CALLBACK_01_002
         * @tc.name 	 : trash
         * @tc.desc 	 : video asset Trash by true
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_TRASH_CALLBACK_01_002", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_TRASH_CALLBACK_01_002";
            let assetOps = fetchOps(testNum, "Videos/ScreenRecordings/", VIDEO_TYPE);
            let albumOps = albumFetchOps(testNum, "ScreenRecordings");
            let noAlbum = false;
            await setTrash(done, testNum, assetOps, albumOps, noAlbum);
        });

        /**
         * @tc.number	 : SUB_MEDIA_MEDIALIBRARY_TRASH_CALLBACK_01_003
         * @tc.name 	 : trash
         * @tc.desc 	 : audio asset Trash by true
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_TRASH_CALLBACK_01_003", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_TRASH_CALLBACK_01_003";
            let assetOps = fetchOps(testNum, "Audios/trashCb/", AUDIO_TYPE);
            let albumOps = undefined;
            let noAlbum = true;
            await setTrash(done, testNum, assetOps, albumOps, noAlbum);
        });

        /**
         * @tc.number	 : SUB_MEDIA_MEDIALIBRARY_TRASH_CALLBACK_01_004
         * @tc.name 	 : trash
         * @tc.desc 	 : file asset Trash by true
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_TRASH_CALLBACK_01_004", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_TRASH_CALLBACK_01_004";
            let assetOps = fetchOps(testNum, "Documents/trashCb/", FILE_TYPE);
            let albumOps = undefined;
            let noAlbum = true;
            await setTrash(done, testNum, assetOps, albumOps, noAlbum);
        });

        /**
         * @tc.number	 : SUB_MEDIA_MEDIALIBRARY_TRASH_ERROR_CALLBACK_02_001
         * @tc.name 	 : trash
         * @tc.desc 	 : image asset Trash by 1
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_TRASH_ERROR_CALLBACK_02_001", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_TRASH_ERROR_CALLBACK_02_001";
            let rOps = fetchOps(testNum, "Camera/", IMAGE_TYPE);
            let value = 1;
            await trashError(done, testNum, rOps, value);
        });

        /**
         * @tc.number	 : SUB_MEDIA_MEDIALIBRARY_TRASH_ERROR_CALLBACK_02_002
         * @tc.name 	 : trash
         * @tc.desc 	 : image asset Trash by 'abc'
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_TRASH_ERROR_CALLBACK_02_002", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_TRASH_ERROR_CALLBACK_02_002";
            let rOps = fetchOps(testNum, "Camera/", IMAGE_TYPE);
            let value = "abc";
            await trashError(done, testNum, rOps, value);
        });

        /**
         * @tc.number	 : SUB_MEDIA_MEDIALIBRARY_TRASH_ERROR_CALLBACK_02_003
         * @tc.name 	 : trash
         * @tc.desc 	 : image asset Trash by {a:10}
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_TRASH_ERROR_CALLBACK_02_003", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_TRASH_ERROR_CALLBACK_02_003";
            let rOps = fetchOps(testNum, "Camera/", IMAGE_TYPE);
            let value = { a: 10 };
            await trashError(done, testNum, rOps, value);
        });

        /**
         * @tc.number	 : SUB_MEDIA_MEDIALIBRARY_TRASH_ERROR_CALLBACK_02_004
         * @tc.name 	 : trash
         * @tc.desc 	 : image asset Trash by undefined
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_TRASH_ERROR_CALLBACK_02_004", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_TRASH_ERROR_CALLBACK_02_004";
            let rOps = fetchOps(testNum, "Camera/", IMAGE_TYPE);
            let value = undefined;
            await trashError(done, testNum, rOps, value);
        });

        /**
         * @tc.number	 : SUB_MEDIA_MEDIALIBRARY_TRASH_ERROR_CALLBACK_02_005
         * @tc.name 	 : trash
         * @tc.desc 	 : image asset Trash by null
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 3
         */
        it("SUB_MEDIA_MEDIALIBRARY_TRASH_ERROR_CALLBACK_02_005", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_TRASH_ERROR_CALLBACK_02_005";
            let rOps = fetchOps(testNum, "Camera/", IMAGE_TYPE);
            let value = null;
            await trashError(done, testNum, rOps, value);
        });

        /**
         * @tc.number : SUB_MEDIA_MEDIALIBRARY_TRASH_RECOVERY_CALLBACK_03_001
         * @tc.name 	 : trash
         * @tc.desc 	 : image asset Trash by false
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_TRASH_RECOVERY_CALLBACK_03_001", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_TRASH_RECOVERY_CALLBACK_03_001";
            let assetOps = fetchOps(testNum, "Camera/", IMAGE_TYPE);
            let albumOps = albumFetchOps(testNum, "Camera");
            let noAlbum = false;
            await recovery(done, testNum, assetOps, albumOps, noAlbum);
        });

        /**
         * @tc.number : SUB_MEDIA_MEDIALIBRARY_TRASH_RECOVERY_CALLBACK_03_002
         * @tc.name 	 : trash
         * @tc.desc 	 : video asset Trash by false
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_TRASH_RECOVERY_CALLBACK_03_002", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_TRASH_RECOVERY_CALLBACK_03_002";
            let assetOps = fetchOps(testNum, "Videos/ScreenRecordings/", VIDEO_TYPE);
            let albumOps = albumFetchOps(testNum, "ScreenRecordings");
            let noAlbum = false;
            await recovery(done, testNum, assetOps, albumOps, noAlbum);
        });

        /**
         * @tc.number : SUB_MEDIA_MEDIALIBRARY_TRASH_RECOVERY_CALLBACK_03_003
         * @tc.name 	 : trash
         * @tc.desc 	 : audio asset Trash by false
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_TRASH_RECOVERY_CALLBACK_03_003", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_TRASH_RECOVERY_CALLBACK_03_003";
            let assetOps = fetchOps(testNum, "Audios/trash/", AUDIO_TYPE);
            let albumOps = undefined;
            let noAlbum = false;
            await recovery(done, testNum, assetOps, albumOps, noAlbum);
        });

        /**
         * @tc.number : SUB_MEDIA_MEDIALIBRARY_TRASH_RECOVERY_CALLBACK_03_004
         * @tc.name 	 : trash
         * @tc.desc 	 : file asset Trash by false
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_TRASH_RECOVERY_CALLBACK_03_004", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_TRASH_RECOVERY_CALLBACK_03_004";
            let assetOps = fetchOps(testNum, "Documents/trash/", FILE_TYPE);
            let albumOps = undefined;
            let noAlbum = true;
            await recovery(done, testNum, assetOps, albumOps, noAlbum);
        });
    });
}
