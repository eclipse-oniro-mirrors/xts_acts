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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import { taskPoolTest } from '../utils/Taskpool';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext: common.UIAbilityContext;
let pixelMap: image.PixelMap;

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
     * @tc.number: graphicImagePixelMap_static_0100
     * @tc.name: graphicImagePixelMap_static_0100
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
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
     * @tc.number: graphicImagePixelMap_static_0200
     * @tc.name: graphicImagePixelMap_static_0200
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
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
     * @tc.number: graphicImagePixelMap_static_0300
     * @tc.name: graphicImagePixelMap_static_0300
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
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
     * @tc.number: graphicImagePixelMap_static_0400
     * @tc.name: graphicImagePixelMap_static_0400
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
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
     * @tc.number: graphicImagePixelMap_static_0500
     * @tc.name: graphicImagePixelMap_static_0500
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
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
     * @tc.number: graphicImagePixelMap_static_0600
     * @tc.name: graphicImagePixelMap_static_0600
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
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
     * @tc.number: graphicImagePixelMap_static_0700
     * @tc.name: graphicImagePixelMap_static_0700
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
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
     * @tc.number: graphicImagePixelMap_static_0800
     * @tc.name: graphicImagePixelMap_static_0800
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
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
     * @tc.number: graphicImagePixelMap_static_0900
     * @tc.name: graphicImagePixelMap_static_0900
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
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
     * @tc.number: graphicImagePixelMap_static_1000
     * @tc.name: graphicImagePixelMap_static_1000
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
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
     * @tc.number: graphicImagePixelMap_static_1100
     * @tc.name: graphicImagePixelMap_static_1100
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
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
     * @tc.number: graphicImagePixelMap_static_1200
     * @tc.name: graphicImagePixelMap_static_1200
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
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
     * @tc.number: graphicImagePixelMap_static_1300
     * @tc.name: graphicImagePixelMap_static_1300
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
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
     * @tc.number: graphicImagePixelMap_static_1400
     * @tc.name: graphicImagePixelMap_static_1400
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
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
     * @tc.number: graphicImagePixelMap_static_1500
     * @tc.name: graphicImagePixelMap_static_1500
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const readBuffer: ArrayBuffer = new ArrayBuffer(96);
        try {
          await pixelMap.readPixelsToBuffer(readBuffer).then(() => {
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
     * @tc.number: graphicImagePixelMap_static_1600
     * @tc.name: graphicImagePixelMap_static_1600
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
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
          pixelMap.readPixelsSync(area);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_1700
     * @tc.name: graphicImagePixelMap_static_1700
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const readBuffer: ArrayBuffer = new ArrayBuffer(96);
        try {
          pixelMap.readPixelsToBufferSync(readBuffer);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_1800
     * @tc.name: graphicImagePixelMap_static_1800
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color : ArrayBuffer = new ArrayBuffer(96);  //96为需要创建的像素buffer大小，取值为：height * width *4。
        let bufferArr : Uint8Array = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i++) {
          bufferArr[i] = i + 1;
        }
        try {
          pixelMap.writeBufferToPixelsSync(color);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_1900
     * @tc.name: graphicImagePixelMap_static_1900
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          await pixelMap.getImageInfo().then((imageInfo: image.ImageInfo)=>{
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
     * @tc.number: graphicImagePixelMap_static_2000
     * @tc.name: graphicImagePixelMap_static_2000
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          pixelMap.getImageInfoSync();
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_2100
     * @tc.name: graphicImagePixelMap_static_2100
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        // callback
        try {
          pixelMap.getImageInfo((err: BusinessError | null) => {
            console.info('www data graphicImagePixelMap_static_1600 succeed');
          })
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_2200
     * @tc.name: graphicImagePixelMap_static_2200
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let rowCount: number = pixelMap.getBytesNumberPerRow();
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_2300
     * @tc.name: graphicImagePixelMap_static_2300
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let pixelBytesNumber: number = pixelMap.getPixelBytesNumber();
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_2400
     * @tc.name: graphicImagePixelMap_static_2400
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let rate: float = 1;
        try {
          await pixelMap.opacity(rate).then(() => {
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
     * @tc.number: graphicImagePixelMap_static_2500
     * @tc.name: graphicImagePixelMap_static_2500
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        // callback
        let rate: float = 5;
        try {
          pixelMap.opacity(rate, (err: BusinessError<void> | null) => {
            console.info('www data graphicImagePixelMap_static_2500 succeed')
            expect(true).assertTrue();
          })
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_2600
     * @tc.name: graphicImagePixelMap_static_2600
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let rate: float = 5;
        try {
          pixelMap.opacitySync(rate);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_2700
     * @tc.name: graphicImagePixelMap_static_2700
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          await pixelMap.createAlphaPixelmap().then((alphaPixelMap: image.PixelMap) => {
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
     * @tc.number: graphicImagePixelMap_static_2800
     * @tc.name: graphicImagePixelMap_static_2800
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        // callback
        try {
          pixelMap.createAlphaPixelmap( (err: BusinessError | null) => {
            console.info('www data graphicImagePixelMap_static_2800 succeed');
          })
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_2900
     * @tc.name: graphicImagePixelMap_static_2900
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          pixelMap.createAlphaPixelmapSync();
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_3000
     * @tc.name: graphicImagePixelMap_static_3000
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let scaleX: float = 2;
        let scaleY: float = 1;
        try {
          await pixelMap.scale(scaleX, scaleY).then(() => {
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
     * @tc.number: graphicImagePixelMap_static_3100
     * @tc.name: graphicImagePixelMap_static_3100
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let scaleX: float = 2;
        let scaleY: float = 1;
        // callback
        try {
          pixelMap.scale(scaleX, scaleY, (err: BusinessError | null) => {
            console.info('www data graphicImagePixelMap_static_3100 succeed')
            expect(true).assertTrue();
          })
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_3200
     * @tc.name: graphicImagePixelMap_static_3200
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let scaleX: float = 2;
        let scaleY: float = 1;
        try {
          pixelMap.scaleSync(scaleX, scaleY);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_3300
     * @tc.name: graphicImagePixelMap_static_3300
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let scaleX: float = 2;
        let scaleY: float = 1;
        try {
          await pixelMap.scale(scaleX, scaleY, image.AntiAliasingLevel.LOW).then(() => {
            console.info('www data 3300 Succeeded in scaling pixelmap.');
            expect(true).assertTrue();
          }).catch((err) => {
            console.error('www data 3300 Failed to scale pixelmap.');
            expect().assertFail();
          });
          await pixelMap.scale(scaleX, scaleY, image.AntiAliasingLevel.NONE).then(() => {
            console.info('www data 3300 Succeeded in scaling pixelmap.');
            expect(true).assertTrue();
          }).catch((err) => {
            console.error('www data 3300 Failed to scale pixelmap.');
            expect().assertFail();
          });;
          await pixelMap.scale(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM).then(() => {
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
     * @tc.number: graphicImagePixelMap_static_3400
     * @tc.name: graphicImagePixelMap_static_3400
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let scaleX: float = 2;
        let scaleY: float = 1;
        try {
          pixelMap.scaleSync(scaleX, scaleY, image.AntiAliasingLevel.HIGH);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_3500
     * @tc.name: graphicImagePixelMap_static_3500
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let angle: float = 90;
        try {
          await pixelMap.rotate(angle).then(() => {
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
     * @tc.number: graphicImagePixelMap_static_3600
     * @tc.name: graphicImagePixelMap_static_3600
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let angle: float = 90;
        // callback
        try {
          pixelMap.rotate(angle, (err: BusinessError | null) => {
            console.info('www data graphicImagePixelMap_static_3600 succeed')
            expect(true).assertTrue();
          })
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_3700
     * @tc.name: graphicImagePixelMap_static_3700
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let angle: float = 90;
        try {
          pixelMap.rotateSync(angle);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_3800
     * @tc.name: graphicImagePixelMap_static_3800
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let horizontal: boolean = true;
        let vertical: boolean = false;
        // callback
        try {
          pixelMap.flip(horizontal, vertical, (err: BusinessError | null) => {
            console.info('www data graphicImagePixelMap_static_3800 succeed')
            expect(true).assertTrue();
          })
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_3900
     * @tc.name: graphicImagePixelMap_static_3900
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let horizontal: boolean = true;
        let vertical: boolean = true;
        try {
          await pixelMap.flip(horizontal, vertical).then(() => {
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
     * @tc.number: graphicImagePixelMap_static_4000
     * @tc.name: graphicImagePixelMap_static_4000
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let horizontal: boolean = false;
        let vertical: boolean = true;
        try {
          pixelMap.flipSync(horizontal, vertical);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_4100
     * @tc.name: graphicImagePixelMap_static_4100
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
        // callback
        try {
          pixelMap.crop(region, (err: BusinessError | null) => {
            console.info('www data graphicImagePixelMap_static_4100 succeed')
            expect(true).assertTrue();
          })
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_4200
     * @tc.name: graphicImagePixelMap_static_4200
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
        try {
          await pixelMap.crop(region).then(() => {
            console.info('www data 4200 Succeeded in cropping pixelmap.');
            expect(true).assertTrue();
          }).catch((err) => {
            console.error('www data 4200 Failed to crop pixelmap.');
            expect().assertFail();
          });;
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_4300
     * @tc.name: graphicImagePixelMap_static_4300
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
        try {
          pixelMap.cropSync(region);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_4400
     * @tc.name: graphicImagePixelMap_static_4400
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
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
     * @tc.number: graphicImagePixelMap_static_4500
     * @tc.name: graphicImagePixelMap_static_4500
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 }
        }
        try {
          pixelMap.setMemoryNameSync("PixelMapName Test");
          expect(true).assertTrue();
        } catch (err: BusinessError) {
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
     * @tc.number: graphicImagePixelMap_static_4600
     * @tc.name: graphicImagePixelMap_static_4600
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 }
        }
        try {
          const flag = pixelMap.isStrideAlignment;
          expect(false).assertEqual(flag);
        } catch (err: BusinessError) {
          console.info('www data graphicImagePixelMap_static_4600 error ' + JSON.stringify(err))
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_4700
     * @tc.name: graphicImagePixelMap_static_4700
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 }
        }
        try {
          pixelMap.release().then(() => {
            console.info('Succeeded in releasing graphicImagePixelMap_static_4700 object.');
            expect(true).assertTrue();
          }).catch((error) => {
            console.error('Failed to release graphicImagePixelMap_static_4700 object.');
            expect().assertFail();
          })
        } catch (err: BusinessError) {
          console.info('www data graphicImagePixelMap_static_4600 error ' + JSON.stringify(err))
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_4800
     * @tc.name: graphicImagePixelMap_static_4800
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 }
        }
        try {
          pixelMap.release((err: BusinessError<void> | null) => {
            console.info('Succeeded in releasing graphicImagePixelMap_static_4800 object.');
            expect(true).assertTrue();
          })
        } catch (err: BusinessError) {
          console.info('www data graphicImagePixelMap_static_4800 error ' + JSON.stringify(err))
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_4900
     * @tc.name: graphicImagePixelMap_static_4900
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const area : image.PositionArea = {
          pixels: new ArrayBuffer(8),
          offset: 0,
          stride: 8,
          region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
        };
        taskPoolTest(pixelMap);
        try {
          pixelMap.readPixelsSync(area);
          expect().assertFail();
        } catch (err: BusinessError) {
          expect(err.code == 501).assertTrue();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_5000
     * @tc.name: graphicImagePixelMap_static_5000
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const readBuffer: ArrayBuffer = new ArrayBuffer(96);
        taskPoolTest(pixelMap);
        try {
          pixelMap.readPixelsToBufferSync(readBuffer);
          expect().assertFail();
        } catch (err: BusinessError) {
          expect(err.code == 501).assertTrue();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_5100
     * @tc.name: graphicImagePixelMap_static_5100
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color : ArrayBuffer = new ArrayBuffer(96);  //96为需要创建的像素buffer大小，取值为：height * width *4。
        let bufferArr : Uint8Array = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i++) {
          bufferArr[i] = i + 1;
        }
        taskPoolTest(pixelMap);
        try {
          pixelMap.writeBufferToPixelsSync(color);
          expect().assertFail();
        } catch (err: BusinessError) {
          expect(err.code == 501).assertTrue();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_5200
     * @tc.name: graphicImagePixelMap_static_5200
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        taskPoolTest(pixelMap);
        try {
          pixelMap.getImageInfoSync();
          expect().assertFail();
        } catch (err: BusinessError) {
          expect(err.code == 501).assertTrue();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_5300
     * @tc.name: graphicImagePixelMap_static_5300
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let rate: float = 5;
        taskPoolTest(pixelMap);
        try {
          pixelMap.opacitySync(rate);
          expect().assertFail();
        } catch (err: BusinessError) {
          expect(err.code == 501).assertTrue();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_5400
     * @tc.name: graphicImagePixelMap_static_5400
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        taskPoolTest(pixelMap);
        try {
          pixelMap.createAlphaPixelmapSync();
          expect().assertFail();
        } catch (err: BusinessError) {
          expect(err.code == 501).assertTrue();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_5500
     * @tc.name: graphicImagePixelMap_static_5500
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let scaleX: float = 2;
        let scaleY: float = 1;
        taskPoolTest(pixelMap);
        try {
          pixelMap.scaleSync(scaleX, scaleY);
          expect().assertFail();
        } catch (err: BusinessError) {
          expect(err.code == 501).assertTrue();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_5600
     * @tc.name: graphicImagePixelMap_static_5600
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let scaleX: float = 2;
        let scaleY: float = 1;
        taskPoolTest(pixelMap);
        try {
          pixelMap.scaleSync(scaleX, scaleY, image.AntiAliasingLevel.HIGH);
          expect().assertFail();
        } catch (err: BusinessError) {
          expect(err.code == 501).assertTrue();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_5700
     * @tc.name: graphicImagePixelMap_static_5700
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let scaleX: float = 2;
        let scaleY: float = 1;
        taskPoolTest(pixelMap);
        try {
          await pixelMap.scale(scaleX, scaleY, image.AntiAliasingLevel.LOW).then(() => {
            console.info('www data 5700 Succeeded in scaling pixelmap.');
            expect().assertFail();
          }).catch((err: Error) => {
            let e = err as BusinessError;
            expect(e.code == 501).assertTrue();
          });
          await pixelMap.scale(scaleX, scaleY, image.AntiAliasingLevel.LOW).then(() => {
            console.info('www data 5700 Succeeded in scaling pixelmap.');
            expect().assertFail();
          }).catch((err: Error) => {
            let e = err as BusinessError;
            expect(e.code == 501).assertTrue();
          });
          await pixelMap.scale(scaleX, scaleY, image.AntiAliasingLevel.NONE).then(() => {
            console.info('www data 5700 Succeeded in scaling pixelmap.');
            expect().assertFail();
          }).catch((err: Error) => {
            let e = err as BusinessError;
            expect(e.code == 501).assertTrue();
          });
          await pixelMap.scale(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM).then(() => {
            console.info('www data 5700 Succeeded in scaling pixelmap.');
            expect().assertFail();
          }).catch((err: Error) => {
            let e = err as BusinessError;
            expect(e.code == 501).assertTrue();
          });
        } catch (err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_5800
     * @tc.name: graphicImagePixelMap_static_5800
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let angle: float = 90;
        taskPoolTest(pixelMap);
        try {
          pixelMap.rotateSync(angle);
          expect().assertFail();
        } catch (err: BusinessError) {
          expect(err.code == 501).assertTrue();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_5900
     * @tc.name: graphicImagePixelMap_static_5900
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let horizontal: boolean = false;
        let vertical: boolean = true;
        taskPoolTest(pixelMap);
        try {
          pixelMap.flipSync(horizontal, vertical);
          expect().assertFail();
        } catch (err: BusinessError) {
          expect(err.code == 501).assertTrue();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_6000
     * @tc.name: graphicImagePixelMap_static_6000
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
        taskPoolTest(pixelMap);
        try {
          pixelMap.cropSync(region);
          expect().assertFail();
        } catch (err: BusinessError) {
          expect(err.code == 501).assertTrue();
        }
        done();
      })

    /**
     * @tc.number: graphicImagePixelMap_static_6100
     * @tc.name: graphicImagePixelMap_static_6100
     * @tc.desc: image API ArkTS1.2
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('graphicImagePixelMap_static_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 }
        }
        taskPoolTest(pixelMap);
        try {
          pixelMap.setMemoryNameSync("PixelMapName Test");
          expect().assertFail();
        } catch (err: BusinessError) {
          console.info('www data 6100 ' + JSON.stringify(err));
          expect(err.code == 501).assertTrue();
        }
        done();
      })
  })
}