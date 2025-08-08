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
import image from '@ohos.multimedia.image';
import { describe, it, expect, beforeAll, Level, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { photoKeys, fetchOption, getFileAsset, getPermission, driveFn, pushCreateAsset, LOG_TAG } from '../../common';
import common from '@ohos.app.ability.common';
import { JSON } from '@kit.ArkTS';

const TAG = LOG_TAG + 'getThumbnail';
const IMAGE_TEST_FILE = 'getThumb.jpg';
const VIDEO_TEST_FILE = 'getThumb.mp4';

export default function getThumbnailTest() {
  describe('getThumbnailTest', () => {
    const fileNameList = [IMAGE_TEST_FILE, VIDEO_TEST_FILE];
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let getThumbnailCallback1 = async (done: Function, testName: string, fetchOps: ESObject) => {
      try {
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testName, fetchOps);
        asset.getThumbnail(async (err, pixelMap) => {
          if (err) {
            console.error(TAG, `${testName} err: ${err}`);
            expect().assertFail();
          } else {
            const info = await pixelMap.getImageInfo();
            console.log(TAG, `${testName} info: ${JSON.stringify(info)}`);
            const defaultSize: ESObject = { width: 256, height: 256 };
            expect(info.size.width).assertEqual(defaultSize.width);
            expect(info.size.height).assertEqual(defaultSize.height);
          }
          done();
        })
      } catch (error) {
        console.error(TAG, `${testName} failed; error: ${error}`);
        expect().assertFail();
        done();
      }
    }

    let getThumbnailCallback2 = async (done: Function, testName: string, fetchOps: photoAccessHelper.FetchOptions,
      size: ESObject, expectSize: ESObject) => {
      try {
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testName, fetchOps);
        asset.getThumbnail(size, async (err, pixelMap) => {
          if (err) {
            console.error(TAG, `${testName} err: ${err}`);
            expect().assertFail();
          } else {
            const info = await pixelMap.getImageInfo();
            console.log(TAG, `${testName} info: ${JSON.stringify(info)}`);
            expect(info.size.width).assertEqual(expectSize.width);
            expect(info.size.height).assertEqual(expectSize.height);
          }
          done();
        })
      } catch (error) {
        console.error(`${testName} failed; error: ${error}`);
        expect().assertFail();
        done();
      }
    }

    let getThumbnailCallbackAbnormal =
      async (done: Function, testName: string, fetchOps: photoAccessHelper.FetchOptions,
        size: ESObject) => {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        try {
          let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testName, fetchOps);
          asset.getThumbnail(size, async (err, pixelMap) => {
            if (err) {
              console.error(TAG, `${testName} err: ${err.code}, ${err.message}`);
              expect(true).assertTrue();
            } else {
              expect().assertFail();
            }
            done();
          })
        } catch (error) {
          console.error(TAG, `${testName} failed; error: ${error?.code}, ${error?.message}`);
          expect(true).assertTrue();
          done();
        }
      }

    let getThumbnailCallbackNormal = async (done: Function, testName: string, fetchOps: photoAccessHelper.FetchOptions,
      size: ESObject) => {
      try {
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testName, fetchOps);
        asset.getThumbnail(size, async (err, pixelMap) => {
          if (err) {
            console.info(TAG, `${testName} err: ${err.code}, ${err.message}`);
            expect().assertFail();
          } else {
            const info = await pixelMap.getImageInfo();
            console.log(TAG, `${testName} info: ${JSON.stringify(info)}`);
            expect(true).assertTrue();
          }
          done();
        })
      } catch (error) {
        console.info(TAG, `${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    }

    let getThumbnailPromise1 = async (done: Function, testName: string, fetchOps: photoAccessHelper.FetchOptions) => {
      try {
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testName, fetchOps);
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
        let asset: photoAccessHelper.PhotoAsset;
        asset = await getFileAsset(testContext, testName, fetchOps);
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
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testName, fetchOps);
        await asset.getThumbnail(size);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, `${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect(true).assertTrue();
        done();
      }
    }

    let getThumbnailPromiseNormal = async (done: Function, testName: string, fetchOps: photoAccessHelper.FetchOptions,
      size: ESObject) => {
      try {
        console.info(TAG, `${testName} start.`);
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testName, fetchOps);
        await asset.getThumbnail(size);
        expect(true).assertTrue();
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
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_001
     * @tc.name      : getThumbnail_callback_001
     * @tc.desc      : getThumbnail(image) by no size
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getThumbnail_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getThumbnail_callback_001';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      await getThumbnailCallback1(done, testName, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_002
     * @tc.name      : getThumbnail_callback_002
     * @tc.desc      : getThumbnail(image) by { width: 128, height: 128 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getThumbnail_callback_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getThumbnail_callback_002';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = { width: 128, height: 128 };
      const expectSize: ESObject = { width: 128, height: 128 };
      await getThumbnailCallback2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_003
     * @tc.name      : getThumbnail_callback_003
     * @tc.desc      : getThumbnail(image) by { width: 1, height: 1024 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_callback_003';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = { width: 1, height: 1024 };
      const expectSize: ESObject = { width: 1, height: 1024 };
      await getThumbnailCallback2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_004
     * @tc.name      : getThumbnail_callback_004
     * @tc.desc      : getThumbnail(image) by { width: 1024, height: 1 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_callback_004';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = { width: 1024, height: 1 };
      const expectSize: ESObject = { width: 1024, height: 1 };
      await getThumbnailCallback2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_005
     * @tc.name      : getThumbnail_callback_005
     * @tc.desc      : getThumbnail(image) by { width: 1024, height: 1024 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_005', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_callback_005';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = { width: 1024, height: 1024 };
      const expectSize: ESObject = { width: 1024, height: 1024 };
      await getThumbnailCallback2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_006
     * @tc.name      : getThumbnail_callback_006
     * @tc.desc      : getThumbnail(image) by { width: 1, height: 1 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_006', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_callback_006';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = { width: 1, height: 1 };
      const expectSize: ESObject = { width: 1, height: 1 };
      await getThumbnailCallback2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_007
     * @tc.name      : getThumbnail_callback_007
     * @tc.desc      : getThumbnail(image) by { height: 128 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_007', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_callback_007';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = { height: 128 };
      const expectSize: ESObject = { width: 256, height: 128 };
      await getThumbnailCallback2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_008
     * @tc.name      : getThumbnail_callback_008
     * @tc.desc      : getThumbnail(image) by { width: 128 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_008', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_callback_008';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = { width: 128 };
      const expectSize: ESObject = { width: 128, height: 256 };
      await getThumbnailCallback2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_009
     * @tc.name      : getThumbnail_callback_009
     * @tc.desc      : getThumbnail(image) by undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_009', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_callback_009';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = undefined;
      await getThumbnailCallbackAbnormal(done, testName, fetchOps, size);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_010
     * @tc.name      : getThumbnail_callback_010
     * @tc.desc      : getThumbnail(image) by { width: 0, height: 0 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_010', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_callback_010';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = { width: 0, height: 0 };
      await getThumbnailCallbackAbnormal(done, testName, fetchOps, size);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_011
     * @tc.name      : getThumbnail_callback_011
     * @tc.desc      : getThumbnail(image) by { width: -1, height: -1 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_011', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_callback_011';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = { width: -1, height: -1 };
      await getThumbnailCallbackNormal(done, testName, fetchOps, size);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_012
     * @tc.name      : getThumbnail_callback_012
     * @tc.desc      : getThumbnail(image) by { width: 99999, height: 99999 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_012', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_callback_012';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = { width: 99999, height: 99999 };
      await getThumbnailCallbackAbnormal(done, testName, fetchOps, size);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_013
     * @tc.name      : getThumbnail_callback_013
     * @tc.desc      : getThumbnail(video) by no size
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getThumbnail_callback_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'getThumbnail_callback_013';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      await getThumbnailCallback1(done, testName, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_014
     * @tc.name      : getThumbnail_callback_014
     * @tc.desc      : getThumbnail(video) by { width: 128, height: 128 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getThumbnail_callback_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'getThumbnail_callback_014';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = { width: 128, height: 128 };
      const expectSize: ESObject = { width: 128, height: 128 };
      await getThumbnailCallback2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_015
     * @tc.name      : getThumbnail_callback_015
     * @tc.desc      : getThumbnail(video) by { width: 1, height: 1024 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_015', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_callback_015';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = { width: 1, height: 1024 };
      const expectSize: ESObject = { width: 1, height: 1024 };
      await getThumbnailCallback2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_016
     * @tc.name      : getThumbnail_callback_016
     * @tc.desc      : getThumbnail(video) by { width: 1024, height: 1 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_016', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_callback_016';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = { width: 1024, height: 1 };
      const expectSize: ESObject = { width: 1024, height: 1 };
      await getThumbnailCallback2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_017
     * @tc.name      : getThumbnail_callback_017
     * @tc.desc      : getThumbnail(video) by { width: 1024, height: 1024 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_017', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_callback_017';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = { width: 1024, height: 1024 };
      const expectSize: ESObject = { width: 1024, height: 1024 };
      await getThumbnailCallback2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_018
     * @tc.name      : getThumbnail_callback_018
     * @tc.desc      : getThumbnail(video) by { width: 1, height: 1 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_018', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_callback_018';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = { width: 1, height: 1 };
      const expectSize: ESObject = { width: 1, height: 1 };
      await getThumbnailCallback2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_019
     * @tc.name      : getThumbnail_callback_019
     * @tc.desc      : getThumbnail(video) by { height: 128 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_019', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_callback_019';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = { height: 128 };
      const expectSize: ESObject = { width: 256, height: 128 };
      await getThumbnailCallback2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_020
     * @tc.name      : getThumbnail_callback_020
     * @tc.desc      : getThumbnail(video) by { width: 128 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_020', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_callback_020';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = { width: 128 };
      const expectSize: ESObject = { width: 128, height: 256 };
      await getThumbnailCallback2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_021
     * @tc.name      : getThumbnail_callback_021
     * @tc.desc      : getThumbnail(video) by undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_021', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_callback_021';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = undefined;
      await getThumbnailCallbackAbnormal(done, testName, fetchOps, size);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_022
     * @tc.name      : getThumbnail_callback_022
     * @tc.desc      : getThumbnail(video) by { width: 0, height: 0 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_022', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_callback_022';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = { width: 0, height: 0 };
      await getThumbnailCallbackAbnormal(done, testName, fetchOps, size);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_023
     * @tc.name      : getThumbnail_callback_023
     * @tc.desc      : getThumbnail(video) by { width: -1, height: -1 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_023', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_callback_023';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = { width: -1, height: -1 };
      await getThumbnailCallbackNormal(done, testName, fetchOps, size);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_024
     * @tc.name      : getThumbnail_callback_024
     * @tc.desc      : getThumbnail(video) by { width: 99999, height: 99999 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_024', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_callback_024';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = { width: 99999, height: 99999 };
      await getThumbnailCallbackAbnormal(done, testName, fetchOps, size);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_025
     * @tc.name      : getThumbnail_promise_001
     * @tc.desc      : getThumbnail(image) by no size
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getThumbnail_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getThumbnail_promise_001';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      await getThumbnailPromise1(done, testName, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_026
     * @tc.name      : getThumbnail_promise_002
     * @tc.desc      : getThumbnail(image) by { width: 128, height: 128 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getThumbnail_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getThumbnail_promise_002';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = { width: 128, height: 128 };
      const expectSize: ESObject = { width: 128, height: 128 };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_027
     * @tc.name      : getThumbnail_promise_003
     * @tc.desc      : getThumbnail(image) by { width: 1, height: 1024 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_003';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = { width: 1, height: 1024 };
      const expectSize: ESObject = { width: 1, height: 1024 };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_028
     * @tc.name      : getThumbnail_promise_004
     * @tc.desc      : getThumbnail(image) by { width: 1024, height: 1 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_004';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = { width: 1024, height: 1 };
      const expectSize: ESObject = { width: 1024, height: 1 };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_029
     * @tc.name      : getThumbnail_promise_005
     * @tc.desc      : getThumbnail(image) by { width: 1024, height: 1024 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_005', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_005';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = { width: 1024, height: 1024 };
      const expectSize: ESObject = { width: 1024, height: 1024 };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_030
     * @tc.name      : getThumbnail_promise_006
     * @tc.desc      : getThumbnail(image) by { width: 1, height: 1 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_006', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_006';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = { width: 1, height: 1 };
      const expectSize: ESObject = { width: 1, height: 1 };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_031
     * @tc.name      : getThumbnail_promise_007
     * @tc.desc      : getThumbnail(image) by { height: 128 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_007', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_007';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = { width: undefined, height: 128 };
      const expectSize: ESObject = { width: 256, height: 128 };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_032
     * @tc.name      : getThumbnail_promise_008
     * @tc.desc      : getThumbnail(image) by { width: 128 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_008', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_008';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = { width: 128, height: undefined };
      const expectSize: ESObject = { width: 128, height: 256 };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_033
     * @tc.name      : getThumbnail_promise_009
     * @tc.desc      : getThumbnail(image) by undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_009', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_009';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = undefined;
      const expectSize: ESObject = {
        width: 256, height: 256
      };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_034
     * @tc.name      : getThumbnail_promise_010
     * @tc.desc      : getThumbnail(image) by { width: 0, height: 0 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_010', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_010';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = { width: 0, height: 0 };
      await getThumbnailPromiseAbnormal(done, testName, fetchOps, size);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_035
     * @tc.name      : getThumbnail_promise_011
     * @tc.desc      : getThumbnail(image) by { width: -1, height: -1 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_011', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_011';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = { width: -1, height: -1 };
      await getThumbnailPromiseNormal(done, testName, fetchOps, size);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_036
     * @tc.name      : getThumbnail_promise_012
     * @tc.desc      : getThumbnail(image) by { width: 99999, height: 99999 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_012', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_012';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
      const size: ESObject = { width: 99999, height: 99999 };
      await getThumbnailPromiseAbnormal(done, testName, fetchOps, size);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_037
     * @tc.name      : getThumbnail_promise_013
     * @tc.desc      : getThumbnail(video) by no size
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getThumbnail_promise_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'getThumbnail_promise_013';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      await getThumbnailPromise1(done, testName, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_038
     * @tc.name      : getThumbnail_promise_014
     * @tc.desc      : getThumbnail(video) by { width: 128, height: 128 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getThumbnail_promise_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'getThumbnail_promise_014';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = { width: 128, height: 128 };
      const expectSize: ESObject = { width: 128, height: 128 };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_039
     * @tc.name      : getThumbnail_promise_015
     * @tc.desc      : getThumbnail(video) by { width: 1, height: 1024 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_015', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_015';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = { width: 1, height: 1024 };
      const expectSize: ESObject = { width: 1, height: 1024 };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_040
     * @tc.name      : getThumbnail_promise_016
     * @tc.desc      : getThumbnail(video) by { width: 1024, height: 1 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_016', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_016';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = { width: 1024, height: 1 };
      const expectSize: ESObject = { width: 1024, height: 1 };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_041
     * @tc.name      : getThumbnail_promise_017
     * @tc.desc      : getThumbnail(video) by { width: 1024, height: 1024 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_017', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_017';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = { width: 1024, height: 1024 };
      const expectSize: ESObject = { width: 1024, height: 1024 };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_042
     * @tc.name      : getThumbnail_promise_018
     * @tc.desc      : getThumbnail(video) by { width: 1, height: 1 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_018', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_018';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = { width: 1, height: 1 };
      const expectSize: ESObject = { width: 1, height: 1 };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_043
     * @tc.name      : getThumbnail_promise_019
     * @tc.desc      : getThumbnail(video) by { height: 128 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_019', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_019';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = { width: undefined, height: 128 };
      const expectSize: ESObject = { width: 256, height: 128 };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_044
     * @tc.name      : getThumbnail_promise_020
     * @tc.desc      : getThumbnail(video) by { width: 128 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_020', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_020';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = { width: 128, height: undefined };
      const expectSize: ESObject = { width: 128, height: 256 };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_045
     * @tc.name      : getThumbnail_promise_021
     * @tc.desc      : getThumbnail(video) by undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_021', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_021';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = undefined;
      const expectSize: ESObject = { width: 256, height: 256 };
      await getThumbnailPromise2(done, testName, fetchOps, size, expectSize);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_046
     * @tc.name      : getThumbnail_promise_022
     * @tc.desc      : getThumbnail(video) by { width: 0, height: 0 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_022', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_022';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = { width: 0, height: 0 };
      await getThumbnailPromiseAbnormal(done, testName, fetchOps, size);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_047
     * @tc.name      : getThumbnail_promise_023
     * @tc.desc      : getThumbnail(video) by { width: -1, height: -1 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_023', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_023';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = { width: -1, height: -1 };
      await getThumbnailPromiseNormal(done, testName, fetchOps, size);
    })

    /**
     * @tc.number    : PHOTO_ASSET_GET_THUMBNAIL_048
     * @tc.name      : getThumbnail_promise_024
     * @tc.desc      : getThumbnail(video) by { width: 99999, height: 99999 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_024', Level.LEVEL2, async (done: Function) => {
      const testName = 'getThumbnail_promise_024';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
      const size: ESObject = { width: 99999, height: 99999 };
      await getThumbnailPromiseAbnormal(done, testName, fetchOps, size);
    })
  })
}