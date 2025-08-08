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

const TAG = LOG_TAG + 'createPixelMapUsingAllocatorSync ';

async function createPixelMapUsingAllocatorPromiseTest(done: Function, testName: string, pathUri: string,
  options?: image.DecodingOptions | undefined, allocatorType?: image.AllocatorType | undefined) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    let pixelMap: image.PixelMap;
    if (options == undefined && allocatorType == undefined) {
      pixelMap = await imageSourceApi.createPixelMapUsingAllocatorSync();
    } else {
      pixelMap = await imageSourceApi.createPixelMapUsingAllocatorSync(options, allocatorType);
    }
    imageSourceApi.release();
    expect(pixelMap != undefined).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function imageSourceCreatePixelMapUsingAllocatorSyncTest() {
  describe('imageSourceCreatePixelMapUsingAllocatorSyncTest', () => {

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
     * @tc.number    : IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_001
     * @tc.name      : imageSource_createPixelMapUsingAllocatorSync_promise_001
     * @tc.desc      : imageSource_createPixelMapUsingAllocatorSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_createPixelMapUsingAllocatorSync_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPixelMapUsingAllocatorSync_promise_001';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      const decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredSize: { width: 3072, height: 4096 },
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
        desiredRegion: { size: { height: 3072, width: 4096 }, x: 0, y: 0 },
        index: 0
      };
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      await copyImageToSandbox(fileName, path);
      await createPixelMapUsingAllocatorPromiseTest(done, testName, path, decodingOptions, allocatorType);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_002
     * @tc.name      : imageSource_createPixelMapUsingAllocatorSync_promise_002
     * @tc.desc      : imageSource_createPixelMapUsingAllocatorSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_createPixelMapUsingAllocatorSync_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPixelMapUsingAllocatorSync_promise_002';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      const decodingOptions: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 3072, height: 4096 },
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
        desiredRegion: { size: { height: 3072, width: 4096 }, x: 0, y: 0 },
        index: 0
      };
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      await copyImageToSandbox(fileName, path);
      await createPixelMapUsingAllocatorPromiseTest(done, testName, path, decodingOptions, allocatorType);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_003
     * @tc.name      : imageSource_createPixelMapUsingAllocatorSync_promise_003
     * @tc.desc      : imageSource_createPixelMapUsingAllocatorSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_createPixelMapUsingAllocatorSync_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPixelMapUsingAllocatorSync_promise_003';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      const decodingOptions: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 3072, height: 4096 },
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
        desiredRegion: { size: { height: 3072, width: 4096 }, x: 0, y: 0 },
        index: 0
      };
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      await copyImageToSandbox(fileName, path);
      await createPixelMapUsingAllocatorPromiseTest(done, testName, path, decodingOptions, allocatorType);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_004
     * @tc.name      : imageSource_createPixelMapUsingAllocatorSync_promise_004
     * @tc.desc      : imageSource_createPixelMapUsingAllocatorSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imageSource_createPixelMapUsingAllocatorSync_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPixelMapUsingAllocatorSync_promise_004';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      const decodingOptions: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 3072, height: 4096 },
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
        desiredRegion: { size: { height: 3072, width: 4096 }, x: 0, y: 0 },
        index: 0
      };
      const allocatorType = undefined;
      await copyImageToSandbox(fileName, path);
      await createPixelMapUsingAllocatorPromiseTest(done, testName, path, decodingOptions, allocatorType);
    })*/

    /**
     * @tc.number    : IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_005
     * @tc.name      : imageSource_createPixelMapUsingAllocatorSync_promise_005
     * @tc.desc      : imageSource_createPixelMapUsingAllocatorSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imageSource_createPixelMapUsingAllocatorSync_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPixelMapUsingAllocatorSync_promise_005';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      const decodingOptions = undefined
      const allocatorType = image.AllocatorType.SHARE_MEMORY;
      await copyImageToSandbox(fileName, path);
      await createPixelMapUsingAllocatorPromiseTest(done, testName, path, decodingOptions, allocatorType);
    })*/

    /**
     * @tc.number    : IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_006
     * @tc.name      : imageSource_createPixelMapUsingAllocatorSync_promise_006
     * @tc.desc      : imageSource_createPixelMapUsingAllocatorSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_createPixelMapUsingAllocatorSync_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPixelMapUsingAllocatorSync_promise_006';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      const decodingOptions: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 3072, height: 4096 },
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.BGRA_8888,
        desiredRegion: { size: { height: 3072, width: 4096 }, x: 0, y: 0 },
        index: 0
      };
      const allocatorType = image.AllocatorType.SHARE_MEMORY;
      await copyImageToSandbox(fileName, path);
      await createPixelMapUsingAllocatorPromiseTest(done, testName, path, decodingOptions, allocatorType);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_007
     * @tc.name      : imageSource_createPixelMapUsingAllocatorSync_promise_007
     * @tc.desc      : imageSource_createPixelMapUsingAllocatorSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_createPixelMapUsingAllocatorSync_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPixelMapUsingAllocatorSync_promise_007';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      const decodingOptions: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 3072, height: 4096 },
        rotate: 360,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        desiredRegion: { size: { height: 3072, width: 4096 }, x: 0, y: 0 },
        index: 0
      };
      const allocatorType = image.AllocatorType.SHARE_MEMORY;
      await copyImageToSandbox(fileName, path);
      await createPixelMapUsingAllocatorPromiseTest(done, testName, path, decodingOptions, allocatorType);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_008
     * @tc.name      : imageSource_createPixelMapUsingAllocatorSync_promise_008
     * @tc.desc      : imageSource_createPixelMapUsingAllocatorSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_createPixelMapUsingAllocatorSync_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPixelMapUsingAllocatorSync_promise_008';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      const decodingOptions = undefined;
      const allocatorType = undefined;
      await copyImageToSandbox(fileName, path);
      await createPixelMapUsingAllocatorPromiseTest(done, testName, path, decodingOptions, allocatorType);
    })
  })
}