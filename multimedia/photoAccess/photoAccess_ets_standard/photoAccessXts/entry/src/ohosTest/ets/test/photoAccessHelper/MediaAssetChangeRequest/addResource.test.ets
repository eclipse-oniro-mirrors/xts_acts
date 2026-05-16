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
import fs from '@ohos.file.fs';
import { fileUri } from '@kit.CoreFileKit';

const TAG = LOG_TAG + 'addResource';

async function addResourcePromiseTest(done: Function, testName: string, pathUri: string, imageType: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
    let extension: string = imageType;
    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
      photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
    // 需要确保fileUri对应的资源存在。
    let path = testContext.filesDir + '/' + pathUri;
    let uri = fileUri.getUriFromPath(path);
    let uriFlag = await fs.access(path);
    console.log('fileUri is ' + JSON.stringify(uriFlag));
    await assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, uri);
    await phAccessHelper.applyChanges(assetChangeRequest);
    console.info('addResourceByFileUri successfully');
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code},${error.message}`, testName);
    expect().assertFail();
    done();
  }
}

async function addResourceBufferPromiseTest(done: Function, testName: string, imageType: string, size: number) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    console.info('addResourceByArrayBufferDemo');
    let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
    let extension: string = imageType;
    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
      photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
    let buffer: ArrayBuffer = new ArrayBuffer(size);
    await assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, buffer);
    await phAccessHelper.applyChanges(assetChangeRequest);
    console.info('addResourceByArrayBuffer successfully');
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code},${error.message}`, testName);
    expect().assertFail();
    done();
  }
}

export default function MediaAssetChangeRequestAddResourceTest() {
  describe('MediaAssetChangeRequestAddResourceTest', () => {

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
     * @tc.name   MediaAssetChangeRequest_addResource_promise_001
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_ADD_RESOURCE_001
     * @tc.desc   addResource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_addResource_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_addResource_promise_001';
      const fileName = 'test.jpg';
      const path = 'test.jpg';
      const imageType = 'jpg';
      await copyImageToSandbox(fileName, path);
      await addResourcePromiseTest(done, testName, path, imageType);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_addResource_promise_002
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_ADD_RESOURCE_002
     * @tc.desc   addResource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_addResource_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_addResource_promise_002';
      const fileName = 'test.svg';
      const path = 'test.svg';
      const imageType = 'svg';
      await copyImageToSandbox(fileName, path);
      await addResourcePromiseTest(done, testName, path, imageType);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_addResource_promise_003
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_ADD_RESOURCE_003
     * @tc.desc   addResource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_addResource_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_addResource_promise_003';
      const fileName = 'test.jpeg';
      const path = 'test.jpeg';
      const imageType = 'jpeg';
      await copyImageToSandbox(fileName, path);
      await addResourcePromiseTest(done, testName, path, imageType);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_addResource_promise_004
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_ADD_RESOURCE_004
     * @tc.desc   addResource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_addResource_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_addResource_promise_004';
      const fileName = 'test.svg';
      const path = 'test.svg';
      const imageType = 'svg';
      await copyImageToSandbox(fileName, path);
      await addResourcePromiseTest(done, testName, path, imageType);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_addResource_promise_005
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_ADD_RESOURCE_005
     * @tc.desc   addResource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_addResource_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_addResource_promise_005';
      const fileName = 'test6.gif';
      const path = 'test6.gif';
      const imageType = 'gif';
      await copyImageToSandbox(fileName, path);
      await addResourcePromiseTest(done, testName, path, imageType);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_addResource_buffer_promise_001
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_ADD_RESOURCE_006
     * @tc.desc   addResource(type: ResourceType, data: ArrayBuffer): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_addResource_buffer_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_addResource_buffer_promise_001';
      const imageType = 'jpg';
      const size = 2048;
      await addResourceBufferPromiseTest(done, testName, imageType, size);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_addResource_buffer_promise_002
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_ADD_RESOURCE_007
     * @tc.desc   addResource(type: ResourceType, data: ArrayBuffer): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_addResource_buffer_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_addResource_buffer_promise_002';
      const imageType = 'gif';
      const size = 1024;
      await addResourceBufferPromiseTest(done, testName, imageType, size);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_addResource_buffer_promise_003
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_ADD_RESOURCE_008
     * @tc.desc   addResource(type: ResourceType, data: ArrayBuffer): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_addResource_buffer_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_addResource_buffer_promise_003';
      const imageType = 'jpeg';
      const size = 1;
      await addResourceBufferPromiseTest(done, testName, imageType, size);
    })
  })
}