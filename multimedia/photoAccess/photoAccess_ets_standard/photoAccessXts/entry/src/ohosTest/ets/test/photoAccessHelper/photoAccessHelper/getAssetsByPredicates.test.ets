/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, beforeAll, Level, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import {
  driveFn, getPermission, LOG_TAG, photoKeys
} from '../../common';
import { common } from '@kit.AbilityKit';
import { dataSharePredicates } from '@kit.ArkData';

const TAG = LOG_TAG + 'getAssetsTest';

async function deleteAssets(phAccessHelper: photoAccessHelper.PhotoAccessHelper, testContext: common.UIAbilityContext) {
  let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
  let fetchOptions: photoAccessHelper.FetchOptions = {
    fetchColumns: [],
    predicates: predicates
  };
  try {
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
      await phAccessHelper.getAssets(fetchOptions);
    let assets: photoAccessHelper.PhotoAsset[] = await fetchResult.getAllObjects();
    await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, assets);
    console.info('deleteAssets successfully');
  } catch (err) {
    console.error(`deleteAssets failed with error: ${err.code}, ${err.message}`);
  }
}

async function createImageAsset(testContext: common.UIAbilityContext, helper: photoAccessHelper.PhotoAccessHelper,
  title: string) {
  try {
    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
      photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext,
        photoAccessHelper.PhotoType.IMAGE, 'jpg', {
          title: title,
        });
    let buffer: ArrayBuffer = new ArrayBuffer(2048);
    assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, buffer);
    await helper.applyChanges(assetChangeRequest);
  } catch (err) {
    console.error(`createImageAsset failed with error: ${err.code}, ${err.message}`);
  }
}

async function createAssets(testContext: common.UIAbilityContext, helper: photoAccessHelper.PhotoAccessHelper) {
  await createImageAsset(testContext, helper, 'a')
  await createImageAsset(testContext, helper, 'b')
  await createImageAsset(testContext, helper, 'c')
}

