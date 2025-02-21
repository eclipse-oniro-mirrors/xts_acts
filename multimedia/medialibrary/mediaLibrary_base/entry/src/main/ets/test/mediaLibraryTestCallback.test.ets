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
    FILEKEY,
    checkPresetsAssets,
    checkAssetsCount,
    fetchOps,
    getPermission,
    isNum,
} from "../../../../../../common";

export default function mediaLibraryTestCallback(abilityContext) {
    describe("mediaLibraryTestCallback", function () {
        const media = mediaLibrary.getMediaLibrary(abilityContext);
        beforeAll(async function () {
            console.info("beforeAll case");
            await getPermission(null, abilityContext);
            await checkPresetsAssets(media, "ActsMediaLibraryBaseTest");
        });
        beforeEach(function () {
            console.info("beforeEach case");
        });
        afterEach(async function () {
            console.info("afterEach case");
            await sleep(500);
        });
        afterAll(function () {
            console.info("afterAll case");
        });

        let imageAndVideofetchOp = {
            selections:
                "(" +
                FILEKEY.RELATIVE_PATH +
                "= ? or " +
                FILEKEY.RELATIVE_PATH +
                "= ?" +
                ") AND (" +
                FILEKEY.MEDIA_TYPE +
                "= ? or " +
                FILEKEY.MEDIA_TYPE +
                "= ?)",
            selectionArgs: ["Videos/Static/", "Pictures/Static/", IMAGE_TYPE.toString(), VIDEO_TYPE.toString()],
        };
        let imageAndVideoAndfilefetchOp = {
            selections:
                "(" +
                FILEKEY.RELATIVE_PATH +
                "= ? or " +
                FILEKEY.RELATIVE_PATH +
                "= ? or " +
                FILEKEY.RELATIVE_PATH +
                "= ?" +
                ") AND (" +
                FILEKEY.MEDIA_TYPE +
                "= ? or " +
                FILEKEY.MEDIA_TYPE +
                "= ? or " +
                FILEKEY.MEDIA_TYPE +
                "= ?)",
            selectionArgs: [
                "Documents/Static/",
                "Videos/Static/",
                "Pictures/Static/",
                IMAGE_TYPE.toString(),
                VIDEO_TYPE.toString(),
                FILE_TYPE.toString(),
            ],
            order: FILEKEY.DATE_ADDED + " DESC",
        };
        let imageAndVideoAndfileAndAudiofetchOp = {
            selections:
                "(" +
                FILEKEY.RELATIVE_PATH +
                "= ? or " +
                FILEKEY.RELATIVE_PATH +
                "= ? or " +
                FILEKEY.RELATIVE_PATH +
                "= ? or " +
                FILEKEY.RELATIVE_PATH +
                "= ?" +
                ") AND (" +
                FILEKEY.MEDIA_TYPE +
                "= ? or " +
                FILEKEY.MEDIA_TYPE +
                "= ? or " +
                FILEKEY.MEDIA_TYPE +
                "= ? or " +
                FILEKEY.MEDIA_TYPE +
                "= ?)",
            selectionArgs: [
                "Documents/Static/",
                "Videos/Static/",
                "Pictures/Static/",
                "Audios/Static/",
                IMAGE_TYPE.toString(),
                VIDEO_TYPE.toString(),
                FILE_TYPE.toString(),
                AUDIO_TYPE.toString(),
            ],
            order: FILEKEY.DATE_ADDED + " DESC",
        };

        async function copyFile(fd1, fd2) {
            let stat = await fileio.fstat(fd1);
            let buf = new ArrayBuffer(stat.size);
            await fileio.read(fd1, buf);
            await fileio.write(fd2, buf);
        }

        const props = {
            image: {
                mimeType: "image/*",
                displayName: "01.jpg",
                relativePath: "Pictures/Static/",
                size: 348113,
                mediaType: IMAGE_TYPE.toString(),
                title: "01",
                width: 1279,
                height: 1706,
                orientation: 0,
                duration: "0",
                albumId: "1118",
            },
            video: {
                mimeType: "video/mp4",
                displayName: "01.mp4",
                relativePath: "Videos/Static/",
                size: 4853005,
                mediaType: VIDEO_TYPE.toString(),
                title: "01",
                width: 1280,
                height: 720,
                orientation: 0,
                duration: "10100",
            },
            audio: {
                mimeType: "audio/mpeg",
                displayName: "01.mp3",
                relativePath: "Audios/Static/",
                size: 1958311,
                mediaType: AUDIO_TYPE.toString(),
                title: "test",
                artist: "元数据测试",
                orientation: 0,
                duration: "219600",
            },
            file: {
                mimeType: "file/*",
                displayName: "01.dat",
                relativePath: "Documents/Static/",
                size: 10,
                mediaType: FILE_TYPE.toString(),
                title: "01",
                width: 0,
                height: 0,
                orientation: 0,
                duration: "0",
            },
        };

        async function checkFileAssetAttr(done, testNum, fetchOps, type, count, typesArr) {
            try {
                const fetchFileResult = await media.getFileAssets(fetchOps);
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, count);
                if (!checkAssetCountPass) return;
                fetchFileResult.getFirstObject(async (err, asset) => {
                    if (err) {
                        console.info(`${testNum} err : ${err}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    if (count > 1) {
                        type = asset.mimeType.match(/[a-z]+/g)[0];
                    }
                    if (type == "audio") {
                        expect(asset.artist).assertEqual(props[type].artist);
                    }
                    if (typesArr) {
                        let assetList = await fetchFileResult.getAllObject();
                        for (const assetItem of assetList) {
                            expect(typesArr.includes(assetItem.mimeType)).assertTrue();
                        }
                    }
                    if (!isNum(asset.dateTaken)) {
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    expect(asset.mimeType).assertEqual(props[type].mimeType);
                    expect(asset.displayName).assertEqual(props[type].displayName);
                    expect(asset.relativePath).assertEqual(props[type].relativePath);
                    expect(asset.size).assertEqual(props[type].size);
                    expect(asset.mediaType.toString()).assertEqual(props[type].mediaType);
                    expect(asset.title.toString()).assertEqual(props[type].title);
                    if (type != "audio") {
                        expect(asset.width).assertEqual(props[type].width);
                        expect(asset.height).assertEqual(props[type].height);
                    }
                    expect(asset.orientation).assertEqual(props[type].orientation);
                    expect(asset.duration.toString()).assertEqual(props[type].duration);
                    done();
                });
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        const checkGetPublicDirectory = async (done, testNum, dir, val) => {
            try {
                media.getPublicDirectory(dir, async (err, res) => {
                    if (err) {
                        console.info(`${testNum} err : ${err}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    expect(res).assertEqual(val);
                    done();
                });
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        };

        const getFileAssetsAbnormal = async (done, testNum, fetchOps) => {
            try {
                media.getFileAssets(fetchOps, async (err) => {
                    if (err) {
                        console.info(`${testNum} err : ${err}`);
                        expect(true).assertTrue();
                        done();
                        return;
                    }
                    expect(false).assertTrue();
                    done();
                });
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(true).assertTrue();
                done();
            }
        };
        const getFileAssetsZero = async (done, testNum, fetchOps) => {
            try {
                media.getFileAssets(fetchOps, async (err, fetchFileResult) => {
                    if (err) {
                        console.info(`${testNum} err : ${err}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, 0);
                    expect(checkAssetCountPass).assertTrue();
                    done();
                });
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        };

        const createAssetTest = async (done, testNum, fetchOps, type, name, path) => {
            try {
                const fetchFileResult = await media.getFileAssets(fetchOps);
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, 1);
                if (!checkAssetCountPass) return;
                let asset = await fetchFileResult.getFirstObject();
                media.createAsset(type, name, path, async (err, creatAsset) => {
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
                    await asset.close(fd);
                    expect(true).assertTrue();
                    done();
                });
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        };

        const createAssetSameNameTest = async (done, testNum, fetchOps, type, name, path) => {
            try {
                const fetchFileResult = await media.getFileAssets(fetchOps);
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, 1);
                if (!checkAssetCountPass) return;
                let asset = await fetchFileResult.getFirstObject();
                const creatAsset = await media.createAsset(type, name, path);
                const fd = await asset.open("rw");
                const creatAssetFd = await creatAsset.open("rw");
                await copyFile(fd, creatAssetFd);
                await creatAsset.close(creatAssetFd);
                await asset.close(fd);
                try {
                    media.createAsset(type, name, path, async (err, creatAsset) => {
                        if (err != undefined) {
                            expect(true).assertTrue();
                            done();
                            return;
                        }
                        expect(false).assertTrue();
                        done();
                    });
                } catch (error) {
                    console.info(`${testNum}:: error :${error}`);
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        };

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_001
         * @tc.name      : getFileAssets
         * @tc.desc      : query all assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_001", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_001";
            let currentFetchOps = fetchOps(testNum, "Pictures/Static/", IMAGE_TYPE);
            let type = "image";
            let count = 1;
            await checkFileAssetAttr(done, testNum, currentFetchOps, type, count, null);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_002
         * @tc.name      : getFileAssets
         * @tc.desc      : query all assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_002", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_002";
            let currentFetchOps = fetchOps(testNum, "Videos/Static/", VIDEO_TYPE);
            let type = "video";
            let count = 1;
            await checkFileAssetAttr(done, testNum, currentFetchOps, type, count, null);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_003
         * @tc.name      : getFileAssets
         * @tc.desc      : query all assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_003", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_003";
            let currentFetchOps = fetchOps(testNum, "Audios/Static/", AUDIO_TYPE);
            let type = "audio";
            let count = 1;
            await checkFileAssetAttr(done, testNum, currentFetchOps, type, count, null);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_004
         * @tc.name      : getFileAssets
         * @tc.desc      : query all assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_004", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_004";
            let currentFetchOps = fetchOps(testNum, "Documents/Static/", FILE_TYPE);
            let type = "file";
            let count = 1;
            await checkFileAssetAttr(done, testNum, currentFetchOps, type, count, null);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_005
         * @tc.name      : getFileAssets
         * @tc.desc      : query all assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_005", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_005";
            let currentFetchOps = imageAndVideofetchOp;
            let type = "video";
            let count = 2;
            let typesArr = ["image/*", "video/mp4"];
            await checkFileAssetAttr(done, testNum, currentFetchOps, type, count, typesArr);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_006
         * @tc.name      : getFileAssets
         * @tc.desc      : query all assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_006", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_006";
            let currentFetchOps = imageAndVideoAndfilefetchOp;
            let type = "file";
            let count = 3;
            let typesArr = ["image/*", "video/mp4", "file/*"];
            await checkFileAssetAttr(done, testNum, currentFetchOps, type, count, typesArr);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_007
         * @tc.name      : getFileAssets
         * @tc.desc      : query all assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_007", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_007";
            let currentFetchOps = imageAndVideoAndfileAndAudiofetchOp;
            let type = "audio";
            let count = 4;
            let typesArr = ["image/*", "video/mp4", "file/*", "audio/mpeg"];
            await checkFileAssetAttr(done, testNum, currentFetchOps, type, count, typesArr);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_008
         * @tc.name      : getFileAssets
         * @tc.desc      : query all assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_008", 0, async function (done) {
            let currentFetchOps = {
                selections: FILEKEY.MEDIA_TYPE + "= ?",
                selectionArgs: [],
            };
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_008";
            await getFileAssetsZero(done, testNum, currentFetchOps);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_009
         * @tc.name      : getFileAssets
         * @tc.desc      : query all assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_009", 0, async function (done) {
            let currentFetchOps = {
                selections: FILEKEY.MEDIA_TYPE + "abc= ?",
                selectionArgs: [AUDIO_TYPE.toString()],
            };
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_009";
            await getFileAssetsAbnormal(done, testNum, currentFetchOps);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_010
         * @tc.name      : getFileAssets
         * @tc.desc      : query all assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_010", 0, async function (done) {
            let currentFetchOps = {
                selections: FILEKEY.MEDIA_TYPE + "= ?",
                selectionArgs: [111],
            };
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_010";
            await getFileAssetsZero(done, testNum, currentFetchOps);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_011
         * @tc.name      : getFileAssets
         * @tc.desc      : query all assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_011", 0, async function (done) {
            let currentFetchOps = {
                selections: "abc" + "= ?",
                selectionArgs: [AUDIO_TYPE.toString()],
            };
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETFILEASSETS_011";
            await getFileAssetsAbnormal(done, testNum, currentFetchOps);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETPUBLICDIRECTORY_001
         * @tc.name      : getPublicDirectory
         * @tc.desc      : getPublicDirectory DIR_CAMERA
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETPUBLICDIRECTORY_001", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETPUBLICDIRECTORY_001";
            let dir = mediaLibrary.DirectoryType.DIR_CAMERA;
            let val = "Camera/";
            await checkGetPublicDirectory(done, testNum, dir, val);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETPUBLICDIRECTORY_002
         * @tc.name      : getPublicDirectory
         * @tc.desc      : getPublicDirectory DIR_VIDEO
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETPUBLICDIRECTORY_002", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETPUBLICDIRECTORY_002";
            let dir = mediaLibrary.DirectoryType.DIR_VIDEO;
            let val = "Videos/";
            await checkGetPublicDirectory(done, testNum, dir, val);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETPUBLICDIRECTORY_003
         * @tc.name      : getPublicDirectory
         * @tc.desc      : getPublicDirectory DIR_IMAGE
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETPUBLICDIRECTORY_003", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETPUBLICDIRECTORY_003";
            let dir = mediaLibrary.DirectoryType.DIR_IMAGE;
            let val = "Pictures/";
            await checkGetPublicDirectory(done, testNum, dir, val);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETPUBLICDIRECTORY_004
         * @tc.name      : getPublicDirectory
         * @tc.desc      : getPublicDirectory DIR_AUDIO
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETPUBLICDIRECTORY_004", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETPUBLICDIRECTORY_004";
            let dir = mediaLibrary.DirectoryType.DIR_AUDIO;
            let val = "Audios/";
            await checkGetPublicDirectory(done, testNum, dir, val);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETPUBLICDIRECTORY_005
         * @tc.name      : getPublicDirectory
         * @tc.desc      : getPublicDirectory DIR_IMAGE
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETPUBLICDIRECTORY_005", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETPUBLICDIRECTORY_005";
            let dir = mediaLibrary.DirectoryType.DIR_DOCUMENTS;
            let val = "Documents/";
            await checkGetPublicDirectory(done, testNum, dir, val);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETPUBLICDIRECTORY_006
         * @tc.name      : getPublicDirectory
         * @tc.desc      : getPublicDirectory 110
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETPUBLICDIRECTORY_006", 0, async function (done) {
            try {
                await media.getPublicDirectory(110);
                console.info("MediaLibraryTest : getPublicDirectory 006 failed");
                expect(false).assertTrue();
                done();
            } catch (error) {
                console.info("MediaLibraryTest : getPublicDirectory 006 passed");
                expect(true).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETPUBLICDIRECTORY_007
         * @tc.name      : getPublicDirectory
         * @tc.desc      : getPublicDirectory DIR_DOWNLOAD
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETPUBLICDIRECTORY_007", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CALLBACK_GETPUBLICDIRECTORY_007";
            let dir = mediaLibrary.DirectoryType.DIR_DOWNLOAD;
            let val = "Download/";
            await checkGetPublicDirectory(done, testNum, dir, val);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CALLBACK_CREATEASSET_001
         * @tc.name      : createAsset
         * @tc.desc      : Create File Asset image (does not exist)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CALLBACK_CREATEASSET_001", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CALLBACK_CREATEASSET_001";
            let currentFetchOps = fetchOps(testNum, "Pictures/Static/", IMAGE_TYPE);
            let type = IMAGE_TYPE;
            let name = new Date().getTime() + ".jpg";
            let path = "Pictures/Create/";
            await createAssetTest(done, testNum, currentFetchOps, type, name, path);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CALLBACK_CREATEASSET_002
         * @tc.name      : createAsset
         * @tc.desc      : Create File Asset image (existed)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CALLBACK_CREATEASSET_002", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CALLBACK_CREATEASSET_002";
            let currentFetchOps = fetchOps(testNum, "Pictures/Static/", IMAGE_TYPE);
            let type = IMAGE_TYPE;
            let name = new Date().getTime() + ".jpg";
            let path = "Pictures/Create/";
            await createAssetSameNameTest(done, testNum, currentFetchOps, type, name, path);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CALLBACK_CREATEASSET_003
         * @tc.name      : createAsset
         * @tc.desc      : Create File Asset video (does not exist)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CALLBACK_CREATEASSET_003", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CALLBACK_CREATEASSET_003";
            let currentFetchOps = fetchOps(testNum, "Videos/Static/", VIDEO_TYPE);
            let type = VIDEO_TYPE;
            let name = new Date().getTime() + ".mp4";
            let path = "Videos/Create/";
            await createAssetTest(done, testNum, currentFetchOps, type, name, path);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CALLBACK_CREATEASSET_004
         * @tc.name      : createAsset
         * @tc.desc      : Create File Asset video (existed)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CALLBACK_CREATEASSET_004", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CALLBACK_CREATEASSET_004";
            let currentFetchOps = fetchOps(testNum, "Videos/Static/", VIDEO_TYPE);
            let type = VIDEO_TYPE;
            let name = new Date().getTime() + ".mp4";
            let path = "Videos/Create/";
            await createAssetSameNameTest(done, testNum, currentFetchOps, type, name, path);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CALLBACK_CREATEASSET_005
         * @tc.name      : createAsset
         * @tc.desc      : Create File Asset audio (does not exist)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CALLBACK_CREATEASSET_005", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CALLBACK_CREATEASSET_005";
            let currentFetchOps = fetchOps(testNum, "Audios/Static/", AUDIO_TYPE);
            let type = AUDIO_TYPE;
            let name = new Date().getTime() + ".mp3";
            let path = "Audios/Create/";
            await createAssetTest(done, testNum, currentFetchOps, type, name, path);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CALLBACK_CREATEASSET_006
         * @tc.name      : createAsset
         * @tc.desc      : Create File Asset audio (existed)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CALLBACK_CREATEASSET_006", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CALLBACK_CREATEASSET_006";
            let currentFetchOps = fetchOps(testNum, "Audios/Static/", AUDIO_TYPE);
            let type = AUDIO_TYPE;
            let name = new Date().getTime() + ".mp3";
            let path = "Audios/Create/";
            await createAssetSameNameTest(done, testNum, currentFetchOps, type, name, path);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CALLBACK_CREATEASSET_007
         * @tc.name      : createAsset
         * @tc.desc      : Create File Asset file (does not exist)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CALLBACK_CREATEASSET_007", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CALLBACK_CREATEASSET_007";
            let currentFetchOps = fetchOps(testNum, "Documents/Static/", FILE_TYPE);
            let type = FILE_TYPE;
            let name = new Date().getTime() + ".dat";
            let path = "Documents/Create/";
            await createAssetTest(done, testNum, currentFetchOps, type, name, path);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CALLBACK_CREATEASSET_008
         * @tc.name      : createAsset
         * @tc.desc      : Create File Asset file (existed)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CALLBACK_CREATEASSET_008", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CALLBACK_CREATEASSET_008";
            let currentFetchOps = fetchOps(testNum, "Documents/Static/", FILE_TYPE);
            let type = FILE_TYPE;
            let name = new Date().getTime() + ".dat";
            let path = "Documents/Create/";
            await createAssetSameNameTest(done, testNum, currentFetchOps, type, name, path);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CALLBACK_CREATEASSET_009
         * @tc.name      : createAsset
         * @tc.desc      : Create File Asset image (does not exist)
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_CALLBACK_CREATEASSET_009", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_CALLBACK_CREATEASSET_009";
            let currentFetchOps = fetchOps(testNum, "Pictures/Static/", IMAGE_TYPE);
            let type = IMAGE_TYPE;
            let name = new Date().getTime() + ".jpg";
            let path = "Pictures/Create/Temp";
            await createAssetTest(done, testNum, currentFetchOps, type, name, path);
        });
    });
}
