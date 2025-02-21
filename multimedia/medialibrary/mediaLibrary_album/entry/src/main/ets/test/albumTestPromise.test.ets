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
    FILEKEY,
    idFetchOps,
    checkAlbumsCount,
    fileFetchOption,
} from "../../../../../../common";

export default function albumTestPromiseTest(abilityContext) {
    describe("albumTestPromiseTest", function () {
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

        const checkAlbumInfo = async function (done, testNum, fetchOp, relativePaths, props, expectAlbumCount = 1) {
            try {
                const albumList = await media.getAlbums(fetchOp);
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
                    expect(count).assertEqual(expectAlbumCount);
                    expect(relativePaths.length).assertEqual(expectAlbumCount);
                    done();
                }
            } catch (error) {
                console.info(`${testNum}, failed: ${error}`);
                expect(false).assertTrue();
                done();
            }
        };

        const abnormalAlbumCount = async function (done, testNum, fetchOp) {
            try {
                const albumList = await media.getAlbums(fetchOp);
                console.info(`${testNum}, albumList.length: ${albumList.length}`);
                expect(albumList.length).assertEqual(0);
                done();
            } catch (error) {
                console.info(`${testNum} error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        };

        const queryConditionAbnormal = async function (done, testNum, fetchOp) {
            try {
                console.info(`${testNum}, fetchOp: ${JSON.stringify(fetchOp)}`);
                await media.getAlbums(fetchOp);
                expect(false).assertTrue();
                done();
            } catch (error) {
                console.info(`${testNum},query condition abnormal error: ${error}`);
                expect(true).assertTrue();
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
                await album.commitModify();
                console.info(`${testNum}, failed`);
                expect(false).assertTrue();
                done();
            } catch (error) {
                console.info(`${testNum}, error.message: ${error.message} error.code: ${error.code}`);
                expect(error.code != undefined).assertTrue();
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
                await album.commitModify();
                let currentfetchOp = idFetchOps(testNum, albumId);
                const newAlbumList = await media.getAlbums(currentfetchOp);
                console.info(`${testNum}, album.albumName(new): ${newAlbumList[0].albumName}`);
                expect(newAlbumList[0].albumName).assertEqual(oldAlbumName);
                done();
            } catch (error) {
                console.info(`${testNum}, error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        };
        // ------------------------------ 001 test start -------------------------
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_01
         * @tc.name      : getAlbums
         * @tc.desc      : get Camera album,check album info
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_01", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_01";
            const selections = FILEKEY.ALBUM_NAME + '= ?';
            const currentFetchOp = fileFetchOption(testNum, selections, ['Camera']);
            let relativePaths = [""];
            const props = [
                {
                    albumName: "Camera",
                    albumUri: "file://media/album/",
                    count: 1,
                }
            ];
            await checkAlbumInfo(done, testNum, currentFetchOp, relativePaths, props);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_03
         * @tc.name      : getAlbums
         * @tc.desc      : get Screenshots album,check album info
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_03", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_03";
            const selections = FILEKEY.ALBUM_NAME + '= ?';
            const currentFetchOp = fileFetchOption(testNum, selections, ['Screenshots']);
            let relativePaths = [''];
            const props = [
                {
                    albumName: "Screenshots",
                    albumUri: "file://media/album/",
                    count: 2,
                }
            ];
            await checkAlbumInfo(done, testNum, currentFetchOp, relativePaths, props);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_04
         * @tc.name      : getAlbums
         * @tc.desc      : get ScreenRecordings album,check album info
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_04", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_04";
            const selections = FILEKEY.ALBUM_NAME + '= ?';
            const currentFetchOp = fileFetchOption(testNum, selections, ['ScreenRecordings']);
            let relativePaths = [''];
            let albumCount = 1;
            const props = [
                {
                    albumName: "Screenshots",
                    albumUri: "file://media/album/",
                    count: 2,
                }
            ];
            await checkAlbumInfo(done, testNum, currentFetchOp, relativePaths, props, albumCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_05
         * @tc.name      : getAlbums
         * @tc.desc      : get Camera and Screenshots album,check album info
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_05", 2, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_05";
            const selections = FILEKEY.ALBUM_NAME + '= ? or ' + FILEKEY.ALBUM_NAME + '= ?';
            const currentFetchOp = fileFetchOption(testNum, selections, ['Camera', 'Screenshots']);
            let relativePaths = ['', ''];
            let albumCount = 2;
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
            await checkAlbumInfo(done, testNum, currentFetchOp, relativePaths, props, albumCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_06
         * @tc.name      : getAlbums
         * @tc.desc      : get Camera and ScreenRecordings and Screenshots album,check album info
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_06", 2, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_06";
            const selections = FILEKEY.ALBUM_NAME + '= ? or ' + FILEKEY.ALBUM_NAME + '= ? or ' + FILEKEY.ALBUM_NAME + '= ?';
            const currentFetchOp = fileFetchOption(testNum, selections, ['Camera', 'ScreenRecordings', 'Screenshots']);
            let relativePaths = ['', ''];
            let albumCount = 2;
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
            await checkAlbumInfo(done, testNum, currentFetchOp, relativePaths, props, albumCount);
        });
        // ------------------------------ 001 test end -------------------------

        // ------------------------------ 002 test start -------------------------
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_002_06
         * @tc.name      : album.getFileAssets
         * @tc.desc      : Get Album Assets by abnormal option
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_002_06", 2, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_002_06";
            const selections = FILEKEY.ALBUM_NAME + '= ?';
            const currentFetchOp = fileFetchOption(testNum, selections, ['666']);
            await abnormalAlbumCount(done, testNum, currentFetchOp);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_002_07
         * @tc.name      : album.getFileAssets
         * @tc.desc      : Get Album Assets by abnormal option
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_002_07", 2, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_002_07";
            const selections = '666' + '= ?';
            const currentFetchOp = fileFetchOption(testNum, selections, ['Camera']);
            await queryConditionAbnormal(done, testNum, currentFetchOp);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_002_08
         * @tc.name      : album.getFileAssets
         * @tc.desc      : Get Album Assets by abnormal option
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_002_08", 2, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_002_08";
            const selections = '666' + '= ?';
            const currentFetchOp = fileFetchOption(testNum, selections, ['666']);
            await queryConditionAbnormal(done, testNum, currentFetchOp);
        });
        // ------------------------------ 002 test end -------------------------

        // ------------------------------ 003 test start -------------------------
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_01
         * @tc.name      : commitModify
         * @tc.desc      : Modify Camera name  ''
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_01", 2, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_01";
            const selections = FILEKEY.ALBUM_NAME + '= ?';
            const currentFetchOp = fileFetchOption(testNum, selections, ['Camera']);
            let newName = "";
            let expectAlbumCount = 1;
            await abnormalAlbumCommitModify(done, testNum, currentFetchOp, newName, expectAlbumCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_04
         * @tc.name      : commitModify
         * @tc.desc      : Modify Screenshots name 'aaaaa....' (256)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_04", 2, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_04";
            const selections = FILEKEY.ALBUM_NAME + '= ?';
            const currentFetchOp = fileFetchOption(testNum, selections, ['Screenshots']);
            let newName = "";
            for (var i = 0; i < 256; i++) {
                newName += "a";
            }
            let expectAlbumCount = 1;
            await abnormalAlbumCommitModify(done, testNum, currentFetchOp, newName, expectAlbumCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_05
         * @tc.name      : commitModify
         * @tc.desc      : Modify Screenshots name  '中中中中中....' (86 *3)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_05", 2, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_05";
            const selections = FILEKEY.ALBUM_NAME + '= ?';
            const currentFetchOp = fileFetchOption(testNum, selections, ['Screenshots']);
            let newName = "";
            for (var i = 0; i < 86; i++) {
                newName += "中";
            }
            let expectAlbumCount = 1;
            await abnormalAlbumCommitModify(done, testNum, currentFetchOp, newName, expectAlbumCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_06
         * @tc.name      : commitModify
         * @tc.desc      : Modify Screenshots name  'aaaaaaa....' (255)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_06", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_06";
            const selections = FILEKEY.ALBUM_NAME + '= ?';
            const currentFetchOp = fileFetchOption(testNum, selections, ['Screenshots']);
            let newName = "";
            for (var i = 0; i < 255; i++) {
                newName += "a";
            }
            let expectAlbumCount = 1;
            await albumCommitModify(done, testNum, currentFetchOp, newName, expectAlbumCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_07
         * @tc.name      : commitModify
         * @tc.desc      : Modify Screenshots name  '中中中中中中中....' (85*3)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_07", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_07";
            const selections = FILEKEY.ALBUM_NAME + '= ?';
            const currentFetchOp = fileFetchOption(testNum, selections, ['Screenshots']);
            let newName = "";
            for (var i = 0; i < 85; i++) {
                newName += "中";
            }
            let expectAlbumCount = 1;
            await albumCommitModify(done, testNum, currentFetchOp, newName, expectAlbumCount);
        });
        // ------------------------------ 003 test end -------------------------

        // ------------------------------ 004 test start -------------------------
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_004_01
         * @tc.name      : album.coverUri
         * @tc.desc      : check album.coverUri
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_004_01", 2, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_004_01";
            try {
                let coverUrifetchOp = {
                    selections: "",
                    selectionArgs: [],
                    order: "date_added DESC LIMIT 0,1",
                };
                let expectAlbumCount = 1;
                const selections = FILEKEY.ALBUM_NAME + '= ?';
                const currentFetchOp = fileFetchOption(testNum, selections, ['Camera']);
                const albumList = await media.getAlbums(currentFetchOp);
                for (const album of albumList) {
                    console.info(`URI: ${album.coverUri} + ${album.albumUri}`);
                }
                const albumCountPass = await checkAlbumsCount(testNum, albumList, expectAlbumCount);
                expect(albumCountPass).assertTrue();
                const album = albumList[0];
                const fetchFileResult = await album.getFileAssets(coverUrifetchOp);
                const asset = await fetchFileResult.getFirstObject();
                if (asset == undefined) {
                    console.info(`${testNum} failed asset undefined`);
                    fetchFileResult.close();
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info(`Fetch URI: ${asset.uri}`);
                expect(asset.uri).assertEqual(album.coverUri);
                fetchFileResult.close();
                done();
            } catch (error) {
                console.info(`${testNum} failed error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        });
        // ------------------------------ 004 test end -------------------------
    });
}
