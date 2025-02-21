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
    checkPresetsAssets,
    checkAssetsCount,
    fetchOps,
    fileFetchOption,
    FILEKEY,
} from "../../../../../../common";

export default function mediafetchoptionsCallback(abilityContext) {
    describe("mediafetchoptionsCallback", function () {
        const media = mediaLibrary.getMediaLibrary(abilityContext);
        beforeAll(async function () {
            console.info("beforeAll case");
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
                expect(fetchFileResult.getCount()).assertEqual(1);
                let firstObject = await fetchFileResult.getFirstObject();
                fetchFileResult.close();
                const id = firstObject.id;
                const uri = firstObject.uri;
                const serachUri = `file://media/${type}/${id}`;
                console.info(`${testNum} :uri ${uri};serachUri${serachUri})`);

                let serchfetchOp = {
                    uri: serachUri.toString(),
                    selections: "",
                    selectionArgs: [],
                };

                media.getFileAssets(serchfetchOp, async (err, result) => {
                    try {
                        if (err) {
                            console.info(`${testNum}, err: ${err}`);
                            expect(false).assertTrue();
                        } else {
                            expect(result.getCount()).assertEqual(1);
                            let asset = await result.getFirstObject();
                            expect(asset.uri).assertEqual(serachUri);
                            expect(asset.id).assertEqual(id);
                            result.close();
                        }
                    } catch (error) {
                        console.info(`${testNum} error: ${error}`);
                        expect(false).assertTrue();
                    }
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
            let currentFetchOp = fileFetchOption(testNum, FILEKEY.DISPLAY_NAME + "=?", ['01.jpg']);
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
            let currentFetchOp = fileFetchOption(testNum, FILEKEY.DISPLAY_NAME + "=?", ['01.mp3']);
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
            let currentFetchOp = fileFetchOption(testNum, FILEKEY.DISPLAY_NAME + "=?", ['01.mp4']);
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
            let currentFetchOp = fileFetchOption(testNum, FILEKEY.DISPLAY_NAME + "=?", ['01.dat']);
            let type = "file";
            await serachUri(done, testNum, currentFetchOp, type);
        });
    });
}
