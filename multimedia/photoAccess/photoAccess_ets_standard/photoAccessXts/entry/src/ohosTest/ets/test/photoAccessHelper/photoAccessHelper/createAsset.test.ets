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
import { describe, it, expect, beforeAll, Level, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { driveFn, getPermission, LOG_TAG, photoType } from '../../common';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'createAssetTest';

async function createAssetCallbackWithOptionsTest(done: Function, type: photoAccessHelper.PhotoType, extension: string,
  options: photoAccessHelper.CreateOptions) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    helper.createAsset(type, extension, options, (error, uri) => {
      if (error !== undefined) {
        console.error(TAG, `createAsset callback failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
      } else {
        console.info(TAG, `createAsset success, uri: ${uri}`);
      }
      done();
    })
  } catch (error) {
    console.error(TAG, `createAsset failed; error: ${error?.code}, ${error?.message}`);
    expect(error?.code == ErrorCode.PARAM_ERROR_CODE).assertTrue();
    done();
  }
}

async function createAssetCallbackWithOptionsAbnormalTest(done: Function, type: photoAccessHelper.PhotoType | undefined,
  extension: string | undefined, options: photoAccessHelper.CreateOptions | undefined) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    helper.createAsset(type, extension, options, (error, uri) => {
      if (error !== undefined) {
        console.error(TAG, `createAsset callback failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
      } else {
        console.info(TAG, `createAsset success, uri: ${uri}`);
      }
      done();
    })
  } catch (error) {
    console.error(TAG, `createAsset failed; error: ${error?.code}, ${error?.message}`);
    expect(error?.code == ErrorCode.ARGUMENT_INVALID_ERROR_CODE).assertTrue();
    done();
  }
}

async function createAssetCallbackTest(done: Function, type: photoAccessHelper.PhotoType, extension: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    helper.createAsset(type, extension, (error, uri) => {
      if (error !== undefined) {
        console.error(TAG, `createAsset callback failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
      } else {
        console.info(TAG, `createAsset success; uri: ${uri}`);
      }
      done();
    })
  } catch (error) {
    console.error(TAG, `createAsset failed; error: ${error?.code}, ${error?.message}`);
    expect(error?.code == ErrorCode.PARAM_ERROR_CODE).assertTrue();
    done();
  }
}

async function createAssetCallbackAbnormalTest(done: Function, type: photoAccessHelper.PhotoType | undefined,
  extension: string | undefined) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    helper.createAsset(type, extension, (error: BusinessError, uri: string) => {
      if (error !== undefined) {
        console.error(TAG, `createAsset failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
      } else {
        console.info(TAG, `createAsset success; uri: ${uri}`);
      }
      done();
    })
  } catch (error) {
    console.error(TAG, `createAsset catch failed; error: ${error?.code}, ${error?.message}`);
    expect(error?.code == ErrorCode.ARGUMENT_INVALID_ERROR_CODE).assertTrue();
    done();
  }
}

async function createAssetPromiseWithOptionsTest(done: Function, type: photoAccessHelper.PhotoType, extension: string,
  options: photoAccessHelper.CreateOptions) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    const uri = await helper.createAsset(type, extension, options);
    console.info(TAG, `createAsset success; uri: ${uri}`);
    done();
  } catch (error) {
    console.error(TAG, `createAsset failed; error: ${error?.code}, ${error?.message}`);
    expect(error?.code == ErrorCode.PARAM_ERROR_CODE).assertTrue();
    done();
  }
}

async function createAssetPromiseWithOptionsAbnormalTest(done: Function, type: photoAccessHelper.PhotoType | undefined,
  extension: string | undefined, options: photoAccessHelper.CreateOptions | undefined) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    const uri = await helper.createAsset(type as photoAccessHelper.PhotoType, extension as string, options);
    console.info(TAG, `createAsset success; uri: ${uri}`);
    done();
  } catch (error) {
    console.error(TAG, `createAsset failed; error: ${error?.code}, ${error?.message}`);
    expect(error?.code == ErrorCode.ARGUMENT_INVALID_ERROR_CODE).assertTrue();
    done();
  }
}

async function createAssetPromiseTest(done: Function, type: photoAccessHelper.PhotoType, extension: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    const uri = await helper.createAsset(type, extension);
    console.info(TAG, `createAsset success; uri: ${uri}`);
    done();
  } catch (error) {
    console.error(TAG, `createAsset failed; error: ${error?.code}, ${error?.message}`);
    expect(error?.code == ErrorCode.PARAM_ERROR_CODE).assertTrue();
    done();
  }
}

