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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import image from '@ohos.multimedia.image';

export default function GraphicImagePixelMapErrorCode() {

  describe("GraphicImagePixelMapErrorCode", (): void => {

    /**
     * @tc.name   GraphicImagePixelMapErrorCode_Static_0100
     * @tc.number SUB_GRAPHIC_image_GraphicImagePixelMapErrorCode_Static_0100
     * @tc.desc   createEmptyPixelMap error code 7600305.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_Static_0100 ';
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
     * @tc.name   GraphicImagePixelMapErrorCode_Static_0200
     * @tc.number SUB_GRAPHIC_image_GraphicImagePixelMapErrorCode_Static_0200
     * @tc.desc   createPixelMapFromPixels error code 7600305.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_Static_0200 ';
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
     * @tc.name   GraphicImagePixelMapErrorCode_Static_0300
     * @tc.number SUB_GRAPHIC_image_GraphicImagePixelMapErrorCode_Static_0300
     * @tc.desc   createPixelMapFromPixelsSync error code 7600305.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_Static_0300 ';
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
     * @tc.name   GraphicImagePixelMapErrorCode_Static_0400
     * @tc.number SUB_GRAPHIC_image_GraphicImagePixelMapErrorCode_Static_0400
     * @tc.desc   createPixelMapFromPixelsSync error code 7600207.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_Static_0400 ';
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
     * @tc.name   GraphicImagePixelMapErrorCode_Static_0500
     * @tc.number SUB_GRAPHIC_image_GraphicImagePixelMapErrorCode_Static_0500
     * @tc.desc   applyScale error code 7600301.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_Static_0500 ';
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
     * @tc.name   GraphicImagePixelMapErrorCode_Static_0600
     * @tc.number SUB_GRAPHIC_image_GraphicImagePixelMapErrorCode_Static_0600
     * @tc.desc   applyScaleSync error code 7600301.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_Static_0600 ';
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
     * @tc.name   GraphicImagePixelMapErrorCode_Static_0700
     * @tc.number SUB_GRAPHIC_image_GraphicImagePixelMapErrorCode_Static_0700
     * @tc.desc   applyScale error code 7600206.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_Static_0700 ';
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
     * @tc.name   GraphicImagePixelMapErrorCode_Static_0800
     * @tc.number SUB_GRAPHIC_image_GraphicImagePixelMapErrorCode_Static_0800
     * @tc.desc   applyScale error code 7600206.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicImagePixelMapErrorCode_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data GraphicImagePixelMapErrorCode_Static_0800 ';
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
