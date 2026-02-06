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
import { LOG_TAG } from '../../common';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = LOG_TAG + 'packing';

async function packingPromiseTest(done: Function, testName: string, path: string, opts: image.PackingOption) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const resourceMgr = testContext.resourceManager;
    const rawFile = await resourceMgr.getRawFileContent(path);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    };
    let imageSource: image.ImageSource = await image.createImageSource(rawFile.buffer as ArrayBuffer, ops);
    let commodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
    let pictureObj: image.Picture = await image.createPicture(commodityPixelMap);
    const imagePackerApi: image.ImagePacker = await image.createImagePacker();
    let funcName = "Packing";
    if (imagePackerApi != null) {
      await imagePackerApi.packing(pictureObj, opts).then((data: ArrayBuffer) => {
        console.info(TAG, funcName, 'Succeeded in packing the image.' + data);
      }).catch((error: BusinessError) => {
        console.error(TAG, funcName, `Failed to pack the image.code ${error.code},message is ${error.message}`);
        expect().assertFail();
      });
      await imagePackerApi.release();
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function imagePackerPackingTest() {
  describe('imagePackerPackingTest', () => {

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
     * @tc.number    : IMAGE_SOURCE_PACKING_001
     * @tc.name      : imagePacker_packing_promise_001
     * @tc.desc      : imagePacker_packing
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imagePacker_packing_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packing_promise_001';
      const path = 'test.jpeg';
      const opts: image.PackingOption = {
        format: "image/jpeg",
        quality: 98,
        desiredDynamicRange: image.PackingDynamicRange.AUTO,
        needsPackProperties: true
      };
      await packingPromiseTest(done, testName, path, opts);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_PACKING_002
     * @tc.name      : imagePacker_packing_promise_002
     * @tc.desc      : imagePacker_packing
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imagePacker_packing_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packing_promise_002';
      const path = 'test.jpeg';
      const opts: image.PackingOption = {
        format: "image/jpeg",
        quality: 98
      };
      await packingPromiseTest(done, testName, path, opts);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_PACKING_003
     * @tc.name      : imagePacker_packing_promise_003
     * @tc.desc      : imagePacker_packing
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imagePacker_packing_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packing_promise_003';
      const path = 'test_exif_empty2.webp';
      const opts: image.PackingOption = {
        format: "image/jpeg",
        quality: 98,
        desiredDynamicRange: image.PackingDynamicRange.AUTO,
        needsPackProperties: true
      };
      await packingPromiseTest(done, testName, path, opts);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_PACKING_004
     * @tc.name      : imagePacker_packing_promise_004
     * @tc.desc      : imagePacker_packing
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imagePacker_packing_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packing_promise_004';
      const path = 'test7.png';
      const opts: image.PackingOption = {
        format: "image/jpeg",
        quality: 98,
        desiredDynamicRange: image.PackingDynamicRange.AUTO,
        needsPackProperties: false
      };
      await packingPromiseTest(done, testName, path, opts);
    })
  })
}