export default
function getAssetsByPredicatesTest() {
  describe('getAssetsByPredicatesTest', () => {
    let testContext: common.UIAbilityContext =
      AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      await getPermission();
      await driveFn();
      await createAssets(testContext, helper);
    });

    beforeEach(async () => {
      console.info(TAG, 'beforeEach case.')
    });

    afterEach(async () => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(async () => {
      await deleteAssets(helper, testContext);
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   getAssets_by_predicates_001
     * @tc.number PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_001
     * @tc.desc   fetchColumns->asset title is not equal to b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_by_predicates_001', Level.LEVEL0, async (done: Function) => {
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.notEqualTo(photoKeys.TITLE, 'b')
          .and()
          .in(photoKeys.TITLE, ['a', 'b', 'c'])
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult = await helper.getAssets(fetchOptions);
        expect(assetResult.getCount()).assertEqual(2);
        expect((await assetResult.getNextObject()).displayName).assertEqual('c.jpg');
        expect((await assetResult.getNextObject()).displayName).assertEqual('a.jpg');
        const testName = 'getAssets_by_predicates_001';
        console.info(TAG, testName);
        done();
      } catch (error) {
        console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   getAssets_by_predicates_002
     * @tc.number PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_002
     * @tc.desc   fetchColumns->asset title greaterThan b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_by_predicates_002', Level.LEVEL0, async (done: Function) => {
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.greaterThan(photoKeys.TITLE, 'b')
          .and()
          .in(photoKeys.TITLE, ['a', 'b', 'c']);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult = await helper.getAssets(fetchOptions);
        expect(assetResult.getCount()).assertEqual(1);
        expect((await assetResult.getNextObject()).displayName).assertEqual('c.jpg');
        const testName = 'getAssets_by_predicates_002';
        console.info(TAG, testName);
        done();
      } catch (error) {
        console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   getAssets_by_predicates_003
     * @tc.number PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_003
     * @tc.desc   fetchColumns->asset title lessThan b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_by_predicates_003', Level.LEVEL0, async (done: Function) => {
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.lessThan(photoKeys.TITLE, 'b')
          .and()
          .in(photoKeys.TITLE, ['a', 'b', 'c']);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult = await helper.getAssets(fetchOptions);
        expect(assetResult.getCount()).assertEqual(1);
        expect((await assetResult.getNextObject()).displayName).assertEqual('a.jpg');
        const testName = 'getAssets_by_predicates_003';
        console.info(TAG, testName);
        done();
      } catch (error) {
        console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   getAssets_by_predicates_004
     * @tc.number PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_004
     * @tc.desc   fetchColumns->asset title greaterThanOrEqualTo b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_by_predicates_004', Level.LEVEL0, async (done: Function) => {
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.greaterThanOrEqualTo(photoKeys.TITLE, 'b')
          .and()
          .in(photoKeys.TITLE, ['a', 'b', 'c']);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult = await helper.getAssets(fetchOptions);
        expect(assetResult.getCount()).assertEqual(2);
        expect((await assetResult.getNextObject()).displayName).assertEqual('c.jpg');
        expect((await assetResult.getNextObject()).displayName).assertEqual('b.jpg');
        const testName = 'getAssets_by_predicates_004';
        console.info(TAG, testName);
        done();
      } catch (error) {
        console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   getAssets_by_predicates_005
     * @tc.number PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_005
     * @tc.desc   fetchColumns->asset title lessThanOrEqualTo b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_by_predicates_005', Level.LEVEL0, async (done: Function) => {
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.lessThanOrEqualTo(photoKeys.TITLE, 'b')
          .and()
          .in(photoKeys.TITLE, ['a', 'b', 'c']);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult = await helper.getAssets(fetchOptions);
        expect(assetResult.getCount()).assertEqual(2);
        expect((await assetResult.getNextObject()).displayName).assertEqual('b.jpg');
        expect((await assetResult.getNextObject()).displayName).assertEqual('a.jpg');
        const testName = 'getAssets_by_predicates_005';
        console.info(TAG, testName);
        done();
      } catch (error) {
        console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   getAssets_by_predicates_006
     * @tc.number PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_006
     * @tc.desc   fetchColumns->asset title like b%
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_by_predicates_006', Level.LEVEL0, async (done: Function) => {
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.like(photoKeys.TITLE, 'b%')
          .and()
          .in(photoKeys.TITLE, ['a', 'b', 'c']);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult = await helper.getAssets(fetchOptions);
        expect(assetResult.getCount()).assertEqual(1);
        expect((await assetResult.getNextObject()).displayName).assertEqual('b.jpg');
        const testName = 'getAssets_by_predicates_006';
        console.info(TAG, testName);
        done();
      } catch (error) {
        console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   getAssets_by_predicates_007
     * @tc.number PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_007
     * @tc.desc   fetchColumns->asset title between a and b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_by_predicates_007', Level.LEVEL0, async (done: Function) => {
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.between(photoKeys.TITLE, 'a', 'b')
          .and()
          .in(photoKeys.TITLE, ['a', 'b', 'c']);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult = await helper.getAssets(fetchOptions);
        expect(assetResult.getCount()).assertEqual(2);
        expect((await assetResult.getNextObject()).displayName).assertEqual('b.jpg');
        expect((await assetResult.getNextObject()).displayName).assertEqual('a.jpg');
        const testName = 'getAssets_by_predicates_007';
        console.info(TAG, testName);
        done();
      } catch (error) {
        console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   getAssets_by_predicates_008
     * @tc.number PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_008
     * @tc.desc   fetchColumns->asset title notBetween a and b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_by_predicates_008', Level.LEVEL0, async (done: Function) => {
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.notBetween(photoKeys.TITLE, 'a', 'b')
          .and()
          .in(photoKeys.TITLE, ['a', 'b', 'c']);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult = await helper.getAssets(fetchOptions);
        expect(assetResult.getCount()).assertEqual(1);
        expect((await assetResult.getNextObject()).displayName).assertEqual('c.jpg');
        const testName = 'getAssets_by_predicates_008';
        console.info(TAG, testName);
        done();
      } catch (error) {
        console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   getAssets_by_predicates_009
     * @tc.number PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_009
     * @tc.desc   fetchColumns->asset title notIn [a,b]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_by_predicates_009', Level.LEVEL0, async (done: Function) => {
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.notIn(photoKeys.TITLE, ['a', 'b'])
          .and()
          .in(photoKeys.TITLE, ['a', 'b', 'c']);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult = await helper.getAssets(fetchOptions);
        expect(assetResult.getCount()).assertEqual(1);
        expect((await assetResult.getNextObject()).displayName).assertEqual('c.jpg');
        const testName = 'getAssets_by_predicates_009';
        console.info(TAG, testName);
        done();
      } catch (error) {
        console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   getAssets_by_predicates_010
     * @tc.number PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_010
     * @tc.desc   fetchColumns-> predicates with or,beginWrap and endWrap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_by_predicates_010', Level.LEVEL0, async (done: Function) => {
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.beginWrap()
          .equalTo(photoKeys.TITLE, 'a')
          .or()
          .equalTo(photoKeys.TITLE, 'b')
          .endWrap()
          .and()
          .in(photoKeys.TITLE, ['a', 'b', 'c']);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult = await helper.getAssets(fetchOptions);
        expect(assetResult.getCount()).assertEqual(2);
        expect((await assetResult.getNextObject()).displayName).assertEqual('b.jpg');
        expect((await assetResult.getNextObject()).displayName).assertEqual('a.jpg');
        const testName = 'getAssets_by_predicates_010';
        console.info(TAG, testName);
        done();
      } catch (error) {
        console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

  })
}