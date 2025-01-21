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
    VIDEO_TYPE,
    FILE_TYPE,
    checkPresetsAssets,
    checkAssetsCount,
    fetchOps,
    getPermission,
} from "../../../../../../common";

export default function mediafetchoptionsCallback(abilityContext) {
    describe("mediafetchoptionsCallback", function () {
        const media = mediaLibrary.getMediaLibrary(abilityContext);
        beforeAll(async function () {
            console.info("beforeAll case");
            await getPermission(null, abilityContext);
            await checkPresetsAssets(media, "ActsMediaLibraryMediafetchoptionsTest");
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
        const serachUri = async (done, testNum, fetchOp, type) => {
            try {
                const fetchFileResult = await media.getFileAssets(fetchOp);
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, 2);
                if (!checkAssetCountPass) return;
                let firstObject = await fetchFileResult.getFirstObject();
                const id = firstObject.id;
                const uri = firstObject.uri;
                const serachUri = `datashare:///media/${type}/${id}`;
                console.info(`${testNum} :uri ${uri};serachUri${serachUri})`);

                let serchfetchOp = {
                    uri: serachUri.toString(),
                    selections: "",
                    selectionArgs: [],
                };

                media.getFileAssets(serchfetchOp, async (err, result) => {
                    if (err) {
                        console.info(`${testNum}, err: ${err}`);
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    checkAssetCountPass = await checkAssetsCount(done, testNum, result, 1);
                    if (!checkAssetCountPass) return;
                    let asset = await result.getFirstObject();
                    expect(asset.uri).assertEqual(serachUri);
                    expect(asset.id).assertEqual(id);
                    done();
                });
            } catch (error) {
                console.info(`${testNum} failed error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        };
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ASSET_URI_CALLBACK_001
         * @tc.name      : uri
         * @tc.desc      : serach image asset by uri
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_ASSET_URI_CALLBACK_001", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_ASSET_URI_CALLBACK_001";
            let currentFetchOp = fetchOps(testNum, "Pictures/Static/", IMAGE_TYPE);
            let type = "image";
            await serachUri(done, testNum, currentFetchOp, type);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ASSET_URI_CALLBACK_002
         * @tc.name      : uri
         * @tc.desc      : serach audio asset by uri
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_ASSET_URI_CALLBACK_002", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_ASSET_URI_CALLBACK_002";
            let currentFetchOp = fetchOps(testNum, "Audios/Static/", AUDIO_TYPE);
            let type = "audio";
            await serachUri(done, testNum, currentFetchOp, type);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ASSET_URI_CALLBACK_003
         * @tc.name      : uri
         * @tc.desc      : serach video asset by uri
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_ASSET_URI_CALLBACK_003", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_ASSET_URI_CALLBACK_003";
            let currentFetchOp = fetchOps(testNum, "Videos/Static/", VIDEO_TYPE);
            let type = "video";
            await serachUri(done, testNum, currentFetchOp, type);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ASSET_URI_CALLBACK_004
         * @tc.name      : uri
         * @tc.desc      : serach file asset by uri
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_ASSET_URI_CALLBACK_004", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_ASSET_URI_CALLBACK_004";
            let currentFetchOp = fetchOps(testNum, "Documents/Static/", FILE_TYPE);
            let type = "file";
            await serachUri(done, testNum, currentFetchOp, type);
        });
    });
}
