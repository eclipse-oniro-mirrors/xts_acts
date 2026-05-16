/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';
import rpc from '@ohos.rpc';
import { BusinessError } from '@ohos.base';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
// let pixelMap: image.PixelMap | undefined;

async function sleep(time: number) {
  let timeoutId: number = 0;
  let promise = new Promise<string>(resolve => {
    timeoutId = setTimeout(() => {
      resolve('sleep finished');
    }, time);
  })
  await promise;
  clearTimeout(timeoutId)
}

class MySequence1 implements rpc.Parcelable {
  pixel_map: image.PixelMap;
  constructor(conPixelmap: image.PixelMap) {
    this.pixel_map = conPixelmap;
  }
  marshalling(messageSequence: rpc.MessageSequence) {
    this.pixel_map.marshalling(messageSequence);
    return true;
  }
  unmarshalling(messageSequence: rpc.MessageSequence) {
    try {
      this.pixel_map = image.createPixelMapFromParcel(messageSequence);
      console.info('www data createPixelMapFromParcel ', this.pixel_map.isEditable, this.pixel_map.isStrideAlignment);
      expect(this.pixel_map.isEditable).assertTrue();
      expect(this.pixel_map.isStrideAlignment).assertFalse();
      this.pixel_map.release();
    } catch(e) {
      let error = e as BusinessError;
      console.error(`createPixelMapFromParcel error. code is ${error.code}, message is ${error.message}`);
      expect().assertFail();
      return false;
    }
    return true;
  }
}

class MySequence3 implements rpc.Parcelable {
  pixel_map: image.PixelMap;
  constructor(conPixelmap: image.PixelMap) {
    this.pixel_map = conPixelmap;
  }
  marshalling(messageSequence: rpc.MessageSequence) {
    this.pixel_map.marshalling(messageSequence);
    return true;
  }
  unmarshalling(messageSequence: rpc.MessageSequence) {
    try {
      this.pixel_map = image.createPixelMapFromParcel(messageSequence);
      console.info('www data createPixelMapFromParcel ', this.pixel_map.isEditable, this.pixel_map.isStrideAlignment);
      expect(this.pixel_map.isEditable).assertFalse();
      expect(this.pixel_map.isStrideAlignment).assertTrue();
      this.pixel_map.release();
    } catch(e) {
      let error = e as BusinessError;
      console.error(`createPixelMapFromParcel error. code is ${error.code}, message is ${error.message}`);
      expect().assertFail();
      return false;
    }
    return true;
  }
}

class MySequence implements rpc.Parcelable {
  pixel_map: image.PixelMap;

  constructor(conPixelMap: image.PixelMap) {
    this.pixel_map = conPixelMap;
  }

  marshalling(messageSequence: rpc.MessageSequence) {
    this.pixel_map.marshalling(messageSequence);
    console.info('marshalling');
    return true;
  }

  unmarshalling(messageSequence: rpc.MessageSequence) {
    image.createPixelMap(new ArrayBuffer(96), { size: { height: 4, width: 6 } }).then((pixelParcel: image.PixelMap) => {
      pixelParcel.unmarshalling(messageSequence).then(async (pixelMap: image.PixelMap) => {
        console.info('www data unmarshalling ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        expect(pixelMap.isEditable).assertTrue();
        expect(pixelMap.isStrideAlignment).assertFalse();
        this.pixel_map = pixelMap;
        pixelMap.getImageInfo().then(async (imageInfo: image.ImageInfo) => {
          console.info("unmarshalling information h:" + imageInfo.size.height + "w:" + imageInfo.size.width);
          await this.pixel_map.release();
          await pixelParcel.release();
        })
      })
    });
    return true;
  }
}

class MySequence2 implements rpc.Parcelable {
  pixel_map: image.PixelMap;

  constructor(conPixelMap: image.PixelMap) {
    this.pixel_map = conPixelMap;
  }

  marshalling(messageSequence: rpc.MessageSequence) {
    this.pixel_map.marshalling(messageSequence);
    console.info('marshalling');
    return true;
  }

