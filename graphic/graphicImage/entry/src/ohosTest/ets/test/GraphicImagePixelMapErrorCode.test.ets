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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "@ohos/hypium";
import image from '@ohos.multimedia.image';
import { taskpoolTest } from '../MainAbility/utils/taskpool';

export default function GraphicImagePixelMapErrorCode() {

  describe("GraphicImagePixelMapErrorCode", (): void => {

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_0100
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_0100
     * @tc.desc   createEmptyPixelMap error code 7600305.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_0100 ';
        console.info(msgStr + 'begin');
        const opts: image.InitializationOptions = {
          size: { height: 4000000, width: 6000000 },
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true
        }
        try {
          let pixelMap = image.createEmptyPixelMap(opts);
          console.info(msgStr + 'success');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          console.info(msgStr + 'end');
          expect(error.code).assertEqual(7600301)
          done();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_0200
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_0200
     * @tc.desc   createPixelMapFromPixels error code 7600305.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_0200 ';
        console.info(msgStr + 'begin');
        const opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ASTC_4x4,
          srcPixelFormat: image.PixelMapFormat.YCBCR_P010,
          editable: true
        }
        const buffer = new ArrayBuffer(96);
        try {
          await image.createPixelMapFromPixels(buffer, opts);
          console.info(msgStr + 'success');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          console.info(msgStr + 'end');
          expect(error.code).assertEqual(7600305)
          done();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_0300
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_0300
     * @tc.desc   createPixelMapFromPixelsSync error code 7600305.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_0300 ';
        console.info(msgStr + 'begin');
        const opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ASTC_4x4,
          srcPixelFormat: image.PixelMapFormat.YCBCR_P010,
          editable: true
        }
        const buffer = new ArrayBuffer(96);
        try {
          image.createPixelMapFromPixelsSync(buffer, opts);
          console.info(msgStr + 'success');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          console.info(msgStr + 'end');
          expect(error.code).assertEqual(7600305)
          done();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_0400
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_0400
     * @tc.desc   createPixelMapFromPixelsSync error code 7600207.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_0400 ';
        console.info(msgStr + 'begin');
        const opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.YCBCR_P010,
          srcPixelFormat: image.PixelMapFormat.ASTC_4x4,
          editable: true
        }
        const buffer = new ArrayBuffer(96);
        try {
          image.createPixelMapFromPixelsSync(buffer, opts);
          console.info(msgStr + 'success');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          console.info(msgStr + 'end');
          expect(error.code).assertEqual(7600207)
          done();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_0500
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_0500
     * @tc.desc   readAllPixelsToBuffer error code 7600106.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_0500 ';
        console.info(msgStr + 'begin');
        const color = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true
        }
        let pixelMap = image.createPixelMapSync(color, opts);
        taskpoolTest(pixelMap);
        try {
          let buffer = new ArrayBuffer(96);
          await pixelMap.readAllPixelsToBuffer(buffer)
          console.info(msgStr + 'success');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          console.info(msgStr + 'end');
          expect(error.code).assertEqual(7600106)
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_0600
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_0600
     * @tc.desc   readAllPixelsToBufferSync error code 7600106.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_0600 ';
        console.info(msgStr + 'begin');
        const color = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true
        }
        let pixelMap = image.createPixelMapSync(color, opts);
        taskpoolTest(pixelMap);
        try {
          let buffer = new ArrayBuffer(96);
          pixelMap.readAllPixelsToBufferSync(buffer)
          console.info(msgStr + 'success');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          console.info(msgStr + 'end');
          expect(error.code).assertEqual(7600106)
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_0700
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_0700
     * @tc.desc   readPixelsToArea error code 7600106.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_0700 ';
        console.info(msgStr + 'begin');
        const color = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true
        }
        let pixelMap = image.createPixelMapSync(color, opts);
        taskpoolTest(pixelMap);
        try {
          let buffer = new ArrayBuffer(16);
          let area: image.PositionArea = {
            pixels: buffer,
            offset: 0,
            stride: 8,
            region: { x: 0, y: 0, size: { width: 2, height: 2 } }
          };
          await pixelMap.readPixelsToArea(area);
          console.info(msgStr + 'success');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          console.info(msgStr + 'end');
          expect(error.code).assertEqual(7600106)
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_0800
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_0800
     * @tc.desc   readPixelsToAreaSync error code 7600106.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_0800 ';
        console.info(msgStr + 'begin');
        const color = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true
        }
        let pixelMap = image.createPixelMapSync(color, opts);
        taskpoolTest(pixelMap);
        try {
          let buffer = new ArrayBuffer(16);
          let area: image.PositionArea = {
            pixels: buffer,
            offset: 0,
            stride: 8,
            region: { x: 0, y: 0, size: { width: 2, height: 2 } }
          };
          pixelMap.readPixelsToAreaSync(area);
          console.info(msgStr + 'success');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          console.info(msgStr + 'end');
          expect(error.code).assertEqual(7600106)
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_0900
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_0900
     * @tc.desc   writeAllPixelsFromBuffer error code 7600106.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_0900 ';
        console.info(msgStr + 'begin');
        const color = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true
        }
        let pixelMap = image.createPixelMapSync(color, opts);
        taskpoolTest(pixelMap);
        try {
          let writeBuffer: ArrayBuffer = new ArrayBuffer(96);
          await pixelMap.writeAllPixelsFromBuffer(writeBuffer);
          console.info(msgStr + 'success');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          console.info(msgStr + 'end');
          expect(error.code).assertEqual(7600106)
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_1000
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_1000
     * @tc.desc   writeAllPixelsFromBufferSync error code 7600106.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_1000 ';
        console.info(msgStr + 'begin');
        const color = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true
        }
        let pixelMap = image.createPixelMapSync(color, opts);
        taskpoolTest(pixelMap);
        try {
          let writeBuffer: ArrayBuffer = new ArrayBuffer(96);
          pixelMap.writeAllPixelsFromBufferSync(writeBuffer);
          console.info(msgStr + 'success');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          console.info(msgStr + 'end');
          expect(error.code).assertEqual(7600106)
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_1100
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_1100
     * @tc.desc   writePixelsFromArea error code 7600106.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_1100 ';
        console.info(msgStr + 'begin');
        const color = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true
        }
        let pixelMap = image.createPixelMapSync(color, opts);
        taskpoolTest(pixelMap);
        try {
          let writeBuffer: ArrayBuffer = new ArrayBuffer(32);
          let area: image.PositionArea = {
            pixels: writeBuffer,
            offset: 8,
            stride: 8,
            region: { x: 0, y: 0, size: { width: 2, height: 2 } }
          };
          await pixelMap.writePixelsFromArea(area);
          console.info(msgStr + 'success');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          console.info(msgStr + 'end');
          expect(error.code).assertEqual(7600106)
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_1200
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_1200
     * @tc.desc   writePixelsFromAreaSync error code 7600106.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_1200 ';
        console.info(msgStr + 'begin');
        const color = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true
        }
        let pixelMap = image.createPixelMapSync(color, opts);
        taskpoolTest(pixelMap);
        try {
          let writeBuffer: ArrayBuffer = new ArrayBuffer(32);
          let area: image.PositionArea = {
            pixels: writeBuffer,
            offset: 8,
            stride: 8,
            region: { x: 0, y: 0, size: { width: 2, height: 2 } }
          };
          pixelMap.writePixelsFromAreaSync(area);
          console.info(msgStr + 'success');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          console.info(msgStr + 'end');
          expect(error.code).assertEqual(7600106)
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_1300
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_1300
     * @tc.desc   setOpacity error code 7600106.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_1300 ';
        console.info(msgStr + 'begin');
        const color = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true
        }
        let pixelMap = image.createPixelMapSync(color, opts);
        taskpoolTest(pixelMap);
        try {
          await pixelMap.setOpacity(0.5);
          console.info(msgStr + 'success');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          console.info(msgStr + 'end');
          expect(error.code).assertEqual(7600106)
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_1400
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_1400
     * @tc.desc   setOpacitySync error code 7600106.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_1400 ';
        console.info(msgStr + 'begin');
        const color = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true
        }
        let pixelMap = image.createPixelMapSync(color, opts);
        taskpoolTest(pixelMap);
        try {
          pixelMap.setOpacitySync(0.5);
          console.info(msgStr + 'success');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          console.info(msgStr + 'end');
          expect(error.code).assertEqual(7600106)
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_1500
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_1500
     * @tc.desc   extractAlphaPixelMap error code 7600106.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_1500 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap = await image.createPixelMap(color, opts);
        taskpoolTest(pixelMap);
        try {
          await pixelMap.extractAlphaPixelMap();
          console.info(msgStr + 'end');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          expect(error.code).assertEqual(7600106)
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_1600
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_1600
     * @tc.desc   extractAlphaPixelMapSync error code 7600106.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_1600 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap = await image.createPixelMap(color, opts);
        taskpoolTest(pixelMap);
        try {
          pixelMap.extractAlphaPixelMapSync();
          console.info(msgStr + 'end');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          expect(error.code).assertEqual(7600106)
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_1700
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_1700
     * @tc.desc   applyScale error code 7600301.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_1700 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap = await image.createPixelMap(color, opts);
        try {
          await pixelMap.applyScale(200000000000000000, -2.0);
          console.info(msgStr + 'end');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          expect(error.code).assertEqual(7600301);
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_1800
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_1800
     * @tc.desc   applyScaleSync error code 7600301.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_1800 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap = await image.createPixelMap(color, opts);
        try {
          pixelMap.applyScaleSync(200000000000000000, -2.0);
          console.info(msgStr + 'end');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          expect(error.code).assertEqual(7600301);
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_1900
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_1900
     * @tc.desc   applyScale error code 7600106.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_1900 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap = await image.createPixelMap(color, opts);
        taskpoolTest(pixelMap);
        try {
          await pixelMap.applyScale(2.0, 2.0);
          console.info(msgStr + 'end');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          expect(error.code).assertEqual(7600106);
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_2000
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_2000
     * @tc.desc   applyScale error code 7600106.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_2000 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap = await image.createPixelMap(color, opts);
        taskpoolTest(pixelMap);
        try {
          pixelMap.applyScaleSync(2.0, 2.0);
          console.info(msgStr + 'end');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          expect(error.code).assertEqual(7600106);
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_2100
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_2100
     * @tc.desc   applyTranslate error code 7600106.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_2100 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap = await image.createPixelMap(color, opts);
        taskpoolTest(pixelMap);
        try {
          await pixelMap.applyTranslate(2.0, 2.0);
          console.info(msgStr + 'end');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          expect(error.code).assertEqual(7600106);
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_2200
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_2200
     * @tc.desc   applyTranslateSync error code 7600106.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_2200 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap = await image.createPixelMap(color, opts);
        taskpoolTest(pixelMap);
        try {
          pixelMap.applyTranslateSync(2.0, 2.0);
          console.info(msgStr + 'end');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          expect(error.code).assertEqual(7600106);
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_2300
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_2300
     * @tc.desc   applyRotate error code 7600106.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_2300 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap = await image.createPixelMap(color, opts);
        taskpoolTest(pixelMap);
        try {
          await pixelMap.applyRotate(2.0);
          console.info(msgStr + 'end');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          expect(error.code).assertEqual(7600106);
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_2400
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_2400
     * @tc.desc   applyRotateSync error code 7600106.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_2400 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap = await image.createPixelMap(color, opts);
        taskpoolTest(pixelMap);
        try {
          pixelMap.applyRotateSync(2.0);
          console.info(msgStr + 'end');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          expect(error.code).assertEqual(7600106);
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_2500
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_2500
     * @tc.desc   applyFlip error code 7600106.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_2500 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap = await image.createPixelMap(color, opts);
        taskpoolTest(pixelMap);
        try {
          await pixelMap.applyFlip(true, false);
          console.info(msgStr + 'end');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          expect(error.code).assertEqual(7600106);
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_2600
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_2600
     * @tc.desc   applyFlipSync error code 7600106.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_2600 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap = await image.createPixelMap(color, opts);
        taskpoolTest(pixelMap);
        try {
          pixelMap.applyFlipSync(true, false);
          console.info(msgStr + 'end');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          expect(error.code).assertEqual(7600106);
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_2700
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_2700
     * @tc.desc   applyFlip error code 7600206.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_2700 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap = await image.createPixelMap(color, opts);
        try {
          await pixelMap.applyFlip(null, undefined);
          console.info(msgStr + 'end');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          expect(error.code).assertEqual(7600206);
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_2800
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_2800
     * @tc.desc   applyFlip error code 7600206.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_2800 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap = await image.createPixelMap(color, opts);
        try {
          await pixelMap.applyFlip(undefined, null);
          console.info(msgStr + 'end');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          expect(error.code).assertEqual(7600206);
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_2900
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_2900
     * @tc.desc   applyFlipSync error code 7600206.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_2900 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap = await image.createPixelMap(color, opts);
        try {
          pixelMap.applyFlipSync(null, undefined);
          console.info(msgStr + 'end');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          expect(error.code).assertEqual(7600206);
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_3000
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_3000
     * @tc.desc   applyFlipSync error code 7600206.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_3000 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap = await image.createPixelMap(color, opts);
        try {
          pixelMap.applyFlipSync(undefined, null);
          console.info(msgStr + 'end');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          expect(error.code).assertEqual(7600206);
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_3100
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_3100
     * @tc.desc   applyCrop error code 7600106.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_3100 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap = await image.createPixelMap(color, opts);
        taskpoolTest(pixelMap);
        try {
          let region: image.Region = { x: 2, y: 1, size: { width: 3, height: 2 } };
          await pixelMap.applyCrop(region);
          console.info(msgStr + 'end');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          expect(error.code).assertEqual(7600106);
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_3200
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_3200
     * @tc.desc   applyCropSync error code 7600106.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_3200 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap = await image.createPixelMap(color, opts);
        taskpoolTest(pixelMap);
        try {
          let region: image.Region = { x: 2, y: 1, size: { width: 3, height: 2 } };
          pixelMap.applyCropSync(region);
          console.info(msgStr + 'end');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          expect(error.code).assertEqual(7600106);
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_3300
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_3300
     * @tc.desc   applyScale error code 7600206.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_3300 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
        try {
          await pixelMap.applyScale(0, 1.0);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_3400
     * @tc.number SUB_GRAPHIC_image_graphicImagePixelMapErrorCode_3400
     * @tc.desc   applyScale error code 7600206.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_3400 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
        try {
          pixelMap.applyScaleSync(0, 1.0);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        } finally {
          await pixelMap.release();
        }
      })

  })
}
