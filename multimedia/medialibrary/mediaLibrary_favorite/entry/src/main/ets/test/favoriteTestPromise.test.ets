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
    nameFetchOps,
    checkAssetsCount,
} from "../../../../../../common";

export default function favoriteTestPromiseTest(abilityContext) {
    describe("favoriteTestPromiseTest", function () {
        var media = mediaLibrary.getMediaLibrary(abilityContext);
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

        const favoriteDefaultState = async function (done, testNum, fetchOp) {
            try {
                let fetchFileResult = await media.getFileAssets(fetchOp);
                let checkAssetCountPass = await checkAssetsCount(testNum, fetchFileResult, 1);
                expect(checkAssetCountPass).assertTrue();
                let asset = await fetchFileResult.getFirstObject();
                let isFavorite = await asset.isFavorite();
                expect(isFavorite).assertEqual(false);
                fetchFileResult.close();
                done();
            } catch (error) {
                console.info(`${testNum} failed error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        };
        const favoriteByTrue = async function (done, testNum, fetchOp) {
            try {
                const fetchFileResult = await media.getFileAssets(fetchOp);
                let checkAssetCountPass = await checkAssetsCount(testNum, fetchFileResult, 1);
                expect(checkAssetCountPass).assertTrue();
                const asset = await fetchFileResult.getFirstObject();
                await asset.favorite(true);
                let isFavorite = await asset.isFavorite();
                expect(isFavorite).assertEqual(true);
                fetchFileResult.close();
                done();
            } catch (error) {
                console.info(`${testNum} failed error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        };
        const favoriteByFalse = async function (done, testNum, fetchOp) {
            try {
                const fetchFileResult = await media.getFileAssets(fetchOp);
                let checkAssetCountPass = await checkAssetsCount(testNum, fetchFileResult, 1);
                expect(checkAssetCountPass).assertTrue();
                const asset = await fetchFileResult.getFirstObject();
                await asset.favorite(true);
                await asset.favorite(false);
                let isFavorite = await asset.isFavorite();
                expect(isFavorite).assertEqual(false);
                fetchFileResult.close();
                done();
            } catch (error) {
                console.info(`${testNum} failed error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        };

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_001_01
         * @tc.name      : isFavorite
         * @tc.desc      : isFavorite(image) result false
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_001_01", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_001_01";
            let currentFetchOp = nameFetchOps(testNum, "Pictures/StaticPro/", "01.jpg", IMAGE_TYPE);
            await favoriteDefaultState(done, testNum, currentFetchOp);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_001_02
         * @tc.name      : favorite
         * @tc.desc      : favorite(image) by true
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_001_02", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_001_02";
            let currentFetchOp = nameFetchOps(testNum, "Pictures/StaticPro/", "02.jpg", IMAGE_TYPE);
            await favoriteByTrue(done, testNum, currentFetchOp);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_001_03
         * @tc.name      : favorite
         * @tc.desc      : favorite(image) by false
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_001_03", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_001_03";
            let currentFetchOp = nameFetchOps(testNum, "Pictures/StaticPro/", "03.jpg", IMAGE_TYPE);
            await favoriteByFalse(done, testNum, currentFetchOp);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_002_01
         * @tc.name      : isFavorite
         * @tc.desc      : isFavorite(video) result false
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_002_01", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_002_01";
            let currentFetchOp = nameFetchOps(testNum, "Videos/StaticPro/", "01.mp4", VIDEO_TYPE);
            await favoriteDefaultState(done, testNum, currentFetchOp);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_002_02
         * @tc.name      : favorite
         * @tc.desc      : favorite(video) by true
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_002_02", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_002_02";
            let currentFetchOp = nameFetchOps(testNum, "Videos/StaticPro/", "02.mp4", VIDEO_TYPE);
            await favoriteByTrue(done, testNum, currentFetchOp);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_002_03
         * @tc.name      : favorite
         * @tc.desc      : favorite(video) by false
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_002_03", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_002_03";
            let currentFetchOp = nameFetchOps(testNum, "Videos/StaticPro/", "03.mp4", VIDEO_TYPE);
            await favoriteByFalse(done, testNum, currentFetchOp);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_003_01
         * @tc.name      : isFavorite
         * @tc.desc      : isFavorite(audio) result false
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_003_01", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_003_01";
            let currentFetchOp = nameFetchOps(testNum, "Audios/StaticPro/", "01.mp3", AUDIO_TYPE);
            await favoriteDefaultState(done, testNum, currentFetchOp);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_003_02
         * @tc.name      : favorite
         * @tc.desc      : favorite(audio) by true
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_003_02", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_003_02";
            let currentFetchOp = nameFetchOps(testNum, "Audios/StaticPro/", "02.mp3", AUDIO_TYPE);
            await favoriteByTrue(done, testNum, currentFetchOp);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_003_03
         * @tc.name      : favorite
         * @tc.desc      : favorite(audio) by false
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_003_03", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_003_03";
            let currentFetchOp = nameFetchOps(testNum, "Audios/StaticPro/", "03.mp3", AUDIO_TYPE);
            await favoriteByFalse(done, testNum, currentFetchOp);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_004_01
         * @tc.name      : isFavorite
         * @tc.desc      : isFavorite(file) result false
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_004_01", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_004_01";
            let currentFetchOp = nameFetchOps(testNum, "Documents/StaticPro/", "01.dat", FILE_TYPE);
            await favoriteDefaultState(done, testNum, currentFetchOp);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_004_02
         * @tc.name      : favorite
         * @tc.desc      : favorite(file) by true
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_004_02", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_004_02";
            let currentFetchOp = nameFetchOps(testNum, "Documents/StaticPro/", "02.dat", FILE_TYPE);
            await favoriteByTrue(done, testNum, currentFetchOp);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_004_03
         * @tc.name      : favorite
         * @tc.desc      : favorite(file) by false
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_004_03", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_004_03";
            let currentFetchOp = nameFetchOps(testNum, "Documents/StaticPro/", "03.dat", FILE_TYPE);
            await favoriteByFalse(done, testNum, currentFetchOp);
        });
    });
}
