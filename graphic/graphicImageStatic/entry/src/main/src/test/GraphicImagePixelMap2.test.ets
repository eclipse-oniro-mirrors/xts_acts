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
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import { taskPoolTest } from '../utils/Taskpool';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext: common.UIAbilityContext;
let pixelMap: image.PixelMap;

export default function graphicImagePixelMap2() {

  describe("graphicImagePixelMap2", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(() => {
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
      }
      pixelMap = image.createPixelMapSync(opts);
    })

    /**
     * @tc.name   graphicImagePixelMap2_static_0100
     * @tc.number graphicImagePixelMap2_static_0100
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let scaleX: double = 2.0;
        let scaleY: double = 1.0;
        if (pixelMap != undefined) {
          await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.NONE)
            .then((scaledPixelMap: image.PixelMap) => {
              console.info('www data Succeeded in creating scaledPixelMap.' + scaledPixelMap);
              expect(scaledPixelMap !== undefined).assertTrue();
            }).catch((error) => {
              console.error(`www data Failed to create scaledPixelMap. Error code is ${error.code}`);
              expect().assertFail();
            })
          await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.LOW)
            .then((scaledPixelMap: image.PixelMap) => {
              console.info('www data Succeeded in creating scaledPixelMap.' + scaledPixelMap);
              expect(scaledPixelMap !== undefined).assertTrue();
            }).catch((error) => {
              console.error(`www data Failed to create scaledPixelMap. Error code is ${error.code}`);
              expect().assertFail();
            })
          await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM)
            .then((scaledPixelMap: image.PixelMap) => {
              console.info('www data Succeeded in creating scaledPixelMap.' + scaledPixelMap);
              expect(scaledPixelMap !== undefined).assertTrue();
            }).catch((error) => {
              console.error(`www data Failed to create scaledPixelMap. Error code is ${error.code}`);
              expect().assertFail();
            })
          await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.HIGH)
            .then((scaledPixelMap: image.PixelMap) => {
              console.info('www data Succeeded in creating scaledPixelMap.' + scaledPixelMap);
              expect(scaledPixelMap !== undefined).assertTrue();
            }).catch((error) => {
              console.error(`www data Failed to create scaledPixelMap. Error code is ${error.code}`);
              expect().assertFail();
            })
          await pixelMap.createScaledPixelMap(scaleX, scaleY)
            .then((scaledPixelMap: image.PixelMap) => {
              console.info('www data Succeeded in creating scaledPixelMap.' + scaledPixelMap);
              expect(scaledPixelMap !== undefined).assertTrue();
            }).catch((error) => {
              console.error(`www data Failed to create scaledPixelMap. Error code is ${error.code}`);
              expect().assertFail();
            })
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_static_0200
     * @tc.number graphicImagePixelMap2_static_0200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let scaleX: double = 2.0;
        let scaleY: double = 1.0;
        if (pixelMap != undefined) {
          try {
            let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.NONE);
            expect(scaledPixelMap !== undefined).assertTrue();
          } catch (err) {
            expect().assertFail();
          }
          try {
            let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.LOW);
            expect(scaledPixelMap !== undefined).assertTrue();
          } catch (err) {
            expect().assertFail();
          }
          try {
            let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM);
            expect(scaledPixelMap !== undefined).assertTrue();
          } catch (err) {
            expect().assertFail();
          }
          try {
            let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.HIGH);
            expect(scaledPixelMap !== undefined).assertTrue();
          } catch (err) {
            expect().assertFail();
          }
          try {
            let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY);
            expect(scaledPixelMap !== undefined).assertTrue();
          } catch (err) {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_static_0300
     * @tc.number graphicImagePixelMap2_static_0300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let translateX: double = 50.0;
        let translateY: double = 10.0;
        if (pixelMap != undefined) {
          pixelMap.translate(translateX, translateY, (err: BusinessError | null) => {
            if (err) {
              console.error(`Failed to translate pixelmap. code is ${err.code}, message is ${err.message}`);
              expect().assertFail();
              return;
            } else {
              console.info("Succeeded in translating pixelmap.");
            }
          })
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_static_0400
     * @tc.number graphicImagePixelMap2_static_0400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let translateX: double = 50.0;
        let translateY: double = 10.0;
        if (pixelMap != undefined) {
          pixelMap.translate(translateX, translateY).then(() => {
            console.info('Succeeded in translating pixelmap.');
          }).catch((err) => {
            console.error(`Failed to translate pixelmap. code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
          })
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_static_0500
     * @tc.number graphicImagePixelMap2_static_0500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let translateX: double = 50.0;
        let translateY: double = 10.0;
        if (pixelMap != undefined) {
          try {
            pixelMap.translateSync(translateX, translateY);
          } catch (err) {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_static_0600
     * @tc.number graphicImagePixelMap2_static_0600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (pixelMap != undefined) {
          pixelMap.clone().then((clonePixelMap: image.PixelMap) => {
            console.info('Succeeded clone pixelmap.');
            expect(clonePixelMap !== undefined).assertTrue();
          }).catch((error) => {
            console.error(`Failed to clone pixelmap. code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
          })
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_static_0700
     * @tc.number graphicImagePixelMap2_static_0700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (pixelMap != undefined) {
          try {
            let clonePixelMap:image.PixelMap = pixelMap.cloneSync();
            expect(clonePixelMap !== undefined).assertTrue();
          } catch(e) {
            let error = e as BusinessError;
            console.error(`clone pixelmap error. code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_static_0800
     * @tc.number graphicImagePixelMap2_static_0800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
        };
        pixelMap.setMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA, staticMetadata).then(() => {
          console.info('www data Succeeded in setting pixelMap metadata.');
          expect().assertFail();
        }).catch((error) => {
          console.error("www data Failed to set the metadata.code ", error);
          console.error("www data Failed to set the metadata.code ", error.code);
          expect(Number(error.code) == 62980173).assertTrue();
        })
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_static_0900
     * @tc.number graphicImagePixelMap2_static_0900
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (pixelMap != undefined) {
          console.info('www data Succeeded in creating pixelMap object.');
          try {
            let staticMetadata = pixelMap.getMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA);
            console.info(`www data getMetadata:${staticMetadata}`);
            expect().assertFail();
          } catch (error) {
            error = error as BusinessError;
            console.error('www data pixelmap create failed' + error);
            console.error('www data pixelmap create failed' + JSON.stringify(error));
          }
        } else {
          console.error('www data Failed to create pixelMap.');
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_static_1000
     * @tc.number graphicImagePixelMap2_static_1000
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const options: image.InitializationOptions = {
          pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 512, width: 512 }
        }
        const pixelMap = image.createPixelMapSync(options);
        console.info('www data ' + pixelMap.isStrideAlignment)
        if (pixelMap.isStrideAlignment) {
          console.info('www data Succeeded in creating pixelMap object.');
          await pixelMap.setMetadata(image.HdrMetadataKey.HDR_METADATA_TYPE, image.HdrMetadataType.BASE).then(() => {
            console.info('www data Succeeded in setting pixelMap metadata1111111111.');
            let metadataType = pixelMap.getMetadata(image.HdrMetadataKey.HDR_METADATA_TYPE) as image.HdrMetadataType;
            console.info('www data metadataType ' + image.HdrMetadataKey.HDR_METADATA_TYPE);
            expect('0').assertEqual(image.HdrMetadataKey.HDR_METADATA_TYPE + '');
          }).catch((error) => {
            console.error("www data Failed to set the metadata.code ", error);
            expect().assertFail();
          })
        } 
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_static_1100
     * @tc.number graphicImagePixelMap2_static_1100
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const options: image.InitializationOptions = {
          pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 512, width: 512 }
        }
        const pixelMap = image.createPixelMapSync(options);
        console.info('www data ' + pixelMap.isStrideAlignment)
        if (pixelMap.isStrideAlignment) {
          console.info('www data Succeeded in creating pixelMap object.');
          await pixelMap.setMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA, image.HdrMetadataType.BASE).then(() => {
            console.info('www data Succeeded in setting pixelMap metadata1111111111.');
            let metadataType = pixelMap.getMetadata(image.HdrMetadataKey.HDR_METADATA_TYPE) as image.HdrMetadataType;
            console.info('www data metadataType ' + image.HdrMetadataKey.HDR_METADATA_TYPE);
            expect().assertFail();
          }).catch((error) => {
            console.error("www data Failed to set the metadata.code 22", error);
            console.error("www data Failed to set the metadata.code 22", error.code);
            expect(Number(error.code) == 62980302).assertTrue();
          })
        } 
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_static_1200
     * @tc.number graphicImagePixelMap2_static_1200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const options: image.InitializationOptions = {
          pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 512, width: 512 }
        }
        const pixelMap = image.createPixelMapSync(options);
        console.info('www data ' + pixelMap.isStrideAlignment)
        if (pixelMap.isStrideAlignment) {
          console.info('www data Succeeded in creating pixelMap object.');
          await pixelMap.setMetadata(image.HdrMetadataKey.HDR_METADATA_TYPE, image.HdrMetadataType.BASE).then(() => {
            console.info('www data Succeeded in setting pixelMap metadata1111111111333.');
            try {
              let metadataType = pixelMap.getMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA) as image.HdrMetadataType;
              console.info('www data metadataType ' + image.HdrMetadataKey.HDR_STATIC_METADATA);
              expect().assertFail();
            } catch(error) {
              console.error("www data Failed to set the getMetadata.code 33", error);
              console.error("www data Failed to set the getMetadata.code 33", JSON.stringify(error));
            }
          }).catch((error) => {
            console.error("www data Failed to set the metadata.code 44", error);
            console.error("www data Failed to set the metadata.code 44", error.code);
            expect().assertFail();
          })
        } 
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_static_1300
     * @tc.number graphicImagePixelMap2_static_1300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (pixelMap != undefined) {
          try {
            pixelMap.setTransferDetached(true);
          } catch (err) {
            expect().assertFail();
          }
        }
        done();
      })

  })
}