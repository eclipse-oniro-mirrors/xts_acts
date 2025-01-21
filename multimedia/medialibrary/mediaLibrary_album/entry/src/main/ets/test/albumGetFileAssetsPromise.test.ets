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
    allFetchOp,
    checkAlbumsCount,
    fileFetchOption,
} from "../../../../../../common";

export default function albumGetFileAssetsPromiseTest(abilityContext) {
    describe("albumGetFileAssetsPromiseTest", function () {
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

        // Exception request
        const abnormalFetchOp = {
            selections: "date_added < 0",
            selectionArgs: [],
            order: "date_added DESC LIMIT 0,1",
        };

        const checkAlbumAssetsCount = async function (done, testNum, fetchOp, expectAssetsCount, expectAlbumCount = 1) {
            try {
                const albumList = await media.getAlbums(fetchOp);
                // check album length
                const albumCountPass = await checkAlbumsCount(testNum, albumList, expectAlbumCount);
                expect(albumCountPass).assertTrue();
                // one asset type
                let op: mediaLibrary.MediaFetchOptions = allFetchOp();
                let count = 0;
                for (let i = 0; i < albumList.length; i++) {
                    let fetchFileResult = await albumList[i].getFileAssets(op);
                    if (fetchFileResult == undefined) {
                        console.info(`${testNum} fetchFileResult undefined`);
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    count++;
                    expect(fetchFileResult.getCount()).assertEqual(expectAssetsCount[i]);
                    fetchFileResult.close();
                    if (i + 1 === albumList.length) {
                        expect(count).assertEqual(albumList.length);
                        done();
                    }
                }
            } catch (error) {
                console.info(`${testNum}, error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        };

        const checkAlbumAssetsNoOps = async function (done, testNum, fetchOp, expectAssetsCount, expectAlbumCount = 1) {
            try {
                const albumList = await media.getAlbums(fetchOp);
                // check album length
                const albumCountPass = await checkAlbumsCount(testNum, albumList, expectAlbumCount);
                expect(albumCountPass).assertTrue();

                const album = albumList[0];
                let fetchFileResult = await album.getFileAssets();
                if (fetchFileResult == undefined) {
                    console.info(`${testNum} fetchFileResult undefined`);
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info(`${testNum}, getCount:expectAssetsCount - ${fetchFileResult.getCount()} : ${expectAssetsCount}`);
                expect(fetchFileResult.getCount()).assertEqual(expectAssetsCount);
                fetchFileResult.close();
                done();
            } catch (error) {
                console.info(`${testNum}, error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        };

        const abnormalAlbumAssetsCount = async function (
            done,
            testNum,
            fetchOp,
            expectAssetsCount,
            expectAlbumCount = 1
        ) {
            try {
                const albumList = await media.getAlbums(fetchOp);
                // check album length
                const albumCountPass = await checkAlbumsCount(testNum, albumList, expectAlbumCount);
                expect(albumCountPass).assertTrue();
                const album = albumList[0];
                const fetchFileResult = await album.getFileAssets(abnormalFetchOp);
                if (fetchFileResult == undefined) {
                    console.info(`${testNum} fetchFileResult undefined`);
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info(`${testNum}, getCount: ${fetchFileResult.getCount()}`);
                console.info(`${testNum}, expectAssetsCount: ${expectAssetsCount}`);
                expect(fetchFileResult.getCount()).assertEqual(expectAssetsCount);
                fetchFileResult.close();
                done();
            } catch (error) {
                console.info(`${testNum} error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        };

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_001_01
         * @tc.name      : getFileAssets
         * @tc.desc      : check Camera album count,check asset count
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_001_01', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_001_01';
            let assetsCount = [1];
            let currentFetchOp = fileFetchOption(testNum, FILEKEY.ALBUM_NAME + "= ?", ['Camera']);
            await checkAlbumAssetsCount(done, testNum, currentFetchOp, assetsCount)
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_001_03
         * @tc.name      : getFileAssets
         * @tc.desc      : check Screenshots album count,check asset count
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_001_03', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_001_03';
            let assetsCount = [2];
            let currentFetchOp = fileFetchOption(testNum, FILEKEY.ALBUM_NAME + "= ?", ['Screenshots']);
            await checkAlbumAssetsCount(done, testNum, currentFetchOp, assetsCount)
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_001_04
         * @tc.name      : getFileAssets
         * @tc.desc      : check ScreenRecordings album count,check asset count
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_001_04', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_001_04';
            let assetsCount = [2];
            let currentFetchOp = fileFetchOption(testNum, FILEKEY.ALBUM_NAME + "= ?", ['ScreenRecordings']);
            let albumCount = 1;
            await checkAlbumAssetsCount(done, testNum, currentFetchOp, assetsCount, albumCount)
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_001_05
         * @tc.name      : getFileAssets
         * @tc.desc      : check albums count,check asset count
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_001_05', 2, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_001_05';
            let assetsCount = [2, 1];
            const selections = FILEKEY.ALBUM_NAME + '= ? or ' + FILEKEY.ALBUM_NAME + '= ?';
            const currentFetchOp = fileFetchOption(testNum, selections, ['Screenshots', 'Camera']);
            let albumCount = 2;
            await checkAlbumAssetsCount(done, testNum, currentFetchOp, assetsCount, albumCount)
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_001_06
         * @tc.name      : getFileAssets
         * @tc.desc      : check albums count,check asset count
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_001_06', 2, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_001_06';
            let assetsCount = [2, 1];
            const selections = FILEKEY.ALBUM_NAME + '= ? or ' + FILEKEY.ALBUM_NAME + '= ? or ' + FILEKEY.ALBUM_NAME + '= ?';
            const currentFetchOp = fileFetchOption(testNum, selections, ['Camera', 'ScreenRecordings', 'Screenshots']);
            let albumCount = 2;
            await checkAlbumAssetsCount(done, testNum, currentFetchOp, assetsCount, albumCount)
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_003_01
         * @tc.name      : getFileAssets
         * @tc.desc      : Camera album,abnormal option
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_003_01', 2, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_003_01';
            let currentFetchOp = fileFetchOption(testNum, FILEKEY.ALBUM_NAME + "= ?", ['Camera']);
            let assetsCount = 0;
            await abnormalAlbumAssetsCount(done, testNum, currentFetchOp, assetsCount)
        });

        /**
        * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_003_03
        * @tc.name      : getFileAssets
        * @tc.desc      : Screenshots album,abnormal option
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_003_03', 2, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_003_03';
            let currentFetchOp = fileFetchOption(testNum, FILEKEY.ALBUM_NAME + "= ?", ['Screenshots']);
            let assetsCount = 0;
            await abnormalAlbumAssetsCount(done, testNum, currentFetchOp, assetsCount)
        });

        /**
        * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_003_04
        * @tc.name      : getFileAssets
        * @tc.desc      : ScreenRecordings album,abnormal option
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_003_04', 2, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_003_04';
            let currentFetchOp = fileFetchOption(testNum, FILEKEY.ALBUM_NAME + "= ?", ['ScreenRecordings']);
            let assetsCount = 0;
            await abnormalAlbumAssetsCount(done, testNum, currentFetchOp, assetsCount)
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_004_01
         * @tc.name      : getFileAssets
         * @tc.desc      : Camera album,no option
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_004_01', 2, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_004_01';
            let assetsCount = 1;
            let currentFetchOp = fileFetchOption(testNum, FILEKEY.ALBUM_NAME + "= ?", ['Camera']);
            await checkAlbumAssetsNoOps(done, testNum, currentFetchOp, assetsCount)
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_004_03
         * @tc.name      : getFileAssets
         * @tc.desc      : Screenshots album,no option
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_004_03', 2, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_004_03';
            let assetsCount = 2;
            let currentFetchOp = fileFetchOption(testNum, FILEKEY.ALBUM_NAME + "= ?", ['Screenshots']);
            await checkAlbumAssetsNoOps(done, testNum, currentFetchOp, assetsCount)
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_004_04
         * @tc.name      : getFileAssets
         * @tc.desc      : ScreenRecordings album,no option
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_004_04', 2, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_004_04';
            let assetsCount = 2;
            let currentFetchOp = fileFetchOption(testNum, FILEKEY.ALBUM_NAME + "= ?", ['ScreenRecordings']);
            await checkAlbumAssetsNoOps(done, testNum, currentFetchOp, assetsCount)
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_004_05
         * @tc.name      : getFileAssets
         * @tc.desc      : getFileAssets by undefined option
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_004_05", 2, async function (done) {
            const testNum = "SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_004_05";
            let fetchOp = fileFetchOption(testNum, FILEKEY.ALBUM_NAME + "= ?", ['Camera']);
            try {
                const albumList = await media.getAlbums(fetchOp);
                // check album length
                const albumCountPass = await checkAlbumsCount(testNum, albumList, 1);
                expect(albumCountPass).assertTrue();

                const album = albumList[0];

                let fetchFileResult;
                let fetchAllResult;
                try {
                    fetchFileResult = await album.getFileAssets(undefined);
                    fetchAllResult = await album.getFileAssets(allFetchOp());
                    expect(fetchFileResult.getCount()).assertEqual(fetchAllResult.getCount());
                } catch (error) {
                    console.info(`${testNum} getFileAssets fail, error: ${error}`);
                    expect(false).assertTrue();
                }
                fetchFileResult.close();
                fetchAllResult.close();
                done();
            } catch (error) {
                console.info(`${testNum}, error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_004_06
         * @tc.name      : getFileAssets
         * @tc.desc      : getFileAssets by null option
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_004_06", 2, async function (done) {
            const testNum = "SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_PROMISE_004_06";
            let fetchOp = fileFetchOption(testNum, FILEKEY.ALBUM_NAME + "= ?", ['Camera']);
            try {
                const albumList = await media.getAlbums(fetchOp);
                // check album length
                const albumCountPass = await checkAlbumsCount(testNum, albumList, 1);
                expect(albumCountPass).assertTrue();

                const album = albumList[0];

                let fetchFileResult;
                let fetchAllResult;
                try {
                    fetchFileResult = await album.getFileAssets(null);
                    fetchAllResult = await album.getFileAssets(allFetchOp());
                    expect(fetchFileResult.getCount()).assertEqual(fetchAllResult.getCount());
                } catch (error) {
                    console.info(`${testNum} getFileAssets fail, error: ${error}`);
                    expect(false).assertTrue();
                }
                fetchFileResult.close();
                fetchAllResult.close();
                done();
            } catch (error) {
                console.info(`${testNum}, error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        });
    });
}
