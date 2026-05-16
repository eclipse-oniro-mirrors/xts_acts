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

const TAG = LOG_TAG + 'saveCameraPhoto';

async function saveCameraPhotoPromiseTest(done: Function, testName: string,
  imageType?: photoAccessHelper.ImageFileType) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  try {
    let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
      await phAccessHelper.getAssets(fetchAllOption());
    let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
      new photoAccessHelper.MediaAssetChangeRequest(asset);
    if (imageType) {
      await assetChangeRequest.saveCameraPhoto(imageType);
    } else {
      await assetChangeRequest.saveCameraPhoto();
    }
    await phAccessHelper.applyChanges(assetChangeRequest);
    console.info('apply saveCameraPhoto successfully');
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code},${error.message}`, testName);
    expect().assertFail();
    done();
  }
}

export default function MediaAssetChangeRequestSaveCameraPhotoTest() {
  describe('MediaAssetChangeRequestSaveCameraPhotoTest', () => {

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
     * @tc.name   MediaAssetChangeRequest_saveCameraPhoto_promise_001
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_001
     * @tc.desc   saveCameraPhoto(imageFileType: ImageFileType): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_saveCameraPhoto_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_saveCameraPhoto_promise_001';
      const imageType = photoAccessHelper.ImageFileType.JPEG;
      await saveCameraPhotoPromiseTest(done, testName, imageType);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_saveCameraPhoto_promise_002
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_002
     * @tc.desc   saveCameraPhoto(imageFileType: ImageFileType): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_saveCameraPhoto_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_saveCameraPhoto_promise_002';
      const imageType = photoAccessHelper.ImageFileType.HEIF;
      await saveCameraPhotoPromiseTest(done, testName, imageType);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_saveCameraPhoto_promise_003
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_003
     * @tc.desc   saveCameraPhoto(): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_saveCameraPhoto_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_saveCameraPhoto_promise_003';
      const imageType = photoAccessHelper.ImageFileType.HEIF;
      await saveCameraPhotoPromiseTest(done, testName, imageType);
    })
  })
}