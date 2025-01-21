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
    FILEKEY,
    checkPresetsAssets,
    checkAssetsCount,
    getPermission,
    nameFetchOps,
} from "../../../../../../common";

export default function fileAssetCallback2Test(abilityContext) {
    describe("fileAssetCallback2Test", function () {
        const media = mediaLibrary.getMediaLibrary(abilityContext);
        beforeAll(async function () {
            console.info("beforeAll case");
            await getPermission(null, abilityContext);
            await checkPresetsAssets(media, "ActsMediaLibraryFileAssetTest");
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

        const checkCommitModify = async function (done, testNum, fetchOp, prop, val) {
            try {
                const fetchFileResult = await media.getFileAssets(fetchOp);
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, 1);
                if (!checkAssetCountPass) return;
                const asset = await fetchFileResult.getFirstObject();
                const oldVal = asset[prop];
                asset[prop] = val;
                const id = asset.id;
                asset.commitModify(async (err) => {
                    if (err) {
                        console.info(`${testNum} err : ${err}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    let currentfetchOp = {
                        selections: FILEKEY.ID + "= ?",
                        selectionArgs: [id + ""],
                    };
                    const fetchFileResultById = await media.getFileAssets(currentfetchOp);
                    const currentAsset = await fetchFileResultById.getFirstObject();
                    expect(currentAsset[prop]).assertEqual(val);
                    asset[prop] = oldVal;
                    await asset.commitModify();
                    await fetchFileResult.close();
                    done();
                });
            } catch (error) {
                console.info(`${testNum} error : ${error}`);
                expect(false).assertTrue();
                done();
            }
        };

        const abnormalCheckCommitModify = async function (done, testNum, fetchOp, prop, val) {
            try {
                const fetchFileResult = await media.getFileAssets(fetchOp);
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, 1);
                if (!checkAssetCountPass) return;
                const asset = await fetchFileResult.getFirstObject();
                asset[prop] = val;
                asset.commitModify(async (err) => {
                    if (err) {
                        console.info(`${testNum} passed : ${err}`);
                        expect(true).assertTrue();
                        done();
                        return;
                    }
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.info(`${testNum} error : ${error}`);
                expect(false).assertTrue();
                done();
            }
        };

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_001
         * @tc.name      : commitModify
         * @tc.desc      : Modify displayName
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_001", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_001";
            let fetchOp = nameFetchOps(testNum, "Pictures/ModifyCb/", "01.jpg", IMAGE_TYPE);
            let prop = "displayName";
            let val = new Date().getTime() + ".jpg";
            await checkCommitModify(done, testNum, fetchOp, prop, val);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_002
         * @tc.name      : commitModify
         * @tc.desc      : Modify title
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_002", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_002";
            let fetchOp = nameFetchOps(testNum, "Pictures/ModifyCb/", "02.jpg", IMAGE_TYPE);
            let prop = "title";
            let val = new Date().getTime() + "newTitle";
            await checkCommitModify(done, testNum, fetchOp, prop, val);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_003
         * @tc.name      : commitModify
         * @tc.desc      : Modify relativePath
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_003", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_003";
            let fetchOp = nameFetchOps(testNum, "Pictures/ModifyCb/", "03.jpg", IMAGE_TYPE);
            let prop = "relativePath";
            let val = "Pictures/Temp/";
            await checkCommitModify(done, testNum, fetchOp, prop, val);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_004
         * @tc.name      : commitModify
         * @tc.desc      : Modify orientation
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_004", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_004";
            let fetchOp = nameFetchOps(testNum, "Pictures/ModifyCb/", "04.jpg", IMAGE_TYPE);
            let prop = "orientation";
            let val = 1;
            await checkCommitModify(done, testNum, fetchOp, prop, val);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_005
         * @tc.name      : commitModify
         * @tc.desc      : Modify displayName '中中....jpg' (83)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_005", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_005";
            let fetchOp = nameFetchOps(testNum, "Pictures/ModifyCb/", "05.jpg", IMAGE_TYPE);
            let prop = "displayName";
            let val = "";
            for (var i = 0; i < 83; i++) {
                val += "中";
            }
            val += ".jpg";
            await checkCommitModify(done, testNum, fetchOp, prop, val);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_006
         * @tc.name      : commitModify
         * @tc.desc      : Modify displayName  'aaaaaaa....jpg' (255)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_006", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_006";
            let fetchOp = nameFetchOps(testNum, "Pictures/ModifyCb/", "06.jpg", IMAGE_TYPE);
            let prop = "displayName";
            let val = "";
            for (var i = 0; i < 251; i++) {
                val += "a";
            }
            val += ".jpg";
            await checkCommitModify(done, testNum, fetchOp, prop, val);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_007
         * @tc.name      : commitModify
         * @tc.desc      : Modify title '中中....' (85)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_007", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_007";
            let fetchOp = nameFetchOps(testNum, "Pictures/ModifyCb/", "07.jpg", IMAGE_TYPE);
            let prop = "title";
            let val = "";
            for (var i = 0; i < 85; i++) {
                val += "中";
            }
            await checkCommitModify(done, testNum, fetchOp, prop, val);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_008
         * @tc.name      : commitModify
         * @tc.desc      : Modify title  'aaaaaaa....' (255)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_008", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_008";
            let fetchOp = nameFetchOps(testNum, "Pictures/ModifyCb/", "08.jpg", IMAGE_TYPE);
            let prop = "title";
            let val = "";
            for (var i = 0; i < 255; i++) {
                val += "a";
            }
            await checkCommitModify(done, testNum, fetchOp, prop, val);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_009
         * @tc.name      : commitModify
         * @tc.desc      : Modify displayName '中中....jpg' (84)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_009", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_009";
            let fetchOp = nameFetchOps(testNum, "Pictures/ModifyCb/", "09.jpg", IMAGE_TYPE);
            let prop = "displayName";
            let val = "";
            for (var i = 0; i < 84; i++) {
                val += "中";
            }
            val += ".jpg";
            await abnormalCheckCommitModify(done, testNum, fetchOp, prop, val);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_010
         * @tc.name      : commitModify
         * @tc.desc      : Modify displayName  'aaaaaaa....jpg' (256)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_010", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_010";
            let fetchOp = nameFetchOps(testNum, "Pictures/ModifyCb/", "010.jpg", IMAGE_TYPE);
            let prop = "displayName";
            let val = "";
            for (var i = 0; i < 252; i++) {
                val += "a";
            }
            val += ".jpg";
            await abnormalCheckCommitModify(done, testNum, fetchOp, prop, val);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_011
         * @tc.name      : commitModify
         * @tc.desc      : Modify title '中中....' (86)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_011", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_011";
            let fetchOp = nameFetchOps(testNum, "Pictures/ModifyCb/", "011.jpg", IMAGE_TYPE);
            let prop = "title";
            let val = "";
            for (var i = 0; i < 86; i++) {
                val += "中";
            }
            await abnormalCheckCommitModify(done, testNum, fetchOp, prop, val);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_012
         * @tc.name      : commitModify
         * @tc.desc      : Modify title  'aaaaaaa....' (256)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_012", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_CALLBACK_012";
            let fetchOp = nameFetchOps(testNum, "Pictures/ModifyCb/", "012.jpg", IMAGE_TYPE);
            let prop = "title";
            let val = "";
            for (var i = 0; i < 256; i++) {
                val += "a";
            }
            await abnormalCheckCommitModify(done, testNum, fetchOp, prop, val);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILEASSET_ISDIRECTORY_CALLBACK_001
         * @tc.name      : isDirectory
         * @tc.desc      : isDirectory asset
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FILEASSET_ISDIRECTORY_CALLBACK_001", 0, async function (done) {
            try {
                let testNum = "SUB_MEDIA_MEDIALIBRARY_FILEASSET_ISDIRECTORY_CALLBACK_001";
                let fetchOp = nameFetchOps(testNum, "Pictures/ModifyCb/", "013.jpg", IMAGE_TYPE);
                const fetchFileResult = await media.getFileAssets(fetchOp);
                const asset = await fetchFileResult.getFirstObject();
                asset.isDirectory((err, isDir) => {
                    if (err) {
                        console.info(`${testNum} err : ${err}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    expect(isDir).assertEqual(false);
                    done();
                });
            } catch (error) {
                console.info("FileAsset isDirectory 001 failed, message = " + error);
                expect(false).assertTrue();
                done();
            }
        });
    });
}
