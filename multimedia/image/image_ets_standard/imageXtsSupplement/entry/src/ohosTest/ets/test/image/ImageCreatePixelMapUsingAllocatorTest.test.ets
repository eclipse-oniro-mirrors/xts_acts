/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { image } from '@kit.ImageKit';
import { BusinessError } from '@ohos.base';
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import common from '@ohos.app.ability.common';

const TAG = 'CreatePixelMapUsingAllocatorTestSupp'
let pixelMap : image.PixelMap
let fdNumber: number;
async function getFd(fileName: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let filePath = `file://${testContext.filesDir}/${fileName}`;
  console.info(TAG, 'image case filePath is ' + filePath);
  const fileInfo = await fs.open(filePath);
  fdNumber = fileInfo.fd
}

async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}

export default function CreatePixelMapUsingAllocatorTest() {;
  describe('CreatePixelMapUsingAllocatorTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(() => {
      console.info('afterAll case');
    });
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_001
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_001
     * @tc.desc   createPixelMapUsingAllocatorSync opts srcPixelFormat ARGB_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_001';
      const color: ArrayBuffer = new ArrayBuffer(1024);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.PREMUL,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 16, width: 16 }
        }
        pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_002
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_002
     * @tc.desc   createPixelMapUsingAllocatorSync opts srcPixelFormat RGB_565
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_002';
      const color: ArrayBuffer = new ArrayBuffer(1024);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.RGB_565,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 4 }
        }
        pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_003
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_003
     * @tc.desc   createPixelMapUsingAllocatorSync opts srcPixelFormat RGBA_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_003';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_004
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_004
     * @tc.desc   createPixelMapUsingAllocatorSync opts srcPixelFormat BGRA_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_004';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_005
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_005
     * @tc.desc   createPixelMapUsingAllocatorSync opts srcPixelFormat RGB_888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_005';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.RGB_888,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_006
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_006
     * @tc.desc   createPixelMapUsingAllocatorSync opts srcPixelFormat ALPHA_8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_006';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ALPHA_8,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_007
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_007
     * @tc.desc   createPixelMapUsingAllocatorSync opts srcPixelFormat NV21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_007';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.NV21,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_008
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_008
     * @tc.desc   createPixelMapUsingAllocatorSync opts srcPixelFormat NV12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_008';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.NV12,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_009
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_009
     * @tc.desc   createPixelMapUsingAllocatorSync opts srcPixelFormat RGBA_1010102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_009';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.RGBA_1010102,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_010
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_010
     * @tc.desc   createPixelMapUsingAllocatorSync opts alphaType UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_010';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.UNKNOWN,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap= image.createPixelMapUsingAllocatorSync(color, opts,image.AllocatorType.AUTO);
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_011
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_011
     * @tc.desc   createPixelMapUsingAllocatorSync opts alphaType OPAQUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_011';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_012
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_012
     * @tc.desc   createPixelMapUsingAllocatorSync opts alphaType PREMUL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_012';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.PREMUL,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_013
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_013
     * @tc.desc   createPixelMapUsingAllocatorSync opts alphaType UNPREMUL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_013';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.UNPREMUL,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_014
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_014
     * @tc.desc   createPixelMapUsingAllocatorSync opts ScaleMode FIT_TARGET_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_014';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.PREMUL,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 4, width: 6 }
        }
        pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_015
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_015
     * @tc.desc   createPixelMapUsingAllocatorSync opts scaleMode CENTER_CROP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_015';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.PREMUL,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_016
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_016
     * @tc.desc   createPixelMapUsingAllocatorSync opts editable false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_016';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.PREMUL,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_017
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_017
     * @tc.desc   createPixelMapUsingAllocatorSync opts pixelFormat ARGB_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_017';
      const color: ArrayBuffer = new ArrayBuffer(1024);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.PREMUL,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.ARGB_8888,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 16, width: 16 }
        }
        pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_018
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_018
     * @tc.desc   createPixelMapUsingAllocatorSync opts pixelFormat RGB_565
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_018';
      const color: ArrayBuffer = new ArrayBuffer(1024);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 4 }
        }
        pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_019
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_019
     * @tc.desc   createPixelMapUsingAllocatorSync opts pixelFormat RGBA_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_019';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_020
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_020
     * @tc.desc   createPixelMapUsingAllocatorSync opts pixelFormat BGRA_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_020';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_021
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_021
     * @tc.desc   createPixelMapUsingAllocatorSync opts pixelFormat RGB_888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_021';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.RGB_888,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_022
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_022
     * @tc.desc   createPixelMapUsingAllocatorSync opts pixelFormat ALPHA_8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_022';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.ALPHA_8,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_023
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_023
     * @tc.desc   createPixelMapUsingAllocatorSync opts pixelFormat NV21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_023', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_023';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.NV21,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_024
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_024
     * @tc.desc   createPixelMapUsingAllocatorSync opts pixelFormat NV12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_024', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_024';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.NV12,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_025
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_025
     * @tc.desc   createPixelMapUsingAllocatorSync pixelMap isEditable false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_025', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_SYNC_TEST_025';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.NV12,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
        console.info(TAG, testName, 'Succeeded in creating pixelmap.', pixelMap.isEditable);
        expect(pixelMap.isEditable).assertFalse();
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_001
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_001
     * @tc.desc   createPixelMapUsingAllocator opts srcPixelFormat ARGB_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_001';
      const color: ArrayBuffer = new ArrayBuffer(1024);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.PREMUL,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 16, width: 16 }
        }
        pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_002
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_002
     * @tc.desc   createPixelMapUsingAllocator opts srcPixelFormat RGB_565
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_002';
      const color: ArrayBuffer = new ArrayBuffer(1024);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.RGB_565,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 4 }
        }
        pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_003
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_003
     * @tc.desc   createPixelMapUsingAllocator opts srcPixelFormat RGBA_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_003';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_004
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_004
     * @tc.desc   createPixelMapUsingAllocator opts srcPixelFormat BGRA_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_004';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_005
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_005
     * @tc.desc   createPixelMapUsingAllocator opts srcPixelFormat RGB_888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_005';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.RGB_888,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_006
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_006
     * @tc.desc   createPixelMapUsingAllocator opts srcPixelFormat ALPHA_8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_006';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ALPHA_8,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_007
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_007
     * @tc.desc   createPixelMapUsingAllocator opts srcPixelFormat NV21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_007';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.NV21,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_008
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_008
     * @tc.desc   createPixelMapUsingAllocator opts srcPixelFormat NV12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_008';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.NV12,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_009
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_009
     * @tc.desc   createPixelMapUsingAllocator opts srcPixelFormat RGBA_1010102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_009';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.RGBA_1010102,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_010
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_010
     * @tc.desc   createPixelMapUsingAllocator opts alphaType UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_010';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.UNKNOWN,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap= image.createPixelMapUsingAllocatorSync(color, opts,image.AllocatorType.AUTO);
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_011
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_011
     * @tc.desc   createPixelMapUsingAllocator opts alphaType OPAQUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_011';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_012
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_012
     * @tc.desc   createPixelMapUsingAllocator opts alphaType PREMUL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_012';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.PREMUL,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_013
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_013
     * @tc.desc   createPixelMapUsingAllocator opts alphaType UNPREMUL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_013';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.UNPREMUL,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_014
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_014
     * @tc.desc   createPixelMapUsingAllocator opts ScaleMode FIT_TARGET_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_014';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.PREMUL,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 4, width: 6 }
        }
        pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_015
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_015
     * @tc.desc   createPixelMapUsingAllocator opts scaleMode CENTER_CROP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_015';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.PREMUL,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_016
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_016
     * @tc.desc   createPixelMapUsingAllocator opts editable false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_016';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.PREMUL,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_017
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_017
     * @tc.desc   createPixelMapUsingAllocator opts pixelFormat ARGB_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_017';
      const color: ArrayBuffer = new ArrayBuffer(1024);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.PREMUL,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.ARGB_8888,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 16, width: 16 }
        }
        pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_018
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_018
     * @tc.desc   createPixelMapUsingAllocator opts pixelFormat RGB_565
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_018';
      const color: ArrayBuffer = new ArrayBuffer(1024);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 4 }
        }
        pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_019
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_019
     * @tc.desc   createPixelMapUsingAllocator opts pixelFormat RGBA_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_019';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_020
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_020
     * @tc.desc   createPixelMapUsingAllocator opts pixelFormat BGRA_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_020';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_021
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_021
     * @tc.desc   createPixelMapUsingAllocator opts pixelFormat RGB_888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_021';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.RGB_888,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_022
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_022
     * @tc.desc   createPixelMapUsingAllocator opts pixelFormat ALPHA_8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_022';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.ALPHA_8,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_023
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_023
     * @tc.desc   createPixelMapUsingAllocator opts pixelFormat NV21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_023', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_023';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.NV21,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_024
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_024
     * @tc.desc   createPixelMapUsingAllocator opts pixelFormat NV12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_024', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_024';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.NV12,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_025
     * @tc.number IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_025
     * @tc.desc   createPixelMapUsingAllocator pixelMap isEditable false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_025', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_USING_ALLOCATOR_TEST_025';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions = {
          alphaType: image.AlphaType.OPAQUE,
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.NV12,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
        console.info(TAG, testName, 'Succeeded in creating pixelmap.', pixelMap.isEditable);
        expect(pixelMap.isEditable).assertFalse();
      } catch (error) {
        console.error(TAG,testName,"create failed:",error.code,error.msg);
        expect().assertFail();
      }finally {
        await pixelMap?.release();
        done();
      }
    })
  })
}