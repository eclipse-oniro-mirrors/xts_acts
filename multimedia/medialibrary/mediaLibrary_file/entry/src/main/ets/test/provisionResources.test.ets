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
                    console.info(`${testNum} Get fetchFileResult successfully, count: ${count}`)
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
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_PROVISION_CHECK_ASSETS_0100
         * @tc.name      : sub_media_medialibrary_file_provision_check_assets_001
         * @tc.desc      : Provision mediaAssets and check mediaAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('sub_media_medialibrary_file_provision_check_assets_001', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_FILE_PROVISION_CHECK_ASSETS_0100';
            const fileNames = [
                "01.jpg", "02.jpg", "03.jpg", "04.jpg", "05.jpg", "06.jpg", "01.jpg"
            ];
            const directoryTypes = [
                2, 2, 2, 2, 2, 2, 2
            ];
            const targetDirs = [
                "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Dynamic/"
            ];
            await pushCreateAsset(media, abilityContext, fileNames, directoryTypes, targetDirs);
            await checkResourceAsset(done, testNum, fileNames);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_PROVISION_CHECK_ASSETS_0200
         * @tc.name      : sub_media_medialibrary_file_provision_check_assets_002
         * @tc.desc      : Provision mediaAssets and check mediaAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('sub_media_medialibrary_file_provision_check_assets_002', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_FILE_PROVISION_CHECK_ASSETS_0200';
            const fileNames = [
                "01.mp4", "02.mp4", "03.mp4", "04.mp4", "05.mp4", "06.mp4", "01.mp4"
            ];
            const directoryTypes = [
                1, 1, 1, 1, 1, 1, 1
            ];
            const targetDirs = [
                "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Dynamic/"
            ];
            await pushCreateAsset(media, abilityContext, fileNames, directoryTypes, targetDirs);
            await checkResourceAsset(done, testNum, fileNames);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_PROVISION_CHECK_ASSETS_0300
         * @tc.name      : sub_media_medialibrary_file_provision_check_assets_003
         * @tc.desc      : Provision mediaAssets and check mediaAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('sub_media_medialibrary_file_provision_check_assets_003', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_FILE_PROVISION_CHECK_ASSETS_0300';
            const fileNames = [
                "01.mp3", "02.mp3", "03.mp3", "04.mp3", "05.mp3", "06.mp3", "01.mp3"
            ];
            const directoryTypes = [
                3, 3, 3, 3, 3, 3, 3
            ];
            const targetDirs = [
                "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Dynamic/"
            ];
            await pushCreateAsset(media, abilityContext, fileNames, directoryTypes, targetDirs);
            await checkResourceAsset(done, testNum, fileNames);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_PROVISION_CHECK_ASSETS_0400
         * @tc.name      : sub_media_medialibrary_file_provision_check_assets_004
         * @tc.desc      : Provision mediaAssets and check mediaAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('sub_media_medialibrary_file_provision_check_assets_004', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_FILE_PROVISION_CHECK_ASSETS_0400';
            const fileNames = [
                "01.dat", "02.dat", "03.dat", "04.dat", "05.dat", "06.dat", "01.dat"
            ];
            const directoryTypes = [
                4, 4, 4, 4, 4, 4, 4
            ];
            const targetDirs = [
                "Static/", "Static/", "Static/", "Static/", "Static/", "Static/", "Dynamic/"
            ];
            await pushCreateAsset(media, abilityContext, fileNames, directoryTypes, targetDirs);
            await checkResourceAsset(done, testNum, fileNames);
        });
    });
}