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
    VIDEO_TYPE,
    FILEKEY,
    idFetchOps,
    fileFetchOption,
    checkAlbumsCount,
    getPermission,
} from "../../../../../../common";

export default function albumTestCallbackTest(abilityContext) {
    describe("albumTestCallbackTest", function () {
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

        function printAlbumMessage(testNum, album) {
            console.info(`${testNum} album.albumId: ${album.albumId}
                album.albumName: ${album.albumName}
                album.albumUri: ${album.albumUri}
                album.dateModified: ${album.dateModified}
                album.count: ${album.count}
                album.relativePath: ${album.relativePath}
                album.coverUri: ${album.coverUri}`);
        }

        const checkProps = async function (done, testNum, album, relativePath, prop) {
            printAlbumMessage(testNum, album);
            if (album.albumId == undefined || album.coverUri == undefined) {
                console.info(`${testNum}, album.albumId or album.coverUri is undefined`);
                expect(false).assertTrue();
                done();
                return;
            }
            expect(album.albumName).assertEqual(prop.albumName);
            expect(album.albumUri).assertEqual(prop.albumUri + album.albumId);
            expect(album.count).assertEqual(prop.count);
            expect(album.relativePath).assertEqual(relativePath);
        };

        const checkAlbumInfo = async function (done, testNum, fetchOp, relativePaths, props, expectAlbumCount) {
            try {
                media.getAlbums(fetchOp, async (err, albumList) => {
                    try {
                        if (err) {
                            console.info(`${testNum}, err: ${err}`);
                            expect(false).assertTrue();
                            done();
                            return;
                        }
                        const albumCountPass = await checkAlbumsCount(testNum, albumList, expectAlbumCount);
                        expect(albumCountPass).assertTrue();
                        if (expectAlbumCount == 1) {
                            const album = albumList[0];
                            checkProps(done, testNum, album, relativePaths[0], props[0]);
                            done();
                        } else {
                            let count = 0;
                            for (let i = 0; i < expectAlbumCount; i++) {
                                checkProps(done, testNum, albumList[i], relativePaths[i], props[i]);
                                count++;
                            }
                            console.info(`${testNum}, count: ${count}, relativePaths: ${relativePaths.length}`);
                            expect(count).assertEqual(expectAlbumCount);
                            expect(relativePaths.length).assertEqual(expectAlbumCount);
                        }
                    } catch (err) {
                        console.info(`${testNum}, failed: ${err}`);
                    }
                    done();
                });
            } catch (error) {
                console.info(`${testNum}, failed: ${error}`);
                expect(false).assertTrue();
                done();
            }
        };

        const abnormalAlbumCount = async function (done, testNum, fetchOp) {
            try {
                media.getAlbums(fetchOp, async (err, albumList) => {
                    if (err) {
                        expect(true).assertTrue();
                        done();
                        return;
                    }
                    console.info(`${testNum}, albumList.length: ${albumList.length}`);
                    expect(albumList.length).assertEqual(0);
                    done();
                });
            } catch (error) {
                console.info(`${testNum} error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        };

        const abnormalAlbumCommitModify = async function (done, testNum, fetchOp, newName, expectAlbumCount) {
            try {
                const albumList = await media.getAlbums(fetchOp);
                const albumCountPass = await checkAlbumsCount(testNum, albumList, expectAlbumCount);
                expect(albumCountPass).assertTrue();
                const album = albumList[0];
                album.albumName = newName;
                album.commitModify(async (error) => {
                    if (error) {
                        console.info(`${testNum}, error.message: ${error.message}  error.code: ${error.code}`);
                        expect(error.code != undefined).assertTrue();
                        done();
                        return;
                    }
                    console.info(`${testNum}, commitModify error`);
                    expect(false).assertTrue();
                    done();
                });
            } catch (error) {
                console.info(`${testNum}, error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        };

        const albumCommitModify = async function (done, testNum, fetchOp, newName, expectAlbumCount) {
            try {
                const albumList = await media.getAlbums(fetchOp);
                const albumCountPass = await checkAlbumsCount(testNum, albumList, expectAlbumCount);
                expect(albumCountPass).assertTrue();
                const album = albumList[0];
                const albumId = album.albumId;
                console.info(`${testNum}, album.albumName(old): ${album.albumName}`);
                const oldAlbumName = album.albumName;
                album.albumName = newName;
                album.commitModify(async (err) => {
                    try {
                        if (err) {
                            console.info(`${testNum}, commitModify failed: ${err}`);
                            expect(false).assertTrue();
                            done();
                            return;
                        }
                        let currentfetchOp = idFetchOps(testNum, albumId);
                        const newAlbumList = await media.getAlbums(currentfetchOp);
                        console.info(`${testNum}, album.albumName(new): ${newAlbumList[0].albumName}`);
                        expect(newAlbumList[0].albumName).assertEqual(oldAlbumName);
                        done();
                    } catch (err) {
                        console.info(`${testNum}, error: ${err}`);
                    }
                    done();
                });
            } catch (error) {
                console.info(`${testNum}, error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        };

        // ------------------------------ 001 test start -------------------------
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_CALLBACK_001_01
         * @tc.name      : getAlbums
         * @tc.desc      : get Camera album,check album info
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETALBUM_CALLBACK_001_01", 0, async function (done) {
            const testNum = "SUB_MEDIA_MEDIALIBRARY_GETALBUM_CALLBACK_001_01";
            const selections = FILEKEY.ALBUM_NAME + '= ?';
            const currentFetchOp = fileFetchOption(testNum, selections, ['Camera']);
            const relativePaths = [''];
            const expectAlbumCount = 1;
            const props = [
                {
                    albumName: "Camera",
                    albumUri: "file://media/album/",
                    count: 1,
                }
            ];
            await checkAlbumInfo(done, testNum, currentFetchOp, relativePaths, props, expectAlbumCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_CALLBACK_001_03
         * @tc.name      : getAlbums
         * @tc.desc      : get Screenshots album,check album info
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETALBUM_CALLBACK_001_03", 0, async function (done) {
            const testNum = "SUB_MEDIA_MEDIALIBRARY_GETALBUM_CALLBACK_001_03";
            const selections = FILEKEY.ALBUM_NAME + '= ?';
            const currentFetchOp = fileFetchOption(testNum, selections, ['Screenshots']);
            const relativePaths = [''];
            const expectAlbumCount = 1;
            const props = [
                {
                    albumName: "Screenshots",
                    albumUri: "file://media/album/",
                    count: 2,
                }
            ];
            await checkAlbumInfo(done, testNum, currentFetchOp, relativePaths, props, expectAlbumCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_CALLBACK_001_04
         * @tc.name      : getAlbums
         * @tc.desc      : get ScreenRecordings album,check album info
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETALBUM_CALLBACK_001_04", 0, async function (done) {
            const testNum = "SUB_MEDIA_MEDIALIBRARY_GETALBUM_CALLBACK_001_04";
            const selections = FILEKEY.ALBUM_NAME + '= ?';
            const currentFetchOp = fileFetchOption(testNum, selections, ['ScreenRecordings']);
            const relativePaths = [''];
            const expectAlbumCount = 1;
            const props = [
                {
                    albumName: "Screenshots",
                    albumUri: "file://media/album/",
                    count: 2,
                }
            ];
            await checkAlbumInfo(done, testNum, currentFetchOp, relativePaths, props, expectAlbumCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_CALLBACK_001_05
         * @tc.name      : getAlbums
         * @tc.desc      : get Camera and Screenshots album,check album info
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETALBUM_CALLBACK_001_05", 0, async function (done) {
            const testNum = "SUB_MEDIA_MEDIALIBRARY_GETALBUM_CALLBACK_001_05";
            const selections = FILEKEY.ALBUM_NAME + '= ? or ' + FILEKEY.ALBUM_NAME + '= ?';
            const currentFetchOp = fileFetchOption(testNum, selections, ['Camera', 'Screenshots']);
            const relativePaths = ['', ''];
            const expectAlbumCount = 2;
            const props = [
                {
                    albumName: "Screenshots",
                    albumUri: "file://media/album/",
                    count: 2,
                },
                {
                    albumName: "Camera",
                    albumUri: "file://media/album/",
                    count: 1,
                },
            ];
            await checkAlbumInfo(done, testNum, currentFetchOp, relativePaths, props, expectAlbumCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_CALLBACK_001_06
         * @tc.name      : getAlbums
         * @tc.desc      : get Camera and ScreenRecordings and Screenshots album,check album info
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETALBUM_CALLBACK_001_06", 0, async function (done) {
            const testNum = "SUB_MEDIA_MEDIALIBRARY_GETALBUM_CALLBACK_001_06";
            const selections = FILEKEY.ALBUM_NAME + '= ? or ' + FILEKEY.ALBUM_NAME + '= ? or ' + FILEKEY.ALBUM_NAME + '= ?';
            const currentFetchOp = fileFetchOption(testNum, selections, ['Camera', 'ScreenRecordings', 'Screenshots']);
            const relativePaths = ['', ''];
            const expectAlbumCount = 2;
            const props = [
                {
                    albumName: "Screenshots",
                    albumUri: "file://media/album/",
                    count: 2,
                },
                {
                    albumName: "Camera",
                    albumUri: "file://media/album/",
                    count: 1,
                },
            ];
            await checkAlbumInfo(done, testNum, currentFetchOp, relativePaths, props, expectAlbumCount);
        });
        // ------------------------------ 001 test end -------------------------

        // ------------------------------ 002 test start -------------------------
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_CALLBACK_002_06
         * @tc.name      : album.getFileAssets
         * @tc.desc      : Get Album Assets by fileHasArgsfetchOp3
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_CALLBACK_002_06", 2, async function (done) {
            const testNum = "SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_CALLBACK_002_06";
            const selections = FILEKEY.ALBUM_NAME + '= ?';
            const currentFetchOp = fileFetchOption(testNum, selections, ['666']);
            await abnormalAlbumCount(done, testNum, currentFetchOp);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_CALLBACK_002_07
         * @tc.name      : album.getFileAssets
         * @tc.desc      : Get Album Assets by fileHasArgsfetchOp4
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_CALLBACK_002_07", 2, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_CALLBACK_002_07";
            const selections = "666" + "= ?";
            const currentFetchOp = fileFetchOption(testNum, selections, [VIDEO_TYPE.toString()]);
            await abnormalAlbumCount(done, testNum, currentFetchOp);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_CALLBACK_002_08
         * @tc.name      : album.getFileAssets
         * @tc.desc      : Get Album Assets by fileHasArgsfetchOp5
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_CALLBACK_002_08", 2, async function (done) {
            const testNum = "SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_CALLBACK_002_08";
            const selections = "666" + "= ?";
            const currentFetchOp = fileFetchOption(testNum, selections, ['666']);
            await abnormalAlbumCount(done, testNum, currentFetchOp);
        });
        // ------------------------------ 002 test end -------------------------

        // ------------------------------ 003 test start -------------------------
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_CALLBACK_003_01
         * @tc.name      : commitModify
         * @tc.desc      : Modify Camera name  ''
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_CALLBACK_003_01", 2, async function (done) {
            const testNum = "SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_CALLBACK_003_01";
            const selections = FILEKEY.ALBUM_NAME + '= ?';
            const currentFetchOp = fileFetchOption(testNum, selections, ['Camera']);
            const newName = "";
            const expectAlbumCount = 1;
            await abnormalAlbumCommitModify(done, testNum, currentFetchOp, newName, expectAlbumCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_CALLBACK_003_04
         * @tc.name      : commitModify
         * @tc.desc      : Modify Album name  'aaaaa....' (256)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_CALLBACK_003_04", 2, async function (done) {
            const testNum = "SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_CALLBACK_003_04";
            const selections = FILEKEY.ALBUM_NAME + '= ?';
            const currentFetchOp = fileFetchOption(testNum, selections, ['Screenshots']);
            let newName = "";
            for (var i = 0; i < 256; i++) {
                newName += "a";
            }
            const expectAlbumCount = 1;
            await abnormalAlbumCommitModify(done, testNum, currentFetchOp, newName, expectAlbumCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_CALLBACK_003_05
         * @tc.name      : commitModify
         * @tc.desc      : Modify Album name  '中中中中中....' (86 *3)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_CALLBACK_003_05", 2, async function (done) {
            const testNum = "SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_CALLBACK_003_05";
            const selections = FILEKEY.ALBUM_NAME + '= ?';
            const currentFetchOp = fileFetchOption(testNum, selections, ['Screenshots']);
            let newName = "";
            for (var i = 0; i < 86; i++) {
                newName += "中";
            }
            const expectAlbumCount = 1;
            await abnormalAlbumCommitModify(done, testNum, currentFetchOp, newName, expectAlbumCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_CALLBACK_003_06
         * @tc.name      : commitModify
         * @tc.desc      : Modify Album name  'aaaaaaa....' (255)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_CALLBACK_003_06", 2, async function (done) {
            const testNum = "SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_CALLBACK_003_06";
            const selections = FILEKEY.ALBUM_NAME + '= ?';
            const currentFetchOp = fileFetchOption(testNum, selections, ['Screenshots']);
            let newName = "";
            for (var i = 0; i < 255; i++) {
                newName += "a";
            }
            const expectAlbumCount = 1;
            await albumCommitModify(done, testNum, currentFetchOp, newName, expectAlbumCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_CALLBACK_003_07
         * @tc.name      : commitModify
         * @tc.desc      : Modify Album name  '中中中中中中中....' (85*3)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_CALLBACK_003_07", 0, async function (done) {
            const testNum = "SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_CALLBACK_003_07";
            const selections = FILEKEY.ALBUM_NAME + '= ?';
            const currentFetchOp = fileFetchOption(testNum, selections, ['Screenshots']);
            let newName = "";
            for (var i = 0; i < 85; i++) {
                newName += "中";
            }
            const expectAlbumCount = 1;
            await albumCommitModify(done, testNum, currentFetchOp, newName, expectAlbumCount);
        });
        // ------------------------------ 003 test end -------------------------
    });
}
