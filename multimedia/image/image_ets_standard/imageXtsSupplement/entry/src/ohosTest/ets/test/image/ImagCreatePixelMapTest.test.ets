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
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import { isEmpty } from '../common';

const TAG = 'Image.ImagCreatePixelMapTest';

let pixelMap: image.PixelMap;

export default function ImagCreatePixelMapTest() {
  describe('ImagCreatePixelMapTest', () => {
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
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_000001
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_000001
     * @tc.desc   image createPixelMapUsingAllocatorSync the pixelFormat is UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_000001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_000001';
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.UNKNOWN,
            size: { height: 4, width: 6 }
          }
        pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        expect().assertFalse();
      } catch (error) {
        console.error(TAG, testName, ' createPixelMapUsingAllocatorSync error', error.message, error.code);
        expect(Number(error.code)).assertEqual(7600201);
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00002
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00002
     * @tc.desc   image createPixelMapUsingAllocatorSync the srcPixelFormat is ARGB_8888 the pixelFormat is ARGB_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00002';
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.ARGB_8888,
            pixelFormat: image.PixelMapFormat.ARGB_8888,
            size: { height: 4, width: 6 }
          }
        pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        let res = await pixelMap.getImageInfo();
        expect(isEmpty(pixelMap)).assertFalse();
        expect(res.pixelFormat == image.PixelMapFormat.ARGB_8888).assertTrue();
        console.info(TAG, testName, ' createPixelMapUsingAllocatorSync success');
      } catch (error) {
        console.error(TAG, testName, ' createPixelMapUsingAllocatorSync error', error.message, error.code);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00003
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00003
     * @tc.desc   image createPixelMapUsingAllocatorSync the srcPixelFormat is RGB_565 the pixelFormat is RGB_565
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00003', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00003';
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.RGB_565,
            pixelFormat: image.PixelMapFormat.RGB_565,
            size: { height: 4, width: 6 }
          }
        pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        let res = await pixelMap.getImageInfo();
        expect(isEmpty(pixelMap)).assertFalse();
        expect(res.pixelFormat == image.PixelMapFormat.RGB_565).assertTrue();
        console.info(TAG, testName, ' createPixelMapUsingAllocatorSync success');
      } catch (error) {
        console.error(TAG, testName, ' createPixelMapUsingAllocatorSync error', error.message, error.code);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00004
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00004
     * @tc.desc   image createPixelMapUsingAllocatorSync the srcPixelFormat is RGBA_8888 the editable is false the isEditable is false the isStrideAlignment is false the alphaType is UNKNOWN the scaleMode is FIT_TARGET_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00004', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00004';
      try {
        let opts: image.InitializationOptions =
          {
            editable: false,
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 },
            alphaType: image.AlphaType.UNKNOWN,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          }
        pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        let res = await pixelMap.getImageInfo();
        expect(isEmpty(pixelMap)).assertFalse();
        expect(pixelMap.isEditable).assertFalse();
        expect(pixelMap.isStrideAlignment).assertFalse();
        expect(res.alphaType == image.AlphaType.PREMUL).assertTrue();
        console.info(TAG, testName, ' createPixelMapUsingAllocatorSync success');
      } catch (error) {
        console.error(TAG, testName, ' createPixelMapUsingAllocatorSync error', error.message, error.code);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00005
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00005
     * @tc.desc   image createPixelMapUsingAllocatorSync the srcPixelFormat is BGRA_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00005', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00005';
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.BGRA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 },
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          }
        pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        expect(isEmpty(pixelMap)).assertFalse();
        console.info(TAG, testName, ' createPixelMapUsingAllocatorSync success');
      } catch (error) {
        console.error(TAG, testName, ' createPixelMapUsingAllocatorSync error', error.message, error.code);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00006
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00006
     * @tc.desc   image createPixelMapUsingAllocatorSync the srcPixelFormat is RGB_888 the pixelFormat is RGB_888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00006', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00006';
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.RGB_888,
            pixelFormat: image.PixelMapFormat.RGB_888,
            size: { height: 4, width: 6 }
          }
        pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        let res = await pixelMap.getImageInfo();
        expect(isEmpty(pixelMap)).assertFalse();
        expect(res.pixelFormat == image.PixelMapFormat.RGB_888).assertTrue();
        console.info(TAG, testName, ' createPixelMapUsingAllocatorSync success');
      } catch (error) {
        console.error(TAG, testName, ' createPixelMapUsingAllocatorSync error', error.message, error.code);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00007
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00007
     * @tc.desc   image createPixelMapUsingAllocatorSync the srcPixelFormat is ALPHA_8 the pixelFormat is ALPHA_8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00007', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00007';
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.ALPHA_8,
            pixelFormat: image.PixelMapFormat.ALPHA_8,
            size: { height: 4, width: 6 }
          }
        pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        let res = await pixelMap.getImageInfo();
        expect(isEmpty(pixelMap)).assertFalse();
        expect(res.pixelFormat == image.PixelMapFormat.ALPHA_8).assertTrue();
        console.info(TAG, testName, ' createPixelMapUsingAllocatorSync success');
      } catch (error) {
        console.error(TAG, testName, ' createPixelMapUsingAllocatorSync error', error.message, error.code);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00008
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00008
     * @tc.desc   image createPixelMapUsingAllocatorSync the srcPixelFormat is RGBA_F16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00008', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00008';
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.RGBA_F16,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }
          }
        pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        expect(isEmpty(pixelMap)).assertFalse();
        console.info(TAG, testName, ' createPixelMapUsingAllocatorSync success');
      } catch (error) {
        console.error(TAG, testName, ' createPixelMapUsingAllocatorSync error', error.message, error.code);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00009
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00009
     * @tc.desc   image createPixelMapUsingAllocatorSync the srcPixelFormat is NV21 the pixelFormat is NV21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00009', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00009';
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.NV21,
            pixelFormat: image.PixelMapFormat.NV21,
            size: { height: 4, width: 6 }
          }
        pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        let res = await pixelMap.getImageInfo();
        expect(isEmpty(pixelMap)).assertFalse();
        expect(res.pixelFormat == image.PixelMapFormat.NV21).assertTrue();
        console.info(TAG, testName, ' createPixelMapUsingAllocatorSync success');
      } catch (error) {
        console.error(TAG, testName, ' createPixelMapUsingAllocatorSync error', error.message, error.code);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00010
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00010
     * @tc.desc   image createPixelMapUsingAllocatorSync the srcPixelFormat is NV12 the pixelFormat is NV12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00010', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00010';
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.NV12,
            pixelFormat: image.PixelMapFormat.NV12,
            size: { height: 4, width: 6 }
          }
        pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        let res = await pixelMap.getImageInfo();
        expect(isEmpty(pixelMap)).assertFalse();
        expect(res.pixelFormat == image.PixelMapFormat.NV12).assertTrue();
        console.info(TAG, testName, ' createPixelMapUsingAllocatorSync success');
      } catch (error) {
        console.error(TAG, testName, ' createPixelMapUsingAllocatorSync error', error.message, error.code);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00014
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00014
     * @tc.desc   image createPixelMapUsingAllocatorSync the srcPixelFormat is ASTC_4x4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00014', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00014';
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.ASTC_4x4,
            size: { height: 4, width: 6 }
          }
        pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, ' createPixelMapUsingAllocatorSync error', error.message, error.code);
        expect(Number(error.code)).assertEqual(7600201);
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_000014
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_000014
     * @tc.desc   image createPixelMapUsingAllocatorSync the pixelFormat is ASTC_4x4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_000014', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_000014';
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.ASTC_4x4,
            size: { height: 4, width: 6 }
          }
        pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, ' createPixelMapUsingAllocatorSync error', error.message, error.code);
        expect(Number(error.code)).assertEqual(7600201);
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_TEST_00001
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_TEST_00001
     * @tc.desc   image createPixelMapUsingAllocatorSync the first parameter is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_TEST_00001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_TEST_00001';
      try {
        pixelMap = image.createPixelMapUsingAllocatorSync(null as ESObject as image.InitializationOptions, image.AllocatorType.AUTO);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, 'createPixelMapUsingAllocatorSync error', error.message, error.code);
        expect(Number(error.code)).assertEqual(7600201);
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_TEST_00002
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_TEST_00002
     * @tc.desc   image createPixelMapUsingAllocatorSync the first parameter is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_TEST_00002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_TEST_00002';
      try {
        pixelMap = image.createPixelMapUsingAllocatorSync(undefined as ESObject as image.InitializationOptions, image.AllocatorType.AUTO);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, 'createPixelMapUsingAllocatorSync error', error.message, error.code);
        expect(Number(error.code)).assertEqual(7600201);
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_00001
     * @tc.number IMAGE_CREATE_PIXEL_MAP_00001
     * @tc.desc   image createPixelMap the srcPixelFormat emu is UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_00001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_00001';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.UNKNOWN,
            size: { height: 4, width: 6 }
          }
        image.createPixelMap(color, opts, async (error: BusinessError, pixelMap: image.PixelMap) => {
          if (error) {
            console.error(TAG, testName, image.PixelMapFormat.UNKNOWN, ' createPixelMap error', error, error.code);
            expect().assertFail();
            done();
          } else {
            expect(isEmpty(pixelMap)).assertFalse();
            console.info(TAG, testName, image.PixelMapFormat.UNKNOWN, ' createPixelMap success');
            await pixelMap?.release();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName, testName, image.PixelMapFormat.UNKNOWN, ' catch createPixelMap error', error,
          error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_00002
     * @tc.number IMAGE_CREATE_PIXEL_MAP_00002
     * @tc.desc   image createPixelMap the srcPixelFormat emu is ARGB_8888 the isEditable is false the scaleMode is FIT_TARGET_SIZE the alphaType is OPAQUE the pixelFormat is NV21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_00002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_00002';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: false,
            srcPixelFormat: image.PixelMapFormat.ARGB_8888,
            pixelFormat: image.PixelMapFormat.NV21,
            size: { height: 4, width: 6 },
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
            alphaType: image.AlphaType.OPAQUE
          }
        image.createPixelMap(color, opts, async (error: BusinessError, pixelMap: image.PixelMap) => {
          if (error) {
            console.error(TAG, testName, image.PixelMapFormat.ARGB_8888, ' createPixelMap error', error, error.code);
            expect().assertFail();
            done();
          } else {
            expect(isEmpty(pixelMap)).assertFalse();
            expect(pixelMap.isEditable == false).assertTrue();
            let res = await pixelMap.getImageInfo();
            expect(res.pixelFormat == image.PixelMapFormat.NV21).assertTrue();
            expect(res.alphaType == image.AlphaType.OPAQUE).assertTrue();
            console.info(TAG, testName, image.PixelMapFormat.NV21, ' createPixelMap success');
            await pixelMap?.release();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName, testName, image.PixelMapFormat.ARGB_8888, ' catch createPixelMap error', error,
          error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_00003
     * @tc.number IMAGE_CREATE_PIXEL_MAP_00003
     * @tc.desc   image createPixelMap the srcPixelFormat emu is RGB_565 the pixelFormat is NV12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_00003', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_00003';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.RGB_565,
            pixelFormat: image.PixelMapFormat.NV12,
            size: { height: 4, width: 6 },
          }
        image.createPixelMap(color, opts, async (error: BusinessError, pixelMap: image.PixelMap) => {
          if (error) {
            console.error(TAG, testName, image.PixelMapFormat.RGB_565, ' createPixelMap error', error, error.code);
            expect().assertFail();
            done();
          } else {
            expect(isEmpty(pixelMap)).assertFalse();
            let res = await pixelMap.getImageInfo();
            expect(res.pixelFormat == image.PixelMapFormat.NV12).assertTrue();
            console.info(TAG, testName, image.PixelMapFormat.RGB_565, ' createPixelMap success');
            await pixelMap?.release();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName, testName, image.PixelMapFormat.RGB_565, ' catch createPixelMap error', error,
          error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_00004
     * @tc.number IMAGE_CREATE_PIXEL_MAP_00004
     * @tc.desc   image createPixelMap the srcPixelFormat emu is RGBA_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_00004', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_00004';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 },
          }
        image.createPixelMap(color, opts, async (error: BusinessError, pixelMap: image.PixelMap) => {
          if (error) {
            console.error(TAG, testName, image.PixelMapFormat.RGBA_8888, ' createPixelMap error', error, error.code);
            expect().assertFail();
            done();
          } else {
            expect(isEmpty(pixelMap)).assertFalse();
            console.info(TAG, testName, image.PixelMapFormat.RGBA_8888, ' createPixelMap success');
            await pixelMap?.release();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName, testName, image.PixelMapFormat.RGBA_8888, ' catch createPixelMap error', error,
          error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_00005
     * @tc.number IMAGE_CREATE_PIXEL_MAP_00005
     * @tc.desc   image createPixelMap the srcPixelFormat emu is BGRA_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_00005', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_00005';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.BGRA_8888,
            size: { height: 4, width: 6 }
          }
        image.createPixelMap(color, opts, async (error: BusinessError, pixelMap: image.PixelMap) => {
          if (error) {
            console.error(TAG, testName, image.PixelMapFormat.BGRA_8888, ' createPixelMap error', error, error.code);
            expect().assertFail();
            done();
          } else {
            expect(isEmpty(pixelMap)).assertFalse();
            console.info(TAG, testName, image.PixelMapFormat.BGRA_8888, ' createPixelMap success');
            await pixelMap?.release();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName, testName, image.PixelMapFormat.BGRA_8888, ' catch createPixelMap error', error,
          error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_00006
     * @tc.number IMAGE_CREATE_PIXEL_MAP_00006
     * @tc.desc   image createPixelMap the srcPixelFormat emu is RGB_888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_00006', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_00006';
      const color: ArrayBuffer = new ArrayBuffer(72);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.RGB_888,
            size: { height: 4, width: 6 }
          }
        image.createPixelMap(color, opts, async (error: BusinessError, pixelMap: image.PixelMap) => {
          if (error) {
            console.error(TAG, testName, image.PixelMapFormat.RGB_888, ' createPixelMap error', error, error.code);
            expect().assertFail();
            done();
          } else {
            expect(isEmpty(pixelMap)).assertFalse();
            console.info(TAG, testName, image.PixelMapFormat.RGB_888, ' createPixelMap success');
            await pixelMap?.release();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName, testName, image.PixelMapFormat.RGB_888, ' catch createPixelMap error', error,
          error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_00007
     * @tc.number IMAGE_CREATE_PIXEL_MAP_00007
     * @tc.desc   image createPixelMap the srcPixelFormat emu is ALPHA_8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_00007', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_00007';
      const color: ArrayBuffer = new ArrayBuffer(24);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.ALPHA_8,
            size: { height: 4, width: 6 }
          }
        image.createPixelMap(color, opts, async (error: BusinessError, pixelMap: image.PixelMap) => {
          if (error) {
            console.error(TAG, testName, image.PixelMapFormat.ALPHA_8, ' createPixelMap error', error, error.code);
            expect().assertFail();
            done();
          } else {
            expect(isEmpty(pixelMap)).assertFalse();
            console.info(TAG, testName, image.PixelMapFormat.ALPHA_8, ' createPixelMap success');
            await pixelMap?.release();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName, testName, image.PixelMapFormat.ALPHA_8, ' catch createPixelMap error', error,
          error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_00008
     * @tc.number IMAGE_CREATE_PIXEL_MAP_00008
     * @tc.desc   image createPixelMap the srcPixelFormat emu is RGBA_F16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_00008', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_00008';
      const color: ArrayBuffer = new ArrayBuffer(192);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.RGBA_F16,
            size: { height: 4, width: 6 }
          }
        image.createPixelMap(color, opts, async (error: BusinessError, pixelMap: image.PixelMap) => {
          if (error) {
            console.error(TAG, testName, image.PixelMapFormat.RGBA_F16, ' createPixelMap error', error, error.code);
            expect().assertFail();
            done();
          } else {
            expect(isEmpty(pixelMap)).assertFalse();
            console.info(TAG, testName, image.PixelMapFormat.RGBA_F16, ' createPixelMap success');
            await pixelMap?.release();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName, testName, image.PixelMapFormat.RGBA_F16, ' catch createPixelMap error', error,
          error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_00009
     * @tc.number IMAGE_CREATE_PIXEL_MAP_00009
     * @tc.desc   image createPixelMap the srcPixelFormat emu is NV21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_00009', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_00009';
      const color: ArrayBuffer = new ArrayBuffer(40);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.NV21,
            size: { height: 4, width: 6 }
          }
        image.createPixelMap(color, opts, async (error: BusinessError, pixelMap: image.PixelMap) => {
          if (error) {
            console.error(TAG, testName, image.PixelMapFormat.NV21, ' createPixelMap error', error, error.code);
            expect().assertFail();
            done();
          } else {
            expect(isEmpty(pixelMap)).assertFalse();
            console.info(TAG, testName, image.PixelMapFormat.NV21, ' createPixelMap success');
            await pixelMap?.release();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName, testName, image.PixelMapFormat.NV21, ' catch createPixelMap error', error,
          error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_00010
     * @tc.number IMAGE_CREATE_PIXEL_MAP_00010
     * @tc.desc   image createPixelMap the srcPixelFormat emu is NV12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_00010', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_00010';
      const color: ArrayBuffer = new ArrayBuffer(40);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.NV12,
            size: { height: 4, width: 6 }
          }
        image.createPixelMap(color, opts, async (error: BusinessError, pixelMap: image.PixelMap) => {
          if (error) {
            console.error(TAG, testName, image.PixelMapFormat.NV12, ' createPixelMap error', error, error.code);
            expect().assertFail();
            done();
          } else {
            expect(isEmpty(pixelMap)).assertFalse();
            console.info(TAG, testName, image.PixelMapFormat.NV12, ' createPixelMap success');
            await pixelMap?.release();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName, testName, image.PixelMapFormat.NV12, ' catch createPixelMap error', error,
          error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_00011
     * @tc.number IMAGE_CREATE_PIXEL_MAP_00011
     * @tc.desc   image createPixelMap the srcPixelFormat emu is RGBA_1010102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_00011', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_00011';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.RGBA_1010102,
            size: { height: 4, width: 6 }
          }
        image.createPixelMap(color, opts, async (error: BusinessError, pixelMap: image.PixelMap) => {
          if (error) {
            console.error(TAG, testName, image.PixelMapFormat.RGBA_1010102, ' createPixelMap error', error, error.code);
            expect().assertFail();
            done();
          } else {
            expect(isEmpty(pixelMap)).assertFalse();
            console.info(TAG, testName, image.PixelMapFormat.RGBA_1010102, ' createPixelMap success');
            await pixelMap?.release();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName, testName, image.PixelMapFormat.RGBA_1010102, ' catch createPixelMap error', error,
          error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_00012
     * @tc.number IMAGE_CREATE_PIXEL_MAP_00012
     * @tc.desc   image createPixelMap the srcPixelFormat emu is YCBCR_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_00012', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_00012';
      const color: ArrayBuffer = new ArrayBuffer(48);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.YCBCR_P010,
            size: { height: 4, width: 6 }
          }
        image.createPixelMap(color, opts, async (error: BusinessError, pixelMap: image.PixelMap) => {
          if (error) {
            console.error(TAG, testName, image.PixelMapFormat.YCBCR_P010, ' createPixelMap error', error, error.code);
            expect().assertFail();
            done();
          } else {
            expect(isEmpty(pixelMap)).assertFalse();
            console.info(TAG, testName, image.PixelMapFormat.YCBCR_P010, ' createPixelMap success');
            await pixelMap?.release();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName, testName, image.PixelMapFormat.YCBCR_P010, ' catch createPixelMap error', error,
          error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_00013
     * @tc.number IMAGE_CREATE_PIXEL_MAP_00013
     * @tc.desc   image createPixelMap the srcPixelFormat emu is YCRCB_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_00013', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_00013';
      const color: ArrayBuffer = new ArrayBuffer(48);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.YCRCB_P010,
            size: { height: 4, width: 6 }
          }
        image.createPixelMap(color, opts, async (error: BusinessError, pixelMap: image.PixelMap) => {
          if (error) {
            console.error(TAG, testName, image.PixelMapFormat.YCRCB_P010, ' createPixelMap error', error, error.code);
            expect().assertFail();
            done();
          } else {
            expect(isEmpty(pixelMap)).assertFalse();
            console.info(TAG, testName, image.PixelMapFormat.YCRCB_P010, ' createPixelMap success');
            await pixelMap?.release();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName, testName, image.PixelMapFormat.YCRCB_P010, ' catch createPixelMap error', error,
          error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_00014
     * @tc.number IMAGE_CREATE_PIXEL_MAP_00014
     * @tc.desc   image createPixelMap the srcPixelFormat emu is ASTC_4x4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_00014', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_00014';
      const color: ArrayBuffer = new ArrayBuffer(16);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.ASTC_4x4,
            size: { height: 4, width: 4 }
          }
        image.createPixelMap(color, opts, async (error: BusinessError, pixelMap: image.PixelMap) => {
          if (error) {
            console.error(TAG, testName, image.PixelMapFormat.ASTC_4x4, ' createPixelMap error', error, error.code);
            expect().assertFail();
            done();
          } else {
            expect(isEmpty(pixelMap)).assertFalse();
            console.info(TAG, testName, image.PixelMapFormat.ASTC_4x4, ' createPixelMap success');
            await pixelMap?.release();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName, testName, image.PixelMapFormat.ASTC_4x4, ' catch createPixelMap error', error,
          error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_00015
     * @tc.number IMAGE_CREATE_PIXEL_MAP_00015
     * @tc.desc   image createPixelMap the alphaType is PREMUL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_00015', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_00015';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.ARGB_8888,
            pixelFormat: image.PixelMapFormat.ARGB_8888,
            size: { height: 4, width: 6 },
            alphaType: image.AlphaType.PREMUL
          }
        image.createPixelMap(color, opts, async (error: BusinessError, pixelMap: image.PixelMap) => {
          if (error) {
            console.error(TAG, testName, image.AlphaType.PREMUL, ' createPixelMap error', error, error.code);
            expect().assertFail();
            done();
          } else {
            let res = await pixelMap.getImageInfo();
            expect(res.alphaType == image.AlphaType.PREMUL).assertTrue();
            console.info(TAG, testName, image.AlphaType.PREMUL, ' createPixelMap success');
            await pixelMap?.release();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName, testName, image.AlphaType.PREMUL, ' catch createPixelMap error', error,
          error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_00016
     * @tc.number IMAGE_CREATE_PIXEL_MAP_00016
     * @tc.desc   image createPixelMap the alphaType is UNPREMUL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_00016', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_00016';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.ARGB_8888,
            pixelFormat: image.PixelMapFormat.ARGB_8888,
            size: { height: 4, width: 6 },
            alphaType: image.AlphaType.UNPREMUL
          }
        image.createPixelMap(color, opts, async (error: BusinessError, pixelMap: image.PixelMap) => {
          if (error) {
            console.error(TAG, testName, image.AlphaType.UNPREMUL, ' createPixelMap error', error, error.code);
            expect().assertFail();
            done();
          } else {
            let res = await pixelMap.getImageInfo();
            expect(res.alphaType == image.AlphaType.UNPREMUL).assertTrue();
            console.info(TAG, testName, image.AlphaType.UNPREMUL, ' createPixelMap success');
            await pixelMap?.release();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName, testName, image.AlphaType.UNPREMUL, ' catch createPixelMap error', error,
          error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_00017
     * @tc.number IMAGE_CREATE_PIXEL_MAP_00017
     * @tc.desc   image createPixelMap the pixelFormat is RGBA_1010102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_00017', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_00017';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            size: { height: 4, width: 6 },
          }
        image.createPixelMap(color, opts, async (error: BusinessError, pixelMap: image.PixelMap) => {
          if (error) {
            console.error(TAG, testName, image.PixelMapFormat.RGBA_1010102, ' createPixelMap error', error, error.code);
            expect(Number(error)).assertEqual(62980096);
            done();
          } else {
            expect().assertFail();
            await pixelMap?.release();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName, testName, image.PixelMapFormat.RGBA_1010102, ' catch createPixelMap error', error,
          error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_00018
     * @tc.number IMAGE_CREATE_PIXEL_MAP_00018
     * @tc.desc   image createPixelMap the pixelFormat is YCBCR_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_00018', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_00018';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.YCBCR_P010,
            size: { height: 4, width: 6 },
          }
        image.createPixelMap(color, opts, async (error: BusinessError, pixelMap: image.PixelMap) => {
          if (error) {
            console.error(TAG, testName, image.PixelMapFormat.YCBCR_P010, ' createPixelMap error', error, error.code);
            expect(Number(error)).assertEqual(62980096);
            done();
          } else {
            expect().assertFail();
            await pixelMap?.release();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName, testName, image.PixelMapFormat.YCBCR_P010, ' catch createPixelMap error', error,
          error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_00019
     * @tc.number IMAGE_CREATE_PIXEL_MAP_00019
     * @tc.desc   image createPixelMap the pixelFormat is YCRCB_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_00019', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_00019';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.YCRCB_P010,
            size: { height: 4, width: 6 },
          }
        image.createPixelMap(color, opts, async (error: BusinessError, pixelMap: image.PixelMap) => {
          if (error) {
            console.error(TAG, testName, image.PixelMapFormat.YCRCB_P010, ' createPixelMap error', error, error.code);
            expect(Number(error)).assertEqual(62980096);
            done();
          } else {
            expect().assertFail();
            await pixelMap?.release();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName, testName, image.PixelMapFormat.YCRCB_P010, ' catch createPixelMap error', error,
          error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_00020
     * @tc.number IMAGE_CREATE_PIXEL_MAP_00020
     * @tc.desc   image createPixelMap the pixelFormat is ASTC_4x4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_00020', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_00020';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.ASTC_4x4,
            size: { height: 4, width: 6 },
          }
        image.createPixelMap(color, opts, async (error: BusinessError, pixelMap: image.PixelMap) => {
          if (error) {
            console.error(TAG, testName, image.PixelMapFormat.ASTC_4x4, ' createPixelMap error', error, error.code);
            expect().assertFail();
            done();
          } else {
            let res = await pixelMap.getImageInfo();
            expect(res.pixelFormat == image.PixelMapFormat.ASTC_4x4).assertFalse();
            await pixelMap?.release();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName, testName, image.PixelMapFormat.ASTC_4x4, ' catch createPixelMap error', error,
          error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAPS_00001
     * @tc.number IMAGE_CREATE_PIXEL_MAPS_00001
     * @tc.desc   image createPixelMap the srcPixelFormat emu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAPS_00001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAPS_00001';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const formats = [
        image.PixelMapFormat.UNKNOWN,
        image.PixelMapFormat.ARGB_8888,
        image.PixelMapFormat.RGB_565,
        image.PixelMapFormat.RGBA_8888,
        image.PixelMapFormat.BGRA_8888,
        image.PixelMapFormat.RGB_888,
        image.PixelMapFormat.ALPHA_8,
        image.PixelMapFormat.RGBA_F16,
        image.PixelMapFormat.NV21,
        image.PixelMapFormat.NV12,
        image.PixelMapFormat.RGBA_1010102,
        image.PixelMapFormat.YCRCB_P010,
        image.PixelMapFormat.ASTC_4x4
      ];
      for (const format of formats) {
        try {
          let opts: image.InitializationOptions =
            {
              editable: true,
              srcPixelFormat: format,
              size: { height: 4, width: 6 }
            }
          pixelMap = await image.createPixelMap(color, opts);
          expect(isEmpty(pixelMap)).assertFalse();
          console.info(TAG, testName, format, ' createPixelMap success');
        } catch (error) {
          console.error(TAG, testName, testName, format, ' createPixelMap error', error);
          expect().assertFail();
        } finally {
          await pixelMap?.release();
        }
      }
      done();
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAPS_00002
     * @tc.number IMAGE_CREATE_PIXEL_MAPS_00002
     * @tc.desc   image createPixelMap the pixelFormat emu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAPS_00002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAPS_00002';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const formats = [image.PixelMapFormat.NV21, image.PixelMapFormat.NV12];
      for (const format of formats) {
        try {
          let opts: image.InitializationOptions =
            {
              editable: true,
              pixelFormat: format,
              size: { height: 4, width: 6 },
            }
          pixelMap = await image.createPixelMap(color, opts);
          let res = await pixelMap.getImageInfo();
          expect(res.pixelFormat == format).assertTrue();
          console.info(TAG, testName, format, ' createPixelMap success');
        } catch (error) {
          console.error(TAG, testName, testName, format, ' createPixelMap error', error);
          expect().assertFail();
        } finally {
          await pixelMap?.release();
        }
      }
      done();
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAPS_00003
     * @tc.number IMAGE_CREATE_PIXEL_MAPS_00003
     * @tc.desc   image createPixelMap the alphaType emu the isEditable is false the scaleMode is FIT_TARGET_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAPS_00003', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAPS_00003';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const formats = [
        image.AlphaType.OPAQUE,
        image.AlphaType.PREMUL,
        image.AlphaType.UNPREMUL,
      ];
      for (const format of formats) {
        try {
          let opts: image.InitializationOptions =
            {
              editable: false,
              alphaType: format,
              size: { height: 4, width: 6 },
              scaleMode: image.ScaleMode.FIT_TARGET_SIZE
            }
          pixelMap = await image.createPixelMap(color, opts);
          let res = await pixelMap.getImageInfo();
          expect(isEmpty(pixelMap)).assertFalse();
          expect(res.alphaType == format).assertTrue();
          expect(pixelMap.isEditable).assertFalse();
          console.info(TAG, testName, format, ' createPixelMap success');
        } catch (error) {
          console.error(TAG, testName, testName, format, ' createPixelMap error', error);
          expect().assertFail();
        } finally {
          await pixelMap?.release();
        }
      }
      done();
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAPS_00004
     * @tc.number IMAGE_CREATE_PIXEL_MAPS_00004
     * @tc.desc   image createPixelMap the srcPixelFormat emu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAPS_00004', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAPS_00004';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.YCBCR_P010,
            size: { height: 4, width: 6 }
          }
        pixelMap = await image.createPixelMap(color, opts);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, image.PixelMapFormat.YCBCR_P010, ' createPixelMap error', error);
        expect(Number(error)).assertEqual(62980096);
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAPS_00005
     * @tc.number IMAGE_CREATE_PIXEL_MAPS_00005
     * @tc.desc   image createPixelMap the pixelFormat emu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAPS_00005', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAPS_00005';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            size: { height: 4, width: 6 }
          }
        pixelMap = await image.createPixelMap(color, opts);
      } catch (error) {
        console.error(TAG, testName, image.PixelMapFormat.YCBCR_P010, ' createPixelMap error', error);
        expect(Number(error)).assertEqual(62980096);
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAPS_00006
     * @tc.number IMAGE_CREATE_PIXEL_MAPS_00006
     * @tc.desc   image createPixelMap the pixelFormat emu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAPS_00006', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAPS_00006';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            pixelFormat: image.PixelMapFormat.YCBCR_P010,
            size: { height: 4, width: 6 }
          }
        pixelMap = await image.createPixelMap(color, opts);
      } catch (error) {
        console.error(TAG, testName, image.PixelMapFormat.YCBCR_P010, ' createPixelMap error', error);
        expect(Number(error)).assertEqual(62980096);
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAPS_00007
     * @tc.number IMAGE_CREATE_PIXEL_MAPS_00007
     * @tc.desc   image createPixelMap the pixelFormat emu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAPS_00007', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAPS_00007';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            pixelFormat: image.PixelMapFormat.YCRCB_P010,
            size: { height: 4, width: 6 }
          }
        pixelMap = await image.createPixelMap(color, opts);
      } catch (error) {
        console.error(TAG, testName, image.PixelMapFormat.YCBCR_P010, ' createPixelMap error', error);
        expect(Number(error)).assertEqual(62980096);
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAPS_00008
     * @tc.number IMAGE_CREATE_PIXEL_MAPS_00008
     * @tc.desc   image createPixelMap the pixelFormat emu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAPS_00008', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAPS_00008';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            pixelFormat: image.PixelMapFormat.ASTC_4x4,
            size: { height: 4, width: 6 }
          }
        pixelMap = await image.createPixelMap(color, opts);
        expect(isEmpty(pixelMap)).assertFalse();
        console.info(TAG, testName, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, image.PixelMapFormat.ASTC_4x4, ' createPixelMap error', error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAPS_00009
     * @tc.number IMAGE_CREATE_PIXEL_MAPS_00009
     * @tc.desc   image createPixelMap the first parameter is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAPS_00009', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAPS_00009';
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            pixelFormat: image.PixelMapFormat.ARGB_8888,
            size: { height: 4, width: 6 }
          }
        pixelMap = await image.createPixelMap(null as ESObject as ArrayBuffer, opts);
        expect(isEmpty(pixelMap)).assertTrue();
        console.info(TAG, testName, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, image.PixelMapFormat.ASTC_4x4, ' createPixelMap error', error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAPS_000010
     * @tc.number IMAGE_CREATE_PIXEL_MAPS_000010
     * @tc.desc   image createPixelMap the first parameter is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAPS_000010', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAPS_000010';
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            pixelFormat: image.PixelMapFormat.ARGB_8888,
            size: { height: 4, width: 6 }
          }
        pixelMap = await image.createPixelMap(undefined as ESObject as ArrayBuffer, opts);
        expect(isEmpty(pixelMap)).assertTrue();
        console.info(TAG, testName, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, image.PixelMapFormat.ASTC_4x4, ' createPixelMap error', error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAPS_000011
     * @tc.number IMAGE_CREATE_PIXEL_MAPS_000011
     * @tc.desc   image createPixelMap the second parameter is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAPS_000011', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAPS_000011';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        pixelMap = await image.createPixelMap(color, null as ESObject as image.InitializationOptions);
        expect(isEmpty(pixelMap)).assertTrue();
        console.info(TAG, testName, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, image.PixelMapFormat.ASTC_4x4, ' createPixelMap error', error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_000012
     * @tc.number IMAGE_CREATE_PIXEL_MAP_000012
     * @tc.desc   image createPixelMap the second parameter is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_000012', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_000012';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        pixelMap = await image.createPixelMap(color, undefined as ESObject as image.InitializationOptions);
        expect(isEmpty(pixelMap)).assertTrue();
        console.info(TAG, testName, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, image.PixelMapFormat.ASTC_4x4, ' createPixelMap error', error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_SYNC_00001
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_00001
     * @tc.desc   image createPixelMapSyncSync the srcPixelFormat emu the editable is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_SYNC_00001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_SYNC_00001';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const formats = [
        image.PixelMapFormat.UNKNOWN,
        image.PixelMapFormat.ARGB_8888,
        image.PixelMapFormat.RGB_565,
        image.PixelMapFormat.RGBA_8888,
        image.PixelMapFormat.BGRA_8888,
        image.PixelMapFormat.RGB_888,
        image.PixelMapFormat.ALPHA_8,
        image.PixelMapFormat.RGBA_F16,
        image.PixelMapFormat.NV21,
        image.PixelMapFormat.NV12,
        image.PixelMapFormat.RGBA_1010102,
        image.PixelMapFormat.YCRCB_P010,
        image.PixelMapFormat.ASTC_4x4
      ];
      for (const format of formats) {
        try {
          let opts: image.InitializationOptions =
            {
              editable: true,
              srcPixelFormat: format,
              size: { height: 4, width: 6 }
            }
          pixelMap = image.createPixelMapSync(color, opts);
          expect(isEmpty(pixelMap)).assertFalse();
          expect(pixelMap.isEditable).assertTrue();
          console.info(TAG, testName, format, ' createPixelMap success');
        } catch (error) {
          console.error(TAG, testName, testName, format, ' createPixelMap error', error);
          expect().assertFail();
        } finally {
          await pixelMap?.release();
        }
      }
      done();
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_SYNC_00002
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_00002
     * @tc.desc   image createPixelMapSync the pixelFormat emu the scaleMode is FIT_TARGET_SIZE the pixelFormat is ARGB_8888 the editable is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_SYNC_00002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_SYNC_00002';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: false,
            pixelFormat: image.PixelMapFormat.ARGB_8888,
            size: { height: 4, width: 6 },
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          }
        pixelMap = image.createPixelMapSync(color, opts);
        let res = await pixelMap.getImageInfo();
        expect(res.pixelFormat == image.PixelMapFormat.ARGB_8888).assertTrue();
        expect(pixelMap.isEditable).assertFalse();
        console.info(TAG, testName, image.PixelMapFormat.ARGB_8888, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, testName, image.PixelMapFormat.ARGB_8888, ' createPixelMap error', error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_SYNC_00003
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_00003
     * @tc.desc   image createPixelMapSync the first parameter is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_SYNC_00003', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_SYNC_00003';
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            size: { height: 4, width: 6 }
          }
        pixelMap = image.createPixelMapSync(null, opts);
        expect(isEmpty(pixelMap)).assertTrue();
        console.info(TAG, testName, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, testName, ' createPixelMap error', error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_SYNC_00004
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_00004
     * @tc.desc   image createPixelMapSync the first parameter is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_SYNC_00004', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_SYNC_00004';
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            size: { height: 4, width: 6 }
          }
        pixelMap = image.createPixelMapSync(undefined, opts);
        expect(isEmpty(pixelMap)).assertTrue();
        console.info(TAG, testName, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, testName, ' createPixelMap error', error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_SYNC_00005
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_00005
     * @tc.desc   image createPixelMapSync the the second parameter is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_SYNC_00005', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_SYNC_00005';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        pixelMap = image.createPixelMapSync(color, null);
        expect(isEmpty(pixelMap)).assertTrue();
        console.info(TAG, testName, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, testName, ' createPixelMap error', error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_SYNC_00006
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_00006
     * @tc.desc   image createPixelMapSync the the second parameter is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_SYNC_00006', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_SYNC_00006';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        pixelMap = image.createPixelMapSync(color, undefined);
        expect(isEmpty(pixelMap)).assertTrue();
        console.info(TAG, testName, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, testName, ' createPixelMap error', error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_SYNC_00007
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_00007
     * @tc.desc   image createPixelMapSync the pixelFormat emu the pixelFormat is RGBA_1010102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_SYNC_00007', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_SYNC_00007';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            size: { height: 4, width: 6 },
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          }
        pixelMap = image.createPixelMapSync(color, opts);
        expect(isEmpty(pixelMap)).assertTrue();
        console.info(TAG, testName, image.PixelMapFormat.RGBA_1010102, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, testName, image.PixelMapFormat.RGBA_1010102, ' createPixelMap error',
          error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_SYNC_00008
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_00008
     * @tc.desc   image createPixelMapSync the pixelFormat emu the pixelFormat is YCBCR_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_SYNC_00008', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_SYNC_00008';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            pixelFormat: image.PixelMapFormat.YCBCR_P010,
            size: { height: 4, width: 6 },
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          }
        pixelMap = image.createPixelMapSync(color, opts);
        expect(isEmpty(pixelMap)).assertTrue();
        console.info(TAG, testName, image.PixelMapFormat.YCBCR_P010, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, testName, image.PixelMapFormat.YCBCR_P010, ' createPixelMap error',
          error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_SYNC_00009
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_00009
     * @tc.desc   image createPixelMapSync the pixelFormat emu the pixelFormat is YCRCB_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_SYNC_00009', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_SYNC_00009';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            pixelFormat: image.PixelMapFormat.YCRCB_P010,
            size: { height: 4, width: 6 },
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          }
        pixelMap = image.createPixelMapSync(color, opts);
        expect(isEmpty(pixelMap)).assertTrue();
        console.info(TAG, testName, image.PixelMapFormat.YCRCB_P010, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, testName, image.PixelMapFormat.YCRCB_P010, ' createPixelMap error',
          error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_SYNC_000010
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_000010
     * @tc.desc   image createPixelMapSync the pixelFormat emu the pixelFormat is ASTC_4x4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_SYNC_000010', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_SYNC_000010';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            pixelFormat: image.PixelMapFormat.ASTC_4x4,
            size: { height: 4, width: 6 },
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          }
        pixelMap = image.createPixelMapSync(color, opts);
        expect(isEmpty(pixelMap)).assertFalse();
        let res = await pixelMap.getImageInfo();
        expect(res.pixelFormat == image.PixelMapFormat.ASTC_4x4).assertFalse();
        console.info(TAG, testName, image.PixelMapFormat.ASTC_4x4, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, testName, image.PixelMapFormat.ASTC_4x4, ' createPixelMap error', error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_SYNC_ONE_00001
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_ONE_00001
     * @tc.desc   image createPixelMapSyncSync the srcPixelFormat emu the AlphaType is OPAQUE the scaleMode is CENTER_CROP the editable is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_SYNC_ONE_00001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_SYNC_ONE_00001';
      const formats = [
        image.PixelMapFormat.UNKNOWN,
        image.PixelMapFormat.ARGB_8888,
        image.PixelMapFormat.RGB_565,
        image.PixelMapFormat.RGBA_8888,
        image.PixelMapFormat.BGRA_8888,
        image.PixelMapFormat.RGB_888,
        image.PixelMapFormat.ALPHA_8,
        image.PixelMapFormat.RGBA_F16,
        image.PixelMapFormat.NV21,
        image.PixelMapFormat.NV12,
        image.PixelMapFormat.RGBA_1010102,
        image.PixelMapFormat.YCRCB_P010,
        image.PixelMapFormat.ASTC_4x4
      ];
      for (const format of formats) {
        try {
          let opts: image.InitializationOptions =
            {
              editable: true,
              srcPixelFormat: format,
              size: { height: 4, width: 6 },
              alphaType: image.AlphaType.OPAQUE,
              scaleMode: image.ScaleMode.CENTER_CROP,
            }
          pixelMap = await image.createPixelMapSync(opts);
          expect(isEmpty(pixelMap)).assertFalse();
          expect(pixelMap.isEditable).assertTrue();
          console.info(TAG, testName, format, ' createPixelMap success');
        } catch (error) {
          console.error(TAG, testName, testName, format, ' createPixelMap error', error);
          expect().assertFail();
        } finally {
          await pixelMap?.release();
        }
      }
      done();
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_SYNC_ONE_00002
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_ONE_00002
     * @tc.desc   image createPixelMapSync the pixelFormat emu the scaleMode is FIT_TARGET_SIZE the pixelFormat is ARGB_8888 the editable is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_SYNC_ONE_00002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_SYNC_ONE_00002';
      const formats = [
        image.PixelMapFormat.ARGB_8888,
        image.PixelMapFormat.NV21,
        image.PixelMapFormat.NV12,
        image.PixelMapFormat.RGBA_1010102,
        image.PixelMapFormat.YCBCR_P010,
        image.PixelMapFormat.YCRCB_P010,
      ];
      for (const format of formats) {
        try {
          let opts: image.InitializationOptions =
            {
              editable: false,
              pixelFormat: format,
              size: { height: 4, width: 6 },
              scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
            }
          pixelMap = await image.createPixelMapSync(opts);
          let res = await pixelMap.getImageInfo();
          expect(res.pixelFormat == format).assertTrue();
          expect(pixelMap.isEditable).assertFalse();
          console.info(TAG, testName, format, ' createPixelMap success');
        } catch (error) {
          console.error(TAG, testName, testName, format, ' createPixelMap error', error);
          expect().assertFail();
        } finally {
          await pixelMap?.release();
        }
      }
      done();
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_SYNC_ONE_00003
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_ONE_00003
     * @tc.desc   image createPixelMapSync the first parameter is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_SYNC_ONE_00003', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_SYNC_ONE_00003';
      try {
        pixelMap = await image.createPixelMapSync(null);
        expect(isEmpty(pixelMap)).assertTrue();
        console.info(TAG, testName, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, testName, ' createPixelMap error', error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_SYNC_ONE_00004
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_ONE_00004
     * @tc.desc   image createPixelMapSync the first parameter is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_SYNC_ONE_00004', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_SYNC_ONE_00004';
      try {
        pixelMap = await image.createPixelMapSync(undefined);
        expect(isEmpty(pixelMap)).assertTrue();
        console.info(TAG, testName, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, testName, ' createPixelMap error', error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_SYNC_ONE_00005
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_ONE_00005
     * @tc.desc   image createPixelMapSync the pixelFormat emu the pixelFormat is ASTC_4x4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_SYNC_ONE_00005', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_SYNC_ONE_00005';
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            pixelFormat: image.PixelMapFormat.ASTC_4x4,
            size: { height: 4, width: 6 },
          }
        pixelMap = await image.createPixelMapSync(opts);
        expect(isEmpty(pixelMap)).assertFalse();
        let res = await pixelMap.getImageInfo();
        expect(res.pixelFormat == image.PixelMapFormat.ASTC_4x4).assertFalse();
        console.info(TAG, testName, image.PixelMapFormat.NV21, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, testName, image.PixelMapFormat.ASTC_4x4, ' createPixelMap error', error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_SYNC_ONE_00006
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_ONE_00006
     * @tc.desc   image createPixelMapSync the pixelFormat emu the AlphaType is UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_SYNC_ONE_00006', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_SYNC_ONE_00006';
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            pixelFormat: image.PixelMapFormat.ARGB_8888,
            size: { height: 4, width: 6 },
            alphaType: image.AlphaType.UNKNOWN
          }
        pixelMap = await image.createPixelMapSync(opts);
        let res = await pixelMap.getImageInfo();
        expect(isEmpty(pixelMap)).assertFalse();
        expect(res.alphaType == image.AlphaType.PREMUL).assertTrue();
        console.info(TAG, testName, image.AlphaType.UNKNOWN, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, image.AlphaType.UNKNOWN, ' createPixelMap error', error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00001
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00001
     * @tc.desc   image createPixelMapUsingAllocatorSync the srcPixelFormat is UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_AUTO_00001';
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.UNKNOWN,
            size: { height: 4, width: 6 }
          }
        pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        expect().assertFalse();
      } catch (error) {
        console.error(TAG, testName, ' createPixelMapUsingAllocatorSync error', error.message, error.code);
        expect(Number(error.code)).assertEqual(7600201);
      } finally {
        await pixelMap?.release();
        done();
      }
    });
  })
}
