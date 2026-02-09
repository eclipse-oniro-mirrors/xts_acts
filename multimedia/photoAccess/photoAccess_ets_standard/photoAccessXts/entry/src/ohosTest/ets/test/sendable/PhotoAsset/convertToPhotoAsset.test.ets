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

import { describe, it, expect, beforeAll, Level, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import {
  photoKeys,
  fetchOption,
  getPermission,
  driveFn,
  pushCreateAsset,
  LOG_TAG,
  getSendableFileAsset
} from '../../common';
import common from '@ohos.app.ability.common';
import { photoAccessHelper, sendablePhotoAccessHelper } from '@kit.MediaLibraryKit';

const TAG = LOG_TAG + 'sendableConvertToPhotoAssetTest';
const IMAGE_TEST_FILE = 'getThumb.jpg';
const VIDEO_TEST_FILE = 'getThumb.mp4';

export default function sendableConvertToPhotoAssetTest() {
  describe('sendableConvertToPhotoAssetTest', () => {
    const fileNameList = [IMAGE_TEST_FILE, VIDEO_TEST_FILE];
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let convertToPhotoAsset1 = async (done: Function, testName: string, fetchOps: photoAccessHelper.FetchOptions) => {
      try {
        let sendableAsset: sendablePhotoAccessHelper.PhotoAsset =
          await getSendableFileAsset(testContext, testName, fetchOps);
        let sendableUri = sendableAsset.uri;
        let photoAsset: photoAccessHelper.PhotoAsset = sendableAsset.convertToPhotoAsset();
        console.log(TAG, 'sendableUri is: ' + sendableUri + ',photoAssetUri is: ' + photoAsset.uri);
        expect(photoAsset.uri).assertEqual(sendableUri);
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    }

    let convertToPhotoAsset2 = async (done: Function, testName: string, fetchOps: photoAccessHelper.FetchOptions) => {
      try {
        let sendableAsset: sendablePhotoAccessHelper.PhotoAsset =
          await getSendableFileAsset(testContext, testName, fetchOps);
        let sendablePhotoType = sendableAsset.photoType;
        let photoAsset: photoAccessHelper.PhotoAsset = sendableAsset.convertToPhotoAsset();
        console.log(TAG, 'sendablePhotoType is: ' + sendablePhotoType + ',photoType is: ' + photoAsset.photoType);
        expect(photoAsset.photoType).assertEqual(sendablePhotoType);
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    }

    let convertToPhotoAsset3 = async (done: Function, testName: string, fetchOps: photoAccessHelper.FetchOptions) => {
      try {
        let sendableAsset: sendablePhotoAccessHelper.PhotoAsset =
          await getSendableFileAsset(testContext, testName, fetchOps);
        let sendableDisplayName = sendableAsset.displayName;
        let photoAsset: photoAccessHelper.PhotoAsset = sendableAsset.convertToPhotoAsset();
        console.log(TAG,
          'sendableDisplayName is: ' + sendableDisplayName + ',displayName is: ' + photoAsset.displayName);
        expect(photoAsset.displayName).assertEqual(sendableDisplayName);
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    }

    let convertToPhotoAsset4 = async (done: Function, testName: string, fetchOps: photoAccessHelper.FetchOptions) => {
      try {
        let sendableAsset: sendablePhotoAccessHelper.PhotoAsset =
          await getSendableFileAsset(testContext, testName, fetchOps);
        const sendablePixelMap = await sendableAsset.getThumbnail();
        const sendableInfo = await sendablePixelMap.getImageInfo();
        let photoAsset: photoAccessHelper.PhotoAsset = sendableAsset.convertToPhotoAsset();
        const pixelMap = await photoAsset.getThumbnail();
        const info = await pixelMap.getImageInfo();
        console.log(TAG, 'width is: ' + sendableInfo?.size.width + ',width2 is: ' + info?.size.width);
        expect(sendableInfo?.size.width).assertEqual(info?.size.width);
        expect(sendableInfo?.size.height).assertEqual(info?.size.height);
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    }

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
      await pushCreateAsset(testContext, fileNameList);
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
     * @tc.name   convertToPhotoAsset_sendable_001
     * @tc.number SENDABLE_PHOTO_ASSET_CONVERT_TO_SENDABLE_PHOTO_ASSET_001
     * @tc.desc   convertToPhotoAsset img uri test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('convertToPhotoAsset_sendable_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'convertToPhotoAsset_sendable_001';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      convertToPhotoAsset1(done, testName, fetchOps);
    })

    /**
     * @tc.name   convertToPhotoAsset_sendable_002
     * @tc.number SENDABLE_PHOTO_ASSET_CONVERT_TO_SENDABLE_PHOTO_ASSET_002
     * @tc.desc   convertToPhotoAsset video uri test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('convertToPhotoAsset_sendable_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'convertToPhotoAsset_sendable_002';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      convertToPhotoAsset1(done, testName, fetchOps);
    })

    /**
     * @tc.name   convertToPhotoAsset_sendable_003
     * @tc.number SENDABLE_PHOTO_ASSET_CONVERT_TO_SENDABLE_PHOTO_ASSET_003
     * @tc.desc   convertToPhotoAsset img photoType test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('convertToPhotoAsset_sendable_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'convertToPhotoAsset_sendable_002';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      convertToPhotoAsset2(done, testName, fetchOps);
    })

    /**
     * @tc.name   convertToPhotoAsset_sendable_004
     * @tc.number SENDABLE_PHOTO_ASSET_CONVERT_TO_SENDABLE_PHOTO_ASSET_004
     * @tc.desc   convertToPhotoAsset video photoType test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('convertToPhotoAsset_sendable_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'convertToPhotoAsset_sendable_004';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      convertToPhotoAsset2(done, testName, fetchOps);
    })

    /**
     * @tc.name   convertToPhotoAsset_sendable_005
     * @tc.number SENDABLE_PHOTO_ASSET_CONVERT_TO_SENDABLE_PHOTO_ASSET_005
     * @tc.desc   convertToPhotoAsset image displayName test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('convertToPhotoAsset_sendable_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'convertToPhotoAsset_sendable_004';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      convertToPhotoAsset3(done, testName, fetchOps);
    })

    /**
     * @tc.name   convertToPhotoAsset_sendable_006
     * @tc.number SENDABLE_PHOTO_ASSET_CONVERT_TO_SENDABLE_PHOTO_ASSET_006
     * @tc.desc   convertToPhotoAsset video displayName test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('convertToPhotoAsset_sendable_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'convertToPhotoAsset_sendable_004';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      convertToPhotoAsset3(done, testName, fetchOps);
    })

    /**
     * @tc.name   convertToPhotoAsset_sendable_007
     * @tc.number SENDABLE_PHOTO_ASSET_CONVERT_TO_SENDABLE_PHOTO_ASSET_007
     * @tc.desc   convertToPhotoAsset image size test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('convertToPhotoAsset_sendable_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'convertToPhotoAsset_sendable_007';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      convertToPhotoAsset4(done, testName, fetchOps);
    })

    /**
     * @tc.name   convertToPhotoAsset_sendable_008
     * @tc.number SENDABLE_PHOTO_ASSET_CONVERT_TO_SENDABLE_PHOTO_ASSET_008
     * @tc.desc   convertToPhotoAsset video size test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('convertToPhotoAsset_sendable_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'convertToPhotoAsset_sendable_008';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      convertToPhotoAsset4(done, testName, fetchOps);
    })
  })
}