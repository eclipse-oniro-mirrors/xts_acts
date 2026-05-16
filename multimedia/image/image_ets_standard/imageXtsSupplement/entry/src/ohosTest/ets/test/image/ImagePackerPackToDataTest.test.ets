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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { image, sendableImage } from '@kit.ImageKit';
const TAG = 'PackToDataTestSupp'



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
     * @tc.name   IMAGE_PACKER_PACK_TO_DATA_TEST_001
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_TEST_001
     * @tc.desc   第一个参数null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PACKER_PACK_TO_DATA_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACK_TO_DATA_TEST_001';
      try {
        let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        const value: ESObject = null;
        await imagePackerObj.packToData(value as PixelMap, packOpts)
        console.info(TAG, testName, 'packToData success');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        done();
      }
    })
    /**
     * @tc.name   IMAGE_PACKER_PACK_TO_DATA_TEST_002
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_TEST_002
     * @tc.desc   第一个参数undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PACKER_PACK_TO_DATA_TEST_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACK_TO_DATA_TEST_002';
      try {
        let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        const value: ESObject = undefined;
        await imagePackerObj.packToData(value as PixelMap, packOpts)
        console.info(TAG, testName, 'packToData success');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        done();
      }
    })
    /**
     * @tc.name   IMAGE_PACKER_PACK_TO_DATA_TEST_003
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_TEST_003
     * @tc.desc   第一个参数空值覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PACKER_PACK_TO_DATA_TEST_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACK_TO_DATA_TEST_003';
      try {
        let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        const value: ESObject = {};
        await imagePackerObj.packToData(value as PixelMap, packOpts)
        console.info(TAG, testName, 'packToData success');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        done();
      }
    })
    /**
     * @tc.name   IMAGE_PACKER_PACK_TO_DATA_TEST_004
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_TEST_004
     * @tc.desc   第二个参数null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PACKER_PACK_TO_DATA_TEST_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACK_TO_DATA_TEST_004';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
        let pixelMap = await sendableImage.createPixelMap(color, opts)
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        await imagePackerObj.packToData( pixelMap as PixelMap ,  null as ESObject)
        console.info(TAG, testName, 'packToData success');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        done();
      }
    })
    /**
     * @tc.name   IMAGE_PACKER_PACK_TO_DATA_TEST_005
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_TEST_005
     * @tc.desc   第二个参数undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PACKER_PACK_TO_DATA_TEST_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACK_TO_DATA_TEST_005';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
        let pixelMap = await sendableImage.createPixelMap(color, opts)
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        await imagePackerObj.packToData( pixelMap as PixelMap ,  undefined as ESObject)
        console.info(TAG, testName, 'packToData success');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        done();
      }
    })
    /**
     * @tc.name   IMAGE_PACKER_PACK_TO_DATA_TEST_006
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_TEST_006
     * @tc.desc   第二个参数空值覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PACKER_PACK_TO_DATA_TEST_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACK_TO_DATA_TEST_006';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
        let pixelMap = await sendableImage.createPixelMap(color, opts)
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        await imagePackerObj.packToData( pixelMap as PixelMap ,  {} as ESObject)
        console.info(TAG, testName, 'packToData success');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        done();
      }
    })
  })
}
