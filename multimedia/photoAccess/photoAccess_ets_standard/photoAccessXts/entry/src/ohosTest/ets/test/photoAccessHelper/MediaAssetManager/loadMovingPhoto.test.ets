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

const TAG = LOG_TAG + 'loadMovingPhoto';

async function loadMovingPhotoPromiseTest(done: Function, testName: string, videoPahUri: string, imagePathUri: string
) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  try {
    let imageFileUri: string = 'file://' + testContext.filesDir + "/" + imagePathUri;
    let videoFileUri: string =
      'file://' + testContext.filesDir + "/" + videoPahUri;
    let movingPhoto: photoAccessHelper.MovingPhoto =
      await photoAccessHelper.MediaAssetManager.loadMovingPhoto(testContext, imageFileUri, videoFileUri);
    console.info(TAG, testName, 'movingPhoto:' + JSON.stringify(movingPhoto));
    expect(true).assertTrue();
    done();
  } catch (err) {
    console.error(`loadMovingPhoto failed with error: ${err.code}, ${err.message}`);
    expect().assertFail();
    done();
  }
}

export default function MediaAssetManagerLoadMovingPhotoTest() {
  describe('MediaAssetManagerLoadMovingPhotoTest', () => {

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
     * @tc.number    : MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_001
     * @tc.name      : MediaAssetManager_cancelRequest_promise_001
     * @tc.desc      : cancelRequest
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MediaAssetManager_cancelRequest_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetManager_cancelRequest_promise_001';
      const videoFileName = '1vp9_320x240_30.mp4';
      const videoPath = '1vp9_320x240_30.mp4';
      await copyImageToSandbox(videoFileName, videoPath);
      const imageFileName = '1vp9_320x240_30.mp4';
      const imagePath = '1vp9_320x240_30.mp4';
      await copyImageToSandbox(imageFileName, imagePath);
      await loadMovingPhotoPromiseTest(done, testName, videoPath, imagePath);
    })

    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_002
     * @tc.name      : MediaAssetManager_cancelRequest_promise_002
     * @tc.desc      : cancelRequest
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('MediaAssetManager_cancelRequest_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetManager_cancelRequest_promise_002';
      const videoFileName = '1vp9_320x240_30.mp4';
      const videoPath = '1vp9_320x240_30.mp4';
      await copyImageToSandbox(videoFileName, videoPath);
      const imageFileName = '1vp9_320x240_30.mp4';
      const imagePath = '1vp9_320x240_30.mp4';
      await copyImageToSandbox(imageFileName, imagePath);
      await loadMovingPhotoPromiseTest(done, testName, 'videoPath', 'imagePath');
    })*/
  })
}