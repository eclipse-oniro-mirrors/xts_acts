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
import { BusinessError } from '@ohos.base';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function graphicImagePixelMap2() {

  describe("graphicImagePixelMap2", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(() => {
    })

    /**
     * @tc.name   graphicImagePixelMap2_0100
     * @tc.number graphicImagePixelMap2_0100
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap2_0100';
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          await pixelMap!.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.NONE)
            .then(async (scaledPixelMap: image.PixelMap) => {
              console.info(msgStr, scaledPixelMap.isEditable, scaledPixelMap.isStrideAlignment);
              expect(scaledPixelMap !== undefined).assertTrue();
              expect(scaledPixelMap.isEditable).assertFalse();
              expect(scaledPixelMap.isStrideAlignment).assertFalse();
              await scaledPixelMap.release();
            }).catch((error: BusinessError) => {
              console.error(msgStr, `Failed to create scaledPixelMap. Error code is ${error.code}`);
              expect().assertFail();
            })
          await pixelMap!.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.LOW)
            .then(async (scaledPixelMap: image.PixelMap) => {
              console.info(msgStr, scaledPixelMap.isEditable, scaledPixelMap.isStrideAlignment);
              expect(scaledPixelMap !== undefined).assertTrue();
              await scaledPixelMap.release();
            }).catch((error: BusinessError) => {
              console.error(msgStr, `Failed to create scaledPixelMap. Error code is ${error.code}`);
              expect().assertFail();
            })
          await pixelMap!.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM)
            .then(async (scaledPixelMap: image.PixelMap) => {
              console.info(msgStr, scaledPixelMap.isEditable, scaledPixelMap.isStrideAlignment);
              expect(scaledPixelMap !== undefined).assertTrue();
              await scaledPixelMap.release();
            }).catch((error: BusinessError) => {
              console.error(msgStr, `Failed to create scaledPixelMap. Error code is ${error.code}`);
              expect().assertFail();
            })
          await pixelMap!.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.HIGH)
            .then(async (scaledPixelMap: image.PixelMap) => {
              console.info(msgStr, scaledPixelMap.isEditable, scaledPixelMap.isStrideAlignment);
              expect(scaledPixelMap !== undefined).assertTrue();
              await scaledPixelMap.release();
            }).catch((error: BusinessError) => {
              console.error(msgStr, `Failed to create scaledPixelMap. Error code is ${error.code}`);
              expect().assertFail();
            })
          await pixelMap!.createScaledPixelMap(scaleX, scaleY)
            .then(async (scaledPixelMap: image.PixelMap) => {
              console.info(msgStr, scaledPixelMap.isEditable, scaledPixelMap.isStrideAlignment);
              expect(scaledPixelMap !== undefined).assertTrue();
              await scaledPixelMap.release();
            }).catch((error: BusinessError) => {
              console.error(msgStr, `Failed to create scaledPixelMap. Error code is ${error.code}`);
              expect().assertFail();
            })
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_0200
     * @tc.number graphicImagePixelMap2_0200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap2_0200';
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          try {
            let scaledPixelMap = pixelMap!.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.NONE);
            console.info(msgStr, scaledPixelMap.isEditable, scaledPixelMap.isStrideAlignment);
            expect(scaledPixelMap !== undefined).assertTrue();
            expect(scaledPixelMap.isEditable).assertFalse();
            expect(scaledPixelMap.isStrideAlignment).assertFalse();
            await scaledPixelMap.release();
          } catch (err) {
            expect().assertFail();
          }
          try {
            let scaledPixelMap = pixelMap!.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.LOW);
            console.info(msgStr, scaledPixelMap.isEditable, scaledPixelMap.isStrideAlignment);
            expect(scaledPixelMap !== undefined).assertTrue();
            await scaledPixelMap.release();
          } catch (err) {
            expect().assertFail();
          }
          try {
            let scaledPixelMap = pixelMap!.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM);
            console.info(msgStr, scaledPixelMap.isEditable, scaledPixelMap.isStrideAlignment);
            expect(scaledPixelMap !== undefined).assertTrue();
            await scaledPixelMap.release();
          } catch (err) {
            expect().assertFail();
          }
          try {
            let scaledPixelMap = pixelMap!.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.HIGH);
            console.info(msgStr, scaledPixelMap.isEditable, scaledPixelMap.isStrideAlignment);
            expect(scaledPixelMap !== undefined).assertTrue();
            await scaledPixelMap.release();
          } catch (err) {
            expect().assertFail();
          }
          try {
            let scaledPixelMap = pixelMap!.createScaledPixelMapSync(scaleX, scaleY);
            console.info(msgStr, scaledPixelMap.isEditable, scaledPixelMap.isStrideAlignment);
            expect(scaledPixelMap !== undefined).assertTrue();
            await scaledPixelMap.release();
          } catch (err) {
            expect().assertFail();
          }
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_0300
     * @tc.number graphicImagePixelMap2_0300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let translateX: number = 50.0;
        let translateY: number = 10.0;
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          pixelMap!.translate(translateX, translateY, (err: BusinessError | null) => {
            if (err) {
              console.error(`Failed to translate pixelmap. code is ${err.code}, message is ${err.message}`);
              expect().assertFail();
              done();
            } else {
              console.info("Succeeded in translating pixelmap.");
              pixelMap.release();
              done();
            }
          })
        }
      })

    /**
     * @tc.name   graphicImagePixelMap2_0400
     * @tc.number graphicImagePixelMap2_0400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let translateX: number = 50.0;
        let translateY: number = 10.0;
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          await pixelMap!.translate(translateX, translateY).then(async () => {
            console.info('Succeeded in translating pixelmap.');
            await pixelMap.release();
            done();
          }).catch((err: BusinessError) => {
            console.error(`Failed to translate pixelmap. code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          })
        }
      })

    /**
     * @tc.name   graphicImagePixelMap2_0500
     * @tc.number graphicImagePixelMap2_0500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let translateX: number = 50.0;
        let translateY: number = 10.0;
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          try {
            pixelMap!.translateSync(translateX, translateY);
            await pixelMap?.release();
            done();
          } catch (err) {
            expect().assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   graphicImagePixelMap2_0600
     * @tc.number graphicImagePixelMap2_0600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          await pixelMap!.clone().then(async (clonePixelMap: image.PixelMap) => {
            console.info('Succeeded clone pixelmap.');
            console.info('www data graphicImagePixelMap2_0600 ', clonePixelMap.isEditable,
              clonePixelMap.isStrideAlignment);
            expect(clonePixelMap.isEditable).assertTrue();
            expect(clonePixelMap.isStrideAlignment).assertFalse();
            await pixelMap.release();
            done();
          }).catch((error: BusinessError) => {
            console.error(`www data Failed to clone pixelmap. code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          })
        }
      })

    /**
     * @tc.name   graphicImagePixelMap2_0700
     * @tc.number graphicImagePixelMap2_0700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          let opts: image.InitializationOptions = {
            editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
          }
          let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
          try {
            let clonePixelMap:image.PixelMap = pixelMap!.cloneSync();
            console.info('www data graphicImagePixelMap2_0700 ', clonePixelMap.isEditable,
              clonePixelMap.isStrideAlignment);
            expect(clonePixelMap.isEditable).assertTrue();
            expect(clonePixelMap.isStrideAlignment).assertFalse();
            await pixelMap.release();
            done();
          } catch(e) {
            let error = e as BusinessError;
            console.error(`www data clone pixelmap error. code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   graphicImagePixelMap2_0800
     * @tc.number graphicImagePixelMap2_0800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        await pixelMap?.setMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA, staticMetadata).then(async () => {
          console.info('www data Succeeded in setting pixelMap metadata.');
          expect().assertFail();
          await pixelMap?.release();
          done();
        }).catch(async (error: BusinessError) => {
          console.error("www data Failed to set the metadata.code ", error);
          expect(Number(error) == 62980173).assertTrue();
          await pixelMap?.release();
          done();
        })
      })

    /**
     * @tc.name   graphicImagePixelMap2_0900
     * @tc.number graphicImagePixelMap2_0900
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          console.info('www data Succeeded in creating pixelMap object.');
          try {
            let staticMetadata = pixelMap!.getMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA);
            console.info(`www data getMetadata:${staticMetadata}`);
            expect().assertFail();
            await pixelMap.release();
            done();
          } catch (error) {
            error = error as BusinessError;
            console.error('www data pixelmap create failed' + error);
            console.error('www data pixelmap create failed' + JSON.stringify(error));
            expect(Number(error.code)).assertEqual(62980173);
            await pixelMap.release();
            done();
          }
        } else {
          console.error('www data Failed to create pixelMap.');
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap2_1000
     * @tc.number graphicImagePixelMap2_1000
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const options: image.InitializationOptions = {
          pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 512, width: 512 }
        }
        let pixelMap = image.createPixelMapSync(options);
        console.info('www data ' + pixelMap.isStrideAlignment)
        if (pixelMap?.isStrideAlignment) {
          console.info('www data Succeeded in creating pixelMap object.');
          await pixelMap!.setMetadata(image.HdrMetadataKey.HDR_METADATA_TYPE, image.HdrMetadataType.BASE).then(() => {
            console.info('www data Succeeded in setting pixelMap metadata1111111111.');
            let metadataType = pixelMap!.getMetadata(image.HdrMetadataKey.HDR_METADATA_TYPE) as image.HdrMetadataType;
            console.info('www data metadataType ' + image.HdrMetadataKey.HDR_METADATA_TYPE);
            expect('0').assertEqual(image.HdrMetadataKey.HDR_METADATA_TYPE + '');
          }).catch((error: BusinessError) => {
            console.error("www data Failed to set the metadata.code ", error);
            expect().assertFail();
          })
          await pixelMap.release();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_1100
     * @tc.number graphicImagePixelMap2_1100
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const options: image.InitializationOptions = {
          pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 512, width: 512 }
        }
        const pixelMap = image.createPixelMapSync(options);
        console.info('www data ' + pixelMap.isStrideAlignment)
        if (pixelMap!.isStrideAlignment) {
          console.info('www data Succeeded in creating pixelMap object.');
          await pixelMap!.setMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA, image.HdrMetadataType.BASE).then(() => {
            console.info('www data Succeeded in setting pixelMap metadata1111111111.');
            let metadataType = pixelMap!.getMetadata(image.HdrMetadataKey.HDR_METADATA_TYPE) as image.HdrMetadataType;
            console.info('www data metadataType ' + image.HdrMetadataKey.HDR_METADATA_TYPE);
            expect().assertFail();
          }).catch((error: BusinessError) => {
            console.error("www data Failed to set the metadata.code 22", error);
            expect(Number(error) == 62980115).assertTrue();
          })
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_1200
     * @tc.number graphicImagePixelMap2_1200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const options: image.InitializationOptions = {
          pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 512, width: 512 }
        }
        const pixelMap = image.createPixelMapSync(options);
        console.info('www data ' + pixelMap!.isStrideAlignment)
        if (pixelMap!.isStrideAlignment) {
          console.info('www data Succeeded in creating pixelMap object.');
          await pixelMap!.setMetadata(image.HdrMetadataKey.HDR_METADATA_TYPE, image.HdrMetadataType.BASE).then(() => {
            console.info('www data Succeeded in setting pixelMap metadata1111111111333.');
            try {
              let metadataType = pixelMap!.getMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA) as image.HdrMetadataType;
              console.info('www data metadataType ' + image.HdrMetadataKey.HDR_STATIC_METADATA);
              expect().assertFail();
            } catch(error) {
              console.error("www data Failed to set the getMetadata.code 33", error);
              console.error("www data Failed to set the getMetadata.code 33", JSON.stringify(error));
            }
          }).catch((error: BusinessError) => {
            console.error("www data Failed to set the metadata.code 44", error);
            console.error("www data Failed to set the metadata.code 44", error.code);
            expect().assertFail();
          })
          await pixelMap.release();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_1300
     * @tc.number graphicImagePixelMap2_1300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          try {
            pixelMap!.setTransferDetached(true);
            await pixelMap.release();
            done();
          } catch (err) {
            expect().assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   graphicImagePixelMap2_1400
     * @tc.number graphicImagePixelMap2_1400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          try {
            pixelMap!.setTransferDetached(false);
            console.info('www data graphicImagePixelMap2_1400 success');
            await pixelMap.release();
            done();
          } catch (err) {
            console.info('www data graphicImagePixelMap2_1400 err ', err);
            expect().assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   graphicImagePixelMap2_1500
     * @tc.number graphicImagePixelMap2_1500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap2_1500';
        const options: image.InitializationOptions = {
          pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 512, width: 512 }
        }
        const pixelMap = image.createPixelMapSync(options);
        if (pixelMap != undefined) {
          console.info(msgStr + 'Succeeded in creating pixelMap object.');
          try {
            let staticMetadata = pixelMap!.getMetadata(image.HdrMetadataKey.HDR_DYNAMIC_METADATA);
            console.info(msgStr + ` getMetadata:${staticMetadata}`);
            expect().assertFail();
          } catch (error) {
            error = error as BusinessError;
            console.error(msgStr + 'pixelmap create failed' + error.code);
            expect(Number(error.code)).assertEqual(62980302);
          }
        } else {
          console.error(msgStr + 'Failed to create pixelMap.');
          expect().assertFail();
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_1600
     * @tc.number graphicImagePixelMap2_1600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap2_1600';const options: image.InitializationOptions = {
          pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 512, width: 512 }
        }
        const pixelMap = image.createPixelMapSync(options);
        if (pixelMap != undefined) {
          console.info(msgStr + 'Succeeded in creating pixelMap object.');
          try {
            let staticMetadata = pixelMap!.getMetadata(image.HdrMetadataKey.HDR_GAINMAP_METADATA);
            console.info(msgStr + ` getMetadata:${staticMetadata}`);
            expect().assertFail();
          } catch (error) {
            error = error as BusinessError;
            console.error(msgStr + 'pixelmap create failed' + error.code);
            expect(Number(error.code)).assertEqual(62980302);
          }
        } else {
          console.error(msgStr + 'Failed to create pixelMap.');
          expect().assertFail();
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_1700
     * @tc.number graphicImagePixelMap2_1700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap2_1700';
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          await pixelMap!.convertPixelFormat(image.PixelMapFormat.UNKNOWN).then(() => {
            console.info(msgStr + 'PixelMapFormat convert Succeeded');
            expect().assertFail();
          }).catch((error: BusinessError) => {
            console.error(msgStr + `PixelMapFormat convert Failed.`, error);
            expect(error).assertEqual(62980115);
          })
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_1800
     * @tc.number graphicImagePixelMap2_1800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap2_1800';
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          await pixelMap!.convertPixelFormat(image.PixelMapFormat.ARGB_8888).then(() => {
            console.info(msgStr + 'PixelMapFormat convert Succeeded');
            expect().assertFail();
          }).catch((error: BusinessError) => {
            console.error(msgStr + `PixelMapFormat convert Failed.`, error.code);
            expect(Number(error.code)).assertEqual(62980115);
          })
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_1900
     * @tc.number graphicImagePixelMap2_1900
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap2_1900';
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          await pixelMap!.convertPixelFormat(image.PixelMapFormat.RGB_565).then(() => {
            console.info(msgStr + 'PixelMapFormat convert Succeeded');
            expect().assertFail();
          }).catch((error: BusinessError) => {
            console.error(msgStr + `PixelMapFormat convert Failed.`, error.code);
            expect(Number(error.code)).assertEqual(62980115);
          })
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_2000
     * @tc.number graphicImagePixelMap2_2000
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap2_2000';
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          await pixelMap!.convertPixelFormat(image.PixelMapFormat.RGBA_8888).then(() => {
            console.info(msgStr + 'PixelMapFormat convert Succeeded');
            expect().assertFail();
          }).catch((error: BusinessError) => {
            console.error(msgStr + `PixelMapFormat convert Failed.`, error.code);
            expect(Number(error.code)).assertEqual(62980115);
          })
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_2100
     * @tc.number graphicImagePixelMap2_2100
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap2_2100';
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          await pixelMap!.convertPixelFormat(image.PixelMapFormat.BGRA_8888).then(() => {
            console.info(msgStr + 'PixelMapFormat convert Succeeded');
            expect().assertFail();
          }).catch((error: BusinessError) => {
            console.error(msgStr + `PixelMapFormat convert Failed.`, error.code);
            expect(Number(error.code)).assertEqual(62980115);
          })
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_2200
     * @tc.number graphicImagePixelMap2_2200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap2_2200';
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          await pixelMap!.convertPixelFormat(image.PixelMapFormat.RGB_888).then(() => {
            console.info(msgStr + 'PixelMapFormat convert Succeeded');
            expect().assertFail();
          }).catch((error: BusinessError) => {
            console.error(msgStr + `PixelMapFormat convert Failed.`, error.code);
            expect(Number(error.code)).assertEqual(62980115);
          })
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_2300
     * @tc.number graphicImagePixelMap2_2300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap2_2300';
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          await pixelMap!.convertPixelFormat(image.PixelMapFormat.ALPHA_8).then(() => {
            console.info(msgStr + 'PixelMapFormat convert Succeeded');
            expect().assertFail();
          }).catch((error: BusinessError) => {
            console.error(msgStr + `PixelMapFormat convert Failed.`, error);
            expect(error).assertEqual(62980115);
          })
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_2400
     * @tc.number graphicImagePixelMap2_2400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap2_2400';
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          await pixelMap!.convertPixelFormat(image.PixelMapFormat.RGBA_F16).then(() => {
            console.info(msgStr + 'PixelMapFormat convert Succeeded');
            expect().assertFail();
          }).catch((error: BusinessError) => {
            console.error(msgStr + `PixelMapFormat convert Failed.`, error.code);
            expect(Number(error.code)).assertEqual(62980115);
          })
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_2500
     * @tc.number graphicImagePixelMap2_2500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap2_2500';
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          try {
            await pixelMap.convertPixelFormat(image.PixelMapFormat.NV21);
            console.info(msgStr + 'PixelMapFormat convert Succeeded');
          } catch(err){
            console.info(msgStr + 'PixelMapFormat convert failed ', err);
            expect().assertFail();
          }
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_2600
     * @tc.number graphicImagePixelMap2_2600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap2_2600';
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          try {
            await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_1010102);
            console.info(msgStr + 'PixelMapFormat convert Succeeded');
            expect().assertFail();
          } catch(err){
            console.info(msgStr + 'PixelMapFormat convert failed ', err.code);
            expect(Number(err.code)).assertEqual(62980115);
          }
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_2700
     * @tc.number graphicImagePixelMap2_2700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap2_2700';
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          try {
            await pixelMap.convertPixelFormat(image.PixelMapFormat.YCBCR_P010);
            console.info(msgStr + 'PixelMapFormat convert Succeeded');
          } catch(err){
            console.info(msgStr + 'PixelMapFormat convert failed ', err);
            expect().assertFail();
          }
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_2800
     * @tc.number graphicImagePixelMap2_2800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap2_2800';
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          try {
            await pixelMap.convertPixelFormat(image.PixelMapFormat.YCRCB_P010);
            console.info(msgStr + 'PixelMapFormat convert Succeeded');
          } catch(err){
            console.info(msgStr + 'PixelMapFormat convert failed ', err);
            expect().assertFail();
          }
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_3000
     * @tc.number graphicImagePixelMap2_3000
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        try {
          pixelMap!.flipSync(true, false);
          console.info('www data graphicImagePixelMap2_3000 success.');
        } catch (err) {
          console.info('www data graphicImagePixelMap2_3000 failed.', err);
          expect().assertFail();
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_3100
     * @tc.number graphicImagePixelMap2_3100
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        // callback
        try {
          pixelMap!.flip(false, true, (err: BusinessError | null) => {
            console.info('www data graphicImagePixelMap2_3100 succeed')
            pixelMap!.release();
            done();
          })
        } catch (err) {
          console.info('www data graphicImagePixelMap2_3100 failed', JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap2_3200
     * @tc.number graphicImagePixelMap2_3200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        try {
          await pixelMap!.flip(false, false).then(() => {
            console.info('www data graphicImagePixelMap2_3200 Succeeded in flipping pixelmap.');
          }).catch((err: BusinessError) => {
            console.error('www data graphicImagePixelMap2_3200 Failed to flip pixelmap.', JSON.stringify(err));
            expect().assertFail();
          });
        } catch (err) {
          expect().assertFail();
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_3300
     * @tc.number graphicImagePixelMap2_3300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap2_3300';
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        if (pixelMap != undefined) {
          await pixelMap!.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.NONE)
            .then((scaledPixelMap: image.PixelMap) => {
              console.info(msgStr, scaledPixelMap.isEditable, scaledPixelMap.isStrideAlignment);
              expect(scaledPixelMap !== undefined).assertTrue();
              expect(scaledPixelMap.isEditable).assertFalse();
              expect(scaledPixelMap.isStrideAlignment).assertTrue();
            }).catch((error: BusinessError) => {
              console.error(msgStr, `Failed to create scaledPixelMap. Error code is ${error.code}`);
              expect().assertFail();
            })
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_3400
     * @tc.number graphicImagePixelMap2_3400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap2_3400';
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        if (pixelMap != undefined) {
          try {
            let scaledPixelMap = pixelMap!.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.NONE);
            console.info(msgStr, scaledPixelMap.isEditable, scaledPixelMap.isStrideAlignment);
            expect(scaledPixelMap !== undefined).assertTrue();
            expect(scaledPixelMap.isEditable).assertFalse();
            expect(scaledPixelMap.isStrideAlignment).assertTrue();
          } catch (err) {
            expect().assertFail();
          }
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_3500
     * @tc.number graphicImagePixelMap2_3500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap2_3500';
        let scaleX: number = 2;
        let scaleY: number = 1;
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        try {
          pixelMap!.scaleSync(scaleX, scaleY, image.AntiAliasingLevel.NONE);
          console.info(msgStr + 'success in scaleSync');
        } catch (err) {
          console.info(msgStr + 'failed to scaleSync', err);
          expect().assertFail();
        }
        try {
          pixelMap!.scaleSync(scaleX, scaleY, image.AntiAliasingLevel.LOW);
          console.info(msgStr + 'success in scaleSync');
        } catch (err) {
          console.info(msgStr + 'failed to scaleSync', err);
          expect().assertFail();
        }
        try {
          pixelMap!.scaleSync(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM);
          console.info(msgStr + 'success in scaleSync');
        } catch (err) {
          console.info(msgStr + 'failed to scaleSync', err);
          expect().assertFail();
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_3600
     * @tc.number graphicImagePixelMap2_3600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap2_3600';
        let scaleX: number = 2;
        let scaleY: number = 1;
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        try {
          await pixelMap!.scale(scaleX, scaleY, image.AntiAliasingLevel.HIGH).then(() => {
            console.info(msgStr, 'Succeeded in scaling pixelmap.');
          }).catch((err: BusinessError) => {
            console.error(msgStr, 'Failed to scale pixelmap.', err);
            expect().assertFail();
          });
        } catch (err) {
          expect().assertFail();
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_3700
     * @tc.number graphicImagePixelMap2_3700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        try {
          let pixelMap1 = pixelMap!.createAlphaPixelmapSync();
          console.info('www data graphicImagePixelMap2_3700 ',pixelMap1.isEditable, pixelMap1.isStrideAlignment);
          expect(pixelMap1.isEditable).assertFalse();
          expect(pixelMap1.isStrideAlignment).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_3800
     * @tc.number graphicImagePixelMap2_3800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        try {
          let imgInfo = pixelMap!.getImageInfoSync();
          console.info('www data graphicImagePixelMap2_3800 ', JSON.stringify(imgInfo));
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
     * @tc.name   graphicImagePixelMap2_3900
     * @tc.number graphicImagePixelMap2_3900
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        try {
          let imgInfoPromise = await pixelMap!.getImageInfo();
          console.info('www data graphicImagePixelMap2_3900 ', JSON.stringify(imgInfoPromise));
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
     * @tc.name   graphicImagePixelMap2_4000
     * @tc.number graphicImagePixelMap2_4000
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        try {
          pixelMap!.getImageInfo((err: BusinessError | null, imageInfoCallback: image.ImageInfo | undefined) => {
            if (err) {
              console.error(`www data Failed to obtain the image pixel map information. code is ${err.code}`);
              done();
            } else {
              console.info('www data graphicImagePixelMap2_4000 ', JSON.stringify(imageInfoCallback));
              expect(imageInfoCallback?.size.width).assertLargerOrEqual(0);
              expect(imageInfoCallback?.size.height).assertLargerOrEqual(0);
              expect(imageInfoCallback?.isHdr).assertFalse();
              expect(imageInfoCallback?.stride).assertLargerOrEqual(0);
              expect(imageInfoCallback?.density).assertLargerOrEqual(0);
              expect(imageInfoCallback?.mimeType === '').assertTrue();
              expect(imageInfoCallback?.alphaType).assertEqual(image.AlphaType.PREMUL);
              expect(imageInfoCallback?.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
              pixelMap.release();
              done();
            }
          })
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap2_4100
     * @tc.number graphicImagePixelMap2_4100
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN,
            size: { height: 4, width: 6 } }
          let pixelMap : image.PixelMap = image.createPixelMapSync(opts);
          let imgInfo = pixelMap.getImageInfoSync();
          console.info('www data graphicImagePixelMap2_4100 ', JSON.stringify(imgInfo));
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
          let imgInfoPromise = await pixelMap.getImageInfo();
          console.info('www data graphicImagePixelMap2_4100 ', JSON.stringify(imgInfoPromise));
          expect(imgInfoPromise.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
          pixelMap.getImageInfo((err: BusinessError | null, imageInfoCallback: image.ImageInfo | undefined) => {
            if(imageInfoCallback !== undefined){
              console.info('www data graphicImagePixelMap2_4100 ', JSON.stringify(imageInfoCallback));
              expect(imageInfoCallback?.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
              pixelMap.release();
              done();
            }
          })
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap2_4200
     * @tc.number graphicImagePixelMap2_4200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.ARGB_8888,
            size: { height: 4, width: 6 } }
          let pixelMap : image.PixelMap = image.createPixelMapSync(opts);
          let imgInfo = pixelMap.getImageInfoSync();
          console.info('www data graphicImagePixelMap2_4200 ', JSON.stringify(imgInfo));
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ARGB_8888);
          expect(imgInfo.isHdr).assertFalse();
          let imgInfoPromise = await pixelMap.getImageInfo();
          console.info('www data graphicImagePixelMap2_4200 ', JSON.stringify(imgInfoPromise));
          expect(imgInfoPromise.pixelFormat).assertEqual(image.PixelMapFormat.ARGB_8888);
          expect(imgInfoPromise.isHdr).assertFalse();
          pixelMap.getImageInfo((err: BusinessError | null, imageInfoCallback: image.ImageInfo | undefined) => {
            if(imageInfoCallback !== undefined){
              console.info('www data graphicImagePixelMap2_4200 ', JSON.stringify(imageInfoCallback));
              expect(imageInfoCallback?.pixelFormat).assertEqual(image.PixelMapFormat.ARGB_8888);
              expect(imageInfoCallback?.isHdr).assertFalse();
              pixelMap.release();
              done();
            }
          })
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap2_4300
     * @tc.number graphicImagePixelMap2_4300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGB_565,
            size: { height: 4, width: 6 } }
          let pixelMap : image.PixelMap = image.createPixelMapSync(opts);
          let imgInfo = pixelMap.getImageInfoSync();
          console.info('www data graphicImagePixelMap2_4300 ', JSON.stringify(imgInfo));
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGB_565);
          expect(imgInfo.alphaType).assertEqual(image.AlphaType.OPAQUE);
          let imgInfoPromise = await pixelMap.getImageInfo();
          console.info('www data graphicImagePixelMap2_4300 ', JSON.stringify(imgInfoPromise));
          expect(imgInfoPromise.pixelFormat).assertEqual(image.PixelMapFormat.RGB_565);
          expect(imgInfoPromise.alphaType).assertEqual(image.AlphaType.OPAQUE);
          pixelMap.getImageInfo((err: BusinessError | null, imageInfoCallback: image.ImageInfo | undefined) => {
            if(imageInfoCallback !== undefined){
              console.info('www data graphicImagePixelMap2_4300 ', JSON.stringify(imageInfoCallback));
              expect(imageInfoCallback?.pixelFormat).assertEqual(image.PixelMapFormat.RGB_565);
              expect(imageInfoCallback?.alphaType).assertEqual(image.AlphaType.OPAQUE);
              pixelMap.release();
              done();
            }
          })
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap2_4400
     * @tc.number graphicImagePixelMap2_4400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }, alphaType: image.AlphaType.UNPREMUL }
          let pixelMap : image.PixelMap = image.createPixelMapSync(opts);
          let imgInfo = pixelMap.getImageInfoSync();
          console.info('www data graphicImagePixelMap2_4400 ', JSON.stringify(imgInfo));
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
          expect(imgInfo.alphaType).assertEqual(image.AlphaType.UNPREMUL);
          let imgInfoPromise = await pixelMap.getImageInfo();
          console.info('www data graphicImagePixelMap2_4400 ', JSON.stringify(imgInfoPromise));
          expect(imgInfoPromise.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
          expect(imgInfoPromise.alphaType).assertEqual(image.AlphaType.UNPREMUL);
          pixelMap.getImageInfo((err: BusinessError | null, imageInfoCallback: image.ImageInfo | undefined) => {
            if(imageInfoCallback !== undefined){
              console.info('www data graphicImagePixelMap2_4400 ', JSON.stringify(imageInfoCallback));
              expect(imageInfoCallback?.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
              expect(imageInfoCallback?.alphaType).assertEqual(image.AlphaType.UNPREMUL);
              pixelMap.release();
              done();
            }
          })
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap2_4500
     * @tc.number graphicImagePixelMap2_4500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.BGRA_8888,
            size: { height: 4, width: 6 } }
          let pixelMap : image.PixelMap = image.createPixelMapSync(opts);
          let imgInfo = pixelMap.getImageInfoSync();
          console.info('www data graphicImagePixelMap2_4500 ', JSON.stringify(imgInfo));
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.BGRA_8888);
          let imgInfoPromise = await pixelMap.getImageInfo();
          console.info('www data graphicImagePixelMap2_4500 ', JSON.stringify(imgInfoPromise));
          expect(imgInfoPromise.pixelFormat).assertEqual(image.PixelMapFormat.BGRA_8888);
          pixelMap.getImageInfo((err: BusinessError | null, imageInfoCallback: image.ImageInfo | undefined) => {
            if(imageInfoCallback !== undefined){
              console.info('www data graphicImagePixelMap2_4500 ', JSON.stringify(imageInfoCallback));
              expect(imageInfoCallback?.pixelFormat).assertEqual(image.PixelMapFormat.BGRA_8888);
              pixelMap.release();
              done();
            }
          })
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap2_4600
     * @tc.number graphicImagePixelMap2_4600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGB_888,
            size: { height: 4, width: 6 } }
          let pixelMap : image.PixelMap = image.createPixelMapSync(opts);
          let imgInfo = pixelMap.getImageInfoSync();
          console.info('www data graphicImagePixelMap2_4600 ', JSON.stringify(imgInfo));
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGB_888);
          let imgInfoPromise = await pixelMap.getImageInfo();
          console.info('www data graphicImagePixelMap2_4600 ', JSON.stringify(imgInfoPromise));
          expect(imgInfoPromise.pixelFormat).assertEqual(image.PixelMapFormat.RGB_888);
          pixelMap.getImageInfo((err: BusinessError | null, imageInfoCallback: image.ImageInfo | undefined) => {
            if(imageInfoCallback !== undefined){
              console.info('www data graphicImagePixelMap2_4600 ', JSON.stringify(imageInfoCallback));
              expect(imageInfoCallback?.pixelFormat).assertEqual(image.PixelMapFormat.RGB_888);
              pixelMap.release();
              done();
            }
          })
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap2_4700
     * @tc.number graphicImagePixelMap2_4700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8,
            size: { height: 4, width: 6 } }
          let pixelMap : image.PixelMap = image.createPixelMapSync(opts);
          let imgInfo = pixelMap.getImageInfoSync();
          console.info('www data graphicImagePixelMap2_4700 ', JSON.stringify(imgInfo));
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_8);
          let imgInfoPromise = await pixelMap.getImageInfo();
          console.info('www data graphicImagePixelMap2_4700 ', JSON.stringify(imgInfoPromise));
          expect(imgInfoPromise.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_8);
          pixelMap.getImageInfo((err: BusinessError | null, imageInfoCallback: image.ImageInfo | undefined) => {
            if(imageInfoCallback !== undefined){
              console.info('www data graphicImagePixelMap2_4700 ', JSON.stringify(imageInfoCallback));
              expect(imageInfoCallback?.pixelFormat).assertEqual(image.PixelMapFormat.ALPHA_8);
              pixelMap.release();
              done();
            }
          })
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap2_4800
     * @tc.number graphicImagePixelMap2_4800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_F16,
            size: { height: 4, width: 6 } }
          let pixelMap : image.PixelMap = image.createPixelMapSync(opts);
          let imgInfo = pixelMap.getImageInfoSync();
          console.info('www data graphicImagePixelMap2_4800 ', JSON.stringify(imgInfo));
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_F16);
          let imgInfoPromise = await pixelMap.getImageInfo();
          console.info('www data graphicImagePixelMap2_4800 ', JSON.stringify(imgInfoPromise));
          expect(imgInfoPromise.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_F16);
          pixelMap.getImageInfo((err: BusinessError | null, imageInfoCallback: image.ImageInfo | undefined) => {
            if(imageInfoCallback !== undefined){
              console.info('www data graphicImagePixelMap2_4800 ', JSON.stringify(imageInfoCallback));
              expect(imageInfoCallback?.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_F16);
              pixelMap.release();
              done();
            }
          })
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap2_4900
     * @tc.number graphicImagePixelMap2_4900
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.NV21,
            size: { height: 4, width: 6 } }
          let pixelMap : image.PixelMap = image.createPixelMapSync(opts);
          let imgInfo = pixelMap.getImageInfoSync();
          console.info('www data graphicImagePixelMap2_4900 ', JSON.stringify(imgInfo));
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.NV21);
          let imgInfoPromise = await pixelMap.getImageInfo();
          console.info('www data graphicImagePixelMap2_4900 ', JSON.stringify(imgInfoPromise));
          expect(imgInfoPromise.pixelFormat).assertEqual(image.PixelMapFormat.NV21);
          pixelMap.getImageInfo((err: BusinessError | null, imageInfoCallback: image.ImageInfo | undefined) => {
            if(imageInfoCallback !== undefined){
              console.info('www data graphicImagePixelMap2_4900 ', JSON.stringify(imageInfoCallback));
              expect(imageInfoCallback?.pixelFormat).assertEqual(image.PixelMapFormat.NV21);
              pixelMap.release();
              done();
            }
          })
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap2_5000
     * @tc.number graphicImagePixelMap2_5000
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.NV12,
            size: { height: 4, width: 6 } }
          let pixelMap : image.PixelMap = image.createPixelMapSync(opts);
          let imgInfo = pixelMap.getImageInfoSync();
          console.info('www data graphicImagePixelMap2_5000 ', JSON.stringify(imgInfo));
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.NV12);
          let imgInfoPromise = await pixelMap.getImageInfo();
          console.info('www data graphicImagePixelMap2_5000 ', JSON.stringify(imgInfoPromise));
          expect(imgInfoPromise.pixelFormat).assertEqual(image.PixelMapFormat.NV12);
          pixelMap.getImageInfo((err: BusinessError | null, imageInfoCallback: image.ImageInfo | undefined) => {
            if(imageInfoCallback !== undefined){
              console.info('www data graphicImagePixelMap2_5000 ', JSON.stringify(imageInfoCallback));
              expect(imageInfoCallback?.pixelFormat).assertEqual(image.PixelMapFormat.NV12);
              pixelMap.release();
              done();
            }
          })
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap2_5100
     * @tc.number graphicImagePixelMap2_5100
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.YCBCR_P010,
            size: { height: 4, width: 6 } }
          let pixelMap : image.PixelMap = image.createPixelMapSync(opts);
          let imgInfo = pixelMap.getImageInfoSync();
          console.info('www data graphicImagePixelMap2_5100 ', JSON.stringify(imgInfo));
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.YCBCR_P010);
          let imgInfoPromise = await pixelMap.getImageInfo();
          console.info('www data graphicImagePixelMap2_5100 ', JSON.stringify(imgInfoPromise));
          expect(imgInfoPromise.pixelFormat).assertEqual(image.PixelMapFormat.YCBCR_P010);
          pixelMap.getImageInfo((err: BusinessError | null, imageInfoCallback: image.ImageInfo | undefined) => {
            if(imageInfoCallback !== undefined){
              console.info('www data graphicImagePixelMap2_5100 ', JSON.stringify(imageInfoCallback));
              expect(imageInfoCallback?.pixelFormat).assertEqual(image.PixelMapFormat.YCBCR_P010);
              pixelMap.release();
              done();
            }
          })
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap2_5200
     * @tc.number graphicImagePixelMap2_5200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.YCRCB_P010,
            size: { height: 4, width: 6 } }
          let pixelMap : image.PixelMap = image.createPixelMapSync(opts);
          let imgInfo = pixelMap.getImageInfoSync();
          console.info('www data graphicImagePixelMap2_5200 ', JSON.stringify(imgInfo));
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.YCRCB_P010);
          let imgInfoPromise = await pixelMap.getImageInfo();
          console.info('www data graphicImagePixelMap2_5200 ', JSON.stringify(imgInfoPromise));
          expect(imgInfoPromise.pixelFormat).assertEqual(image.PixelMapFormat.YCRCB_P010);
          pixelMap.getImageInfo((err: BusinessError | null, imageInfoCallback: image.ImageInfo | undefined) => {
            if(imageInfoCallback !== undefined){
              console.info('www data graphicImagePixelMap2_5200 ', JSON.stringify(imageInfoCallback));
              expect(imageInfoCallback?.pixelFormat).assertEqual(image.PixelMapFormat.YCRCB_P010);
              pixelMap.release();
              done();
            }
          })
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap2_5300
     * @tc.number graphicImagePixelMap2_5300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.ASTC_4x4,
            size: { height: 4, width: 6 } }
          let pixelMap : image.PixelMap = image.createPixelMapSync(opts);
          await pixelMap.convertPixelFormat(image.PixelMapFormat.YCRCB_P010);
          let imgInfo = pixelMap.getImageInfoSync();
          console.info('www data graphicImagePixelMap2_5300 ', JSON.stringify(imgInfo));
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.YCRCB_P010);
          expect(imgInfo.isHdr).assertTrue();
          let imgInfoPromise = await pixelMap.getImageInfo();
          console.info('www data graphicImagePixelMap2_5300 ', JSON.stringify(imgInfoPromise));
          expect(imgInfoPromise.pixelFormat).assertEqual(image.PixelMapFormat.YCRCB_P010);
          expect(imgInfoPromise.isHdr).assertTrue();
          pixelMap.getImageInfo((err: BusinessError | null, imageInfoCallback: image.ImageInfo | undefined) => {
            if(imageInfoCallback !== undefined){
              console.info('www data graphicImagePixelMap2_5300 ', JSON.stringify(imageInfoCallback));
              expect(imageInfoCallback?.pixelFormat).assertEqual(image.PixelMapFormat.YCRCB_P010);
              expect(imageInfoCallback?.isHdr).assertTrue();
              pixelMap.release();
              done();
            }
          })
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap2_5400
     * @tc.number graphicImagePixelMap2_5400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          try {
            const color: ArrayBuffer = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
              editable: false,
              srcPixelFormat: image.PixelMapFormat.BGRA_8888,
              pixelFormat: image.PixelMapFormat.BGRA_8888,
              size: { height: 4, width: 6 }
            }
            let pixelMap: image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts,
              image.AllocatorType.DMA);
            let clonePixelMap:image.PixelMap = pixelMap!.cloneSync();
            console.info('www data graphicImagePixelMap2_5400 ', clonePixelMap.isEditable,
              clonePixelMap.isStrideAlignment);
            expect(clonePixelMap.isEditable).assertFalse();
            expect(clonePixelMap.isStrideAlignment).assertTrue();
            await pixelMap.release();
            done();
          } catch(e) {
            let error = e as BusinessError;
            console.error(`www data clone pixelmap error. code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   graphicImagePixelMap2_5500
     * @tc.number graphicImagePixelMap2_5500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap != undefined) {
          try {
            const color: ArrayBuffer = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
              editable: false,
              srcPixelFormat: image.PixelMapFormat.BGRA_8888,
              pixelFormat: image.PixelMapFormat.BGRA_8888,
              size: { height: 4, width: 6 }
            }
            let pixelMap: image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts,
              image.AllocatorType.DMA);
            let clonePixelMap:image.PixelMap = await pixelMap!.clone();
            console.info('www data graphicImagePixelMap2_5500 ', clonePixelMap.isEditable,
              clonePixelMap.isStrideAlignment);
            expect(clonePixelMap.isEditable).assertFalse();
            expect(clonePixelMap.isStrideAlignment).assertTrue();
            await pixelMap.release();
            done();
          } catch(e) {
            let error = e as BusinessError;
            console.error(`www data clone pixelmap error. code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   graphicImagePixelMap2_5600
     * @tc.number graphicImagePixelMap2_5600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const options: image.InitializationOptions = {
          pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 512, width: 512 }
        }
        const pixelMap = image.createPixelMapSync(options);
        console.info('www data ' + pixelMap.isStrideAlignment)
        if (pixelMap?.isStrideAlignment) {
          console.info('www data graphicImagePixelMap2_5600 Succeeded in creating pixelMap object.');
          // HDR_METADATA_TYPE
          await pixelMap!.setMetadata(image.HdrMetadataKey.HDR_DYNAMIC_METADATA, image.HdrMetadataType.BASE).then(() => {
            console.info('www data graphicImagePixelMap2_5600 Succeeded in setting pixelMap metadata.');
            expect().assertFail();
          }).catch((error: BusinessError) => {
            console.error("www data graphicImagePixelMap2_5600 Failed to set the metadata.code ", error);
            expect(error).assertEqual(62980115);
          })
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_5700
     * @tc.number graphicImagePixelMap2_5700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const options: image.InitializationOptions = {
          pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 512, width: 512 }
        }
        const pixelMap = image.createPixelMapSync(options);
        console.info('www data graphicImagePixelMap2_5700 ' + pixelMap.isStrideAlignment)
        if (pixelMap?.isStrideAlignment) {
          console.info('www data graphicImagePixelMap2_5700 Succeeded in creating pixelMap object.');
          await pixelMap!.setMetadata(image.HdrMetadataKey.HDR_GAINMAP_METADATA, image.HdrMetadataType.BASE).then(() => {
            console.info('www data graphicImagePixelMap2_5700 Succeeded in setting pixelMap metadata.');
            expect().assertFail();
          }).catch((error: BusinessError) => {
            console.error("www data graphicImagePixelMap2_5700 Failed to set the metadata.code ", error);
            expect(error).assertEqual(62980115);
          })
        }
        await pixelMap.release();
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap2_5800
     * @tc.number graphicImagePixelMap2_5800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap2_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.YCRCB_P010, size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        try {
          let imgInfo = pixelMap!.getImageInfoSync();
          console.info('www data graphicImagePixelMap2_5800 ', JSON.stringify(imgInfo));
          expect(imgInfo.size.width).assertLargerOrEqual(0);
          expect(imgInfo.size.height).assertLargerOrEqual(0);
          expect(imgInfo.isHdr).assertFalse();
          expect(imgInfo.stride).assertLargerOrEqual(0);
          expect(imgInfo.density).assertLargerOrEqual(0);
          expect(imgInfo.mimeType === '').assertTrue();
          expect(imgInfo.alphaType).assertEqual(image.AlphaType.OPAQUE);
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.YCRCB_P010);
          await pixelMap.release();
          done();
        } catch (err) {
          expect().assertFail();
          done();
        }
      })

  })
}