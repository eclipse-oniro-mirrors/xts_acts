/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, it, expect, TestType, Level, Size } from "@ohos/hypium"
import { BusinessError } from '@ohos.base';
import image from '@ohos.multimedia.image';
import rpc from '@ohos.rpc';

const LOG_PREFIX: string = "[www data GraphicImageCreatePixelMap03]";

export default function GraphicImageCreatePixelMap03() {
  describe('GraphicImageCreatePixelMap03', ()=> {
    console.log('describe GraphicImageCreatePixelMap03 start!!!')
    beforeAll(async ()=> {
    })

    /**
     * @tc.name    createUnpremultipliedPixelMap001
     * @tc.number  CreateUnpremultipliedPixelMapTest_001
     * @tc.desc    createUnpremultipliedPixelMap with src editable true, dst editable true (Promise) test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createUnpremultipliedPixelMap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          // Create source pixel map with isEditable: true
          const srcOpts: image.InitializationOptions = {
            size: { width: 4, height: 6 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            editable: true,
            alphaType: image.AlphaType.PREMUL
          };
          const colorBuffer = new ArrayBuffer(4 * 6 * 4);
          const srcPixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, srcOpts, image.AllocatorType.DMA);

          // Create destination pixel map with isEditable: true
          const dstOpts: image.InitializationOptions = {
            size: { width: 4, height: 6 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            editable: true,
            alphaType: image.AlphaType.UNPREMUL
          };
          const dstColorBuffer = new ArrayBuffer(4 * 6 * 4);
          const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstColorBuffer, dstOpts, image.AllocatorType.DMA);

          console.info(`${LOG_PREFIX} srcPixelMap isEditable: ${srcPixelMap.isEditable}`);
          console.info(`${LOG_PREFIX} dstPixelMap isEditable: ${dstPixelMap.isEditable}`);
          console.info(`${LOG_PREFIX} srcPixelMap isStrideAlignment: ${srcPixelMap.isStrideAlignment}`);
          console.info(`${LOG_PREFIX} dstPixelMap isStrideAlignment: ${dstPixelMap.isStrideAlignment}`);

          expect(srcPixelMap.isEditable).assertTrue();
          expect(dstPixelMap.isEditable).assertTrue();
          expect(srcPixelMap.isStrideAlignment).assertTrue();
          expect(dstPixelMap.isStrideAlignment).assertTrue();

          // Test createUnpremultipliedPixelMap with Promise
          await image.createUnpremultipliedPixelMap(srcPixelMap, dstPixelMap);
          await srcPixelMap.release();
          await dstPixelMap.release();

          console.info(`${LOG_PREFIX} createUnpremultipliedPixelMap001 success`);
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.error(`${LOG_PREFIX} createUnpremultipliedPixelMap001 error: ${error}, code: ${err.code}`);
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name    createUnpremultipliedPixelMap002
     * @tc.number  CreateUnpremultipliedPixelMapTest_002
     * @tc.desc    createUnpremultipliedPixelMap with src editable false, dst editable false (Promise) test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createUnpremultipliedPixelMap002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          // Create source pixel map with isEditable: false
          const srcOpts: image.InitializationOptions = {
            size: { width: 4, height: 6 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            editable: false,
            alphaType: image.AlphaType.PREMUL
          };
          const colorBuffer = new ArrayBuffer(4 * 6 * 4);
          const srcPixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, srcOpts);

          // Create destination pixel map with isEditable: false
          const dstOpts: image.InitializationOptions = {
            size: { width: 4, height: 6 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            editable: false,
            alphaType: image.AlphaType.UNPREMUL
          };
          const dstColorBuffer = new ArrayBuffer(4 * 6 * 4);
          const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstColorBuffer, dstOpts);

          console.info(`${LOG_PREFIX} srcPixelMap isEditable: ${srcPixelMap.isEditable}`);
          console.info(`${LOG_PREFIX} dstPixelMap isEditable: ${dstPixelMap.isEditable}`);

          expect(srcPixelMap.isEditable).assertFalse();
          expect(dstPixelMap.isEditable).assertFalse();
          expect(srcPixelMap.isStrideAlignment).assertFalse();
          expect(dstPixelMap.isStrideAlignment).assertFalse();

          // Test createUnpremultipliedPixelMap with Promise
          await image.createUnpremultipliedPixelMap(srcPixelMap, dstPixelMap);

          expect(false).assertTrue();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.error(`${LOG_PREFIX} createUnpremultipliedPixelMap002 error: ${error}, code: ${err.code}`);
          expect(error).assertEqual(62980248); // Pixelmap not allow modify
          done();
        }
      });

    /**
     * @tc.name    createUnpremultipliedPixelMap003
     * @tc.number  CreateUnpremultipliedPixelMapTest_003
     * @tc.desc    createUnpremultipliedPixelMap with src editable true, dst editable false (Promise) test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createUnpremultipliedPixelMap003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        // Create source pixel map with isEditable: true
        const srcOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.PREMUL
        };
        const colorBuffer = new ArrayBuffer(4 * 6 * 4);
        const srcPixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, srcOpts);
        
        // Create destination pixel map with isEditable: false
        const dstOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: false,
          alphaType: image.AlphaType.UNPREMUL
        };
        const dstColorBuffer = new ArrayBuffer(4 * 6 * 4);
        const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstColorBuffer, dstOpts);
        
        console.info(`${LOG_PREFIX} srcPixelMap isEditable: ${srcPixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} dstPixelMap isEditable: ${dstPixelMap.isEditable}`);
        
        expect(srcPixelMap.isEditable).assertEqual(true);
        expect(dstPixelMap.isEditable).assertEqual(false);
        
        // Test createUnpremultipliedPixelMap with Promise
        await image.createUnpremultipliedPixelMap(srcPixelMap, dstPixelMap);
        
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createUnpremultipliedPixelMap003 error: ${error}, code: ${err.code}`);
        expect(error).assertEqual(62980248); // Pixelmap not allow modify
        done();
      }
    });

    /**
     * @tc.name    createUnpremultipliedPixelMap004
     * @tc.number  CreateUnpremultipliedPixelMapTest_004
     * @tc.desc    createUnpremultipliedPixelMap with src editable false, dst editable true (Promise) test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createUnpremultipliedPixelMap004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        // Create source pixel map with isEditable: false
        const srcOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: false,
          alphaType: image.AlphaType.PREMUL
        };
        const colorBuffer = new ArrayBuffer(4 * 6 * 4);
        const srcPixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, srcOpts);
        
        // Create destination pixel map with isEditable: true
        const dstOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL
        };
        const dstColorBuffer = new ArrayBuffer(4 * 6 * 4);
        const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstColorBuffer, dstOpts);
        
        console.info(`${LOG_PREFIX} srcPixelMap isEditable: ${srcPixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} dstPixelMap isEditable: ${dstPixelMap.isEditable}`);
        
        expect(srcPixelMap.isEditable).assertEqual(false);
        expect(dstPixelMap.isEditable).assertEqual(true);
        
        // Test createUnpremultipliedPixelMap with Promise
        await image.createUnpremultipliedPixelMap(srcPixelMap, dstPixelMap);
        
        // expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createUnpremultipliedPixelMap004 error: ${error}, code: ${err.code}`);
        expect(error).assertEqual(62980248); // Pixelmap not allow modify
        done();
      }
    });

    /**
     * @tc.name    createUnpremultipliedPixelMap005
     * @tc.number  CreateUnpremultipliedPixelMapTest_005
     * @tc.desc    createUnpremultipliedPixelMap with src isStrideAlignment true
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createUnpremultipliedPixelMap005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        // Create source pixel map
        const srcOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.PREMUL
        };
        const colorBuffer = new ArrayBuffer(4 * 6 * 4);
        const srcPixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, srcOpts);
        
        // Create destination pixel map
        const dstOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL
        };
        const dstColorBuffer = new ArrayBuffer(4 * 6 * 4);
        const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstColorBuffer, dstOpts);
        
        console.info(`${LOG_PREFIX} srcPixelMap isStrideAlignment: ${srcPixelMap.isStrideAlignment}`);
        console.info(`${LOG_PREFIX} dstPixelMap isStrideAlignment: ${dstPixelMap.isStrideAlignment}`);
        
        // Verify isStrideAlignment property
        expect(srcPixelMap.isStrideAlignment !== undefined).assertTrue();
        expect(dstPixelMap.isStrideAlignment !== undefined).assertTrue();
        
        // Test createUnpremultipliedPixelMap with Promise
        await image.createUnpremultipliedPixelMap(srcPixelMap, dstPixelMap);
        await srcPixelMap.release();
        await dstPixelMap.release();
        
        console.info(`${LOG_PREFIX} createUnpremultipliedPixelMap005 success`);
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createUnpremultipliedPixelMap005 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createUnpremultipliedPixelMap006
     * @tc.number  CreateUnpremultipliedPixelMapTest_006
     * @tc.desc    createUnpremultipliedPixelMap with src isStrideAlignment false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createUnpremultipliedPixelMap006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        // Create source pixel map with format that might result in isStrideAlignment: false
        const srcOpts: image.InitializationOptions = {
          size: { width: 5, height: 7 }, // Non-standard dimensions might affect stride alignment
          srcPixelFormat: image.PixelMapFormat.RGB_565,
          pixelFormat: image.PixelMapFormat.RGB_565,
          editable: true,
          alphaType: image.AlphaType.OPAQUE
        };
        const colorBuffer = new ArrayBuffer(5 * 7 * 2); // RGB_565 uses 2 bytes per pixel
        const srcPixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, srcOpts);
        
        // Create destination pixel map with format that might result in isStrideAlignment: false
        const dstOpts: image.InitializationOptions = {
          size: { width: 5, height: 7 }, // Non-standard dimensions might affect stride alignment
          srcPixelFormat: image.PixelMapFormat.RGB_565,
          pixelFormat: image.PixelMapFormat.RGB_565,
          editable: true,
          alphaType: image.AlphaType.OPAQUE
        };
        const dstColorBuffer = new ArrayBuffer(5 * 7 * 2); // RGB_565 uses 2 bytes per pixel
        const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstColorBuffer, dstOpts);
        
        console.info(`${LOG_PREFIX} srcPixelMap isStrideAlignment: ${srcPixelMap.isStrideAlignment}`);
        console.info(`${LOG_PREFIX} dstPixelMap isStrideAlignment: ${dstPixelMap.isStrideAlignment}`);
        
        // Verify isStrideAlignment property
        expect(srcPixelMap.isStrideAlignment !== undefined).assertTrue();
        expect(dstPixelMap.isStrideAlignment !== undefined).assertTrue();
        
        // Test createUnpremultipliedPixelMap with Promise
        await image.createUnpremultipliedPixelMap(srcPixelMap, dstPixelMap);
        
        console.info(`${LOG_PREFIX} createUnpremultipliedPixelMap006 success`);
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createUnpremultipliedPixelMap006 error: ${error}, code: ${err.code}`);
        expect(error).assertEqual(401); // Parameter error
        done();
      }
    });

    /**
     * @tc.name    createUnpremultipliedPixelMap007
     * @tc.number  CreateUnpremultipliedPixelMapTest_007
     * @tc.desc    createUnpremultipliedPixelMap with src null (Promise) test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createUnpremultipliedPixelMap007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      try {
        // Create destination pixel map
        const dstOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL
        };
        const dstColorBuffer = new ArrayBuffer(4 * 6 * 4);
        const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstColorBuffer, dstOpts);
        
        // Test createUnpremultipliedPixelMap with null src
        await image.createUnpremultipliedPixelMap(null, dstPixelMap);
        await dstPixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createUnpremultipliedPixelMap007 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue(); // Parameter error
        done();
      }
    });

    /**
     * @tc.name    createUnpremultipliedPixelMap008
     * @tc.number  CreateUnpremultipliedPixelMapTest_008
     * @tc.desc    createUnpremultipliedPixelMap with src undefined (Promise) test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createUnpremultipliedPixelMap008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      try {
        // Create destination pixel map
        const dstOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL
        };
        const dstColorBuffer = new ArrayBuffer(4 * 6 * 4);
        const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstColorBuffer, dstOpts);
        
        // Test createUnpremultipliedPixelMap with undefined src
        await image.createUnpremultipliedPixelMap(undefined, dstPixelMap);
        await dstPixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createUnpremultipliedPixelMap008 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue(); // Parameter error
        done();
      }
    });

    /**
     * @tc.name    createUnpremultipliedPixelMap009
     * @tc.number  CreateUnpremultipliedPixelMapTest_009
     * @tc.desc    createUnpremultipliedPixelMap with dst null (Promise) test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createUnpremultipliedPixelMap009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      try {
        // Create source pixel map
        const srcOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.PREMUL
        };
        const colorBuffer = new ArrayBuffer(4 * 6 * 4);
        const srcPixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, srcOpts);
        
        // Test createUnpremultipliedPixelMap with null dst
        await image.createUnpremultipliedPixelMap(srcPixelMap, null);
        await srcPixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createUnpremultipliedPixelMap009 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue(); // Parameter error
        done();
      }
    });

    /**
     * @tc.name    createUnpremultipliedPixelMap010
     * @tc.number  CreateUnpremultipliedPixelMapTest_010
     * @tc.desc    createUnpremultipliedPixelMap with dst undefined (Promise) test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createUnpremultipliedPixelMap010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      try {
        // Create source pixel map
        const srcOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.PREMUL
        };
        const colorBuffer = new ArrayBuffer(4 * 6 * 4);
        const srcPixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, srcOpts);
        
        // Test createUnpremultipliedPixelMap with undefined dst
        await image.createUnpremultipliedPixelMap(srcPixelMap, undefined);
        await srcPixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createUnpremultipliedPixelMap010 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue(); // Parameter error
        done();
      }
    });

    /**
     * @tc.name    createUnpremultipliedPixelMap011
     * @tc.number  CreateUnpremultipliedPixelMapTest_011
     * @tc.desc    createUnpremultipliedPixelMap with src editable true, dst editable true (AsyncCallback) test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createUnpremultipliedPixelMap011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        // Create source pixel map with isEditable: true
        const srcOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.PREMUL
        };
        const colorBuffer = new ArrayBuffer(4 * 6 * 4);
        const srcPixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, srcOpts, image.AllocatorType.DMA);

        // Create destination pixel map with isEditable: true
        const dstOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL
        };
        const dstColorBuffer = new ArrayBuffer(4 * 6 * 4);
        const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstColorBuffer, dstOpts, image.AllocatorType.DMA);

        console.info(`${LOG_PREFIX} srcPixelMap isEditable: ${srcPixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} dstPixelMap isEditable: ${dstPixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} srcPixelMap isStrideAlignment: ${srcPixelMap.isStrideAlignment}`);
        console.info(`${LOG_PREFIX} dstPixelMap isStrideAlignment: ${dstPixelMap.isStrideAlignment}`);

        expect(srcPixelMap.isEditable).assertTrue();
        expect(dstPixelMap.isEditable).assertTrue();
        expect(srcPixelMap.isStrideAlignment).assertTrue();
        expect(dstPixelMap.isStrideAlignment).assertTrue();

        // Test createUnpremultipliedPixelMap with AsyncCallback
        image.createUnpremultipliedPixelMap(srcPixelMap, dstPixelMap, (err) => {
          if (err) {
            console.error(`${LOG_PREFIX} createUnpremultipliedPixelMap011 error: ${err}, code: ${err.code}`);
            expect(false).assertTrue();
          } else {
            console.info(`${LOG_PREFIX} createUnpremultipliedPixelMap011 success`);
            srcPixelMap.release();
            dstPixelMap.release();
            done();
          }
        });
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createUnpremultipliedPixelMap011 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createUnpremultipliedPixelMap012
     * @tc.number  CreateUnpremultipliedPixelMapTest_012
     * @tc.desc    createUnpremultipliedPixelMap with src editable false, dst editable false (AsyncCallback) test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createUnpremultipliedPixelMap012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        // Create source pixel map with isEditable: false
        const srcOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: false,
          alphaType: image.AlphaType.PREMUL
        };
        const colorBuffer = new ArrayBuffer(4 * 6 * 4);
        const srcPixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, srcOpts);

        // Create destination pixel map with isEditable: false
        const dstOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: false,
          alphaType: image.AlphaType.UNPREMUL
        };
        const dstColorBuffer = new ArrayBuffer(4 * 6 * 4);
        const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstColorBuffer, dstOpts);

        console.info(`${LOG_PREFIX} srcPixelMap isEditable: ${srcPixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} dstPixelMap isEditable: ${dstPixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} srcPixelMap isStrideAlignment: ${srcPixelMap.isStrideAlignment}`);
        console.info(`${LOG_PREFIX} dstPixelMap isStrideAlignment: ${dstPixelMap.isStrideAlignment}`);

        expect(srcPixelMap.isEditable).assertFalse();
        expect(dstPixelMap.isEditable).assertFalse();
        expect(srcPixelMap.isStrideAlignment).assertFalse();
        expect(dstPixelMap.isStrideAlignment).assertFalse();

        // Test createUnpremultipliedPixelMap with AsyncCallback
        image.createUnpremultipliedPixelMap(srcPixelMap, dstPixelMap, (err) => {
          if (err) {
            console.error(`${LOG_PREFIX} createUnpremultipliedPixelMap012 error: ${err}, code: ${err.code}`);
            expect(err).assertEqual(62980248); // Pixelmap not allow modify
            done();
          } else {
            console.info(`${LOG_PREFIX} createUnpremultipliedPixelMap011 success`);
            srcPixelMap.release();
            dstPixelMap.release();
            done();
          }
        });
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createUnpremultipliedPixelMap012 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createUnpremultipliedPixelMap013
     * @tc.number  CreateUnpremultipliedPixelMapTest_013
     * @tc.desc    createUnpremultipliedPixelMap with src editable true, dst editable false (AsyncCallback) test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createUnpremultipliedPixelMap013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        // Create source pixel map with isEditable: true
        const srcOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.PREMUL
        };
        const colorBuffer = new ArrayBuffer(4 * 6 * 4);
        const srcPixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, srcOpts);
        
        // Create destination pixel map with isEditable: false
        const dstOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: false,
          alphaType: image.AlphaType.UNPREMUL
        };
        const dstColorBuffer = new ArrayBuffer(4 * 6 * 4);
        const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstColorBuffer, dstOpts);
        
        console.info(`${LOG_PREFIX} srcPixelMap isEditable: ${srcPixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} dstPixelMap isEditable: ${dstPixelMap.isEditable}`);
        
        expect(srcPixelMap.isEditable).assertEqual(true);
        expect(dstPixelMap.isEditable).assertEqual(false);
        
        // Test createUnpremultipliedPixelMap with AsyncCallback
        image.createUnpremultipliedPixelMap(srcPixelMap, dstPixelMap, (err) => {
          if (err) {
            console.error(`${LOG_PREFIX} createUnpremultipliedPixelMap013 error: ${err}, code: ${err.code}`);
            expect(err).assertEqual(62980248); // Pixelmap not allow modify
            done();
          } else {
            console.info(`${LOG_PREFIX} createUnpremultipliedPixelMap011 success`);
            srcPixelMap.release();
            dstPixelMap.release();
            done();
          }
        });
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createUnpremultipliedPixelMap013 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createUnpremultipliedPixelMap014
     * @tc.number  CreateUnpremultipliedPixelMapTest_014
     * @tc.desc    createUnpremultipliedPixelMap with src editable false, dst editable true (AsyncCallback) test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createUnpremultipliedPixelMap014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        // Create source pixel map with isEditable: false
        const srcOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: false,
          alphaType: image.AlphaType.PREMUL
        };
        const colorBuffer = new ArrayBuffer(4 * 6 * 4);
        const srcPixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, srcOpts);
        
        // Create destination pixel map with isEditable: true
        const dstOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL
        };
        const dstColorBuffer = new ArrayBuffer(4 * 6 * 4);
        const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstColorBuffer, dstOpts);
        
        console.info(`${LOG_PREFIX} srcPixelMap isEditable: ${srcPixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} dstPixelMap isEditable: ${dstPixelMap.isEditable}`);
        
        expect(srcPixelMap.isEditable).assertEqual(false);
        expect(dstPixelMap.isEditable).assertEqual(true);
        
        // Test createUnpremultipliedPixelMap with AsyncCallback
        image.createUnpremultipliedPixelMap(dstPixelMap, srcPixelMap, (err) => {
          if (err) {
            console.error(`${LOG_PREFIX} createUnpremultipliedPixelMap014 error: ${err}, code: ${err.code}`);
            expect(err).assertEqual(62980248); // Pixelmap not allow modify
            done();
          } else {
            console.info(`${LOG_PREFIX} createUnpremultipliedPixelMap011 success`);
            srcPixelMap.release();
            dstPixelMap.release();
            done();
          }
        });
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createUnpremultipliedPixelMap014 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapSync001
     * @tc.number  PixelMapCreateSyncTest_001
     * @tc.desc    createPixelMapSync with PixelFormat.RGBA_8888 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const opts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.PREMUL,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE
        };

        const pixelMap = image.createPixelMapSync(opts);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapSync001 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapSync002
     * @tc.number  PixelMapCreateSyncTest_002
     * @tc.desc    createPixelMapSync with PixelFormat.ARGB_8888 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapSync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const opts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.ARGB_8888,
          editable: true
        };

        const pixelMap = image.createPixelMapSync(opts);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapSync002 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapSync003
     * @tc.number  PixelMapCreateSyncTest_003
     * @tc.desc    createPixelMapSync with PixelFormat.RGB_565 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapSync003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const opts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGB_565,
          pixelFormat: image.PixelMapFormat.RGB_565,
          editable: true
        };

        const pixelMap = image.createPixelMapSync(opts);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapSync003 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapSync004
     * @tc.number  PixelMapCreateSyncTest_004
     * @tc.desc    createPixelMapSync with PixelFormat.BGRA_8888 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapSync004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const opts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          editable: true
        };

        const pixelMap = image.createPixelMapSync(opts);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapSync004 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapSync005
     * @tc.number  PixelMapCreateSyncTest_005
     * @tc.desc    createPixelMapSync with PixelFormat.RGB_888 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapSync005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const opts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGB_888,
          pixelFormat: image.PixelMapFormat.RGB_888,
          editable: true
        };

        const pixelMap = image.createPixelMapSync(opts);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapSync005 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapSync006
     * @tc.number  PixelMapCreateSyncTest_006
     * @tc.desc    createPixelMapSync with PixelFormat.ALPHA_8 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapSync006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const opts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.ALPHA_8,
          pixelFormat: image.PixelMapFormat.ALPHA_8,
          editable: true
        };

        const pixelMap = image.createPixelMapSync(opts);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapSync006 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapSync007
     * @tc.number  PixelMapCreateSyncTest_007
     * @tc.desc    createPixelMapSync with PixelFormat.RGBA_F16 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapSync007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const opts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_F16,
          pixelFormat: image.PixelMapFormat.RGBA_F16,
          editable: true
        };

        const pixelMap = image.createPixelMapSync(opts);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapSync007 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapSync008
     * @tc.number  PixelMapCreateSyncTest_008
     * @tc.desc    createPixelMapSync with PixelFormat.NV21 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapSync008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const opts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.NV21,
          pixelFormat: image.PixelMapFormat.NV21,
          editable: true
        };

        const pixelMap = image.createPixelMapSync(opts);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapSync008 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapSync009
     * @tc.number  PixelMapCreateSyncTest_009
     * @tc.desc    createPixelMapSync with PixelFormat.NV12 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapSync009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const opts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.NV12,
          pixelFormat: image.PixelMapFormat.NV12,
          editable: true
        };

        const pixelMap = image.createPixelMapSync(opts);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapSync009 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapSync010
     * @tc.number  PixelMapCreateSyncTest_010
     * @tc.desc    createPixelMapSync with PixelFormat.RGBA_1010102 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapSync010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const opts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_1010102,
          pixelFormat: image.PixelMapFormat.RGBA_1010102,
          editable: true
        };

        const pixelMap = image.createPixelMapSync(opts);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapSync010 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapSync011
     * @tc.number  PixelMapCreateSyncTest_011
     * @tc.desc    createPixelMapSync with PixelFormat.YCBCR_P010 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapSync011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const opts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.YCBCR_P010,
          pixelFormat: image.PixelMapFormat.YCBCR_P010,
          editable: true
        };

        const pixelMap = image.createPixelMapSync(opts);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapSync011 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapSync012
     * @tc.number  PixelMapCreateSyncTest_012
     * @tc.desc    createPixelMapSync with PixelFormat.YCRCB_P010 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapSync012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const opts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.YCRCB_P010,
          pixelFormat: image.PixelMapFormat.YCRCB_P010,
          editable: true
        };

        const pixelMap = image.createPixelMapSync(opts);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapSync012 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapSync013
     * @tc.number  PixelMapCreateSyncTest_013
     * @tc.desc    createPixelMapSync with PixelFormat.ASTC_4x4 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapSync013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const opts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.ASTC_4x4,
          pixelFormat: image.PixelMapFormat.ASTC_4x4,
          editable: true
        };

        const pixelMap = image.createPixelMapSync(opts);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapSync013 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapSync014
     * @tc.number  PixelMapCreateSyncTest_014
     * @tc.desc    createPixelMapSync with AlphaType.UNKNOWN test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapSync014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const opts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.UNKNOWN
        };

        const pixelMap = image.createPixelMapSync(opts);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapSync014 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapSync015
     * @tc.number  PixelMapCreateSyncTest_015
     * @tc.desc    createPixelMapSync with AlphaType.OPAQUE test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapSync015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const opts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.OPAQUE
        };

        const pixelMap = image.createPixelMapSync(opts);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapSync015 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapSync016
     * @tc.number  PixelMapCreateSyncTest_016
     * @tc.desc    createPixelMapSync with ScaleMode.CENTER_CROP test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapSync016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const opts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          scaleMode: image.ScaleMode.CENTER_CROP
        };

        const pixelMap = image.createPixelMapSync(opts);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapSync016 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapSync017
     * @tc.number  PixelMapCreateSyncTest_017
     * @tc.desc    createPixelMapSync with editable false test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapSync017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const opts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: false
        };

        const pixelMap = image.createPixelMapSync(opts);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(false);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapSync017 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapSync018
     * @tc.number  PixelMapCreateSyncTest_018
     * @tc.desc    createPixelMapSync with null options test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapSync018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const pixelMap = image.createPixelMapSync(null);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        if (pixelMap) {
          console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
          console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        }
        expect(pixelMap).assertUndefined();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapSync018 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapSync019
     * @tc.number  PixelMapCreateSyncTest_019
     * @tc.desc    createPixelMapSync with undefined options test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapSync019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const pixelMap = image.createPixelMapSync(undefined);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        if (pixelMap) {
          console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
          console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        }
        expect(pixelMap).assertUndefined();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapSync019 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocator001
     * @tc.number  PixelMapCreateUsingAllocatorTest_001
     * @tc.desc    createPixelMapUsingAllocator with AllocatorType.AUTO and RGBA_8888 pixelFormat test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocator001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height * 4;
        const colorBuffer = new ArrayBuffer(bufferSize);

        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.PREMUL,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE
        };

        const pixelMap = await image.createPixelMapUsingAllocator(colorBuffer, opts, image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocator001 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocator002
     * @tc.number  PixelMapCreateUsingAllocatorTest_002
     * @tc.desc    createPixelMapUsingAllocator with AllocatorType.DMA test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocator002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height * 4;
        const colorBuffer = new ArrayBuffer(bufferSize);
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true
        };

        const pixelMap = await image.createPixelMapUsingAllocator(colorBuffer, opts, image.AllocatorType.DMA);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocator002 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocator003
     * @tc.number  PixelMapCreateUsingAllocatorTest_003
     * @tc.desc    createPixelMapUsingAllocator with AllocatorType.SHARE_MEMORY test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocator003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height * 4;
        const colorBuffer = new ArrayBuffer(bufferSize);
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true
        };

        const pixelMap = await image.createPixelMapUsingAllocator(colorBuffer, opts, image.AllocatorType.SHARE_MEMORY);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocator003 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocator004
     * @tc.number  PixelMapCreateUsingAllocatorTest_004
     * @tc.desc    createPixelMapUsingAllocator with PixelFormat.UNKNOWN test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocator004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height * 4;
        const colorBuffer = new ArrayBuffer(bufferSize);
        console.info(`${LOG_PREFIX} pixelMap: 000000`);
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.UNKNOWN,
          pixelFormat: image.PixelMapFormat.UNKNOWN,
          editable: true
        };
        console.info(`${LOG_PREFIX} pixelMap: 11111`);

        const pixelMap = await image.createPixelMapUsingAllocator(colorBuffer, opts, image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        expect().assertFail();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocator004 error: ${error}, code: ${err.code}`);
        expect(Number(error.code) === 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocator005
     * @tc.number  PixelMapCreateUsingAllocatorTest_005
     * @tc.desc    createPixelMapUsingAllocator with PixelFormat.ARGB_8888 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocator005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height * 4;
        const colorBuffer = new ArrayBuffer(bufferSize);
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.ARGB_8888,
          editable: true
        };

        const pixelMap = await image.createPixelMapUsingAllocator(colorBuffer, opts, image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocator005 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocator006
     * @tc.number  PixelMapCreateUsingAllocatorTest_006
     * @tc.desc    createPixelMapUsingAllocator with PixelFormat.RGB_565 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocator006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height * 2;
        const colorBuffer = new ArrayBuffer(bufferSize);
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.RGB_565,
          pixelFormat: image.PixelMapFormat.RGB_565,
          editable: true
        };

        const pixelMap = await image.createPixelMapUsingAllocator(colorBuffer, opts, image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocator006 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocator007
     * @tc.number  PixelMapCreateUsingAllocatorTest_007
     * @tc.desc    createPixelMapUsingAllocator with PixelFormat.BGRA_8888 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocator007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height * 4;
        const colorBuffer = new ArrayBuffer(bufferSize);
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          editable: true
        };

        const pixelMap = await image.createPixelMapUsingAllocator(colorBuffer, opts, image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocator007 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocator008
     * @tc.number  PixelMapCreateUsingAllocatorTest_008
     * @tc.desc    createPixelMapUsingAllocator with PixelFormat.RGB_888 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocator008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height * 3;
        const colorBuffer = new ArrayBuffer(bufferSize);
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.RGB_888,
          pixelFormat: image.PixelMapFormat.RGB_888,
          editable: true
        };

        const pixelMap = await image.createPixelMapUsingAllocator(colorBuffer, opts, image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocator008 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocator009
     * @tc.number  PixelMapCreateUsingAllocatorTest_009
     * @tc.desc    createPixelMapUsingAllocator with PixelFormat.ALPHA_8 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocator009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height;
        const colorBuffer = new ArrayBuffer(bufferSize);
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.ALPHA_8,
          pixelFormat: image.PixelMapFormat.ALPHA_8,
          editable: true
        };

        const pixelMap = await image.createPixelMapUsingAllocator(colorBuffer, opts, image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocator009 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocator010
     * @tc.number  PixelMapCreateUsingAllocatorTest_010
     * @tc.desc    createPixelMapUsingAllocator with PixelFormat.RGBA_F16 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocator010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height * 8;
        const colorBuffer = new ArrayBuffer(bufferSize);
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.RGBA_F16,
          pixelFormat: image.PixelMapFormat.RGBA_F16,
          editable: true
        };

        const pixelMap = await image.createPixelMapUsingAllocator(colorBuffer, opts, image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocator010 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocator011
     * @tc.number  PixelMapCreateUsingAllocatorTest_011
     * @tc.desc    createPixelMapUsingAllocator with PixelFormat.NV21 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocator011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height * 3 / 2;
        const colorBuffer = new ArrayBuffer(bufferSize);
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.NV21,
          pixelFormat: image.PixelMapFormat.NV21,
          editable: true
        };

        const pixelMap = await image.createPixelMapUsingAllocator(colorBuffer, opts, image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocator011 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocator012
     * @tc.number  PixelMapCreateUsingAllocatorTest_012
     * @tc.desc    createPixelMapUsingAllocator with PixelFormat.NV12 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocator012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height * 3 / 2;
        const colorBuffer = new ArrayBuffer(bufferSize);
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.NV12,
          pixelFormat: image.PixelMapFormat.NV12,
          editable: true
        };

        const pixelMap = await image.createPixelMapUsingAllocator(colorBuffer, opts, image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocator012 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocator013
     * @tc.number  PixelMapCreateUsingAllocatorTest_013
     * @tc.desc    createPixelMapUsingAllocator with PixelFormat.RGBA_1010102 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocator013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height * 4;
        const colorBuffer = new ArrayBuffer(bufferSize);
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.RGBA_1010102,
          pixelFormat: image.PixelMapFormat.RGBA_1010102,
          editable: true
        };

        const pixelMap = await image.createPixelMapUsingAllocator(colorBuffer, opts, image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocator013 error: ${error}, code: ${err.code}`);
        expect(Number(error) === 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocator014
     * @tc.number  PixelMapCreateUsingAllocatorTest_014
     * @tc.desc    createPixelMapUsingAllocator with PixelFormat.YCBCR_P010 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocator014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height * 3;
        const colorBuffer = new ArrayBuffer(bufferSize);
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.YCBCR_P010,
          pixelFormat: image.PixelMapFormat.YCBCR_P010,
          editable: true
        };

        const pixelMap = await image.createPixelMapUsingAllocator(colorBuffer, opts, image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocator014 error: ${error}, code: ${err.code}`);
        expect(Number(err.code) === 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocator015
     * @tc.number  PixelMapCreateUsingAllocatorTest_015
     * @tc.desc    createPixelMapUsingAllocator with PixelFormat.YCRCB_P010 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocator015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height * 3;
        const colorBuffer = new ArrayBuffer(bufferSize);
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.YCRCB_P010,
          pixelFormat: image.PixelMapFormat.YCRCB_P010,
          editable: true
        };

        const pixelMap = await image.createPixelMapUsingAllocator(colorBuffer, opts, image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocator015 error: ${error}, code: ${err.code}`);
        expect(Number(err.code) === 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocator016
     * @tc.number  PixelMapCreateUsingAllocatorTest_016
     * @tc.desc    createPixelMapUsingAllocator with PixelFormat.ASTC_4x4 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocator016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height;
        const colorBuffer = new ArrayBuffer(bufferSize);
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.ASTC_4x4,
          pixelFormat: image.PixelMapFormat.ASTC_4x4,
          editable: true
        };

        const pixelMap = await image.createPixelMapUsingAllocator(colorBuffer, opts, image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocator016 error: ${error}, code: ${err.code}`);
        expect(Number(err.code) === 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocator017
     * @tc.number  PixelMapCreateUsingAllocatorTest_017
     * @tc.desc    createPixelMapUsingAllocator with AlphaType.UNKNOWN test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocator017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height * 4;
        const colorBuffer = new ArrayBuffer(bufferSize);
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.UNKNOWN
        };

        const pixelMap = await image.createPixelMapUsingAllocator(colorBuffer, opts, image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocator017 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocator018
     * @tc.number  PixelMapCreateUsingAllocatorTest_018
     * @tc.desc    createPixelMapUsingAllocator with AlphaType.OPAQUE test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocator018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height * 4;
        const colorBuffer = new ArrayBuffer(bufferSize);
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.OPAQUE
        };

        const pixelMap = await image.createPixelMapUsingAllocator(colorBuffer, opts, image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocator018 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocator019
     * @tc.number  PixelMapCreateUsingAllocatorTest_019
     * @tc.desc    createPixelMapUsingAllocator with AlphaType.UNPREMUL test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocator019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height * 4;
        const colorBuffer = new ArrayBuffer(bufferSize);
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL
        };

        const pixelMap = await image.createPixelMapUsingAllocator(colorBuffer, opts, image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocator019 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocator020
     * @tc.number  PixelMapCreateUsingAllocatorTest_020
     * @tc.desc    createPixelMapUsingAllocator with ScaleMode.CENTER_CROP test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocator020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height * 4;
        const colorBuffer = new ArrayBuffer(bufferSize);
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          scaleMode: image.ScaleMode.CENTER_CROP
        };

        const pixelMap = await image.createPixelMapUsingAllocator(colorBuffer, opts, image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(true);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocator020 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocator021
     * @tc.number  PixelMapCreateUsingAllocatorTest_021
     * @tc.desc    createPixelMapUsingAllocator with editable false test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocator021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height * 4;
        const colorBuffer = new ArrayBuffer(bufferSize);
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: false
        };

        const pixelMap = await image.createPixelMapUsingAllocator(colorBuffer, opts, image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertEqual(false);
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        await pixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocator021 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocator022
     * @tc.number  PixelMapCreateUsingAllocatorTest_022
     * @tc.desc    createPixelMapUsingAllocator with null colors buffer test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapUsingAllocator022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const opts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true
        };

        const pixelMap = await image.createPixelMapUsingAllocator(null, opts, image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        if (pixelMap) {
          console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
          console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        }

        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocator022 error: ${error}, code: ${err.code}`);
        expect(Number(err.code) === 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocator023
     * @tc.number  PixelMapCreateUsingAllocatorTest_023
     * @tc.desc    createPixelMapUsingAllocator with undefined colors buffer test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapUsingAllocator023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const opts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true
        };

        const pixelMap = await image.createPixelMapUsingAllocator(undefined, opts, image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        if (pixelMap) {
          console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
          console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        }

        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocator023 error: ${error}, code: ${err.code}`);
        expect(Number(err.code) === 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocator024
     * @tc.number  PixelMapCreateUsingAllocatorTest_024
     * @tc.desc    createPixelMapUsingAllocator with null options test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapUsingAllocator024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height * 4;
        const colorBuffer = new ArrayBuffer(bufferSize);

        const pixelMap = await image.createPixelMapUsingAllocator(colorBuffer, null, image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        if (pixelMap) {
          console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
          console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        }

        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocator024 error: ${error}, code: ${err.code}`);
        expect(Number(err.code) === 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocator025
     * @tc.number  PixelMapCreateUsingAllocatorTest_025
     * @tc.desc    createPixelMapUsingAllocator with undefined options test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapUsingAllocator025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height * 4;
        const colorBuffer = new ArrayBuffer(bufferSize);

        const pixelMap = await image.createPixelMapUsingAllocator(colorBuffer, undefined, image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        if (pixelMap) {
          console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
          console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        }

        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocator025 error: ${error}, code: ${err.code}`);
        expect(Number(err.code) === 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocator026
     * @tc.number  PixelMapCreateUsingAllocatorTest_026
     * @tc.desc    createPixelMapUsingAllocator with invalid AllocatorType test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapUsingAllocator026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height * 4;
        const colorBuffer = new ArrayBuffer(bufferSize);
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true
        };

        const pixelMap = await image.createPixelMapUsingAllocator(colorBuffer, opts, 999);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        if (pixelMap) {
          console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
          console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        }

        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocator026 error: ${error}, code: ${err.code}`);
        expect(Number(err.code) === 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocator027
     * @tc.number  PixelMapCreateUsingAllocatorTest_027
     * @tc.desc    createPixelMapUsingAllocator with invalid format and AllocatorType.DMA test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapUsingAllocator027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height * 4;
        const colorBuffer = new ArrayBuffer(bufferSize);
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.YCBCR_P010,
          pixelFormat: image.PixelMapFormat.YCBCR_P010,
          editable: true
        };

        const pixelMap = await image.createPixelMapUsingAllocator(colorBuffer, opts, image.AllocatorType.DMA);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        if (pixelMap) {
          console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
          console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        }

        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocator027 error: ${error}, code: ${err.code}`);
        expect(Number(err.code) === 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocator028
     * @tc.number  PixelMapCreateUsingAllocatorTest_028
     * @tc.desc    createPixelMapUsingAllocator with invalid format and AllocatorType.SHARE_MEMORY test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapUsingAllocator028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height * 4;
        const colorBuffer = new ArrayBuffer(bufferSize);
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.RGBA_1010102,
          pixelFormat: image.PixelMapFormat.RGBA_1010102,
          editable: true
        };

        const pixelMap = await image.createPixelMapUsingAllocator(colorBuffer, opts, image.AllocatorType.SHARE_MEMORY);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        if (pixelMap) {
          console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
          console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        }

        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocator028 error: ${error}, code: ${err.code}`);
        expect(Number(err.code) === 7600201).assertTrue();
        done();
      }
    });

  })
}