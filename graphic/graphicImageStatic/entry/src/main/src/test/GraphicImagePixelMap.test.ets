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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import image from '@ohos.multimedia.image';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';
import rpc from '@ohos.rpc';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import { taskPoolTest } from '../utils/Taskpool';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext: common.UIAbilityContext;
let pixelMap: image.PixelMap | undefined;

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
    } catch(e) {
      let error = e as BusinessError;
      console.error(`createPixelMapFromParcel error. code is ${error.code}, message is ${error.message}`);
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
        this.pixel_map = pixelMap;
        pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
          console.info("unmarshalling information h:" + imageInfo.size.height + "w:" + imageInfo.size.width);
        })
      })
    });
    return true;
  }
}

export default function graphicImagePixelMap() {

  describe("graphicImagePixelMap", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(() => {
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
      }
      pixelMap = image.createPixelMapSync(opts);
    })

    /**
     * @tc.name   graphicImagePixelMap_static_0100
     * @tc.number graphicImagePixelMap_static_0100
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapSync(color, opts);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_0200
     * @tc.number graphicImagePixelMap_static_0200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.ARGB_8888, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapSync(color, opts)
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_0300
     * @tc.number graphicImagePixelMap_static_0300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGB_565, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapSync(color, opts);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_0400
     * @tc.number graphicImagePixelMap_static_0400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapSync(color, opts);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_0500
     * @tc.number graphicImagePixelMap_static_0500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.BGRA_8888, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapSync(color, opts);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_0600
     * @tc.number graphicImagePixelMap_static_0600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGB_888, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapSync(color, opts);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_0700
     * @tc.number graphicImagePixelMap_static_0700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapSync(color, opts);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_0800
     * @tc.number graphicImagePixelMap_static_0800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_F16, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapSync(color, opts);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_0900
     * @tc.number graphicImagePixelMap_static_0900
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.NV21, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapSync(color, opts);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_1000
     * @tc.number graphicImagePixelMap_static_1000
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.NV12, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapSync(color, opts);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_1100
     * @tc.number graphicImagePixelMap_static_1100
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_1010102, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapSync(opts);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_1200
     * @tc.number graphicImagePixelMap_static_1200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.YCBCR_P010, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapSync(opts);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_1300
     * @tc.number graphicImagePixelMap_static_1300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.YCRCB_P010, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapSync(opts);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_1400
     * @tc.number graphicImagePixelMap_static_1400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.ASTC_4x4, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapSync(opts);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_1500
     * @tc.number graphicImagePixelMap_static_1500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const readBuffer: ArrayBuffer = new ArrayBuffer(96);
        try {
          await pixelMap!.readPixelsToBuffer(readBuffer).then(() => {
            console.info('www data 1500 Succeeded in reading image pixel data.');
            expect(true).assertTrue();
          }).catch((error) => {
            console.error('www data 1500 Failed to read image pixel data.')
            expect().assertFail();
          });
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_1600
     * @tc.number graphicImagePixelMap_static_1600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const area : image.PositionArea = {
          pixels: new ArrayBuffer(8),
          offset: 0,
          stride: 8,
          region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
        };
        try {
          pixelMap!.readPixelsSync(area);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_1700
     * @tc.number graphicImagePixelMap_static_1700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const readBuffer: ArrayBuffer = new ArrayBuffer(96);
        try {
          pixelMap!.readPixelsToBufferSync(readBuffer);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_1800
     * @tc.number graphicImagePixelMap_static_1800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color : ArrayBuffer = new ArrayBuffer(96);  //96为需要创建的像素buffer大小，取值为：height * width *4。
        let bufferArr : Uint8Array = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i++) {
          bufferArr[i] = i + 1;
        }
        try {
          pixelMap!.writeBufferToPixelsSync(color);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_1900
     * @tc.number graphicImagePixelMap_static_1900
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          await pixelMap!.getImageInfo().then((imageInfo: image.ImageInfo)=>{
            console.info('www data 1900 succeed ' + 1111111)
            expect(true).assertTrue();
          }).catch((err) => {
            console.info('www data 1900 error ' + 22222)
            expect().assertFail();
          });;
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_2000
     * @tc.number graphicImagePixelMap_static_2000
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          pixelMap!.getImageInfoSync();
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_2100
     * @tc.number graphicImagePixelMap_static_2100
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        // callback
        try {
          pixelMap!.getImageInfo((err: BusinessError | null) => {
            console.info('www data graphicImagePixelMap_static_1600 succeed');
          })
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_2200
     * @tc.number graphicImagePixelMap_static_2200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let rowCount: number = pixelMap!.getBytesNumberPerRow();
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_2300
     * @tc.number graphicImagePixelMap_static_2300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let pixelBytesNumber: number = pixelMap!.getPixelBytesNumber();
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_2400
     * @tc.number graphicImagePixelMap_static_2400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let rate: float = 1;
        try {
          await pixelMap!.opacity(rate).then(() => {
            console.info('www data 2400 Succeeded in setting opacity.');
            expect(true).assertTrue();
          }).catch((err) => {
            console.error('www data 2400 Failed to set opacity.');
            expect().assertFail();
          });
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_2500
     * @tc.number graphicImagePixelMap_static_2500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        // callback
        let rate: float = 5;
        try {
          pixelMap!.opacity(rate, (err: BusinessError<void> | null) => {
            console.info('www data graphicImagePixelMap_static_2500 succeed')
            expect(true).assertTrue();
          })
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_2600
     * @tc.number graphicImagePixelMap_static_2600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let rate: float = 5;
        try {
          pixelMap!.opacitySync(rate);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_2700
     * @tc.number graphicImagePixelMap_static_2700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          await pixelMap!.createAlphaPixelmap().then((alphaPixelMap: image.PixelMap) => {
            console.info('www data 2700 Succeeded in creating alpha pixelmap.');
            expect(true).assertTrue();
          }).catch((error) => {
            console.error('www data 2700 Failed to create alpha pixelmap.');
            expect().assertFail();
          });
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_2800
     * @tc.number graphicImagePixelMap_static_2800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        // callback
        try {
          pixelMap!.createAlphaPixelmap( (err: BusinessError | null) => {
            console.info('www data graphicImagePixelMap_static_2800 succeed');
          })
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_2900
     * @tc.number graphicImagePixelMap_static_2900
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          pixelMap!.createAlphaPixelmapSync();
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_3000
     * @tc.number graphicImagePixelMap_static_3000
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let scaleX: float = 2;
        let scaleY: float = 1;
        try {
          await pixelMap!.scale(scaleX, scaleY).then(() => {
            console.info('www data 3100 Succeeded in scaling pixelmap.');
            expect(true).assertTrue();
          }).catch((err) => {
            console.error('www data 3100 Failed to scale pixelmap.');
            expect().assertFail();
          });
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_3100
     * @tc.number graphicImagePixelMap_static_3100
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let scaleX: float = 2;
        let scaleY: float = 1;
        // callback
        try {
          pixelMap!.scale(scaleX, scaleY, (err: BusinessError | null) => {
            console.info('www data graphicImagePixelMap_static_3100 succeed')
            expect(true).assertTrue();
          })
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_3200
     * @tc.number graphicImagePixelMap_static_3200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let scaleX: float = 2;
        let scaleY: float = 1;
        try {
          pixelMap!.scaleSync(scaleX, scaleY);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_3300
     * @tc.number graphicImagePixelMap_static_3300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let scaleX: float = 2;
        let scaleY: float = 1;
        try {
          await pixelMap!.scale(scaleX, scaleY, image.AntiAliasingLevel.LOW).then(() => {
            console.info('www data 3300 Succeeded in scaling pixelmap.');
            expect(true).assertTrue();
          }).catch((err) => {
            console.error('www data 3300 Failed to scale pixelmap.');
            expect().assertFail();
          });
          await pixelMap!.scale(scaleX, scaleY, image.AntiAliasingLevel.NONE).then(() => {
            console.info('www data 3300 Succeeded in scaling pixelmap.');
            expect(true).assertTrue();
          }).catch((err) => {
            console.error('www data 3300 Failed to scale pixelmap.');
            expect().assertFail();
          });;
          await pixelMap!.scale(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM).then(() => {
            console.info('www data 3300 Succeeded in scaling pixelmap.');
            expect(true).assertTrue();
          }).catch((err) => {
            console.error('www data 3300 Failed to scale pixelmap.');
            expect().assertFail();
          });;
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_3400
     * @tc.number graphicImagePixelMap_static_3400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let scaleX: float = 2;
        let scaleY: float = 1;
        try {
          pixelMap!.scaleSync(scaleX, scaleY, image.AntiAliasingLevel.HIGH);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_3500
     * @tc.number graphicImagePixelMap_static_3500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let angle: float = 90;
        try {
          await pixelMap!.rotate(angle).then(() => {
            console.info('www data 3600 Succeeded in rotating pixelmap.');
            expect(true).assertTrue();
          }).catch((err) => {
            console.error('www data 3600 Failed to rotate pixelmap.');
            expect().assertFail();
          });
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_3600
     * @tc.number graphicImagePixelMap_static_3600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let angle: float = 90;
        // callback
        try {
          pixelMap!.rotate(angle, (err: BusinessError | null) => {
            console.info('www data graphicImagePixelMap_static_3600 succeed')
            expect(true).assertTrue();
          })
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_3700
     * @tc.number graphicImagePixelMap_static_3700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let angle: float = 90;
        try {
          pixelMap!.rotateSync(angle);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_3800
     * @tc.number graphicImagePixelMap_static_3800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let horizontal: boolean = true;
        let vertical: boolean = false;
        // callback
        try {
          pixelMap!.flip(horizontal, vertical, (err: BusinessError | null) => {
            console.info('www data graphicImagePixelMap_static_3800 succeed')
            expect(true).assertTrue();
          })
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_3900
     * @tc.number graphicImagePixelMap_static_3900
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let horizontal: boolean = true;
        let vertical: boolean = true;
        try {
          await pixelMap!.flip(horizontal, vertical).then(() => {
            console.info('www data 3900 Succeeded in flipping pixelmap.');
            expect(true).assertTrue();
          }).catch((err) => {
            console.error('www data 3900 Failed to flip pixelmap.');
            expect().assertFail();
          });
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_4000
     * @tc.number graphicImagePixelMap_static_4000
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let horizontal: boolean = false;
        let vertical: boolean = true;
        try {
          pixelMap!.flipSync(horizontal, vertical);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_4100
     * @tc.number graphicImagePixelMap_static_4100
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
        // callback
        try {
          pixelMap!.crop(region, (err: BusinessError | null) => {
            console.info('www data graphicImagePixelMap_static_4100 succeed')
            expect(true).assertTrue();
          })
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_4200
     * @tc.number graphicImagePixelMap_static_4200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap3: image.PixelMap = image.createPixelMapSync(opts);
        try {
          await pixelMap3.crop(region).then(() => {
            console.info('www data 4200 Succeeded in cropping pixelmap.');
            expect().assertFail();
          }).catch((err) => {
            console.error('www data 4200 Failed to crop pixelmap.', err.code);
            expect(Number(err.code) == 62980109).assertTrue();
          });;
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_4300
     * @tc.number graphicImagePixelMap_static_4300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap4: image.PixelMap = image.createPixelMapSync(opts);
        try {
          pixelMap4.cropSync(region);
          expect().assertFail();
        } catch (err) {
          let error = err as BusinessError;
          console.error('www data 4300 Failed to crop pixelmap.', JSON.stringify(error));
          expect(Number(error.code) == 62980109).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_4400
     * @tc.number graphicImagePixelMap_static_4400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 }
        }
        try {
          let pixel = image.createPixelMapSync(color, opts);
          console.info('www data pixel ' + JSON.stringify(pixel));
          console.info('www data pixel ' + pixel);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_4500
     * @tc.number graphicImagePixelMap_static_4500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 }
        }
        try {
          pixelMap?.setMemoryNameSync("PixelMapName Test");
          expect(true).assertTrue();
        } catch (err) {
          err = err as BusinessError;
          if (err.code == 62980286) {
            console.info('www data graphicImagePixelMap_static_4500 error code ' + JSON.stringify(err))
            expect(true).assertTrue();
          } else {
            console.info('www data graphicImagePixelMap_static_4500 error ')
          }
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_4600
     * @tc.number graphicImagePixelMap_static_4600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 }
        }
        try {
          const flag = pixelMap!.isStrideAlignment;
          expect(false).assertEqual(flag);
        } catch (err) {
          err = err as BusinessError;
          console.info('www data graphicImagePixelMap_static_4600 error ' + JSON.stringify(err))
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_4700
     * @tc.number graphicImagePixelMap_static_4700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 }
        }
        let pixelMap1 = image.createPixelMapSync(opts);
        try {
          pixelMap1.release().then(() => {
            console.info('Succeeded in releasing graphicImagePixelMap_static_4700 object.');
            expect(true).assertTrue();
          }).catch((error) => {
            console.error('Failed to release graphicImagePixelMap_static_4700 object.');
            expect().assertFail();
          })
        } catch (err) {
          err = err as BusinessError;
          console.info('www data graphicImagePixelMap_static_4600 error ' + JSON.stringify(err))
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_4800
     * @tc.number graphicImagePixelMap_static_4800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 }
        }
        let pixelMap2 = image.createPixelMapSync(opts);
        try {
          pixelMap2.release((err: BusinessError<void> | null) => {
            console.info('Succeeded in releasing graphicImagePixelMap_static_4800 object.');
            expect(true).assertTrue();
          })
        } catch (err) {
          err = err as BusinessError;
          console.info('www data graphicImagePixelMap_static_4800 error ' + JSON.stringify(err))
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_6200
     * @tc.number graphicImagePixelMap_static_6200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        try {
          const flag = pixelMap!.isEditable;
          expect(true).assertEqual(flag);
        } catch (err) {
          err = err as BusinessError;
          console.info('www data graphicImagePixelMap_static_6200 error ' + JSON.stringify(err))
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_6300
     * @tc.number graphicImagePixelMap_static_6300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const readBuffer: ArrayBuffer = new ArrayBuffer(96);
        try {
          pixelMap?.readPixelsToBuffer(readBuffer, (err: BusinessError<void> | null) => {
            if(!err){
              console.info('www data graphicImagePixelMap_static_6300 succeed')
              expect(true).assertTrue();
            } else {
              expect().assertFail();
            }
          })
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_6400
     * @tc.number graphicImagePixelMap_static_6400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const area: image.PositionArea = {
          pixels: new ArrayBuffer(6), // 6为需要创建的像素buffer大小，取值为：height * width *1.5。
          offset: 0,
          stride: 8,
          region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
        };
        if (pixelMap != undefined) {
          pixelMap!.readPixels(area, (error: BusinessError | null) => {
            if (error) {
              console.error('Failed to read pixelMap from the specified area. ');
              expect().assertFail();
            } else {
              console.info('Succeeded in reading pixelMap from the specified area.');
              expect(true).assertTrue();
            }
          })
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_6500
     * @tc.number graphicImagePixelMap_static_6500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const area: image.PositionArea = {
          pixels: new ArrayBuffer(6), // 6为需要创建的像素buffer大小，取值为：height * width *1.5。
          offset: 0,
          stride: 8,
          region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
        };
        if (pixelMap != undefined) {
          await pixelMap!.readPixels(area).then(() => {
            console.info('Succeeded in reading the image data in the area.');
            expect(true).assertTrue();
          }).catch((error) => {
            console.error('Failed to read the image data in the area. ');
            expect().assertFail();
          })
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_6600
     * @tc.number graphicImagePixelMap_static_6600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4。
        let bufferArr: Uint8Array = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i++) {
          bufferArr[i] = i + 1;
        }
        if (pixelMap != undefined) {
          await pixelMap!.writeBufferToPixels(color).then(() => {
            console.info("Succeeded in writing data from a buffer to a PixelMap.");
            expect(true).assertTrue();
          }).catch((error) => {
            console.error('Failed to write data from a buffer to a PixelMap.');
            expect().assertFail();
          })
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_6700
     * @tc.number graphicImagePixelMap_static_6700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4。
        let bufferArr: Uint8Array = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i++) {
          bufferArr[i] = i + 1;
        }
        if (pixelMap != undefined) {
          pixelMap!.writeBufferToPixels(color, (error: BusinessError | null) => {
            if (error) {
              console.error('Failed to read pixelMap from the specified area. ');
              expect().assertFail();
            } else {
              console.info('Succeeded in reading pixelMap from the specified area.');
              expect(true).assertTrue();
            }
          })
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_6800
     * @tc.number graphicImagePixelMap_static_6800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4。
        let bufferArr: Uint8Array = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i++) {
          bufferArr[i] = i + 1;
        }
        try {
          let getDensity: number = pixelMap!.getDensity();
          expect(true).assertTrue();
        } catch (err) {
          console.info('www data graphicImagePixelMap_static_6800 error');
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_6900
     * @tc.number graphicImagePixelMap_static_6900
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (pixelMap != undefined) {
          await pixelMap!.toSdr().then(() => {
            let imageInfo = pixelMap!.getImageInfoSync();
            console.info("www data after toSdr ,imageInfo isHdr:" + imageInfo.isHdr);
            expect().assertFail();
          }).catch((err) => {
            expect(true).assertTrue();
          });
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_7000
     * @tc.number graphicImagePixelMap_static_7000
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
        if (pixelMap != undefined) {
          pixelMap!.writePixels(area).then(() => {
            console.info('Succeeded in writing pixelmap into the specified area.');
          }).catch((error) => {
            console.error(`Failed to write pixelmap into the specified area.`);
            expect().assertFail();
          })
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_7100
     * @tc.number graphicImagePixelMap_static_7100
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
        if (pixelMap != undefined) {
          pixelMap!.writePixels(area, (error: BusinessError | null) => {
            if (error) {
              console.error(`www data Failed to write pixelmap into the specified area.`);
              expect().assertFail();
            } else {
              console.info('www data Succeeded in writing pixelmap into the specified area callback.');
            }
          })
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_7200
     * @tc.number graphicImagePixelMap_static_7200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
        if (pixelMap != undefined) {
          try {
            pixelMap!.writePixelsSync(area);
          } catch (err) {
            console.info('www data graphicImagePixelMap_static_7200 error ' + JSON.stringify(err))
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_7300
     * @tc.number graphicImagePixelMap_static_7300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
        let csm: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
        pixelMap!.setColorSpace(csm);
        if (pixelMap != undefined) {
          try {
            pixelMap!.getColorSpace();
          } catch (err) {
            console.info('www data graphicImagePixelMap_static_7300 error ' + JSON.stringify(err))
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_7400
     * @tc.number graphicImagePixelMap_static_7400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
        let csm: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
        if (pixelMap != undefined) {
          try {
            pixelMap!.setColorSpace(csm);
          } catch (err) {
            console.info('www data graphicImagePixelMap_static_7400 error ' + JSON.stringify(err));
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_7500
     * @tc.number graphicImagePixelMap_static_7500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
        let targetColorSpace: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
        if (pixelMap != undefined) {
          try {
            await pixelMap!.applyColorSpace(targetColorSpace).then(() => {
              console.info('www data succeed in graphicImagePixelMap_static_7500');
            }).catch((err) => {
              expect().assertFail();
            });
          } catch (error) {
            console.error(`Failed to apply color space for pixelmap object, error code is ${error}`);
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_7600
     * @tc.number graphicImagePixelMap_static_7600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
        let targetColorSpace: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
        if (pixelMap != undefined) {
          try {
            pixelMap!.applyColorSpace(targetColorSpace, (err: BusinessError<void> | null) => {
              if (err) {
                console.error(`Failed to apply color space for pixelmap object, error code is ${err}`);
                expect().assertFail();
              } else {
                console.info('www data succeed in applyColorSpace');
              }
            })
          } catch (error) {
            console.error(`Failed to apply color space for pixelmap object, error code is ${error}`);
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_7700
     * @tc.number graphicImagePixelMap_static_7700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let targetPixelFormat = image.PixelMapFormat.NV12;
        if (pixelMap != undefined) {
          pixelMap!.convertPixelFormat(targetPixelFormat).then(() => {
            console.info('www data PixelMapFormat convert Succeeded');
          }).catch((error) => {
            console.error(`www data PixelMapFormat convert Failed.`);
            expect().assertFail();
          })
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_7800
     * @tc.number graphicImagePixelMap_static_7800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
        image.createPixelMap(color, opts).then((srcPixelMap: image.PixelMap) => {
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
              done();
            } catch (error) {
              expect().assertFail();
              done();
            }
          } else {
            expect().assertFail();
          }
        })
      })

    /**
     * @tc.name   graphicImagePixelMap_static_7900
     * @tc.number graphicImagePixelMap_static_7900
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        expect('0').assertEqual(image.HdrMetadataKey.HDR_METADATA_TYPE + '');
        expect('1').assertEqual(image.HdrMetadataKey.HDR_STATIC_METADATA + '');
        expect('2').assertEqual(image.HdrMetadataKey.HDR_DYNAMIC_METADATA + '');
        expect('3').assertEqual(image.HdrMetadataKey.HDR_GAINMAP_METADATA + '');
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_8000
     * @tc.number graphicImagePixelMap_static_8000
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        expect('0').assertEqual(image.HdrMetadataType.NONE + '');
        expect('1').assertEqual(image.HdrMetadataType.BASE + '');
        expect('2').assertEqual(image.HdrMetadataType.GAINMAP + '');
        expect('3').assertEqual(image.HdrMetadataType.ALTERNATE + '');
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_8100
     * @tc.number graphicImagePixelMap_static_8100
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   graphicImagePixelMap_static_8200
     * @tc.number graphicImagePixelMap_static_8200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        image.createPixelMap(color, opts, (error: BusinessError | null, pixelMap: image.PixelMap | undefined) => {
          if(error) {
            console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            return;
          } else {
            console.info('Succeeded in creating pixelmap.');
          }
        })
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_8300
     * @tc.number graphicImagePixelMap_static_8300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        try {
          let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
          console.info('www data succeed in createPixelMapSync');
        } catch (err) {
          console.error('www data error createPixelMapSync' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_8400
     * @tc.number graphicImagePixelMap_static_8400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
        image.createPixelMap(color, opts).then((srcPixelMap: image.PixelMap) => {
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
            } catch (err) {
              console.error('www data error ' + err);
              expect().assertFail();
            }
          } else {
            expect().assertFail();
          }
        })
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_8500
     * @tc.number graphicImagePixelMap_static_8500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
        let surfaceId = '123';
        try {
          let pixelMap: image.PixelMap = image.createPixelMapFromSurfaceSync(surfaceId, region);
          console.info('www data succeed in createPixelMapFromSurfaceSync');
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          console.error('www data error createPixelMapSync' + JSON.stringify(err));
          expect(Number(err.code) == 62980178).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_8600
     * @tc.number graphicImagePixelMap_static_8600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let surfaceId = '123';
        try {
          let pixelMap: image.PixelMap = image.createPixelMapFromSurfaceSync(surfaceId);
          console.info('www data succeed in createPixelMapFromSurfaceSync');
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          console.error('www data error createPixelMapSync' + JSON.stringify(err));
          expect(Number(err.code) == 62980178).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_8700
     * @tc.number graphicImagePixelMap_static_8700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap5: image.PixelMap = image.createPixelMapSync(opts);
        try {
          await pixelMap5.crop(region).then(() => {
            console.info('www data 8700 Succeeded in cropping pixelmap.');
          }).catch((err) => {
            console.error('www data 8700 Failed to crop pixelmap.', err.code);
            expect().assertFail();
          });
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap_static_8800
     * @tc.number graphicImagePixelMap_static_8800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap_static_8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap6: image.PixelMap = image.createPixelMapSync(opts);
        try {
          pixelMap6.cropSync(region);
          console.info('www data 8800 Succeeded in cropping pixelmap.');
        } catch (err) {
          console.error('www data 8800 Failed to crop pixelmap.');
          expect().assertFail();
        }
        done();
      })

  })
}