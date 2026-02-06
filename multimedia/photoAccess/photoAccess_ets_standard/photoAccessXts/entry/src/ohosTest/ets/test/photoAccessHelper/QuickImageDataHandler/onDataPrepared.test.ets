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
import { image } from '@kit.ImageKit';

const TAG = LOG_TAG + 'onDataPrepared';

class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<image.ImageSource> {
  onDataPrepared(data: image.ImageSource) {
    if (data === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    console.info('on image data prepared');
  }
}

async function onDataPreparedPromiseTest(done: Function, testName: string, fetchOptions: photoAccessHelper.FetchOptions,
  requestOptions: photoAccessHelper.RequestOptions) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    const handler = new MediaHandler();
    phAccessHelper.getAssets(fetchOptions, async (err, fetchResult) => {
      console.info(TAG, 'fetchResult success');
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      let requestId =
        await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler);
      console.info(TAG, 'requestImage successfully', requestId);
      await photoAccessHelper.MediaAssetManager.cancelRequest(testContext, requestId);
      done();
    });
  } catch (error) {
    console.info(TAG, `failed; error: ${error}`, testName);
    expect().assertFail();
    done();
  }
}

export default function MediaAssetDataHandlerOnDataPreparedTest() {
  describe('MediaAssetDataHandlerOnDataPreparedTest', () => {

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
     * @tc.name   MediaAssetDataHandler_onDataPrepared_promise_001
     * @tc.number QUICK_IMAGE_DATA_HANDLER_ON_DATA_PREPARED_001
     * @tc.desc   MediaAssetDataHandler_onDataPrepared
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetDataHandler_onDataPrepared_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetDataHandler_onDataPrepared_promise_001';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
      };
      await onDataPreparedPromiseTest(done, testName, fetchOptions, requestOptions);
    })
  })
}