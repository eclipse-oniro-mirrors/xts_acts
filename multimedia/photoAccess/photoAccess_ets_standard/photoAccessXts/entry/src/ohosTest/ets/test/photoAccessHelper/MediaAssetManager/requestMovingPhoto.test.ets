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
import { getPermission, driveFn, LOG_TAG, fetchAllOption } from '../../common';
import common from '@ohos.app.ability.common';

const TAG = LOG_TAG + 'requestMovingPhoto';

class MovingPhotoHandler implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
  async onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto) {
    if (movingPhoto === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    console.info("moving photo acquired successfully, uri: " + movingPhoto.getUri());
  }
}

async function requestMovingPhotoPromiseTest(done: Function, testName: string,
  fetchOptions: photoAccessHelper.FetchOptions,
  requestOptions: photoAccessHelper.RequestOptions) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  let assetResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
    await phAccessHelper.getAssets(fetchOptions);
  let asset: photoAccessHelper.PhotoAsset = await assetResult.getFirstObject();
  try {
    const handler = new MovingPhotoHandler();
    console.log('lhp6666')
    let requestId: string =
      await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, asset, requestOptions, handler);
    console.info("moving photo requested successfully, requestId: " + requestId);
    expect(true).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error}`, testName);
    expect().assertFail();
    done();
  }
}

export default function MediaAssetManagerRequestMovingPhotoTest() {
  describe('MediaAssetManagerRequestMovingPhotoTest', () => {

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
     * @tc.number    : MEDIA_ASSET_MANAGER_REQUEST_MOVING_PHOTO_001
     * @tc.name      : MediaAssetManager_requestMovingPhoto_promise_001
     * @tc.desc      : requestMovingPhoto
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MediaAssetManager_requestMovingPhoto_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetManager_requestMovingPhoto_promise_001';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
      };
      await requestMovingPhotoPromiseTest(done, testName, fetchOptions, requestOptions);
    })

    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_REQUEST_MOVING_PHOTO_002
     * @tc.name      : MediaAssetManager_requestMovingPhoto_promise_002
     * @tc.desc      : requestMovingPhoto
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MediaAssetManager_requestMovingPhoto_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetManager_requestMovingPhoto_promise_002';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
      };
      await requestMovingPhotoPromiseTest(done, testName, fetchOptions, requestOptions);
    })

    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_REQUEST_MOVING_PHOTO_003
     * @tc.name      : MediaAssetManager_requestMovingPhoto_promise_003
     * @tc.desc      : requestMovingPhoto
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MediaAssetManager_requestMovingPhoto_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetManager_requestMovingPhoto_promise_003';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      };
      await requestMovingPhotoPromiseTest(done, testName, fetchOptions, requestOptions);
    })
  })
}