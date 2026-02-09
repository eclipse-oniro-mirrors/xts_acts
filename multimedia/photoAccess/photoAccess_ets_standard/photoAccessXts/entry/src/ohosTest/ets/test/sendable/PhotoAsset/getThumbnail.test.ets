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

import image from '@ohos.multimedia.image';
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

const TAG = LOG_TAG + 'sendableGetThumbnailTest';
const IMAGE_TEST_FILE = 'getThumb.jpg';
const VIDEO_TEST_FILE = 'getThumb.mp4';

export default function sendableGetThumbnailTest() {
  describe('sendableGetThumbnailTest', () => {
    const fileNameList = [IMAGE_TEST_FILE, VIDEO_TEST_FILE];
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let getThumbnailPromise1 = async (done: Function, testName: string, fetchOps: photoAccessHelper.FetchOptions) => {
      try {
        let asset: sendablePhotoAccessHelper.PhotoAsset = await getSendableFileAsset(testContext, testName, fetchOps);
        const pixelMap = await asset.getThumbnail();
        console.info(TAG, `${testName} pixelMap: ${pixelMap}`);
        const info = await pixelMap.getImageInfo();
        const defaultSize: ESObject = { width: 256, height: 256 };
        expect(info.size.width).assertEqual(defaultSize.width);
        expect(info.size.height).assertEqual(defaultSize.height);
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    }

    let getThumbnailPromise2 = async (done: Function, testName: string, fetchOps: photoAccessHelper.FetchOptions,
      size: image.Size, expectSize: ESObject) => {
      try {
        let asset: sendablePhotoAccessHelper.PhotoAsset;
        asset = await getSendableFileAsset(testContext, testName, fetchOps);
        let pixelMap: image.PixelMap;
        pixelMap = await asset.getThumbnail(size);
        console.info(TAG, `${testName} pixelMap: ${pixelMap}`);
        const info = await pixelMap.getImageInfo();
        expect(info.size.width).assertEqual(expectSize.width);
        expect(info.size.height).assertEqual(expectSize.height);
        done();
      } catch (error) {
        console.error(TAG, `${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    }

    let getThumbnailPromiseAbnormal = async (done: Function, testName: string, fetchOps: photoAccessHelper.FetchOptions,
      size: ESObject) => {
      try {
        console.info(TAG, `${testName} start.`);
        let asset: sendablePhotoAccessHelper.PhotoAsset = await getSendableFileAsset(testContext, testName, fetchOps);
        await asset.getThumbnail(size);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, `${testName} failed; error: ${error?.code}, ${error?.message}`);
        done();
      }
    }

    let getThumbnailPromiseNormal = async (done: Function, testName: string, fetchOps: photoAccessHelper.FetchOptions,
      size: ESObject) => {
      try {
        console.info(TAG, `${testName} start.`);
        let asset: sendablePhotoAccessHelper.PhotoAsset = await getSendableFileAsset(testContext, testName, fetchOps);
        await asset.getThumbnail(size);
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
     * @tc.name   getThumbnail_promise_sendable_001
     * @tc.number SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_001
     * @tc.desc   getThumbnail(image) by no size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getThumbnail_promise_sendable_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getThumbnail_promise_sendable_001';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      await getThumbnailPromise1(done, testName, fetchOps);
    })

    /**
     * @tc.name   getThumbnail_promise_sendable_sendable_002
     * @tc.number SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_002
     * @tc.desc   getThumbnail(image) by { width: 128, height: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getThumbnail_promise_sendable_sendable_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getThumbnail_promise_sendable_sendable_002';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = { width: 128, height: 128 };
      const expectSize: ESObject = { width: 128, height: 128 };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.name   getThumbnail_promise_sendable_003
     * @tc.number SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_003
     * @tc.desc   getThumbnail(image) by { width: 1, height: 1024 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_sendable_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_sendable_003';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = { width: 1, height: 1024 };
      const expectSize: ESObject = { width: 1, height: 1024 };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.name   getThumbnail_promise_sendable_004
     * @tc.number SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_004
     * @tc.desc   getThumbnail(image) by { width: 1024, height: 1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_sendable_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_sendable_004';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = { width: 1024, height: 1 };
      const expectSize: ESObject = { width: 1024, height: 1 };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.name   getThumbnail_promise_sendable_005
     * @tc.number SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_005
     * @tc.desc   getThumbnail(image) by { width: 1024, height: 1024 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_sendable_005', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_sendable_005';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = { width: 1024, height: 1024 };
      const expectSize: ESObject = { width: 1024, height: 1024 };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.name   getThumbnail_promise_sendable_006
     * @tc.number SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_006
     * @tc.desc   getThumbnail(image) by { width: 1, height: 1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_sendable_006', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_sendable_006';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = { width: 1, height: 1 };
      const expectSize: ESObject = { width: 1, height: 1 };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.name   getThumbnail_promise_sendable_007
     * @tc.number SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_007
     * @tc.desc   getThumbnail(image) by { height: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_sendable_007', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_sendable_007';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = { width: undefined, height: 128 };
      const expectSize: ESObject = { width: 256, height: 128 };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.name   getThumbnail_promise_sendable_008
     * @tc.number SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_008
     * @tc.desc   getThumbnail(image) by { width: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_sendable_008', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_sendable_008';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = { width: 128, height: undefined };
      const expectSize: ESObject = { width: 128, height: 256 };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.name   getThumbnail_promise_sendable_009
     * @tc.number SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_009
     * @tc.desc   getThumbnail(image) by undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_sendable_009', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_sendable_009';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = undefined;
      const expectSize: ESObject = {
        width: 256, height: 256
      };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.name   getThumbnail_promise_sendable_010
     * @tc.number SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_010
     * @tc.desc   getThumbnail(image) by { width: 0, height: 0 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_sendable_010', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_sendable_010';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = { width: 0, height: 0 };
      await getThumbnailPromiseAbnormal(done, testName, fetchOps, size);
    })

    /**
     * @tc.name   getThumbnail_promise_sendable_011
     * @tc.number SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_011
     * @tc.desc   getThumbnail(image) by { width: -1, height: -1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_sendable_011', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_sendable_011';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = { width: -1, height: -1 };
      await getThumbnailPromiseNormal(done, testName, fetchOps, size);
    })

    /**
     * @tc.name   getThumbnail_promise_sendable_012
     * @tc.number SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_012
     * @tc.desc   getThumbnail(image) by { width: 99999, height: 99999 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_sendable_012', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_sendable_012';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = { width: 99999, height: 99999 };
      await getThumbnailPromiseAbnormal(done, testName, fetchOps, size);
    })

    /**
     * @tc.name   getThumbnail_promise_sendable_013
     * @tc.number SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_013
     * @tc.desc   getThumbnail(video) by no size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getThumbnail_promise_sendable_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'getThumbnail_promise_sendable_013';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      await getThumbnailPromise1(done, testName, fetchOps);
    })

    /**
     * @tc.name   getThumbnail_promise_sendable_014
     * @tc.number SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_014
     * @tc.desc   getThumbnail(video) by { width: 128, height: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getThumbnail_promise_sendable_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'getThumbnail_promise_sendable_014';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = { width: 128, height: 128 };
      const expectSize: ESObject = { width: 128, height: 128 };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.name   getThumbnail_promise_sendable_015
     * @tc.number SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_015
     * @tc.desc   getThumbnail(video) by { width: 1, height: 1024 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_sendable_015', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_sendable_015';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = { width: 1, height: 1024 };
      const expectSize: ESObject = { width: 1, height: 1024 };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.name   getThumbnail_promise_sendable_016
     * @tc.number SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_016
     * @tc.desc   getThumbnail(video) by { width: 1024, height: 1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_sendable_016', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_sendable_016';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = { width: 1024, height: 1 };
      const expectSize: ESObject = { width: 1024, height: 1 };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.name   getThumbnail_promise_sendable_017
     * @tc.number SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_017
     * @tc.desc   getThumbnail(video) by { width: 1024, height: 1024 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_sendable_017', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_sendable_017';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = { width: 1024, height: 1024 };
      const expectSize: ESObject = { width: 1024, height: 1024 };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.name   getThumbnail_promise_sendable_018
     * @tc.number SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_018
     * @tc.desc   getThumbnail(video) by { width: 1, height: 1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_sendable_018', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_sendable_018';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = { width: 1, height: 1 };
      const expectSize: ESObject = { width: 1, height: 1 };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.name   getThumbnail_promise_sendable_019
     * @tc.number SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_019
     * @tc.desc   getThumbnail(video) by { height: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_sendable_019', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_sendable_019';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = { width: undefined, height: 128 };
      const expectSize: ESObject = { width: 256, height: 128 };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.name   getThumbnail_promise_sendable_020
     * @tc.number SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_020
     * @tc.desc   getThumbnail(video) by { width: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_sendable_020', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_sendable_020';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = { width: 128, height: undefined };
      const expectSize: ESObject = { width: 128, height: 256 };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.name   getThumbnail_promise_sendable_021
     * @tc.number SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_021
     * @tc.desc   getThumbnail(video) by undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_sendable_021', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_sendable_021';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = undefined;
      const expectSize: ESObject = { width: 256, height: 256 };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.name   getThumbnail_promise_sendable_022
     * @tc.number SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_022
     * @tc.desc   getThumbnail(video) by { width: 0, height: 0 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_sendable_022', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_sendable_022';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = { width: 0, height: 0 };
      await getThumbnailPromiseAbnormal(done, testName, fetchOps, size);
    })

    /**
     * @tc.name   getThumbnail_promise_sendable_023
     * @tc.number SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_023
     * @tc.desc   getThumbnail(video) by { width: -1, height: -1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_sendable_023', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_sendable_023';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = { width: -1, height: -1 };
      await getThumbnailPromiseNormal(done, testName, fetchOps, size);
    })

    /**
     * @tc.name   getThumbnail_promise_sendable_024
     * @tc.number SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_024
     * @tc.desc   getThumbnail(video) by { width: 99999, height: 99999 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_sendable_024', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_sendable_024';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = { width: 99999, height: 99999 };
      await getThumbnailPromiseAbnormal(done, testName, fetchOps, size);
    })
  })
}