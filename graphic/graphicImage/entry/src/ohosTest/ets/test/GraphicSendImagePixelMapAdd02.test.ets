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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "@ohos/hypium"
import hilog from '@ohos.hilog'
import image from '@ohos.multimedia.image';
import { sendableImage } from '@kit.ImageKit';
import rpc from '@ohos.rpc';
import { BusinessError } from '@ohos.base';
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

class MySequence1 implements rpc.Parcelable {
  pixel_map: sendableImage.PixelMap;
  constructor(conPixelmap: sendableImage.PixelMap) {
    this.pixel_map = conPixelmap;
  }
  marshalling(messageSequence: rpc.MessageSequence) {
    this.pixel_map.marshalling(messageSequence);
    return true;
  }
  unmarshalling(messageSequence: rpc.MessageSequence) {
    try {
      this.pixel_map = sendableImage.createPixelMapFromParcel(messageSequence);
      console.error(`www data createPixelMapFromParcel success.`);
      expect(this.pixel_map.isEditable).assertFalse();
      expect(this.pixel_map.isStrideAlignment).assertFalse();
      this.pixel_map.release();
    } catch(e) {
      let error = e as BusinessError;
      console.error(`www data createPixelMapFromParcel error. code is ${error.code}, message is ${error.message}`);
      return false;
    }
    return true;
  }
}

class MySequence2 implements rpc.Parcelable {
  pixel_map: sendableImage.PixelMap;
  constructor(conPixelmap: sendableImage.PixelMap) {
    this.pixel_map = conPixelmap;
  }
  marshalling(messageSequence: rpc.MessageSequence) {
    this.pixel_map.marshalling(messageSequence);
    return true;
  }
  unmarshalling(messageSequence: rpc.MessageSequence) {
    try {
      this.pixel_map = sendableImage.createPixelMapFromParcel(messageSequence);
      console.error(`www data createPixelMapFromParcel success.`);
      expect(this.pixel_map.isEditable).assertTrue();
      expect(this.pixel_map.isStrideAlignment).assertTrue();
      this.pixel_map.release();
    } catch(e) {
      let error = e as BusinessError;
      console.error(`www data createPixelMapFromParcel error. code is ${error.code}, message is ${error.message}`);
      return false;
    }
    return true;
  }
}

class MySequence3 implements rpc.Parcelable {
  pixel_map: sendableImage.PixelMap;
  constructor(conPixelMap: sendableImage.PixelMap) {
    this.pixel_map = conPixelMap;
  }
  marshalling(messageSequence: rpc.MessageSequence) {
    this.pixel_map.marshalling(messageSequence);
    console.info('marshalling');
    return true;
  }
  unmarshalling(messageSequence: rpc.MessageSequence) {
    console.info('www data unmarshalling 11 ');
    sendableImage.createPixelMap(new ArrayBuffer(96), {size: { height:4, width: 6}}).then((pixelParcel : sendableImage.PixelMap) => {
      console.info('www data unmarshalling 22 ');
      pixelParcel.unmarshalling(messageSequence).then(async (pixelMap : sendableImage.PixelMap) => {
        this.pixel_map = pixelMap;
        expect(this.pixel_map.isEditable).assertTrue();
        expect(this.pixel_map.isStrideAlignment).assertTrue();
        await pixelMap.getImageInfo().then(async (imageInfo : image.ImageInfo) => {
          console.info("unmarshalling information h:" + imageInfo.size.height + "w:" + imageInfo.size.width);
          await pixelMap.release();
          await this.pixel_map.release();
          await pixelParcel.release();
        })
      }).catch((err: BusinessError) => {
        console.info('www data unmarshalling error ', err);
        expect(err).assertEqual(62980096);
      })
    });
    return true;
  }
}

class MySequence4 implements rpc.Parcelable {
  pixel_map: sendableImage.PixelMap;
  constructor(conPixelMap: sendableImage.PixelMap) {
    this.pixel_map = conPixelMap;
  }
  marshalling(messageSequence: rpc.MessageSequence) {
    this.pixel_map.marshalling(messageSequence);
    console.info('marshalling');
    return true;
  }
  unmarshalling(messageSequence: rpc.MessageSequence) {
    console.info('www data unmarshalling 11 ');
    sendableImage.createPixelMap(new ArrayBuffer(96), {size: { height:4, width: 6}}).then((pixelParcel : sendableImage.PixelMap) => {
      console.info('www data unmarshalling 22 ');
      pixelParcel.unmarshalling(messageSequence).then(async (pixelMap : sendableImage.PixelMap) => {
        this.pixel_map = pixelMap;
        expect(this.pixel_map.isEditable).assertFalse();
        expect(this.pixel_map.isStrideAlignment).assertFalse();
        await pixelMap.getImageInfo().then(async (imageInfo : image.ImageInfo) => {
          console.info("unmarshalling information h:" + imageInfo.size.height + "w:" + imageInfo.size.width);
          await pixelMap.release();
          await this.pixel_map.release();
          await pixelParcel.release();
        })
      }).catch((err: BusinessError) => {
        console.info('www data unmarshalling error ', err);
        expect(err).assertEqual(62980096);
      })
    });
    return true;
  }
}

