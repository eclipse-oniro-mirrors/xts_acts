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
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../common';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = LOG_TAG + 'PackerPackingSupp';

export default function imagePackerPackingTest() {
  describe('imagePackerPackingTest', () => {

    beforeAll(async () => {
      AppStorage.setOrCreate('emptyString','')
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
      AppStorage.delete('emptyString')
    });


    /**
     * @tc.name   IMAGE_PACKER_PACKING_001
     * @tc.number IMAGE_PACKER_PACKING_001
     * @tc.desc   Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PACKER_PACKING_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_001';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG, testName, 'color');
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        console.info(TAG, testName, 'opts');
        image.createPixelMap(color, opts)
        console.info(TAG, testName, 'createPixelMap');
        let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
        console.info(TAG, testName, 'packOpts');
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        imagePackerObj.packing(null, packOpts)
        console.info(TAG, testName, 'packing success');
        done()
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_PACKER_PACKING_002
     * @tc.number IMAGE_PACKER_PACKING_002
     * @tc.desc   Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PACKER_PACKING_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_002';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG, testName, 'color');
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        console.info(TAG, testName, 'opts');
        image.createPixelMap(color, opts)
        console.info(TAG, testName, 'createPixelMap');
        let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
        console.info(TAG, testName, 'packOpts');
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        imagePackerObj.packing(undefined, packOpts)
        console.info(TAG, testName, 'packing success');
        done()
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_PACKER_PACKING_003
     * @tc.number IMAGE_PACKER_PACKING_003
     * @tc.desc   Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PACKER_PACKING_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_003';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG, testName, 'color');
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        console.info(TAG, testName, 'opts');
        image.createPixelMap(color, opts)
        console.info(TAG, testName, 'createPixelMap');
        let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
        console.info(TAG, testName, 'packOpts');
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        imagePackerObj.packing(AppStorage.get('emptyString'), packOpts)
        console.info(TAG, testName, 'packing success');
        done()
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_PACKER_PACKING_004
     * @tc.number IMAGE_PACKER_PACKING_004
     * @tc.desc   Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PACKER_PACKING_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_004';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG, testName, 'color');
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        console.info(TAG, testName, 'opts');
        let pixelMap = await image.createPixelMap(color, opts)
        console.info(TAG, testName, 'createPixelMap');
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        imagePackerObj.packing(pixelMap, null)
        console.info(TAG, testName, 'packing success');
        done()
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_PACKER_PACKING_005
     * @tc.number IMAGE_PACKER_PACKING_005
     * @tc.desc   Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PACKER_PACKING_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_005';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG, testName, 'color');
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        console.info(TAG, testName, 'opts');
        let pixelMap = await image.createPixelMap(color, opts)
        console.info(TAG, testName, 'createPixelMap');
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        imagePackerObj.packing(pixelMap, undefined)
        console.info(TAG, testName, 'packing success');
        done()
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_PACKER_PACKING_006
     * @tc.number IMAGE_PACKER_PACKING_006
     * @tc.desc   Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PACKER_PACKING_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_006';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG, testName, 'color');
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        console.info(TAG, testName, 'opts');
        let pixelMap = await image.createPixelMap(color, opts)
        console.info(TAG, testName, 'createPixelMap');
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        imagePackerObj.packing(pixelMap, AppStorage.get('emptyString'))
        console.info(TAG, testName, 'packing success');
        done()
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_PACKER_PACKING_007
     * @tc.number IMAGE_PACKER_PACKING_007
     * @tc.desc   Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PACKER_PACKING_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_007';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG, testName, 'color');
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        console.info(TAG, testName, 'opts');
        image.createPixelMap(color, opts)
        console.info(TAG, testName, 'createPixelMap');
        let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
        console.info(TAG, testName, 'packOpts');
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        console.info(TAG, testName, 'imagePackerObj');
        imagePackerObj.packing(null, packOpts, (err: BusinessError, data: ArrayBuffer) => {
          console.info(TAG,'succeed packing')
          if (err) {
            console.error(`Failed to pack the image.code ${err.code},message is ${err.message}`);
          } else {
            console.info('Succeeded in packing the image.');
          }
          done()
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_PACKER_PACKING_008
     * @tc.number IMAGE_PACKER_PACKING_008
     * @tc.desc   Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PACKER_PACKING_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_008';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG, testName, 'color');
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        console.info(TAG, testName, 'opts');
        image.createPixelMap(color, opts)
        console.info(TAG, testName, 'createPixelMap');
        let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
        console.info(TAG, testName, 'packOpts');
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        console.info(TAG, testName, 'imagePackerObj');
        imagePackerObj.packing(undefined, packOpts, (err: BusinessError, data: ArrayBuffer) => {
          console.info(TAG,'succeed packing')
          if (err) {
            console.error(`Failed to pack the image.code ${err.code},message is ${err.message}`);
          } else {
            console.info('Succeeded in packing the image.');
          }
          done()
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_PACKER_PACKING_009
     * @tc.number IMAGE_PACKER_PACKING_009
     * @tc.desc   Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PACKER_PACKING_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_009';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG, testName, 'color');
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        console.info(TAG, testName, 'opts');
        image.createPixelMap(color, opts)
        console.info(TAG, testName, 'createPixelMap');
        let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
        console.info(TAG, testName, 'packOpts');
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        console.info(TAG, testName, 'imagePackerObj');
        imagePackerObj.packing(AppStorage.get('emptyString'), packOpts, (err: BusinessError, data: ArrayBuffer) => {
          console.info(TAG,'succeed packing')
          if (err) {
            console.error(`Failed to pack the image.code ${err.code},message is ${err.message}`);
          } else {
            console.info('Succeeded in packing the image.');
          }
          done()
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_PACKER_PACKING_010
     * @tc.number IMAGE_PACKER_PACKING_010
     * @tc.desc   Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PACKER_PACKING_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_010';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG, testName, 'color');
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        console.info(TAG, testName, 'opts');
        let pixelMap = await image.createPixelMap(color, opts)
        console.info(TAG, testName, 'createPixelMap');
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        console.info(TAG, testName, 'imagePackerObj');
        imagePackerObj.packing(pixelMap, null, (err: BusinessError, data: ArrayBuffer) => {
          console.info(TAG,'succeed packing')
          if (err) {
            console.error(`Failed to pack the image.code ${err.code},message is ${err.message}`);
          } else {
            console.info('Succeeded in packing the image.');
          }
          done()
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_PACKER_PACKING_011
     * @tc.number IMAGE_PACKER_PACKING_011
     * @tc.desc   Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PACKER_PACKING_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_011';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG, testName, 'color');
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        console.info(TAG, testName, 'opts');
        let pixelMap = await image.createPixelMap(color, opts)
        console.info(TAG, testName, 'createPixelMap');
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        console.info(TAG, testName, 'imagePackerObj');
        imagePackerObj.packing(pixelMap, undefined, (err: BusinessError, data: ArrayBuffer) => {
          console.info(TAG,'succeed packing')
          if (err) {
            console.error(`Failed to pack the image.code ${err.code},message is ${err.message}`);
          } else {
            console.info('Succeeded in packing the image.');
          }
          done()
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_PACKER_PACKING_012
     * @tc.number IMAGE_PACKER_PACKING_012
     * @tc.desc   Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PACKER_PACKING_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_012';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG, testName, 'color');
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        console.info(TAG, testName, 'opts');
        let pixelMap = await image.createPixelMap(color, opts)
        console.info(TAG, testName, 'createPixelMap');
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        console.info(TAG, testName, 'imagePackerObj');
        imagePackerObj.packing(pixelMap, AppStorage.get('emptyString'), (err: BusinessError) => {
          console.info(TAG,'succeed packing')
          if (err) {
            console.error(`Failed to pack the image.code ${err.code},message is ${err.message}`);
          } else {
            console.info('Succeeded in packing the image.');
          }
          done()
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    });
  });
}