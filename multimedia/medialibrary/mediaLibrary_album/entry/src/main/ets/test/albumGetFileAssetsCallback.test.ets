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
import mediaLibrary from '@ohos.multimedia.mediaLibrary';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index';

import {
    sleep,
    IMAGE_TYPE,
    VIDEO_TYPE,
    AUDIO_TYPE,
    FILEKEY,
    allFetchOp,
    albumFetchOps,
    albumTwoTypesFetchOps,
    albumThreeTypesFetchOps,
    checkPresetsAssets,
    checkAlbumsCount,
    getPermission,
} from '../../../../../../common';

export default function albumGetFileAssetsCallbackTest(abilityContext) {
    describe('albumGetFileAssetsCallbackTest', function () {
        const media = mediaLibrary.getMediaLibrary(abilityContext);
        beforeAll(async function () {
            console.info('beforeAll case');
            await getPermission(null, abilityContext);
            await checkPresetsAssets(media, 'ActsMediaLibraryAlbumTest');
        });
        beforeEach(function () {
            console.info('beforeEach case');
        });
        afterEach(async function () {
            console.info('afterEach case');
            await sleep()
        });
        afterAll(function () {
            console.info('afterAll case');
        });

        const abnormalFetchOp = {
            selections: 'date_added < 0',
            selectionArgs: [],
            order: 'date_added DESC LIMIT 0,1',
        }

        const checkAlbumAssetsCount = async function (done, testNum, fetchOp, expectAssetsCount, expectAlbumCount = 1) {
            try {
                const albumList = await media.getAlbums(fetchOp);
                // check album length
                const albumCountPass = await checkAlbumsCount(done, testNum, albumList, expectAlbumCount);
                if (!albumCountPass) return;
                // one asset type
                
                let count = 0;
                for (const album of albumList) {
                    album.getFileAssets(allFetchOp({ order: `date_added DESC LIMIT 0,${expectAssetsCount}` }), (error, fetchFileResult) => {
                        if (fetchFileResult == undefined || error) {
                            console.info(`${testNum} fetchFileResult undefined or error, error: ${error}`)
                            expect(false).assertTrue();
                            done();
                            return;
                        }
                        count++;
                        console.info(`${testNum}, expectAssetsCount: ${expectAssetsCount} 
                                    getCount: ${fetchFileResult.getCount()}`)
                        expect(fetchFileResult.getCount()).assertEqual(expectAssetsCount);
                    });
                    await sleep(500)
                }
                await sleep(500)
                expect(count).assertEqual(expectAlbumCount);
                done();
            } catch (error) {
                console.info(`${testNum}, error: ${error}`)
                expect(false).assertTrue();
                done();
            }
        }

        const checkAlbumAssetsNoOps = async function (done, testNum, fetchOp, expectAssetsCount, expectAlbumCount = 1) {
            try {
                const albumList = await media.getAlbums(fetchOp);
                // check album length
                const albumCountPass = await checkAlbumsCount(done, testNum, albumList, expectAlbumCount);
                if (!albumCountPass) return;

                const album = albumList[0];

                album.getFileAssets(async (err, fetchFileResult) => {
                    if (fetchFileResult == undefined || err) {
                        console.info(`${testNum} fetchFileResult undefined or error, error: ${err}`)
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info(`${testNum}, getCount:expectAssetsCount - ${fetchFileResult.getCount()} : ${expectAssetsCount}`)
                    expect(fetchFileResult.getCount()).assertEqual(expectAssetsCount);
                    done();
                });

            } catch (error) {
                console.info(`${testNum}, error: ${error}`)
                expect(false).assertTrue();
                done();
            }
        }
        const abnormalAlbumAssetsCount = async function (done, testNum, fetchOp, expectAssetsCount, expectAlbumCount = 1) {
            try {
                const albumList = await media.getAlbums(fetchOp);
                // check album length
                const albumCountPass = await checkAlbumsCount(done, testNum, albumList, expectAlbumCount);
                if (!albumCountPass) return;
                const album = albumList[0];
                album.getFileAssets(abnormalFetchOp, (error, fetchFileResult) => {
                    if (fetchFileResult == undefined || error) {
                        console.info(`${testNum} fetchFileResult undefined or error, error: ${error}`)
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info(`${testNum}, getCount: ${fetchFileResult.getCount()}`)
                    console.info(`${testNum}, expectAssetsCount: ${expectAssetsCount}`)
                    expect(fetchFileResult.getCount()).assertEqual(expectAssetsCount);
                    done();
                });
            } catch (error) {
                console.info(`${testNum} error: ${error}`)
                expect(false).assertTrue();
                done();
            }
        }
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_001_01
         * @tc.name      : getFileAssets
         * @tc.desc      : Image type album get 3 resources
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_001_01', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_001_01';
            let assetsCount = 3;
            let currentFetchOp = albumFetchOps(testNum, 'Pictures/', 'Static', IMAGE_TYPE)
            await checkAlbumAssetsCount(done, testNum, currentFetchOp, assetsCount)
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_001_02
         * @tc.name      : getFileAssets
         * @tc.desc      : Audios type album get 3 resources
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_001_02', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_001_02';
            let assetsCount = 3;
            let currentFetchOp = albumFetchOps(testNum, 'Audios/', 'Static', AUDIO_TYPE)
            await checkAlbumAssetsCount(done, testNum, currentFetchOp, assetsCount)
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_001_03
         * @tc.name      : getFileAssets
         * @tc.desc      : Videos type album get 3 resources
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_001_03', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_001_03';
            let assetsCount = 3;
            let currentFetchOp = albumFetchOps(testNum, 'Videos/', 'Static', VIDEO_TYPE)
            await checkAlbumAssetsCount(done, testNum, currentFetchOp, assetsCount)
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_001_04
         * @tc.name      : getFileAssets
         * @tc.desc      : Pictures Videos types album get 3 resources
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_001_04', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_001_04';
            let assetsCount = 3;
            let currentFetchOp = albumTwoTypesFetchOps(testNum, ['Pictures/', 'Videos/'], 'Static', [IMAGE_TYPE, VIDEO_TYPE])
            let albumCount = 2;
            await checkAlbumAssetsCount(done, testNum, currentFetchOp, assetsCount, albumCount)
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_001_05
         * @tc.name      : getFileAssets
         * @tc.desc      : Pictures Audios types album get 3 resources
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_001_05', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_001_05';
            let assetsCount = 3;
            let currentFetchOp = albumTwoTypesFetchOps(testNum, ['Pictures/', 'Audios/'], 'Static', [IMAGE_TYPE, AUDIO_TYPE])
            let albumCount = 2;
            await checkAlbumAssetsCount(done, testNum, currentFetchOp, assetsCount, albumCount)
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_001_06
         * @tc.name      : getFileAssets
         * @tc.desc      : Videos Audios types album get 3 resources
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_001_06', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_001_06';
            let assetsCount = 3;
            let currentFetchOp = albumTwoTypesFetchOps(testNum, ['Videos/', 'Audios/'], 'Static', [VIDEO_TYPE, AUDIO_TYPE])
            let albumCount = 2;
            await checkAlbumAssetsCount(done, testNum, currentFetchOp, assetsCount, albumCount)
        });

        /** 
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_001_07
         * @tc.name      : getFileAssets
         * @tc.desc      : Pictures Videos Audios types album get 3 resources
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_001_07', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_001_07';
            let assetsCount = 3;
            let currentFetchOp = albumThreeTypesFetchOps(testNum, ['Pictures/', 'Videos/', 'Audios/'], 'Static', [IMAGE_TYPE, VIDEO_TYPE, AUDIO_TYPE])
            let albumCount = 3;
            await checkAlbumAssetsCount(done, testNum, currentFetchOp, assetsCount, albumCount)
        });

        /**
        * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_002_01
        * @tc.name      : getFileAssets
        * @tc.desc      : Image type album get 1 resources
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_002_01', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_002_01';
            let assetsCount = 1;
            let currentFetchOp = albumFetchOps(testNum, 'Pictures/', 'Static', IMAGE_TYPE)
            await checkAlbumAssetsCount(done, testNum, currentFetchOp, assetsCount)
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_002_02
         * @tc.name      : getFileAssets
         * @tc.desc      : Audios type album get 1 resources
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_002_02', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_002_02';
            let assetsCount = 1;
            let currentFetchOp = albumFetchOps(testNum, 'Audios/', 'Static', AUDIO_TYPE)
            await checkAlbumAssetsCount(done, testNum, currentFetchOp, assetsCount)
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_002_03
         * @tc.name      : getFileAssets
         * @tc.desc      : Videos type album get 1 resources
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_002_03', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_002_03';
            let assetsCount = 1;
            let currentFetchOp = albumFetchOps(testNum, 'Videos/', 'Static', VIDEO_TYPE)
            await checkAlbumAssetsCount(done, testNum, currentFetchOp, assetsCount)
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_002_04
         * @tc.name      : getFileAssets
         * @tc.desc      : Pictures Videos types album get 1 resources
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_002_04', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_002_04';
            let assetsCount = 1;
            let currentFetchOp = albumTwoTypesFetchOps(testNum, ['Pictures/', 'Videos/'], 'Static', [IMAGE_TYPE, VIDEO_TYPE])
            let albumCount = 2;
            await checkAlbumAssetsCount(done, testNum, currentFetchOp, assetsCount, albumCount)
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_002_05
         * @tc.name      : getFileAssets
         * @tc.desc      : Pictures Audios types album get 1 resources
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_002_05', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_002_05';
            let assetsCount = 1;
            let currentFetchOp = albumTwoTypesFetchOps(testNum, ['Pictures/', 'Audios/'], 'Static', [IMAGE_TYPE, AUDIO_TYPE],)
            let albumCount = 2;
            await checkAlbumAssetsCount(done, testNum, currentFetchOp, assetsCount, albumCount)
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_002_06
         * @tc.name      : getFileAssets
         * @tc.desc      : Videos Audios types album get 1 resources
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_002_06', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_002_06';
            let assetsCount = 1;
            let currentFetchOp = albumTwoTypesFetchOps(testNum, ['Videos/', 'Audios/'], 'Static', [VIDEO_TYPE, AUDIO_TYPE])
            let albumCount = 2;
            await checkAlbumAssetsCount(done, testNum, currentFetchOp, assetsCount, albumCount)
        });

        /** 
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_002_07
         * @tc.name      : getFileAssets
         * @tc.desc      : Pictures Videos Audios types album get 1 resources
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_002_07', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_002_07';
            let assetsCount = 1;
            let currentFetchOp = albumThreeTypesFetchOps(testNum, ['Pictures/', 'Videos/', 'Audios/'], 'Static',
                [IMAGE_TYPE, VIDEO_TYPE, AUDIO_TYPE])
            let albumCount = 3;
            await checkAlbumAssetsCount(done, testNum, currentFetchOp, assetsCount, albumCount)
        });


        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_003_01
         * @tc.name      : getFileAssets
         * @tc.desc      : no file type image
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_003_01', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_003_01';
            let currentFetchOp = albumFetchOps(testNum, 'Pictures/', 'Static', IMAGE_TYPE)
            let assetsCount = 0;
            await abnormalAlbumAssetsCount(done, testNum, currentFetchOp, assetsCount)
        });

        /**
        * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_003_02
        * @tc.name      : getFileAssets
        * @tc.desc      : no file type image
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_003_02', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_003_02';
            let currentFetchOp = albumFetchOps(testNum, 'Videos/', 'Static', VIDEO_TYPE)
            let assetsCount = 0;
            await abnormalAlbumAssetsCount(done, testNum, currentFetchOp, assetsCount)
        });

        /**
        * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_003_03
        * @tc.name      : getFileAssets
        * @tc.desc      : no file type image
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_003_03', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_003_03';
            let currentFetchOp = albumFetchOps(testNum, 'Audios/', 'Static', AUDIO_TYPE)
            let assetsCount = 0;
            await abnormalAlbumAssetsCount(done, testNum, currentFetchOp, assetsCount)
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_004_01
         * @tc.name      : getFileAssets
         * @tc.desc      : Image type getFileAssets by no ops
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_004_01', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_004_01';
            let assetsCount = 5;
            let currentFetchOp = albumFetchOps(testNum, 'Pictures/', 'Static', IMAGE_TYPE)
            await checkAlbumAssetsNoOps(done, testNum, currentFetchOp, assetsCount)
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_004_02
         * @tc.name      : getFileAssets
         * @tc.desc      : Audios type getFileAssets by no ops
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_004_02', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_004_02';
            let assetsCount = 5;
            let currentFetchOp = albumFetchOps(testNum, 'Audios/', 'Static', AUDIO_TYPE)
            await checkAlbumAssetsNoOps(done, testNum, currentFetchOp, assetsCount)
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_004_03
         * @tc.name      : getFileAssets
         * @tc.desc      : Videos type getFileAssets by no ops
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_004_03', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_ALBUM_GET_ASSETS_CALLBACK_004_03';
            let assetsCount = 5;
            let currentFetchOp = albumFetchOps(testNum, 'Videos/', 'Static', VIDEO_TYPE)
            await checkAlbumAssetsNoOps(done, testNum, currentFetchOp, assetsCount)
        });
    });
}