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

import { sendableImage } from '@kit.ImageKit';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { image } from '@kit.ImageKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG, copyImageToSandbox, genRandomStr } from '../../common';

const TAG = LOG_TAG + 'createPixelMap';

async function createPixelMapPromiseTest(done: Function, testName: string, path: string,
  options: image.DecodingOptions | null) {
  try {
    const sendableImageSourceApi: sendableImage.ImageSource = sendableImage.createImageSource(path);
    sendableImageSourceApi.createPixelMap(options as image.DecodingOptions).then((pixelMap: sendableImage.PixelMap) => {
      console.info(TAG, 'Succeeded in creating pixelMap object through image decoding parameters.');
      done();
    }).catch((error: BusinessError) => {
      console.error(TAG,
        `Failed to create pixelMap object through image decoding parameters. code ${error.code}, message is ${error.message}`);
      expect().assertFail();
      done();
    });
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function sendableImageSourceCreatePixelMapTest() {
  describe('sendableImageSourceCreatePixelMapTest', () => {

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
     * @tc.name   createPixelMap_sendable_promise_001
     * @tc.number IMAGE_SOURCE_CREATE_PIXEL_MAP_001
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_sendable_promise_001';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const fileName = 'test.jpg';
      const path = 'Abc123.jpg';
      const pathUrl: string = 'file://' + testContext.filesDir + "/" + path;
      const options = null;
      await copyImageToSandbox(fileName, path);
      await createPixelMapPromiseTest(done, testName, pathUrl, options);
    })

    /**
     * @tc.name   createPixelMap_sendable_promise_002
     * @tc.number IMAGE_SOURCE_CREATE_PIXEL_MAP_002
     * @tc.desc   getAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_sendable_promise_002';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const fileName = 'test.jpg';
      const path = 'Abc123.jpg';
      const pathUrl: string = 'file://' + testContext.filesDir + "/" + path;
      const options: image.DecodingOptions = {
        sampleSize: 1,
        rotate: 0,
        editable: true,
        desiredSize: {
          height: 100,
          width: 100
        },
        desiredRegion: {
          size: {
            height: 10,
            width: 10
          },
          x: 10,
          y: 10
        },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
        index: 0,
        fitDensity: 0,
      };
      await copyImageToSandbox(fileName, path);
      await createPixelMapPromiseTest(done, testName, pathUrl, options);
    })

    /**
     * @tc.name   createPixelMap_sendable_promise_003
     * @tc.number IMAGE_SOURCE_CREATE_PIXEL_MAP_003
     * @tc.desc   getAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_sendable_promise_003';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const fileName = 'test.jpg';
      const path = 'Abc123.jpg';
      const pathUrl: string = 'file://' + testContext.filesDir + "/" + path;
      const options: image.DecodingOptions = {
        sampleSize: 1,
        rotate: 360,
        editable: true,
        desiredSize: {
          height: 100,
          width: 100
        },
        desiredRegion: {
          size: {
            height: 10,
            width: 10
          },
          x: 10,
          y: 10
        },
        desiredPixelFormat: image.PixelMapFormat.BGRA_8888,
        index: 0,
        fitDensity: 0,
      };
      await copyImageToSandbox(fileName, path);
      await createPixelMapPromiseTest(done, testName, pathUrl, options);
    })

    /**
     * @tc.name   createPixelMap_sendable_promise_004
     * @tc.number IMAGE_SOURCE_CREATE_PIXEL_MAP_004
     * @tc.desc   getAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_sendable_promise_004';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const fileName = 'test.jpg';
      const path = 'Abc123.jpg';
      const pathUrl: string = 'file://' + testContext.filesDir + "/" + path;
      const options: image.DecodingOptions = {
        sampleSize: 1,
        rotate: 360,
        editable: false,
        desiredSize: {
          height: 100,
          width: 100
        },
        desiredRegion: {
          size: {
            height: 10,
            width: 10
          },
          x: 10,
          y: 10
        },
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        index: 0,
        fitDensity: 0,
      };
      await copyImageToSandbox(fileName, path);
      await createPixelMapPromiseTest(done, testName, pathUrl, options);
    })

    /**
     * @tc.name   createPixelMap_sendable_promise_005
     * @tc.number IMAGE_SOURCE_CREATE_PIXEL_MAP_005
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_sendable_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_sendable_promise_005';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const fileName = 'test.svg';
      const path = '汉字.svg';
      const pathUrl: string = 'file://' + testContext.filesDir + "/" + path;
      const options = null;
      await copyImageToSandbox(fileName, path);
      await createPixelMapPromiseTest(done, testName, pathUrl, options);
    })

    /**
     * @tc.name   createPixelMap_sendable_promise_006
     * @tc.number IMAGE_SOURCE_CREATE_PIXEL_MAP_006
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_sendable_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_sendable_promise_006';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const fileName = 'test_exif_empty2.webp';
      const path = '_dasdaskjnklsnjksn1451.webp';
      const pathUrl: string = 'file://' + testContext.filesDir + "/" + path;
      const options = null;
      await copyImageToSandbox(fileName, path);
      await createPixelMapPromiseTest(done, testName, pathUrl, options);
    })

    /**
     * @tc.name   createPixelMap_sendable_promise_007
     * @tc.number IMAGE_SOURCE_CREATE_PIXEL_MAP_007
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_sendable_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_sendable_promise_007';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const fileName = 'test_aisr.ico';
      const path = '1231233.ico';
      const pathUrl: string = 'file://' + testContext.filesDir + "/" + path;
      const options = null;
      await copyImageToSandbox(fileName, path);
      await createPixelMapPromiseTest(done, testName, pathUrl, options);
    })

    /**
     * @tc.name   createPixelMap_sendable_promise_008
     * @tc.number IMAGE_SOURCE_CREATE_PIXEL_MAP_008
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_sendable_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_sendable_promise_008';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const fileName = 'test_aisr.ico';
      const path = genRandomStr(100) + '.ico';
      const pathUrl: string = 'file://' + testContext.filesDir + "/" + path;
      const options = null;
      await copyImageToSandbox(fileName, path);
      await createPixelMapPromiseTest(done, testName, pathUrl, options);
    })
  })
}