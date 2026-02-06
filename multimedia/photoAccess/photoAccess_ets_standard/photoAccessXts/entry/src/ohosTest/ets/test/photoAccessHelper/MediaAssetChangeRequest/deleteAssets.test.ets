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
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import { getPermission, driveFn, LOG_TAG, genRandomStr } from '../../common';
import common from '@ohos.app.ability.common';
import { dataSharePredicates } from '@kit.ArkData';

const TAG = LOG_TAG + 'deleteAssets';

async function deleteAssetsPromiseTest(done: Function, testName: string, type: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
    let fetchOptions: photoAccessHelper.FetchOptions = {
      fetchColumns: [],
      predicates: predicates
    };
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
      await phAccessHelper.getAssets(fetchOptions);
    if (type == 'uriList') {
      let photoAssetList: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, [photoAssetList]);
    } else if (type == 'assets') {
      let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      let title: string = genRandomStr(10);
      await asset.clone(title);
      await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, [asset.uri]);
    }
    console.info('deleteAssets successfully');
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code},${error.message}`, testName);
    expect().assertFail();
    done();
  }
}

export default function MediaAssetChangeRequestDeleteAssetsTest() {
  describe('MediaAssetChangeRequestDeleteAssetsTest', () => {

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
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
     * @tc.name   MediaAssetChangeRequest_deleteAssets_promise_001
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_001
     * @tc.desc   deleteAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('MediaAssetChangeRequest_deleteAssets_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_deleteAssets_promise_001';
      const type = 'assets';
      await deleteAssetsPromiseTest(done, testName, type);
    })*/

    /**
     * @tc.name   MediaAssetChangeRequest_deleteAssets_promise_002
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_002
     * @tc.desc   deleteAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('MediaAssetChangeRequest_deleteAssets_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_deleteAssets_promise_002';
      const type = 'uriList';
      await deleteAssetsPromiseTest(done, testName, type);
    })*/
  })
}