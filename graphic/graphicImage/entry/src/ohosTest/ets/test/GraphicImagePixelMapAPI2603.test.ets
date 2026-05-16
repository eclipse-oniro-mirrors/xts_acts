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

export default function GraphicImagePixelMapAPI2603() {

  describe("graphicImagePixelMapAPI2603", (): void => {

    /**
     * @tc.name   graphicImagePixelMapAPI2603_0100
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_0100
     * @tc.desc   createPixelMapFromPixels UNKNOWN format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_0100 ';
        console.info(msgStr + 'begin');
        // UNKNOWN defaults to RGBA_8888 usually, 4 bytes per pixel
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.UNKNOWN,
          srcPixelFormat: image.PixelMapFormat.UNKNOWN
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_0200
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_0200
     * @tc.desc   createPixelMapFromPixels ARGB_8888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_0200 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ARGB_8888,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ARGB_8888);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_0300
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_0300
     * @tc.desc   createPixelMapFromPixels RGB_565 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_0300 ';
        console.info(msgStr + 'begin');
        // 2 bytes per pixel
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGB_565,
          srcPixelFormat: image.PixelMapFormat.RGB_565
        }
        try {
          console.info(msgStr + 'begin 111');
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          console.info(msgStr + 'begin 222');
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          console.info(msgStr + 'begin 333');
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGB_565);
          console.info(msgStr + 'begin 444');
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_0400
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_0400
     * @tc.desc   createPixelMapFromPixels RGBA_8888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_0400 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_0500
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_0500
     * @tc.desc   createPixelMapFromPixels BGRA_8888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_0500 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.BGRA_8888);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_0600
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_0600
     * @tc.desc   createPixelMapFromPixels RGB_888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_0600 ';
        console.info(msgStr + 'begin');
        // 3 bytes per pixel
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGB_888,
          srcPixelFormat: image.PixelMapFormat.RGB_888
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGB_888);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_0700
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_0700
     * @tc.desc   createPixelMapFromPixels ALPHA_8 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_0700 ';
        console.info(msgStr + 'begin');
        // 1 byte per pixel
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ALPHA_8,
          srcPixelFormat: image.PixelMapFormat.ALPHA_8
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_8);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_0800
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_0800
     * @tc.desc   createPixelMapFromPixels RGBA_F16 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_0800 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_F16,
          srcPixelFormat: image.PixelMapFormat.RGBA_F16
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_F16);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          expect(error.code).assertEqual(7600206);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_0900
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_0900
     * @tc.desc   createPixelMapFromPixels NV21 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_0900 ';
        console.info(msgStr + 'begin');
        // 1.5 bytes per pixel
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.NV21,
          srcPixelFormat: image.PixelMapFormat.NV21
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.NV21);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_1000
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_1000
     * @tc.desc   createPixelMapFromPixels NV12 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_1000 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.NV12,
          srcPixelFormat: image.PixelMapFormat.NV12
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.NV12);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_1100
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_1100
     * @tc.desc   createPixelMapFromPixels RGBA_1010102 unsupported error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_1100 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_1010102,
          srcPixelFormat: image.PixelMapFormat.RGBA_1010102
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600207).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_1200
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_1200
     * @tc.desc   createPixelMapFromPixels YCBCR_P010 unsupported error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_1200 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.YCBCR_P010,
          srcPixelFormat: image.PixelMapFormat.YCBCR_P010
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600207).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_1300
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_1300
     * @tc.desc   createPixelMapFromPixels YCRCB_P010 unsupported error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_1300 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.YCRCB_P010,
          srcPixelFormat: image.PixelMapFormat.YCRCB_P010
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600207).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_1400
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_1400
     * @tc.desc   createPixelMapFromPixels ALPHA_U8 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_1400 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ALPHA_U8,
          srcPixelFormat: image.PixelMapFormat.ALPHA_U8
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_U8);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_1500
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_1500
     * @tc.desc   createPixelMapFromPixels ASTC_4x4 reset to RGBA_8888 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_1500 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ASTC_4x4,
          srcPixelFormat: image.PixelMapFormat.ASTC_4x4
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_1600
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_1600
     * @tc.desc   createPixelMapFromPixels alphaType UNKNOWN success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_1600 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.UNKNOWN
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_1700
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_1700
     * @tc.desc   createPixelMapFromPixels alphaType OPAQUE success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_1700 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.OPAQUE
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_1800
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_1800
     * @tc.desc   createPixelMapFromPixels alphaType PREMUL success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_1800 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.PREMUL
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_1900
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_1900
     * @tc.desc   createPixelMapFromPixels alphaType UNPREMUL success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_1900 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.UNPREMUL
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_2000
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_2000
     * @tc.desc   createPixelMapFromPixels scaleMode FIT_TARGET_SIZE success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_2000 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_2100
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_2100
     * @tc.desc   createPixelMapFromPixels scaleMode CENTER_CROP success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_2100 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          scaleMode: image.ScaleMode.CENTER_CROP
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_2200
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_2200
     * @tc.desc   createPixelMapFromPixels editable true success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_2200 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          editable: true
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          expect(pixelMap.isEditable).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_2300
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_2300
     * @tc.desc   createPixelMapFromPixels editable false success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_2300 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          editable: false
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          expect(pixelMap.isEditable).assertFalse();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_2400
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_2400
     * @tc.desc   createPixelMapFromPixels verify isStrideAlignment success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_2400 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          expect(typeof pixelMap.isStrideAlignment).assertEqual('boolean');
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_2500
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_2500
     * @tc.desc   createPixelMapFromPixels verify pixelFormat matches opts test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_2500 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(opts.pixelFormat);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_2600
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_2600
     * @tc.desc   createPixelMapFromPixels buffer size mismatch error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_2600 ';
        console.info(msgStr + 'begin');
        // Wrong size: expecting 96 bytes for RGBA_8888
        let buffer: ArrayBuffer = new ArrayBuffer(50);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_2700
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixelsSync_2700
     * @tc.desc   createPixelMapFromPixelsSync basic success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_2700 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_2800
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_2800
     * @tc.desc   createPixelMapFromPixels buffer=null error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_2800 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(null, opts);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code).assertEqual(7600206);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_2900
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_2900
     * @tc.desc   createPixelMapFromPixels buffer=undefined error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_2900 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(undefined, opts);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code).assertEqual(7600206);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_3000
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_3000
     * @tc.desc   createPixelMapFromPixels opts=null error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_3000 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, null);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code).assertEqual(7600206);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_3100
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_3100
     * @tc.desc   createPixelMapFromPixels opts=undefined error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_3100 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, undefined);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code).assertEqual(7600206);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_3200
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixelsSync_3200
     * @tc.desc   createPixelMapFromPixelsSync buffer=null error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_3200 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(null, opts);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code).assertEqual(7600206);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_3300
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixelsSync_3300
     * @tc.desc   createPixelMapFromPixelsSync buffer=undefined error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_3300 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(undefined, opts);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code).assertEqual(7600206);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_3400
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixelsSync_3400
     * @tc.desc   createPixelMapFromPixelsSync opts=null error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_3400 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, null);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code).assertEqual(7600206);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_3500
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixelsSync_3500
     * @tc.desc   createPixelMapFromPixelsSync opts=undefined error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_3500 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, undefined);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code).assertEqual(7600206);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_3600
     * @tc.number SUB_GRAPHIC_image_createEmptyPixelMap_3600
     * @tc.desc   createEmptyPixelMap opts=null error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_3600 ';
        console.info(msgStr + 'begin');
        try {
          let pixelMap = image.createEmptyPixelMap(null);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error);
          expect(error !== undefined).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_3700
     * @tc.number SUB_GRAPHIC_image_createEmptyPixelMap_3700
     * @tc.desc   createEmptyPixelMap opts=undefined error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_3700 ';
        console.info(msgStr + 'begin');
        try {
          let pixelMap = image.createEmptyPixelMap(undefined);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code).assertEqual(7600206);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_3800
     * @tc.number SUB_GRAPHIC_image_readAllPixelsToBuffer_3800
     * @tc.desc   readAllPixelsToBuffer buffer=null error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_3800 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
        try {
          await pixelMap.readAllPixelsToBuffer(null);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code).assertEqual(7600206);
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_3900
     * @tc.number SUB_GRAPHIC_image_readAllPixelsToBuffer_3900
     * @tc.desc   readAllPixelsToBuffer buffer=undefined error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_3900 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
        try {
          await pixelMap.readAllPixelsToBuffer(undefined);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code).assertEqual(7600206);
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_4000
     * @tc.number SUB_GRAPHIC_image_readAllPixelsToBufferSync_4000
     * @tc.desc   readAllPixelsToBufferSync buffer=null error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_4000 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
        try {
          pixelMap.readAllPixelsToBufferSync(null);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code).assertEqual(7600206);
          done();
        } finally {
          pixelMap.release();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_4100
     * @tc.number SUB_GRAPHIC_image_readAllPixelsToBufferSync_4100
     * @tc.desc   readAllPixelsToBufferSync buffer=undefined error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_4100 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
        try {
          pixelMap.readAllPixelsToBufferSync(undefined);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code).assertEqual(7600206);
          done();
        } finally {
          pixelMap.release();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_4200
     * @tc.number SUB_GRAPHIC_image_readPixelsToArea_4200
     * @tc.desc   readPixelsToArea area=null error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_4200 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
        try {
          await pixelMap.readPixelsToArea(null);
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
     * @tc.name   graphicImagePixelMapAPI2603_4300
     * @tc.number SUB_GRAPHIC_image_readPixelsToArea_4300
     * @tc.desc   readPixelsToArea area=undefined error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_4300 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
        try {
          await pixelMap.readPixelsToArea(undefined);
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
     * @tc.name   graphicImagePixelMapAPI2603_4400
     * @tc.number SUB_GRAPHIC_image_readPixelsToAreaSync_4400
     * @tc.desc   readPixelsToAreaSync area=null error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_4400 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
        try {
          pixelMap.readPixelsToAreaSync(null);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        } finally {
          pixelMap.release();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_4500
     * @tc.number SUB_GRAPHIC_image_readPixelsToAreaSync_4500
     * @tc.desc   readPixelsToAreaSync area=undefined error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_4500 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
        try {
          pixelMap.readPixelsToAreaSync(undefined);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        } finally {
          pixelMap.release();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_4600
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_4600
     * @tc.desc   writePixelsFromArea area=null error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_4600 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
        try {
          await pixelMap.writePixelsFromArea(null);
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
     * @tc.name   graphicImagePixelMapAPI2603_4700
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_4700
     * @tc.desc   writePixelsFromArea area=undefined error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_4700 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
        try {
          await pixelMap.writePixelsFromArea(undefined);
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
     * @tc.name   graphicImagePixelMapAPI2603_4800
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_4800
     * @tc.desc   writePixelsFromAreaSync area=null error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_4800 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
        try {
          pixelMap.writePixelsFromAreaSync(null);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        } finally {
          pixelMap.release();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_4900
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_4900
     * @tc.desc   writePixelsFromAreaSync area=undefined error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_4900 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
        try {
          pixelMap.writePixelsFromAreaSync(undefined);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        } finally {
          pixelMap.release();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_5000
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_5000
     * @tc.desc   writeAllPixelsFromBuffer src=null error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_5000 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
        try {
          await pixelMap.writeAllPixelsFromBuffer(null);
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
     * @tc.name   graphicImagePixelMapAPI2603_5100
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_5100
     * @tc.desc   writeAllPixelsFromBuffer src=undefined error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_5100 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
        try {
          await pixelMap.writeAllPixelsFromBuffer(undefined);
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
     * @tc.name   graphicImagePixelMapAPI2603_5200
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_5200
     * @tc.desc   writeAllPixelsFromBufferSync src=null error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_5200 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
        try {
          pixelMap.writeAllPixelsFromBufferSync(null);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        } finally {
          pixelMap.release();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_5300
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_5300
     * @tc.desc   writeAllPixelsFromBufferSync src=undefined error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_5300 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
        try {
          pixelMap.writeAllPixelsFromBufferSync(undefined);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        } finally {
          pixelMap.release();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_5400
     * @tc.number SUB_GRAPHIC_image_setOpacity_5400
     * @tc.desc   setOpacity opacity=null error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_5400 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
        try {
          await pixelMap.setOpacity(null);
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
     * @tc.name   graphicImagePixelMapAPI2603_5500
     * @tc.number SUB_GRAPHIC_image_setOpacity_5500
     * @tc.desc   setOpacity opacity=undefined error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_5500 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
        try {
          await pixelMap.setOpacity(undefined);
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
     * @tc.name   graphicImagePixelMapAPI2603_5600
     * @tc.number SUB_GRAPHIC_image_setOpacitySync_5600
     * @tc.desc   setOpacitySync opacity=null error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_5600 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
        try {
          pixelMap.setOpacitySync(null);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        } finally {
          pixelMap.release();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_5700
     * @tc.number SUB_GRAPHIC_image_setOpacitySync_5700
     * @tc.desc   setOpacitySync opacity=undefined error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_5700 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
        try {
          pixelMap.setOpacitySync(undefined);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        } finally {
          pixelMap.release();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_5800
     * @tc.number SUB_GRAPHIC_image_applyScale_5800
     * @tc.desc   applyScale scaleX=null error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_5800 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
        try {
          await pixelMap.applyScale(null, 1.0);
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
     * @tc.name   graphicImagePixelMapAPI2603_5900
     * @tc.number SUB_GRAPHIC_image_applyScale_5900
     * @tc.desc   applyScale scaleY=null error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_5900 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
        try {
          await pixelMap.applyScale(1.0, null);
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
     * @tc.name   graphicImagePixelMapAPI2603_6000
     * @tc.number SUB_GRAPHIC_image_applyScale_6000
     * @tc.desc   applyScale scaleX=undefined error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_6000 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
        try {
          await pixelMap.applyScale(undefined, 1.0);
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
     * @tc.name   graphicImagePixelMapAPI2603_6100
     * @tc.number SUB_GRAPHIC_image_applyScale_6100
     * @tc.desc   applyScale scaleY=undefined error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_6100 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
        try {
          await pixelMap.applyScale(1.0, undefined);
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
     * @tc.name   graphicImagePixelMapAPI2603_6200
     * @tc.number SUB_GRAPHIC_image_applyScaleSync_6200
     * @tc.desc   applyScaleSync scaleX=null error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_6200 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
        try {
          pixelMap.applyScaleSync(null, 1.0);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        } finally {
          pixelMap.release();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_6300
     * @tc.number SUB_GRAPHIC_image_applyScaleSync_6300
     * @tc.desc   applyScaleSync scaleY=null error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_6300 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
        try {
          pixelMap.applyScaleSync(1.0, null);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        } finally {
          pixelMap.release();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_6400
     * @tc.number SUB_GRAPHIC_image_applyScaleSync_6400
     * @tc.desc   applyScaleSync scaleX=undefined error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_6400 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
        try {
          pixelMap.applyScaleSync(undefined, 1.0);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        } finally {
          pixelMap.release();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_6500
     * @tc.number SUB_GRAPHIC_image_applyScaleSync_6500
     * @tc.desc   applyScaleSync scaleY=undefined error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_6500 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
        try {
          pixelMap.applyScaleSync(1.0, undefined);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        } finally {
          pixelMap.release();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_6600
     * @tc.number SUB_GRAPHIC_image_applyTranslate_6600
     * @tc.desc   applyTranslate transX=null error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_6600 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
        try {
          await pixelMap.applyTranslate(null, 0);
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
     * @tc.name   graphicImagePixelMapAPI2603_6700
     * @tc.number SUB_GRAPHIC_image_applyTranslate_6700
     * @tc.desc   applyTranslate transY=null error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_6700 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
        try {
          await pixelMap.applyTranslate(0, null);
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
     * @tc.name   graphicImagePixelMapAPI2603_6800
     * @tc.number SUB_GRAPHIC_image_applyTranslate_6800
     * @tc.desc   applyTranslate transX=undefined error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_6800 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
        try {
          await pixelMap.applyTranslate(undefined, 0);
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
     * @tc.name   graphicImagePixelMapAPI2603_6900
     * @tc.number SUB_GRAPHIC_image_applyTranslate_6900
     * @tc.desc   applyTranslate transY=undefined error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_6900 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
        try {
          await pixelMap.applyTranslate(0, undefined);
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
     * @tc.name   graphicImagePixelMapAPI2603_7000
     * @tc.number SUB_GRAPHIC_image_applyTranslateSync_7000
     * @tc.desc   applyTranslateSync transX=null error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_7000 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
        try {
          pixelMap.applyTranslateSync(null, 0);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        } finally {
          pixelMap.release();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_7100
     * @tc.number SUB_GRAPHIC_image_applyTranslateSync_7100
     * @tc.desc   applyTranslateSync transY=null error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_7100 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
        try {
          pixelMap.applyTranslateSync(0, null);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        } finally {
          pixelMap.release();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_7200
     * @tc.number SUB_GRAPHIC_image_applyTranslateSync_7200
     * @tc.desc   applyTranslateSync transX=undefined error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_7200 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
        try {
          pixelMap.applyTranslateSync(undefined, 0);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        } finally {
          pixelMap.release();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_7300
     * @tc.number SUB_GRAPHIC_image_applyTranslateSync_7300
     * @tc.desc   applyTranslateSync transY=undefined error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_7300 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
        try {
          pixelMap.applyTranslateSync(0, undefined);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        } finally {
          pixelMap.release();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_7400
     * @tc.number SUB_GRAPHIC_image_applyRotate_7400
     * @tc.desc   applyRotate rotate=null error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_7400 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
        try {
          await pixelMap.applyRotate(null);
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
     * @tc.name   graphicImagePixelMapAPI2603_7500
     * @tc.number SUB_GRAPHIC_image_applyRotate_7500
     * @tc.desc   applyRotate rotate=undefined error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_7500 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
        try {
          await pixelMap.applyRotate(undefined);
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
     * @tc.name   graphicImagePixelMapAPI2603_7600
     * @tc.number SUB_GRAPHIC_image_applyRotateSync_7600
     * @tc.desc   applyRotateSync rotate=null error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_7600 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
        try {
          pixelMap.applyRotateSync(null);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        } finally {
          pixelMap.release();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_7700
     * @tc.number SUB_GRAPHIC_image_applyRotateSync_7700
     * @tc.desc   applyRotateSync rotate=undefined error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_7700 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
        try {
          pixelMap.applyRotateSync(undefined);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        } finally {
          pixelMap.release();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_7800
     * @tc.number SUB_GRAPHIC_image_applyCrop_7800
     * @tc.desc   applyCrop region=null error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_7800 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
        try {
          await pixelMap.applyCrop(null);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600204).assertTrue();
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_7900
     * @tc.number SUB_GRAPHIC_image_applyCrop_7900
     * @tc.desc   applyCrop region=undefined error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_7900 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
        try {
          await pixelMap.applyCrop(undefined);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600204).assertTrue();
          done();
        } finally {
          await pixelMap.release();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_8000
     * @tc.number SUB_GRAPHIC_image_applyCropSync_8000
     * @tc.desc   applyCropSync region=null error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_8000 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
        try {
          pixelMap.applyCropSync(null);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600204).assertTrue();
          done();
        } finally {
          pixelMap.release();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_8100
     * @tc.number SUB_GRAPHIC_image_applyCropSync_8100
     * @tc.desc   applyCropSync region=undefined error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_8100 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
        try {
          pixelMap.applyCropSync(undefined);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600204).assertTrue();
          done();
        } finally {
          pixelMap.release();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_8200
     * @tc.number SUB_GRAPHIC_image_applyScale_8200
     * @tc.desc   applyScale level=null error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_8200 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
        try {
          await pixelMap.applyScale(1.0, 1.0, null);
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
     * @tc.name   graphicImagePixelMapAPI2603_8300
     * @tc.number SUB_GRAPHIC_image_applyScale_8300
     * @tc.desc   applyScale level=nundefined error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_8300 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
        try {
          await pixelMap.applyScale(1.0, 1.0, undefined);
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
     * @tc.name   graphicImagePixelMapAPI2603_8400
     * @tc.number SUB_GRAPHIC_image_applyScale_8400
     * @tc.desc   applyScale level=null error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_8400 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
        try {
          pixelMap.applyScaleSync(1.0, 1.0, null);
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
     * @tc.name   graphicImagePixelMapAPI2603_8500
     * @tc.number SUB_GRAPHIC_image_applyScale_8500
     * @tc.desc   applyScale level=nundefined error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_8500 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
        try {
          pixelMap.applyScaleSync(1.0, 1.0, undefined);
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
     * @tc.name   graphicImagePixelMapAPI2603_8600
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_8600
     * @tc.desc   createPixelMapFromPixelsSync UNKNOWN format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_8600 ';
        console.info(msgStr + 'begin');
        // UNKNOWN defaults to RGBA_8888 usually, 4 bytes per pixel
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.UNKNOWN,
          srcPixelFormat: image.PixelMapFormat.UNKNOWN,
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_8700
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_8700
     * @tc.desc   createPixelMapFromPixelsSync ARGB_8888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_8700 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ARGB_8888,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ARGB_8888);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_8800
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_8800
     * @tc.desc   createPixelMapFromPixelsSync RGB_565 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_8800 ';
        console.info(msgStr + 'begin');
        // 2 bytes per pixel
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGB_565,
          srcPixelFormat: image.PixelMapFormat.RGB_565,
        }
        try {
          console.info(msgStr + 'begin 111');
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          console.info(msgStr + 'begin 222');
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          console.info(msgStr + 'begin 333');
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGB_565);
          console.info(msgStr + 'begin 444');
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_8900
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_8900
     * @tc.desc   createPixelMapFromPixelsSync RGBA_8888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_8900 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_9000
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_9000
     * @tc.desc   createPixelMapFromPixels BGRA_8888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_9000 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.BGRA_8888);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_9100
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_9100
     * @tc.desc   createPixelMapFromPixelsSync RGB_888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_9100 ';
        console.info(msgStr + 'begin');
        // 3 bytes per pixel
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGB_888,
          srcPixelFormat: image.PixelMapFormat.RGB_888,
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGB_888);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_9200
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_9200
     * @tc.desc   createPixelMapFromPixelsSync ALPHA_8 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_9200 ';
        console.info(msgStr + 'begin');
        // 1 byte per pixel
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ALPHA_8,
          srcPixelFormat: image.PixelMapFormat.ALPHA_8,
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_8);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_9300
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_9300
     * @tc.desc   createPixelMapFromPixelsSync RGBA_F16 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_9300 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_F16,
          srcPixelFormat: image.PixelMapFormat.RGBA_F16,
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_F16);
          pixelMap.release();
          console.info(msgStr + 'end');
          expect().assertFail();
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error.code);
          expect(error.code).assertEqual(7600206);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_9400
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_9400
     * @tc.desc   createPixelMapFromPixelsSync NV21 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_9400 ';
        console.info(msgStr + 'begin');
        // 1.5 bytes per pixel
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.NV21,
          srcPixelFormat: image.PixelMapFormat.NV21,
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.NV21);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_9500
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_9500
     * @tc.desc   createPixelMapFromPixelsSync NV12 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_9500 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.NV12,
          srcPixelFormat: image.PixelMapFormat.NV12,
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.NV12);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_9600
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_9600
     * @tc.desc   createPixelMapFromPixelsSync RGBA_1010102 unsupported error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_9600 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_1010102,
          srcPixelFormat: image.PixelMapFormat.RGBA_1010102,
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600207).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_9700
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_9700
     * @tc.desc   createPixelMapFromPixelsSync YCBCR_P010 unsupported error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_9700 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.YCBCR_P010,
          srcPixelFormat: image.PixelMapFormat.YCBCR_P010,
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600207).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_9800
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_9800
     * @tc.desc   createPixelMapFromPixelsSync YCRCB_P010 unsupported error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_9800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_9800 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.YCRCB_P010,
          srcPixelFormat: image.PixelMapFormat.YCRCB_P010,
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600207).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_9900
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_9900
     * @tc.desc   createPixelMapFromPixelsSync ALPHA_U8 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_9900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_9900 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ALPHA_U8,
          srcPixelFormat: image.PixelMapFormat.ALPHA_U8,
        }
        try {
          let pixelMap =  image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_U8);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

  })
}
