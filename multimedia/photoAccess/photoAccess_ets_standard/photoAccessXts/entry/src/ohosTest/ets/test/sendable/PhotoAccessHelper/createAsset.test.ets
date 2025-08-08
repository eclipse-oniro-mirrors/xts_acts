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
import { driveFn, getPermission, LOG_TAG } from '../../common';
import { common } from '@kit.AbilityKit';
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'sendablePhotoAccessHelperCreateAssetTest';

async function createAssetPromiseWithOptionsTest(done: Function, type: sendablePhotoAccessHelper.PhotoType,
  extension: string, options: photoAccessHelper.CreateOptions) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const sendablePhAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    const uri = await sendablePhAccessHelper.createAsset(type, extension, options);
    console.info(TAG, `createAsset success; uri: ${uri}`);
    expect(true).assertTrue();
    done();
  } catch (error) {
    console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
    expect().assertFail();
    done();
  }
}

async function createAssetPromiseWithOptionsAbnormalTest(done: Function,
  type: sendablePhotoAccessHelper.PhotoType | undefined,
  extension: string | undefined, options: photoAccessHelper.CreateOptions | undefined) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const sendablePhAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    const uri =
      await sendablePhAccessHelper.createAsset(type as sendablePhotoAccessHelper.PhotoType, extension as string,
        options);
    console.info(TAG, `createAsset success; uri: ${uri}`);
    expect(true).assertTrue();
    done();
  } catch (error) {
    console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
    expect(error?.code == ErrorCode.ARGUMENT_INVALID_ERROR_CODE || error?.code == ErrorCode.SYSTEM_INNER_ERROR_CODE)
      .assertTrue();
    done();
  }
}

async function createAssetPromiseTest(done: Function, type: sendablePhotoAccessHelper.PhotoType, extension: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const sendablePhAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    const uri = await sendablePhAccessHelper.createAsset(type, extension);
    console.info(TAG, `createAsset success; uri: ${uri}`);
    expect(true).assertTrue();
    done();
  } catch (error) {
    console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
    expect().assertFail();
    done();
  }
}

