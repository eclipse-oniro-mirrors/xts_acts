/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Hypium,
  TestType,
  Size,
  Level
} from "../../../hypium/index";
import Context from "application.Context"

import { sleep, getPermission, pushCreateAsset, pushCreateAssetSingle, driveFn } from './Common.test.ets';
import common from '@ohos.app.ability.common';

import hilog from '@ohos.hilog'

export default function provisionResourcesTest() {
  describe('provisionResourcesTest', () => {
    let testContext: Context = Hypium.get("context") as Context;
    const phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
    let assetCount = 0;

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000)
    });
    beforeEach(async () => {
      await sleep(300);
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
      await sleep(1000)
    });
    afterAll(() => {
      console.info('afterAll case');
    });

    const getAssetsCount = async (testNum: string): Promise<number> => {
      let count: number = -1;
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
        count = fetchResult.getCount();
        fetchResult.close();
        return count;
      } catch (error) {
        console.info(`${testNum} getAssets count failed, error: ${error}`)
        return count;
      }
    }

    const checkResourceAsset = async (done: () => void, testNum: string, fileNames: string[]): Promise<void> => {

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
     * @tc.name   sub_media_photoAccess_provision_check_assets_static_001
     * @tc.number SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_STATIC_0100
     * @tc.desc   Provision mediaAssets and check mediaAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sub_media_photoAccess_provision_check_assets_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const testNum = 'SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_STATIC_0100';
          const fileNames = [
            "01.jpg", "01.jpg", "addRemoveAssetsChangeReq01.jpg", "addRemoveAssetsChangeReq02.jpg", "request_image.jpg",
            "getAssetTest.jpg",
            "albumImageVideoCount01.jpg", "albumImageVideoCount02.jpg", "PicturealbumGetAssetsCb01.jpg",
            "albumGetAssetsPro01.jpg", "request_image_native.jpg",
          ];
          await pushCreateAsset(testContext, fileNames);
          await checkResourceAsset(done, testNum, fileNames);
        } catch (error: Error) {
        }

      });

    /**
     * @tc.name   sub_media_photoAccess_provision_check_assets_static_002
     * @tc.number SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_STATIC_0200
     * @tc.desc   Provision mediaAssets and check mediaAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sub_media_photoAccess_provision_check_assets_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_STATIC_0200';
        const fileNames = [
          "addCb01.jpg", "addCb02.jpg", "addCb03.jpg", "addCb04.jpg",
          "addPro01.jpg", "addPro02.jpg", "addPro03.jpg", "addPro04.jpg"
        ];
        await pushCreateAsset(testContext, fileNames);
        await checkResourceAsset(done, testNum, fileNames);
      });

    /**
     * @tc.name   sub_media_photoAccess_provision_check_assets_static_003
     * @tc.number SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_STATIC_0300
     * @tc.desc   Provision mediaAssets and check mediaAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sub_media_photoAccess_provision_check_assets_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_STATIC_0300';
        const fileNames = [
          "removeCb01.jpg", "removeCb02.jpg", "removeCb03.jpg", "removeCb04.jpg",
          "removePro01.jpg", "removePro02.jpg", "removePro03.jpg", "removePro04.jpg"
        ];
        await pushCreateAsset(testContext, fileNames);
        await checkResourceAsset(done, testNum, fileNames);
      });

    /**
     * @tc.name   sub_media_photoAccess_provision_check_assets_static_004
     * @tc.number SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_STATIC_0400
     * @tc.desc   Provision mediaAssets and check mediaAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sub_media_photoAccess_provision_check_assets_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_STATIC_0400';
        const fileNames = [
          "off01.jpg", "off02.jpg", "off03.jpg", "off04.jpg", "off10.jpg", "off11.jpg",
          "off12.jpg", "off13.jpg", "off14.jpg", "off15.jpg", "offCb01.jpg"
        ];
        await pushCreateAsset(testContext, fileNames);
        await checkResourceAsset(done, testNum, fileNames);
      });

    /**
     * @tc.name   sub_media_photoAccess_provision_check_assets_static_005
     * @tc.number SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_STATIC_0500
     * @tc.desc   Provision mediaAssets and check mediaAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sub_media_photoAccess_provision_check_assets_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_STATIC_0500';
        const fileNames = [
          "on01.jpg", "on02.jpg", "on03.jpg", "on04.jpg", "on10.jpg", "on11.jpg",
          "on12.jpg", "on13.jpg", "on14.jpg", "on15.jpg", "on16.jpg", "on17.jpg"
        ];
        await pushCreateAsset(testContext, fileNames);
        await checkResourceAsset(done, testNum, fileNames);
      });

    /**
     * @tc.name   sub_media_photoAccess_provision_check_assets_static_006
     * @tc.number SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_STATIC_0600
     * @tc.desc   Provision mediaAssets and check mediaAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sub_media_photoAccess_provision_check_assets_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_STATIC_0600';
        const fileNames = [
          "modifyCb01.jpg", "modifyCb02.jpg", "modifyCb03.jpg", "modifyCb04.jpg",
          "modifyCb05.jpg", "modifyCb06.jpg", "modifyCb07.jpg"
        ];
        await pushCreateAsset(testContext, fileNames);
        await checkResourceAsset(done, testNum, fileNames);
      });

    /**
     * @tc.name   sub_media_photoAccess_provision_check_assets_static_007
     * @tc.number SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_STATIC_0700
     * @tc.desc   Provision mediaAssets and check mediaAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sub_media_photoAccess_provision_check_assets_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_STATIC_0700';
        const fileNames = [
          "modifyPro01.jpg", "modifyPro02.jpg", "modifyPro03.jpg", "modifyPro04.jpg",
          "modifyPro05.jpg", "modifyPro06.jpg", "modifyPro07.jpg"
        ];
        await pushCreateAsset(testContext, fileNames);
        await checkResourceAsset(done, testNum, fileNames);
      });

    /**
     * @tc.name   sub_media_photoAccess_provision_check_assets_static_008
     * @tc.number SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_STATIC_0800
     * @tc.desc   Provision mediaAssets and check mediaAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sub_media_photoAccess_provision_check_assets_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_STATIC_0800';
        const fileNames = [
          "01.mp4", "albumImageVideoCount01.mp4", "albumGetAssetsCb01.mp4", "albumGetAssetsPro01.mp4",
          "request_video_native.mp4", "request_video.mp4",
        ];

        await pushCreateAsset(testContext, fileNames);
        await checkResourceAsset(done, testNum, fileNames);
      });

    /**
     * @tc.name   sub_media_photoAccess_provision_check_assets_static_009
     * @tc.number SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_STATIC_0900
     * @tc.desc   Provision mediaAssets and check mediaAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sub_media_photoAccess_provision_check_assets_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_STATIC_0900';
        const fileNames = [
          "addCb01.mp4", "addPro01.mp4", "removeCb01.mp4", "removePro01.mp4"
        ];
        await pushCreateAsset(testContext, fileNames);
        await checkResourceAsset(done, testNum, fileNames);
      });

    /**
     * @tc.name   sub_media_photoAccess_provision_check_assets_static_010
     * @tc.number SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_STATIC_1000
     * @tc.desc   Provision mediaAssets and check mediaAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sub_media_photoAccess_provision_check_assets_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_STATIC_1000';
        const fileNames = [
          "modifyCb01.mp4", "modifyCb02.mp4", "modifyCb03.mp4", "modifyCb04.mp4", "modifyCb05.mp4"
        ];
        await pushCreateAsset(testContext, fileNames);
        await checkResourceAsset(done, testNum, fileNames);
      });

    /**
     * @tc.name   sub_media_photoAccess_provision_check_assets_static_011
     * @tc.number SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_STATIC_1100
     * @tc.desc   Provision mediaAssets and check mediaAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sub_media_photoAccess_provision_check_assets_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_STATIC_1100';
        const fileNames = [
          "modifyPro01.mp4", "modifyPro02.mp4", "modifyPro03.mp4", "modifyPro04.mp4", "modifyPro05.mp4"
        ];
        await pushCreateAsset(testContext, fileNames);
        await checkResourceAsset(done, testNum, fileNames);
      });

    /**
     * @tc.name   sub_media_photoAccess_provision_check_assets_static_012
     * @tc.number SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_STATIC_1200
     * @tc.desc   Provision mediaAssets and check mediaAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sub_media_photoAccess_provision_check_assets_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_STATIC_1200';
        const fileNames = [
          "modifyCb06.mp4", "modifyCb07.mp4", "modifyPro06.mp4", "modifyPro07.mp4"
        ];
        await pushCreateAsset(testContext, fileNames);
        await checkResourceAsset(done, testNum, fileNames);
      });

    /**
     * @tc.name   sub_media_photoAccess_provision_check_assets_static_013
     * @tc.number SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_STATIC_1300
     * @tc.desc   Provision mediaAssets and check mediaAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sub_media_photoAccess_provision_check_assets_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'sub_media_photoAccess_provision_check_assets_static_013';
        const fileNames = [
          "native_request_gif.gif", "native_request_png.png", "native_request_mpeg.mpeg",
          "native_request_error_mp4.mp4",
          "native_request_error_jpg.jpg"
        ];
        await pushCreateAssetSingle(testContext, fileNames);
        await checkResourceAsset(done, testNum, fileNames);
      });

    /**
     * @tc.name   check_provision_resource_count_static_001
     * @tc.number SUB_MEDIA_PHOTOACCESS_CHECK_ASSETS_COUNT_STATIC_001
     * @tc.desc   check provisionResources count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('check_provision_resource_count_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'check_provision_resource_count_static_001';
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