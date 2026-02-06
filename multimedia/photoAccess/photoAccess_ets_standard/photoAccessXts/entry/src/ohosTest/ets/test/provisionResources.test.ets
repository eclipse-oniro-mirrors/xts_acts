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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

import {
  sleep,
  getPermission,
  pushCreateAsset,
  pushCreateAssetSingle,
  driveFn
} from './common';
import common from '@ohos.app.ability.common';

export default function provisionResourcesTest() {
  describe('provisionResourcesTest', ()=>{
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
    let assetCount = 0;

    beforeAll(async ()=>{
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000)
    });
    beforeEach(async ()=>{
      await sleep(300);
      console.info('beforeEach case');
    });
    afterEach(async ()=>{
      console.info('afterEach case');
      await sleep(1000)
    });
    afterAll(()=>{
      console.info('afterAll case');
    });

    const getAssetsCount = async (testNum:string) => {
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

    const checkResourceAsset = async (done:Function, testNum:string, fileNames:string[])=> {
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
    it('sub_media_photoAccess_provision_check_assets_001', Level.LEVEL0, async (done:Function)=> {
      const testNum = 'SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_0100';
      const fileNames = [
        "01.jpg", "cloneTest.jpg", "getTest.jpg", "getThumb.jpg", "modifyCb01.jpg", "modifyCb02.jpg",
        "modifyCb03.jpg", "modifyCb04.jpg","modifyCb05.jpg", "modifyCb07.jpg"
      ];
      await pushCreateAsset(testContext,fileNames);
      await checkResourceAsset(done, testNum, fileNames);
    })

    /**
     * @tc.number    : SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_0200
     * @tc.name      : sub_media_photoAccess_provision_check_assets_002
     * @tc.desc      : Provision mediaAssets and check mediaAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sub_media_photoAccess_provision_check_assets_002', Level.LEVEL0, async (done:Function)=> {
      const testNum = 'SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_0200';
      const fileNames = [
        "modifyPro01.jpg", "modifyPro02.jpg", "modifyPro03.jpg", "modifyPro04.jpg",
        "modifyPro05.jpg", "modifyPro06.jpg", "modifyPro07.jpg", "testGetAsset.jpg"
      ];
      await pushCreateAsset(testContext,fileNames);
      await checkResourceAsset(done, testNum, fileNames);
    })

    /**
     * @tc.number    : SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_0300
     * @tc.name      : sub_media_photoAccess_provision_check_assets_003
     * @tc.desc      : Provision mediaAssets and check mediaAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sub_media_photoAccess_provision_check_assets_003', Level.LEVEL0, async (done:Function)=> {
      const testNum = 'SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_0300';
      const fileNames = [
        "01.mp4", "cloneTest.mp4", "getTest.mp4", "getThumb.mp4",
        "modifyCb01.mp4","modifyCb02.mp4",
      ];
      await pushCreateAsset(testContext,fileNames);
      await checkResourceAsset(done, testNum, fileNames);
    })

    /**
     * @tc.number    : SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_0400
     * @tc.name      : sub_media_photoAccess_provision_check_assets_004
     * @tc.desc      : Provision mediaAssets and check mediaAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sub_media_photoAccess_provision_check_assets_004', Level.LEVEL0, async (done:Function)=> {
      const testNum = 'SUB_MEDIA_PHOTOACCESS_PROVISION_CHECK_ASSETS_0400';
      const fileNames = [
        "modifyCb03.mp4", "modifyCb04.mp4", "modifyCb05.mp4", "modifyCb06.mp4","modifyCb07.mp4","modifyPro01.mp4",
        "modifyPro02.mp4", "modifyPro03.mp4", "modifyPro04.mp4", "modifyPro05.mp4","modifyPro06.mp4","modifyPro07.mp4","testGetAsset.mp4"
      ];
      await pushCreateAsset(testContext,fileNames);
      await checkResourceAsset(done, testNum, fileNames);
    })

    /**
     * @tc.number    : SUB_MEDIA_PHOTOACCESS_CHECK_ASSETS_COUNT_001
     * @tc.name      : check_provision_resource_count_001
     * @tc.desc      : check provisionResources count
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('check_provision_resource_count_001', Level.LEVEL0, async (done:Function)=> {
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
    })
  });
}