export default function GraphicSendImagePixelMapAdd02() {

  describe("GraphicSendImagePixelMapAdd02", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(() => {
    })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0100
     * @tc.number sendableImagePixelMapAdd02_0100
     * @tc.desc   sendableImage API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data sendableImagePixelMapAdd02_0100 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.UNKNOWN,
          pixelFormat: image.PixelMapFormat.UNKNOWN,
          alphaType: image.AlphaType.UNKNOWN,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap: sendableImage.PixelMap = await sendableImage.createPixelMap(color, opts);
          console.info(msgStr + 'success ', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          await pixelMap.release();
          done();
        } catch(err){
          console.info(msgStr + 'failed ', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0101
     * @tc.number sendableImagePixelMapAdd02_0101
     * @tc.desc   sendableImage API - srcPixelFormat: ARGB_8888, pixelFormat: ARGB_8888, editable: false, alphaType: OPAQUE, scaleMode: FIT_TARGET_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data sendableImagePixelMapAdd02_0101 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.ARGB_8888,
          editable: false,
          alphaType: image.AlphaType.OPAQUE,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE
        };
        try {
          let pixelMap: sendableImage.PixelMap = await sendableImage.createPixelMap(color, opts);
          console.info(msgStr + 'success ', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();
          await pixelMap.release();
          done();
        } catch(err){
          console.info(msgStr + 'failed ', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0102
     * @tc.number sendableImagePixelMapAdd02_0102
     * @tc.desc   sendableImage API - srcPixelFormat: RGB_565, pixelFormat: RGB_565, editable: true, alphaType: PREMUL, scaleMode: CENTER_CROP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data sendableImagePixelMapAdd02_0102 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          srcPixelFormat: image.PixelMapFormat.RGB_565,
          pixelFormat: image.PixelMapFormat.RGB_565,
          editable: true,
          alphaType: image.AlphaType.PREMUL,
          scaleMode: image.ScaleMode.CENTER_CROP
        };
        try {
          let pixelMap: sendableImage.PixelMap = await sendableImage.createPixelMap(color, opts);
          console.info(msgStr + 'success ', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          await pixelMap.release();
          done();
        } catch(err){
          console.info(msgStr + 'failed ', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0103
     * @tc.number sendableImagePixelMapAdd02_0103
     * @tc.desc   sendableImage API - srcPixelFormat: RGBA_8888, pixelFormat: RGBA_8888, editable: false, alphaType: UNPREMUL, scaleMode: FIT_TARGET_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data sendableImagePixelMapAdd02_0103 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: false,
          alphaType: image.AlphaType.UNPREMUL,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE
        };
        try {
          let pixelMap: sendableImage.PixelMap = await sendableImage.createPixelMap(color, opts);
          console.info(msgStr + 'success ', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();
          await pixelMap.release();
          done();
        } catch(err){
          console.info(msgStr + 'failed ', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0104
     * @tc.number sendableImagePixelMapAdd02_0104
     * @tc.desc   sendableImage API - srcPixelFormat: BGRA_8888, pixelFormat: BGRA_8888, editable: true, alphaType: OPAQUE, scaleMode: CENTER_CROP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data sendableImagePixelMapAdd02_0104 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          editable: true,
          alphaType: image.AlphaType.OPAQUE,
          scaleMode: image.ScaleMode.CENTER_CROP
        };
        try {
          let pixelMap: sendableImage.PixelMap = await sendableImage.createPixelMap(color, opts);
          console.info(msgStr + 'success ', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          await pixelMap.release();
          done();
        } catch(err){
          console.info(msgStr + 'failed ', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0105
     * @tc.number sendableImagePixelMapAdd02_0105
     * @tc.desc   sendableImage API - srcPixelFormat: RGB_888, pixelFormat: RGB_888, editable: false, alphaType: PREMUL, scaleMode: FIT_TARGET_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data sendableImagePixelMapAdd02_0105 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          srcPixelFormat: image.PixelMapFormat.RGB_888,
          pixelFormat: image.PixelMapFormat.RGB_888,
          editable: false,
          alphaType: image.AlphaType.PREMUL,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE
        };
        try {
          let pixelMap: sendableImage.PixelMap = await sendableImage.createPixelMap(color, opts);
          console.info(msgStr + 'success ', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();
          await pixelMap.release();
          done();
        } catch(err){
          console.info(msgStr + 'failed ', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0106
     * @tc.number sendableImagePixelMapAdd02_0106
     * @tc.desc   sendableImage API - srcPixelFormat: ALPHA_8, pixelFormat: ALPHA_8, editable: true, alphaType: UNPREMUL, scaleMode: CENTER_CROP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data sendableImagePixelMapAdd02_0106 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          srcPixelFormat: image.PixelMapFormat.ALPHA_8,
          pixelFormat: image.PixelMapFormat.ALPHA_8,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL,
          scaleMode: image.ScaleMode.CENTER_CROP
        };
        try {
          let pixelMap: sendableImage.PixelMap = await sendableImage.createPixelMap(color, opts);
          console.info(msgStr + 'success ', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          await pixelMap.release();
          done();
        } catch(err){
          console.info(msgStr + 'failed ', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0107
     * @tc.number sendableImagePixelMapAdd02_0107
     * @tc.desc   sendableImage API - srcPixelFormat: RGBA_F16, pixelFormat: RGBA_F16, editable: false, alphaType: OPAQUE, scaleMode: FIT_TARGET_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data sendableImagePixelMapAdd02_0107 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_F16,
          pixelFormat: image.PixelMapFormat.RGBA_F16,
          editable: false,
          alphaType: image.AlphaType.OPAQUE,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE
        };
        try {
          let pixelMap: sendableImage.PixelMap = await sendableImage.createPixelMap(color, opts);
          console.info(msgStr + 'success ', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();
          await pixelMap.release();
          done();
        } catch(err){
          console.info(msgStr + 'failed ', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0108
     * @tc.number sendableImagePixelMapAdd02_0108
     * @tc.desc   sendableImage API - srcPixelFormat: NV21, pixelFormat: NV21, editable: true, alphaType: PREMUL, scaleMode: CENTER_CROP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data sendableImagePixelMapAdd02_0108 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          srcPixelFormat: image.PixelMapFormat.NV21,
          pixelFormat: image.PixelMapFormat.NV21,
          editable: true,
          alphaType: image.AlphaType.PREMUL,
          scaleMode: image.ScaleMode.CENTER_CROP
        };
        try {
          let pixelMap: sendableImage.PixelMap = await sendableImage.createPixelMap(color, opts);
          console.info(msgStr + 'success ', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          await pixelMap.release();
          done();
        } catch(err){
          console.info(msgStr + 'failed ', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0109
     * @tc.number sendableImagePixelMapAdd02_0109
     * @tc.desc   sendableImage API - srcPixelFormat: NV12, pixelFormat: NV12, editable: false, alphaType: UNPREMUL, scaleMode: FIT_TARGET_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data sendableImagePixelMapAdd02_0109 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          srcPixelFormat: image.PixelMapFormat.NV12,
          pixelFormat: image.PixelMapFormat.NV12,
          editable: false,
          alphaType: image.AlphaType.UNPREMUL,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE
        };
        try {
          let pixelMap: sendableImage.PixelMap = await sendableImage.createPixelMap(color, opts);
          console.info(msgStr + 'success ', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();
          await pixelMap.release();
          done();
        } catch(err){
          console.info(msgStr + 'failed ', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0110
     * @tc.number sendableImagePixelMapAdd02_0110
     * @tc.desc   sendableImage API - srcPixelFormat: RGBA_1010102, pixelFormat: RGBA_1010102, editable: true, alphaType: OPAQUE, scaleMode: CENTER_CROP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data sendableImagePixelMapAdd02_0110 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_1010102,
          pixelFormat: image.PixelMapFormat.RGBA_1010102,
          editable: true,
          alphaType: image.AlphaType.OPAQUE,
          scaleMode: image.ScaleMode.CENTER_CROP
        };
        try {
          let pixelMap: sendableImage.PixelMap = await sendableImage.createPixelMap(color, opts);
          console.info(msgStr + 'success ', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch(err){
          console.info(msgStr + 'failed ', err);
          expect(err).assertEqual(62980096);
          done();
        }
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0111
     * @tc.number sendableImagePixelMapAdd02_0111
     * @tc.desc   sendableImage API - srcPixelFormat: YCBCR_P010, pixelFormat: YCBCR_P010, editable: false, alphaType: PREMUL, scaleMode: FIT_TARGET_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data sendableImagePixelMapAdd02_0111 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          srcPixelFormat: image.PixelMapFormat.YCBCR_P010,
          pixelFormat: image.PixelMapFormat.YCBCR_P010,
          editable: false,
          alphaType: image.AlphaType.PREMUL,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE
        };
        try {
          let pixelMap: sendableImage.PixelMap = await sendableImage.createPixelMap(color, opts);
          console.info(msgStr + 'success ', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch(err){
          console.info(msgStr + 'failed ', err);
          expect(Number(err)).assertEqual(62980096);
          done();
        }
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0112
     * @tc.number sendableImagePixelMapAdd02_0112
     * @tc.desc   sendableImage API - srcPixelFormat: YCRCB_P010, pixelFormat: YCRCB_P010, editable: true, alphaType: UNPREMUL, scaleMode: CENTER_CROP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data sendableImagePixelMapAdd02_0112 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          srcPixelFormat: image.PixelMapFormat.YCRCB_P010,
          pixelFormat: image.PixelMapFormat.YCRCB_P010,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL,
          scaleMode: image.ScaleMode.CENTER_CROP
        };
        try {
          let pixelMap: sendableImage.PixelMap = await sendableImage.createPixelMap(color, opts);
          console.info(msgStr + 'success ', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch(err){
          console.info(msgStr + 'failed ', err);
          expect(Number(err)).assertEqual(62980096);
          done();
        }
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0113
     * @tc.number sendableImagePixelMapAdd02_0113
     * @tc.desc   sendableImage API - srcPixelFormat: ASTC_4x4, pixelFormat: ASTC_4x4, editable: false, alphaType: OPAQUE, scaleMode: FIT_TARGET_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data sendableImagePixelMapAdd02_0113 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          srcPixelFormat: image.PixelMapFormat.ASTC_4x4,
          pixelFormat: image.PixelMapFormat.ASTC_4x4,
          editable: false,
          alphaType: image.AlphaType.OPAQUE,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE
        };
        try {
          let pixelMap: sendableImage.PixelMap = await sendableImage.createPixelMap(color, opts);
          console.info(msgStr + 'success ', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();
          await pixelMap.release();
          done();
        } catch(err){
          console.info(msgStr + 'failed ', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0200
     * @tc.number sendableImagePixelMapAdd02_0200
     * @tc.desc   sendableImage API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data sendableImagePixelMapAdd02_0200 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.UNKNOWN,
          pixelFormat: image.PixelMapFormat.UNKNOWN,
          alphaType: image.AlphaType.UNKNOWN,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
          console.info(msgStr + 'success ', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          await pixelMap.release();
          done();
        } catch(err){
          console.info(msgStr + 'failed ', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0201
     * @tc.number sendableImagePixelMapAdd02_0201
     * @tc.desc   sendableImage API - srcPixelFormat: ARGB_8888, pixelFormat: ARGB_8888, editable: false, alphaType: OPAQUE, scaleMode: FIT_TARGET_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data sendableImagePixelMapAdd02_0201 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.ARGB_8888,
          editable: false,
          alphaType: image.AlphaType.OPAQUE,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE
        };
        try {
          let pixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
          console.info(msgStr + 'success ', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();
          await pixelMap.release();
          done();
        } catch(err){
          console.info(msgStr + 'failed ', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0202
     * @tc.number sendableImagePixelMapAdd02_0202
     * @tc.desc   sendableImage API - srcPixelFormat: RGB_565, pixelFormat: RGB_565, editable: true, alphaType: PREMUL, scaleMode: CENTER_CROP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data sendableImagePixelMapAdd02_0202 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          srcPixelFormat: image.PixelMapFormat.RGB_565,
          pixelFormat: image.PixelMapFormat.RGB_565,
          editable: true,
          alphaType: image.AlphaType.PREMUL,
          scaleMode: image.ScaleMode.CENTER_CROP
        };
        try {
          let pixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
          console.info(msgStr + 'success ', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          await pixelMap.release();
          done();
        } catch(err){
          console.info(msgStr + 'failed ', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0203
     * @tc.number sendableImagePixelMapAdd02_0203
     * @tc.desc   sendableImage API - srcPixelFormat: RGBA_8888, pixelFormat: RGBA_8888, editable: false, alphaType: UNPREMUL, scaleMode: FIT_TARGET_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data sendableImagePixelMapAdd02_0203 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: false,
          alphaType: image.AlphaType.UNPREMUL,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE
        };
        try {
          let pixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
          console.info(msgStr + 'success ', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();
          await pixelMap.release();
          done();
        } catch(err){
          console.info(msgStr + 'failed ', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0204
     * @tc.number sendableImagePixelMapAdd02_0204
     * @tc.desc   sendableImage API - srcPixelFormat: BGRA_8888, pixelFormat: BGRA_8888, editable: true, alphaType: OPAQUE, scaleMode: CENTER_CROP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data sendableImagePixelMapAdd02_0204 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          editable: true,
          alphaType: image.AlphaType.OPAQUE,
          scaleMode: image.ScaleMode.CENTER_CROP
        };
        try {
          let pixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
          console.info(msgStr + 'success ', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          await pixelMap.release();
          done();
        } catch(err){
          console.info(msgStr + 'failed ', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0205
     * @tc.number sendableImagePixelMapAdd02_0205
     * @tc.desc   sendableImage API - srcPixelFormat: RGB_888, pixelFormat: RGB_888, editable: false, alphaType: PREMUL, scaleMode: FIT_TARGET_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data sendableImagePixelMapAdd02_0205 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          srcPixelFormat: image.PixelMapFormat.RGB_888,
          pixelFormat: image.PixelMapFormat.RGB_888,
          editable: false,
          alphaType: image.AlphaType.PREMUL,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE
        };
        try {
          let pixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
          console.info(msgStr + 'success ', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();
          await pixelMap.release();
          done();
        } catch(err){
          console.info(msgStr + 'failed ', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0206
     * @tc.number sendableImagePixelMapAdd02_0206
     * @tc.desc   sendableImage API - srcPixelFormat: ALPHA_8, pixelFormat: ALPHA_8, editable: true, alphaType: UNPREMUL, scaleMode: CENTER_CROP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data sendableImagePixelMapAdd02_0206 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          srcPixelFormat: image.PixelMapFormat.ALPHA_8,
          pixelFormat: image.PixelMapFormat.ALPHA_8,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL,
          scaleMode: image.ScaleMode.CENTER_CROP
        };
        try {
          let pixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
          console.info(msgStr + 'success ', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          await pixelMap.release();
          done();
        } catch(err){
          console.info(msgStr + 'failed ', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0207
     * @tc.number sendableImagePixelMapAdd02_0207
     * @tc.desc   sendableImage API - srcPixelFormat: RGBA_F16, pixelFormat: RGBA_F16, editable: false, alphaType: OPAQUE, scaleMode: FIT_TARGET_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data sendableImagePixelMapAdd02_0207 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_F16,
          pixelFormat: image.PixelMapFormat.RGBA_F16,
          editable: false,
          alphaType: image.AlphaType.OPAQUE,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE
        };
        try {
          let pixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
          console.info(msgStr + 'success ', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();
          await pixelMap.release();
          done();
        } catch(err){
          console.info(msgStr + 'failed ', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0208
     * @tc.number sendableImagePixelMapAdd02_0208
     * @tc.desc   sendableImage API - srcPixelFormat: NV21, pixelFormat: NV21, editable: true, alphaType: PREMUL, scaleMode: CENTER_CROP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data sendableImagePixelMapAdd02_0208 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          srcPixelFormat: image.PixelMapFormat.NV21,
          pixelFormat: image.PixelMapFormat.NV21,
          editable: true,
          alphaType: image.AlphaType.PREMUL,
          scaleMode: image.ScaleMode.CENTER_CROP
        };
        try {
          let pixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
          console.info(msgStr + 'success ', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          await pixelMap.release();
          done();
        } catch(err){
          console.info(msgStr + 'failed ', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0209
     * @tc.number sendableImagePixelMapAdd02_0209
     * @tc.desc   sendableImage API - srcPixelFormat: NV12, pixelFormat: NV12, editable: false, alphaType: UNPREMUL, scaleMode: FIT_TARGET_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data sendableImagePixelMapAdd02_0209 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          srcPixelFormat: image.PixelMapFormat.NV12,
          pixelFormat: image.PixelMapFormat.NV12,
          editable: false,
          alphaType: image.AlphaType.UNPREMUL,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE
        };
        try {
          let pixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
          console.info(msgStr + 'success ', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();
          await pixelMap.release();
          done();
        } catch(err){
          console.info(msgStr + 'failed ', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0210
     * @tc.number sendableImagePixelMapAdd02_0210
     * @tc.desc   sendableImage API - srcPixelFormat: RGBA_1010102, pixelFormat: RGBA_1010102, editable: true, alphaType: OPAQUE, scaleMode: CENTER_CROP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data sendableImagePixelMapAdd02_0210 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_1010102,
          pixelFormat: image.PixelMapFormat.RGBA_1010102,
          editable: true,
          alphaType: image.AlphaType.OPAQUE,
          scaleMode: image.ScaleMode.CENTER_CROP
        };
        try {
          let pixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
          console.info(msgStr + 'success ', pixelMap);
          expect(pixelMap).assertUndefined();
          done();
        } catch(err){
          console.info(msgStr + 'failed ', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0211
     * @tc.number sendableImagePixelMapAdd02_0211
     * @tc.desc   sendableImage API - srcPixelFormat: YCBCR_P010, pixelFormat: YCBCR_P010, editable: false, alphaType: PREMUL, scaleMode: FIT_TARGET_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data sendableImagePixelMapAdd02_0211 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          srcPixelFormat: image.PixelMapFormat.YCBCR_P010,
          pixelFormat: image.PixelMapFormat.YCBCR_P010,
          editable: false,
          alphaType: image.AlphaType.PREMUL,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE
        };
        try {
          let pixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
          console.info(msgStr + 'success ', pixelMap);
          expect(pixelMap).assertUndefined();
          done();
        } catch(err){
          console.info(msgStr + 'failed ', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0212
     * @tc.number sendableImagePixelMapAdd02_0212
     * @tc.desc   sendableImage API - srcPixelFormat: YCRCB_P010, pixelFormat: YCRCB_P010, editable: true, alphaType: UNPREMUL, scaleMode: CENTER_CROP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data sendableImagePixelMapAdd02_0212 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          srcPixelFormat: image.PixelMapFormat.YCRCB_P010,
          pixelFormat: image.PixelMapFormat.YCRCB_P010,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL,
          scaleMode: image.ScaleMode.CENTER_CROP
        };
        try {
          let pixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
          console.info(msgStr + 'success ', pixelMap);
          expect(pixelMap).assertUndefined();
          done();
        } catch(err){
          console.info(msgStr + 'failed ', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0213
     * @tc.number sendableImagePixelMapAdd02_0213
     * @tc.desc   sendableImage API - srcPixelFormat: ASTC_4x4, pixelFormat: ASTC_4x4, editable: false, alphaType: OPAQUE, scaleMode: FIT_TARGET_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data sendableImagePixelMapAdd02_0213 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          size: { height: 4, width: 6 },
          srcPixelFormat: image.PixelMapFormat.ASTC_4x4,
          pixelFormat: image.PixelMapFormat.ASTC_4x4,
          editable: false,
          alphaType: image.AlphaType.OPAQUE,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE
        };
        try {
          let pixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
          console.info(msgStr + 'success ', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();
          await pixelMap.release();
          done();
        } catch(err){
          console.info(msgStr + 'failed ', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0300
     * @tc.number sendableImagePixelMapAdd02_0300
     * @tc.desc   image API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let bufferArr: Uint8Array = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i++) {
          bufferArr[i] = 0x80;
        }
        let opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 },
        }
        let pixelMap: sendableImage.PixelMap | undefined = undefined;
        await sendableImage.createPixelMap(color, opts).then((srcPixelMap: sendableImage.PixelMap) => {
          pixelMap = srcPixelMap;
        })
        if (pixelMap != undefined) {
          // 序列化。
          let parcelable: MySequence1 = new MySequence1(pixelMap);
          let data: rpc.MessageSequence = rpc.MessageSequence.create();
          data.writeParcelable(parcelable);

          // 反序列化rpc获取到data。
          let ret: MySequence1 = new MySequence1(pixelMap);
          data.readParcelable(ret);

          // 获取到PixelMap。
          let newPixelMap = ret.pixel_map;
        }
        done();
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0301
     * @tc.number sendableImagePixelMapAdd02_0301
     * @tc.desc   image API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let bufferArr: Uint8Array = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i++) {
          bufferArr[i] = 0x80;
        }
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap : sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
        if (pixelMap != undefined) {
          // 序列化。
          let parcelable: MySequence2 = new MySequence2(pixelMap);
          try {
            let data: rpc.MessageSequence = rpc.MessageSequence.create();
            data.writeParcelable(parcelable);
            // 反序列化 rpc获取到data。
            let ret: MySequence2 = new MySequence2(pixelMap);
            data.readParcelable(ret);
            // 获取到pixelmap。
            let unMarshPixelmap = ret.pixel_map;
            console.info('www data succeed in unMarshPixelmap' + unMarshPixelmap)
          } catch (err) {
            console.error('www data error ' + err);
            expect().assertFail();
          }
        } else {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0302
     * @tc.number sendableImagePixelMapAdd02_0302
     * @tc.desc   image API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
        let surfaceId = '123';
        try {
          let pixelMap: image.PixelMap = image.createPixelMapFromSurfaceSync(surfaceId, region);
          console.info('www data succeed in createPixelMapFromSurfaceSync');
          expect(pixelMap !== null).assertTrue();

          // Verify basic properties
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();
          await pixelMap.release();
          console.info(`www data sendableImagePixelMapAdd02_0302 success`);
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          console.error('www data error createPixelMapSync' + JSON.stringify(err));
          expect(Number(err.code) == 62980178).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0303
     * @tc.number sendableImagePixelMapAdd02_0303
     * @tc.desc   image API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
        let surfaceId = '';
        try {
          let pixelMap: image.PixelMap = image.createPixelMapFromSurfaceSync(surfaceId, region);
          console.info('www data succeed in createPixelMapFromSurfaceSync');
          expect(pixelMap !== null).assertTrue();

          // Verify basic properties
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertTrue();
          await pixelMap.release();
          console.info(`www data sendableImagePixelMapAdd02_0303 success`);
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          console.error('www data error createPixelMapSync' + JSON.stringify(err));
          expect(Number(err.code) == 62980178).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0304
     * @tc.number sendableImagePixelMapAdd02_0304
     * @tc.desc   image API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
          let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
          console.info('www data sendableImagePixelMapAdd02_0304 success ', pixelMap.isEditable,
            pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          let sendablePixelMap : sendableImage.PixelMap = sendableImage.convertFromPixelMap(pixelMap);
          console.info('www data sendableImagePixelMapAdd02_0304 ', sendablePixelMap.isEditable,
            sendablePixelMap.isStrideAlignment);
          expect(sendablePixelMap.isEditable).assertTrue();
          expect(sendablePixelMap.isStrideAlignment).assertFalse();
          await pixelMap.release();
          await sendablePixelMap.release();
        } catch (err) {
          err = err as BusinessError;
          console.error('www data error sendableImagePixelMapAdd02_0304' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0305
     * @tc.number sendableImagePixelMapAdd02_0305
     * @tc.desc   image API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          let opts: image.InitializationOptions = { editable: false, srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: 3, size: { height: 4, width: 6 } }
          let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
          console.info('www data sendableImagePixelMapAdd02_0305 ', pixelMap.isEditable,
            pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertTrue();
          let sendablePixelMap : sendableImage.PixelMap = sendableImage.convertFromPixelMap(pixelMap);
          console.info('www data sendableImagePixelMapAdd02_0305 ', sendablePixelMap.isEditable,
            sendablePixelMap.isStrideAlignment);
          expect(sendablePixelMap.isEditable).assertFalse();
          expect(sendablePixelMap.isStrideAlignment).assertTrue();
          await pixelMap.release();
          await sendablePixelMap.release();
        } catch (err) {
          err = err as BusinessError;
          console.error('www data error sendableImagePixelMapAdd02_0305' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0306
     * @tc.number sendableImagePixelMapAdd02_0306
     * @tc.desc   image API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
          let pixelMap : sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
          console.info('www data sendableImagePixelMapAdd02_0305 ', pixelMap.isEditable,
            pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          let sendablePixelMap : image.PixelMap = sendableImage.convertToPixelMap(pixelMap);
          console.info('www data sendableImagePixelMapAdd02_0306 ', sendablePixelMap.isEditable,
            sendablePixelMap.isStrideAlignment);
          expect(sendablePixelMap.isEditable).assertTrue();
          expect(sendablePixelMap.isStrideAlignment).assertFalse();
          await pixelMap.release();
          await sendablePixelMap.release();
        } catch (err) {
          err = err as BusinessError;
          console.error('www data error sendableImagePixelMapAdd02_0306' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0307
     * @tc.number sendableImagePixelMapAdd02_0307
     * @tc.desc   image API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          let opts: image.InitializationOptions = { editable: false, pixelFormat: 3, size: { height: 4, width: 6 } }
          let pixelMap : sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
          console.info('www data sendableImagePixelMapAdd02_0305 ', pixelMap.isEditable,
            pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();
          let sendablePixelMap: image.PixelMap = sendableImage.convertToPixelMap(pixelMap);
          console.info('www data sendableImagePixelMapAdd02_0307 ', sendablePixelMap.isEditable,
            sendablePixelMap.isStrideAlignment);
          expect(sendablePixelMap.isEditable).assertFalse();
          expect(sendablePixelMap.isStrideAlignment).assertFalse();
          await pixelMap.release();
          await sendablePixelMap.release();
        } catch (err) {
          err = err as BusinessError;
          console.error('www data error sendableImagePixelMapAdd02_0307' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0308
     * @tc.number sendableImagePixelMapAdd02_0308
     * @tc.desc   image API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(new ArrayBuffer(96), opts);
        try {
          let imgInfo = pixelMap!.getImageInfoSync();
          console.info('www data sendableImagePixelMapAdd02_0308 ', JSON.stringify(imgInfo));
          expect(imgInfo.size.width).assertLargerOrEqual(0);
          expect(imgInfo.size.height).assertLargerOrEqual(0);
          expect(imgInfo.isHdr).assertFalse();
          expect(imgInfo.stride).assertLargerOrEqual(0);
          expect(imgInfo.density).assertLargerOrEqual(0);
          expect(imgInfo.mimeType === '').assertTrue();
          expect(imgInfo.alphaType).assertEqual(image.AlphaType.PREMUL);
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
        } catch (err) {
          expect().assertFail();
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0309
     * @tc.number sendableImagePixelMapAdd02_0309
     * @tc.desc   image API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(new ArrayBuffer(96), opts);
        try {
          let imgInfoPromise = await pixelMap!.getImageInfo();
          console.info('www data sendableImagePixelMapAdd02_0309 ', JSON.stringify(imgInfoPromise));
          expect(imgInfoPromise.size.width).assertLargerOrEqual(0);
          expect(imgInfoPromise.size.height).assertLargerOrEqual(0);
          expect(imgInfoPromise.isHdr).assertFalse();
          expect(imgInfoPromise.stride).assertLargerOrEqual(0);
          expect(imgInfoPromise.density).assertLargerOrEqual(0);
          expect(imgInfoPromise.mimeType === '').assertTrue();
          expect(imgInfoPromise.alphaType).assertEqual(image.AlphaType.PREMUL);
          expect(imgInfoPromise.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
        } catch (err) {
          expect().assertFail();
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0310
     * @tc.number sendableImagePixelMapAdd02_0310
     * @tc.desc   image API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN,
            size: { height: 4, width: 6 } }
          let pixelMap : sendableImage.PixelMap = sendableImage.createPixelMapSync(new ArrayBuffer(96), opts);
          let imgInfo = pixelMap.getImageInfoSync();
          console.info('www data sendableImagePixelMapAdd02_0310 ', JSON.stringify(imgInfo));
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
          let imgInfoPromise = await pixelMap.getImageInfo();
          console.info('www data sendableImagePixelMapAdd02_0310 ', JSON.stringify(imgInfoPromise));
          expect(imgInfoPromise.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
          await pixelMap.release();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0311
     * @tc.number sendableImagePixelMapAdd02_0311
     * @tc.desc   image API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.ARGB_8888,
            size: { height: 4, width: 6 } }
          let pixelMap : sendableImage.PixelMap = sendableImage.createPixelMapSync(new ArrayBuffer(96), opts);
          let imgInfo = pixelMap.getImageInfoSync();
          console.info('www data sendableImagePixelMapAdd02_0311 ', JSON.stringify(imgInfo));
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ARGB_8888);
          expect(imgInfo.isHdr).assertFalse();
          let imgInfoPromise = await pixelMap.getImageInfo();
          console.info('www data sendableImagePixelMapAdd02_0311 ', JSON.stringify(imgInfoPromise));
          expect(imgInfoPromise.pixelFormat).assertEqual(image.PixelMapFormat.ARGB_8888);
          expect(imgInfoPromise.isHdr).assertFalse();
          await pixelMap.release();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0312
     * @tc.number sendableImagePixelMapAdd02_0312
     * @tc.desc   image API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGB_565,
            size: { height: 4, width: 6 } }
          let pixelMap : sendableImage.PixelMap = sendableImage.createPixelMapSync(new ArrayBuffer(96), opts);
          let imgInfo = pixelMap.getImageInfoSync();
          console.info('www data sendableImagePixelMapAdd02_0312 ', JSON.stringify(imgInfo));
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGB_565);
          expect(imgInfo.alphaType).assertEqual(image.AlphaType.OPAQUE);
          let imgInfoPromise = await pixelMap.getImageInfo();
          console.info('www data sendableImagePixelMapAdd02_0312 ', JSON.stringify(imgInfoPromise));
          expect(imgInfoPromise.pixelFormat).assertEqual(image.PixelMapFormat.RGB_565);
          expect(imgInfoPromise.alphaType).assertEqual(image.AlphaType.OPAQUE);
          await pixelMap.release();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0313
     * @tc.number sendableImagePixelMapAdd02_0313
     * @tc.desc   image API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }, alphaType: image.AlphaType.UNPREMUL }
          let pixelMap : sendableImage.PixelMap = sendableImage.createPixelMapSync(new ArrayBuffer(96), opts);
          let imgInfo = pixelMap.getImageInfoSync();
          console.info('www data sendableImagePixelMapAdd02_0313 ', JSON.stringify(imgInfo));
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
          expect(imgInfo.alphaType).assertEqual(image.AlphaType.UNPREMUL);
          let imgInfoPromise = await pixelMap.getImageInfo();
          console.info('www data sendableImagePixelMapAdd02_0313 ', JSON.stringify(imgInfoPromise));
          expect(imgInfoPromise.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
          expect(imgInfoPromise.alphaType).assertEqual(image.AlphaType.UNPREMUL);
          await pixelMap.release();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0314
     * @tc.number sendableImagePixelMapAdd02_0314
     * @tc.desc   image API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.BGRA_8888,
            size: { height: 4, width: 6 } }
          let pixelMap : sendableImage.PixelMap = sendableImage.createPixelMapSync(new ArrayBuffer(96), opts);
          let imgInfo = pixelMap.getImageInfoSync();
          console.info('www data sendableImagePixelMapAdd02_0314 ', JSON.stringify(imgInfo));
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.BGRA_8888);
          let imgInfoPromise = await pixelMap.getImageInfo();
          console.info('www data sendableImagePixelMapAdd02_0314 ', JSON.stringify(imgInfoPromise));
          expect(imgInfoPromise.pixelFormat).assertEqual(image.PixelMapFormat.BGRA_8888);
          await pixelMap.release();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0315
     * @tc.number sendableImagePixelMapAdd02_0315
     * @tc.desc   image API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGB_888,
            size: { height: 4, width: 6 } }
          let pixelMap : sendableImage.PixelMap = sendableImage.createPixelMapSync(new ArrayBuffer(96), opts);
          let imgInfo = pixelMap.getImageInfoSync();
          console.info('www data sendableImagePixelMapAdd02_0315 ', JSON.stringify(imgInfo));
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGB_888);
          let imgInfoPromise = await pixelMap.getImageInfo();
          console.info('www data sendableImagePixelMapAdd02_0315 ', JSON.stringify(imgInfoPromise));
          expect(imgInfoPromise.pixelFormat).assertEqual(image.PixelMapFormat.RGB_888);
          await pixelMap.release();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0316
     * @tc.number sendableImagePixelMapAdd02_0316
     * @tc.desc   image API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8,
            size: { height: 4, width: 6 } }
          let pixelMap : sendableImage.PixelMap = sendableImage.createPixelMapSync(new ArrayBuffer(96), opts);
          let imgInfo = pixelMap.getImageInfoSync();
          console.info('www data sendableImagePixelMapAdd02_0316 ', JSON.stringify(imgInfo));
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_8);
          let imgInfoPromise = await pixelMap.getImageInfo();
          console.info('www data sendableImagePixelMapAdd02_0316 ', JSON.stringify(imgInfoPromise));
          expect(imgInfoPromise.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_8);
          await pixelMap.release();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0317
     * @tc.number sendableImagePixelMapAdd02_0317
     * @tc.desc   image API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_F16,
            size: { height: 4, width: 6 } }
          let pixelMap : sendableImage.PixelMap = sendableImage.createPixelMapSync(new ArrayBuffer(96), opts);
          let imgInfo = pixelMap.getImageInfoSync();
          console.info('www data sendableImagePixelMapAdd02_0317 ', JSON.stringify(imgInfo));
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_F16);
          let imgInfoPromise = await pixelMap.getImageInfo();
          console.info('www data sendableImagePixelMapAdd02_0317 ', JSON.stringify(imgInfoPromise));
          expect(imgInfoPromise.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_F16);
          await pixelMap.release();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0318
     * @tc.number sendableImagePixelMapAdd02_0318
     * @tc.desc   image API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.NV21,
            size: { height: 4, width: 6 } }
          let pixelMap : sendableImage.PixelMap = sendableImage.createPixelMapSync(new ArrayBuffer(96), opts);
          let imgInfo = pixelMap.getImageInfoSync();
          console.info('www data sendableImagePixelMapAdd02_0318 ', JSON.stringify(imgInfo));
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.NV21);
          let imgInfoPromise = await pixelMap.getImageInfo();
          console.info('www data sendableImagePixelMapAdd02_0318 ', JSON.stringify(imgInfoPromise));
          expect(imgInfoPromise.pixelFormat).assertEqual(image.PixelMapFormat.NV21);
          await pixelMap.release();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0319
     * @tc.number sendableImagePixelMapAdd02_0319
     * @tc.desc   image API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0319', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.NV12,
            size: { height: 4, width: 6 } }
          let pixelMap : sendableImage.PixelMap = sendableImage.createPixelMapSync(new ArrayBuffer(96), opts);
          let imgInfo = pixelMap.getImageInfoSync();
          console.info('www data sendableImagePixelMapAdd02_0319 ', JSON.stringify(imgInfo));
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.NV12);
          let imgInfoPromise = await pixelMap.getImageInfo();
          console.info('www data sendableImagePixelMapAdd02_0319 ', JSON.stringify(imgInfoPromise));
          expect(imgInfoPromise.pixelFormat).assertEqual(image.PixelMapFormat.NV12);
          await pixelMap.release();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0320
     * @tc.number sendableImagePixelMapAdd02_0320
     * @tc.desc   image API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.YCBCR_P010,
            size: { height: 4, width: 6 } }
          let pixelMap : sendableImage.PixelMap = sendableImage.createPixelMapSync(new ArrayBuffer(96), opts);
          let imgInfo = pixelMap.getImageInfoSync();
          console.info('www data sendableImagePixelMapAdd02_0320 ', JSON.stringify(imgInfo));
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.YCBCR_P010);
          let imgInfoPromise = await pixelMap.getImageInfo();
          console.info('www data sendableImagePixelMapAdd02_0320 ', JSON.stringify(imgInfoPromise));
          expect(imgInfoPromise.pixelFormat).assertEqual(image.PixelMapFormat.YCBCR_P010);
          await pixelMap.release();
        } catch (err) {
          console.info('www data sendableImagePixelMapAdd02_0320 error ', err.code);
          expect(err.code).assertUndefined();
        }
        done();
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0321
     * @tc.number sendableImagePixelMapAdd02_0321
     * @tc.desc   image API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0321', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.YCRCB_P010,
            size: { height: 4, width: 6 } }
          let pixelMap : sendableImage.PixelMap = sendableImage.createPixelMapSync(new ArrayBuffer(96), opts);
          let imgInfo = pixelMap.getImageInfoSync();
          console.info('www data sendableImagePixelMapAdd02_0321 ', JSON.stringify(imgInfo));
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.YCRCB_P010);
          let imgInfoPromise = await pixelMap.getImageInfo();
          console.info('www data sendableImagePixelMapAdd02_0321 ', JSON.stringify(imgInfoPromise));
          expect(imgInfoPromise.pixelFormat).assertEqual(image.PixelMapFormat.YCRCB_P010);
          await pixelMap.release();
        } catch (err) {
          console.info('www data sendableImagePixelMapAdd02_0321 error ', err.code);
          expect(err.code).assertUndefined();
        }
        done();
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0322
     * @tc.number sendableImagePixelMapAdd02_0322
     * @tc.desc   image API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0322', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.ASTC_4x4,
            size: { height: 4, width: 6 } }
          let pixelMap : sendableImage.PixelMap = sendableImage.createPixelMapSync(new ArrayBuffer(96), opts);
          let imgInfo = pixelMap.getImageInfoSync();
          console.info('www data sendableImagePixelMapAdd02_0322 ', JSON.stringify(imgInfo));
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
          expect(imgInfo.isHdr).assertFalse();
          let imgInfoPromise = await pixelMap.getImageInfo();
          console.info('www data sendableImagePixelMapAdd02_0322 ', JSON.stringify(imgInfoPromise));
          expect(imgInfoPromise.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
          expect(imgInfoPromise.isHdr).assertFalse();
          await pixelMap.release();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0323
     * @tc.number sendableImagePixelMapAdd02_0323
     * @tc.desc   image API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.YCRCB_P010, size: { height: 4, width: 6 }
        }
        let pixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(new ArrayBuffer(96), opts);
        try {
          let imgInfo = pixelMap!.getImageInfoSync();
          console.info('www data sendableImagePixelMapAdd02_0323 ', JSON.stringify(imgInfo));
          expect(imgInfo.size.width).assertLargerOrEqual(0);
          expect(imgInfo.size.height).assertLargerOrEqual(0);
          expect(imgInfo.isHdr).assertFalse();
          expect(imgInfo.stride).assertLargerOrEqual(0);
          expect(imgInfo.density).assertLargerOrEqual(0);
          expect(imgInfo.mimeType === '').assertTrue();
          expect(imgInfo.alphaType).assertEqual(image.AlphaType.OPAQUE);
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
          await pixelMap.release();
        } catch (err) {
          console.info('www data sendableImagePixelMapAdd02_0323 error', err.code);
          expect(err.code).assertUndefined();
        }
        done();
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0324
     * @tc.number sendableImagePixelMapAdd02_0324
     * @tc.desc   image API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0324', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
        let msgStr = 'www data sendableImagePixelMapAdd02_0324 ';
        try {
          await pixelMap!.createAlphaPixelmap().then((alphaPixelMap: sendableImage.PixelMap) => {
            console.info(msgStr + 'Succeeded in creating alpha pixelmap.', alphaPixelMap.isEditable,
              alphaPixelMap.isStrideAlignment);
            expect(alphaPixelMap.isEditable).assertFalse();
            expect(alphaPixelMap.isStrideAlignment).assertFalse();
          }).catch((error: BusinessError) => {
            console.error(msgStr + 'Failed to create alpha pixelmap.');
            expect().assertFail();
          });
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0325
     * @tc.number sendableImagePixelMapAdd02_0325
     * @tc.desc   image API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0325', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
        try {
          let pixelMap1 = pixelMap!.createAlphaPixelmapSync();
          console.info('www data sendableImagePixelMapAdd02_0325 ',pixelMap1.isEditable, pixelMap1.isStrideAlignment);
          expect(pixelMap1.isEditable).assertFalse();
          expect(pixelMap1.isStrideAlignment).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0326
     * @tc.number sendableImagePixelMapAdd02_0326
     * @tc.desc   image API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0326', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let bufferArr: Uint8Array = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i++) {
          bufferArr[i] = 0x80;
        }
        let opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: 4,
          size: { height: 4, width: 6 },
          alphaType: 3
        }
        console.info('www data 11111');
        let pixelMap: sendableImage.PixelMap | undefined = undefined;
        console.info('www data 22222');
        await sendableImage.createPixelMap(color, opts).then((srcPixelMap: sendableImage.PixelMap) => {
          pixelMap = srcPixelMap;
        })
        console.info('www data 333333');
        if (pixelMap != undefined) {
          // 序列化。
          let parcelable: MySequence3 = new MySequence3(pixelMap);
          let data : rpc.MessageSequence = rpc.MessageSequence.create();
          data.writeParcelable(parcelable);

          // 反序列化rpc获取到data。
          let ret : MySequence3 = new MySequence3(pixelMap);
          data.readParcelable(ret);
        }
        done();
      })

    /**
     * @tc.name   sendableImagePixelMapAdd02_0327
     * @tc.number sendableImagePixelMapAdd02_0327
     * @tc.desc   image API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImagePixelMapAdd02_0327', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let bufferArr: Uint8Array = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i++) {
          bufferArr[i] = 0x80;
        }
        let opts: image.InitializationOptions = {
          editable: false,
          pixelFormat: 4,
          size: { height: 4, width: 6 },
          alphaType: 3
        }
        console.info('www data 11111');
        let pixelMap: sendableImage.PixelMap | undefined = undefined;
        console.info('www data 22222');
        await sendableImage.createPixelMap(color, opts).then((srcPixelMap: sendableImage.PixelMap) => {
          pixelMap = srcPixelMap;
        })
        console.info('www data 333333');
        if (pixelMap != undefined) {
          // 序列化。
          let parcelable: MySequence4 = new MySequence4(pixelMap);
          let data : rpc.MessageSequence = rpc.MessageSequence.create();
          data.writeParcelable(parcelable);

          // 反序列化rpc获取到data。
          let ret : MySequence4 = new MySequence4(pixelMap);
          data.readParcelable(ret);
        }
        done();
      })

  })
}