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
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG, copyImageToSandbox } from '../../common';

const TAG = LOG_TAG + 'createPixelMapList';

async function createPixelMapListPromiseTest(done: Function, testName: string, pathUri: string,
  options?: image.DecodingOptions) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    let pixelMapList: Array<image.PixelMap> = await imageSourceApi.createPixelMapList(options);
    imageSourceApi.release();
    expect(pixelMapList.length > 0).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function createPixelMapListCallbackTest(done: Function, testName: string, pathUri: string) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    imageSourceApi.createPixelMapList((err: BusinessError, pixelMapList: Array<image.PixelMap>) => {
      imageSourceApi.release();
      if (err) {
        console.error(TAG, `Failed to create pixelMapList object, error code is ${err}`);
        expect().assertFail();
        done();
      } else {
        console.info(TAG, 'Succeeded in creating pixelMapList object.');
        done();
      }
    })
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function createPixelMapListCallbackOptionsTest(done: Function, testName: string, pathUri: string,
  options: image.DecodingOptions) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    imageSourceApi.createPixelMapList(options, (err: BusinessError, pixelMapList: Array<image.PixelMap>) => {
      imageSourceApi.release();
      if (err) {
        console.error(TAG, `Failed to create pixelMapList object, error code is ${err}`);
        expect().assertFail();
        done();
      } else {
        console.info(TAG, 'Succeeded in creating pixelMapList object.');
        done();
      }
    })
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function imageSourceCreatePixelMapListTest() {
  describe('imageSourceCreatePixelMapListTest', () => {

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
     * @tc.number    : IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_001
     * @tc.name      : imageSource_createPixelMapList_promise_001
     * @tc.desc      : imageSource_createPixelMapList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_createPixelMapList_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPixelMapList_promise_001';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
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
      await createPixelMapListPromiseTest(done, testName, path, decodingOptions);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_002
     * @tc.name      : imageSource_createPixelMapList_promise_002
     * @tc.desc      : imageSource_createPixelMapList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_createPixelMapList_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPixelMapList_promise_002';
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
      await createPixelMapListPromiseTest(done, testName, path, decodingOptions);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_003
     * @tc.name      : imageSource_createPixelMapList_promise_003
     * @tc.desc      : imageSource_createPixelMapList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_createPixelMapList_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPixelMapList_promise_003';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
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
      await createPixelMapListPromiseTest(done, testName, path, decodingOptions);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_004
     * @tc.name      : imageSource_createPixelMapList_promise_004
     * @tc.desc      : imageSource_createPixelMapList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_createPixelMapList_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPixelMapList_promise_004';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 1, height: 2 },
        rotate: 360,
        desiredPixelFormat: image.PixelMapFormat.BGRA_8888,
        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
        index: 0
      };
      await copyImageToSandbox(fileName, path);
      await createPixelMapListPromiseTest(done, testName, path, decodingOptions);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_005
     * @tc.name      : imageSource_createPixelMapList_promise_005
     * @tc.desc      : imageSource_createPixelMapList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_createPixelMapList_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPixelMapList_promise_005';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 1, height: 2 },
        rotate: 360
      };
      await copyImageToSandbox(fileName, path);
      await createPixelMapListPromiseTest(done, testName, path, decodingOptions);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_006
     * @tc.name      : imageSource_createPixelMapList_promise_006
     * @tc.desc      : imageSource_createPixelMapList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_createPixelMapList_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPixelMapList_promise_006';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true
      };
      await copyImageToSandbox(fileName, path);
      await createPixelMapListPromiseTest(done, testName, path, decodingOptions);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_007
     * @tc.name      : imageSource_createPixelMapList_promise_007
     * @tc.desc      : imageSource_createPixelMapList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_createPixelMapList_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPixelMapList_promise_007';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      let decodingOptions: image.DecodingOptions = {};
      await copyImageToSandbox(fileName, path);
      await createPixelMapListPromiseTest(done, testName, path, decodingOptions);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_008
     * @tc.name      : imageSource_createPixelMapList_promise_008
     * @tc.desc      : imageSource_createPixelMapList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_createPixelMapList_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPixelMapList_promise_008';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      await copyImageToSandbox(fileName, path);
      await createPixelMapListPromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_009
     * @tc.name      : imageSource_createPixelMapList_promise_009
     * @tc.desc      : imageSource_createPixelMapList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_createPixelMapList_promise_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPixelMapList_promise_009';
      const fileName = 'test.svg';
      const path = new Date().getTime() + 'test.svg';
      await copyImageToSandbox(fileName, path);
      await createPixelMapListPromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_010
     * @tc.name      : imageSource_createPixelMapList_callback_001
     * @tc.desc      : imageSource_createPixelMapList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_createPixelMapList_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPixelMapList_callback_001';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      await copyImageToSandbox(fileName, path);
      await createPixelMapListCallbackTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_011
     * @tc.name      : imageSource_createPixelMapList_callback_002
     * @tc.desc      : imageSource_createPixelMapList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_createPixelMapList_callback_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPixelMapList_callback_002';
      const fileName = 'test.svg';
      const path = new Date().getTime() + 'test.svg';
      await copyImageToSandbox(fileName, path);
      await createPixelMapListCallbackTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_012
     * @tc.name      : imageSource_createPixelMapList_callback_003
     * @tc.desc      : imageSource_createPixelMapList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_createPixelMapList_callback_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPixelMapList_callback_003';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
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
      await createPixelMapListCallbackOptionsTest(done, testName, path, decodingOptions);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_013
     * @tc.name      : imageSource_createPixelMapList_callback_004
     * @tc.desc      : imageSource_createPixelMapList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_createPixelMapList_callback_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPixelMapList_callback_004';
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
      await createPixelMapListCallbackOptionsTest(done, testName, path, decodingOptions);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_014
     * @tc.name      : imageSource_createPixelMapList_callback_005
     * @tc.desc      : imageSource_createPixelMapList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_createPixelMapList_callback_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPixelMapList_callback_005';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
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
      await createPixelMapListCallbackOptionsTest(done, testName, path, decodingOptions);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_015
     * @tc.name      : imageSource_createPixelMapList_callback_006
     * @tc.desc      : imageSource_createPixelMapList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_createPixelMapList_callback_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPixelMapList_callback_006';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 1, height: 2 },
        rotate: 360,
        desiredPixelFormat: image.PixelMapFormat.BGRA_8888,
        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
        index: 0
      };
      await copyImageToSandbox(fileName, path);
      await createPixelMapListCallbackOptionsTest(done, testName, path, decodingOptions);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_016
     * @tc.name      : imageSource_createPixelMapList_callback_007
     * @tc.desc      : imageSource_createPixelMapList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_createPixelMapList_callback_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPixelMapList_callback_007';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 1, height: 2 },
        rotate: 360
      };
      await copyImageToSandbox(fileName, path);
      await createPixelMapListCallbackOptionsTest(done, testName, path, decodingOptions);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_017
     * @tc.name      : imageSource_createPixelMapList_callback_008
     * @tc.desc      : imageSource_createPixelMapList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_createPixelMapList_callback_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPixelMapList_callback_008';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true
      };
      await copyImageToSandbox(fileName, path);
      await createPixelMapListCallbackOptionsTest(done, testName, path, decodingOptions);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_018
     * @tc.name      : imageSource_createPixelMapList_callback_009
     * @tc.desc      : imageSource_createPixelMapList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_createPixelMapList_callback_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPixelMapList_callback_009';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      let decodingOptions: image.DecodingOptions = {};
      await copyImageToSandbox(fileName, path);
      await createPixelMapListCallbackOptionsTest(done, testName, path, decodingOptions);
    })
  })
}