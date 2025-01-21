/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
    getPermission,
    pushCreateAsset,
} from '../../../../../../common';

export default function provisionResourcesTest(abilityContext) {
    describe('provisionResourcesTest', function () {
        const media = mediaLibrary.getMediaLibrary(abilityContext);
        let assetCount = 0;
        
        beforeAll(async function () {
            console.info('beforeAll case');
            await getPermission(null, abilityContext);
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

        const checkResourceAsset = async function (done, testNum, fileNames) {
            try {
                let allFetchOp = {
                    selections: mediaLibrary.FileKey.MEDIA_TYPE + '= ? OR ' 
                    + mediaLibrary.FileKey.MEDIA_TYPE + '= ? OR ' 
                    + mediaLibrary.FileKey.MEDIA_TYPE + '= ? OR ' 
                    + mediaLibrary.FileKey.MEDIA_TYPE + '= ? ',
                    selectionArgs: [
                        mediaLibrary.MediaType.IMAGE.toString(), 
                        mediaLibrary.MediaType.VIDEO.toString(), 
                        mediaLibrary.MediaType.AUDIO.toString(), 
                        mediaLibrary.MediaType.FILE.toString()
                    ],
                };
                media.getFileAssets(allFetchOp).then((fetchFileResult) => {
                    const count = fetchFileResult.getCount();
                    assetCount += fileNames.length;
                    expect(count).assertEqual(assetCount);
                    console.info(`${testNum} Get fetchFileResult successfully, count: ${count}`);
                    fetchFileResult.close();
                    done();
                }).catch((error) => {
                    console.info(`${testNum} getFileAssets failed with, error: ${error}`)
                    expect(false).assertTrue();
                    done();
                });
            } catch (error) {
                console.info(`${testNum} checkResourceAsset failed, error: ${error}`)
                expect(false).assertTrue();
                done();
            }
        }        

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILERESULT_PROVISION_CHECK_ASSETS_0100
         * @tc.name      : sub_media_medialibrary_fileresult_provision_check_assets_001
         * @tc.desc      : Provision mediaAssets and check mediaAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('sub_media_medialibrary_fileresult_provision_check_assets_001', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_FILERESULT_PROVISION_CHECK_ASSETS_0100';
            const fileNames = [
                "01.jpg", "02.jpg", "03.jpg", "04.jpg", "01.mp3", "02.mp3"
            ];
            const directoryTypes = [
                2, 2, 2, 2, 3, 3
            ];
            const targetDirs = [
                "Static/", "Static/", "Static/", "Static/", "Static/", "Static/"
            ];
            await pushCreateAsset(media, abilityContext, fileNames, directoryTypes, targetDirs);
            await checkResourceAsset(done, testNum, fileNames);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILERESULT_PROVISION_CHECK_ASSETS_0200
         * @tc.name      : sub_media_medialibrary_fileresult_provision_check_assets_002
         * @tc.desc      : Provision mediaAssets and check mediaAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('sub_media_medialibrary_fileresult_provision_check_assets_002', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_FILERESULT_PROVISION_CHECK_ASSETS_0200';
            const fileNames = [
                "03.mp3", "04.mp3", "01.mp4", "02.mp4", "03.mp4", "04.mp4"
            ];
            const directoryTypes = [
                3, 3, 1, 1, 1, 1
            ];
            const targetDirs = [
                "Static/", "Static/", "Static/", "Static/", "Static/", "Static/"
            ];
            await pushCreateAsset(media, abilityContext, fileNames, directoryTypes, targetDirs);
            await checkResourceAsset(done, testNum, fileNames);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILERESULT_PROVISION_CHECK_ASSETS_0300
         * @tc.name      : sub_media_medialibrary_fileresult_provision_check_assets_003
         * @tc.desc      : Provision mediaAssets and check mediaAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('sub_media_medialibrary_fileresult_provision_check_assets_003', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_FILERESULT_PROVISION_CHECK_ASSETS_0300';
            const fileNames = [ 
                "01.dat", "02.dat", "03.dat", "04.dat", "05.dat", "06.dat", "07.dat", "08.dat", "09.dat", "010.dat"
            ];
            const directoryTypes = [
                4, 4, 4, 4, 4, 4, 4, 4, 4, 4
            ];
            const targetDirs = [
                "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/"
            ];
            await pushCreateAsset(media, abilityContext, fileNames, directoryTypes, targetDirs);
            await checkResourceAsset(done, testNum, fileNames);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILERESULT_PROVISION_CHECK_ASSETS_0400
         * @tc.name      : sub_media_medialibrary_fileresult_provision_check_assets_004
         * @tc.desc      : Provision mediaAssets and check mediaAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('sub_media_medialibrary_fileresult_provision_check_assets_004', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_FILERESULT_PROVISION_CHECK_ASSETS_0400';
            const fileNames = [ 
                "011.dat", "012.dat", "013.dat", "014.dat", "015.dat", "016.dat", "017.dat", "018.dat", "019.dat", "020.dat"
            ];
            const directoryTypes = [
                4, 4, 4, 4, 4, 4, 4, 4, 4, 4
            ];
            const targetDirs = [
                "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/"
            ];
            await pushCreateAsset(media, abilityContext, fileNames, directoryTypes, targetDirs);
            await checkResourceAsset(done, testNum, fileNames);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILERESULT_PROVISION_CHECK_ASSETS_0500
         * @tc.name      : sub_media_medialibrary_fileresult_provision_check_assets_005
         * @tc.desc      : Provision mediaAssets and check mediaAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('sub_media_medialibrary_fileresult_provision_check_assets_005', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_FILERESULT_PROVISION_CHECK_ASSETS_0500';
            const fileNames = [
                "021.dat", "022.dat", "023.dat", "024.dat", "025.dat", "026.dat", "027.dat", "028.dat", "029.dat", "030.dat", 
            ];
            const directoryTypes = [
                4, 4, 4, 4, 4, 4, 4, 4, 4, 4
            ];
            const targetDirs = [
                "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/"
            ];
            await pushCreateAsset(media, abilityContext, fileNames, directoryTypes, targetDirs);
            await checkResourceAsset(done, testNum, fileNames);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILERESULT_PROVISION_CHECK_ASSETS_0600
         * @tc.name      : sub_media_medialibrary_fileresult_provision_check_assets_006
         * @tc.desc      : Provision mediaAssets and check mediaAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('sub_media_medialibrary_fileresult_provision_check_assets_006', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_FILERESULT_PROVISION_CHECK_ASSETS_0600';
            const fileNames = [ 
                "031.dat", "032.dat", "033.dat", "034.dat", "035.dat", "036.dat", "037.dat", "038.dat", "039.dat", "040.dat"
            ];
            const directoryTypes = [
                4, 4, 4, 4, 4, 4, 4, 4, 4, 4
            ];
            const targetDirs = [
                "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/"
            ];
            await pushCreateAsset(media, abilityContext, fileNames, directoryTypes, targetDirs);
            await checkResourceAsset(done, testNum, fileNames);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILERESULT_PROVISION_CHECK_ASSETS_0700
         * @tc.name      : sub_media_medialibrary_fileresult_provision_check_assets_007
         * @tc.desc      : Provision mediaAssets and check mediaAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('sub_media_medialibrary_fileresult_provision_check_assets_007', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_FILERESULT_PROVISION_CHECK_ASSETS_0700';
            const fileNames = [
                "041.dat", "042.dat", "043.dat", "044.dat", "045.dat", "046.dat", "047.dat", "048.dat", "049.dat", "050.dat"
            ];
            const directoryTypes = [
                4, 4, 4, 4, 4, 4, 4, 4, 4, 4
            ];
            const targetDirs = [
                "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/"
            ];
            await pushCreateAsset(media, abilityContext, fileNames, directoryTypes, targetDirs);
            await checkResourceAsset(done, testNum, fileNames);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILERESULT_PROVISION_CHECK_ASSETS_0800
         * @tc.name      : sub_media_medialibrary_fileresult_provision_check_assets_008
         * @tc.desc      : Provision mediaAssets and check mediaAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('sub_media_medialibrary_fileresult_provision_check_assets_008', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_FILERESULT_PROVISION_CHECK_ASSETS_0800';
            const fileNames = [
                "051.dat", "052.dat", "053.dat", "054.dat", "055.dat", "056.dat", "057.dat", "058.dat", "059.dat", "060.dat"
            ];
            const directoryTypes = [
                4, 4, 4, 4, 4, 4, 4, 4, 4, 4
            ];
            const targetDirs = [
                "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/"
            ];
            await pushCreateAsset(media, abilityContext, fileNames, directoryTypes, targetDirs);
            await checkResourceAsset(done, testNum, fileNames);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILERESULT_PROVISION_CHECK_ASSETS_0900
         * @tc.name      : sub_media_medialibrary_fileresult_provision_check_assets_009
         * @tc.desc      : Provision mediaAssets and check mediaAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('sub_media_medialibrary_fileresult_provision_check_assets_009', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_FILERESULT_PROVISION_CHECK_ASSETS_0900';
            const fileNames = [ 
                "061.dat", "062.dat", "063.dat", "064.dat", "065.dat", "066.dat", "067.dat", "068.dat", "069.dat", "070.dat"
            ];
            const directoryTypes = [
                4, 4, 4, 4, 4, 4, 4, 4, 4, 4
            ];
            const targetDirs = [
                "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/"
            ];
            await pushCreateAsset(media, abilityContext, fileNames, directoryTypes, targetDirs);
            await checkResourceAsset(done, testNum, fileNames);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILERESULT_PROVISION_CHECK_ASSETS_1000
         * @tc.name      : sub_media_medialibrary_fileresult_provision_check_assets_010
         * @tc.desc      : Provision mediaAssets and check mediaAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('sub_media_medialibrary_fileresult_provision_check_assets_010', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_FILERESULT_PROVISION_CHECK_ASSETS_1000';
            const fileNames = [ 
                "071.dat", "072.dat", "073.dat", "074.dat", "075.dat", "076.dat", "077.dat", "078.dat", "079.dat", "080.dat"
            ];
            const directoryTypes = [
                4, 4, 4, 4, 4, 4, 4, 4, 4, 4
            ];
            const targetDirs = [
                "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/"
            ];
            await pushCreateAsset(media, abilityContext, fileNames, directoryTypes, targetDirs);
            await checkResourceAsset(done, testNum, fileNames);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILERESULT_PROVISION_CHECK_ASSETS_1100
         * @tc.name      : sub_media_medialibrary_fileresult_provision_check_assets_011
         * @tc.desc      : Provision mediaAssets and check mediaAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('sub_media_medialibrary_fileresult_provision_check_assets_011', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_FILERESULT_PROVISION_CHECK_ASSETS_1100';
            const fileNames = [
                "081.dat", "082.dat", "083.dat", "084.dat", "085.dat", "086.dat", "087.dat", "088.dat", "089.dat", "090.dat"
            ];
            const directoryTypes = [
                4, 4, 4, 4, 4, 4, 4, 4, 4, 4
            ];
            const targetDirs = [
                "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/"
            ];
            await pushCreateAsset(media, abilityContext, fileNames, directoryTypes, targetDirs);
            await checkResourceAsset(done, testNum, fileNames);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILERESULT_PROVISION_CHECK_ASSETS_1200
         * @tc.name      : sub_media_medialibrary_fileresult_provision_check_assets_012
         * @tc.desc      : Provision mediaAssets and check mediaAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('sub_media_medialibrary_fileresult_provision_check_assets_012', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_FILERESULT_PROVISION_CHECK_ASSETS_1200';
            const fileNames = [
                "091.dat", "092.dat", "093.dat", "094.dat", "095.dat", "096.dat", "097.dat", "098.dat", "099.dat", "0100.dat"
            ];
            const directoryTypes = [
                4, 4, 4, 4, 4, 4, 4, 4, 4, 4
            ];
            const targetDirs = [
                "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Static/"
            ];
            await pushCreateAsset(media, abilityContext, fileNames, directoryTypes, targetDirs);
            await checkResourceAsset(done, testNum, fileNames);
        });
    });
}