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
import { BusinessError } from '@ohos.base';

export default function GraphicImagePixelMapAPI2603() {

  describe("graphicImagePixelMapAPI2603", (): void => {

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_0100
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_0100
     * @tc.desc   createPixelMapFromPixels UNKNOWN format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_0100 ';
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
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_0200
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_0200
     * @tc.desc   createPixelMapFromPixels ARGB_8888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_0200 ';
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
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_0300
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_0300
     * @tc.desc   createPixelMapFromPixels RGB_565 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_0300 ';
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
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_0400
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_0400
     * @tc.desc   createPixelMapFromPixels RGBA_8888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_0400 ';
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
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_0500
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_0500
     * @tc.desc   createPixelMapFromPixels BGRA_8888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_0500 ';
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
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_0600
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_0600
     * @tc.desc   createPixelMapFromPixels RGB_888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_0600 ';
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
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_0700
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_0700
     * @tc.desc   createPixelMapFromPixels ALPHA_8 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_0700 ';
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
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_0800
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_0800
     * @tc.desc   createPixelMapFromPixels RGBA_F16 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_0800 ';
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
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_0900
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_0900
     * @tc.desc   createPixelMapFromPixels NV21 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_0900 ';
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
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_1000
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_1000
     * @tc.desc   createPixelMapFromPixels NV12 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_1000 ';
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
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_1100
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_1100
     * @tc.desc   createPixelMapFromPixels RGBA_1010102 unsupported error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_1100 ';
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
     * @tc.name   graphicImagePixelMapAPI2603_static_1200
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_1200
     * @tc.desc   createPixelMapFromPixels YCBCR_P010 unsupported error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_1200 ';
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
     * @tc.name   graphicImagePixelMapAPI2603_static_1300
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_1300
     * @tc.desc   createPixelMapFromPixels YCRCB_P010 unsupported error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_1300 ';
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
     * @tc.name   graphicImagePixelMapAPI2603_static_1400
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_1400
     * @tc.desc   createPixelMapFromPixels ALPHA_U8 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_1400 ';
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
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_1500
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_1500
     * @tc.desc   createPixelMapFromPixels ASTC_4x4 reset to RGBA_8888 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_1500 ';
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
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_1600
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_1600
     * @tc.desc   createPixelMapFromPixels alphaType UNKNOWN success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_1600 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.UNKNOWN
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_1700
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_1700
     * @tc.desc   createPixelMapFromPixels alphaType OPAQUE success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_1700 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.OPAQUE
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_1800
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_1800
     * @tc.desc   createPixelMapFromPixels alphaType PREMUL success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_1800 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.PREMUL
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_1900
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_1900
     * @tc.desc   createPixelMapFromPixels alphaType UNPREMUL success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_1900 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.UNPREMUL
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_2000
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_2000
     * @tc.desc   createPixelMapFromPixels scaleMode FIT_TARGET_SIZE success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_2000 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_2100
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_2100
     * @tc.desc   createPixelMapFromPixels scaleMode CENTER_CROP success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_2100 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          scaleMode: image.ScaleMode.CENTER_CROP
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_2200
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_2200
     * @tc.desc   createPixelMapFromPixels editable true success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_2200 ';
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
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_2300
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_2300
     * @tc.desc   createPixelMapFromPixels editable false success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_2300 ';
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
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_2400
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_2400
     * @tc.desc   createPixelMapFromPixels verify isStrideAlignment success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_2400 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          expect(typeof pixelMap.isStrideAlignment).assertEqual('boolean');
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_2500
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_2500
     * @tc.desc   createPixelMapFromPixels verify pixelFormat matches opts test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_2500 ';
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
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_2600
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_2600
     * @tc.desc   createPixelMapFromPixels buffer size mismatch error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_2600 ';
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
     * @tc.name   graphicImagePixelMapAPI2603_static_2700
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixelsSync_static_2700
     * @tc.desc   createPixelMapFromPixelsSync basic success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_2700 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_2800
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_2800
     * @tc.desc   createPixelMapFromPixelsSync UNKNOWN format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_0100 ';
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
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_2900
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_2900
     * @tc.desc   createPixelMapFromPixelsSync ARGB_8888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_2900 ';
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
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_3000
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_3000
     * @tc.desc   createPixelMapFromPixelsSync RGB_565 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_3000 ';
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
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_3100
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_3100
     * @tc.desc   createPixelMapFromPixelsSync RGBA_8888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_3100 ';
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
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_3200
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_3200
     * @tc.desc   createPixelMapFromPixels BGRA_8888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_3200 ';
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
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_3300
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_3300
     * @tc.desc   createPixelMapFromPixelsSync RGB_888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_3300 ';
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
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_3400
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_3400
     * @tc.desc   createPixelMapFromPixelsSync ALPHA_8 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_3400 ';
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
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_3500
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_3500
     * @tc.desc   createPixelMapFromPixelsSync RGBA_F16 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_3500 ';
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
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_3600
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_3600
     * @tc.desc   createPixelMapFromPixelsSync NV21 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_3600 ';
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
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_3700
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_3700
     * @tc.desc   createPixelMapFromPixelsSync NV12 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_3700 ';
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
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_3800
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_3800
     * @tc.desc   createPixelMapFromPixelsSync RGBA_1010102 unsupported error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_3800 ';
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
     * @tc.name   graphicImagePixelMapAPI2603_static_3900
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_3900
     * @tc.desc   createPixelMapFromPixelsSync YCBCR_P010 unsupported error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_3900 ';
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
     * @tc.name   graphicImagePixelMapAPI2603_static_4000
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_4000
     * @tc.desc   createPixelMapFromPixelsSync YCRCB_P010 unsupported error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_4000 ';
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
     * @tc.name   graphicImagePixelMapAPI2603_static_4100
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_4100
     * @tc.desc   createPixelMapFromPixelsSync ALPHA_U8 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_4100 ';
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
          await  await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_4200
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_4200
     * @tc.desc   createPixelMapFromPixelsSync ASTC_4x4 reset to RGBA_8888 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_4200 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ASTC_4x4,
          srcPixelFormat: image.PixelMapFormat.ASTC_4x4,
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_4300
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_4300
     * @tc.desc   createPixelMapFromPixelsSync alphaType UNKNOWN success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_4300 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.UNKNOWN
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_4400
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_4400
     * @tc.desc   createPixelMapFromPixelsSync alphaType OPAQUE success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_4400 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.OPAQUE
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_4500
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_4500
     * @tc.desc   createPixelMapFromPixelsSync alphaType PREMUL success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_4500 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.PREMUL
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_4600
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_4600
     * @tc.desc   createPixelMapFromPixelsSync alphaType UNPREMUL success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_4600 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.UNPREMUL
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_4700
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_4700
     * @tc.desc   createPixelMapFromPixelsSync scaleMode FIT_TARGET_SIZE success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_4700 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_4800
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_4800
     * @tc.desc   createPixelMapFromPixelsSync scaleMode CENTER_CROP success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_4800 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          scaleMode: image.ScaleMode.CENTER_CROP
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_4900
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_4900
     * @tc.desc   createPixelMapFromPixelsSync editable true success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_4900 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          editable: true
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          expect(pixelMap.isEditable).assertTrue();
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_5000
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_5000
     * @tc.desc   createPixelMapFromPixelsSync editable false success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_5000 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          editable: false
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          expect(pixelMap.isEditable).assertFalse();
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_5100
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_static_5100
     * @tc.desc   createPixelMapFromPixels ALPHA_F16 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_5100 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(48);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ALPHA_F16,
          srcPixelFormat: image.PixelMapFormat.ALPHA_F16
        }
        try {
          let pixelMap = await image.createPixelMapFromPixels(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_F16);
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_5200
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixelsSync_static_5200
     * @tc.desc   createPixelMapFromPixelsSync ALPHA_F16 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_5200 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(48);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ALPHA_F16,
          srcPixelFormat: image.PixelMapFormat.ALPHA_F16
        }
        try {
          let pixelMap = image.createPixelMapFromPixelsSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_F16);
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_5300
     * @tc.number SUB_GRAPHIC_image_createPixelMap_static_5300
     * @tc.desc   createPixelMap ALPHA_F16 format Promise success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_5300 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(48);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ALPHA_F16,
          srcPixelFormat: image.PixelMapFormat.ALPHA_F16
        }
        try {
          let pixelMap = await image.createPixelMap(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_F16);
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_5400
     * @tc.number SUB_GRAPHIC_image_createPixelMapSync_static_5400
     * @tc.desc   createPixelMapSync ALPHA_F16 format with colors success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_5400 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(48);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ALPHA_F16,
          srcPixelFormat: image.PixelMapFormat.ALPHA_F16
        }
        try {
          let pixelMap = image.createPixelMapSync(buffer, opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_F16);
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_5500
     * @tc.number SUB_GRAPHIC_image_createPixelMapSync_static_5500
     * @tc.desc   createPixelMapSync ALPHA_F16 format without colors success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_5500 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ALPHA_F16,
          srcPixelFormat: image.PixelMapFormat.ALPHA_F16
        }
        try {
          let pixelMap = image.createPixelMapSync(opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_F16);
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_5600
     * @tc.number SUB_GRAPHIC_image_createPixelMapUsingAllocator_static_5600
     * @tc.desc   createPixelMapUsingAllocator ALPHA_F16 format AUTO allocator success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_5600 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(48);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ALPHA_F16,
          srcPixelFormat: image.PixelMapFormat.ALPHA_F16
        }
        try {
          let pixelMap = await image.createPixelMapUsingAllocator(buffer, opts, image.AllocatorType.AUTO);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_F16);
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_5700
     * @tc.number SUB_GRAPHIC_image_createPixelMapUsingAllocatorSync_static_5700
     * @tc.desc   createPixelMapUsingAllocatorSync ALPHA_F16 format with colors AUTO allocator success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_5700 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(48);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ALPHA_F16,
          srcPixelFormat: image.PixelMapFormat.ALPHA_F16
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(buffer, opts, image.AllocatorType.AUTO);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_F16);
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_5800
     * @tc.number SUB_GRAPHIC_image_createPixelMapUsingAllocatorSync_static_5800
     * @tc.desc   createPixelMapUsingAllocatorSync ALPHA_F16 format without colors AUTO allocator success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_5800 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ALPHA_F16,
          srcPixelFormat: image.PixelMapFormat.ALPHA_F16
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_F16);
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_5900
     * @tc.number SUB_GRAPHIC_image_createEmptyPixelMap_ALPHA_static_5900
     * @tc.desc   createEmptyPixelMap ALPHA_F16 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_5900 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ALPHA_F16,
          srcPixelFormat: image.PixelMapFormat.ALPHA_F16
        }
        try {
          let pixelMap = image.createEmptyPixelMap(opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_F16);
          await pixelMap.release();
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
     * @tc.name   graphicImagePixelMapAPI2603_static_6000
     * @tc.number SUB_GRAPHIC_image_createPixelMap_static_6000
     * @tc.desc   createPixelMap ALPHA_F16 format Promise success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_6000 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(48);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ALPHA_F16,
          srcPixelFormat: image.PixelMapFormat.ALPHA_F16
        }
        image.createPixelMap(buffer, opts, (error: BusinessError | null, pixelMap: image.PixelMap | undefined) => {
          if(error) {
            console.error(msgStr + `Failed to create pixelmap. code is ${error.code}`);
            expect().assertFail();
            done();
          } else {
            console.info(msgStr + 'success ', pixelMap?.isEditable, pixelMap?.isStrideAlignment);
            expect(pixelMap?.isEditable).assertFalse();
            expect(pixelMap?.isStrideAlignment).assertFalse();
            pixelMap?.release();
            done();
          }
        })
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2603_static_6100
     * @tc.number SUB_GRAPHIC_image_convertPixelFormat_static_6100
     * @tc.desc   createPixelMap ALPHA_F16 format Promise success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2603_static_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2603_static_6100 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ALPHA_F16,
          srcPixelFormat: image.PixelMapFormat.ALPHA_F16
        }
        let pixelMap = image.createPixelMapSync(buffer, opts);
        try {
          await pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_F16);
          console.info(msgStr + 'end');
          expect().assertFail();
          done();
        } catch(error) {
          await pixelMap.release();
          console.error(msgStr + 'failed', error.code);
          expect(error.code).assertEqual(62980115);
          done();
        }
      })

  })
}
