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

import dataSharePredicates from '@ohos.data.dataSharePredicates';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { describe, it, expect, beforeAll, Level, beforeEach, afterEach, afterAll } from "@ohos/hypium";
import { getPermission, driveFn, LOG_TAG } from '../../common';
import common from '@ohos.app.ability.common';
import { ErrorCode } from '../../CommonErrorCode';

export default function setTest() {
  const TAG = LOG_TAG + 'setTest';

  describe('setTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
    const setPhotoAssetTitle = async (done: Function, testName: string) => {
      console.info('photoAssetSetDemo');
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: [photoAccessHelper.PhotoKeys.TITLE],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = photoAccessHelper.PhotoKeys.TITLE.toString();
        const netTitle: string = 'newTitle1';
        photoAsset.set(title, netTitle);
        expect(photoAsset.get(title)).assertEqual(netTitle);
        done();
      } catch (err) {
        console.error(`${testName} setPhotoAssetTitle failed. error: ${err.code}, ${err.message}`);
        expect().assertFail();
        done();
      }
    }

    const setPhotoAssetErrorTitle1 = async (done: Function, testName: string) => {
      console.info('photoAssetSetDemo');
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: [photoAccessHelper.PhotoKeys.TITLE],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = '';
        photoAsset.set(title, 'newTitle');
        done();
      } catch (err) {
        console.error(`${testName} release failed. error: ${err.code}, ${err.message}`);
        expect(err.code == ErrorCode.NOT_VALID_PHOTO_KEY_ERROR_CODE).assertTrue();
        done();
      }
    }

    const setPhotoAssetErrorTitle2 = async (done: Function, testName: string) => {
      console.info('photoAssetSetDemo');
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: [photoAccessHelper.PhotoKeys.TITLE],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: ESObject = ['123123', '123123'];
        photoAsset.set(title, undefined);
        done();
      } catch (err) {
        console.error(`${testName} release failed. error: ${err.code}, ${err.message}`);
        expect(err.code == ErrorCode.ARGUMENT_INVALID_ERROR_CODE || err.code == ErrorCode.PARAM_ERROR_CODE)
          .assertTrue();
        done();
      }
    }

    const setPhotoAssetErrorTitle3 = async (done: Function, testName: string) => {
      console.info('photoAssetSetDemo');
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: [photoAccessHelper.PhotoKeys.TITLE],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.set('InvalidateMember', 'value');
        done();
      } catch (err) {
        console.error(`${testName} release failed. error: ${err.code}, ${err.message}`);
        expect(err.code == ErrorCode.NOT_VALID_PHOTO_KEY_ERROR_CODE).assertTrue();
        done();
      }
    }

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.number    : PHOTO_ASSET_SET_001
     * @tc.name      : set_photo_title_001
     * @tc.desc      : set photo title success
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('set_photo_title_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'get_image_uri_000';
      await setPhotoAssetTitle(done, testName);
      done();
    })

    /**
     * @tc.number    : PHOTO_ASSET_SET_002
     * @tc.name      : set_photo_title_002
     * @tc.desc      : set photo title '', error code 14000014
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('set_photo_title_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'set_photo_title_001';
      await setPhotoAssetErrorTitle1(done, testName);
      done();
    })

    /**
     * @tc.number    : PHOTO_ASSET_SET_003
     * @tc.name      : set_photo_title_002
     * @tc.desc      : set photo title ['123123', '123123'], error code 14000014
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('set_photo_title_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'set_photo_title_003';
      await setPhotoAssetErrorTitle2(done, testName);
      done();
    })

    /**
     * @tc.number    : PHOTO_ASSET_SET_004
     * @tc.name      : set_photo_title_003
     * @tc.desc      : set photo title success
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('set_photo_title_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'set_photo_title_004';
      await setPhotoAssetErrorTitle3(done, testName);
      done();
    })
  });
}