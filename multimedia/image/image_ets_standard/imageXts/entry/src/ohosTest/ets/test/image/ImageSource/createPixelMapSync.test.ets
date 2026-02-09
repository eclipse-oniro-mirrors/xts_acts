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

import { image } from '@kit.ImageKit';
import common from '@ohos.app.ability.common';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG, copyImageToSandbox } from '../../common';

const TAG = LOG_TAG + 'createPixelMapSync ';

async function createPixelMapSyncPromiseTest(done: Function, testName: string, pathUri: string,
  options?: image.DecodingOptions) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
   const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    let pixelMap: image.PixelMap = imageSourceApi.createPixelMapSync(options);
    imageSourceApi.release();
    expect(pixelMap != undefined).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function imageSourceCreatePixelMapSyncTest() {
  describe('imageSourceCreatePixelMapSyncTest', () => {

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
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
     * @tc.name   imageSource_createPixelMapSync_promise_001
     * @tc.number IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_001
     * @tc.desc   imageSource_createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_createPixelMapSync_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPixelMapSync_promise_001';
      const fileName = 'test.jpg';
     const path = new Date().getTime() + 'test.jpg';
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 1, height: 2 },
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
        index: 0
      };
      await copyImageToSandbox(fileName, path);
      await createPixelMapSyncPromiseTest(done, testName, path, decodingOptions);
    })

    /**
     * @tc.name   imageSource_createPixelMapSync_promise_002
     * @tc.number IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_002
     * @tc.desc   imageSource_createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_createPixelMapSync_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPixelMapSync_promise_002';
      const fileName = 'test.svg';
     const path = new Date().getTime() + 'test.svg';
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 1, height: 2 },
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
        index: 0
      };
      await copyImageToSandbox(fileName, path);
      await createPixelMapSyncPromiseTest(done, testName, path, decodingOptions);
    })

    /**
     * @tc.name   imageSource_createPixelMapSync_promise_003
     * @tc.number IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_003
     * @tc.desc   imageSource_createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_createPixelMapSync_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPixelMapSync_promise_003';
      const fileName = 'test.svg';
     const path = new Date().getTime() + 'test.svg';
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 1, height: 2 },
        rotate: 360,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
        index: 0
      };
      await copyImageToSandbox(fileName, path);
      await createPixelMapSyncPromiseTest(done, testName, path, decodingOptions);
    })

    /**
     * @tc.name   imageSource_createPixelMapSync_promise_004
     * @tc.number IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_004
     * @tc.desc   imageSource_createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_createPixelMapSync_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPixelMapSync_promise_004';
      const fileName = 'test.svg';
     const path = new Date().getTime() + 'test.svg';
      await copyImageToSandbox(fileName, path);
      await createPixelMapSyncPromiseTest(done, testName, path);
    })
  })
}