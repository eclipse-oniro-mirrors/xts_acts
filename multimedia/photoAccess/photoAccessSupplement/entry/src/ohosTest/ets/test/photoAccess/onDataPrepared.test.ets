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
import { getPermission, driveFn, fetchAllOption } from '../common';
import common from '@ohos.app.ability.common';
import { image } from '@kit.ImageKit';

const TAG = 'onDataPreparedSupp';

class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<image.ImageSource> {
  onDataPrepared(data: image.ImageSource) {
    if (data === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    console.info('on image data prepared');
  }
}

const onDataPreparedPromiseImageSourceTest = async (done: Function, testName: string, fetchOptions: photoAccessHelper.FetchOptions,
  requestOptions: photoAccessHelper.RequestOptions,callback: (err: number) => void) => {
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
    callback(error.code);
    done();
  }
}

class MediaDataHandler implements photoAccessHelper.MediaAssetDataHandler<ArrayBuffer> {
  onDataPrepared = (data: ArrayBuffer, map: Map<string, string>) => {
    if (data === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    console.info('on image data prepared, photo quality is ' + map['quality']);
  }
}

const onDataPreparedPromiseArrayBufferTest = async (done: Function, testName: string, fetchOptions: photoAccessHelper.FetchOptions,
  requestOptions: photoAccessHelper.RequestOptions,callback: (err: number) => void) => {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    const handler = new MediaDataHandler();
    phAccessHelper.getAssets(fetchOptions, async (err, fetchResult) => {
      console.info(TAG, 'fetchResult success');
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      let requestId =
        await photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler);
      console.info(TAG, 'requestImageData successfully', requestId);
      await photoAccessHelper.MediaAssetManager.cancelRequest(testContext, requestId);
      done();
    });
  } catch (error) {
    console.info(TAG, `failed; error: ${error}`, testName);
    callback(error.code);
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
     * @tc.name   onDataHandler_onDataPrepared_promise_001
     * @tc.number onDataHandler_onDataPrepared_promise_001
     * @tc.desc   MediaAssetDataHandler_onDataPrepared
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onDataHandler_onDataPrepared_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'onDataHandler_onDataPrepared_promise_001';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
      };
      await onDataPreparedPromiseImageSourceTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect().assertFail();
      })
    })

    /**
     * @tc.name   onDataHandler_onDataPrepared_promise_002
     * @tc.number onDataHandler_onDataPrepared_promise_002
     * @tc.desc   MediaAssetDataHandler_onDataPrepared
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onDataHandler_onDataPrepared_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'onDataHandler_onDataPrepared_promise_002';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
      };
      await onDataPreparedPromiseImageSourceTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect().assertFail();
      })
    })

    /**
     * @tc.name   onDataHandler_onDataPrepared_promise_003
     * @tc.number onDataHandler_onDataPrepared_promise_003
     * @tc.desc   MediaAssetDataHandler_onDataPrepared
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onDataHandler_onDataPrepared_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'onDataHandler_onDataPrepared_promise_003';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      };
      await onDataPreparedPromiseImageSourceTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect().assertFail();
      })
    })

    /**
     * @tc.name   onDataHandler_onDataPrepared_promise_004
     * @tc.number onDataHandler_onDataPrepared_promise_004
     * @tc.desc   MediaAssetDataHandler_onDataPrepared
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onDataHandler_onDataPrepared_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'onDataHandler_onDataPrepared_promise_004';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
      };
      await onDataPreparedPromiseArrayBufferTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect().assertFail();
      })
    })

    /**
     * @tc.name   onDataHandler_onDataPrepared_promise_005
     * @tc.number onDataHandler_onDataPrepared_promise_005
     * @tc.desc   MediaAssetDataHandler_onDataPrepared
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onDataHandler_onDataPrepared_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'onDataHandler_onDataPrepared_promise_005';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
      };
      await onDataPreparedPromiseArrayBufferTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect().assertFail();
      })
    })

    /**
     * @tc.name   onDataHandler_onDataPrepared_promise_006
     * @tc.number onDataHandler_onDataPrepared_promise_006
     * @tc.desc   MediaAssetDataHandler_onDataPrepared
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onDataHandler_onDataPrepared_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'onDataHandler_onDataPrepared_promise_006';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      };
      await onDataPreparedPromiseArrayBufferTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect().assertFail();
      })
    })

  })
}