async function createAssetPromiseAbnormalTest(done: Function, type: sendablePhotoAccessHelper.PhotoType | undefined,
  extension: string | undefined) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const sendablePhAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    const uri =
      await sendablePhAccessHelper.createAsset(type as sendablePhotoAccessHelper.PhotoType, extension as string);
    console.info(TAG, `createAsset success; uri: ${uri}`);
    expect(true).assertTrue();
    done();
  } catch (error) {
    console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
    expect(error?.code == ErrorCode.ARGUMENT_INVALID_ERROR_CODE || error?.code == ErrorCode.SYSTEM_INNER_ERROR_CODE)
      .assertTrue();
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
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_CREATE_ASSET_SENDABLE_001
     * @tc.name      : createAsset_sendable_promise_image_ops_001
     * @tc.desc      : promise, image, with options, extension->jpg
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createAsset_sendable_promise_image_ops_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_image_ops_001';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
      };
      await createAssetPromiseWithOptionsTest(done, type, extension, options);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_CREATE_ASSET_SENDABLE_002
     * @tc.name      : createAsset_sendable_promise_image_ops_002
     * @tc.desc      : promise, image, with options, extension->jpg, subtype->MOVING_PHOTO
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createAsset_sendable_promise_image_ops_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_image_ops_002';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: photoAccessHelper.PhotoSubtype.MOVING_PHOTO
      };
      await createAssetPromiseWithOptionsTest(done, type, extension, options);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_CREATE_ASSET_SENDABLE_003
     * @tc.name      : createAsset_sendable_promise_image_ops_003
     * @tc.desc      : promise, image, with options, extension->jpg, subtype->BURST
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createAsset_sendable_promise_image_ops_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_image_ops_003';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: photoAccessHelper.PhotoSubtype.BURST
      };
      await createAssetPromiseWithOptionsTest(done, type, extension, options);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_CREATE_ASSET_SENDABLE_004
     * @tc.name      : createAsset_sendable_promise_image_ops_abnormal_001
     * @tc.desc      : promise, image, with options, type->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createAsset_sendable_promise_image_ops_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_image_ops_abnormal_001';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType | undefined = undefined;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle
      };
      await createAssetPromiseWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_CREATE_ASSET_SENDABLE_005
     * @tc.name      : createAsset_sendable_promise_image_ops_abnormal_002
     * @tc.desc      : promise, image, with options, extension->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createAsset_sendable_promise_image_ops_abnormal_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_image_ops_abnormal_002';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
      const extension = undefined;
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle
      };
      await createAssetPromiseWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_CREATE_ASSET_SENDABLE_006
     * @tc.name      : createAsset_sendable_promise_image_ops_abnormal_003
     * @tc.desc      : promise, image, with options, options->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createAsset_sendable_promise_image_ops_abnormal_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_image_ops_abnormal_003';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions | undefined = undefined;
      await createAssetPromiseWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_CREATE_ASSET_SENDABLE_007
     * @tc.name      : createAsset_sendable_promise_image_ops_abnormal_004
     * @tc.desc      : promise, image, with options, title->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createAsset_sendable_promise_image_ops_abnormal_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_image_ops_abnormal_004';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: undefined
      };
      await createAssetPromiseWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_CREATE_ASSET_SENDABLE_008
     * @tc.name      : createAsset_sendable_promise_image_ops_abnormal_005
     * @tc.desc      : promise, image, with options, subtype->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createAsset_sendable_promise_image_ops_abnormal_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_image_ops_abnormal_005';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: undefined
      };
      await createAssetPromiseWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_CREATE_ASSET_SENDABLE_009
     * @tc.name      : createAsset_sendable_promise_image_ops_abnormal_006
     * @tc.desc      : promise, image, with options, extension->invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createAsset_sendable_promise_image_ops_abnormal_006', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_image_ops_abnormal_006';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
      const extension = 'invalid';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle
      };
      await createAssetPromiseWithOptionsAbnormalTest(done, type, extension, options);
    })


    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_CREATE_ASSET_SENDABLE_010
     * @tc.name      : createAsset_sendable_promise_image_001
     * @tc.desc      : promise, image, extension->jpg
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createAsset_sendable_promise_image_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_image_001';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      await createAssetPromiseTest(done, type, extension);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_CREATE_ASSET_SENDABLE_011
     * @tc.name      : createAsset_sendable_promise_image_abnormal_001
     * @tc.desc      : promise, image, type->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createAsset_sendable_promise_image_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_image_abnormal_001';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType | undefined = undefined;
      const extension = 'jpg';
      await createAssetPromiseAbnormalTest(done, type, extension);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_CREATE_ASSET_SENDABLE_012
     * @tc.name      : createAsset_sendable_promise_image_abnormal_002
     * @tc.desc      : promise, image, extension->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createAsset_sendable_promise_image_abnormal_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_image_abnormal_002';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
      const extension = undefined;
      await createAssetPromiseAbnormalTest(done, type, extension);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_CREATE_ASSET_SENDABLE_013
     * @tc.name      : createAsset_promise_video_ops_002
     * @tc.desc      : promise, image, extension->invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createAsset_sendable_promise_image_abnormal_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_image_abnormal_003';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
      const extension = 'invalid';
      await createAssetPromiseAbnormalTest(done, type, extension);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_CREATE_ASSET_SENDABLE_014
     * @tc.name      : createAsset_sendable_promise_video_ops_001
     * @tc.desc      : promise, video, with options, extension->mp4
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createAsset_sendable_promise_video_ops_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_video_ops_001';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle
      };
      await createAssetPromiseWithOptionsTest(done, type, extension, options);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_CREATE_ASSET_SENDABLE_015
     * @tc.name      : createAsset_sendable_promise_video_ops_002
     * @tc.desc      : promise, video, with options, extension->mp4, subtype->MOVING_PHOTO
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createAsset_sendable_promise_video_ops_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_video_ops_002';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: photoAccessHelper.PhotoSubtype.MOVING_PHOTO
      };
      await createAssetPromiseWithOptionsTest(done, type, extension, options);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_CREATE_ASSET_SENDABLE_016
     * @tc.name      : createAsset_sendable_promise_video_ops_003
     * @tc.desc      : promise, video, with options, extension->mp4, subtype->BURST
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createAsset_sendable_promise_video_ops_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_video_ops_003';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: photoAccessHelper.PhotoSubtype.BURST
      };
      await createAssetPromiseWithOptionsTest(done, type, extension, options);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_CREATE_ASSET_SENDABLE_017
     * @tc.name      : createAsset_sendable_promise_video_ops_abnormal_001
     * @tc.desc      : promise, video, with options, type->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createAsset_sendable_promise_video_ops_abnormal_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_promise_video_ops_abnormal_001';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType | undefined = undefined;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle
      };
      await createAssetPromiseWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_CREATE_ASSET_SENDABLE_018
     * @tc.name      : createAsset_sendable_promise_video_ops_abnormal_002
     * @tc.desc      : promise, video, with options, extension->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createAsset_sendable_promise_video_ops_abnormal_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_video_ops_abnormal_002';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.VIDEO;
      const extension = undefined;
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle
      };
      await createAssetPromiseWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_CREATE_ASSET_SENDABLE_019
     * @tc.name      : createAsset_sendable_promise_video_ops_abnormal_003
     * @tc.desc      : promise, video, with options, options->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createAsset_sendable_promise_video_ops_abnormal_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_video_ops_abnormal_003';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions | undefined = undefined;
      await createAssetPromiseWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_CREATE_ASSET_SENDABLE_020
     * @tc.name      : createAsset_sendable_promise_video_ops_abnormal_004
     * @tc.desc      : promise, video, with options, title->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createAsset_sendable_promise_video_ops_abnormal_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_video_ops_abnormal_004';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: undefined
      };
      await createAssetPromiseWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_CREATE_ASSET_SENDABLE_021
     * @tc.name      : createAsset_sendable_promise_video_ops_abnormal_005
     * @tc.desc      : promise, video, with options, subtype->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createAsset_sendable_promise_video_ops_abnormal_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_video_ops_abnormal_005';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: undefined
      };
      await createAssetPromiseWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_CREATE_ASSET_SENDABLE_022
     * @tc.name      : createAsset_sendable_promise_video_ops_abnormal_006
     * @tc.desc      : promise, video, with options, extension->invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createAsset_sendable_promise_video_ops_abnormal_006', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_video_ops_abnormal_006';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.VIDEO;
      const extension = 'invalid';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle
      };
      await createAssetPromiseWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_CREATE_ASSET_SENDABLE_023
     * @tc.name      : createAsset_sendable_promise_video_001
     * @tc.desc      : promise, video, extension->mp4
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createAsset_sendable_promise_video_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_video_001';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      await createAssetPromiseTest(done, type, extension);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_CREATE_ASSET_SENDABLE_024
     * @tc.name      : createAsset_sendable_promise_video_abnormal_001
     * @tc.desc      : promise, video, type->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createAsset_sendable_promise_video_abnormal_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_video_abnormal_001';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType | undefined = undefined;
      const extension = 'mp4';
      await createAssetPromiseAbnormalTest(done, type, extension);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_CREATE_ASSET_SENDABLE_025
     * @tc.name      : createAsset_sendable_promise_video_abnormal_002
     * @tc.desc      : promise, video, extension->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createAsset_sendable_promise_video_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_video_abnormal_002';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.VIDEO;
      const extension = undefined;
      await createAssetPromiseAbnormalTest(done, type, extension);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_CREATE_ASSET_SENDABLE_026
     * @tc.name      : createAsset_sendable_promise_video_abnormal_003
     * @tc.desc      : promise, video, extension->invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createAsset_sendable_promise_video_abnormal_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_sendable_promise_video_abnormal_003';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.VIDEO;
      const extension = 'invalid';
      await createAssetPromiseAbnormalTest(done, type, extension);
    })
  })
}