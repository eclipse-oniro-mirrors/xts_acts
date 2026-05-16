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

const LOG_PREFIX: string = "www data ";

export default function GraphicImageCreatePixelMap05() {
  describe('GraphicImageCreatePixelMap05', ()=> {
    console.log('describe GraphicImageCreatePixelMap05 start!!!')
    beforeAll(async ()=> {
    })

    /**
     * @tc.name    GraphicImageCreatePixelMap05_0100
     * @tc.number  GraphicImageCreatePixelMap05_0100
     * @tc.desc    createPixelMap test
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('GraphicImageCreatePixelMap05_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data GraphicImageCreatePixelMap05_0100 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ASTC_4x4,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          alphaType: image.AlphaType.PREMUL,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap: image.PixelMap = await image.createPixelMap(color, opts);
          console.info(msgStr + 'success ', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertFalse();
          await pixelMap.release();
          done();
        } catch(err){
          console.info(msgStr + 'failed ', err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    GraphicImageCreatePixelMap05_0200
     * @tc.number  GraphicImageCreatePixelMap05_0200
     * @tc.desc    createPixelMap test
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('GraphicImageCreatePixelMap05_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data GraphicImageCreatePixelMap05_0200 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, srcPixelFormat: image.PixelMapFormat.ASTC_4x4,
          pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        image.createPixelMap(color, opts, (error: BusinessError | null, pixelMap: image.PixelMap | undefined) => {
          if(error) {
            console.error(msgStr + `Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(msgStr + 'Succeeded in creating pixelmap.');
            pixelMap?.release();
            done();
          }
        })
      })

    /**
     * @tc.name    GraphicImageCreatePixelMap05_0300
     * @tc.number  GraphicImageCreatePixelMap05_0300
     * @tc.desc    createPixelMap test
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it("GraphicImageCreatePixelMap05_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function)=> {
      let msgStr = 'www data GraphicImageCreatePixelMap05_0300 ';
      try {
        image.createPixelMapUsingAllocatorSync(null, image.AllocatorType.AUTO)
        expect().assertFail();
        done();
      } catch(error){
        console.error(msgStr + `Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code) === 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    GraphicImageCreatePixelMap05_0400
     * @tc.number  GraphicImageCreatePixelMap05_0400
     * @tc.desc    createPixelMap test
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it("GraphicImageCreatePixelMap05_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function)=> {
        let msgStr = 'www data GraphicImageCreatePixelMap05_0400 ';
        try {
          image.createPixelMapUsingAllocatorSync(undefined, image.AllocatorType.AUTO)
          expect().assertFail();
          done();
        } catch(error){
          console.error(msgStr + `wFailed to getMetaData. code is ${error.code}, message is ${error.message}`);
          expect(Number(error.code) === 7600201).assertTrue();
          done();
        }
      });

    /**
     * @tc.name    GraphicImageCreatePixelMap05_0500
     * @tc.number  GraphicImageCreatePixelMap05_0500
     * @tc.desc    createPixelMap test
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('GraphicImageCreatePixelMap05_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let msgStr = 'www data GraphicImageCreatePixelMap05_0500 ';
        try {
          // Create destination pixel map with isEditable: true
          const dstOpts: image.InitializationOptions = {
            size: { width: 4, height: 6 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            editable: true,
            alphaType: image.AlphaType.UNPREMUL
          };
          const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstOpts);
          console.info(`${msgStr} dstPixelMap isEditable: ${dstPixelMap.isEditable}`);
          expect(dstPixelMap.isEditable).assertEqual(true);
          await image.createPremultipliedPixelMap(dstPixelMap, null);
          console.info(`${msgStr} success`);
          await dstPixelMap.release();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.error(`${msgStr} error: ${error}, code: ${err.code}`);
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name    GraphicImageCreatePixelMap05_0600
     * @tc.number  GraphicImageCreatePixelMap05_0600
     * @tc.desc    createPixelMap test
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('GraphicImageCreatePixelMap05_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let msgStr = 'www data GraphicImageCreatePixelMap05_0600 ';
        try {
          // Create destination pixel map with isEditable: true
          const dstOpts: image.InitializationOptions = {
            size: { width: 4, height: 6 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            editable: true,
            alphaType: image.AlphaType.UNPREMUL
          };
          const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstOpts);
          console.info(`${msgStr} dstPixelMap isEditable: ${dstPixelMap.isEditable}`);
          expect(dstPixelMap.isEditable).assertEqual(true);
          await image.createPremultipliedPixelMap(dstPixelMap, undefined);
          console.info(`${msgStr} success`);
          await dstPixelMap.release();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.error(`${msgStr} error: ${error}, code: ${err.code}`);
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name    GraphicImageCreatePixelMap05_0700
     * @tc.number  GraphicImageCreatePixelMap05_0700
     * @tc.desc    createPixelMap test
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('GraphicImageCreatePixelMap05_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let msgStr = 'www data GraphicImageCreatePixelMap05_0700 ';
        try {
          // Create destination pixel map with isEditable: true
          const dstOpts: image.InitializationOptions = {
            size: { width: 4, height: 6 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            editable: true,
            alphaType: image.AlphaType.UNPREMUL
          };
          const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstOpts);
          console.info(`${msgStr} dstPixelMap isEditable: ${dstPixelMap.isEditable}`);
          expect(dstPixelMap.isEditable).assertEqual(true);
          await image.createUnpremultipliedPixelMap(dstPixelMap, null);
          console.info(`${msgStr} success`);
          await dstPixelMap.release();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.error(`${msgStr} error: ${error}, code: ${err.code}`);
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name    GraphicImageCreatePixelMap05_0800
     * @tc.number  GraphicImageCreatePixelMap05_0800
     * @tc.desc    createPixelMap test
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('GraphicImageCreatePixelMap05_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let msgStr = 'www data GraphicImageCreatePixelMap05_0800 ';
        try {
          // Create destination pixel map with isEditable: true
          const dstOpts: image.InitializationOptions = {
            size: { width: 4, height: 6 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            editable: true,
            alphaType: image.AlphaType.UNPREMUL
          };
          const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstOpts);
          console.info(`${msgStr} dstPixelMap isEditable: ${dstPixelMap.isEditable}`);
          expect(dstPixelMap.isEditable).assertEqual(true);
          await image.createUnpremultipliedPixelMap(dstPixelMap, undefined);
          console.info(`${msgStr} success`);
          await dstPixelMap.release();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.error(`${msgStr} error: ${error}, code: ${err.code}`);
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name    GraphicImageCreatePixelMap05_0900
     * @tc.number  GraphicImageCreatePixelMap05_0900
     * @tc.desc    createPixelMap test
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('GraphicImageCreatePixelMap05_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let msgStr = 'www data GraphicImageCreatePixelMap05_0900 ';
        try {
          // Create destination pixel map with isEditable: true
          const dstOpts: image.InitializationOptions = {
            size: { width: 4, height: 6 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            editable: true,
            alphaType: image.AlphaType.UNPREMUL
          };
          const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstOpts);
          console.info(`${msgStr} dstPixelMap isEditable: ${dstPixelMap.isEditable}`);
          expect(dstPixelMap.isEditable).assertEqual(true);
          await image.createUnpremultipliedPixelMap(undefined, dstPixelMap);
          console.info(`${msgStr} success`);
          await dstPixelMap.release();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.error(`${msgStr} error: ${error}, code: ${err.code}`);
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name    GraphicImageCreatePixelMap05_1000
     * @tc.number  GraphicImageCreatePixelMap05_1000
     * @tc.desc    createPixelMap test
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('GraphicImageCreatePixelMap05_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let msgStr = 'www data GraphicImageCreatePixelMap05_1000 ';
        try {
          // Create destination pixel map with isEditable: true
          const dstOpts: image.InitializationOptions = {
            size: { width: 4, height: 6 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            editable: true,
            alphaType: image.AlphaType.UNPREMUL
          };
          const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstOpts);
          console.info(`${msgStr} dstPixelMap isEditable: ${dstPixelMap.isEditable}`);
          expect(dstPixelMap.isEditable).assertEqual(true);
          await image.createUnpremultipliedPixelMap(null, dstPixelMap);
          console.info(`${msgStr} success`);
          await dstPixelMap.release();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.error(`${msgStr} error: ${error}, code: ${err.code}`);
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name    GraphicImageCreatePixelMap05_1100
     * @tc.number  GraphicImageCreatePixelMap05_1100
     * @tc.desc    createPixelMap test
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('GraphicImageCreatePixelMap05_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} translateSync001: Starting translateSync test.`);
        pixelMap.translateSync(null, 40);
        pixelMap.translateSync(undefined, 40);
        pixelMap.translateSync(30, null);
        pixelMap.translateSync(30, undefined);
        console.info(`${LOG_PREFIX} translateSync001: Succeeded in translating.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} translateSync001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    GraphicImageCreatePixelMap05_1200
     * @tc.number  GraphicImageCreatePixelMap05_1200
     * @tc.desc    createPixelMap test
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('GraphicImageCreatePixelMap05_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let staticMetadata: image.HdrStaticMetadata = {
          displayPrimariesX: [1.1, 1.1, 1.1],
          displayPrimariesY: [1.2, 1.2, 1.2],
          whitePointX: 1.1,
          whitePointY: 1.2,
          maxLuminance: 2.1,
          minLuminance: 1.0,
          maxContentLightLevel: 2.1,
          maxFrameAverageLightLevel: 2.1,
        };
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        try {
          await pixelMap.setMetadata(null, staticMetadata);
          console.info(`${LOG_PREFIX} GraphicImageCreatePixelMap05_1200: Starting setMetadata test 11.`);
        } catch(err){
          console.info(`${LOG_PREFIX} GraphicImageCreatePixelMap05_1200: Starting setMetadata error 11.`, err);
          expect(err).assertEqual(62980173);
        }
        try {
          await pixelMap.setMetadata(undefined, staticMetadata);
          console.info(`${LOG_PREFIX} translateSync001: Starting translateSync test 22.`);
        } catch(err){
          console.info(`${LOG_PREFIX} GraphicImageCreatePixelMap05_1200: Starting setMetadata error 22.`, err);
          expect(err).assertEqual(62980173);
        }
        try {
          await pixelMap.setMetadata(image.HdrMetadataKey.HDR_METADATA_TYPE, null);
          console.info(`${LOG_PREFIX} translateSync001: Starting translateSync test 33.`);
        } catch(err){
          console.info(`${LOG_PREFIX} GraphicImageCreatePixelMap05_1200: Starting setMetadata error 33.`, err);
          expect(err).assertEqual(62980173);
        }
        try {
          await pixelMap.setMetadata(image.HdrMetadataKey.HDR_METADATA_TYPE, undefined);
          console.info(`${LOG_PREFIX} translateSync001: Starting translateSync test 44.`);
        } catch(err){
          console.info(`${LOG_PREFIX} GraphicImageCreatePixelMap05_1200: Starting setMetadata error 44.`, err);
          expect(err).assertEqual(62980173);
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name    GraphicImageCreatePixelMap05_1300
     * @tc.number  GraphicImageCreatePixelMap05_1300
     * @tc.desc    createPixelMap test
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('GraphicImageCreatePixelMap05_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, srcPixelFormat: image.PixelMapFormat.RGBA_8888, pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
        let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        try {
          pixelMap.createCroppedAndScaledPixelMapSync(region, 10, 10);
          console.info('www data GraphicImageCreatePixelMap05_1300 pass',
            pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertTrue();
        }catch(err){
          console.info('www data GraphicImageCreatePixelMap05_1300 error', JSON.stringify(err));
          expect().assertFail();
        }
        try {
          await pixelMap.createCroppedAndScaledPixelMap(region, 10, 10, image.AntiAliasingLevel.NONE);
          console.info('www data GraphicImageCreatePixelMap05_1300 pass',
            pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertTrue();
        }catch(err){
          console.info('www data GraphicImageCreatePixelMap05_1300 error', JSON.stringify(err));
          expect().assertFail();
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name    GraphicImageCreatePixelMap05_1400
     * @tc.number  GraphicImageCreatePixelMap05_1400
     * @tc.desc    createPixelMap test
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('GraphicImageCreatePixelMap05_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
        let pixelMap = image.createPixelMapSync(color, opts);
        try {
          pixelMap.createCroppedAndScaledPixelMapSync(region, 10, 10);
          console.info('www data GraphicImageCreatePixelMap05_1400 pass',
            pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();
        }catch(err){
          console.info('www data GraphicImageCreatePixelMap05_1400 error', JSON.stringify(err));
          expect().assertFail();
        }
        try {
          await pixelMap.createCroppedAndScaledPixelMap(region, 10, 10, image.AntiAliasingLevel.NONE);
          console.info('www data GraphicImageCreatePixelMap05_1300 pass',
            pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();
        }catch(err){
          console.info('www data GraphicImageCreatePixelMap05_1300 error', JSON.stringify(err));
          expect().assertFail();
        }
        await pixelMap.release();
        done();
      })


  })
}