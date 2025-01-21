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
    AUDIO_TYPE,
    checkAlbumsCount,
    FILEKEY,
    checkAssetsCount,
    fetchOps,
} from "../../../../../../common";

export default function filekeyTestPromiseTest(abilityContext) {
    describe("filekeyTestPromiseTest", function () {
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

        const {
            PARENT,
            MIME_TYPE,
            SIZE,
            DATE_ADDED,
            TITLE,
            ALBUM_NAME,
            DURATION,
            WIDTH,
            HEIGHT,
            ORIENTATION,
            ALBUM_ID,
            ARTIST,
            AUDIOALBUM,
            DATE_MODIFIED,
            DATE_TAKEN,
            RELATIVE_PATH,
            DISPLAY_NAME,
            MEDIA_TYPE,
        } = FILEKEY;

        async function getFileAssetsBy(done, testNum, type, fileKey) {
            try {
                let assetOp = fetchOps(testNum, "Pictures/ImageInfo/", IMAGE_TYPE);
                if (type == "audioAlbum" || type == "artist" || type == "duration") {
                    assetOp = fetchOps(testNum, "Audios/Static/", AUDIO_TYPE);
                }
                console.info(`${testNum} assOp : ${JSON.stringify(assetOp)}`);
                let fetchFileResult = await media.getFileAssets(assetOp);
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, 1);
                if (!checkAssetCountPass) return;
                const asset = await fetchFileResult.getFirstObject();
                let Op = {
                    selections: fileKey + "= ?",
                    selectionArgs: [asset[type] + ""],
                };
                fetchFileResult = await media.getFileAssets(Op);
                const fetchCount = fetchFileResult.getCount();
                expect(fetchCount > 0).assertTrue();
                let firstObject = await fetchFileResult.getFirstObject();
                expect(firstObject[type]).assertEqual(asset[type]);
                done();
            } catch (error) {
                console.info(`${testNum} error : ${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_001
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey parentOp
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */

        it("SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_001", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_001";
            await getFileAssetsBy(done, testNum, "parent", PARENT);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_002
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey mimeTypeOp
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_002", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_002";
            await getFileAssetsBy(done, testNum, "mimeType", MIME_TYPE);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_003
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey sizeOp
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_003", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_003";
            await getFileAssetsBy(done, testNum, "size", SIZE);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_004
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey dateAddedOp
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_004", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_004";
            await getFileAssetsBy(done, testNum, "dateAdded", DATE_ADDED);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_005
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey dateModifiedOp
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_005", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_005";
            await getFileAssetsBy(done, testNum, "dateModified", DATE_MODIFIED);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_006
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey dateTakenOp
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_006", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_006";
            await getFileAssetsBy(done, testNum, "dateTaken", DATE_TAKEN);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_007
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey titleOp
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_007", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_007";
            await getFileAssetsBy(done, testNum, "title", TITLE);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_008
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey durationOp
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_008", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_008";
            await getFileAssetsBy(done, testNum, "duration", DURATION);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_009
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey widthOp
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_009", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_009";
            await getFileAssetsBy(done, testNum, "width", WIDTH);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_010
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey heightOp
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_010", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_010";
            await getFileAssetsBy(done, testNum, "height", HEIGHT);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_011
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey orientationOp
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_011", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_011";
            await getFileAssetsBy(done, testNum, "orientation", ORIENTATION);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_012
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey widthOp
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_012", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_012";
            await getFileAssetsBy(done, testNum, "albumId", ALBUM_ID);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_014
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey artistOp
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_014", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_014";
            await getFileAssetsBy(done, testNum, "artist", ARTIST);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_015
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey audioAlbumOp
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_015", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_015";
            await getFileAssetsBy(done, testNum, "audioAlbum", AUDIOALBUM);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_016
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey relative_path
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_016", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_016";
            await getFileAssetsBy(done, testNum, "relativePath", RELATIVE_PATH);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_017
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey display_name
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_017", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_017";
            await getFileAssetsBy(done, testNum, "displayName", DISPLAY_NAME);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_018
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey album_name
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_018", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FILE_KEY_PROMISE_018";
            try {
                let albumName = "ImageInfo";
                let currentFetchOp = {
                    selections: RELATIVE_PATH + "= ? AND " + ALBUM_NAME + "= ? AND " + MEDIA_TYPE + "= ?",
                    selectionArgs: ["Pictures/", albumName, IMAGE_TYPE.toString()],
                };
                console.info(`${testNum} currentFetchOp : ${JSON.stringify(currentFetchOp)}`);
                const albumList = await media.getAlbums(currentFetchOp);
                const albumCountPass = await checkAlbumsCount(done, testNum, albumList, 1);
                if (!albumCountPass) return;
                const album = albumList[0];
                expect(album.albumName).assertEqual(albumName);
                done();
            } catch (error) {
                console.info(`${testNum} error : ${error}`);
                expect(false).assertTrue();
                done();
            }
        });
    });
}
