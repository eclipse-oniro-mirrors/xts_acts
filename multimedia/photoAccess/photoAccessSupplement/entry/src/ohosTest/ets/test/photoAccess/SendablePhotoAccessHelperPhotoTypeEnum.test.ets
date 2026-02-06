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
import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper';
import { describe, it, expect, beforeAll, Level, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { driveFn, getPermission, LOG_TAG } from '../common';
import { common } from '@kit.AbilityKit';

const TAG = LOG_TAG + 'SendablePhotoTypeSupp';

async function createAssetPromiseWithOptionsTest(done: Function, type: sendablePhotoAccessHelper.PhotoType,
  extension: string, options: photoAccessHelper.CreateOptions, callback: (uri: string) => void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const sendablePhAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    const uri = await sendablePhAccessHelper.createAsset(type, extension, options);
    console.info(TAG, `createAsset success; uri: ${uri}`);
    callback(uri);
    done();
  } catch (error) {
    console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
    expect().assertFail();
    done();
  }
}

async function createAssetPromiseTest(done: Function, type: sendablePhotoAccessHelper.PhotoType, extension: string, callback: (uri: string) => void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const sendablePhAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    const uri = await sendablePhAccessHelper.createAsset(type, extension);
    console.info(TAG, `createAsset success; uri: ${uri}`);
    callback(uri);
    done();
  } catch (error) {
    console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
    expect().assertFail();
    done();
  }
}

export default function sendablePhotoAccessHelperCreateAssetTest() {
  describe('sendablePhotoAccessHelperCreateAssetTest', () => {
    const testTitle = 'sendablePhotoAccessHelperCreateAssetTest';

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
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
     * @tc.number createAsset_sendable_promise_image_001
     * @tc.name   createAsset_sendable_promise_image_001
     * @tc.desc   promise, PhotoType->IMAGE
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('createAsset_sendable_promise_image_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_image_001';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      await createAssetPromiseTest(done, type, extension, (uri) => {
        expect(uri.length > 0).assertTrue();
      });
    })
    /**
     * @tc.number createAsset_sendable_promise_video_001
     * @tc.name   createAsset_sendable_promise_video_001
     * @tc.desc   promise, PhotoType->VIDEO
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('createAsset_sendable_promise_video_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_video_001';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      await createAssetPromiseTest(done, type, extension, (uri) => {
        expect(uri.length > 0).assertTrue();
      });
    })




    /**
     * @tc.number createAsset_sendable_promise_photoSubtype_001
     * @tc.name   createAsset_sendable_promise_photoSubtype_001
     * @tc.desc   promise, image, with options, extension->jpg, subtype->BURST
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('createAsset_sendable_promise_photoSubtype_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_photoSubtype_001';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: photoAccessHelper.PhotoSubtype.BURST
      };
      await createAssetPromiseWithOptionsTest(done, type, extension, options, (uri) => {
        expect(uri.length > 0).assertTrue();
      });
    })
    /**
     * @tc.number createAsset_sendable_promise_photoSubtype_002
     * @tc.name   createAsset_sendable_promise_photoSubtype_002
     * @tc.desc   promise, video, with options, extension->mp4, subtype->BURST
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('createAsset_sendable_promise_photoSubtype_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_photoSubtype_002';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: photoAccessHelper.PhotoSubtype.BURST
      };
      await createAssetPromiseWithOptionsTest(done, type, extension, options, (uri) => {
        expect(uri.length > 0).assertTrue();
      });
    })

    /**
     * @tc.number SENDABLE_PHOTO_ACCESS_HELPER_CREATE_ASSET_SENDABLE_003
     * @tc.name   createAsset_sendable_promise_photoSubtype_003
     * @tc.desc   promise, video, with options, extension->mp4, subtype->MOVING_PHOTO
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('createAsset_sendable_promise_photoSubtype_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_photoSubtype_003';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: photoAccessHelper.PhotoSubtype.MOVING_PHOTO
      };
      await createAssetPromiseWithOptionsTest(done, type, extension, options, (uri) => {
        expect(uri.length > 0).assertTrue();
      });
    })
    /**
     * @tc.number SENDABLE_PHOTO_ACCESS_HELPER_CREATE_ASSET_SENDABLE_004
     * @tc.name   createAsset_sendable_promise_photoSubtype_004
     * @tc.desc   promise, image, with options, extension->jpg, subtype->MOVING_PHOTO
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('createAsset_sendable_promise_photoSubtype_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_photoSubtype_004';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: photoAccessHelper.PhotoSubtype.MOVING_PHOTO
      };
      await createAssetPromiseWithOptionsTest(done, type, extension, options, (uri) => {
        expect(uri.length > 0).assertTrue();
      });
    })
    /**
     * @tc.number SENDABLE_PHOTO_ACCESS_HELPER_CREATE_ASSET_SENDABLE_005
     * @tc.name   createAsset_sendable_promise_photoSubtype_005
     * @tc.desc   promise, video, with options, extension->mp4, subtype->DEFAULT
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('createAsset_sendable_promise_photoSubtype_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_photoSubtype_005';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT
      };
      await createAssetPromiseWithOptionsTest(done, type, extension, options, (uri) => {
        expect(uri.length > 0).assertTrue();
      });
    })
    /**
     * @tc.number SENDABLE_PHOTO_ACCESS_HELPER_CREATE_ASSET_SENDABLE_006
     * @tc.name   createAsset_sendable_promise_photoSubtype_006
     * @tc.desc   promise, image, with options, extension->jpg, subtype->DEFAULT
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('createAsset_sendable_promise_photoSubtype_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_photoSubtype_006';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT
      };
      await createAssetPromiseWithOptionsTest(done, type, extension, options, (uri) => {
        expect(uri.length > 0).assertTrue();
      });
    })

    /**
     * @tc.number    SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_EUM1_001
     * @tc.name      SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_EUM1_001
     * @tc.desc      sendablePhotoAccessHelper.PhotoType emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_EUM1_001', Level.LEVEL2, async (done: Function) => {
      console.info(TAG,'--------SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_EUM1_001---------')
      expect(sendablePhotoAccessHelper.PhotoType.IMAGE == 1).assertTrue();
      expect(sendablePhotoAccessHelper.PhotoType.VIDEO == 2).assertTrue();
      console.info(TAG,'--------SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_EUM1_001,end here---------')
      done();
    })
    /**
     * @tc.number    SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_EUM1_002
     * @tc.name      SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_EUM1_002
     * @tc.desc      sendablePhotoAccessHelper.PhotoType emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_EUM1_002', Level.LEVEL2, async (done: Function) => {
      console.info(TAG,'--------SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_EUM1_002---------')
      expect(sendablePhotoAccessHelper.PhotoSubtype.DEFAULT == 0).assertTrue();
      expect(sendablePhotoAccessHelper.PhotoSubtype.MOVING_PHOTO == 3).assertTrue();
      expect(sendablePhotoAccessHelper.PhotoSubtype.BURST == 4).assertTrue();
      console.info(TAG,'--------SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_EUM1_002,end here---------')
      done();
    })
  })
}