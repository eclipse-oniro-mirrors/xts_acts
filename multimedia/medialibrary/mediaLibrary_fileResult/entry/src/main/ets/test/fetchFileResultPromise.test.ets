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
import { sleep, IMAGE_TYPE, FILE_TYPE, FILEKEY, checkAssetsCount, fetchOps } from "../../../../../../common";

export default function fetchFileResultPromiseTest(abilityContext) {
    describe("fetchFileResultPromiseTest", function () {
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

        const checkAssetCount = async function (done, testNum, fetchOp, expectCount) {
            try {
                let fetchFileResult = await media.getFileAssets(fetchOp);
                let checkResult = await checkAssetsCount(testNum, fetchFileResult, expectCount);
                expect(checkResult).assertTrue();
                fetchFileResult.close();
                done();
            } catch (error) {
                console.info(`${testNum} error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        };

        const checkGetPositionObject = async function (done, testNum, pos) {
            try {
                let currentFetchOp = fetchOps(testNum, "Pictures/Static/", IMAGE_TYPE, {
                    order: FILEKEY.DATE_ADDED + " DESC",
                });
                console.info(`${testNum} currentFetchOp ${currentFetchOp} `);

                let fetchFileResult = await media.getFileAssets(currentFetchOp);
                let expectCount = 4;
                let checkAssetCountPass = await checkAssetsCount(testNum, fetchFileResult, expectCount);
                expect(checkAssetCountPass).assertTrue();
                let assetList = await fetchFileResult.getAllObject();
                let targetObject = await fetchFileResult.getPositionObject(pos);
                expect(targetObject.displayName).assertEqual(assetList[pos].displayName);
                fetchFileResult.close();
                done();
            } catch (error) {
                console.info(`${testNum} error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        };

        const checkGetAllObject = async function (done, testNum, expectCount) {
            try {
                let currentFetchOp = fetchOps(testNum, "Documents/Static/", FILE_TYPE, {
                    order: FILEKEY.DATE_ADDED + ` DESC LIMIT 0,${expectCount}`,
                });
                console.info(`${testNum} currentFetchOp ${currentFetchOp} `);

                let fetchFileResult = await media.getFileAssets(currentFetchOp);
                let checkAssetCountPass = await checkAssetsCount(testNum, fetchFileResult, expectCount);
                expect(checkAssetCountPass).assertTrue();
                var targetObjects = await fetchFileResult.getAllObject();
                expect(targetObjects.length).assertEqual(expectCount);
                fetchFileResult.close();
                done();
            } catch (error) {
                console.info(`${testNum} error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        };

        // ------------------------------ 001 test start -------------------------
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETCOUNT_PROMISE_001_01
         * @tc.name      : getCount
         * @tc.desc      : Get FetchResult by getFileCountOneOp, check the return value of the interface (by Promise)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETCOUNT_PROMISE_001_01", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETCOUNT_PROMISE_001_01";
            let expectCount = 1;
            let currentFetchOp = fetchOps(testNum, "Documents/Static/", FILE_TYPE, {
                order: FILEKEY.DATE_ADDED + " DESC LIMIT 0,1",
            });
            await checkAssetCount(done, testNum, currentFetchOp, expectCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETCOUNT_PROMISE_001_02
         * @tc.name      : getCount
         * @tc.desc      : Get FetchResult by getFileCountTwoOp, check the return value of the interface (by Promise)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETCOUNT_PROMISE_001_02", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETCOUNT_PROMISE_001_02";
            let expectCount = 2;
            let currentFetchOp = fetchOps(testNum, "Documents/Static/", FILE_TYPE, {
                order: FILEKEY.DATE_ADDED + " DESC LIMIT 0,2",
            });
            await checkAssetCount(done, testNum, currentFetchOp, expectCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETCOUNT_PROMISE_001_03
         * @tc.name      : getCount
         * @tc.desc      : Get FetchResult by getFileCountOneHundredOp, check the return value of the interface (by Promise)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETCOUNT_PROMISE_001_03", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETCOUNT_PROMISE_001_03";
            let expectCount = 100;
            let currentFetchOp = fetchOps(testNum, "Documents/Static/", FILE_TYPE, {
                order: FILEKEY.DATE_ADDED + " DESC LIMIT 0,100",
            });
            await checkAssetCount(done, testNum, currentFetchOp, expectCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETCOUNT_PROMISE_001_04
         * @tc.name      : getCount
         * @tc.desc      : Get FetchResult by getFileCountZeroOp, check the return value of the interface (by Promise)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETCOUNT_PROMISE_001_04", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETCOUNT_PROMISE_001_04";
            let expectCount = 0;
            let currentFetchOp = fetchOps(testNum, "Documents/zeor/", FILE_TYPE);
            await checkAssetCount(done, testNum, currentFetchOp, expectCount);
        });

        // ------------------------------ 001 test end -------------------------

        // ------------------------------ 002 test start -------------------------
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_ISAFTERLAST_PROMISE_002
         * @tc.name      : getCount
         * @tc.desc      : Get FetchResult by getFileCountTenOp, check the return value of the interface (by Promise)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_ISAFTERLAST_PROMISE_002", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_ISAFTERLAST_PROMISE_002";
            try {
                let currentFetchOp = fetchOps(testNum, "Pictures/Static/", IMAGE_TYPE);
                console.info(`${testNum} currentFetchOp :${JSON.stringify(currentFetchOp)}`);
                let fetchFileResult = await media.getFileAssets(currentFetchOp);
                let expectCount = 4;
                let checkAssetCountPass = await checkAssetsCount(testNum, fetchFileResult, expectCount);
                expect(checkAssetCountPass).assertTrue();
                let asset = await fetchFileResult.getFirstObject();
                for (var i = 1; i < expectCount; i++) {
                    asset = await fetchFileResult.getNextObject();
                    if (i == expectCount - 1) {
                        let result = fetchFileResult.isAfterLast();
                        expect(result).assertTrue();
                        fetchFileResult.close();
                        done();
                    }
                }
            } catch (error) {
                console.info(`${testNum} error ${error}`);
                expect(false).assertTrue();
                done();
            }
        });
        // ------------------------------ 002 test end -------------------------

        // ------------------------------ 003 test start -------------------------
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_CLOSE_PROMISE_003
         * @tc.name      : getCount
         * @tc.desc      : Get FetchResult, close it, check if result closed
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_CLOSE_PROMISE_003", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_CLOSE_PROMISE_003";
            try {
                let expectCount = 4;
                let currentFetchOp = fetchOps(testNum, "Pictures/Static/", IMAGE_TYPE);
                let fetchFileResult = await media.getFileAssets(currentFetchOp);
                let checkAssetCountPass = await checkAssetsCount(testNum, fetchFileResult, expectCount);
                expect(checkAssetCountPass).assertTrue();
                fetchFileResult.close();
                let count = 0;
                try {
                    fetchFileResult.getCount();
                } catch {
                    count++;
                }
                try {
                    await fetchFileResult.getFirstObject();
                } catch {
                    count++;
                }
                try {
                    await fetchFileResult.getNextObject();
                } catch {
                    count++;
                }
                try {
                    await fetchFileResult.getLastObject();
                } catch {
                    count++;
                }
                try {
                    await fetchFileResult.getPositionObject(0);
                } catch {
                    count++;
                }
                await sleep(1000);
                expect(count).assertEqual(5);
                done();
            } catch (error) {
                console.info(`${testNum} error:${error}`);
                expect(false).assertTrue();
                done();
            }
        });

        // ------------------------------ 003 test end -------------------------

        // ------------------------------ 004 test start -------------------------
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETFIRSTOBJECT_PROMISE_004
         * @tc.name      : getFirstObject
         * @tc.desc      : Get FetchResult, get first object, check result
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETFIRSTOBJECT_PROMISE_004", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETFIRSTOBJECT_PROMISE_004";
            try {
                let currentFetchOp = fetchOps(testNum, "Pictures/Static/", IMAGE_TYPE, {
                    order: FILEKEY.DATE_ADDED + " DESC",
                });
                console.info(`${testNum} currentFetchOp ${JSON.stringify(currentFetchOp)} `);
                let fetchFileResult = await media.getFileAssets(currentFetchOp);
                let expectCount = 4;
                let checkAssetCountPass = await checkAssetsCount(testNum, fetchFileResult, expectCount);
                expect(checkAssetCountPass).assertTrue();
                let assetList = await fetchFileResult.getAllObject();
                let firstObject = await fetchFileResult.getFirstObject();
                expect(firstObject.displayName).assertEqual(assetList[0].displayName);
                fetchFileResult.close();
                done();
            } catch (error) {
                console.info(`${testNum} error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        });

        // ------------------------------ 004 test end -------------------------

        // ------------------------------ 005 test start -------------------------
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETNEXTOBJECT_PROMISE_005
         * @tc.name      : getNextObject
         * @tc.desc      : Get FetchResult, get first object, get next object, check result
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETNEXTOBJECT_PROMISE_005", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETNEXTOBJECT_PROMISE_005";
            try {
                let currentFetchOp = fetchOps(testNum, "Pictures/Static/", IMAGE_TYPE, {
                    order: FILEKEY.DATE_ADDED + " DESC",
                });
                console.info(`${testNum} currentFetchOp ${JSON.stringify(currentFetchOp)} `);

                let fetchFileResult = await media.getFileAssets(currentFetchOp);
                let expectCount = 4;
                let checkAssetCountPass = await checkAssetsCount(testNum, fetchFileResult, expectCount);
                expect(checkAssetCountPass).assertTrue();
                let firstObject = await fetchFileResult.getFirstObject();
                let nextObject = await fetchFileResult.getNextObject();
                let assetList = await fetchFileResult.getAllObject();
                expect(firstObject.displayName).assertEqual(assetList[0].displayName);

                expect(nextObject.displayName).assertEqual(assetList[1].displayName);
                fetchFileResult.close();
                done();
            } catch (error) {
                console.info(`${testNum} error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        });
        // ------------------------------ 005 test end -------------------------

        // ------------------------------ 006 test start -------------------------
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETLASTOBJECT_PROMISE_006
         * @tc.name      : getLastObject
         * @tc.desc      : Get FetchResult, get first object, get next object, check result
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETLASTOBJECT_PROMISE_006", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETLASTOBJECT_PROMISE_006";
            try {
                let currentFetchOp = fetchOps(testNum, "Pictures/Static/", IMAGE_TYPE, {
                    order: FILEKEY.DATE_ADDED + " DESC",
                });
                console.info(`${testNum} currentFetchOp ${JSON.stringify(currentFetchOp)} `);

                let fetchFileResult = await media.getFileAssets(currentFetchOp);
                let expectCount = 4;
                let checkAssetCountPass = await checkAssetsCount(testNum, fetchFileResult, expectCount);
                expect(checkAssetCountPass).assertTrue();
                let assetList = await fetchFileResult.getAllObject();
                let firstObject = await fetchFileResult.getLastObject();
                expect(firstObject.displayName).assertEqual(assetList[assetList.length - 1].displayName);
                fetchFileResult.close();
                done();
            } catch (error) {
                console.info(`${testNum} error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        });
        // ------------------------------ 006 test end -------------------------

        // ------------------------------ 007 test start -------------------------
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETPOSITIONOBJECT_PROMISE_007_01
         * @tc.name      : getPositionObject
         * @tc.desc      : Get FetchResult, get position 0 object, check result
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETPOSITIONOBJECT_PROMISE_007_01", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETPOSITIONOBJECT_PROMISE_007_01";
            let pos = 0;
            await checkGetPositionObject(done, testNum, pos);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETPOSITIONOBJECT_PROMISE_007_02
         * @tc.name      : getPositionObject
         * @tc.desc      : Get FetchResult, get position 1 object, check result
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETPOSITIONOBJECT_PROMISE_007_02", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETPOSITIONOBJECT_PROMISE_007_02";
            let pos = 1;
            await checkGetPositionObject(done, testNum, pos);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETPOSITIONOBJECT_PROMISE_007_03
         * @tc.name      : getPositionObject
         * @tc.desc      : Get FetchResult, get position 1 object, check result
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETPOSITIONOBJECT_PROMISE_007_03", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETPOSITIONOBJECT_PROMISE_007_03";
            let pos = 3;
            await checkGetPositionObject(done, testNum, pos);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETPOSITIONOBJECT_PROMISE_007_04
         * @tc.name      : getPositionObject
         * @tc.desc      : Get FetchResult, get position 1 object, check result
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETPOSITIONOBJECT_PROMISE_007_04", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETPOSITIONOBJECT_PROMISE_007_04";
            try {
                let currentFetchOp = fetchOps(testNum, "Pictures/Static/", IMAGE_TYPE, {
                    order: FILEKEY.DATE_ADDED + " DESC",
                });
                console.info(`${testNum} currentFetchOp ${currentFetchOp} `);

                let fetchFileResult = await media.getFileAssets(currentFetchOp);
                let expectCount = 4;
                let checkAssetCountPass = await checkAssetsCount(testNum, fetchFileResult, expectCount);
                expect(checkAssetCountPass).assertTrue();
                try {
                    await fetchFileResult.getPositionObject(expectCount);
                    expect(false).assertTrue();
                    fetchFileResult.close();
                    done();
                } catch (error) {
                    console.info(`${testNum} passed error: ${error}`);
                    expect(true).assertTrue();
                    fetchFileResult.close();
                    done();
                }
            } catch (error) {
                console.info(`${testNum} error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        });
        // // ------------------------------ 007 test end -------------------------

        // ------------------------------ 008 test start -------------------------
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETALLOBJECT_PROMISE_008_01
         * @tc.name      : getAllObject
         * @tc.desc      : Get FetchResult, get all object, check result
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETALLOBJECT_PROMISE_008_01", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETALLOBJECT_PROMISE_008_01";
            let expectCount = 1;
            await checkGetAllObject(done, testNum, expectCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETALLOBJECT_PROMISE_008_02
         * @tc.name      : getAllObject
         * @tc.desc      : Get FetchResult, get all object, check result
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETALLOBJECT_PROMISE_008_02", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETALLOBJECT_PROMISE_008_02";
            let expectCount = 50;
            await checkGetAllObject(done, testNum, expectCount);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETALLOBJECT_PROMISE_008_03
         * @tc.name      : getAllObject
         * @tc.desc      : Get FetchResult, get all object, check result
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETALLOBJECT_PROMISE_008_03", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETALLOBJECT_PROMISE_008_03";
            let expectCount = 100;
            await checkGetAllObject(done, testNum, expectCount);
        });
        // ------------------------------ 008 test end -------------------------
    });
}
