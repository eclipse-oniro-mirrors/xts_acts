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
import { getPermission, driveFn, LOG_TAG } from '../../common';
import common from '@ohos.app.ability.common';
import { dataSharePredicates } from '@kit.ArkData';

const TAG = LOG_TAG + 'getUri';

class MovingPhotoHandler implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
  async onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto) {
    if (movingPhoto === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    console.info("moving photo acquired successfully, uri: " + movingPhoto.getUri());
  }
}

async function getUriPromiseTest(done: Function, testName: string, fetchOptions: photoAccessHelper.FetchOptions,
  requestOptions: photoAccessHelper.RequestOptions) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
  predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_SUBTYPE, photoAccessHelper.PhotoSubtype.MOVING_PHOTO);
  // 请确保图库内存在动态照片。
  let assetResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
    await phAccessHelper.getAssets(fetchOptions);
  let asset: photoAccessHelper.PhotoAsset = await assetResult.getLastObject();
  const handler = await new MovingPhotoHandler();
  try {
    console.log(TAG, JSON.stringify(asset), JSON.stringify(requestOptions), JSON.stringify(handler))
    let requestId: string =
      await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, asset, requestOptions, handler);
    console.info("moving photo requested successfully, requestId: " + requestId);
    done();
  } catch (err) {
    console.error(TAG, testName,
      `failed to request moving photo, error code is ${err.code}, message is ${err.message}`);
    expect().assertFail();
    done();
  }
}

export default function MovingPhotoGetUriTest() {
  describe('MovingPhotoGetUriTest', () => {

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
     * @tc.name   MovingPhoto_getUri_promise_001
     * @tc.number MOVING_PHOTO_GET_URI_001 //TODO 设备不支持 拿到gif的图片 也是报401
     * @tc.desc   MovingPhoto_getUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('MovingPhoto_getUri_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MovingPhoto_getUri_promise_001';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
      };
      await getUriPromiseTest(done, testName, fetchOptions, requestOptions);
    })*/
  })
}