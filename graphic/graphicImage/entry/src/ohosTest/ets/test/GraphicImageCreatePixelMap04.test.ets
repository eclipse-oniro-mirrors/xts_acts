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

const LOG_PREFIX: string = "[www data GraphicImageCreatePixelMap04]";

export default function GraphicImageCreatePixelMap04() {
  describe('GraphicImageCreatePixelMap04', ()=> {
    console.log('describe GraphicImageCreatePixelMap04 start!!!')
    beforeAll(async ()=> {
    })

    /**
     * @tc.name    createPixelMapUsingAllocatorSync001
     * @tc.number  PixelMapCreateUsingAllocatorSyncTest_001
     * @tc.desc    createPixelMapUsingAllocatorSync with AllocatorType.AUTO and RGBA_8888 pixelFormat test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync001',
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

        const pixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, opts,
          image.AllocatorType.AUTO);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync001 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync002
     * @tc.number  PixelMapCreateUsingAllocatorSyncTest_002
     * @tc.desc    createPixelMapUsingAllocatorSync with AllocatorType.DMA test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync002',
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

        const pixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, opts,
          image.AllocatorType.DMA);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync002 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync003
     * @tc.number  PixelMapCreateUsingAllocatorSyncTest_003
     * @tc.desc    createPixelMapUsingAllocatorSync with AllocatorType.SHARE_MEMORY test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync003',
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

        const pixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, opts,
          image.AllocatorType.SHARE_MEMORY);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync003 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync004
     * @tc.number  PixelMapCreateUsingAllocatorSyncTest_004
     * @tc.desc    createPixelMapUsingAllocatorSync with PixelFormat.UNKNOWN test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height * 4;
        const colorBuffer = new ArrayBuffer(bufferSize);
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.UNKNOWN,
          pixelFormat: image.PixelMapFormat.UNKNOWN,
          editable: true
        };

        const pixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, opts,
          image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);

        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync004 error: ${error}, code: ${err.code}`);
        expect(Number(err.code) === 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync005
     * @tc.number  PixelMapCreateUsingAllocatorSyncTest_005
     * @tc.desc    createPixelMapUsingAllocatorSync with PixelFormat.ARGB_8888 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync005',
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

        const pixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, opts,
          image.AllocatorType.AUTO);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync005 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync006
     * @tc.number  PixelMapCreateUsingAllocatorSyncTest_006
     * @tc.desc    createPixelMapUsingAllocatorSync with PixelFormat.RGB_565 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync006',
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

        const pixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, opts,
          image.AllocatorType.AUTO);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync006 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync007
     * @tc.number  PixelMapCreateUsingAllocatorSyncTest_007
     * @tc.desc    createPixelMapUsingAllocatorSync with PixelFormat.BGRA_8888 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync007',
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

        const pixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, opts,
          image.AllocatorType.AUTO);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync007 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync008
     * @tc.number  PixelMapCreateUsingAllocatorSyncTest_008
     * @tc.desc    createPixelMapUsingAllocatorSync with PixelFormat.RGB_888 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync008',
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

        const pixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, opts,
          image.AllocatorType.AUTO);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync008 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync009
     * @tc.number  PixelMapCreateUsingAllocatorSyncTest_009
     * @tc.desc    createPixelMapUsingAllocatorSync with PixelFormat.ALPHA_8 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync009',
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

        const pixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, opts,
          image.AllocatorType.AUTO);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync009 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync010
     * @tc.number  PixelMapCreateUsingAllocatorSyncTest_010
     * @tc.desc    createPixelMapUsingAllocatorSync with PixelFormat.RGBA_F16 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync010',
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

        const pixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, opts,
          image.AllocatorType.AUTO);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync010 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync011
     * @tc.number  PixelMapCreateUsingAllocatorSyncTest_011
     * @tc.desc    createPixelMapUsingAllocatorSync with PixelFormat.NV21 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = Math.floor(width * height * 3 / 2);
        const colorBuffer = new ArrayBuffer(bufferSize);
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.NV21,
          pixelFormat: image.PixelMapFormat.NV21,
          editable: true
        };

        const pixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, opts,
          image.AllocatorType.AUTO);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync011 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync012
     * @tc.number  PixelMapCreateUsingAllocatorSyncTest_012
     * @tc.desc    createPixelMapUsingAllocatorSync with PixelFormat.NV12 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = Math.floor(width * height * 3 / 2);
        const colorBuffer = new ArrayBuffer(bufferSize);
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.NV12,
          pixelFormat: image.PixelMapFormat.NV12,
          editable: true
        };

        const pixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, opts,
          image.AllocatorType.AUTO);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync012 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync013
     * @tc.number  PixelMapCreateUsingAllocatorSyncTest_013
     * @tc.desc    createPixelMapUsingAllocatorSync with PixelFormat.RGBA_1010102 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync013',
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

        const pixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, opts,
          image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        expect(pixelMap).assertUndefined();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync013 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync014
     * @tc.number  PixelMapCreateUsingAllocatorSyncTest_014
     * @tc.desc    createPixelMapUsingAllocatorSync with PixelFormat.YCBCR_P010 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync014',
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

        const pixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, opts,
          image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync014 error: ${error}, code: ${err.code}`);
        expect(Number(err.code) === 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync015
     * @tc.number  PixelMapCreateUsingAllocatorSyncTest_015
     * @tc.desc    createPixelMapUsingAllocatorSync with PixelFormat.YCRCB_P010 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync015',
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

        const pixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, opts,
          image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync015 error: ${error}, code: ${err.code}`);
        expect(Number(err.code) === 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync016
     * @tc.number  PixelMapCreateUsingAllocatorSyncTest_016
     * @tc.desc    createPixelMapUsingAllocatorSync with PixelFormat.ASTC_4x4 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync016',
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

        const pixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, opts,
          image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync016 error: ${error}, code: ${err.code}`);
        expect(Number(err.code) === 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync017
     * @tc.number  PixelMapCreateUsingAllocatorSyncTest_017
     * @tc.desc    createPixelMapUsingAllocatorSync with AlphaType.UNKNOWN test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync017',
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

        const pixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, opts,
          image.AllocatorType.AUTO);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync017 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync018
     * @tc.number  PixelMapCreateUsingAllocatorSyncTest_018
     * @tc.desc    createPixelMapUsingAllocatorSync with AlphaType.OPAQUE test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync018',
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

        const pixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, opts,
          image.AllocatorType.AUTO);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync018 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync019
     * @tc.number  PixelMapCreateUsingAllocatorSyncTest_019
     * @tc.desc    createPixelMapUsingAllocatorSync with AlphaType.UNPREMUL test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync019',
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

        const pixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, opts,
          image.AllocatorType.AUTO);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync019 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync020
     * @tc.number  PixelMapCreateUsingAllocatorSyncTest_020
     * @tc.desc    createPixelMapUsingAllocatorSync with ScaleMode.CENTER_CROP test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync020',
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

        const pixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, opts,
          image.AllocatorType.AUTO);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync020 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync021
     * @tc.number  PixelMapCreateUsingAllocatorSyncTest_021
     * @tc.desc    createPixelMapUsingAllocatorSync with editable false test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync021',
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

        const pixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, opts,
          image.AllocatorType.AUTO);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync021 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync022
     * @tc.number  PixelMapCreateUsingAllocatorSyncTest_022
     * @tc.desc    createPixelMapUsingAllocatorSync with null colors buffer test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapUsingAllocatorSync022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height * 4;
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true
        };

        const pixelMap = image.createPixelMapUsingAllocatorSync(null, opts,
          image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        if (pixelMap) {
          console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
          console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        }
        
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync022 error: ${error}, code: ${err.code}`);
        expect(Number(err.code) === 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync023
     * @tc.number  PixelMapCreateUsingAllocatorSyncTest_023
     * @tc.desc    createPixelMapUsingAllocatorSync with undefined colors buffer test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapUsingAllocatorSync023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height * 4;
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true
        };

        const pixelMap = image.createPixelMapUsingAllocatorSync(undefined, opts,
          image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        if (pixelMap) {
          console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
          console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        }
        
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync023 error: ${error}, code: ${err.code}`);
        expect(Number(err.code) === 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync024
     * @tc.number  PixelMapCreateUsingAllocatorSyncTest_024
     * @tc.desc    createPixelMapUsingAllocatorSync with null param test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapUsingAllocatorSync024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height * 4;
        const colorBuffer = new ArrayBuffer(bufferSize);

        const pixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, null,
          image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        if (pixelMap) {
          console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
          console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        }
        
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync024 error: ${error}, code: ${err.code}`);
        expect(Number(err.code) === 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync025
     * @tc.number  PixelMapCreateUsingAllocatorSyncTest_025
     * @tc.desc    createPixelMapUsingAllocatorSync with undefined param test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapUsingAllocatorSync025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        const bufferSize = width * height * 4;
        const colorBuffer = new ArrayBuffer(bufferSize);

        const pixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, undefined,
          image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        if (pixelMap) {
          console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
          console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        }
        
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync025 error: ${error}, code: ${err.code}`);
        expect(Number(err.code) === 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync026
     * @tc.number  PixelMapCreateUsingAllocatorSyncTest_026
     * @tc.desc    createPixelMapUsingAllocatorSync with invalid AllocatorType test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapUsingAllocatorSync026',
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

        const pixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, opts, 999);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        if (pixelMap) {
          console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
          console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        }
        
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync026 error: ${error}, code: ${err.code}`);
        expect(Number(err.code) === 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync027
     * @tc.number  PixelMapCreateUsingAllocatorSyncTest_027
     * @tc.desc    createPixelMapUsingAllocatorSync with invalid format and AllocatorType.DMA test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapUsingAllocatorSync027',
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

        const pixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, opts,
          image.AllocatorType.DMA);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        if (pixelMap) {
          console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
          console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        }
        
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync027 error: ${error}, code: ${err.code}`);
        expect(Number(err.code) === 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync028
     * @tc.number  PixelMapCreateUsingAllocatorSyncTest_028
     * @tc.desc    createPixelMapUsingAllocatorSync with invalid format and AllocatorType.SHARE_MEMORY test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapUsingAllocatorSync028',
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

        const pixelMap = image.createPixelMapUsingAllocatorSync(colorBuffer, opts,
          image.AllocatorType.SHARE_MEMORY);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        if (pixelMap) {
          console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
          console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        }
        
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync028 error: ${error}, code: ${err.code}`);
        expect(Number(err.code) === 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync2Param001
     * @tc.number  PixelMapCreateUsingAllocatorSync2ParamTest_001
     * @tc.desc    createPixelMapUsingAllocatorSync with AllocatorType.AUTO and RGBA_8888 pixelFormat test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync2Param001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.PREMUL,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE
        };

        const pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync2Param001 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync2Param002
     * @tc.number  PixelMapCreateUsingAllocatorSync2ParamTest_002
     * @tc.desc    createPixelMapUsingAllocatorSync with AllocatorType.DMA test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync2Param002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true
        };

        const pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.DMA);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync2Param002 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync2Param003
     * @tc.number  PixelMapCreateUsingAllocatorSync2ParamTest_003
     * @tc.desc    createPixelMapUsingAllocatorSync with AllocatorType.SHARE_MEMORY test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync2Param003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true
        };

        const pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.SHARE_MEMORY);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync2Param003 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync2Param004
     * @tc.number  PixelMapCreateUsingAllocatorSync2ParamTest_004
     * @tc.desc    createPixelMapUsingAllocatorSync with PixelFormat.UNKNOWN test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync2Param004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.UNKNOWN,
          pixelFormat: image.PixelMapFormat.UNKNOWN,
          editable: true
        };

        const pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);

        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync2Param004 error: ${error}, code: ${err.code}`);
        expect(Number(err.code) === 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync2Param005
     * @tc.number  PixelMapCreateUsingAllocatorSync2ParamTest_005
     * @tc.desc    createPixelMapUsingAllocatorSync with PixelFormat.ARGB_8888 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync2Param005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.ARGB_8888,
          editable: true
        };

        const pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync2Param005 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync2Param006
     * @tc.number  PixelMapCreateUsingAllocatorSync2ParamTest_006
     * @tc.desc    createPixelMapUsingAllocatorSync with PixelFormat.RGB_565 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync2Param006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.RGB_565,
          pixelFormat: image.PixelMapFormat.RGB_565,
          editable: true
        };

        const pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync2Param006 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync2Param007
     * @tc.number  PixelMapCreateUsingAllocatorSync2ParamTest_007
     * @tc.desc    createPixelMapUsingAllocatorSync with PixelFormat.RGB_888 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync2Param007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.RGB_888,
          pixelFormat: image.PixelMapFormat.RGB_888,
          editable: true
        };

        const pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync2Param007 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync2Param008
     * @tc.number  PixelMapCreateUsingAllocatorSync2ParamTest_008
     * @tc.desc    createPixelMapUsingAllocatorSync with PixelFormat.ALPHA_8 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync2Param008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.ALPHA_8,
          pixelFormat: image.PixelMapFormat.ALPHA_8,
          editable: true
        };

        const pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync2Param008 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync2Param009
     * @tc.number  PixelMapCreateUsingAllocatorSync2ParamTest_009
     * @tc.desc    createPixelMapUsingAllocatorSync with PixelFormat.RGBA_F16 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync2Param009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.RGBA_F16,
          pixelFormat: image.PixelMapFormat.RGBA_F16,
          editable: true
        };

        const pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync2Param009 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync2Param010
     * @tc.number  PixelMapCreateUsingAllocatorSync2ParamTest_010
     * @tc.desc    createPixelMapUsingAllocatorSync with PixelFormat.NV21 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync2Param010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.NV21,
          pixelFormat: image.PixelMapFormat.NV21,
          editable: true
        };

        const pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync2Param010 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync2Param011
     * @tc.number  PixelMapCreateUsingAllocatorSync2ParamTest_011
     * @tc.desc    createPixelMapUsingAllocatorSync with PixelFormat.NV12 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync2Param011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.NV12,
          pixelFormat: image.PixelMapFormat.NV12,
          editable: true
        };

        const pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync2Param011 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync2Param012
     * @tc.number  PixelMapCreateUsingAllocatorSync2ParamTest_012
     * @tc.desc    createPixelMapUsingAllocatorSync with PixelFormat.RGBA_1010102 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync2Param012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.RGBA_1010102,
          pixelFormat: image.PixelMapFormat.RGBA_1010102,
          editable: true
        };

        const pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        expect(pixelMap).assertUndefined();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync2Param012 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync2Param013
     * @tc.number  PixelMapCreateUsingAllocatorSync2ParamTest_013
     * @tc.desc    createPixelMapUsingAllocatorSync with PixelFormat.YCBCR_P010 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync2Param013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.YCBCR_P010,
          pixelFormat: image.PixelMapFormat.YCBCR_P010,
          editable: true
        };

        const pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        expect(pixelMap).assertUndefined();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync2Param013 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync2Param014
     * @tc.number  PixelMapCreateUsingAllocatorSync2ParamTest_014
     * @tc.desc    createPixelMapUsingAllocatorSync with PixelFormat.YCRCB_P010 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync2Param014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.YCRCB_P010,
          pixelFormat: image.PixelMapFormat.YCRCB_P010,
          editable: true
        };

        const pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        expect(pixelMap).assertUndefined();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync2Param014 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync2Param015
     * @tc.number  PixelMapCreateUsingAllocatorSync2ParamTest_015
     * @tc.desc    createPixelMapUsingAllocatorSync with PixelFormat.ASTC_4x4 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync2Param015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.ASTC_4x4,
          pixelFormat: image.PixelMapFormat.ASTC_4x4,
          editable: true
        };

        const pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync2Param015 error: ${error}, code: ${err.code}`);
        expect(Number(err.code) === 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync2Param016
     * @tc.number  PixelMapCreateUsingAllocatorSync2ParamTest_016
     * @tc.desc    createPixelMapUsingAllocatorSync with AlphaType.UNKNOWN test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync2Param016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.UNKNOWN
        };

        const pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync2Param016 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync2Param017
     * @tc.number  PixelMapCreateUsingAllocatorSync2ParamTest_017
     * @tc.desc    createPixelMapUsingAllocatorSync with AlphaType.OPAQUE test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync2Param017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.OPAQUE
        };

        const pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync2Param017 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync2Param018
     * @tc.number  PixelMapCreateUsingAllocatorSync2ParamTest_018
     * @tc.desc    createPixelMapUsingAllocatorSync with AlphaType.UNPREMUL test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync2Param018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL
        };

        const pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync2Param018 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync2Param019
     * @tc.number  PixelMapCreateUsingAllocatorSync2ParamTest_019
     * @tc.desc    createPixelMapUsingAllocatorSync with ScaleMode.CENTER_CROP test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync2Param019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          scaleMode: image.ScaleMode.CENTER_CROP
        };

        const pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync2Param019 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync2Param020
     * @tc.number  PixelMapCreateUsingAllocatorSync2ParamTest_020
     * @tc.desc    createPixelMapUsingAllocatorSync with editable false test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync2Param020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: false
        };

        const pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync2Param020 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync2Param021
     * @tc.number  PixelMapCreateUsingAllocatorSync2ParamTest_021
     * @tc.desc    createPixelMapUsingAllocatorSync with null param test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapUsingAllocatorSync2Param021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const pixelMap = image.createPixelMapUsingAllocatorSync(null, image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        if (pixelMap) {
          console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
          console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        }
        
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync2Param021 error: ${error}, code: ${err.code}`);
        expect(Number(err.code) === 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync2Param022
     * @tc.number  PixelMapCreateUsingAllocatorSync2ParamTest_022
     * @tc.desc    createPixelMapUsingAllocatorSync with undefined param test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapUsingAllocatorSync2Param022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const pixelMap = image.createPixelMapUsingAllocatorSync(undefined, image.AllocatorType.AUTO);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        if (pixelMap) {
          console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
          console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        }
        
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync2Param022 error: ${error}, code: ${err.code}`);
        expect(Number(err.code) === 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync2Param023
     * @tc.number  PixelMapCreateUsingAllocatorSync2ParamTest_023
     * @tc.desc    createPixelMapUsingAllocatorSync with invalid AllocatorType test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapUsingAllocatorSync2Param023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true
        };

        const pixelMap = image.createPixelMapUsingAllocatorSync(opts, 999);
        
        console.info(`${LOG_PREFIX} pixelMap: ${pixelMap}`);
        if (pixelMap) {
          console.info(`${LOG_PREFIX} isEditable: ${pixelMap.isEditable}`);
          console.info(`${LOG_PREFIX} isStrideAlignment: ${pixelMap.isStrideAlignment}`);
        }
        
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync2Param023 error: ${error}, code: ${err.code}`);
        expect(Number(err.code) === 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapUsingAllocatorSync2Param024
     * @tc.number  PixelMapCreateUsingAllocatorSync2ParamTest_024
     * @tc.desc    createPixelMapUsingAllocatorSync without AllocatorType test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapUsingAllocatorSync2Param024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const width = 4;
        const height = 6;
        
        const opts: image.InitializationOptions = {
          size: { width: width, height: height },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true
        };

        const pixelMap = image.createPixelMapUsingAllocatorSync(opts);
        
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
        console.error(`${LOG_PREFIX} createPixelMapUsingAllocatorSync2Param024 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

  })
}