async function createAssetPromiseAbnormalTest(done: Function, type: photoAccessHelper.PhotoType | undefined,
  extension: string | undefined) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    const uri = await helper.createAsset(type, extension);
    console.info(TAG, `createAsset success; uri: ${uri}`);
    done();
  } catch (error) {
    console.error(TAG, `createAsset failed; error: ${error?.code}, ${error?.message}`);
    expect(error?.code == ErrorCode.ARGUMENT_INVALID_ERROR_CODE).assertTrue();
    done();
  }
}

export default function createAssetTest() {
  describe('createAssetTest', () => {
    const testTitle = 'createAssetTest';

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
     * @tc.name   createAsset_callback_image_ops_001
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_001
     * @tc.desc   callback, image, with options, extension->jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAsset_callback_image_ops_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_callback_image_ops_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle
      };
      await createAssetCallbackWithOptionsTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_callback_image_ops_002
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_002
     * @tc.desc   callback, image, with options, extension->invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createAsset_callback_image_ops_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_callback_image_ops_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.IMAGE;
      const extension = 'invalid';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle
      };
      await createAssetCallbackWithOptionsTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_callback_image_ops_003
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_003
     * @tc.desc   callback, image, with options, extension->jpg, subtype->MOVING_PHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAsset_callback_image_ops_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_callback_image_ops_003';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: photoAccessHelper.PhotoSubtype.MOVING_PHOTO
      };
      await createAssetCallbackWithOptionsTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_callback_image_ops_004
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_004
     * @tc.desc   callback, image, with options, extension->jpg, subtype->BURST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAsset_callback_image_ops_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_callback_image_ops_004';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: photoAccessHelper.PhotoSubtype.BURST
      };
      await createAssetCallbackWithOptionsTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_callback_image_ops_abnormal_001
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_005
     * @tc.desc   callback, image, with options, type->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createAsset_callback_image_ops_abnormal_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_callback_image_ops_abnormal_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType | undefined = undefined;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle
      };
      await createAssetCallbackWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_callback_image_ops_abnormal_002
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_006
     * @tc.desc   callback, image, with options, type->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createAsset_callback_image_ops_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_callback_image_ops_abnormal_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.IMAGE;
      const extension = undefined;
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle
      };
      await createAssetCallbackWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_callback_image_ops_abnormal_003
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_007
     * @tc.desc   callback, image, with options, options->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createAsset_callback_image_ops_abnormal_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_callback_image_ops_abnormal_003';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions | undefined = undefined;
      await createAssetCallbackWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_callback_image_ops_abnormal_004
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_008
     * @tc.desc   callback, image, with options, title->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createAsset_callback_image_ops_abnormal_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_callback_image_ops_abnormal_004';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: undefined
      };
      await createAssetCallbackWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_callback_image_ops_abnormal_005
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_009
     * @tc.desc   callback, image, with options, subtype->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('createAsset_callback_image_ops_abnormal_005', Level.LEVEL4, async (done: Function) => {
      const testName = 'createAsset_callback_image_ops_abnormal_005';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: undefined
      };
      await createAssetCallbackWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_callback_image_001
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_010
     * @tc.desc   callback, image, extension->jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAsset_callback_image_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_callback_image_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.IMAGE;
      const extension = 'jpg';
      await createAssetCallbackTest(done, type, extension);
    })

    /**
     * @tc.name   createAsset_callback_image_002
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_011
     * @tc.desc   callback, image, extension->invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createAsset_callback_image_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_callback_image_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.IMAGE;
      const extension = 'invalid';
      await createAssetCallbackTest(done, type, extension);
    })

    /**
     * @tc.name   createAsset_callback_image_abnormal_001
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_012
     * @tc.desc   callback, image, type->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAsset_callback_image_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_callback_image_abnormal_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType | undefined = undefined;
      const extension = 'jpg';
      await createAssetCallbackAbnormalTest(done, type, extension);
    })

    /**
     * @tc.name   createAsset_callback_image_abnormal_002
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_013
     * @tc.desc   callback, image, extension->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAsset_callback_image_abnormal_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_callback_image_abnormal_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.IMAGE;
      const extension = undefined;
      await createAssetCallbackAbnormalTest(done, type, extension);
    })

    /**
     * @tc.name   createAsset_callback_video_ops_001
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_014
     * @tc.desc   callback, video, with options, extension->mp4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAsset_callback_video_ops_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_callback_video_ops_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle
      };
      await createAssetCallbackWithOptionsTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_callback_video_ops_002
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_015
     * @tc.desc   callback, video, with options, extension->invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('createAsset_callback_video_ops_002', Level.LEVEL4, async (done: Function) => {
      const testName = 'createAsset_callback_video_ops_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = 'invalid';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle
      };
      await createAssetCallbackWithOptionsTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_callback_video_ops_003
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_016
     * @tc.desc   callback, video, with options, extension->mp4, subtype->MOVING_PHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAsset_callback_video_ops_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_callback_video_ops_003';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: photoAccessHelper.PhotoSubtype.MOVING_PHOTO
      };
      await createAssetCallbackWithOptionsTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_callback_video_ops_004
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_017
     * @tc.desc   callback, video, with options, extension->mp4, subtype->BURST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAsset_callback_video_ops_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_callback_video_ops_004';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: photoAccessHelper.PhotoSubtype.BURST
      };
      await createAssetCallbackWithOptionsTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_callback_video_ops_abnormal_001
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_018
     * @tc.desc   callback, video, with options, type->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createAsset_callback_video_ops_abnormal_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_callback_image_abnormal_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType | undefined = undefined;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle
      };
      await createAssetCallbackWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_callback_video_ops_abnormal_002
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_019
     * @tc.desc   callback, video, with options, extension->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createAsset_callback_video_ops_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_callback_video_ops_abnormal_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = undefined;
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle
      };
      await createAssetCallbackWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_callback_video_ops_abnormal_003
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_020
     * @tc.desc   callback, video, with options, options->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createAsset_callback_video_ops_abnormal_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_callback_video_ops_abnormal_003';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions | undefined = undefined;
      await createAssetCallbackWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_callback_video_ops_abnormal_004
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_021
     * @tc.desc   callback, video, with options, title->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createAsset_callback_video_ops_abnormal_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_callback_video_ops_abnormal_004';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: undefined
      };
      await createAssetCallbackWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_callback_video_ops_abnormal_005
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_022
     * @tc.desc   callback, video, with options, subtype->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createAsset_callback_video_ops_abnormal_005', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_callback_video_ops_abnormal_005';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: undefined
      };
      await createAssetCallbackWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_callback_video_001
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_023
     * @tc.desc   callback, video, extension->mp4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAsset_callback_video_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_callback_video_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = 'mp4';
      await createAssetCallbackTest(done, type, extension);
    })

    /**
     * @tc.name   createAsset_callback_video_002
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_024
     * @tc.desc   callback, video, extension->invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createAsset_callback_video_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_callback_video_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = 'invalid';
      await createAssetCallbackTest(done, type, extension);
    })

    /**
     * @tc.name   createAsset_callback_video_abnormal_001
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_025
     * @tc.desc   callback, video, type->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createAsset_callback_video_abnormal_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_callback_video_abnormal_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType | undefined = undefined;
      const extension = 'mp4';
      await createAssetCallbackAbnormalTest(done, type, extension);
    })

    /**
     * @tc.name   createAsset_callback_video_abnormal_002
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_026
     * @tc.desc   callback, video, extension->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createAsset_callback_video_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_callback_video_abnormal_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = undefined;
      await createAssetCallbackAbnormalTest(done, type, extension);
    })

    /**
     * @tc.name   createAsset_promise_image_ops_001
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_027
     * @tc.desc   promise, image, with options, extension->jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAsset_promise_image_ops_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_promise_image_ops_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle
      };
      await createAssetPromiseWithOptionsTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_promise_image_ops_002
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_028
     * @tc.desc   promise, image, with options, extension->invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createAsset_promise_image_ops_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_promise_image_ops_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.IMAGE;
      const extension = 'invalid';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle
      };
      await createAssetPromiseWithOptionsTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_promise_image_ops_003
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_029
     * @tc.desc   promise, image, with options, extension->jpg, subtype->MOVING_PHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAsset_promise_image_ops_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_promise_image_ops_003';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: photoAccessHelper.PhotoSubtype.MOVING_PHOTO
      };
      await createAssetPromiseWithOptionsTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_promise_image_ops_004
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_030
     * @tc.desc   promise, image, with options, extension->jpg, subtype->BURST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAsset_promise_image_ops_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_promise_image_ops_004';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: photoAccessHelper.PhotoSubtype.BURST
      };
      await createAssetPromiseWithOptionsTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_promise_image_ops_abnormal_001
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_031
     * @tc.desc   promise, image, with options, type->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createAsset_promise_image_ops_abnormal_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_promise_image_ops_abnormal_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType | undefined = undefined;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle
      };
      await createAssetPromiseWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_promise_image_ops_abnormal_002
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_032
     * @tc.desc   promise, image, with options, extension->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createAsset_promise_image_ops_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_promise_image_ops_abnormal_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.IMAGE;
      const extension = undefined;
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle
      };
      await createAssetPromiseWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_promise_image_ops_abnormal_003
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_033
     * @tc.desc   promise, image, with options, options->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createAsset_promise_image_ops_abnormal_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_promise_image_ops_abnormal_003';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions | undefined = undefined;
      await createAssetPromiseWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_promise_image_ops_abnormal_004
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_034
     * @tc.desc   promise, image, with options, title->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAsset_promise_image_ops_abnormal_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_promise_image_ops_abnormal_004';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: undefined
      };
      await createAssetPromiseWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_promise_image_ops_abnormal_005
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_035
     * @tc.desc   promise, image, with options, subtype->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAsset_promise_image_ops_abnormal_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_promise_image_ops_abnormal_005';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: undefined
      };
      await createAssetPromiseWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_promise_image_001
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_036
     * @tc.desc   promise, image, extension->jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAsset_promise_image_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_promise_image_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.IMAGE;
      const extension = 'jpg';
      await createAssetPromiseTest(done, type, extension);
    })

    /**
     * @tc.name   createAsset_promise_image_002
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_037
     * @tc.desc   promise, image, extension->invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createAsset_promise_image_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_promise_image_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.IMAGE;
      const extension = 'invalid';
      await createAssetPromiseTest(done, type, extension);
    })

    /**
     * @tc.name   createAsset_promise_image_abnormal_001
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_038
     * @tc.desc   promise, image, type->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createAsset_promise_image_abnormal_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_promise_image_abnormal_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType | undefined = undefined;
      const extension = 'jpg';
      await createAssetPromiseAbnormalTest(done, type, extension);
    })

    /**
     * @tc.name   createAsset_promise_image_abnormal_002
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_039
     * @tc.desc   promise, image, extension->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createAsset_promise_image_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_promise_image_abnormal_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.IMAGE;
      const extension = undefined;
      await createAssetPromiseAbnormalTest(done, type, extension);
    })


    /**
     * @tc.name   createAsset_promise_video_ops_001
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_040
     * @tc.desc   promise, video, with options, extension->mp4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAsset_promise_video_ops_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_promise_video_ops_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle
      };
      await createAssetPromiseWithOptionsTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_promise_video_ops_002
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_041
     * @tc.desc   promise, video, with options, extension->invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAsset_promise_video_ops_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_promise_video_ops_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = 'invalid';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle
      };
      await createAssetPromiseWithOptionsTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_promise_video_ops_003
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_042
     * @tc.desc   promise, video, with options, extension->mp4, subtype->MOVING_PHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAsset_promise_video_ops_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_promise_video_ops_003';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: photoAccessHelper.PhotoSubtype.MOVING_PHOTO
      };
      await createAssetPromiseWithOptionsTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_promise_video_ops_004
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_043
     * @tc.desc   promise, video, with options, extension->mp4, subtype->BURST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAsset_promise_video_ops_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_promise_video_ops_004';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: photoAccessHelper.PhotoSubtype.BURST
      };
      await createAssetPromiseWithOptionsTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_promise_video_ops_abnormal_001
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_044
     * @tc.desc   promise, video, with options, type->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createAsset_promise_video_ops_abnormal_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_promise_video_ops_abnormal_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType | undefined = undefined;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle
      };
      await createAssetPromiseWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_promise_video_ops_abnormal_002
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_045
     * @tc.desc   promise, video, with options, extension->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createAsset_promise_video_ops_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_promise_video_ops_abnormal_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = undefined;
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle
      };
      await createAssetPromiseWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_promise_video_ops_abnormal_003
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_046
     * @tc.desc   promise, video, with options, options->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createAsset_promise_video_ops_abnormal_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_promise_video_ops_abnormal_003';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions | undefined = undefined;
      await createAssetPromiseWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_promise_video_ops_abnormal_004
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_047
     * @tc.desc   promise, video, with options, title->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAsset_promise_video_ops_abnormal_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_promise_video_ops_abnormal_004';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: undefined
      };
      await createAssetPromiseWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_promise_video_ops_abnormal_005
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_048
     * @tc.desc   promise, video, with options, subtype->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAsset_promise_video_ops_abnormal_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_promise_video_ops_abnormal_005';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: undefined
      };
      await createAssetPromiseWithOptionsAbnormalTest(done, type, extension, options);
    })

    /**
     * @tc.name   createAsset_promise_video_001
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_049
     * @tc.desc   promise, video, extension->mp4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAsset_promise_video_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAsset_promise_video_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = 'mp4';
      await createAssetPromiseTest(done, type, extension);
    })

    /**
     * @tc.name   createAsset_promise_video_002
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_050
     * @tc.desc   promise, video, extension->invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createAsset_promise_video_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_promise_video_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = 'invalid';
      await createAssetPromiseTest(done, type, extension);
    })

    /**
     * @tc.name   createAsset_promise_video_abnormal_001
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_051
     * @tc.desc   promise, video, type->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createAsset_promise_video_abnormal_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_promise_video_abnormal_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType | undefined = undefined;
      const extension = 'mp4';
      await createAssetPromiseAbnormalTest(done, type, extension);
    })

    /**
     * @tc.name   createAsset_promise_video_abnormal_002
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_052
     * @tc.desc   promise, video, extension->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createAsset_promise_video_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'createAsset_promise_video_abnormal_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = undefined;
      await createAssetPromiseAbnormalTest(done, type, extension);
    })
  })
}