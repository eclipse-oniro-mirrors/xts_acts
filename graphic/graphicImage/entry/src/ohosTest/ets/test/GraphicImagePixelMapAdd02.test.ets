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
import image from '@ohos.multimedia.image';
import { BusinessError } from '@kit.BasicServicesKit';

// 统一的日志标识前缀
const LOG_PREFIX: string = '[www data graphicImagePixelMapAdd02]';

export default function graphicImagePixelMapAdd02() {
  describe('graphicImagePixelMapAdd02', ()=> {
    beforeAll(async (done:Function)=> {
      console.info("imagePixelMapTest beforeEach start");
      done();
    });

    /**
     * @tc.name crop001
     * @tc.number PixelMapCropTest_001
     * @tc.desc PixelMap crop with valid region at origin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('crop001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} crop001: Starting crop test.`);
        expect(pixelMap.isEditable).assertTrue();
        console.info(
          `${LOG_PREFIX} crop001: isEditable = ${pixelMap.isEditable}, isStrideAlignment = `
            + `${pixelMap.isStrideAlignment}`
        );

        const region: image.Region = { x: 0, y: 0, size: { width: 2, height: 2 } };
        await pixelMap.crop(region);

        expect(pixelMap.isEditable).assertTrue();
        console.info(`${LOG_PREFIX} crop001: Succeeded in cropping.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} crop001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name crop002
     * @tc.number PixelMapCropTest_002
     * @tc.desc PixelMap crop with valid region at offset
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('crop002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} crop002: Starting crop test.`);
        expect(pixelMap.isEditable).assertTrue();

        const region: image.Region = { x: 1, y: 1, size: { width: 2, height: 1 } };
        await pixelMap.crop(region);

        expect(pixelMap.isEditable).assertTrue();
        console.info(`${LOG_PREFIX} crop002: Succeeded in cropping.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} crop002 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name crop003
     * @tc.number PixelMapCropTest_003
     * @tc.desc PixelMap crop with full size region
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('crop003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} crop003: Starting crop test.`);
        expect(pixelMap.isEditable).assertTrue();

        const region: image.Region = { x: 0, y: 0, size: { width: 4, height: 4 } };
        await pixelMap.crop(region);

        expect(pixelMap.isEditable).assertTrue();
        console.info(`${LOG_PREFIX} crop003: Succeeded in cropping.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} crop003 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name crop004
     * @tc.number PixelMapCropTest_004
     * @tc.desc PixelMap crop with minimal valid region
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('crop004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} crop004: Starting crop test.`);
        expect(pixelMap.isEditable).assertTrue();

        const region: image.Region = { x: 2, y: 2, size: { width: 1, height: 1 } };
        await pixelMap.crop(region);

        expect(pixelMap.isEditable).assertTrue();
        console.info(`${LOG_PREFIX} crop004: Succeeded in cropping.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} crop004 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name crop005
     * @tc.number PixelMapCropTest_005
     * @tc.desc PixelMap crop at right edge
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('crop005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} crop005: Starting crop test.`);
        expect(pixelMap.isEditable).assertTrue();

        const region: image.Region = { x: 3, y: 0, size: { width: 1, height: 4 } };
        await pixelMap.crop(region);

        expect(pixelMap.isEditable).assertTrue();
        console.info(`${LOG_PREFIX} crop005: Succeeded in cropping.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} crop005 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name crop006
     * @tc.number PixelMapCropTest_006
     * @tc.desc PixelMap crop at bottom edge
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('crop006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} crop006: Starting crop test.`);
        expect(pixelMap.isEditable).assertTrue();

        const region: image.Region = { x: 0, y: 3, size: { width: 4, height: 1 } };
        await pixelMap.crop(region);

        expect(pixelMap.isEditable).assertTrue();
        console.info(`${LOG_PREFIX} crop006: Succeeded in cropping.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} crop006 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name cropInvalid001
     * @tc.number PixelMapCropTest_007
     * @tc.desc PixelMap crop with negative x (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('cropInvalid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} cropInvalid001: Starting test with negative x.`);

        const region: image.Region = { x: -1, y: 0, size: { width: 2, height: 2 } };
        try {
          await pixelMap.crop(region);
          await pixelMap?.release();
          expect().assertFail();
          done();
        }catch(err){
          expect(err).assertEqual(62980109);
          await pixelMap?.release();
          done();
        }
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} cropInvalid001: Failed with negative x as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name cropInvalid002
     * @tc.number PixelMapCropTest_008
     * @tc.desc PixelMap crop with negative y (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('cropInvalid002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} cropInvalid002: Starting test with negative y.`);

        const region: image.Region = { x: 0, y: -1, size: { width: 2, height: 2 } };
        try {
          await pixelMap.crop(region);
          await pixelMap?.release();
          expect().assertFail();
          done();
        }catch(err){
          expect(err).assertEqual(62980109);
          await pixelMap?.release();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} cropInvalid002: Failed with negative y as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name cropInvalid003
     * @tc.number PixelMapCropTest_009
     * @tc.desc PixelMap crop with zero width (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('cropInvalid003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} cropInvalid003: Starting test with zero width.`);

        const region: image.Region = { x: 0, y: 0, size: { width: 0, height: 2 } };
        try {
          await pixelMap.crop(region);
          await pixelMap?.release();
          expect().assertFail();
          done();
        }catch(err){
          expect(err).assertEqual(62980109);
          await pixelMap?.release();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} cropInvalid003: Failed with zero width as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name cropInvalid004
     * @tc.number PixelMapCropTest_010
     * @tc.desc PixelMap crop with zero height (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('cropInvalid004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} cropInvalid004: Starting test with zero height.`);

        const region: image.Region = { x: 0, y: 0, size: { width: 2, height: 0 } };
        try {
          await pixelMap.crop(region);
          await pixelMap?.release();
          expect().assertFail();
          done();
        }catch(err){
          expect(err).assertEqual(62980109);
          await pixelMap?.release();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} cropInvalid004: Failed with zero height as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name cropInvalid005
     * @tc.number PixelMapCropTest_011
     * @tc.desc PixelMap crop with region exceeding bounds (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('cropInvalid005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} cropInvalid005: Starting test with region exceeding bounds.`);

        const region: image.Region = { x: 1, y: 0, size: { width: 4, height: 4 } };
        try {
          await pixelMap.crop(region);
          await pixelMap?.release();
          expect().assertFail();
          done();
        }catch(err){
          expect(err).assertEqual(62980109);
          await pixelMap?.release();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} cropInvalid005: Failed with out-of-bounds region as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name cropInvalid006
     * @tc.number PixelMapCropTest_012
     * @tc.desc PixelMap crop with null region (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('cropInvalid006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} cropInvalid006: Starting test with null region.`);

        const nullRegion: image.Region | null = null;
        try {
          await pixelMap.crop(nullRegion);
          await pixelMap?.release();
          expect().assertFail();
          done();
        }catch(err){
          expect(err).assertEqual(62980115);
          await pixelMap?.release();
          done();
        }
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} cropInvalid006: Failed with null region as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

     /**
      * @tc.name cropInvalid007
      * @tc.number PixelMapCropTest_027
      * @tc.desc PixelMap crop with null region (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('cropInvalid007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} cropInvalid007: Starting test with null region.`);
        const region: image.Region = { x: 10, y: 10, size: { width: 8, height: 8 } };
        try {
          await pixelMap.crop(region);
          await pixelMap?.release();
          expect().assertFail();
          done();
        }catch(err){
          expect(err).assertEqual(62980109);
          await pixelMap?.release();
          done();
        }
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} cropInvalid007: Failed with null region as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name cropBoundary001
     * @tc.number PixelMapCropTest_013
     * @tc.desc PixelMap crop at exact image boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('cropBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} cropBoundary001: Starting crop test.`);
        expect(pixelMap.isEditable).assertTrue();

        const region: image.Region = { x: 3, y: 0, size: { width: 1, height: 4 } };
        await pixelMap.crop(region);

        expect(pixelMap.isEditable).assertTrue();
        console.info(`${LOG_PREFIX} cropBoundary001: Succeeded in cropping.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} cropBoundary001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name cropBoundary002
     * @tc.number PixelMapCropTest_014
     * @tc.desc PixelMap crop from top edge
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('cropBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} cropBoundary002: Starting crop test.`);
        expect(pixelMap.isEditable).assertTrue();

        const region: image.Region = { x: 0, y: 0, size: { width: 4, height: 2 } };
        await pixelMap.crop(region);

        expect(pixelMap.isEditable).assertTrue();
        console.info(`${LOG_PREFIX} cropBoundary002: Succeeded in cropping.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} cropBoundary002 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name cropBoundary003
     * @tc.number PixelMapCropTest_015
     * @tc.desc PixelMap crop from left edge
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('cropBoundary003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} cropBoundary003: Starting crop test.`);
        expect(pixelMap.isEditable).assertTrue();

        const region: image.Region = { x: 0, y: 0, size: { width: 2, height: 4 } };
        await pixelMap.crop(region);

        expect(pixelMap.isEditable).assertTrue();
        console.info(`${LOG_PREFIX} cropBoundary003: Succeeded in cropping.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} cropBoundary003 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name cropBoundary004
     * @tc.number PixelMapCropTest_016
     * @tc.desc PixelMap crop from right edge
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('cropBoundary004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} cropBoundary004: Starting crop test.`);
        expect(pixelMap.isEditable).assertTrue();

        const region: image.Region = { x: 3, y: 0, size: { width: 1, height: 4 } };
        await pixelMap.crop(region);

        expect(pixelMap.isEditable).assertTrue();
        console.info(`${LOG_PREFIX} cropBoundary004: Succeeded in cropping.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} cropBoundary004 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name cropBoundary005
     * @tc.number PixelMapCropTest_017
     * @tc.desc PixelMap crop from bottom edge
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('cropBoundary005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} cropBoundary005: Starting crop test.`);
        expect(pixelMap.isEditable).assertTrue();

        const region: image.Region = { x: 0, y: 3, size: { width: 4, height: 1 } };
        await pixelMap.crop(region);

        expect(pixelMap.isEditable).assertTrue();
        console.info(`${LOG_PREFIX} cropBoundary005: Succeeded in cropping.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} cropBoundary005 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name cropBoundary006
     * @tc.number PixelMapCropTest_018
     * @tc.desc PixelMap crop at single pixel corner
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('cropBoundary006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} cropBoundary006: Starting crop test.`);
        expect(pixelMap.isEditable).assertTrue();

        const region: image.Region = { x: 3, y: 3, size: { width: 1, height: 1 } };
        await pixelMap.crop(region);

        expect(pixelMap.isEditable).assertTrue();
        console.info(`${LOG_PREFIX} cropBoundary006: Succeeded in cropping.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} cropBoundary006 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name cropBoundary007
     * @tc.number PixelMapCropTest_019
     * @tc.desc PixelMap crop at middle
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('cropBoundary007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} cropBoundary007: Starting crop test.`);
        expect(pixelMap.isEditable).assertTrue();

        const region: image.Region = { x: 1, y: 1, size: { width: 2, height: 2 } };
        await pixelMap.crop(region);

        expect(pixelMap.isEditable).assertTrue();
        console.info(`${LOG_PREFIX} cropBoundary007: Succeeded in cropping.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} cropBoundary007 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name cropBoundary008
     * @tc.number PixelMapCropTest_020
     * @tc.desc PixelMap crop at diagonal position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('cropBoundary008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} cropBoundary008: Starting crop test.`);
        expect(pixelMap.isEditable).assertTrue();

        const region: image.Region = { x: 0, y: 0, size: { width: 2, height: 2 } };
        await pixelMap.crop(region);

        expect(pixelMap.isEditable).assertTrue();
        console.info(`${LOG_PREFIX} cropBoundary008: Succeeded in cropping.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} cropBoundary008 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name cropBoundary009
     * @tc.number PixelMapCropTest_021
     * @tc.desc PixelMap crop just within bounds
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('cropBoundary009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} cropBoundary009: Starting crop test.`);
        expect(pixelMap.isEditable).assertTrue();

        const region: image.Region = { x: 0, y: 0, size: { width: 4, height: 4 } };
        await pixelMap.crop(region);

        expect(pixelMap.isEditable).assertTrue();
        console.info(`${LOG_PREFIX} cropBoundary009: Succeeded in cropping.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} cropBoundary009 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name cropBoundary010
     * @tc.number PixelMapCropTest_022
     * @tc.desc PixelMap crop at mid-point
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('cropBoundary010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} cropBoundary010: Starting crop test.`);
        expect(pixelMap.isEditable).assertTrue();

        const region: image.Region = { x: 1, y: 1, size: { width: 2, height: 2 } };
        await pixelMap.crop(region);

        expect(pixelMap.isEditable).assertTrue();
        console.info(`${LOG_PREFIX} cropBoundary010: Succeeded in cropping.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} cropBoundary010 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name cropBoundary011
     * @tc.number PixelMapCropTest_023
     * @tc.desc PixelMap crop at exact boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('cropBoundary011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} cropBoundary011: Starting crop test.`);
        expect(pixelMap.isEditable).assertTrue();

        const region: image.Region = { x: 0, y: 0, size: { width: 4, height: 4 } };
        await pixelMap.crop(region);

        expect(pixelMap.isEditable).assertTrue();
        console.info(`${LOG_PREFIX} cropBoundary011: Succeeded in cropping.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} cropBoundary011 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name cropBoundary012
     * @tc.number PixelMapCropTest_024
     * @tc.desc PixelMap crop at boundary near corner
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('cropBoundary012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} cropBoundary012: Starting crop test.`);
        expect(pixelMap.isEditable).assertTrue();

        const region: image.Region = { x: 0, y: 0, size: { width: 3, height: 3 } };
        await pixelMap.crop(region);

        expect(pixelMap.isEditable).assertTrue();
        console.info(`${LOG_PREFIX} cropBoundary012: Succeeded in cropping.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} cropBoundary012 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name cropBoundary013
     * @tc.number PixelMapCropTest_025
     * @tc.desc PixelMap crop at mid-point
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('cropBoundary013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} cropBoundary013: Starting crop test.`);
        expect(pixelMap.isEditable).assertTrue();

        const region: image.Region = { x: 1, y: 1, size: { width: 2, height: 2 } };
        await pixelMap.crop(region);

        expect(pixelMap.isEditable).assertTrue();
        console.info(`${LOG_PREFIX} cropBoundary013: Succeeded in cropping.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} cropBoundary013 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name cropBoundary014
     * @tc.number PixelMapCropTest_026
     * @tc.desc PixelMap crop at mid-point offset
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('cropBoundary014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} cropBoundary014: Starting crop test.`);
        expect(pixelMap.isEditable).assertTrue();

        const region: image.Region = { x: 2, y: 2, size: { width: 1, height: 1 } };
        await pixelMap.crop(region);

        expect(pixelMap.isEditable).assertTrue();
        console.info(`${LOG_PREFIX} cropBoundary014: Succeeded in cropping.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} cropBoundary014 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name flip001
     * @tc.number PixelMapFlipTest_001
     * @tc.desc PixelMap flip with valid parameter (horizontal)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('flip001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} flip001: Starting flip test (horizontal).`);

        pixelMap.flip(false, true, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} flip001 failed: code ${error.code}, message ${error.message}`);
            expect().assertFail();
            done();
          } else {
            pixelMap?.release();
            console.info(`${LOG_PREFIX} flip001: Succeeded in flipping horizontally.`);
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} flip001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name flip002
     * @tc.number PixelMapFlipTest_002
     * @tc.desc PixelMap flip with valid parameter (vertical)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('flip002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} flip002: Starting flip test (vertical).`);

        pixelMap.flip(true, false, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} flip002 failed: code ${error.code}, message ${error.message}`);
            expect().assertFail();
            done();
          } else {
            pixelMap?.release();
            console.info(`${LOG_PREFIX} flip002: Succeeded in flipping vertically.`);
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} flip002 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name flip003
     * @tc.number PixelMapFlipTest_003
     * @tc.desc PixelMap flip with valid parameter (both horizontal and vertical)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('flip003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} flip003: Starting flip test (both).`);

        pixelMap.flip(true, true, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} flip003 failed: code ${error.code}, message ${error.message}`);
            expect().assertFail();
            done();
          } else {
            pixelMap?.release();
            console.info(`${LOG_PREFIX} flip003: Succeeded in flipping both horizontally and vertically.`);
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} flip003 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name flipNull001
     * @tc.number PixelMapFlipTest_004
     * @tc.desc PixelMap flip with null horizontal parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('flipNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} flipNull001: Starting test with null horizontal parameter.`);

        pixelMap.flip(null, true, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} flipNull001: Failed with null horizontal as expected, code: ${error}`);
            expect(error).assertEqual(62980115); // Parameter error
            pixelMap?.release();
            done();
          } else {
            pixelMap?.release();
            expect().assertFail(); // Should not succeed with null parameter
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} flipNull001: Unexpected error: ${error}`);
        expect().assertFail(); // Should not succeed with null parameter
        done();
      }
    });

    /**
     * @tc.name flipNull002
     * @tc.number PixelMapFlipTest_005
     * @tc.desc PixelMap flip with null vertical parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('flipNull002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} flipNull002: Starting test with null vertical parameter.`);

        pixelMap.flip(true, null, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} flipNull002: Failed with null vertical as expected, code: ${error}`);
            expect(error).assertEqual(62980115); // Parameter error
            pixelMap?.release();
            done();
          } else {
            pixelMap?.release();
            expect().assertFail(); // Should not succeed with null parameter
            done();
          }
        });
      } catch (error) {
        expect(error.code).assertEqual(401); // Parameter error
        console.error(`${LOG_PREFIX} flipNull002: Unexpected error: ${error}`);
        done();
      }
    });

    /**
     * @tc.name flipUndefined001
     * @tc.number PixelMapFlipTest_006
     * @tc.desc PixelMap flip with undefined horizontal parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('flipUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} flipUndefined001: Starting test with undefined horizontal parameter.`);

        pixelMap.flip(undefined, true, (error: BusinessError) => {
          if (error) {
            console.error(
              `${LOG_PREFIX} flipUndefined001: Failed with undefined horizontal as expected, code: ${error}`
            );
            expect(error).assertEqual(62980115); // Parameter error
            pixelMap?.release();
            done();
          } else {
            expect().assertFail(); // Should not succeed with undefined parameter
            pixelMap?.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} flipUndefined001: Unexpected error: ${error}`);
        expect().assertFail(); // Should not succeed with undefined parameter
        done();
      }
    });

    /**
     * @tc.name flipUndefined002
     * @tc.number PixelMapFlipTest_007
     * @tc.desc PixelMap flip with undefined vertical parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('flipUndefined002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} flipUndefined002: Starting test with undefined vertical parameter.`);

        pixelMap.flip(true, undefined, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} flipUndefined002: Failed with undefined vertical as expected, code: ${error}`);
            expect(error).assertEqual(62980115); // Parameter error
            pixelMap?.release();
            done();
          } else {
            expect().assertFail(); // Should not succeed with undefined parameter
            pixelMap?.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} flipUndefined002: Unexpected error: ${error}`);
        expect().assertFail(); // Should not succeed with undefined parameter
        done();
      }
    });

    /**
     * @tc.name flipString001
     * @tc.number PixelMapFlipTest_008
     * @tc.desc PixelMap flip with string horizontal parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('flipString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} flipString001: Starting test with string horizontal parameter.`);

        pixelMap.flip(true, true, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} flipString001: Failed with string horizontal as expected, code: ${error}`);
            expect().assertFail();
            pixelMap?.release();
            done();
          } else {
            console.info(`${LOG_PREFIX} flipString001: success`);
            pixelMap?.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} flipString001: Unexpected error: ${error}`);
        expect().assertFail(); // Should not succeed with string parameter
        done();
      }
    });

    /**
     * @tc.name flipString002
     * @tc.number PixelMapFlipTest_009
     * @tc.desc PixelMap flip with string vertical parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('flipString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} flipString002: Starting test with string vertical parameter.`);

        pixelMap.flip(true, false, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} flipString002: Failed with string vertical as expected, code: ${error}`);
            expect().assertFail();
            pixelMap?.release();
            done();
          } else {
            console.info(`${LOG_PREFIX} flipString002: success`);
            pixelMap?.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} flipString002: Unexpected error: ${error}`);
        expect().assertFail(); // Should not succeed with string parameter
        done();
      }
    });

    /**
     * @tc.name flipPromise001
     * @tc.number PixelMapFlipTest_010
     * @tc.desc PixelMap flip with Promise - valid parameters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('flipPromise001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} flipPromise001: Starting flip test with Promise.`);

        await pixelMap.flip(false, true);
        console.info(`${LOG_PREFIX} flipPromise001: Succeeded in flipping.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} flipPromise001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name flipPromiseNull001
     * @tc.number PixelMapFlipTest_011
     * @tc.desc PixelMap flip with Promise - null horizontal parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('flipPromiseNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} flipPromiseNull001: Starting test with null horizontal parameter.`);
        try {
          await pixelMap.flip(null, true);
          expect().assertFail(); // Should not reach here
          done();
        } catch(err){
          expect(err).assertEqual(62980115);
          await pixelMap?.release();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} flipPromiseNull001: Failed with null horizontal as expected, code: ${error}`);
        expect().assertFail(); // Should not reach here
        done();
      }
    });

    /**
     * @tc.name flipPromiseNull002
     * @tc.number PixelMapFlipTest_012
     * @tc.desc PixelMap flip with Promise - null vertical parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('flipPromiseNull002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} flipPromiseNull002: Starting test with null vertical parameter.`);
        try {
          await pixelMap.flip(true, null);
          expect().assertFail(); // Should not reach here
          done();
        } catch(err){
          expect(err).assertEqual(62980115);
          await pixelMap?.release();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} flipPromiseNull002: Failed with null vertical as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name flipPromiseUndefined001
     * @tc.number PixelMapFlipTest_013
     * @tc.desc PixelMap flip with Promise - undefined horizontal parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('flipPromiseUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} flipPromiseUndefined001: Starting test with undefined horizontal parameter.`);
        try {
          await pixelMap.flip(undefined, true);
          expect().assertFail(); // Should not reach here
          done();
        } catch(err){
          expect(err).assertEqual(62980115);
          await pixelMap?.release();
          done();
        }
      } catch (error) {
        console.error(
          `${LOG_PREFIX} flipPromiseUndefined001: Failed with undefined horizontal as expected, code: ${error}`
        );
        expect().assertFail(); // Should not reach here
        done();
      }
    });

    /**
     * @tc.name flipPromiseUndefined002
     * @tc.number PixelMapFlipTest_014
     * @tc.desc PixelMap flip with Promise - undefined vertical parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('flipPromiseUndefined002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} flipPromiseUndefined002: Starting test with undefined vertical parameter.`);
        try {
          await pixelMap.flip(true, undefined);
          expect().assertFail(); // Should not reach here
          done();
        } catch(err){
          expect(err).assertEqual(62980115);
          await pixelMap?.release();
          done();
        }
      } catch (error) {
        console.error(
          `${LOG_PREFIX} flipPromiseUndefined002: Failed with undefined vertical as expected, code: ${error.code}`
        );
        expect().assertFail(); // Should not reach here
        done();
      }
    });

    /**
     * @tc.name flipSync001
     * @tc.number PixelMapFlipTest_015
     * @tc.desc PixelMap flipSync - valid parameters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('flipSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} flipSync001: Starting flipSync test.`);

        pixelMap.flipSync(false, true);
        console.info(`${LOG_PREFIX} flipSync001: Succeeded in flipping.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} flipSync001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name flipSyncNull001
     * @tc.number PixelMapFlipTest_016
     * @tc.desc PixelMap flipSync - null horizontal parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('flipSyncNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} flipSyncNull001: Starting test with null horizontal parameter.`);

        pixelMap.flipSync(null, true);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} flipSyncNull001: Failed with null horizontal as expected, code: ${error}`);
        expect().assertFail(); // Should not reach here
        done();
      }
    });

    /**
     * @tc.name flipSyncNull002
     * @tc.number PixelMapFlipTest_017
     * @tc.desc PixelMap flipSync - null vertical parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('flipSyncNull002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} flipSyncNull002: Starting test with null vertical parameter.`);

        pixelMap.flipSync(true, null);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} flipSyncNull002: Failed with null vertical as expected, code: ${error}`);
        expect().assertFail(); // Should not reach here
        done();
      }
    });

    /**
     * @tc.name flipBoundary001
     * @tc.number PixelMapFlipTest_018
     * @tc.desc PixelMap flip with boundary values (both false)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('flipBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} flipBoundary001: Starting test with both false.`);

        await pixelMap.flip(false, false);
        console.info(`${LOG_PREFIX} flipBoundary001: Succeeded in flipping with both false.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} flipBoundary001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name getImageInfo001
     * @tc.number PixelMapGetImageInfoTest_001
     * @tc.desc PixelMap getImageInfo returns valid image info
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('getImageInfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} getImageInfo001: Starting getImageInfo test.`);
        expect(pixelMap.isEditable).assertTrue();
        console.info(
          `${LOG_PREFIX} getImageInfo001: isEditable = ${pixelMap.isEditable}, isStrideAlignment = `
            + `${pixelMap.isStrideAlignment}`
        );

        const info = pixelMap.getImageInfoSync();
        expect(info !== null).assertTrue();
        expect(info.size.width).assertEqual(4);
        expect(info.size.height).assertEqual(4);

        console.info(`${LOG_PREFIX} getImageInfo001: Succeeded in getting image info.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} getImageInfo001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name getImageInfo002
     * @tc.number PixelMapGetImageInfoTest_002
     * @tc.desc PixelMap getImageInfo returns correct pixel format
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('getImageInfo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} getImageInfo002: Starting test.`);
        expect(pixelMap.isEditable).assertTrue();

        const info = pixelMap.getImageInfoSync();
        expect(info.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);

        console.info(`${LOG_PREFIX} getImageInfo002: Succeeded in getting image info.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} getImageInfo002 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name getImageInfo003
     * @tc.number PixelMapGetImageInfoTest_003
     * @tc.desc PixelMap getImageInfo after crop
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('getImageInfo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} getImageInfo003: Starting test.`);
        expect(pixelMap.isEditable).assertTrue();

        const region: image.Region = { x: 0, y: 0, size: { width: 2, height: 2 } };
        await pixelMap.crop(region);
        expect(pixelMap.isEditable).assertTrue();

        const info = pixelMap.getImageInfoSync();
        expect(info.size.width).assertEqual(2);
        expect(info.size.height).assertEqual(2);

        console.info(`${LOG_PREFIX} getImageInfo003: Succeeded in getting image info after crop.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} getImageInfo003 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name getImageInfo004
     * @tc.number PixelMapGetImageInfoTest_004
     * @tc.desc PixelMap getImageInfo after scale
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('getImageInfo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} getImageInfo004: Starting test.`);
        expect(pixelMap.isEditable).assertTrue();

        await pixelMap.scale(2.0, 2.0);
        expect(pixelMap.isEditable).assertTrue();

        const info = pixelMap.getImageInfoSync();
        expect(info.size.width).assertEqual(8);
        expect(info.size.height).assertEqual(8);

        console.info(`${LOG_PREFIX} getImageInfo004: Succeeded in getting image info after scale.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} getImageInfo004 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name opacity001
     * @tc.number PixelMapOpacityTest_001
     * @tc.desc PixelMap opacity with AsyncCallback - success callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('opacity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);

        pixelMap.opacity(0.5, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} opacity001 failed: code ${error.code}, message ${error.message}`);
            expect().assertFail();
          } else {
            console.info(`${LOG_PREFIX} opacity001: Succeeded in setting opacity.`);
            pixelMap?.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} opacity001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name opacity002
     * @tc.number PixelMapOpacityTest_002
     * @tc.desc PixelMap opacity with Promise - success callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('opacity002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);

        await pixelMap.opacity(0.8);
        console.info(`${LOG_PREFIX} opacity002: Succeeded in setting opacity.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} opacity002 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name opacitySync001
     * @tc.number PixelMapOpacityTest_003
     * @tc.desc PixelMap opacitySync - success case
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('opacitySync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);

        pixelMap.opacitySync(0.3);
        console.info(`${LOG_PREFIX} opacitySync001: Succeeded in setting opacity.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} opacitySync001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name opacityNullOpac001
     * @tc.number PixelMapOpacityTest_004
     * @tc.desc PixelMap opacity with AsyncCallback - null parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('opacityNullOpac001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} opacityNull001: Starting test with null rate parameter.`);

        // Test with null rate parameter
        pixelMap.opacity(null, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} opacityNull001: Failed with null rate as expected, code: ${error}`);
            expect(error).assertEqual(62980115); // Parameter error
            pixelMap?.release();
            done();
          } else {
            pixelMap?.release();
            expect().assertFail(); // Should not succeed with null parameter
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} opacityNull001: Unexpected error: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name opacityUndefined001
     * @tc.number PixelMapOpacityTest_005
     * @tc.desc PixelMap opacity with AsyncCallback - undefined parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('opacityUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} opacityUndefined001: Starting test with undefined rate parameter.`);

        // Test with undefined rate parameter
        pixelMap.opacity(undefined, (error: BusinessError) => {
          if (error) {
            console.error(
              `${LOG_PREFIX} opacityUndefined001: Failed with undefined rate as expected, code: ${error.code}`
            );
            expect(error).assertEqual(62980115); // Parameter error
            pixelMap?.release();
            done();
          } else {
            expect().assertFail(); // Should not succeed with undefined parameter
            pixelMap?.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} opacityUndefined001: Unexpected error: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name opacityDifferentValues001
     * @tc.number PixelMapOpacityTest_006
     * @tc.desc PixelMap opacity with Promise - test different opacity values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('opacityDifferentValues001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} opacityDifferentValues001: Starting test with different opacity values.`);

        // Test with different opacity values
        // await pixelMap.opacity(0.0);
        await pixelMap.opacity(0.5);
        await pixelMap.opacity(1.0);
        await pixelMap.opacity(0.25);
        await pixelMap.opacity(0.75);

        console.info(`${LOG_PREFIX} opacityDifferentValues001: Succeeded in testing different opacity values.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} opacityDifferentValues001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name opacityPromiseNull001
     * @tc.number PixelMapOpacityTest_007
     * @tc.desc PixelMap opacity with Promise - null parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('opacityPromiseNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} opacityPromiseNull001: Starting test with null rate parameter.`);
        try {
          // Test with null rate parameter
          await pixelMap.opacity(null);
          expect().assertFail(); // Should not reach here
          done();
        } catch(err){
          expect(err).assertEqual(62980115); // Parameter error
          await pixelMap.release();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} opacityPromiseNull001: Failed with null rate as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name opacityPromiseUndefined001
     * @tc.number PixelMapOpacityTest_008
     * @tc.desc PixelMap opacity with Promise - undefined parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('opacityPromiseUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} opacityPromiseUndefined001: Starting test with undefined rate parameter.`);
        try {
          // Test with undefined rate parameter
          await pixelMap.opacity(undefined);
          expect().assertFail(); // Should not reach here
          done();
        } catch(err){
          expect(err).assertEqual(62980115); // Parameter error
          await pixelMap.release();
          done();
        }
      } catch (error) {
        console.error(
          `${LOG_PREFIX} opacityPromiseUndefined001: Failed with undefined rate as expected, code: ${error}`
        );
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name opacitySyncNull001
     * @tc.number PixelMapOpacityTest_009
     * @tc.desc PixelMap opacitySync - null parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('opacitySyncNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} opacitySyncNull001: Starting test with null rate parameter.`);

        // Test with null rate parameter
        pixelMap.opacitySync(null);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} opacitySyncNull001: Failed with null rate as expected, code: ${error}`);
        expect().assertFail(); // Parameter error
        done();
      }
    });

    /**
     * @tc.name opacitySyncUndefined001
     * @tc.number PixelMapOpacityTest_010
     * @tc.desc PixelMap opacitySync - undefined parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('opacitySyncUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} opacitySyncUndefined001: Starting test with undefined rate parameter.`);

        // Test with undefined rate parameter
        pixelMap.opacitySync(undefined);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} opacitySyncUndefined001: Failed with undefined rate as expected, code: ${error}`);
        expect().assertFail(); // Parameter error
        done();
      }
    });

    /**
     * @tc.name opacityDifferentValues002
     * @tc.number PixelMapOpacityTest_011
     * @tc.desc PixelMap opacity with Promise - test different opacity values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('opacityDifferentValues002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} opacityDifferentValues002: Starting test with different opacity values.`);
        try {
          // Test with different opacity values
          await pixelMap.opacity(0.0);
          console.info(`${LOG_PREFIX} opacityDifferentValues002: Succeeded in testing different opacity values.`);
          expect().assertFail();
          done();
        }catch(err){
          expect(err).assertEqual(62980115);
          await pixelMap.release();
          done();
        }
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} opacityDifferentValues002 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });
    
  })
}