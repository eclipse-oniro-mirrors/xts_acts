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
import { getPermission, driveFn, LOG_TAG, copyImageToSandbox } from '../../common';
import common from '@ohos.app.ability.common';
import { fileUri } from '@kit.CoreFileKit';

const TAG = LOG_TAG + 'getAsset';

async function getAssetPromiseTest(done: Function, testName: string, pathUri: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    const uri = fileUri.getUriFromPath(testContext.filesDir + "/" + pathUri);
    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
      await photoAccessHelper.MediaAssetChangeRequest.createImageAssetRequest(testContext, uri);
    let asset: photoAccessHelper.PhotoAsset = assetChangeRequest.getAsset();
    console.info('create asset successfully with uri = ' + asset.uri);
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code},${error.message}`, testName);
    expect().assertFail();
    done();
  }
}

export default function MediaAssetChangeRequestGetAssetsTest() {
  describe('MediaAssetChangeRequestGetAssetsTest', () => {

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
     * @tc.name   MediaAssetChangeRequest_getAsset_promise_001
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_GET_ASSETS_001
     * @tc.desc   getAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('MediaAssetChangeRequest_getAsset_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_getAsset_promise_001';
      const fileName = 'test.jpeg';
      const path = 'test.jpeg';
      await copyImageToSandbox(fileName, path);
      await getAssetPromiseTest(done, testName, path);
    })*/

    /**
     * @tc.name   MediaAssetChangeRequest_getAsset_promise_002
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_GET_ASSETS_002
     * @tc.desc   getAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('MediaAssetChangeRequest_getAsset_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_getAsset_promise_002';
      const fileName = 'test7.png';
      const path = 'test7.png';
      await copyImageToSandbox(fileName, path);
      await getAssetPromiseTest(done, testName, path);
    })*/
  })
}