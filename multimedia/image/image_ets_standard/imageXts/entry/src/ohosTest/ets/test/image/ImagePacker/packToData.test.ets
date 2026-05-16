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

const TAG = LOG_TAG + 'packToData';

async function packToDataPromiseTest(done: Function, testName: string, pathUri: string, packOpts: image.PackingOption) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    const imagePackerApi: image.ImagePacker = image.createImagePacker();
    await imagePackerApi.packToData(imageSourceApi, packOpts);
    await imageSourceApi.release();
    await imagePackerApi.release();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function packToDataPixelMapPromiseTest(done: Function, testName: string,
  packOpts: image.PackingOption) {
  try {
    const color: ArrayBuffer = new ArrayBuffer(96);
    let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } };
    const pixelMap: image.PixelMap = await image.createPixelMap(color, opts)
    const imagePackerApi: image.ImagePacker = image.createImagePacker();
    await imagePackerApi.packToData(pixelMap, packOpts);
    await imagePackerApi.release();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}


export default function imagePackerPackToDataTest() {
  describe('imagePackerPackToDataTest', () => {

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
     * @tc.name   imagePacker_packToData_promise_001
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_001
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToData_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToData_promise_001';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToDataPromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToData_promise_002
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_002
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToData_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToData_promise_002';
      const fileName = 'test.jpeg';
      const path =  new Date().getTime() +'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 0 };
      await copyImageToSandbox(fileName, path);
      await packToDataPromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToData_promise_004
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_004
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToData_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToData_promise_004';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 100 };
      await copyImageToSandbox(fileName, path);
      await packToDataPromiseTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToData_promise_005
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_005
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToData_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToData_promise_005';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 90 };
      await copyImageToSandbox(fileName, path);
      await packToDataPromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToData_promise_006
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_006
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToData_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToData_promise_006';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 0 };
      await copyImageToSandbox(fileName, path);
      await packToDataPromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToData_promise_007
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_007
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToData_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToData_promise_007';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 10 };
      await copyImageToSandbox(fileName, path);
      await packToDataPromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToData_promise_008
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_008
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToData_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToData_promise_008';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 100 };
      await copyImageToSandbox(fileName, path);
      await packToDataPromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToData_promise_009
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_009
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToData_promise_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToData_promise_009';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/png", quality: 100 };
      await copyImageToSandbox(fileName, path);
      await packToDataPromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToData_promise_010
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_010
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToData_promise_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToData_promise_010';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/heic", quality: 10 };
      await copyImageToSandbox(fileName, path);
      await packToDataPromiseTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToData_promise_011
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_011
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToData_promise_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToData_promise_011';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/heif", quality: 10 };
      await copyImageToSandbox(fileName, path);
      await packToDataPromiseTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToData_promise_012
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_012
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToData_promise_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToData_promise_012';
      const fileName = 'test.svg';
      const path = new Date().getTime() + 'test.svg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 100 };
      await copyImageToSandbox(fileName, path);
      await packToDataPromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToData_promise_013
     * @tc.number imagePacker_packToData_promise_013
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToData_promise_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToData_promise_013';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
      await packToDataPixelMapPromiseTest(done, testName, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToData_promise_014
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_014
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToData_promise_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToData_promise_014';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 0 };
      await packToDataPixelMapPromiseTest(done, testName, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToData_promise_015
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_015
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToData_promise_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToData_promise_015';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 100 };
      await packToDataPixelMapPromiseTest(done, testName, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToData_promise_016
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_016
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToData_promise_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToData_promise_016';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 100 };
      await packToDataPixelMapPromiseTest(done, testName, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToData_promise_017
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_017
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToData_promise_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToData_promise_017';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 90 };
      await packToDataPixelMapPromiseTest(done, testName, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToData_promise_018
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_018
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToData_promise_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToData_promise_018';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 0 };
      await packToDataPixelMapPromiseTest(done, testName, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToData_promise_019
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_019
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToData_promise_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToData_promise_019';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 10 };
      await packToDataPixelMapPromiseTest(done, testName, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToData_promise_020
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_020
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToData_promise_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToData_promise_020';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 100 };
      await packToDataPixelMapPromiseTest(done, testName, packOpts);
    })


    /**
     * @tc.name   imagePacker_packToData_promise_021
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_021
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToData_promise_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToData_promise_021';
      let packOpts: image.PackingOption = { format: "image/png", quality: 100 };
      await packToDataPixelMapPromiseTest(done, testName, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToData_promise_022
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_022
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /* it('imagePacker_packToData_promise_022', Level.LEVEL0, async (done: Function) => {
       const testName = 'imagePacker_packToData_promise_022';
       let packOpts: image.PackingOption = { format: "image/heic", quality: 10 };
       await packToDataPixelMapPromiseTest(done, testName, packOpts);
     })*/

    /**
     * @tc.name   imagePacker_packToData_promise_023
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_023
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /* it('imagePacker_packToData_promise_023', Level.LEVEL0, async (done: Function) => {
       const testName = 'imagePacker_packToData_promise_023';
       let packOpts: image.PackingOption = { format: "image/heif", quality: 10 };
       await packToDataPixelMapPromiseTest(done, testName, packOpts);
     })*/

    /**
     * @tc.name   imagePacker_packToData_promise_024
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_024
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToData_promise_024', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToData_promise_024';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 100 };
      await packToDataPixelMapPromiseTest(done, testName, packOpts);
    })
  })
}