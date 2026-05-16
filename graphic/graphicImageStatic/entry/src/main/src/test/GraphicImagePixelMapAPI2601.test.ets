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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import image from '@ohos.multimedia.image';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function GraphicImagePixelMapAPI2601(): void {

  describe("GraphicImagePixelMapAPI2601", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_0100
     * @tc.number SUB_GRAPHIC_image_createPixelMap_API2601_static_0100
     * @tc.desc   createPixelMap ALPHA_U8 format Promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_0100 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(24);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.ALPHA_U8,
          pixelFormat: image.PixelMapFormat.ALPHA_U8,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          console.info(msgStr + 'createPixelMap success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          console.info(msgStr + 'release success', imgInfo.pixelFormat, image.PixelMapFormat.ALPHA_U8);
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_U8);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_0200
     * @tc.number SUB_GRAPHIC_image_createPixelMap_API2601_static_0200
     * @tc.desc   createPixelMap ALPHA_U8 format Callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_0200 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(24);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.ALPHA_U8,
          pixelFormat: image.PixelMapFormat.ALPHA_U8,
          size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMap(color, opts, (error:BusinessError | null, pixelMap:image.PixelMap | undefined) => {
            if (error) {
              console.error(msgStr + 'createPixelMap failed', error.code, error.message);
              expect().assertFail();
              done();
            } else {
              console.info(msgStr + 'createPixelMap success', pixelMap?.isEditable, pixelMap?.isStrideAlignment);
              expect(pixelMap?.isEditable).assertTrue();
              expect(pixelMap?.isStrideAlignment).assertFalse();
              pixelMap?.release();
              done();
            }
          });
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_0300
     * @tc.number SUB_GRAPHIC_image_createPixelMap_API2601_static_0300
     * @tc.desc   createPixelMap default srcPixelFormat to ALPHA_U8 Promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_0300 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.ALPHA_U8,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          console.info(msgStr + 'createPixelMap success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_U8);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_0400
     * @tc.number SUB_GRAPHIC_image_createPixelMapSync_API2601_static_0400
     * @tc.desc   createPixelMapSync ALPHA_U8 format editable true test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_0400 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(24);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.ALPHA_U8,
          pixelFormat: image.PixelMapFormat.ALPHA_U8,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapSync(color, opts);
          console.info(msgStr + 'createPixelMapSync success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_U8);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_0500
     * @tc.number SUB_GRAPHIC_image_createPixelMapSync_API2601_static_0500
     * @tc.desc   createPixelMapSync ALPHA_U8 format editable true test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_0500 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.ALPHA_U8,
          pixelFormat: image.PixelMapFormat.ALPHA_U8,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapSync(opts);
          console.info(msgStr + 'createPixelMapSync success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_U8);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_0600
     * @tc.number SUB_GRAPHIC_image_createPixelMap_API2601UsingAllocator_static_0600
     * @tc.desc   createPixelMapUsingAllocator ALPHA_U8 format AUTO allocator test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_0600 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(24);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.ALPHA_U8,
          pixelFormat: image.PixelMapFormat.ALPHA_U8,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
          console.info(msgStr + 'createPixelMapUsingAllocator success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_U8);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_0700
     * @tc.number SUB_GRAPHIC_image_createPixelMap_API2601UsingAllocatorSync_static_0700
     * @tc.desc   createPixelMapUsingAllocatorSync ALPHA_U8 format with colors AUTO allocator test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_0700 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(24);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.ALPHA_U8,
          pixelFormat: image.PixelMapFormat.ALPHA_U8,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
          console.info(msgStr + 'createPixelMapUsingAllocatorSync success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_U8);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_0800
     * @tc.number SUB_GRAPHIC_image_createPixelMap_API2601UsingAllocatorSync_static_0800
     * @tc.desc   createPixelMapUsingAllocatorSync ALPHA_U8 format without colors AUTO allocator test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_0800 ';
        console.info(msgStr + 'begin');
        let opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.ALPHA_U8,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
          console.info(msgStr + 'createPixelMapUsingAllocatorSync success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_U8);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_0900
     * @tc.number SUB_GRAPHIC_image_convertPixelFormat_API2601_static_0900
     * @tc.desc   convertPixelFormat RGBA_8888 to ALPHA_U8 Promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_0900 ';
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
          await pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_U8);
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

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_1000
     * @tc.number SUB_GRAPHIC_image_readAllPixelsToBuffer_API2601_static_1000
     * @tc.desc   readAllPixelsToBuffer RGBA_8888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_1000 ';
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
          let buffer = new ArrayBuffer(96);
          await pixelMap.readAllPixelsToBuffer(buffer);
          console.info(msgStr + 'readAllPixelsToBuffer success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_1100
     * @tc.number SUB_GRAPHIC_image_readAllPixelsToBuffer_API2601_static_1100
     * @tc.desc   readAllPixelsToBuffer ALPHA_U8 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_1100 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(24);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.ALPHA_U8,
          pixelFormat: image.PixelMapFormat.ALPHA_U8,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          let buffer = new ArrayBuffer(24);
          await pixelMap.readAllPixelsToBuffer(buffer);
          console.info(msgStr + 'readAllPixelsToBuffer success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_1200
     * @tc.number SUB_GRAPHIC_image_readAllPixelsToBuffer_API2601_static_1200
     * @tc.desc   readAllPixelsToBuffer buffer size too small error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_1200 ';
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
          let buffer = new ArrayBuffer(10);
          await pixelMap.readAllPixelsToBuffer(buffer);
          console.info(msgStr + 'readAllPixelsToBuffer failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          await pixelMap.release();
          console.info(msgStr + 'readAllPixelsToBuffer caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_1300
     * @tc.number SUB_GRAPHIC_image_readAllPixelsToBuffer_API2601_static_1300
     * @tc.desc   readAllPixelsToBuffer released pixelmap error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_1300 ';
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
          let buffer = new ArrayBuffer(96);
          await pixelMap.readAllPixelsToBuffer(buffer);
          console.info(msgStr + 'readAllPixelsToBuffer failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'readAllPixelsToBuffer caught error', error.code);
          expect(error.code === 7600105).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_1400
     * @tc.number SUB_GRAPHIC_image_readAllPixelsToBufferSync_API2601_static_1400
     * @tc.desc   readAllPixelsToBufferSync RGBA_8888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_1400 ';
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
          let buffer = new ArrayBuffer(96);
          pixelMap.readAllPixelsToBufferSync(buffer);
          console.info(msgStr + 'readAllPixelsToBufferSync success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_1500
     * @tc.number SUB_GRAPHIC_image_readAllPixelsToBufferSync_API2601_static_1500
     * @tc.desc   readAllPixelsToBufferSync ALPHA_U8 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_1500 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(24);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.ALPHA_U8,
          pixelFormat: image.PixelMapFormat.ALPHA_U8,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          let buffer = new ArrayBuffer(24);
          pixelMap.readAllPixelsToBufferSync(buffer);
          console.info(msgStr + 'readAllPixelsToBufferSync success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_1600
     * @tc.number SUB_GRAPHIC_image_readAllPixelsToBufferSync_API2601_static_1600
     * @tc.desc   readAllPixelsToBufferSync buffer size too small error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_1600 ';
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
          let buffer = new ArrayBuffer(10);
          pixelMap.readAllPixelsToBufferSync(buffer);
          console.info(msgStr + 'readAllPixelsToBufferSync failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          await pixelMap.release();
          console.info(msgStr + 'readAllPixelsToBufferSync caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_1700
     * @tc.number SUB_GRAPHIC_image_readAllPixelsToBufferSync_API2601_static_1700
     * @tc.desc   readAllPixelsToBufferSync released pixelmap error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_1700 ';
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
          let buffer = new ArrayBuffer(96);
          pixelMap.readAllPixelsToBufferSync(buffer);
          console.info(msgStr + 'readAllPixelsToBufferSync failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'readAllPixelsToBufferSync caught error', error.code);
          expect(error.code === 7600105).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_1800
     * @tc.number SUB_GRAPHIC_image_readPixelsToArea_API2601_static_1800
     * @tc.desc   readPixelsToArea RGBA_8888 format region read success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_1800 ';
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
          let buffer = new ArrayBuffer(16);
          let area: image.PositionArea = {
            pixels: buffer,
            offset: 0,
            stride: 8,
            region: { x: 0, y: 0, size: { width: 2, height: 2 } }
          };
          await pixelMap.readPixelsToArea(area);
          console.info(msgStr + 'readPixelsToArea success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_1900
     * @tc.number SUB_GRAPHIC_image_readPixelsToArea_API2601_static_1900
     * @tc.desc   readPixelsToArea ALPHA_U8 format region read success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_1900 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(24);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.ALPHA_U8,
          pixelFormat: image.PixelMapFormat.ALPHA_U8,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          let buffer = new ArrayBuffer(4);  // buffer >= 读取区域（region.size{width * height}）* 4
          let area: image.PositionArea = {
            pixels: buffer,
            offset: 0,
            stride: 4, // stride >= region.size.width*4
            region: { x: 0, y: 0, size: { width: 1, height: 1 } }
          };
          await pixelMap.readPixelsToArea(area);
          console.info(msgStr + 'readPixelsToArea success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_2000
     * @tc.number SUB_GRAPHIC_image_readPixelsToArea_API2601_static_2000
     * @tc.desc   readPixelsToArea buffer size too small error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_2000 ';
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
          let buffer = new ArrayBuffer(4);
          let area: image.PositionArea = {
            pixels: buffer,
            offset: 0,
            stride: 8,
            region: { x: 0, y: 0, size: { width: 2, height: 2 } }
          };
          await pixelMap.readPixelsToArea(area);
          console.info(msgStr + 'readPixelsToArea failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          await pixelMap.release();
          console.info(msgStr + 'readPixelsToArea caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_2100
     * @tc.number SUB_GRAPHIC_image_readPixelsToArea_API2601_static_2100
     * @tc.desc   readPixelsToArea released pixelmap error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_2100 ';
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
          let buffer = new ArrayBuffer(16);
          let area: image.PositionArea = {
            pixels: buffer,
            offset: 0,
            stride: 8,
            region: { x: 0, y: 0, size: { width: 2, height: 2 } }
          };
          await pixelMap.readPixelsToArea(area);
          console.info(msgStr + 'readPixelsToArea failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'readPixelsToArea caught error', error.code);
          expect(error.code === 7600105).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_2200
     * @tc.number SUB_GRAPHIC_image_readPixelsToAreaSync_API2601_static_2200
     * @tc.desc   readPixelsToAreaSync RGBA_8888 format region read success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_2200 ';
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
          let buffer = new ArrayBuffer(16);
          let area: image.PositionArea = {
            pixels: buffer,
            offset: 0,
            stride: 8,
            region: { x: 0, y: 0, size: { width: 2, height: 2 } }
          };
          pixelMap.readPixelsToAreaSync(area);
          console.info(msgStr + 'readPixelsToAreaSync success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_2300
     * @tc.number SUB_GRAPHIC_image_readPixelsToAreaSync_API2601_static_2300
     * @tc.desc   readPixelsToAreaSync ALPHA_U8 format region read success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_2300 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(24);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.ALPHA_U8,
          pixelFormat: image.PixelMapFormat.ALPHA_U8,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          let buffer = new ArrayBuffer(4);
          let area: image.PositionArea = {
            pixels: buffer,
            offset: 0,
            stride: 4,
            region: { x: 0, y: 0, size: { width: 1, height: 1 } }
          };
          pixelMap.readPixelsToAreaSync(area);
          console.info(msgStr + 'readPixelsToAreaSync success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_2400
     * @tc.number SUB_GRAPHIC_image_readPixelsToAreaSync_API2601_static_2400
     * @tc.desc   readPixelsToAreaSync buffer size too small error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_2400 ';
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
          let buffer = new ArrayBuffer(4);
          let area: image.PositionArea = {
            pixels: buffer,
            offset: 0,
            stride: 8,
            region: { x: 0, y: 0, size: { width: 2, height: 2 } }
          };
          pixelMap.readPixelsToAreaSync(area);
          console.info(msgStr + 'readPixelsToAreaSync failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          await pixelMap.release();
          console.info(msgStr + 'readPixelsToAreaSync caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_2500
     * @tc.number SUB_GRAPHIC_image_readPixelsToAreaSync_API2601_static_2500
     * @tc.desc   readPixelsToAreaSync released pixelmap error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_2500 ';
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
          let buffer = new ArrayBuffer(16);
          let area: image.PositionArea = {
            pixels: buffer,
            offset: 0,
            stride: 8,
            region: { x: 0, y: 0, size: { width: 2, height: 2 } }
          };
          pixelMap.readPixelsToAreaSync(area);
          console.info(msgStr + 'readPixelsToAreaSync failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'readPixelsToAreaSync caught error', error.code);
          expect(error.code === 7600105).assertTrue();
          done();
        }
      })




    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_2600
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_API2601_static_2600
     * @tc.desc   writePixelsFromArea RGBA_8888 format basic write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_2600 ';
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
          let writeBuffer: ArrayBuffer = new ArrayBuffer(16);
          let writeArr: Uint8Array = new Uint8Array(writeBuffer);
          for (let i = 0; i < writeArr.length; i++) {
            writeArr[i] = i + 1;
          }
          let area: image.PositionArea = {
            pixels: writeBuffer,
            offset: 0,
            stride: 8,
            region: { x: 0, y: 0, size: { width: 2, height: 2 } }
          };
          await pixelMap.writePixelsFromArea(area);
          console.info(msgStr + 'writePixelsFromArea success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_2700
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_API2601_static_2700
     * @tc.desc   writePixelsFromArea write to partial region test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_2700 ';
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
          let writeBuffer: ArrayBuffer = new ArrayBuffer(16);
          let writeArr: Uint8Array = new Uint8Array(writeBuffer);
          for (let i = 0; i < writeArr.length; i++) {
            writeArr[i] = i + 10;
          }
          let area: image.PositionArea = {
            pixels: writeBuffer,
            offset: 0,
            stride: 8,
            region: { x: 2, y: 1, size: { width: 2, height: 2 } }
          };
          await pixelMap.writePixelsFromArea(area);
          console.info(msgStr + 'writePixelsFromArea partial region success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_2800
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_API2601_static_2800
     * @tc.desc   writePixelsFromArea with offset write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_2800 ';
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
          let writeBuffer: ArrayBuffer = new ArrayBuffer(32);
          let writeArr: Uint8Array = new Uint8Array(writeBuffer);
          for (let i = 0; i < writeArr.length; i++) {
            writeArr[i] = i + 1;
          }
          let area: image.PositionArea = {
            pixels: writeBuffer,
            offset: 8,
            stride: 8,
            region: { x: 0, y: 0, size: { width: 2, height: 2 } }
          };
          await pixelMap.writePixelsFromArea(area);
          console.info(msgStr + 'writePixelsFromArea with offset success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_2900
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_API2601_static_2900
     * @tc.desc   writePixelsFromArea verify data consistency test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_2900 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          console.info(msgStr + 'begin 111');
          let pixelMap = await image.createPixelMap(color, opts);
          let writeBuffer: ArrayBuffer = new ArrayBuffer(16);
          let writeArr: Uint8Array = new Uint8Array(writeBuffer);
          for (let i = 0; i < writeArr.length; i++) {
            writeArr[i] = i + 1;
          }
          let writeArea: image.PositionArea = {
            pixels: writeBuffer,
            offset: 0,
            stride: 8,
            region: { x: 0, y: 0, size: { width: 2, height: 2 } }
          };
          console.info(msgStr + 'begin 444');
          await pixelMap.writePixelsFromArea(writeArea);
          let readBuffer: ArrayBuffer = new ArrayBuffer(16);
          console.info(msgStr + 'begin 666');
          let readArea: image.PositionArea = {
            pixels: readBuffer,
            offset: 0,
            stride: 8,
            region: { x: 0, y: 0, size: { width: 2, height: 2 } }
          };
          await pixelMap.readPixelsToArea(readArea);
          console.info(msgStr + 'writePixelsFromArea data verify success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_3000
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_API2601_static_3000
     * @tc.desc   writePixelsFromArea released pixelmap error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_3000 ';
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
          let writeBuffer: ArrayBuffer = new ArrayBuffer(16);
          let area: image.PositionArea = {
            pixels: writeBuffer,
            offset: 0,
            stride: 8,
            region: { x: 0, y: 0, size: { width: 2, height: 2 } }
          };
          await pixelMap.writePixelsFromArea(area);
          console.info(msgStr + 'writePixelsFromArea failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'writePixelsFromArea caught error', error.code);
          expect(error.code === 7600105).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_3100
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_API2601_static_3100
     * @tc.desc   writePixelsFromArea buffer size too small error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_3100 ';
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
          let writeBuffer: ArrayBuffer = new ArrayBuffer(4);
          let area: image.PositionArea = {
            pixels: writeBuffer,
            offset: 0,
            stride: 8,
            region: { x: 0, y: 0, size: { width: 2, height: 2 } }
          };
          await pixelMap.writePixelsFromArea(area);
          console.info(msgStr + 'writePixelsFromArea failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          await pixelMap.release();
          console.info(msgStr + 'writePixelsFromArea caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_3200
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_API2601_static_3200
     * @tc.desc   writePixelsFromArea region out of range error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_3200 ';
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
          let writeBuffer: ArrayBuffer = new ArrayBuffer(64);
          let area: image.PositionArea = {
            pixels: writeBuffer,
            offset: 0,
            stride: 8,
            region: { x: 5, y: 3, size: { width: 2, height: 2 } }
          };
          await pixelMap.writePixelsFromArea(area);
          console.info(msgStr + 'writePixelsFromArea failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          await pixelMap.release();
          console.info(msgStr + 'writePixelsFromArea caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_3300
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_API2601_static_3300
     * @tc.desc   writePixelsFromArea non-editable pixelmap error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_3300 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap = await image.createPixelMap(color, opts);
        try {
          let writeBuffer: ArrayBuffer = new ArrayBuffer(16);
          let area: image.PositionArea = {
            pixels: writeBuffer,
            offset: 0,
            stride: 8,
            region: { x: 0, y: 0, size: { width: 2, height: 2 } }
          };
          await pixelMap.writePixelsFromArea(area);
          console.info(msgStr + 'writePixelsFromArea failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          await pixelMap.release();
          console.info(msgStr + 'writePixelsFromArea caught error', error.code);
          expect(error.code === 7600201).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_3400
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_API2601_static_3400
     * @tc.desc   writePixelsFromAreaSync RGBA_8888 format basic write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_3400 ';
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
          let writeBuffer: ArrayBuffer = new ArrayBuffer(16);
          let writeArr: Uint8Array = new Uint8Array(writeBuffer);
          for (let i = 0; i < writeArr.length; i++) {
            writeArr[i] = i + 1;
          }
          let area: image.PositionArea = {
            pixels: writeBuffer,
            offset: 0,
            stride: 8,
            region: { x: 0, y: 0, size: { width: 2, height: 2 } }
          };
          pixelMap.writePixelsFromAreaSync(area);
          console.info(msgStr + 'writePixelsFromAreaSync success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_3500
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_API2601_static_3500
     * @tc.desc   writePixelsFromAreaSync write to partial region test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_3500 ';
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
          let writeBuffer: ArrayBuffer = new ArrayBuffer(16);
          let writeArr: Uint8Array = new Uint8Array(writeBuffer);
          for (let i = 0; i < writeArr.length; i++) {
            writeArr[i] = i + 10;
          }
          let area: image.PositionArea = {
            pixels: writeBuffer,
            offset: 0,
            stride: 8,
            region: { x: 2, y: 1, size: { width: 2, height: 2 } }
          };
          pixelMap.writePixelsFromAreaSync(area);
          console.info(msgStr + 'writePixelsFromAreaSync partial region success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_3600
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_API2601_static_3600
     * @tc.desc   writePixelsFromAreaSync with offset write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_3600 ';
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
          let writeBuffer: ArrayBuffer = new ArrayBuffer(32);
          let writeArr: Uint8Array = new Uint8Array(writeBuffer);
          for (let i = 0; i < writeArr.length; i++) {
            writeArr[i] = i + 1;
          }
          let area: image.PositionArea = {
            pixels: writeBuffer,
            offset: 8,
            stride: 8,
            region: { x: 0, y: 0, size: { width: 2, height: 2 } }
          };
          pixelMap.writePixelsFromAreaSync(area);
          console.info(msgStr + 'writePixelsFromAreaSync with offset success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_3700
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_API2601_static_3700
     * @tc.desc   writePixelsFromAreaSync verify data consistency test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_3700 ';
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
          let writeBuffer: ArrayBuffer = new ArrayBuffer(16);
          let writeArr: Uint8Array = new Uint8Array(writeBuffer);
          for (let i = 0; i < writeArr.length; i++) {
            writeArr[i] = i + 1;
          }
          let writeArea: image.PositionArea = {
            pixels: writeBuffer,
            offset: 0,
            stride: 8,
            region: { x: 0, y: 0, size: { width: 2, height: 2 } }
          };
          pixelMap.writePixelsFromAreaSync(writeArea);
          let readBuffer: ArrayBuffer = new ArrayBuffer(16);
          let readArea: image.PositionArea = {
            pixels: readBuffer,
            offset: 0,
            stride: 8,
            region: { x: 0, y: 0, size: { width: 2, height: 2 } }
          };
          pixelMap.readPixelsToAreaSync(readArea);
          console.info(msgStr + 'writePixelsFromAreaSync data verify success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_3800
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_API2601_static_3800
     * @tc.desc   writePixelsFromAreaSync released pixelmap error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_3800 ';
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
          let writeBuffer: ArrayBuffer = new ArrayBuffer(16);
          let area: image.PositionArea = {
            pixels: writeBuffer,
            offset: 0,
            stride: 8,
            region: { x: 0, y: 0, size: { width: 2, height: 2 } }
          };
          pixelMap.writePixelsFromAreaSync(area);
          console.info(msgStr + 'writePixelsFromAreaSync failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'writePixelsFromAreaSync caught error', error.code);
          expect(error.code === 7600105).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_3900
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_API2601_static_3900
     * @tc.desc   writePixelsFromAreaSync buffer size too small error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_3900 ';
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
          let writeBuffer: ArrayBuffer = new ArrayBuffer(4);
          let area: image.PositionArea = {
            pixels: writeBuffer,
            offset: 0,
            stride: 8,
            region: { x: 0, y: 0, size: { width: 2, height: 2 } }
          };
          pixelMap.writePixelsFromAreaSync(area);
          console.info(msgStr + 'writePixelsFromAreaSync failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          await pixelMap.release();
          console.info(msgStr + 'writePixelsFromAreaSync caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_4000
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_API2601_static_4000
     * @tc.desc   writePixelsFromAreaSync region out of range error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_4000 ';
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
          let writeBuffer: ArrayBuffer = new ArrayBuffer(64);
          let area: image.PositionArea = {
            pixels: writeBuffer,
            offset: 0,
            stride: 8,
            region: { x: 5, y: 3, size: { width: 2, height: 2 } }
          };
          pixelMap.writePixelsFromAreaSync(area);
          console.info(msgStr + 'writePixelsFromAreaSync failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          await pixelMap.release();
          console.info(msgStr + 'writePixelsFromAreaSync caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_4100
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_API2601_static_4100
     * @tc.desc   writePixelsFromAreaSync non-editable pixelmap error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_4100 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap = await image.createPixelMap(color, opts);
        try {
          let writeBuffer: ArrayBuffer = new ArrayBuffer(16);
          let area: image.PositionArea = {
            pixels: writeBuffer,
            offset: 0,
            stride: 8,
            region: { x: 0, y: 0, size: { width: 2, height: 2 } }
          };
          pixelMap.writePixelsFromAreaSync(area);
          console.info(msgStr + 'writePixelsFromAreaSync failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          await pixelMap.release();
          console.info(msgStr + 'writePixelsFromAreaSync caught error', error.code);
          expect(error.code === 7600201).assertTrue();
          done();
        }
      })



    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_4200
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_API2601_static_4200
     * @tc.desc   writeAllPixelsFromBuffer RGBA_8888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_4200 ';
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
          let writeBuffer: ArrayBuffer = new ArrayBuffer(96);
          let writeArr: Uint8Array = new Uint8Array(writeBuffer);
          for (let i = 0; i < writeArr.length; i++) {
            writeArr[i] = i + 1;
          }
          await pixelMap.writeAllPixelsFromBuffer(writeBuffer);
          console.info(msgStr + 'writeAllPixelsFromBuffer success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_4300
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_API2601_static_4300
     * @tc.desc   writeAllPixelsFromBuffer ALPHA_U8 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_4300 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(24);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.ALPHA_U8,
          pixelFormat: image.PixelMapFormat.ALPHA_U8,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          let writeBuffer: ArrayBuffer = new ArrayBuffer(24);
          let writeArr: Uint8Array = new Uint8Array(writeBuffer);
          for (let i = 0; i < writeArr.length; i++) {
            writeArr[i] = i + 1;
          }
          await pixelMap.writeAllPixelsFromBuffer(writeBuffer);
          console.info(msgStr + 'writeAllPixelsFromBuffer success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_4400
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_API2601_static_4400
     * @tc.desc   writeAllPixelsFromBuffer verify data consistency test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_4400 ';
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
          let writeBuffer: ArrayBuffer = new ArrayBuffer(96);
          let writeArr: Uint8Array = new Uint8Array(writeBuffer);
          for (let i = 0; i < writeArr.length; i++) {
            writeArr[i] = i + 1;
          }
          await pixelMap.writeAllPixelsFromBuffer(writeBuffer);
          let readBuffer: ArrayBuffer = new ArrayBuffer(96);
          await pixelMap.readAllPixelsToBuffer(readBuffer);
          let readArr: Uint8Array = new Uint8Array(readBuffer);
          let isMatch: boolean = true;
          for (let i = 0; i < writeArr.length; i++) {
            if (writeArr[i] !== readArr[i]) {
              isMatch = false;
              break;
            }
          }
          expect(isMatch).assertTrue();
          console.info(msgStr + 'writeAllPixelsFromBuffer data verify success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_4500
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_API2601_static_4500
     * @tc.desc   writeAllPixelsFromBuffer released pixelmap error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_4500 ';
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
          let writeBuffer: ArrayBuffer = new ArrayBuffer(96);
          await pixelMap.writeAllPixelsFromBuffer(writeBuffer);
          console.info(msgStr + 'writeAllPixelsFromBuffer failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'writeAllPixelsFromBuffer caught error', error.code);
          expect(error.code === 7600105).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_4600
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_API2601_static_4600
     * @tc.desc   writeAllPixelsFromBuffer buffer size too small error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_4600 ';
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
          let writeBuffer: ArrayBuffer = new ArrayBuffer(10);
          await pixelMap.writeAllPixelsFromBuffer(writeBuffer);
          console.info(msgStr + 'writeAllPixelsFromBuffer failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          await pixelMap.release();
          console.info(msgStr + 'writeAllPixelsFromBuffer caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_4700
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_API2601_static_4700
     * @tc.desc   writeAllPixelsFromBuffer non-editable pixelmap error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_4700 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap = await image.createPixelMap(color, opts);
        try {
          let writeBuffer: ArrayBuffer = new ArrayBuffer(96);
          await pixelMap.writeAllPixelsFromBuffer(writeBuffer);
          console.info(msgStr + 'writeAllPixelsFromBuffer failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          await pixelMap.release();
          console.info(msgStr + 'writeAllPixelsFromBuffer caught error', error.code);
          expect(error.code === 7600201).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_4800
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_API2601_static_4800
     * @tc.desc   writeAllPixelsFromBufferSync RGBA_8888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_4800 ';
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
          let writeBuffer: ArrayBuffer = new ArrayBuffer(96);
          let writeArr: Uint8Array = new Uint8Array(writeBuffer);
          for (let i = 0; i < writeArr.length; i++) {
            writeArr[i] = i + 1;
          }
          pixelMap.writeAllPixelsFromBufferSync(writeBuffer);
          console.info(msgStr + 'writeAllPixelsFromBufferSync success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_4900
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_API2601_static_4900
     * @tc.desc   writeAllPixelsFromBufferSync ALPHA_U8 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_4900 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(24);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.ALPHA_U8,
          pixelFormat: image.PixelMapFormat.ALPHA_U8,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          let writeBuffer: ArrayBuffer = new ArrayBuffer(24);
          let writeArr: Uint8Array = new Uint8Array(writeBuffer);
          for (let i = 0; i < writeArr.length; i++) {
            writeArr[i] = i + 1;
          }
          pixelMap.writeAllPixelsFromBufferSync(writeBuffer);
          console.info(msgStr + 'writeAllPixelsFromBufferSync success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_5000
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_API2601_static_5000
     * @tc.desc   writeAllPixelsFromBufferSync verify data consistency test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_5000 ';
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
          let writeBuffer: ArrayBuffer = new ArrayBuffer(96);
          let writeArr: Uint8Array = new Uint8Array(writeBuffer);
          for (let i = 0; i < writeArr.length; i++) {
            writeArr[i] = i + 1;
          }
          pixelMap.writeAllPixelsFromBufferSync(writeBuffer);
          let readBuffer: ArrayBuffer = new ArrayBuffer(96);
          pixelMap.readAllPixelsToBufferSync(readBuffer);
          let readArr: Uint8Array = new Uint8Array(readBuffer);
          let isMatch: boolean = true;
          for (let i = 0; i < writeArr.length; i++) {
            if (writeArr[i] !== readArr[i]) {
              isMatch = false;
              break;
            }
          }
          expect(isMatch).assertTrue();
          console.info(msgStr + 'writeAllPixelsFromBufferSync data verify success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_5100
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_API2601_static_5100
     * @tc.desc   writeAllPixelsFromBufferSync released pixelmap error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_5100 ';
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
          let writeBuffer: ArrayBuffer = new ArrayBuffer(96);
          pixelMap.writeAllPixelsFromBufferSync(writeBuffer);
          console.info(msgStr + 'writeAllPixelsFromBufferSync failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'writeAllPixelsFromBufferSync caught error', error.code);
          expect(error.code === 7600105).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_5200
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_API2601_static_5200
     * @tc.desc   writeAllPixelsFromBufferSync buffer size too small error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_5200 ';
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
          let writeBuffer: ArrayBuffer = new ArrayBuffer(10);
          pixelMap.writeAllPixelsFromBufferSync(writeBuffer);
          console.info(msgStr + 'writeAllPixelsFromBufferSync failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          await pixelMap.release();
          console.info(msgStr + 'writeAllPixelsFromBufferSync caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_5300
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_API2601_static_5300
     * @tc.desc   writeAllPixelsFromBufferSync non-editable pixelmap error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_5300 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap = await image.createPixelMap(color, opts);
        try {
          let writeBuffer: ArrayBuffer = new ArrayBuffer(96);
          pixelMap.writeAllPixelsFromBufferSync(writeBuffer);
          console.info(msgStr + 'writeAllPixelsFromBufferSync failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          await pixelMap.release();
          console.info(msgStr + 'writeAllPixelsFromBufferSync caught error', error.code);
          expect(error.code === 7600201).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_5400
     * @tc.number SUB_GRAPHIC_image_setOpacity_API2601_static_5400
     * @tc.desc   setOpacity value 1.0 fully opaque success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_5400 ';
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
          await pixelMap.setOpacity(1.0);
          console.info(msgStr + 'setOpacity 1.0 success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_5500
     * @tc.number SUB_GRAPHIC_image_setOpacity_API2601_static_5500
     * @tc.desc   setOpacity value 0.5 half transparent success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_5500 ';
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
          await pixelMap.setOpacity(0.5);
          console.info(msgStr + 'setOpacity 0.5 success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_5600
     * @tc.number SUB_GRAPHIC_image_setOpacity_API2601_static_5600
     * @tc.desc   setOpacity value near 0 success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_5600 ';
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
          await pixelMap.setOpacity(0.001);
          console.info(msgStr + 'setOpacity 0.001 success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_5700
     * @tc.number SUB_GRAPHIC_image_setOpacity_API2601_static_5700
     * @tc.desc   setOpacity ALPHA_U8 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_5700 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(24);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.ALPHA_U8,
          pixelFormat: image.PixelMapFormat.ALPHA_U8,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          await pixelMap.setOpacity(0.8);
          console.info(msgStr + 'setOpacity ALPHA_U8 success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_5800
     * @tc.number SUB_GRAPHIC_image_setOpacity_API2601_static_5800
     * @tc.desc   setOpacity value 0 out of range error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_5800 ';
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
          await pixelMap.setOpacity(0.0);
          console.info(msgStr + 'setOpacity 0 failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          await pixelMap.release();
          console.info(msgStr + 'setOpacity 0 caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_5900
     * @tc.number SUB_GRAPHIC_image_setOpacity_API2601_static_5900
     * @tc.desc   setOpacity negative value error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_5900 ';
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
          await pixelMap.setOpacity(-0.5);
          console.info(msgStr + 'setOpacity negative failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          await pixelMap.release();
          console.info(msgStr + 'setOpacity negative caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_6000
     * @tc.number SUB_GRAPHIC_image_setOpacity_API2601_static_6000
     * @tc.desc   setOpacity value greater than 1 error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_6000 ';
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
          await pixelMap.setOpacity(1.5);
          console.info(msgStr + 'setOpacity 1.5 failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          await pixelMap.release();
          console.info(msgStr + 'setOpacity 1.5 caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_6100
     * @tc.number SUB_GRAPHIC_image_setOpacity_API2601_static_6100
     * @tc.desc   setOpacity released pixelmap error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_6100 ';
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
          await pixelMap.setOpacity(0.5);
          console.info(msgStr + 'setOpacity released failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'setOpacity released caught error', error.code);
          expect(error.code === 7600105).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_6200
     * @tc.number SUB_GRAPHIC_image_setOpacity_API2601_static_6200
     * @tc.desc   setOpacity NV21 format unsupported error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_6200 ';
        console.info(msgStr + 'begin');
        const pixelBytes: int = 4 * 6 * 6;
        const color: ArrayBuffer = new ArrayBuffer(pixelBytes);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.NV21,
          pixelFormat: image.PixelMapFormat.NV21,
          size: { height: 4, width: 6 }
        }
        let pixelMap = await image.createPixelMap(color, opts);
        try {
          await pixelMap.setOpacity(0.5);
          console.info(msgStr + 'setOpacity NV21 failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          await pixelMap.release();
          console.info(msgStr + 'setOpacity NV21 caught error', error.code);
          expect(error.code === 7600207).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_6300
     * @tc.number SUB_GRAPHIC_image_setOpacitySync_API2601_static_6300
     * @tc.desc   setOpacitySync value 1.0 fully opaque success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_6300 ';
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
          pixelMap.setOpacitySync(1.0);
          console.info(msgStr + 'setOpacitySync 1.0 success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_6400
     * @tc.number SUB_GRAPHIC_image_setOpacitySync_API2601_static_6400
     * @tc.desc   setOpacitySync value 0.5 half transparent success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_6400 ';
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
          pixelMap.setOpacitySync(0.5);
          console.info(msgStr + 'setOpacitySync 0.5 success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_6500
     * @tc.number SUB_GRAPHIC_image_setOpacitySync_API2601_static_6500
     * @tc.desc   setOpacitySync value near 0 success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_6500 ';
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
          pixelMap.setOpacitySync(0.001);
          console.info(msgStr + 'setOpacitySync 0.001 success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_6600
     * @tc.number SUB_GRAPHIC_image_setOpacitySync_API2601_static_6600
     * @tc.desc   setOpacitySync value 0 out of range error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_6600 ';
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
          pixelMap.setOpacitySync(0.0);
          console.info(msgStr + 'setOpacitySync 0 failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          await pixelMap.release();
          console.info(msgStr + 'setOpacitySync 0 caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_6700
     * @tc.number SUB_GRAPHIC_image_setOpacitySync_API2601_static_6700
     * @tc.desc   setOpacitySync negative value error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_6700 ';
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
          pixelMap.setOpacitySync(-0.5);
          console.info(msgStr + 'setOpacitySync negative failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          await pixelMap.release();
          console.info(msgStr + 'setOpacitySync negative caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_6800
     * @tc.number SUB_GRAPHIC_image_setOpacitySync_API2601_static_6800
     * @tc.desc   setOpacitySync value greater than 1 error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_6800 ';
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
          pixelMap.setOpacitySync(1.5);
          console.info(msgStr + 'setOpacitySync 1.5 failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          await pixelMap.release();
          console.info(msgStr + 'setOpacitySync 1.5 caught error', error.code);
          expect(error.code === 7600206).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_6900
     * @tc.number SUB_GRAPHIC_image_setOpacitySync_API2601_static_6900
     * @tc.desc   setOpacitySync released pixelmap error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_6900 ';
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
          pixelMap.setOpacitySync(0.5);
          console.info(msgStr + 'setOpacitySync released failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'setOpacitySync released caught error', error.code);
          expect(error.code === 7600105).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_7000
     * @tc.number SUB_GRAPHIC_image_setOpacitySync_API2601_static_7000
     * @tc.desc   setOpacitySync NV21 format unsupported error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_7000 ';
        console.info(msgStr + 'begin');
        const pixelBytes: int = 4 * 6 * 6;
        const color: ArrayBuffer = new ArrayBuffer(pixelBytes);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.NV21,
          pixelFormat: image.PixelMapFormat.NV21,
          size: { height: 4, width: 6 }
        }
        let pixelMap = await image.createPixelMap(color, opts);
        try {
          pixelMap.setOpacitySync(0.5);
          console.info(msgStr + 'setOpacitySync NV21 failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          await pixelMap.release();
          console.info(msgStr + 'setOpacitySync NV21 caught error', error.code);
          expect(error.code === 7600207).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_7100
     * @tc.number SUB_GRAPHIC_image_extractAlphaPixelMap_API2601_static_7100
     * @tc.desc   extractAlphaPixelMap RGBA_8888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_7100 ';
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
          let alphaPixelMap: image.PixelMap = await pixelMap.extractAlphaPixelMap();
          expect(alphaPixelMap !== undefined).assertTrue();
          await alphaPixelMap.release();
          await pixelMap.release();
          console.info(msgStr + 'extractAlphaPixelMap success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_7200
     * @tc.number SUB_GRAPHIC_image_extractAlphaPixelMap_API2601_static_7200
     * @tc.desc   extractAlphaPixelMap BGRA_8888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_7200 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          let alphaPixelMap: image.PixelMap = await pixelMap.extractAlphaPixelMap();
          expect(alphaPixelMap !== undefined).assertTrue();
          await alphaPixelMap.release();
          await pixelMap.release();
          console.info(msgStr + 'extractAlphaPixelMap BGRA_8888 success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_7300
     * @tc.number SUB_GRAPHIC_image_extractAlphaPixelMap_API2601_static_7300
     * @tc.desc   extractAlphaPixelMap verify returned format is ALPHA_U8 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_7300 ';
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
          let alphaPixelMap: image.PixelMap = await pixelMap.extractAlphaPixelMap();
          let imgInfo: image.ImageInfo = await alphaPixelMap.getImageInfo();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_U8);
          await alphaPixelMap.release();
          await pixelMap.release();
          console.info(msgStr + 'verify format success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_7400
     * @tc.number SUB_GRAPHIC_image_extractAlphaPixelMap_API2601_static_7400
     * @tc.desc   extractAlphaPixelMap verify returned pixelmap is not editable test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_7400 ';
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
          let alphaPixelMap: image.PixelMap = await pixelMap.extractAlphaPixelMap();
          expect(alphaPixelMap.isEditable).assertFalse();
          await alphaPixelMap.release();
          await pixelMap.release();
          console.info(msgStr + 'verify not editable success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_7500
     * @tc.number SUB_GRAPHIC_image_extractAlphaPixelMap_API2601_static_7500
     * @tc.desc   extractAlphaPixelMap verify returned size matches original test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_7500 ';
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
          let alphaPixelMap: image.PixelMap = await pixelMap.extractAlphaPixelMap();
          let alphaInfo: image.ImageInfo = await alphaPixelMap.getImageInfo();
          expect(alphaInfo.size.width).assertEqual(6);
          expect(alphaInfo.size.height).assertEqual(4);
          await alphaPixelMap.release();
          await pixelMap.release();
          console.info(msgStr + 'verify size success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_7600
     * @tc.number SUB_GRAPHIC_image_extractAlphaPixelMap_API2601_static_7600
     * @tc.desc   extractAlphaPixelMap released pixelmap error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_7600 ';
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
          await pixelMap.extractAlphaPixelMap();
          console.info(msgStr + 'extractAlphaPixelMap released failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'extractAlphaPixelMap released caught error', error.code);
          expect(error.code === 7600105).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_7700
     * @tc.number SUB_GRAPHIC_image_extractAlphaPixelMapSync_API2601_static_7700
     * @tc.desc   extractAlphaPixelMapSync RGBA_8888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_7700 ';
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
          let alphaPixelMap: image.PixelMap = pixelMap.extractAlphaPixelMapSync();
          expect(alphaPixelMap !== undefined).assertTrue();
          await alphaPixelMap.release();
          await pixelMap.release();
          console.info(msgStr + 'extractAlphaPixelMapSync success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_7800
     * @tc.number SUB_GRAPHIC_image_extractAlphaPixelMapSync_API2601_static_7800
     * @tc.desc   extractAlphaPixelMapSync BGRA_8888 format success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_7800 ';
        console.info(msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts);
          let alphaPixelMap: image.PixelMap = pixelMap.extractAlphaPixelMapSync();
          expect(alphaPixelMap !== undefined).assertTrue();
          await alphaPixelMap.release();
          await pixelMap.release();
          console.info(msgStr + 'extractAlphaPixelMapSync BGRA_8888 success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_7900
     * @tc.number SUB_GRAPHIC_image_extractAlphaPixelMapSync_API2601_static_7900
     * @tc.desc   extractAlphaPixelMapSync verify returned format is ALPHA_U8 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_7900 ';
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
          let alphaPixelMap: image.PixelMap = pixelMap.extractAlphaPixelMapSync();
          let imgInfo: image.ImageInfo = alphaPixelMap.getImageInfoSync();
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_U8);
          alphaPixelMap.release();
          await pixelMap.release();
          console.info(msgStr + 'verify format sync success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_8000
     * @tc.number SUB_GRAPHIC_image_extractAlphaPixelMapSync_API2601_static_8000
     * @tc.desc   extractAlphaPixelMapSync verify returned pixelmap is not editable test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_8000 ';
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
          let alphaPixelMap: image.PixelMap = pixelMap.extractAlphaPixelMapSync();
          expect(alphaPixelMap.isEditable).assertFalse();
          alphaPixelMap.release();
          await pixelMap.release();
          console.info(msgStr + 'verify not editable sync success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_8100
     * @tc.number SUB_GRAPHIC_image_extractAlphaPixelMapSync_API2601_static_8100
     * @tc.desc   extractAlphaPixelMapSync verify returned size matches original test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_8100 ';
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
          let alphaPixelMap: image.PixelMap = pixelMap.extractAlphaPixelMapSync();
          let alphaInfo: image.ImageInfo = alphaPixelMap.getImageInfoSync();
          expect(alphaInfo.size.width).assertEqual(6);
          expect(alphaInfo.size.height).assertEqual(4);
          alphaPixelMap.release();
          await pixelMap.release();
          console.info(msgStr + 'verify size sync success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_8200
     * @tc.number SUB_GRAPHIC_image_extractAlphaPixelMapSync_API2601_static_8200
     * @tc.desc   extractAlphaPixelMapSync released pixelmap error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_8200 ';
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
          pixelMap.extractAlphaPixelMapSync();
          console.info(msgStr + 'extractAlphaPixelMapSync released failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'extractAlphaPixelMapSync released caught error', error.code);
          expect(error.code === 7600105).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_8300
     * @tc.number SUB_GRAPHIC_image_applyScale_API2601_static_8300
     * @tc.desc   applyScale scale up 2.0x success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_8300 ';
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
          await pixelMap.applyScale(2.0, 2.0);
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.size.width).assertEqual(12);
          expect(imgInfo.size.height).assertEqual(8);
          await pixelMap.release();
          console.info(msgStr + 'applyScale up success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_8400
     * @tc.number SUB_GRAPHIC_image_applyScale_API2601_static_8400
     * @tc.desc   applyScale scale down 0.5x success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_8400 ';
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
          await pixelMap.applyScale(0.5, 0.5);
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.size.width).assertEqual(3);
          expect(imgInfo.size.height).assertEqual(2);
          await pixelMap.release();
          console.info(msgStr + 'applyScale down success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_8500
     * @tc.number SUB_GRAPHIC_image_applyScale_API2601_static_8500
     * @tc.desc   applyScale with AntiAliasingLevel NONE success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_8500 ';
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
          await pixelMap.applyScale(1.5, 1.5, image.AntiAliasingLevel.NONE);
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.size.width).assertEqual(9);
          expect(imgInfo.size.height).assertEqual(6);
          await pixelMap.release();
          console.info(msgStr + 'applyScale NONE success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_8600
     * @tc.number SUB_GRAPHIC_image_applyScale_API2601_static_8600
     * @tc.desc   applyScale with AntiAliasingLevel LOW success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_8600 ';
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
          await pixelMap.applyScale(1.5, 1.5, image.AntiAliasingLevel.LOW);
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.size.width).assertEqual(9);
          expect(imgInfo.size.height).assertEqual(6);
          await pixelMap.release();
          console.info(msgStr + 'applyScale LOW success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_8700
     * @tc.number SUB_GRAPHIC_image_applyScale_API2601_static_8700
     * @tc.desc   applyScale with AntiAliasingLevel MEDIUM success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_8700 ';
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
          await pixelMap.applyScale(1.5, 1.5, image.AntiAliasingLevel.MEDIUM);
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.size.width).assertEqual(9);
          expect(imgInfo.size.height).assertEqual(6);
          await pixelMap.release();
          console.info(msgStr + 'applyScale MEDIUM success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_8800
     * @tc.number SUB_GRAPHIC_image_applyScale_API2601_static_8800
     * @tc.desc   applyScale with AntiAliasingLevel HIGH success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_8800 ';
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
          await pixelMap.applyScale(1.5, 1.5, image.AntiAliasingLevel.HIGH);
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.size.width).assertEqual(9);
          expect(imgInfo.size.height).assertEqual(6);
          await pixelMap.release();
          console.info(msgStr + 'applyScale HIGH success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_8900
     * @tc.number SUB_GRAPHIC_image_applyScale_API2601_static_8900
     * @tc.desc   applyScale verify size after scaling test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_8900 ';
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
          await pixelMap.applyScale(3.0, 2.0);
          let imgInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imgInfo.size.width).assertEqual(18);
          expect(imgInfo.size.height).assertEqual(8);
          await pixelMap.release();
          console.info(msgStr + 'verify size success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_9000
     * @tc.number SUB_GRAPHIC_image_applyScale_API2601_static_9000
     * @tc.desc   applyScale released pixelmap error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_9000 ';
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
          await pixelMap.applyScale(1.0, 1.0);
          console.info(msgStr + 'applyScale released failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'applyScale released caught error', error.code);
          expect(error.code === 7600105).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_9100
     * @tc.number SUB_GRAPHIC_image_applyScaleSync_API2601_static_9100
     * @tc.desc   applyScaleSync scale up 2.0x success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_9100 ';
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
          pixelMap.applyScaleSync(2.0, 2.0);
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.size.width).assertEqual(12);
          expect(imgInfo.size.height).assertEqual(8);
          await pixelMap.release();
          console.info(msgStr + 'applyScaleSync up success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_9200
     * @tc.number SUB_GRAPHIC_image_applyScaleSync_API2601_static_9200
     * @tc.desc   applyScaleSync scale down 0.5x success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_9200 ';
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
          pixelMap.applyScaleSync(0.5, 0.5);
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.size.width).assertEqual(3);
          expect(imgInfo.size.height).assertEqual(2);
          await pixelMap.release();
          console.info(msgStr + 'applyScaleSync down success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_9300
     * @tc.number SUB_GRAPHIC_image_applyScaleSync_API2601_static_9300
     * @tc.desc   applyScaleSync with AntiAliasingLevel NONE success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_9300 ';
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
          pixelMap.applyScaleSync(1.5, 1.5, image.AntiAliasingLevel.NONE);
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.size.width).assertEqual(9);
          expect(imgInfo.size.height).assertEqual(6);
          await pixelMap.release();
          console.info(msgStr + 'applyScaleSync NONE success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_9400
     * @tc.number SUB_GRAPHIC_image_applyScaleSync_API2601_static_9400
     * @tc.desc   applyScaleSync with AntiAliasingLevel LOW success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_9400 ';
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
          pixelMap.applyScaleSync(1.5, 1.5, image.AntiAliasingLevel.LOW);
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.size.width).assertEqual(9);
          expect(imgInfo.size.height).assertEqual(6);
          await pixelMap.release();
          console.info(msgStr + 'applyScaleSync LOW success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_9500
     * @tc.number SUB_GRAPHIC_image_applyScaleSync_API2601_static_9500
     * @tc.desc   applyScaleSync with AntiAliasingLevel MEDIUM success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_9500 ';
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
          pixelMap.applyScaleSync(1.5, 1.5, image.AntiAliasingLevel.MEDIUM);
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.size.width).assertEqual(9);
          expect(imgInfo.size.height).assertEqual(6);
          await pixelMap.release();
          console.info(msgStr + 'applyScaleSync MEDIUM success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_9600
     * @tc.number SUB_GRAPHIC_image_applyScaleSync_API2601_static_9600
     * @tc.desc   applyScaleSync with AntiAliasingLevel HIGH success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_9600 ';
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
          pixelMap.applyScaleSync(1.5, 1.5, image.AntiAliasingLevel.HIGH);
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.size.width).assertEqual(9);
          expect(imgInfo.size.height).assertEqual(6);
          await pixelMap.release();
          console.info(msgStr + 'applyScaleSync HIGH success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_9700
     * @tc.number SUB_GRAPHIC_image_applyScaleSync_API2601_static_9700
     * @tc.desc   applyScaleSync verify size after scaling test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_9700 ';
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
          pixelMap.applyScaleSync(3.0, 2.0);
          let imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imgInfo.size.width).assertEqual(18);
          expect(imgInfo.size.height).assertEqual(8);
          await pixelMap.release();
          console.info(msgStr + 'verify size sync success');
          console.info(msgStr + 'end');
          done();
        } catch(error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMapAPI2601_static_9800
     * @tc.number SUB_GRAPHIC_image_applyScaleSync_API2601_static_9800
     * @tc.desc   applyScaleSync released pixelmap error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMapAPI2601_static_9800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImagePixelMapAPI2601_static_9800 ';
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
          pixelMap.applyScaleSync(1.0, 1.0);
          console.info(msgStr + 'applyScaleSync released failed, expected error');
          expect().assertFail();
          done();
        } catch(error) {
          console.info(msgStr + 'applyScaleSync released caught error', error.code);
          expect(error.code === 7600105).assertTrue();
          done();
        }
      })

  })
}
