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
import { getPermission, driveFn, LOG_TAG, fetchAllOption, copyImageToSandbox } from '../../common';
import common from '@ohos.app.ability.common';

const TAG = LOG_TAG + 'requestVideoFile';

class MediaDataHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
  onDataPrepared(data: boolean) {
    console.info('on video request status prepared');
  }
}

async function requestVideoFilePromiseTest(done: Function, testName: string,
  fetchOptions: photoAccessHelper.FetchOptions,
  requestOptions: photoAccessHelper.RequestOptions, pathUri: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    const handler = new MediaDataHandler();
    const fileUri = 'file://' + testContext.filesDir + "/" + pathUri;
    phAccessHelper.getAssets(fetchOptions, async (err, fetchResult) => {
      console.info('fetchResult success');
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, fileUri,
        handler);
      console.info('requestVideoFile successfully');
      expect(true).assertTrue();
      done();
    });
  } catch (error) {
    console.info(TAG, `failed; error: ${error}`, testName);
    expect().assertFail();
    done();
  }
}

export default function MediaAssetManagerRequestVideoFileTest() {
  describe('MediaAssetManagerRequestVideoFileTest', () => {

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
     * @tc.number    : MEDIA_ASSET_MANAGER_REQUEST_IMAGE_DATA_001
     * @tc.name      : MediaAssetManager_requestVideoFile_promise_001
     * @tc.desc      : requestVideoFile
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('MediaAssetManager_requestVideoFile_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetManager_requestVideoFile_promise_001';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
      };
      const fileName = '1vp9_320x240_30.mp4';
      const path = '1vp9_320x240_30.mp4';
      await copyImageToSandbox(fileName, path);
      await requestVideoFilePromiseTest(done, testName, fetchOptions, requestOptions, path);
    })*/
  })
}