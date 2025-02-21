/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
    FILEKEY,
    idFetchOps,
    albumFetchOps,
    albumTwoTypesFetchOps,
    albumThreeTypesFetchOps,
    checkAlbumsCount,
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

        const props = {
            albumName: "Static",
            albumUri: "datashare:///media/album/",
            count: 5,
        };
        const checkProps = async function (done, testNum, album, relativePaths) {
            printAlbumMessage(testNum, album);
            if (album.albumId == undefined || album.coverUri == undefined) {
                console.info(`${testNum}, album.albumId or album.coverUri is undefined`);
                expect(false).assertTrue();
                done();
                return;
            }
            expect(album.albumName).assertEqual(props.albumName);
            expect(album.albumUri).assertEqual(props.albumUri + album.albumId);
            expect(album.count).assertEqual(props.count);
            if (Array.isArray(relativePaths)) {
                let i = relativePaths.indexOf(album.relativePath);
                if (i > -1) {
                    relativePaths.splice(i, 1);
                } else {
                    expect(false).assertTrue();
                    done();
                }
            } else {
                expect(album.relativePath).assertEqual(relativePaths);
            }
        };
        const checkAlbumInfo = async function (done, testNum, fetchOp, relativePaths, expectAlbumCount = 1) {
            try {
                const albumList = await media.getAlbums(fetchOp);
                const albumCountPass = await checkAlbumsCount(done, testNum, albumList, expectAlbumCount);
                if (!albumCountPass) return;
                if (expectAlbumCount == 1) {
                    const album = albumList[0];
                    checkProps(done, testNum, album, relativePaths);
                    done();
                } else {
                    let count = 0;
                    for (const album of albumList) {
                        checkProps(done, testNum, album, relativePaths);
                        count++;
                    }
                    expect(count).assertEqual(expectAlbumCount);
                    expect(relativePaths.length).assertEqual(0);
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
                const albumList = await media.getAlbums(fetchOp);
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
                const albumCountPass = await checkAlbumsCount(done, testNum, albumList, expectAlbumCount);
                if (!albumCountPass) return;
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
                const albumCountPass = await checkAlbumsCount(done, testNum, albumList, expectAlbumCount);
                if (!albumCountPass) return;
                const album = albumList[0];
                const albumId = album.albumId;
                console.info(`${testNum}, album.albumName(old): ${album.albumName}`);
                const oldAlbumName = album.albumName;
                album.albumName = newName;
                await album.commitModify();
                let currentfetchOp = idFetchOps(testNum, albumId);
                const newAlbumList = await media.getAlbums(currentfetchOp);
                console.info(`${testNum}, album.albumName(new): ${newAlbumList[0].albumName}`);
                expect(newAlbumList[0].albumName).assertEqual(newName);
                album.albumName = oldAlbumName;
                await album.commitModify();
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
         * @tc.desc      : Get Album by allTypeInfofetchOp, print all album info,
         *                 print all asset info, check asset info (mediaType, albumId, albumUri, albumName)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_01", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_01";
            let currentFetchOp = albumFetchOps(testNum, "Pictures/", "Static", IMAGE_TYPE);
            let relativePaths = "Pictures/";
            await checkAlbumInfo(done, testNum, currentFetchOp, relativePaths);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_02
         * @tc.name      : getAlbums
         * @tc.desc      : Get Album by imageAlbumInfofetchOp, print all album info,
         *                 print all asset info, check asset info (mediaType, albumId, albumUri, albumName)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_02", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_02";
            let currentFetchOp = albumFetchOps(testNum, "Videos/", "Static", VIDEO_TYPE);
            let relativePaths = "Videos/";
            await checkAlbumInfo(done, testNum, currentFetchOp, relativePaths);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_03
         * @tc.name      : getAlbums
         * @tc.desc      : Get Album by videoAlbumInfofetchOp, print all album info,
         *                 print all asset info, check asset info (mediaType, albumId, albumUri, albumName)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_03", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_03";
            let currentFetchOp = albumFetchOps(testNum, "Audios/", "Static", AUDIO_TYPE);
            let relativePaths = "Audios/";
            await checkAlbumInfo(done, testNum, currentFetchOp, relativePaths);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_04
         * @tc.name      : getAlbums
         * @tc.desc      : Get Album by imageAndVideoAlbumInfofetchOp, print all album info,
         *                 print all asset info, check asset info (mediaType, albumId, albumUri, albumName),
         *                 check media types (imageType, videoType)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_04", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_04";
            let currentFetchOp = albumTwoTypesFetchOps(testNum, ["Pictures/", "Videos/"], "Static", [
                IMAGE_TYPE,
                VIDEO_TYPE,
            ]);
            let relativePaths = ["Pictures/", "Videos/"];
            let albumCount = 2;
            await checkAlbumInfo(done, testNum, currentFetchOp, relativePaths, albumCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_05
         * @tc.name      : getAlbums
         * @tc.desc      : Get Album by imageAndVideoAlbumInfofetchOp, print all album info,
         *                 print all asset info, check asset info (mediaType, albumId, albumUri, albumName),
         *                 check media types (imageType, audioType)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_05", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_05";
            let currentFetchOp = albumTwoTypesFetchOps(testNum, ["Pictures/", "Audios/"], "Static", [
                IMAGE_TYPE,
                AUDIO_TYPE,
            ]);
            let relativePaths = ["Pictures/", "Audios/"];
            let albumCount = 2;
            await checkAlbumInfo(done, testNum, currentFetchOp, relativePaths, albumCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_06
         * @tc.name      : getAlbums
         * @tc.desc      : Get Album by imageAndAudioAlbumInfofetchOp, print all album info,
         *                 print all asset info, check asset info (mediaType, albumId, albumUri, albumName),
         *                 check media types (imageType, audioType)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_06", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_06";
            let currentFetchOp = albumTwoTypesFetchOps(testNum, ["Videos/", "Audios/"], "Static", [
                VIDEO_TYPE,
                AUDIO_TYPE,
            ]);
            let relativePaths = ["Videos/", "Audios/"];
            let albumCount = 2;
            await checkAlbumInfo(done, testNum, currentFetchOp, relativePaths, albumCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_07
         * @tc.name      : getAlbums
         * @tc.desc      : Get Album by videoAndAudioAlbumInfofetchOp, print all album info,
         *                 print all asset info, check asset info (mediaType, albumId, albumUri, albumName),
         *                 check media types (imageType, audioType)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_07", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_07";
            let currentFetchOp = albumThreeTypesFetchOps(testNum, ["Pictures/", "Videos/", "Audios/"], "Static", [
                IMAGE_TYPE,
                VIDEO_TYPE,
                AUDIO_TYPE,
            ]);
            let relativePaths = ["Pictures/", "Videos/", "Audios/"];
            let albumCount = 3;
            await checkAlbumInfo(done, testNum, currentFetchOp, relativePaths, albumCount);
        });
        // ------------------------------ 001 test end -------------------------

        // ------------------------------ 002 test start -------------------------
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_002_06
         * @tc.name      : album.getFileAssets
         * @tc.desc      : Get Album Assets by fileHasArgsfetchOp3
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_002_06", 0, async function (done) {
            let fileHasArgsfetchOp = {
                selections: FILEKEY.MEDIA_TYPE + " = ?",
                selectionArgs: ["666"],
            };
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_002_06";

            await abnormalAlbumCount(done, testNum, fileHasArgsfetchOp);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_002_07
         * @tc.name      : album.getFileAssets
         * @tc.desc      : Get Album Assets by fileHasArgsfetchOp4
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_002_07", 0, async function (done) {
            let fileHasArgsfetchOp = {
                selections: "666" + "= ?",
                selectionArgs: [VIDEO_TYPE.toString()],
            };
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_002_07";

            await queryConditionAbnormal(done, testNum, fileHasArgsfetchOp);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_002_08
         * @tc.name      : album.getFileAssets
         * @tc.desc      : Get Album Assets by fileHasArgsfetchOp5
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_002_08", 0, async function (done) {
            let fileHasArgsfetchOp = {
                selections: "666" + "= ?",
                selectionArgs: ["666"],
            };
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_002_08";
            await queryConditionAbnormal(done, testNum, fileHasArgsfetchOp);
        });
        // ------------------------------ 002 test end -------------------------

        // ------------------------------ 003 test start -------------------------
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_01
         * @tc.name      : commitModify
         * @tc.desc      : Modify Album name to 'hello'
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_01", 0, async function (done) {
            const testNum = "SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_01";
            try {
                let currentFetchOp = albumFetchOps(testNum, "Pictures/", "DynamicPro1", IMAGE_TYPE);
                const albumList = await media.getAlbums(currentFetchOp);
                const expectAlbumCount = 1;
                const albumCountPass = await checkAlbumsCount(done, testNum, albumList, expectAlbumCount);
                if (!albumCountPass) return;
                const album = albumList[0];
                const albumId = album.albumId;
                console.info(`${testNum}, album.albumName(old): ${album.albumName}`);
                const newName = "albumName" + new Date().getTime();
                album.albumName = newName;
                await album.commitModify();
                let currentfetchOp = idFetchOps(testNum, albumId);
                const newAlbumList = await media.getAlbums(currentfetchOp);
                console.info(`${testNum}, album.albumName(new): ${newAlbumList[0].albumName}`);
                expect(newAlbumList[0].albumName).assertEqual(newName);

                album.albumName = "DynamicPro1";
                await album.commitModify();
                done();
            } catch (error) {
                console.info(`${testNum}, failed error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_02
         * @tc.name      : commitModify
         * @tc.desc      : Modify Album name  ''
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_02", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_02";
            let currentFetchOp = albumFetchOps(testNum, "Pictures/", "DynamicPro2", IMAGE_TYPE);
            let newName = "";
            let expectAlbumCount = 1;
            await abnormalAlbumCommitModify(done, testNum, currentFetchOp, newName, expectAlbumCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_04
         * @tc.name      : commitModify
         * @tc.desc      : Modify Album name 'aaaaa....' (256)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_04", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_04";
            let currentFetchOp = albumFetchOps(testNum, "Pictures/", "DynamicPro3", IMAGE_TYPE);
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
         * @tc.desc      : Modify Album name  '中中中中中....' (86 *3)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_05", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_05";
            let currentFetchOp = albumFetchOps(testNum, "Pictures/", "DynamicPro4", IMAGE_TYPE);
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
         * @tc.desc      : Modify Album name  'aaaaaaa....' (255)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_06", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_06";
            let currentFetchOp = albumFetchOps(testNum, "Pictures/", "DynamicPro5", IMAGE_TYPE);
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
         * @tc.desc      : Modify Album name  '中中中中中中中....' (85*3)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_07", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_07";
            let currentFetchOp = albumFetchOps(testNum, "Pictures/", "DynamicPro6", IMAGE_TYPE);
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
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_004_01", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_004_01";
            try {
                let coverUrifetchOp = {
                    selections: "",
                    selectionArgs: [],
                    order: "date_added DESC LIMIT 0,1",
                };
                let expectAlbumCount = 1;
                let currentFetchOp = albumFetchOps(testNum, "Pictures/", "Static", IMAGE_TYPE);
                const albumList = await media.getAlbums(currentFetchOp);
                const albumCountPass = await checkAlbumsCount(done, testNum, albumList, expectAlbumCount);
                if (!albumCountPass) return;
                const album = albumList[0];
                const fetchFileResult = await album.getFileAssets(coverUrifetchOp);
                const asset = await fetchFileResult.getFirstObject();
                if (asset == undefined) {
                    console.info(`${testNum} failed asset undefined`);

                    expect(false).assertTrue();
                    done();
                    return;
                }
                expect(asset.uri).assertEqual(album.coverUri);
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
