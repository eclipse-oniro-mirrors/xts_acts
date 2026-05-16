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
import hilog from '@ohos.hilog'
import image from '@ohos.multimedia.image';
import { BusinessError } from '@ohos.base';

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function GraphicImagePixelMapAPI2602() {

  describe("GraphicImagePixelMapAPI2602", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   graphicImagePixelMapAPI2602_0100
     * @tc.number SUB_GRAPHIC_image_applyTranslate_API2602_0100
     * @tc.desc   applyTranslate positive direction success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_0100 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          await pixelMap.applyTranslate(10, 10);
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.size.width).assertEqual(16);
          expect(imgInfo.size.height).assertEqual(14);
          await pixelMap.release();
          console.info(msgStr + 'applyTranslate positive success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_0200
     * @tc.number SUB_GRAPHIC_image_applyTranslate_API2602_0200
     * @tc.desc   applyTranslate negative direction success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_0200 ';
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
          await pixelMap.applyTranslate(-5, -5);
          console.info(msgStr + 'applyTranslate negative success');
          console.info(msgStr + 'end');
          expect().assertFail();
          done();
        } catch (error) {
          await pixelMap.release();
          console.error(msgStr + 'failed', error.code);
          expect(error.code).assertEqual(7600301);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_0300
     * @tc.number SUB_GRAPHIC_image_applyTranslate_API2602_0300
     * @tc.desc   applyTranslate zero offset success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_0300 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          await pixelMap.applyTranslate(0, 0);
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.size.width).assertEqual(6);
          expect(imgInfo.size.height).assertEqual(4);
          await pixelMap.release();
          console.info(msgStr + 'applyTranslate zero success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_0400
     * @tc.number SUB_GRAPHIC_image_applyTranslate_API2602_0400
     * @tc.desc   applyTranslate only x direction success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_0400 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          await pixelMap.applyTranslate(10, 0);
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.size.width).assertEqual(16);
          expect(imgInfo.size.height).assertEqual(4);
          await pixelMap.release();
          console.info(msgStr + 'applyTranslate x only success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_0500
     * @tc.number SUB_GRAPHIC_image_applyTranslate_API2602_0500
     * @tc.desc   applyTranslate only y direction success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_0500 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          await pixelMap.applyTranslate(0, 10);
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.size.width).assertEqual(6);
          expect(imgInfo.size.height).assertEqual(14);
          await pixelMap.release();
          console.info(msgStr + 'applyTranslate y only success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_0600
     * @tc.number SUB_GRAPHIC_image_applyTranslate_API2602_0600
     * @tc.desc   applyTranslate verify size after translation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_0600 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          await pixelMap.applyTranslate(20, 30);
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.size.width).assertEqual(26);
          expect(imgInfo.size.height).assertEqual(34);
          await pixelMap.release();
          console.info(msgStr + 'applyTranslate verify size success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_0700
     * @tc.number SUB_GRAPHIC_image_applyTranslate_API2602_0700
     * @tc.desc   applyTranslate released pixelmap error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_0700 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          await pixelMap.release();
          await pixelMap.applyTranslate(10, 10);
          console.info(msgStr + 'applyTranslate released failed, expected error');
          expect().assertFail();
          done();
        } catch (error) {
          console.info(msgStr + 'applyTranslate released caught error', error.code);
          expect(error.code === 7600105).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_0800
     * @tc.number SUB_GRAPHIC_image_applyTranslateSync_API2602_0800
     * @tc.desc   applyTranslateSync positive direction success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_0800 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          pixelMap.applyTranslateSync(10, 10);
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.size.width).assertEqual(16);
          expect(imgInfo.size.height).assertEqual(14);
          await pixelMap.release();
          console.info(msgStr + 'applyTranslateSync positive success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_0900
     * @tc.number SUB_GRAPHIC_image_applyTranslateSync_API2602_0900
     * @tc.desc   applyTranslateSync negative direction success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_0900 ';
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
          pixelMap.applyTranslateSync(-5, -5);
          console.info(msgStr + 'applyTranslateSync negative success');
          console.info(msgStr + 'end');
          expect().assertFail();
          done();
        } catch (error) {
          await pixelMap.release();
          console.error(msgStr + 'failed', error.code);
          expect(error.code).assertEqual(7600301);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_1000
     * @tc.number SUB_GRAPHIC_image_applyTranslateSync_API2602_1000
     * @tc.desc   applyTranslateSync zero offset success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_1000 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          pixelMap.applyTranslateSync(0, 0);
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.size.width).assertEqual(6);
          expect(imgInfo.size.height).assertEqual(4);
          await pixelMap.release();
          console.info(msgStr + 'applyTranslateSync zero success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_1100
     * @tc.number SUB_GRAPHIC_image_applyTranslateSync_API2602_1100
     * @tc.desc   applyTranslateSync only x direction success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_1100 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          pixelMap.applyTranslateSync(10, 0);
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.size.width).assertEqual(16);
          expect(imgInfo.size.height).assertEqual(4);
          await pixelMap.release();
          console.info(msgStr + 'applyTranslateSync x only success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_1200
     * @tc.number SUB_GRAPHIC_image_applyTranslateSync_API2602_1200
     * @tc.desc   applyTranslateSync only y direction success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_1200 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          pixelMap.applyTranslateSync(0, 10);
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.size.width).assertEqual(6);
          expect(imgInfo.size.height).assertEqual(14);
          await pixelMap.release();
          console.info(msgStr + 'applyTranslateSync y only success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_1300
     * @tc.number SUB_GRAPHIC_image_applyTranslateSync_API2602_1300
     * @tc.desc   applyTranslateSync verify size after translation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_1300 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          pixelMap.applyTranslateSync(20, 30);
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.size.width).assertEqual(26);
          expect(imgInfo.size.height).assertEqual(34);
          await pixelMap.release();
          console.info(msgStr + 'applyTranslateSync verify size success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_1400
     * @tc.number SUB_GRAPHIC_image_applyTranslateSync_API2602_1400
     * @tc.desc   applyTranslateSync released pixelmap error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_1400 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          await pixelMap.release();
          pixelMap.applyTranslateSync(10, 10);
          console.info(msgStr + 'applyTranslateSync released failed, expected error');
          expect().assertFail();
          done();
        } catch (error) {
          console.info(msgStr + 'applyTranslateSync released caught error', error.code);
          expect(error.code === 7600105).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_1500
     * @tc.number SUB_GRAPHIC_image_applyRotate_1500
     * @tc.desc   applyRotate 90 degrees success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_1500 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          await pixelMap.applyRotate(90);
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.size.width).assertEqual(4);
          expect(imgInfo.size.height).assertEqual(6);
          await pixelMap.release();
          console.info(msgStr + 'applyRotate 90 success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_1600
     * @tc.number SUB_GRAPHIC_image_applyRotate_1600
     * @tc.desc   applyRotate 180 degrees success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_1600 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          await pixelMap.applyRotate(180);
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.size.width).assertEqual(6);
          expect(imgInfo.size.height).assertEqual(4);
          await pixelMap.release();
          console.info(msgStr + 'applyRotate 180 success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_1700
     * @tc.number SUB_GRAPHIC_image_applyRotate_1700
     * @tc.desc   applyRotate 270 degrees success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_1700 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          await pixelMap.applyRotate(270);
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.size.width).assertEqual(4);
          expect(imgInfo.size.height).assertEqual(6);
          await pixelMap.release();
          console.info(msgStr + 'applyRotate 270 success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_1800
     * @tc.number SUB_GRAPHIC_image_applyRotate_1800
     * @tc.desc   applyRotate 45 degrees success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_1800 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          await pixelMap.applyRotate(45);
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.size.width).assertLargerOrEqual(6);
          expect(imgInfo.size.height).assertLargerOrEqual(4);
          await pixelMap.release();
          console.info(msgStr + 'applyRotate 45 success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_1900
     * @tc.number SUB_GRAPHIC_image_applyRotate_1900
     * @tc.desc   applyRotate negative angle success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_1900 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          await pixelMap.applyRotate(-90);
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.size.width).assertEqual(4);
          expect(imgInfo.size.height).assertEqual(6);
          await pixelMap.release();
          console.info(msgStr + 'applyRotate negative success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_2000
     * @tc.number SUB_GRAPHIC_image_applyRotate_2000
     * @tc.desc   applyRotate zero angle success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_2000 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          await pixelMap.applyRotate(0);
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.size.width).assertEqual(6);
          expect(imgInfo.size.height).assertEqual(4);
          await pixelMap.release();
          console.info(msgStr + 'applyRotate zero success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_2100
     * @tc.number SUB_GRAPHIC_image_applyRotate_2100
     * @tc.desc   applyRotate released pixelmap error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_2100 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          await pixelMap.release();
          await pixelMap.applyRotate(90);
          console.info(msgStr + 'applyRotate released failed, expected error');
          expect().assertFail();
          done();
        } catch (error) {
          console.info(msgStr + 'applyRotate released caught error', error.code);
          expect(error.code === 7600105).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_2200
     * @tc.number SUB_GRAPHIC_image_applyRotateSync_2200
     * @tc.desc   applyRotateSync 90 degrees success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_2200 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          pixelMap.applyRotateSync(90);
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.size.width).assertEqual(4);
          expect(imgInfo.size.height).assertEqual(6);
          await pixelMap.release();
          console.info(msgStr + 'applyRotateSync 90 success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_2300
     * @tc.number SUB_GRAPHIC_image_applyRotateSync_2300
     * @tc.desc   applyRotateSync 180 degrees success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_2300 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          pixelMap.applyRotateSync(180);
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.size.width).assertEqual(6);
          expect(imgInfo.size.height).assertEqual(4);
          await pixelMap.release();
          console.info(msgStr + 'applyRotateSync 180 success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_2400
     * @tc.number SUB_GRAPHIC_image_applyRotateSync_2400
     * @tc.desc   applyRotateSync released pixelmap error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_2400 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          await pixelMap.release();
          pixelMap.applyRotateSync(90);
          console.info(msgStr + 'applyRotateSync released failed, expected error');
          expect().assertFail();
          done();
        } catch (error) {
          console.info(msgStr + 'applyRotateSync released caught error', error.code);
          expect(error.code === 7600105).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_2500
     * @tc.number SUB_GRAPHIC_image_applyFlip_2500
     * @tc.desc   applyFlip horizontal only success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_2500 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          await pixelMap.applyFlip(true, false);
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.size.width).assertEqual(6);
          expect(imgInfo.size.height).assertEqual(4);
          await pixelMap.release();
          console.info(msgStr + 'applyFlip horizontal success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_2600
     * @tc.number SUB_GRAPHIC_image_applyFlip_2600
     * @tc.desc   applyFlip vertical only success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_2600 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          await pixelMap.applyFlip(false, true);
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.size.width).assertEqual(6);
          expect(imgInfo.size.height).assertEqual(4);
          await pixelMap.release();
          console.info(msgStr + 'applyFlip vertical success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_2700
     * @tc.number SUB_GRAPHIC_image_applyFlip_2700
     * @tc.desc   applyFlip both directions success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_2700 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          await pixelMap.applyFlip(true, true);
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.size.width).assertEqual(6);
          expect(imgInfo.size.height).assertEqual(4);
          await pixelMap.release();
          console.info(msgStr + 'applyFlip both success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_2800
     * @tc.number SUB_GRAPHIC_image_applyFlip_2800
     * @tc.desc   applyFlip no flip success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_2800 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          await pixelMap.applyFlip(false, false);
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.size.width).assertEqual(6);
          expect(imgInfo.size.height).assertEqual(4);
          await pixelMap.release();
          console.info(msgStr + 'applyFlip no flip success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_2900
     * @tc.number SUB_GRAPHIC_image_applyFlip_2900
     * @tc.desc   applyFlip released pixelmap error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_2900 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          await pixelMap.release();
          await pixelMap.applyFlip(true, false);
          console.info(msgStr + 'applyFlip released failed, expected error');
          expect().assertFail();
          done();
        } catch (error) {
          console.info(msgStr + 'applyFlip released caught error', error.code);
          expect(error.code === 7600105).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_3000
     * @tc.number SUB_GRAPHIC_image_applyFlipSync_3000
     * @tc.desc   applyFlipSync horizontal only success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_3000 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          pixelMap.applyFlipSync(true, false);
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.size.width).assertEqual(6);
          expect(imgInfo.size.height).assertEqual(4);
          await pixelMap.release();
          console.info(msgStr + 'applyFlipSync horizontal success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_3100
     * @tc.number SUB_GRAPHIC_image_applyFlipSync_3100
     * @tc.desc   applyFlipSync vertical only success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_3100 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          pixelMap.applyFlipSync(false, true);
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.size.width).assertEqual(6);
          expect(imgInfo.size.height).assertEqual(4);
          await pixelMap.release();
          console.info(msgStr + 'applyFlipSync vertical success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_3200
     * @tc.number SUB_GRAPHIC_image_applyFlipSync_3200
     * @tc.desc   applyFlipSync both directions success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_3200 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          pixelMap.applyFlipSync(true, true);
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.size.width).assertEqual(6);
          expect(imgInfo.size.height).assertEqual(4);
          await pixelMap.release();
          console.info(msgStr + 'applyFlipSync both success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_3300
     * @tc.number SUB_GRAPHIC_image_applyFlipSync_3300
     * @tc.desc   applyFlipSync released pixelmap error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_3300 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          await pixelMap.release();
          pixelMap.applyFlipSync(true, false);
          console.info(msgStr + 'applyFlipSync released failed, expected error');
          expect().assertFail();
          done();
        } catch (error) {
          console.info(msgStr + 'applyFlipSync released caught error', error.code);
          expect(error.code === 7600105).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_3400
     * @tc.number SUB_GRAPHIC_image_applyCrop_3400
     * @tc.desc   applyCrop center region success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_3400 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          let region: image.Region = { x: 1, y: 1, size: { width: 4, height: 2 } };
          await pixelMap.applyCrop(region);
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.size.width).assertEqual(4);
          expect(imgInfo.size.height).assertEqual(2);
          await pixelMap.release();
          console.info(msgStr + 'applyCrop center success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_3500
     * @tc.number SUB_GRAPHIC_image_applyCrop_3500
     * @tc.desc   applyCrop full region success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_3500 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          let region: image.Region = { x: 0, y: 0, size: { width: 6, height: 4 } };
          await pixelMap.applyCrop(region);
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.size.width).assertEqual(6);
          expect(imgInfo.size.height).assertEqual(4);
          await pixelMap.release();
          console.info(msgStr + 'applyCrop full success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_3600
     * @tc.number SUB_GRAPHIC_image_applyCrop_3600
     * @tc.desc   applyCrop with offset success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_3600 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          let region: image.Region = { x: 2, y: 1, size: { width: 3, height: 2 } };
          await pixelMap.applyCrop(region);
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.size.width).assertEqual(3);
          expect(imgInfo.size.height).assertEqual(2);
          await pixelMap.release();
          console.info(msgStr + 'applyCrop offset success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_3700
     * @tc.number SUB_GRAPHIC_image_applyCrop_3700
     * @tc.desc   applyCrop released pixelmap error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_3700 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          await pixelMap.release();
          let region: image.Region = { x: 0, y: 0, size: { width: 2, height: 2 } };
          await pixelMap.applyCrop(region);
          console.info(msgStr + 'applyCrop released failed, expected error');
          expect().assertFail();
          done();
        } catch (error) {
          console.info(msgStr + 'applyCrop released caught error', error.code);
          expect(error.code === 7600105).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_3800
     * @tc.number SUB_GRAPHIC_image_applyCrop_3800
     * @tc.desc   applyCrop region out of range error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_3800 ';
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
          let region: image.Region = { x: 5, y: 3, size: { width: 3, height: 3 } };
          await pixelMap.applyCrop(region);
          console.info(msgStr + 'applyCrop out of range failed, expected error');
          expect().assertFail();
          done();
        } catch (error) {
          await pixelMap.release();
          console.info(msgStr + 'applyCrop out of range caught error', error.code);
          expect(error.code === 7600204).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_3900
     * @tc.number SUB_GRAPHIC_image_applyCropSync_3900
     * @tc.desc   applyCropSync center region success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_3900 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          let region: image.Region = { x: 1, y: 1, size: { width: 4, height: 2 } };
          pixelMap.applyCropSync(region);
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.size.width).assertEqual(4);
          expect(imgInfo.size.height).assertEqual(2);
          await pixelMap.release();
          console.info(msgStr + 'applyCropSync center success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_4000
     * @tc.number SUB_GRAPHIC_image_applyCropSync_4000
     * @tc.desc   applyCropSync full region success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_4000 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          let region: image.Region = { x: 0, y: 0, size: { width: 6, height: 4 } };
          pixelMap.applyCropSync(region);
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.size.width).assertEqual(6);
          expect(imgInfo.size.height).assertEqual(4);
          await pixelMap.release();
          console.info(msgStr + 'applyCropSync full success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_4100
     * @tc.number SUB_GRAPHIC_image_applyCropSync_4100
     * @tc.desc   applyCropSync released pixelmap error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_4100 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          await pixelMap.release();
          let region: image.Region = { x: 0, y: 0, size: { width: 2, height: 2 } };
          pixelMap.applyCropSync(region);
          console.info(msgStr + 'applyCropSync released failed, expected error');
          expect().assertFail();
          done();
        } catch (error) {
          console.info(msgStr + 'applyCropSync released caught error', error.code);
          expect(error.code === 7600105).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_4200
     * @tc.number SUB_GRAPHIC_image_applyCropSync_4200
     * @tc.desc   applyCropSync region out of range error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_4200 ';
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
          let region: image.Region = { x: 5, y: 3, size: { width: 3, height: 3 } };
          pixelMap.applyCropSync(region);
          console.info(msgStr + 'applyCropSync out of range failed, expected error');
          expect().assertFail();
          done();
        } catch (error) {
          await pixelMap.release();
          console.info(msgStr + 'applyCropSync out of range caught error', error.code);
          expect(error.code === 7600204).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_4300
     * @tc.number SUB_GRAPHIC_image_createEmptyPixelMap_4300
     * @tc.desc   createEmptyPixelMap UNKNOWN format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_4300 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.UNKNOWN,
          srcPixelFormat: image.PixelMapFormat.UNKNOWN
        }
        try {
          let pixelMap = image.createEmptyPixelMap(opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_4400
     * @tc.number SUB_GRAPHIC_image_createEmptyPixelMap_4400
     * @tc.desc   createEmptyPixelMap ARGB_8888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_4400 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ARGB_8888,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888
        }
        try {
          let pixelMap = image.createEmptyPixelMap(opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ARGB_8888);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_4500
     * @tc.number SUB_GRAPHIC_image_createEmptyPixelMap_4500
     * @tc.desc   createEmptyPixelMap RGB_565 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_4500 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGB_565,
          srcPixelFormat: image.PixelMapFormat.RGB_565
        }
        try {
          let pixelMap = image.createEmptyPixelMap(opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGB_565);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_4600
     * @tc.number SUB_GRAPHIC_image_createEmptyPixelMap_4600
     * @tc.desc   createEmptyPixelMap RGBA_8888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_4600 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888
        }
        try {
          let pixelMap = image.createEmptyPixelMap(opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_4700
     * @tc.number SUB_GRAPHIC_image_createEmptyPixelMap_4700
     * @tc.desc   createEmptyPixelMap BGRA_8888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_4700 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888
        }
        try {
          let pixelMap = image.createEmptyPixelMap(opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.BGRA_8888);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_4800
     * @tc.number SUB_GRAPHIC_image_createEmptyPixelMap_4800
     * @tc.desc   createEmptyPixelMap RGB_888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_4800 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGB_888,
          srcPixelFormat: image.PixelMapFormat.RGB_888
        }
        try {
          let pixelMap = image.createEmptyPixelMap(opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGB_888);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_4900
     * @tc.number SUB_GRAPHIC_image_createEmptyPixelMap_4900
     * @tc.desc   createEmptyPixelMap ALPHA_8 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_4900 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ALPHA_8,
          srcPixelFormat: image.PixelMapFormat.ALPHA_8
        }
        try {
          let pixelMap = image.createEmptyPixelMap(opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_8);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_5000
     * @tc.number SUB_GRAPHIC_image_createEmptyPixelMap_5000
     * @tc.desc   createEmptyPixelMap RGBA_F16 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_5000 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_F16,
          srcPixelFormat: image.PixelMapFormat.RGBA_F16
        }
        try {
          let pixelMap = image.createEmptyPixelMap(opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_F16);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_5100
     * @tc.number SUB_GRAPHIC_image_createEmptyPixelMap_5100
     * @tc.desc   createEmptyPixelMap NV21 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_5100 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.NV21,
          srcPixelFormat: image.PixelMapFormat.NV21
        }
        try {
          let pixelMap = image.createEmptyPixelMap(opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.NV21);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_5200
     * @tc.number SUB_GRAPHIC_image_createEmptyPixelMap_5200
     * @tc.desc   createEmptyPixelMap NV12 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_5200 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.NV12,
          srcPixelFormat: image.PixelMapFormat.NV12
        }
        try {
          let pixelMap = image.createEmptyPixelMap(opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.NV12);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_5300
     * @tc.number SUB_GRAPHIC_image_createEmptyPixelMap_5300
     * @tc.desc   createEmptyPixelMap RGBA_1010102 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_5300 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_1010102,
          srcPixelFormat: image.PixelMapFormat.RGBA_1010102
        }
        try {
          let pixelMap = image.createEmptyPixelMap(opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_1010102);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_5400
     * @tc.number SUB_GRAPHIC_image_createEmptyPixelMap_5400
     * @tc.desc   createEmptyPixelMap YCBCR_P010 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_5400 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.YCBCR_P010,
          srcPixelFormat: image.PixelMapFormat.YCBCR_P010
        }
        try {
          let pixelMap = image.createEmptyPixelMap(opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.YCBCR_P010);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_5500
     * @tc.number SUB_GRAPHIC_image_createEmptyPixelMap_5500
     * @tc.desc   createEmptyPixelMap YCRCB_P010 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_5500 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.YCRCB_P010,
          srcPixelFormat: image.PixelMapFormat.YCRCB_P010
        }
        try {
          let pixelMap = image.createEmptyPixelMap(opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.YCRCB_P010);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_5600
     * @tc.number SUB_GRAPHIC_image_createEmptyPixelMap_5600
     * @tc.desc   createEmptyPixelMap ALPHA_U8 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_5600 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ALPHA_U8,
          srcPixelFormat: image.PixelMapFormat.ALPHA_U8
        }
        try {
          let pixelMap = image.createEmptyPixelMap(opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_U8);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_5700
     * @tc.number SUB_GRAPHIC_image_createEmptyPixelMap_5700
     * @tc.desc   createEmptyPixelMap ASTC_4x4 format reset to RGBA_8888 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_5700 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.ASTC_4x4,
          srcPixelFormat: image.PixelMapFormat.ASTC_4x4
        }
        try {
          let pixelMap = image.createEmptyPixelMap(opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_5800
     * @tc.number SUB_GRAPHIC_image_createEmptyPixelMap_5800
     * @tc.desc   createEmptyPixelMap alphaType UNKNOWN success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_5800 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.UNKNOWN
        }
        try {
          let pixelMap = image.createEmptyPixelMap(opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_5900
     * @tc.number SUB_GRAPHIC_image_createEmptyPixelMap_5900
     * @tc.desc   createEmptyPixelMap alphaType OPAQUE success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_5900 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.OPAQUE
        }
        try {
          let pixelMap = image.createEmptyPixelMap(opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_6000
     * @tc.number SUB_GRAPHIC_image_createEmptyPixelMap_6000
     * @tc.desc   createEmptyPixelMap alphaType PREMUL success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_6000 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.PREMUL
        }
        try {
          let pixelMap = image.createEmptyPixelMap(opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_6100
     * @tc.number SUB_GRAPHIC_image_createEmptyPixelMap_6100
     * @tc.desc   createEmptyPixelMap alphaType UNPREMUL success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_6100 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.UNPREMUL
        }
        try {
          let pixelMap = image.createEmptyPixelMap(opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_6200
     * @tc.number SUB_GRAPHIC_image_createEmptyPixelMap_6200
     * @tc.desc   createEmptyPixelMap scaleMode FIT_TARGET_SIZE success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_6200 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE
        }
        try {
          let pixelMap = image.createEmptyPixelMap(opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_6300
     * @tc.number SUB_GRAPHIC_image_createEmptyPixelMap_6300
     * @tc.desc   createEmptyPixelMap scaleMode CENTER_CROP success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_6300 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          scaleMode: image.ScaleMode.CENTER_CROP
        }
        try {
          let pixelMap = image.createEmptyPixelMap(opts);
          expect(pixelMap !== undefined).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_6400
     * @tc.number SUB_GRAPHIC_image_createEmptyPixelMap_6400
     * @tc.desc   createEmptyPixelMap editable true success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_6400 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          editable: true
        }
        try {
          let pixelMap = image.createEmptyPixelMap(opts);
          expect(pixelMap !== undefined).assertTrue();
          expect(pixelMap.isEditable).assertTrue();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_6500
     * @tc.number SUB_GRAPHIC_image_createEmptyPixelMap_6500
     * @tc.desc   createEmptyPixelMap editable false success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_6500 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          editable: false
        }
        try {
          let pixelMap = image.createEmptyPixelMap(opts);
          expect(pixelMap !== undefined).assertTrue();
          expect(pixelMap.isEditable).assertFalse();
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_6600
     * @tc.number SUB_GRAPHIC_image_createEmptyPixelMap_6600
     * @tc.desc   createEmptyPixelMap verify isStrideAlignment success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_6600 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createEmptyPixelMap(opts);
          expect(pixelMap !== undefined).assertTrue();
          expect(typeof pixelMap.isStrideAlignment).assertEqual('boolean');
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_6700
     * @tc.number SUB_GRAPHIC_image_createEmptyPixelMap_6700
     * @tc.desc   createEmptyPixelMap verify pixelFormat matches opts test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_6700 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          pixelFormat: image.PixelMapFormat.RGBA_8888
        }
        try {
          let pixelMap = image.createEmptyPixelMap(opts);
          expect(pixelMap !== undefined).assertTrue();
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.pixelFormat).assertEqual(opts.pixelFormat);
          pixelMap.release();
          console.info(msgStr + 'success');
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_6800
     * @tc.number SUB_GRAPHIC_image_createEmptyPixelMap_6800
     * @tc.desc   createEmptyPixelMap invalid param error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_6800 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          size: { height: 0, width: 0 }
        }
        try {
          let pixelMap = image.createEmptyPixelMap(opts);
          console.info(msgStr + 'failed, expected error');
          expect().assertFail();
          done();
        } catch (error) {
          console.info(msgStr + 'caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        }
      })
      
    /**
     * @tc.name   graphicImagePixelMapAPI2602_6900
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_6900
     * @tc.desc   createPixelMapFromPixelsSync ASTC_4x4 reset to RGBA_8888 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_6900 ';
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
     * @tc.name   graphicImagePixelMapAPI2602_7000
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_7000
     * @tc.desc   createPixelMapFromPixelsSync alphaType UNKNOWN success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_7000 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.UNKNOWN
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
     * @tc.name   graphicImagePixelMapAPI2602_7100
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_7100
     * @tc.desc   createPixelMapFromPixelsSync alphaType OPAQUE success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_7100 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.OPAQUE
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
     * @tc.name   graphicImagePixelMapAPI2602_7200
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_7200
     * @tc.desc   createPixelMapFromPixelsSync alphaType PREMUL success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_7200 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.PREMUL
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
     * @tc.name   graphicImagePixelMapAPI2602_7300
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_7300
     * @tc.desc   createPixelMapFromPixelsSync alphaType UNPREMUL success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_7300 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.UNPREMUL
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
     * @tc.name   graphicImagePixelMapAPI2602_7400
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_7400
     * @tc.desc   createPixelMapFromPixelsSync scaleMode FIT_TARGET_SIZE success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_7400 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE
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
     * @tc.name   graphicImagePixelMapAPI2602_7500
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_7500
     * @tc.desc   createPixelMapFromPixelsSync scaleMode CENTER_CROP success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_7500 ';
        console.info(msgStr + 'begin');
        let buffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          scaleMode: image.ScaleMode.CENTER_CROP
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
     * @tc.name   graphicImagePixelMapAPI2602_7600
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_7600
     * @tc.desc   createPixelMapFromPixelsSync editable true success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_7600 ';
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
     * @tc.name   graphicImagePixelMapAPI2602_7700
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_7700
     * @tc.desc   createPixelMapFromPixelsSync editable false success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_7700 ';
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
     * @tc.name   graphicImagePixelMapAPI2602_7800
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixels_7800
     * @tc.desc   createPixelMapFromPixels ALPHA_F16 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_7800 ';
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
     * @tc.name   graphicImagePixelMapAPI2602_7900
     * @tc.number SUB_GRAPHIC_image_createPixelMapFromPixelsSync_7900
     * @tc.desc   createPixelMapFromPixelsSync ALPHA_F16 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_7900 ';
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
     * @tc.name   graphicImagePixelMapAPI2602_8000
     * @tc.number SUB_GRAPHIC_image_createPixelMap_8000
     * @tc.desc   createPixelMap ALPHA_F16 format Promise success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_8000 ';
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
     * @tc.name   graphicImagePixelMapAPI2602_8100
     * @tc.number SUB_GRAPHIC_image_createPixelMapSync_8100
     * @tc.desc   createPixelMapSync ALPHA_F16 format with colors success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_8100 ';
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
     * @tc.name   graphicImagePixelMapAPI2602_8200
     * @tc.number SUB_GRAPHIC_image_createPixelMapSync_8200
     * @tc.desc   createPixelMapSync ALPHA_F16 format without colors success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_8200 ';
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
     * @tc.name   graphicImagePixelMapAPI2602_8300
     * @tc.number SUB_GRAPHIC_image_createPixelMapUsingAllocator_8300
     * @tc.desc   createPixelMapUsingAllocator ALPHA_F16 format AUTO allocator success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_8300 ';
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
     * @tc.name   graphicImagePixelMapAPI2602_8400
     * @tc.number SUB_GRAPHIC_image_createPixelMapUsingAllocatorSync_8400
     * @tc.desc   createPixelMapUsingAllocatorSync ALPHA_F16 format with colors AUTO allocator success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_8400 ';
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
     * @tc.name   graphicImagePixelMapAPI2602_8500
     * @tc.number SUB_GRAPHIC_image_createPixelMapUsingAllocatorSync_8500
     * @tc.desc   createPixelMapUsingAllocatorSync ALPHA_F16 format without colors AUTO allocator success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_8500 ';
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
     * @tc.name   graphicImagePixelMapAPI2602_8600
     * @tc.number SUB_GRAPHIC_image_createEmptyPixelMap_8600
     * @tc.desc   createEmptyPixelMap ALPHA_F16 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_8600 ';
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
     * @tc.name   graphicImagePixelMapAPI2602_8700
     * @tc.number SUB_GRAPHIC_image_createPixelMap_8700
     * @tc.desc   createPixelMap ALPHA_F16 format Promise success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_8700 ';
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
            expect(pixelMap?.isEditable).assertTrue();
            expect(pixelMap?.isStrideAlignment).assertFalse();
            pixelMap?.release();
            done();
          }
        })
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2602_8800
     * @tc.number SUB_GRAPHIC_image_convertPixelFormat_8800
     * @tc.desc   createPixelMap ALPHA_F16 format Promise success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2602_8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2602_8800 ';
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
          console.error(msgStr + 'failed', error);
          expect(error).assertEqual(62980115);
          done();
        }
      })

  })
}