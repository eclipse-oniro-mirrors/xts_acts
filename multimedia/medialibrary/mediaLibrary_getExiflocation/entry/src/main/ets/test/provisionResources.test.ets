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
                    selections: mediaLibrary.FileKey.MEDIA_TYPE + '= ? ',
                    selectionArgs: [mediaLibrary.MediaType.IMAGE.toString()],
                };
                media.getFileAssets(allFetchOp).then((fetchFileResult) => {
                    const count = fetchFileResult.getCount();
                    expect(count).assertEqual(fileNames.length);
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
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_EXIFLOCATION_PROVISION_CHECK_ASSETS_0100
         * @tc.name      : sub_media_medialibrary_exiflocation_provision_check_assets_001
         * @tc.desc      : Provision mediaAssets and check mediaAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('sub_media_medialibrary_exiflocation_provision_check_assets_001', 0, async function (done) {
            const testNum = 'SUB_MEDIA_MEDIALIBRARY_EXIFLOCATION_PROVISION_CHECK_ASSETS_0100';
            const fileNames = ['test_exif.jpg'];
            const directoryTypes = [2];
            const targetDirs = ['Images/'];
            await pushCreateAsset(media, abilityContext, fileNames, directoryTypes, targetDirs);
            await checkResourceAsset(done, testNum, fileNames);
        });
    });
}