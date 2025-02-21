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
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

import {
    sleep,
    getPermission,
    pushCreateAsset,
    pushCreateAssetSingle,
} from '../../../../../../common';

export default function provisionResourcesTest() {
    describe('provisionResourcesTest', function () {
        const phAccessHelper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext);
        let assetCount = 0;
        
        beforeAll(async function () {
            console.info('beforeAll case');
            await getPermission();
            await sleep()
        });
        beforeEach(async function () {
            await sleep(300);
            console.info('beforeEach case');
        });
        afterEach(async function () {
            console.info('afterEach case');
            await sleep()
        });
        afterAll(function () {
            console.info('afterAll case');
        });

        const getAssetsCount = async function (testNum): number {
            let count = -1;
            try {
                let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
                let fetchOptions: photoAccessHelper.FetchOptions = {
                    fetchColumns: [],
                    predicates: predicates
                };
                let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
                count = fetchResult.getCount();
                fetchResult.close();
                return count;
            } catch(error) {
                console.info(`${testNum} getAssets count failed, error: ${error}`)
                return count;
            } 
        }

        const checkResourceAsset = async function (done, testNum, fileNames) {
            
            try {
                const count = await getAssetsCount(testNum);
                assetCount += fileNames.length;
                console.info(`${testNum} Get fetchResult successfully, count: ${count}`)
                console.info(`${testNum} expect assetCount : ${assetCount}`)
                done();
            } catch (error) {
                console.info(`${testNum} checkResourceAsset failed, error: ${error}`)
                expect(false).assertTrue();
                done();
            }
        }        

        /**
         * @tc.number    : SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_0100
         * @tc.name      : sub_media_photoAccess_provision_check_assets_001
         * @tc.desc      : Provision mediaAssets and check mediaAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('sub_media_photoAccess_provision_check_assets_001', 0, async function (done) {
            const testNum = 'SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_0100';
            const fileNames = [
                "01.jpg", "addRemoveAssetsChangeReq01.jpg", "addRemoveAssetsChangeReq02.jpg", "request_image.jpg", 
                "albumImageVideoCount01.jpg", "albumImageVideoCount02.jpg","PicturealbumGetAssetsCb01.jpg", "albumGetAssetsPro01.jpg", "request_image_native.jpg",
            ];
            await pushCreateAsset(fileNames);
            await checkResourceAsset(done, testNum, fileNames);
        });

        /**
         * @tc.number    : SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_0200
         * @tc.name      : sub_media_photoAccess_provision_check_assets_002
         * @tc.desc      : Provision mediaAssets and check mediaAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('sub_media_photoAccess_provision_check_assets_002', 0, async function (done) {
            const testNum = 'SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_0200';
            const fileNames = [
                "addCb01.jpg", "addCb02.jpg", "addCb03.jpg", "addCb04.jpg", 
                "addPro01.jpg", "addPro02.jpg", "addPro03.jpg", "addPro04.jpg"
            ];
            await pushCreateAsset(fileNames);
            await checkResourceAsset(done, testNum, fileNames);
        });

        /**
         * @tc.number    : SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_0300
         * @tc.name      : sub_media_photoAccess_provision_check_assets_003
         * @tc.desc      : Provision mediaAssets and check mediaAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('sub_media_photoAccess_provision_check_assets_003', 0, async function (done) {
            const testNum = 'SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_0300';
            const fileNames = [
                "removeCb01.jpg", "removeCb02.jpg", "removeCb03.jpg", "removeCb04.jpg", 
                "removePro01.jpg", "removePro02.jpg", "removePro03.jpg", "removePro04.jpg"
            ];
            await pushCreateAsset(fileNames);
            await checkResourceAsset(done, testNum, fileNames);
        });

        /**
         * @tc.number    : SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_0400
         * @tc.name      : sub_media_photoAccess_provision_check_assets_004
         * @tc.desc      : Provision mediaAssets and check mediaAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('sub_media_photoAccess_provision_check_assets_004', 0, async function (done) {
            const testNum = 'SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_0400';
            const fileNames = [
                "off01.jpg", "off02.jpg", "off03.jpg", "off04.jpg", "off10.jpg", "off11.jpg", 
                "off12.jpg", "off13.jpg", "off14.jpg", "off15.jpg", "offCb01.jpg"
            ];
            await pushCreateAsset(fileNames);
            await checkResourceAsset(done, testNum, fileNames);
        });

        /**
         * @tc.number    : SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_0500
         * @tc.name      : sub_media_photoAccess_provision_check_assets_005
         * @tc.desc      : Provision mediaAssets and check mediaAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('sub_media_photoAccess_provision_check_assets_005', 0, async function (done) {
            const testNum = 'SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_0500';
            const fileNames = [
                "on01.jpg", "on02.jpg", "on03.jpg", "on04.jpg", "on10.jpg", "on11.jpg", 
                "on12.jpg", "on13.jpg", "on14.jpg", "on15.jpg", "on16.jpg"
            ];
            await pushCreateAsset(fileNames);
            await checkResourceAsset(done, testNum, fileNames);
        });

        /**
         * @tc.number    : SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_0600
         * @tc.name      : sub_media_photoAccess_provision_check_assets_006
         * @tc.desc      : Provision mediaAssets and check mediaAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('sub_media_photoAccess_provision_check_assets_006', 0, async function (done) {
            const testNum = 'SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_0600';
            const fileNames = [
                "modifyCb01.jpg", "modifyCb02.jpg", "modifyCb03.jpg", "modifyCb04.jpg", 
                "modifyCb05.jpg", "modifyCb06.jpg", "modifyCb07.jpg"
            ];
            await pushCreateAsset(fileNames);
            await checkResourceAsset(done, testNum, fileNames);
        });

        /**
         * @tc.number    : SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_0700
         * @tc.name      : sub_media_photoAccess_provision_check_assets_007
         * @tc.desc      : Provision mediaAssets and check mediaAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('sub_media_photoAccess_provision_check_assets_007', 0, async function (done) {
            const testNum = 'SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_0700';
            const fileNames = [
                "modifyPro01.jpg", "modifyPro02.jpg", "modifyPro03.jpg", "modifyPro04.jpg", 
                "modifyPro05.jpg", "modifyPro06.jpg", "modifyPro07.jpg"
            ];
            await pushCreateAsset(fileNames);
            await checkResourceAsset(done, testNum, fileNames);
        });

        /**
         * @tc.number    : SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_0800
         * @tc.name      : sub_media_photoAccess_provision_check_assets_008
         * @tc.desc      : Provision mediaAssets and check mediaAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('sub_media_photoAccess_provision_check_assets_008', 0, async function (done) {
            const testNum = 'SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_0800';
            const fileNames = [
                "01.mp4", "albumImageVideoCount01.mp4", "albumGetAssetsCb01.mp4", "albumGetAssetsPro01.mp4",
                "request_video_native.mp4","request_video.mp4",
            ];
            await pushCreateAsset(fileNames);
            await checkResourceAsset(done, testNum, fileNames);
        });

        /**
         * @tc.number    : SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_0900
         * @tc.name      : sub_media_photoAccess_provision_check_assets_009
         * @tc.desc      : Provision mediaAssets and check mediaAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('sub_media_photoAccess_provision_check_assets_009', 0, async function (done) {
            const testNum = 'SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_0900';
            const fileNames = [
                "addCb01.mp4", "addPro01.mp4", "removeCb01.mp4", "removePro01.mp4"
            ];
            await pushCreateAsset(fileNames);
            await checkResourceAsset(done, testNum, fileNames);
        });
        
        /**
         * @tc.number    : SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_1000
         * @tc.name      : sub_media_photoAccess_provision_check_assets_010
         * @tc.desc      : Provision mediaAssets and check mediaAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('sub_media_photoAccess_provision_check_assets_010', 0, async function (done) {
            const testNum = 'SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_1000';
            const fileNames = [
                "modifyCb01.mp4", "modifyCb02.mp4", "modifyCb03.mp4", "modifyCb04.mp4", "modifyCb05.mp4"
            ];
            await pushCreateAsset(fileNames);
            await checkResourceAsset(done, testNum, fileNames);
        });
        
        /**
         * @tc.number    : SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_1100
         * @tc.name      : sub_media_photoAccess_provision_check_assets_011
         * @tc.desc      : Provision mediaAssets and check mediaAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('sub_media_photoAccess_provision_check_assets_011', 0, async function (done) {
            const testNum = 'SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_1100';
            const fileNames = [
                "modifyPro01.mp4", "modifyPro02.mp4", "modifyPro03.mp4", "modifyPro04.mp4", "modifyPro05.mp4"
            ];
            await pushCreateAsset(fileNames);
            await checkResourceAsset(done, testNum, fileNames);
        });

        /**
         * @tc.number    : SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_1200
         * @tc.name      : sub_media_photoAccess_provision_check_assets_012
         * @tc.desc      : Provision mediaAssets and check mediaAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('sub_media_photoAccess_provision_check_assets_012', 0, async function (done) {
            const testNum = 'SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_1200';
            const fileNames = [
                "modifyCb06.mp4", "modifyCb07.mp4",  "modifyPro06.mp4", "modifyPro07.mp4"
            ];
            await pushCreateAsset(fileNames);
            await checkResourceAsset(done, testNum, fileNames);
        });

        /**
         * @tc.number    : SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_1300
         * @tc.name      : sub_media_photoAccess_provision_check_assets_013
         * @tc.desc      : Provision mediaAssets and check mediaAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('sub_media_photoAccess_provision_check_assets_013', 0, async function (done) {
            const testNum = 'sub_media_photoAccess_provision_check_assets_013';
            const fileNames = [
                "native_request_gif.gif", "native_request_png.png",  "native_request_mpeg.mpeg", "native_request_error_mp4.mp4", "native_request_error_jpg.jpg"
            ];
            await pushCreateAssetSingle(fileNames);
            await checkResourceAsset(done, testNum, fileNames);
        });

        /**
         * @tc.number    : SUB_MEDIA_PHOTOACCESS_CHECK_ASSETS_COUNT_001
         * @tc.name      : check_provision_resource_count_001
         * @tc.desc      : check provisionResources count
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('check_provision_resource_count_001', 0, async function (done) {
            const testNum = 'check_provision_resource_count_001';
            try {
                await sleep(3000);
                const count = await getAssetsCount(testNum);
                console.log(`${testNum} :: expect resource num is ${assetCount}, actual is ${count}`);
                expect(count).assertEqual(assetCount);
                done();
            } catch (error) {
                console.log(`${testNum} :: check provisionResources count error :: ${error} !`);
                expect(false).assertTrue();
                done();
            }
        });

    });
}