  unmarshalling(messageSequence: rpc.MessageSequence) {
    image.createPixelMap(new ArrayBuffer(96), { size: { height: 4, width: 6 } }).then((pixelParcel: image.PixelMap) => {
      pixelParcel.unmarshalling(messageSequence).then(async (pixelMap: image.PixelMap) => {
        console.info('www data unmarshalling 22 ', pixelMap.isEditable, pixelMap.isStrideAlignment);
        expect(pixelMap.isEditable).assertFalse();
        expect(pixelMap.isStrideAlignment).assertTrue();
        this.pixel_map = pixelMap;
        pixelMap.getImageInfo().then(async (imageInfo: image.ImageInfo) => {
          console.info("unmarshalling information h:" + imageInfo.size.height + "w:" + imageInfo.size.width);
          await this.pixel_map.release();
          await pixelParcel.release();
        })
      })
    });
    return true;
  }
}

export default function graphicImagePixelMap1() {

  describe("graphicImagePixelMap1", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(() => {
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
      }
      let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
    })

    /**
     * @tc.name   graphicImagePixelMap1_0100
     * @tc.number graphicImagePixelMap1_0100
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapSync(color, opts);
          done();
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_0200
     * @tc.number graphicImagePixelMap1_0200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.ARGB_8888, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapSync(color, opts)
          done();
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_0300
     * @tc.number graphicImagePixelMap1_0300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGB_565, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapSync(color, opts);
          done();
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_0400
     * @tc.number graphicImagePixelMap1_0400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapSync(color, opts);
          done();
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_0500
     * @tc.number graphicImagePixelMap1_0500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.BGRA_8888, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapSync(color, opts);
          done();
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_0600
     * @tc.number graphicImagePixelMap1_0600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGB_888, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapSync(color, opts);
          done();
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_0700
     * @tc.number graphicImagePixelMap1_0700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapSync(color, opts);
          done();
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_0800
     * @tc.number graphicImagePixelMap1_0800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_F16, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapSync(color, opts);
          done();
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_0900
     * @tc.number graphicImagePixelMap1_0900
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.NV21, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapSync(color, opts);
          done();
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_1000
     * @tc.number graphicImagePixelMap1_1000
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.NV12, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapSync(color, opts);
          done();
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_1100
     * @tc.number graphicImagePixelMap1_1100
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_1010102, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapSync(opts);
          done();
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_1200
     * @tc.number graphicImagePixelMap1_1200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.YCBCR_P010, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapSync(opts);
          done();
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_1300
     * @tc.number graphicImagePixelMap1_1300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.YCRCB_P010, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapSync(opts);
          done();
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_1400
     * @tc.number graphicImagePixelMap1_1400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.ASTC_4x4, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapSync(opts);
          done();
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_1500
     * @tc.number graphicImagePixelMap1_1500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const readBuffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        try {
          await pixelMap!.readPixelsToBuffer(readBuffer).then(async () => {
            console.info('www data 1500 Succeeded in reading image pixel data.');
            await pixelMap!.release();
            done();
          }).catch((error: BusinessError) => {
            console.error('www data 1500 Failed to read image pixel data.')
            expect().assertFail();
            done();
          });
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_1600
     * @tc.number graphicImagePixelMap1_1600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const area : image.PositionArea = {
          pixels: new ArrayBuffer(8),
          offset: 0,
          stride: 8,
          region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
        };
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        try {
          pixelMap!.readPixelsSync(area);
          await pixelMap!.release();
          done();
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_1700
     * @tc.number graphicImagePixelMap1_1700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const readBuffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        try {
          pixelMap!.readPixelsToBufferSync(readBuffer);
          await pixelMap!.release();
          done();
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_1800
     * @tc.number graphicImagePixelMap1_1800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color : ArrayBuffer = new ArrayBuffer(96);  //96为需要创建的像素buffer大小，取值为：height * width *4。
        let bufferArr : Uint8Array = new Uint8Array(color);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        for (let i = 0; i < bufferArr.length; i++) {
          bufferArr[i] = i + 1;
        }
        try {
          pixelMap!.writeBufferToPixelsSync(color);
          await pixelMap!.release();
          done();
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_1900
     * @tc.number graphicImagePixelMap1_1900
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        try {
          await pixelMap!.getImageInfo().then(async (imageInfo: image.ImageInfo)=>{
            console.info('www data 1900 succeed ' + 1111111)
            await pixelMap!.release();
            done();
          }).catch((err: BusinessError) => {
            console.info('www data 1900 error ' + 22222)
            expect().assertFail();
            done();
          });;
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_2000
     * @tc.number graphicImagePixelMap1_2000
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        try {
          pixelMap!.getImageInfoSync();
          await pixelMap!.release();
          done();
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_2100
     * @tc.number graphicImagePixelMap1_2100
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        // callback
        try {
          pixelMap!.getImageInfo((err: BusinessError | null) => {
            console.info('www data graphicImagePixelMap1_1600 succeed');
            pixelMap!.release();
            done();
          })
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_2200
     * @tc.number graphicImagePixelMap1_2200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        try {
          let rowCount: number = pixelMap!.getBytesNumberPerRow();
          console.info('www data graphicImagePixelMap1_2200 succeed ', rowCount);
          expect(rowCount).assertEqual(24);
          await pixelMap!.release();
          done();
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_2300
     * @tc.number graphicImagePixelMap1_2300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        try {
          let pixelBytesNumber: number = pixelMap!.getPixelBytesNumber();
          console.info('www data graphicImagePixelMap1_2300 success ', pixelBytesNumber);
          expect(pixelBytesNumber).assertEqual(96);
          await pixelMap!.release();
          done();
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_2400
     * @tc.number graphicImagePixelMap1_2400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        let rate: number = 1;
        try {
          await pixelMap!.opacity(rate).then(async () => {
            console.info('www data 2400 Succeeded in setting opacity.');
            await pixelMap!.release();
            done();
          }).catch((err: BusinessError) => {
            console.error('www data 2400 Failed to set opacity.');
            expect().assertFail();
            done();
          });
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_2500
     * @tc.number graphicImagePixelMap1_2500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        // callback
        let rate: number = 5;
        try {
          pixelMap!.opacity(rate, (err: BusinessError<void> | null) => {
            console.info('www data graphicImagePixelMap1_2500 succeed')
            pixelMap!.release();
            done();
          })
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_2600
     * @tc.number graphicImagePixelMap1_2600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        let rate: number = 5;
        try {
          pixelMap!.opacitySync(rate);
          await pixelMap!.release();
          done();
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_2700
     * @tc.number graphicImagePixelMap1_2700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        let msgStr = 'www data graphicImagePixelMap1_2700 ';
        try {
          await pixelMap!.createAlphaPixelmap().then(async (alphaPixelMap: image.PixelMap) => {
            console.info(msgStr + 'Succeeded in creating alpha pixelmap.', alphaPixelMap.isEditable,
              alphaPixelMap.isStrideAlignment);
            expect(alphaPixelMap.isEditable).assertFalse();
            expect(alphaPixelMap.isStrideAlignment).assertFalse();
            await pixelMap!.release();
            await alphaPixelMap!.release();
            done();
          }).catch((error: BusinessError) => {
            console.error(msgStr + 'Failed to create alpha pixelmap.');
            expect().assertFail();
            done();
          });
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_2800
     * @tc.number graphicImagePixelMap1_2800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap1_2800 ';
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        // callback
        try {
          pixelMap!.createAlphaPixelmap( (err: BusinessError | null, alphaPixelMap: image.PixelMap | undefined) => {
            console.info(msgStr + 'Succeeded in creating alpha pixelmap.', alphaPixelMap?.isEditable,
              alphaPixelMap?.isStrideAlignment);
            expect(alphaPixelMap?.isEditable).assertFalse();
            expect(alphaPixelMap?.isStrideAlignment).assertFalse();
            pixelMap!.release();
            alphaPixelMap!.release();
            done();
          })
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_2900
     * @tc.number graphicImagePixelMap1_2900
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        try {
          let pixelMap1 = pixelMap!.createAlphaPixelmapSync();
          console.info('www data graphicImagePixelMap1_2900 ', pixelMap1.isEditable, pixelMap1.isStrideAlignment);
          expect(pixelMap1.isEditable).assertFalse();
          expect(pixelMap1.isStrideAlignment).assertFalse();
          await pixelMap!.release();
          await pixelMap1!.release();
          done();
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_3000
     * @tc.number graphicImagePixelMap1_3000
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let scaleX: number = 2;
        let scaleY: number = 1;
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        try {
          await pixelMap!.scale(scaleX, scaleY).then(async () => {
            console.info('www data 3100 Succeeded in scaling pixelmap.');
            await pixelMap.release();
            done();
          }).catch((err: BusinessError) => {
            console.error('www data 3100 Failed to scale pixelmap.');
            expect().assertFail();
            done();
          });
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_3100
     * @tc.number graphicImagePixelMap1_3100
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let scaleX: number = 2;
        let scaleY: number = 1;
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        // callback
        try {
          pixelMap!.scale(scaleX, scaleY, (err: BusinessError | null) => {
            console.info('www data graphicImagePixelMap1_3100 succeed')
            pixelMap!.release();
            done();
          })
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_3200
     * @tc.number graphicImagePixelMap1_3200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let scaleX: number = 2;
        let scaleY: number = 1;
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        try {
          pixelMap!.scaleSync(scaleX, scaleY);
          await pixelMap!.release();
          done();
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_3300
     * @tc.number graphicImagePixelMap1_3300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let scaleX: number = 2;
        let scaleY: number = 1;
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        try {
          await pixelMap!.scale(scaleX, scaleY, image.AntiAliasingLevel.LOW).then(() => {
            console.info('www data 3300 Succeeded in scaling pixelmap.');
          }).catch((err: BusinessError) => {
            console.error('www data 3300 Failed to scale pixelmap.');
            expect().assertFail();
          });
          await pixelMap!.scale(scaleX, scaleY, image.AntiAliasingLevel.NONE).then(() => {
            console.info('www data 3300 Succeeded in scaling pixelmap.');
          }).catch((err: BusinessError) => {
            console.error('www data 3300 Failed to scale pixelmap.');
            expect().assertFail();
          });
          await pixelMap!.scale(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM).then(() => {
            console.info('www data 3300 Succeeded in scaling pixelmap.');
          }).catch((err: BusinessError) => {
            console.error('www data 3300 Failed to scale pixelmap.');
            expect().assertFail();
          });
          await pixelMap!.release();
          done();
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_3400
     * @tc.number graphicImagePixelMap1_3400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let scaleX: number = 2;
        let scaleY: number = 1;
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        try {
          pixelMap!.scaleSync(scaleX, scaleY, image.AntiAliasingLevel.HIGH);
          await pixelMap!.release();
          done();
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_3500
     * @tc.number graphicImagePixelMap1_3500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let angle: number = 90;
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        try {
          await pixelMap!.rotate(angle).then(async () => {
            console.info('www data 3600 Succeeded in rotating pixelmap.');
            await pixelMap!.release();
            done();
          }).catch((err: BusinessError) => {
            console.error('www data 3600 Failed to rotate pixelmap.');
            expect().assertFail();
            done();
          });
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_3600
     * @tc.number graphicImagePixelMap1_3600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let angle: number = 90;
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        // callback
        try {
          pixelMap!.rotate(angle, (err: BusinessError | null) => {
            console.info('www data graphicImagePixelMap1_3600 succeed')
            pixelMap!.release();
            done();
          })
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_3700
     * @tc.number graphicImagePixelMap1_3700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let angle: number = 90;
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        try {
          pixelMap!.rotateSync(angle);
          await pixelMap!.release();
          done();
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_3800
     * @tc.number graphicImagePixelMap1_3800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let horizontal: boolean = true;
        let vertical: boolean = false;
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        // callback
        try {
          pixelMap!.flip(horizontal, vertical, (err: BusinessError | null) => {
            console.info('www data graphicImagePixelMap1_3800 succeed')
            pixelMap!.release();
            done();
          })
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_3900
     * @tc.number graphicImagePixelMap1_3900
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        let horizontal: boolean = true;
        let vertical: boolean = true;
        try {
          await pixelMap!.flip(horizontal, vertical).then(async () => {
            console.info('www data 3900 Succeeded in flipping pixelmap.');
            await pixelMap!.release();
            done();
          }).catch((err: BusinessError) => {
            console.error('www data 3900 Failed to flip pixelmap.');
            expect().assertFail();
            done();
          });
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_4000
     * @tc.number graphicImagePixelMap1_4000
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        let horizontal: boolean = false;
        let vertical: boolean = true;
        try {
          pixelMap!.flipSync(horizontal, vertical);
          await pixelMap!.release();
          done();
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_4100
     * @tc.number graphicImagePixelMap1_4100
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
        // callback
        try {
          pixelMap!.crop(region, (err: BusinessError | null) => {
            console.info('www data graphicImagePixelMap1_4100 succeed')
            pixelMap!.release();
            done();
          })
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_4200
     * @tc.number graphicImagePixelMap1_4200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap3: image.PixelMap = image.createPixelMapSync(opts);
        try {
          await pixelMap3.crop(region).then(async () => {
            console.info('www data 4200 Succeeded in cropping pixelmap.');
            expect().assertFail();
            await pixelMap3!.release();
            done();
          }).catch(async (err: BusinessError) => {
            console.error('www data 4200 Failed to crop pixelmap.', err);
            expect(Number(err) == 62980109).assertTrue();
            await pixelMap3!.release();
            done();
          });
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_4300
     * @tc.number graphicImagePixelMap1_4300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap4: image.PixelMap = image.createPixelMapSync(opts);
        try {
          pixelMap4.cropSync(region);
          console.info('www data 4300 success crop pixelmap.');
          await pixelMap4!.release();
          done();
        } catch (err) {
          let error = err as BusinessError;
          console.error('www data 4300 Failed to crop pixelmap.', JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_4400
     * @tc.number graphicImagePixelMap1_4400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 }
        }
        try {
          let pixel = image.createPixelMapSync(color, opts);
          console.info('www data pixel ' + JSON.stringify(pixel));
          console.info('www data pixel ' + pixel);
          await pixel!.release();
          done();
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_4500
     * @tc.number graphicImagePixelMap1_4500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        try {
          pixelMap?.setMemoryNameSync("PixelMapName Test");
          await pixelMap!.release();
          done();
        } catch (err) {
          await pixelMap!.release();
          err = err as BusinessError;
          if (err.code == 62980286) {
            console.info('www data graphicImagePixelMap1_4500 error code ' + JSON.stringify(err))
            done();
          } else {
            console.info('www data graphicImagePixelMap1_4500 error ')
            expect().assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_4600
     * @tc.number graphicImagePixelMap1_4600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        try {
          const flag = pixelMap!.isStrideAlignment;
          expect(false).assertEqual(flag);
          await pixelMap!.release();
          done();
        } catch (err) {
          err = err as BusinessError;
          console.info('www data graphicImagePixelMap1_4600 error ' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_4700
     * @tc.number graphicImagePixelMap1_4700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 }
        }
        let pixelMap1 = image.createPixelMapSync(opts);
        try {
          await pixelMap1.release();
          done();
        } catch (err) {
          err = err as BusinessError;
          console.info('www data graphicImagePixelMap1_4600 error ' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_4800
     * @tc.number graphicImagePixelMap1_4800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 }
        }
        let pixelMap2 = image.createPixelMapSync(opts);
        try {
          pixelMap2.release((err: BusinessError<void> | null) => {
            console.info('Succeeded in releasing graphicImagePixelMap1_4800 object.');
            done();
          })
        } catch (err) {
          err = err as BusinessError;
          console.info('www data graphicImagePixelMap1_4800 error ' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_6200
     * @tc.number graphicImagePixelMap1_6200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        try {
          const flag = pixelMap!.isEditable;
          expect(true).assertEqual(flag);
          await pixelMap!.release();
          done();
        } catch (err) {
          err = err as BusinessError;
          console.info('www data graphicImagePixelMap1_6200 error ' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_6300
     * @tc.number graphicImagePixelMap1_6300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const readBuffer: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        try {
          pixelMap?.readPixelsToBuffer(readBuffer, (err: BusinessError<void> | null) => {
            if(!err){
              console.info('www data graphicImagePixelMap1_6300 succeed')
              pixelMap!.release();
              done();
            } else {
              expect().assertFail();
              done();
            }
          })
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_6400
     * @tc.number graphicImagePixelMap1_6400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const area: image.PositionArea = {
          pixels: new ArrayBuffer(6), // 6为需要创建的像素buffer大小，取值为：height * width *1.5。
          offset: 0,
          stride: 8,
          region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
        };
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          pixelMap!.readPixels(area, (error: BusinessError | null) => {
            if (error) {
              console.error('www data Failed to read pixelMap from the specified area. ', error);
              expect(error).assertEqual(62980115);
              done();
            } else {
              console.info('www data Succeeded in reading pixelMap from the specified area.');
              expect().assertFail();
              pixelMap!.release();
              done();
            }
          })
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_6500
     * @tc.number graphicImagePixelMap1_6500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const area: image.PositionArea = {
          pixels: new ArrayBuffer(6), // 6为需要创建的像素buffer大小，取值为：height * width *1.5。
          offset: 0,
          stride: 8,
          region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
        };
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          await pixelMap!.readPixels(area).then(async () => {
            console.info('www data Succeeded in reading the image data in the area.');
            expect().assertFail();
            await pixelMap!.release();
            done();
          }).catch(async (error: BusinessError) => {
            console.error('www data Failed to read the image data in the area.', JSON.stringify(error));
            expect(error).assertEqual(62980115);
            await pixelMap!.release();
            done();
          })
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_6600
     * @tc.number graphicImagePixelMap1_6600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4。
        let bufferArr: Uint8Array = new Uint8Array(color);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        for (let i = 0; i < bufferArr.length; i++) {
          bufferArr[i] = i + 1;
        }
        if (pixelMap != undefined) {
          await pixelMap!.writeBufferToPixels(color).then(async () => {
            console.info("Succeeded in writing data from a buffer to a PixelMap.");
            await pixelMap!.release();
            done();
          }).catch((error: BusinessError) => {
            console.error('Failed to write data from a buffer to a PixelMap.');
            expect().assertFail();
            done();
          })
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_6700
     * @tc.number graphicImagePixelMap1_6700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4。
        let bufferArr: Uint8Array = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i++) {
          bufferArr[i] = i + 1;
        }
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          pixelMap!.writeBufferToPixels(color, (error: BusinessError | null) => {
            if (error) {
              console.error('Failed to read pixelMap from the specified area. ');
              expect().assertFail();
              done();
            } else {
              console.info('Succeeded in reading pixelMap from the specified area.');
              pixelMap!.release();
              done();
            }
          })
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_6800
     * @tc.number graphicImagePixelMap1_6800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4。
        let bufferArr: Uint8Array = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i++) {
          bufferArr[i] = i + 1;
        }
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        try {
          let getDensity: number = pixelMap!.getDensity();
          console.info('www data graphicImagePixelMap1_6800 success', getDensity);
          expect(getDensity).assertEqual(0);
          await pixelMap!.release();
          done();
        } catch (err) {
          console.info('www data graphicImagePixelMap1_6800 error');
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_6900
     * @tc.number graphicImagePixelMap1_6900
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          await pixelMap!.toSdr().then(async () => {
            let imageInfo = pixelMap!.getImageInfoSync();
            console.info("www data after toSdr ,imageInfo isHdr:" + imageInfo.isHdr);
            expect().assertFail();
            await pixelMap!.release();
            done();
          }).catch((err: BusinessError) => {
            console.info("www data after toSdr error " + err);
            done();
          });
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_7000
     * @tc.number graphicImagePixelMap1_7000
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const area: image.PositionArea = {
          pixels: new ArrayBuffer(6),
          offset: 0,
          stride: 8,
          region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
        };
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        let bufferArr: Uint8Array = new Uint8Array(area.pixels);
        for (let i = 0; i < bufferArr.length; i++) {
          bufferArr[i] = i + 1;
        }
        if (pixelMap != undefined) {
          await pixelMap!.writePixels(area).then(async () => {
            console.info('www data Succeeded in writing pixelmap into the specified area.');
            await pixelMap!.release();
            done();
          }).catch((error: BusinessError) => {
            console.error(`www data Failed to write pixelmap into the specified area.`, error);
            expect(error).assertEqual(62980115);
            done();
          })
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_7100
     * @tc.number graphicImagePixelMap1_7100
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const area: image.PositionArea = {
          pixels: new ArrayBuffer(6),
          offset: 0,
          stride: 8,
          region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
        };
        let bufferArr: Uint8Array = new Uint8Array(area.pixels);
        for (let i = 0; i < bufferArr.length; i++) {
          bufferArr[i] = i + 1;
        }
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap10: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap10 != undefined) {
          pixelMap10!.writePixels(area, (error: BusinessError | null) => {
            if (error) {
              console.error(`www data graphicImagePixelMap1_7100 Failed to write pixelmap area.`, error);
              expect(error).assertEqual(62980115);
              pixelMap10!.release();
              done();
            } else {
              console.info('www data graphicImagePixelMap1_7100 Succeeded in writing area callback.');
              expect().assertFail();
              pixelMap10!.release();
              done();
            }
          })
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_7200
     * @tc.number graphicImagePixelMap1_7200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const area: image.PositionArea = {
          pixels: new ArrayBuffer(6),
          offset: 0,
          stride: 8,
          region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
        };
        let bufferArr: Uint8Array = new Uint8Array(area.pixels);
        for (let i = 0; i < bufferArr.length; i++) {
          bufferArr[i] = i + 1;
        }
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          try {
            pixelMap!.writePixelsSync(area);
            await pixelMap!.release();
            done();
          } catch (err) {
            console.info('www data graphicImagePixelMap1_7200 error ' + JSON.stringify(err))
            expect().assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_7300
     * @tc.number graphicImagePixelMap1_7300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
        let csm: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
        pixelMap!.setColorSpace(csm);
        if (pixelMap != undefined) {
          try {
            pixelMap!.getColorSpace();
            await pixelMap!.release();
            done();
          } catch (err) {
            console.info('www data graphicImagePixelMap1_7300 error ' + JSON.stringify(err))
            expect().assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_7400
     * @tc.number graphicImagePixelMap1_7400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
        let csm: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
        if (pixelMap != undefined) {
          try {
            pixelMap!.setColorSpace(csm);
            await pixelMap!.release();
            done();
          } catch (err) {
            console.info('www data graphicImagePixelMap1_7400 error ' + JSON.stringify(err));
            expect().assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_7500
     * @tc.number graphicImagePixelMap1_7500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
        let targetColorSpace: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
        if (pixelMap != undefined) {
          try {
            await pixelMap!.applyColorSpace(targetColorSpace).then(async () => {
              console.info('www data succeed in graphicImagePixelMap1_7500');
              await pixelMap!.release();
              done();
            }).catch((err: BusinessError) => {
              expect().assertFail();
              done();
            });
          } catch (error) {
            console.error(`Failed to apply color space for pixelmap object, error code is ${error}`);
            expect().assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_7600
     * @tc.number graphicImagePixelMap1_7600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
        let targetColorSpace: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
        if (pixelMap != undefined) {
          try {
            pixelMap!.applyColorSpace(targetColorSpace, (err: BusinessError<void> | null) => {
              if (err) {
                console.error(`Failed to apply color space for pixelmap object, error code is ${err}`);
                expect().assertFail();
                done();
              } else {
                console.info('www data succeed in applyColorSpace');
                pixelMap!.release();
                done();
              }
            })
          } catch (error) {
            console.error(`Failed to apply color space for pixelmap object, error code is ${error}`);
            expect().assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_7700
     * @tc.number graphicImagePixelMap1_7700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        let targetPixelFormat = image.PixelMapFormat.NV12;
        if (pixelMap != undefined) {
          try {
            await pixelMap!.convertPixelFormat(targetPixelFormat);
            console.info('www data graphicImagePixelMap1_7700 success');
            await pixelMap!.release();
            done();
          } catch (err){
            console.info('www data graphicImagePixelMap1_7700 failed', err);
            expect().assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_7800
     * @tc.number graphicImagePixelMap1_7800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
          alphaType: image.AlphaType.UNPREMUL
        }
        let pixelMap: image.PixelMap;
        image.createPixelMap(color, opts).then(async (srcPixelMap: image.PixelMap) => {
          console.error("www data 11111111");
          pixelMap = srcPixelMap;
          if (pixelMap != undefined) {
            try {
              // 序列化。
              let parcelable: MySequence = new MySequence(pixelMap);
              let data: rpc.MessageSequence = rpc.MessageSequence.create();
              data.writeParcelable(parcelable);
              // 反序列化 rpc获取到data。
              let ret: MySequence = new MySequence(pixelMap);
              data.readParcelable(ret);
              // 获取到pixelmap。
              let unmarshPixelmap = ret.pixel_map;
              await srcPixelMap.release();
              done();
            } catch (error) {
              expect().assertFail();
              done();
            }
          } else {
            expect().assertFail();
            done();
          }
        })
      })

    /**
     * @tc.name   graphicImagePixelMap1_7900
     * @tc.number graphicImagePixelMap1_7900
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        expect('0').assertEqual(image.HdrMetadataKey.HDR_METADATA_TYPE + '');
        expect('1').assertEqual(image.HdrMetadataKey.HDR_STATIC_METADATA + '');
        expect('2').assertEqual(image.HdrMetadataKey.HDR_DYNAMIC_METADATA + '');
        expect('3').assertEqual(image.HdrMetadataKey.HDR_GAINMAP_METADATA + '');
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap1_8000
     * @tc.number graphicImagePixelMap1_8000
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        expect('0').assertEqual(image.HdrMetadataType.NONE + '');
        expect('1').assertEqual(image.HdrMetadataType.BASE + '');
        expect('2').assertEqual(image.HdrMetadataType.GAINMAP + '');
        expect('3').assertEqual(image.HdrMetadataType.ALTERNATE + '');
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap1_8100
     * @tc.number graphicImagePixelMap1_8100
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
        }
        let GainmapChannel1: image.GainmapChannel = {
          gainmapMax: 7.1,
          gainmapMin: 7.2,
          gamma: 7.3,
          baseOffset: 7.4,
          alternateOffset: 7.5
        }
        let GainmapChannel2: image.GainmapChannel = {
          gainmapMax: 8.1,
          gainmapMin: 8.2,
          gamma: 8.3,
          baseOffset: 8.4,
          alternateOffset: 8.5
        }
        let HdrGainmapMetadata: image.HdrGainmapMetadata = {
          writerVersion: 10,
          miniVersion: 11,
          gainmapChannelCount: 12,
          useBaseColorFlag: true,
          baseHeadroom: 5.1,
          alternateHeadroom: 5.2,
          channels: [ GainmapChannel1, GainmapChannel2 ]
        }
        expect(1.1).assertEqual(staticMetadata.whitePointX);
        expect(7.2).assertEqual(GainmapChannel1.gainmapMin);
        expect(8.3).assertEqual(GainmapChannel2.gamma);
        expect(5.2).assertEqual(HdrGainmapMetadata.alternateHeadroom);
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap1_8200
     * @tc.number graphicImagePixelMap1_8200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        image.createPixelMap(color, opts, (error: BusinessError | null, pixelMap: image.PixelMap | undefined) => {
          if(error) {
            console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info('Succeeded in creating pixelmap.');
            pixelMap!.release();
            done();
            done();
          }
        })
      })

    /**
     * @tc.name   graphicImagePixelMap1_8300
     * @tc.number graphicImagePixelMap1_8300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        try {
          let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
          console.info('www data succeed in createPixelMapSync');
          await pixelMap!.release();
          done();
        } catch (err) {
          console.error('www data error createPixelMapSync' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_8400
     * @tc.number graphicImagePixelMap1_8400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
          alphaType: image.AlphaType.UNPREMUL
        }
        let pixelMap: image.PixelMap;
        image.createPixelMap(color, opts).then(async (srcPixelMap: image.PixelMap) => {
          pixelMap = srcPixelMap;
          if (pixelMap != undefined) {
            // 序列化。
            let parcelable: MySequence1 = new MySequence1(pixelMap);
            try {
              let data: rpc.MessageSequence = rpc.MessageSequence.create();
              data.writeParcelable(parcelable);
              // 反序列化 rpc获取到data。
              let ret: MySequence1 = new MySequence1(pixelMap);
              data.readParcelable(ret);
              // 获取到pixelmap。
              let unMarshPixelmap = ret.pixel_map;
              console.info('www data succeed in unMarshPixelmap' + unMarshPixelmap)
              await srcPixelMap!.release();
              done();
            } catch (err) {
              console.error('www data error ' + err);
              expect().assertFail();
              done();
            }
          } else {
            expect().assertFail();
            done();
          }
        })
      })

    /**
     * @tc.name   graphicImagePixelMap1_8500
     * @tc.number graphicImagePixelMap1_8500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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

          console.info(`www data graphicImagePixelMap1_8500 success`);
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          console.error('www data error createPixelMapSync' + JSON.stringify(err));
          expect(Number(err.code) == 62980178).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap1_8600
     * @tc.number graphicImagePixelMap1_8600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let surfaceId = '123';
        try {
          let pixelMap: image.PixelMap = image.createPixelMapFromSurfaceSync(surfaceId);
          console.info('www data succeed in createPixelMapFromSurfaceSync');
          expect(pixelMap !== null).assertTrue();

          // Verify basic properties
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();

          console.info(`www data graphicImagePixelMap1_8500 success`);
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          console.error('www data error createPixelMapSync' + JSON.stringify(err));
          expect(Number(err.code) == 62980178).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap1_8700
     * @tc.number graphicImagePixelMap1_8700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap5: image.PixelMap = image.createPixelMapSync(opts);
        try {
          await pixelMap5.crop(region).then(async () => {
            console.info('www data 8700 Succeeded in cropping pixelmap.');
            await pixelMap5!.release();
            done();
          }).catch((err: BusinessError) => {
            console.error('www data 8700 Failed to crop pixelmap.', err.code);
            expect().assertFail();
            done();
          });
        } catch (err) {
          expect().assertFail();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_8800
     * @tc.number graphicImagePixelMap1_8800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap6: image.PixelMap = image.createPixelMapSync(opts);
        try {
          pixelMap6.cropSync(region);
          console.info('www data 8800 Succeeded in cropping pixelmap.');
          await pixelMap6!.release();
          done();
        } catch (err) {
          console.error('www data 8800 Failed to crop pixelmap.');
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_8900
     * @tc.number graphicImagePixelMap1_8900
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let bufferArr: Uint8Array = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i++) {
          bufferArr[i] = 0x80;
        }
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        console.error("www data 11111111");
        if (pixelMap != undefined) {
          try {
            // 序列化。
            let parcelable: MySequence2 = new MySequence2(pixelMap);
            let data: rpc.MessageSequence = rpc.MessageSequence.create();
            data.writeParcelable(parcelable);
            // 反序列化 rpc获取到data。
            let ret: MySequence2 = new MySequence2(pixelMap);
            data.readParcelable(ret);
            // 获取到pixelmap。
            let unmarshPixelmap = ret.pixel_map;
            done();
          } catch (error) {
            expect().assertFail();
            done();
          }
        } else {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap1_9000
     * @tc.number graphicImagePixelMap1_9000
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap1_9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let bufferArr: Uint8Array = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i++) {
          bufferArr[i] = 0x80;
        }
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        if (pixelMap != undefined) {
          // 序列化。
          let parcelable: MySequence3 = new MySequence3(pixelMap);
          try {
            let data: rpc.MessageSequence = rpc.MessageSequence.create();
            data.writeParcelable(parcelable);
            // 反序列化 rpc获取到data。
            let ret: MySequence3 = new MySequence3(pixelMap);
            data.readParcelable(ret);
            // 获取到pixelmap。
            let unMarshPixelmap = ret.pixel_map;
            console.info('www data succeed in unMarshPixelmap' + unMarshPixelmap)
            done();
          } catch (err) {
            console.error('www data error ' + err);
            expect().assertFail();
            done();
          }
        } else {
          expect().assertFail();
          done();
        }
      })

  })
}