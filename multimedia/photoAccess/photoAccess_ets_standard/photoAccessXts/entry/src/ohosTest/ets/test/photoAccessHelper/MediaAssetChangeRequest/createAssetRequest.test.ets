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

const TAG = LOG_TAG + 'createAssetRequest';

async function createAssetRequestPromiseTest(done: Function, testName: string, pathUri: string, extension: string,
  photoType: photoAccessHelper.PhotoType) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let options: photoAccessHelper.CreateOptions = {
      title: 'testPhoto'
    };
    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
      photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension, options);
    let fileUri = 'file://' + testContext.filesDir + '/' + pathUri
    let ResourceType = photoType == photoAccessHelper.PhotoType.IMAGE ? photoAccessHelper.ResourceType.IMAGE_RESOURCE :
    photoAccessHelper.ResourceType.VIDEO_RESOURCE;
    await assetChangeRequest.addResource(ResourceType, fileUri);
    await phAccessHelper.applyChanges(assetChangeRequest);
    console.info('apply createAssetRequest successfully');
    expect(true).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `createImageAssetRequestDemo failed with error: ${error},${error.code},${error.message}`,
      testName);
    expect().assertFail();
    done();
  }
}

export default function MediaAssetChangeRequestCreateAssetRequestTest() {
  describe('MediaAssetChangeRequestCreateAssetRequestTest', () => {

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
     * @tc.number    : MEDIA_ASSET_CHANGE_REQUEST_CREATE_ASSET_REQUEST_001
     * @tc.name      : MediaAssetChangeRequest_createAssetRequest_promise_001
     * @tc.desc      : createAssetRequest
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MediaAssetChangeRequest_createAssetRequest_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName: string = 'MediaAssetChangeRequest_createAssetRequest_promise_001';
      const fileName = 'test.jpg';
      const path = 'test.jpg';
      let extension: string = 'jpg';
      let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
      await copyImageToSandbox(fileName, path);
      await createAssetRequestPromiseTest(done, testName, path, extension, photoType);
    })

    /**
     * @tc.number    : MEDIA_ASSET_CHANGE_REQUEST_CREATE_ASSET_REQUEST_002
     * @tc.name      : MediaAssetChangeRequest_createAssetRequest_promise_002
     * @tc.desc      : createAssetRequest
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MediaAssetChangeRequest_createAssetRequest_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName: string = 'MediaAssetChangeRequest_createAssetRequest_promise_002';
      const fileName = 'test.svg';
      const path = 'test.svg';
      let extension: string = 'svg';
      let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
      await copyImageToSandbox(fileName, path);
      await createAssetRequestPromiseTest(done, testName, path, extension, photoType);
    })

    /**
     * @tc.number    : MEDIA_ASSET_CHANGE_REQUEST_CREATE_ASSET_REQUEST_003
     * @tc.name      : MediaAssetChangeRequest_createAssetRequest_promise_003
     * @tc.desc      : createAssetRequest
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MediaAssetChangeRequest_createAssetRequest_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName: string = 'MediaAssetChangeRequest_createAssetRequest_promise_003';
      const fileName = '1vp9_320x240_30.mp4';
      const path = '1vp9_320x240_30.mp4';
      let extension: string = 'mp4';
      let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
      await copyImageToSandbox(fileName, path);
      await createAssetRequestPromiseTest(done, testName, path, extension, photoType);
    })

    /**
     * @tc.number    : MEDIA_ASSET_CHANGE_REQUEST_CREATE_ASSET_REQUEST_004
     * @tc.name      : MediaAssetChangeRequest_createAssetRequest_promise_004
     * @tc.desc      : createAssetRequest
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MediaAssetChangeRequest_createAssetRequest_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName: string = 'MediaAssetChangeRequest_createAssetRequest_promise_004';
      const fileName = 'test6.gif';
      const path = 'test6.gif';
      let extension: string = 'gif';
      let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
      await copyImageToSandbox(fileName, path);
      await createAssetRequestPromiseTest(done, testName, path, extension, photoType);
    })
  })
}