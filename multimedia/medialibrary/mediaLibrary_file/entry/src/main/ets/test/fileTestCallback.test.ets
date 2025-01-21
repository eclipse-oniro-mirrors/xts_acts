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
import fileio from "@ohos.fileio";

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "deccjsunit/index";
import {
    sleep,
    IMAGE_TYPE,
    VIDEO_TYPE,
    AUDIO_TYPE,
    FILE_TYPE,
    checkPresetsAssets,
    nameFetchOps,
    checkAssetsCount,
    getPermission,
    fetchOps,
    FILEKEY,
    isNum,
} from "../../../../../../common";

export default function fileTestCallbackTest(abilityContext) {
    describe("fileTestCallbackTest", function () {
        const media = mediaLibrary.getMediaLibrary(abilityContext);
        beforeAll(async function () {
            console.info("beforeAll case");
            await getPermission(null, abilityContext);
            await checkPresetsAssets(media, "ActsMediaLibraryFileTest");
        });
        beforeEach(function () {
            console.info("beforeEach case");
        });
        afterEach(async function () {
            console.info("afterEach case");
            await sleep(400);
        });
        afterAll(function () {
            console.info("afterAll case");
        });

        async function copyFile(fd1, fd2) {
            let stat = await fileio.fstat(fd1);
            let buf = new ArrayBuffer(stat.size);
            await fileio.read(fd1, buf);
            await fileio.write(fd2, buf);
        }
        const creatAssetTest = async (done, testNum, fetchOp, path, type, name) => {
            try {
                const fetchFileResult = await media.getFileAssets(fetchOp);
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, 1);
                if (!checkAssetCountPass) return;
                const asset = await fetchFileResult.getFirstObject();
                let displayName1 = `${new Date().getTime()}.${name}`;

                media.createAsset(type, displayName1, path, async (err, creatAsset1) => {
                    if (err) {
                        console.info(`${testNum} err : ${err}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    const fd = await asset.open("rw");
                    const creatAssetFd1 = await creatAsset1.open("rw");
                    await copyFile(fd, creatAssetFd1);
                    await creatAsset1.close(creatAssetFd1);

                    let displayName2 = `${new Date().getTime()}.${name}`;
                    const creatAsset2 = await media.createAsset(type, displayName2, path);
                    const creatAssetFd2 = await creatAsset2.open("rw");
                    await copyFile(fd, creatAssetFd2);
                    await creatAsset2.close(creatAssetFd2);
                    await asset.close(fd);
                    console.info(`${testNum} displayName1: ${displayName1}, displayName2 :${displayName2} `);
                    expect(creatAsset1.id != creatAsset2.id).assertTrue();
                    done();
                });
            } catch (error) {
                console.info(`${testNum} failed error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        };

        const checkCreatAssetProps = async (done, testNum, fetchOp, path, type, name, key, val) => {
            try {
                const fetchFileResult = await media.getFileAssets(fetchOp);
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, 1);
                if (!checkAssetCountPass) return;
                const asset = await fetchFileResult.getFirstObject();
                let displayName = `${new Date().getTime()}.${name}`;

                media.createAsset(type, displayName, path, async (err, creatAsset) => {
                    if (err) {
                        console.info(`${testNum} err : ${err}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    const fd = await asset.open("rw");
                    const creatAssetFd = await creatAsset.open("rw");
                    await copyFile(fd, creatAssetFd);
                    await creatAsset.close(creatAssetFd);

                    if (val == "displayName") {
                        val = displayName;
                    }
                    expect(creatAsset[key]).assertEqual(val);
                    done();
                });
            } catch (error) {
                console.info(`${testNum} failed error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        };

        const checkdateModified = async (done, testNum, fetchOp) => {
            try {
                let fetchFileResult = await media.getFileAssets(fetchOp);
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, 1);
                if (!checkAssetCountPass) return;
                let asset = await fetchFileResult.getFirstObject();
                asset.title = `title_${new Date().getTime()}`;
                asset.commitModify(async (err) => {
                    if (err) {
                        console.info(`${testNum} err : ${err}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    const id = asset.id;
                    const idOP = { selections: FILEKEY.ID + "= ?", selectionArgs: ["" + id] };
                    fetchFileResult = await media.getFileAssets(idOP);
                    let newAsset = await fetchFileResult.getFirstObject();
                    expect(isNum(newAsset.dateModified)).assertTrue();
                    expect(newAsset.dateModified).assertEqual(asset.dateModified);
                    done();
                });
            } catch (error) {
                console.info(`${testNum} failed error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        };

        // ------------------------------- image type start ----------------------------
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_01
         * @tc.name      : createAsset
         * @tc.desc      : Insert two database records, read a unique identifier, expectations are not equal
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_01", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_01";
            let currentFetchOp = nameFetchOps(testNum, "Pictures/Static/", "01.jpg", IMAGE_TYPE);
            let name = "jpg";
            let path = (await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_IMAGE)) + "create/";
            let type = IMAGE_TYPE;
            await creatAssetTest(done, testNum, currentFetchOp, path, type, name);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_02
         * @tc.name      : getFileAssets
         * @tc.desc      : Access to the file displayName and validation is not undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_02", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_02";
            let currentFetchOp = nameFetchOps(testNum, "Pictures/Static/", "02.jpg", IMAGE_TYPE);
            let name = "jpg";
            let path = (await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_IMAGE)) + "create/";
            let type = IMAGE_TYPE;
            let key = "displayName";
            let val = "displayName";
            await checkCreatAssetProps(done, testNum, currentFetchOp, path, type, name, key, val);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_03
         * @tc.name      : getFileAssets
         * @tc.desc      : Access to the file relativePath  and validation is not undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_03", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_03";
            let currentFetchOp = nameFetchOps(testNum, "Pictures/Static/", "03.jpg", IMAGE_TYPE);
            let name = "jpg";
            let path = (await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_IMAGE)) + "create/";
            let type = IMAGE_TYPE;
            let key = "relativePath";
            let val = path;
            await checkCreatAssetProps(done, testNum, currentFetchOp, path, type, name, key, val);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_07
         * @tc.name      : getFileAssets
         * @tc.desc      : Access to the file dateModified and validation is not undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_07", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_07";
            let currentFetchOp = fetchOps(testNum, "Pictures/Dynamic/", IMAGE_TYPE);
            await checkdateModified(done, testNum, currentFetchOp);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_08
         * @tc.name      : createAsset
         * @tc.desc      : Insert a picture record, the retrieve attributes for images
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_08", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_08";
            let currentFetchOp = nameFetchOps(testNum, "Pictures/Static/", "04.jpg", IMAGE_TYPE);
            let name = "jpg";
            let path = (await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_IMAGE)) + "create/";
            let type = IMAGE_TYPE;
            let key = "mediaType";
            let val = IMAGE_TYPE;
            await checkCreatAssetProps(done, testNum, currentFetchOp, path, type, name, key, val);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_11
         * @tc.name      : createAsset
         * @tc.desc      : Get the orientaion attribute
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_11", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_11";
            let currentFetchOp = nameFetchOps(testNum, "Pictures/Static/", "05.jpg", IMAGE_TYPE);
            let name = "jpg";
            let path = (await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_IMAGE)) + "create/";
            let type = IMAGE_TYPE;
            let key = "orientation";
            let val = 0;
            await checkCreatAssetProps(done, testNum, currentFetchOp, path, type, name, key, val);
        });

        // -------------------------------  image type end -----------------------------

        // ------------------------------- video type start ----------------------------
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_01
         * @tc.name      : createAsset
         * @tc.desc      : Insert two database records, read a unique identifier, expectations are not equal
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_01", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_01";
            let currentFetchOp = nameFetchOps(testNum, "Videos/Static/", "01.mp4", VIDEO_TYPE);
            let name = "mp4";
            let path = (await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_VIDEO)) + "create/";
            let type = VIDEO_TYPE;
            await creatAssetTest(done, testNum, currentFetchOp, path, type, name);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_02
         * @tc.name      : getFileAssets
         * @tc.desc      : Access to the file displayName and validation is not undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_02", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_02";
            let currentFetchOp = nameFetchOps(testNum, "Videos/Static/", "02.mp4", VIDEO_TYPE);
            let name = "mp4";
            let path = (await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_VIDEO)) + "create/";
            let type = VIDEO_TYPE;
            let key = "displayName";
            let val = "displayName";
            await checkCreatAssetProps(done, testNum, currentFetchOp, path, type, name, key, val);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_03
         * @tc.name      : getFileAssets
         * @tc.desc      : Access to the file relativePath  and validation is not undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_03", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_03";
            let currentFetchOp = nameFetchOps(testNum, "Videos/Static/", "03.mp4", VIDEO_TYPE);
            let name = "mp4";
            let path = (await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_VIDEO)) + "create/";
            let type = VIDEO_TYPE;
            let key = "relativePath";
            let val = path;
            await checkCreatAssetProps(done, testNum, currentFetchOp, path, type, name, key, val);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_07
         * @tc.name      : getFileAssets
         * @tc.desc      : Access to the file dateModified and validation is not undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_07", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_07";
            let currentFetchOp = fetchOps(testNum, "Videos/Dynamic/", VIDEO_TYPE);
            await checkdateModified(done, testNum, currentFetchOp);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_08
         * @tc.name      : createAsset
         * @tc.desc      : Insert a picture record, the retrieve attributes for images
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_08", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_08";
            let currentFetchOp = nameFetchOps(testNum, "Videos/Static/", "04.mp4", VIDEO_TYPE);
            let name = "mp4";
            let path = (await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_VIDEO)) + "create/";
            let type = VIDEO_TYPE;
            let key = "mediaType";
            let val = VIDEO_TYPE;
            await checkCreatAssetProps(done, testNum, currentFetchOp, path, type, name, key, val);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_11
         * @tc.name      : createAsset
         * @tc.desc      : Get the orientaion attribute
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_11", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_11";
            let currentFetchOp = nameFetchOps(testNum, "Videos/Static/", "05.mp4", VIDEO_TYPE);
            let name = "mp4";
            let path = (await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_VIDEO)) + "create/";
            let type = VIDEO_TYPE;
            let key = "orientation";
            let val = 0;
            await checkCreatAssetProps(done, testNum, currentFetchOp, path, type, name, key, val);
        });
        // -------------------------------  video type end -----------------------------

        // ------------------------------- audio type start ----------------------------
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_01
         * @tc.name      : createAsset
         * @tc.desc      : Insert two database records, read a unique identifier, expectations are not equal
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_01", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_01";
            let currentFetchOp = nameFetchOps(testNum, "Audios/Static/", "01.mp3", AUDIO_TYPE);
            let name = "mp3";
            let path = (await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_AUDIO)) + "create/";
            let type = AUDIO_TYPE;
            await creatAssetTest(done, testNum, currentFetchOp, path, type, name);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_02
         * @tc.name      : getFileAssets
         * @tc.desc      : Access to the file name and validation is not undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_02", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_02";
            let currentFetchOp = nameFetchOps(testNum, "Audios/Static/", "02.mp3", AUDIO_TYPE);
            let name = "mp3";
            let path = (await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_AUDIO)) + "create/";
            let type = AUDIO_TYPE;
            let key = "displayName";
            let val = "displayName";
            await checkCreatAssetProps(done, testNum, currentFetchOp, path, type, name, key, val);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_03
         * @tc.name      : getFileAssets
         * @tc.desc      : Access to the file relativePath  and validation is not undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_03", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_03";
            let currentFetchOp = nameFetchOps(testNum, "Audios/Static/", "03.mp3", AUDIO_TYPE);
            let name = "mp3";
            let path = (await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_AUDIO)) + "create/";
            let type = AUDIO_TYPE;
            let key = "relativePath";
            let val = path;
            await checkCreatAssetProps(done, testNum, currentFetchOp, path, type, name, key, val);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_07
         * @tc.name      : getFileAssets
         * @tc.desc      : Access to the file dateModified and validation is not undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_07", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_07";
            let currentFetchOp = fetchOps(testNum, "Audios/Dynamic/", AUDIO_TYPE);
            await checkdateModified(done, testNum, currentFetchOp);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_08
         * @tc.name      : createAsset
         * @tc.desc      : Insert a picture record, the retrieve attributes for images
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_08", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_08";
            let currentFetchOp = nameFetchOps(testNum, "Audios/Static/", "05.mp3", AUDIO_TYPE);
            let name = "mp3";
            let path = (await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_AUDIO)) + "create/";
            let type = AUDIO_TYPE;
            let key = "mediaType";
            let val = AUDIO_TYPE;
            await checkCreatAssetProps(done, testNum, currentFetchOp, path, type, name, key, val);
        });

        // -------------------------------  audio type end -----------------------------

        // ------------------------------ file type start ----------------------------
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_01
         * @tc.name      : createAsset
         * @tc.desc      : Insert two database records, read a unique identifier, expectations are not equal
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_01", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_01";
            let currentFetchOp = nameFetchOps(testNum, "Documents/Static/", "01.dat", FILE_TYPE);
            let name = "dat";
            let path = (await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_DOCUMENTS)) + "create/";
            let type = FILE_TYPE;
            await creatAssetTest(done, testNum, currentFetchOp, path, type, name);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_02
         * @tc.name      : getFileAssets
         * @tc.desc      : Access to the file name and validation is not undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_02", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_02";
            let currentFetchOp = nameFetchOps(testNum, "Documents/Static/", "02.dat", FILE_TYPE);
            let name = "dat";
            let path = (await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_DOCUMENTS)) + "create/";
            let type = FILE_TYPE;
            let key = "displayName";
            let val = "displayName";
            await checkCreatAssetProps(done, testNum, currentFetchOp, path, type, name, key, val);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_03
         * @tc.name      : getFileAssets
         * @tc.desc      : Access to the file relativePath  and validation is not undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_03", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_03";
            let currentFetchOp = nameFetchOps(testNum, "Documents/Static/", "03.dat", FILE_TYPE);
            let name = "dat";
            let path = (await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_DOCUMENTS)) + "create/";
            let type = FILE_TYPE;
            let key = "relativePath";
            let val = path;
            await checkCreatAssetProps(done, testNum, currentFetchOp, path, type, name, key, val);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_07
         * @tc.name      : getFileAssets
         * @tc.desc      : Access to the file dateModified and validation is not undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_07", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_07";
            let currentFetchOp = fetchOps(testNum, "Documents/Dynamic/", FILE_TYPE);
            await checkdateModified(done, testNum, currentFetchOp);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_08
         * @tc.name      : createAsset
         * @tc.desc      : Insert a picture record, the retrieve attributes for images
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_08", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_08";
            let currentFetchOp = nameFetchOps(testNum, "Documents/Static/", "04.dat", FILE_TYPE);
            let name = "dat";
            let path = (await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_DOCUMENTS)) + "create/";
            let type = FILE_TYPE;
            let key = "mediaType";
            let val = FILE_TYPE;
            await checkCreatAssetProps(done, testNum, currentFetchOp, path, type, name, key, val);
        });

        // -------------------------------  file type end -----------------------------
    });
}
