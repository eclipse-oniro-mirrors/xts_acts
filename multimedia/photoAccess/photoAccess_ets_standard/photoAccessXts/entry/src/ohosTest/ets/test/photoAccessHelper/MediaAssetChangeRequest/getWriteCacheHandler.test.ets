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
import { fileIo } from '@kit.CoreFileKit';

const TAG = LOG_TAG + 'getWriteCacheHandler';

async function getWriteCacheHandlerPromiseTest(done: Function, testName: string,
  photoType: photoAccessHelper.PhotoType, type: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let extension: string = type;
    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
      photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
    let fd: number = await assetChangeRequest.getWriteCacheHandler();
    console.info('getWriteCacheHandler successfully');
    await fileIo.close(fd);
    await phAccessHelper.applyChanges(assetChangeRequest)
    expect(true).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code},${error.message}`, testName);
    expect().assertFail();
    done();
  }
}

export default function MediaAssetChangeRequestGetWriteCacheHandlerTest() {
  describe('MediaAssetChangeRequestGetWriteCacheHandlerTest', () => {

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
     * @tc.number    : MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_001
     * @tc.name      : MediaAssetChangeRequest_getWriteCacheHandler_promise_001
     * @tc.desc      : getWriteCacheHandler
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MediaAssetChangeRequest_getWriteCacheHandler_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_getWriteCacheHandler_promise_001';
      let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
      const type = 'mp4';
      await getWriteCacheHandlerPromiseTest(done, testName, photoType, type);
    })

    /**
     * @tc.number    : MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_002
     * @tc.name      : MediaAssetChangeRequest_getWriteCacheHandler_promise_002
     * @tc.desc      : getWriteCacheHandler
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MediaAssetChangeRequest_getWriteCacheHandler_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_getWriteCacheHandler_promise_002';
      let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
      const type = 'jpg';
      await getWriteCacheHandlerPromiseTest(done, testName, photoType, type);
    })

    /**
     * @tc.number    : MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_003
     * @tc.name      : MediaAssetChangeRequest_getWriteCacheHandler_promise_003
     * @tc.desc      : getWriteCacheHandler
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MediaAssetChangeRequest_getWriteCacheHandler_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_getWriteCacheHandler_promise_003';
      let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
      const type = 'png';
      await getWriteCacheHandlerPromiseTest(done, testName, photoType, type);
    })

    /**
     * @tc.number    : MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_004
     * @tc.name      : MediaAssetChangeRequest_getWriteCacheHandler_promise_004
     * @tc.desc      : getWriteCacheHandler
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MediaAssetChangeRequest_getWriteCacheHandler_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_getWriteCacheHandler_promise_004';
      let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
      const type = 'jpeg';
      await getWriteCacheHandlerPromiseTest(done, testName, photoType, type);
    })

    /**
     * @tc.number    : MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_005
     * @tc.name      : MediaAssetChangeRequest_getWriteCacheHandler_promise_005
     * @tc.desc      : getWriteCacheHandler
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MediaAssetChangeRequest_getWriteCacheHandler_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_getWriteCacheHandler_promise_005';
      let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
      const type = 'svg';
      await getWriteCacheHandlerPromiseTest(done, testName, photoType, type);
    })

    /**
     * @tc.number    : MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_006
     * @tc.name      : MediaAssetChangeRequest_getWriteCacheHandler_promise_006
     * @tc.desc      : getWriteCacheHandler
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MediaAssetChangeRequest_getWriteCacheHandler_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_getWriteCacheHandler_promise_006';
      let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
      const type = 'webp';
      await getWriteCacheHandlerPromiseTest(done, testName, photoType, type);
    })

    /**
     * @tc.number    : MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_007
     * @tc.name      : MediaAssetChangeRequest_getWriteCacheHandler_promise_007
     * @tc.desc      : getWriteCacheHandler
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MediaAssetChangeRequest_getWriteCacheHandler_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_getWriteCacheHandler_promise_007';
      let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
      const type = 'gif';
      await getWriteCacheHandlerPromiseTest(done, testName, photoType, type);
    })
  })
}