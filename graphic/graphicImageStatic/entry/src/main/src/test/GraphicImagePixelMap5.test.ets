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
let pixelMap: image.PixelMap | undefined;

export default function graphicImagePixelMap5() {

  describe("graphicImagePixelMap5", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   graphicImagePixelMap5_static_1400
     * @tc.number graphicImagePixelMap5_static_1400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        try {
          await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
          console.info('www data graphicImagePixelMap5_static_1400 success');
          done();
        } catch(error){
          console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_1500
     * @tc.number graphicImagePixelMap5_static_1500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        try {
          await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.DMA);
          console.info('www data graphicImagePixelMap5_static_1500 success');
          done();
        } catch(error){
          console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_1600
     * @tc.number graphicImagePixelMap5_static_1600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        try {
          await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.SHARE_MEMORY);
          console.info('www data graphicImagePixelMap5_static_1600 success');
          done();
        } catch(error){
          console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_1700
     * @tc.number graphicImagePixelMap5_static_1700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.SHARE_MEMORY);
          console.info('www data graphicImagePixelMap5_static_1700 success');
          done();
        } catch(error){
          console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_1800
     * @tc.number graphicImagePixelMap5_static_1800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
          console.info('www data graphicImagePixelMap5_static_1800 success');
          done();
        } catch(error){
          console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_1900
     * @tc.number graphicImagePixelMap5_static_1900
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
          console.info('www data graphicImagePixelMap5_static_1900 success');
          done();
        } catch(error){
          console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_2000
     * @tc.number graphicImagePixelMap5_static_2000
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.SHARE_MEMORY);
          console.info('www data graphicImagePixelMap5_static_2000 success');
          done();
        } catch(error){
          console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_2100
     * @tc.number graphicImagePixelMap5_static_2100
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.DMA);
          console.info('www data graphicImagePixelMap5_static_2100 success');
          done();
        } catch(error){
          console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_2200
     * @tc.number graphicImagePixelMap5_static_2200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
          console.info('www data graphicImagePixelMap5_static_2200 success');
          done();
        } catch(error){
          console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_2300
     * @tc.number graphicImagePixelMap5_static_2300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.YCBCR_P010, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO)
          expect().assertFail();
          done();
        } catch(error){
          console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
          expect(error.code === 7600201).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_2400
     * @tc.number graphicImagePixelMap5_static_2400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.YCBCR_P010, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO)
          expect().assertFail();
          done();
        } catch(error){
          console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
          expect(error.code === 7600201).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_2500
     * @tc.number graphicImagePixelMap5_static_2500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.YCBCR_P010, size: { height: 4, width: 6 }
        }
        try {
          await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO)
          expect().assertFail();
          done();
        } catch(error){
          console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
          expect(error.code === 7600201).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_2600
     * @tc.number graphicImagePixelMap5_static_2600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        try {
          await image.createPixelMapUsingAllocator(color, opts);
          console.info('www data graphicImagePixelMap5_static_2600 success');
          done();
        } catch(error){
          console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_2700
     * @tc.number graphicImagePixelMap5_static_2700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapUsingAllocatorSync(color, opts);
          console.info('www data graphicImagePixelMap5_static_2700 success');
          done();
        } catch(error){
          console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_2800
     * @tc.number graphicImagePixelMap5_static_2800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.YCBCR_P010, size: { height: 4, width: 6 }
        }
        try {
          image.createPixelMapUsingAllocatorSync(color, opts)
          expect().assertFail();
          done();
        } catch(error){
          console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
          expect(error.code === 7600201).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_2900
     * @tc.number graphicImagePixelMap5_static_2900
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await image.createPixelMapFromSurfaceWithTransformation('111111', false)
          .then((pixelMap: image.PixelMap) => {
            console.info('www data graphicImagePixelMap5_static_2900 PixelMap created successfully.');
            expect(pixelMap !== null).assertTrue();

            // Verify basic properties
            expect(pixelMap.isEditable).assertTrue();
            expect(pixelMap.isStrideAlignment).assertTrue();

            console.info(`www data graphicImagePixelMap5_static_3200 success`);
            expect().assertFail();
            done();
          }).catch((e: Error) => {
            let err = e as BusinessError;
            console.error(`www data graphicImagePixelMap5_static_2900 Failed to create PixelMap. Code: ${err.code}`);
            expect(Number(err.code) === 7600104).assertTrue();
            done();
          });
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_3000
     * @tc.number graphicImagePixelMap5_static_3000
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await image.createPixelMapFromSurfaceWithTransformation('', true)
          .then((pixelMap: image.PixelMap) => {
            console.info('www data graphicImagePixelMap5_static_3000 PixelMap created successfully.');
            expect(pixelMap !== null).assertTrue();

            // Verify basic properties
            expect(pixelMap.isEditable).assertFalse();
            expect(pixelMap.isStrideAlignment).assertFalse();

            console.info(`www data graphicImagePixelMap5_static_3200 success`);
            expect().assertFail();
            done();
          }).catch((e: Error) => {
            let err = e as BusinessError;
            console.error(`www data graphicImagePixelMap5_static_3000 Failed to create PixelMap. Code: ${err.code}`);
            expect(Number(err.code) === 7600206).assertTrue();
            done();
          });
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_3100
     * @tc.number graphicImagePixelMap5_static_3100
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const pixelMap: image.PixelMap = image.createPixelMapFromSurfaceWithTransformationSync('111111', false);
          console.info('www data graphicImagePixelMap5_static_3100 PixelMap created successfully.');
          expect(pixelMap !== null).assertTrue();

          // Verify basic properties
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();

          console.info(`www data graphicImagePixelMap5_static_3200 success`);
          expect().assertFail();
          done();
        } catch (e) {
          const error = e as BusinessError;
          console.error(`www data graphicImagePixelMap5_static_3100 Failed to create PixelMap.
 	         Code: ${error.code}, message: ${error.message}`);
          expect(Number(error.code) === 7600104).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_3200
     * @tc.number graphicImagePixelMap5_static_3200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const pixelMap: image.PixelMap = image.createPixelMapFromSurfaceWithTransformationSync('', true);
          console.info('www data graphicImagePixelMap5_static_3200 PixelMap created successfully.');
          expect(pixelMap !== null).assertTrue();

          // Verify basic properties
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertTrue();

          console.info(`www data graphicImagePixelMap5_static_3200 success`);
          expect().assertFail();
          done();
        } catch (e) {
          const error = e as BusinessError;
          console.error(`www data graphicImagePixelMap5_static_3200 Failed to create PixelMap.
 	         Code: ${error.code}, message: ${error.message}`);
          expect(Number(error.code) === 7600206).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_3300
     * @tc.number graphicImagePixelMap5_static_3300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let pixelMap = image.createPixelMapSync(color, opts);
        if(pixelMap != undefined){
          console.info('www data create pixelMap pass');
          let flag1 = pixelMap.isReleased();
          console.info('www data isReleased', flag1);
          expect(flag1).assertFalse();
          let id1 = pixelMap.getUniqueId();
          console.info('www data getUniqueId', id1);
          expect(id1).assertLargerOrEqual(0);
          await pixelMap.release();
          let flag2 = pixelMap.isReleased();
          console.info('www data isReleased', flag2);
          expect(flag2).assertTrue();
          try {
            let id2 = pixelMap.getUniqueId();
            console.info('www data getUniqueId', id2);
            expect().assertFail();
          } catch(err){
            console.info('www data getUniqueId error', err.code);
            expect(Number(err.code) === 7600201).assertTrue();
          }
          done();
        } else {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_3400
     * @tc.number graphicImagePixelMap5_static_3400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
        let pixelMap = image.createPixelMapSync(color, opts);
        try {
          pixelMap.createCroppedAndScaledPixelMapSync(region, 10, 10);
          console.info('www data createCroppedAndScaledPixelMapSync pass 111', pixelMap.isEditable,
            pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
        }catch(err){
          console.info('www data createCroppedAndScaledPixelMapSync error 111', JSON.stringify(err));
          expect().assertFail();
        }
        try {
          pixelMap.createCroppedAndScaledPixelMapSync(region, 10, 10, image.AntiAliasingLevel.NONE);
          console.info('www data createCroppedAndScaledPixelMapSync pass 222');
        }catch(err){
          console.info('www data createCroppedAndScaledPixelMapSync error 222', JSON.stringify(err));
          expect().assertFail();
        }
        try {
          pixelMap.createCroppedAndScaledPixelMapSync(region, 10, 10, image.AntiAliasingLevel.LOW);
          console.info('www data createCroppedAndScaledPixelMapSync pass 333');
        }catch(err){
          console.info('www data createCroppedAndScaledPixelMapSync error 333', JSON.stringify(err));
          expect().assertFail();
        }
        try {
          pixelMap.createCroppedAndScaledPixelMapSync(region, 10, 10, image.AntiAliasingLevel.MEDIUM);
          console.info('www data createCroppedAndScaledPixelMapSync pass 444');
        }catch(err){
          console.info('www data createCroppedAndScaledPixelMapSync error 444', JSON.stringify(err));
          expect().assertFail();
        }
        try {
          pixelMap.createCroppedAndScaledPixelMapSync(region, 10, 10, image.AntiAliasingLevel.HIGH);
          console.info('www data createCroppedAndScaledPixelMapSync pass 555');
        }catch(err){
          console.info('www data createCroppedAndScaledPixelMapSync error 555', JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_3500
     * @tc.number graphicImagePixelMap5_static_3500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
        let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        try {
          pixelMap.createCroppedAndScaledPixelMapSync(region, 10, 10);
          console.info('www data graphicImagePixelMap5_static_3500 pass');
          expect().assertFail();
        }catch(err){
          console.info('www data graphicImagePixelMap5_static_3500 error', JSON.stringify(err.code));
          expect(Number(err.code) === 7600204).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_3600
     * @tc.number graphicImagePixelMap5_static_3600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
        let pixelMap = image.createPixelMapSync(color, opts);
        await pixelMap.release();
        try {
          pixelMap.createCroppedAndScaledPixelMapSync(region, 10, 10);
          console.info('www data graphicImagePixelMap5_static_3600 pass');
          expect().assertFail();
        }catch(err){
          console.info('www data graphicImagePixelMap5_static_3600 error', JSON.stringify(err.code));
          expect(Number(err.code) === 7600201).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_3700
     * @tc.number graphicImagePixelMap5_static_3700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.NV21, size: { height: 4, width: 6 }
        }
        let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
        let pixelMap = image.createPixelMapSync(color, opts);
        try {
          pixelMap.createCroppedAndScaledPixelMapSync(region, 10, 10);
          console.info('www data graphicImagePixelMap5_static_3700 pass');
          expect().assertFail();
        }catch(err){
          console.info('www data graphicImagePixelMap5_static_3700 error', JSON.stringify(err.code));
          expect(Number(err.code) === 7600205).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_3800
     * @tc.number graphicImagePixelMap5_static_3800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
        let pixelMap = image.createPixelMapSync(color, opts);
        await pixelMap.createCroppedAndScaledPixelMap(region, 10, 10).then(()=>{
          console.info('www data createCroppedAndScaledPixelMap pass 111', pixelMap.isEditable,
          pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
        }).catch((err: Error) => {
          console.info('www data createCroppedAndScaledPixelMap error 111', JSON.stringify(err));
          expect().assertFail();
        });
        await pixelMap.createCroppedAndScaledPixelMap(region, 10, 10, image.AntiAliasingLevel.NONE).then(()=>{
          console.info('www data createCroppedAndScaledPixelMap pass 222');
        }).catch((err: Error) => {
          console.info('www data createCroppedAndScaledPixelMap error 222', JSON.stringify(err));
          expect().assertFail();
        });
        await pixelMap.createCroppedAndScaledPixelMap(region, 10, 10, image.AntiAliasingLevel.LOW).then(()=>{
          console.info('www data createCroppedAndScaledPixelMap pass 333');
        }).catch((err: Error) => {
          console.info('www data createCroppedAndScaledPixelMap error 333', JSON.stringify(err));
          expect().assertFail();
        });
        await pixelMap.createCroppedAndScaledPixelMap(region, 10, 10, image.AntiAliasingLevel.MEDIUM).then(()=>{
          console.info('www data createCroppedAndScaledPixelMap pass 444');
        }).catch((err: Error) => {
          console.info('www data createCroppedAndScaledPixelMap error 444', JSON.stringify(err));
          expect().assertFail();
        });
        await pixelMap.createCroppedAndScaledPixelMap(region, 10, 10, image.AntiAliasingLevel.HIGH).then(()=>{
          console.info('www data createCroppedAndScaledPixelMap pass 555');
        }).catch((err: Error) => {
          console.info('www data createCroppedAndScaledPixelMap error 555', JSON.stringify(err));
          expect().assertFail();
        });
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_3900
     * @tc.number graphicImagePixelMap5_static_3900
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
        let pixelMap = image.createPixelMapSync(color, opts);
        await pixelMap.createCroppedAndScaledPixelMap(region, 10, 10).then(()=>{
          console.info('www data graphicImagePixelMap5_static_3900 pass');
          expect().assertFail();
        }).catch((err: Error) => {
          console.info('www data graphicImagePixelMap5_static_3900 error', JSON.stringify(err.code));
          expect(Number(err.code) === 7600204).assertTrue();
        });
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_4000
     * @tc.number graphicImagePixelMap5_static_4000
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
        let pixelMap = image.createPixelMapSync(color, opts);
        await pixelMap.release();
        try {
          await pixelMap.createCroppedAndScaledPixelMap(region, 10, 10).then(()=>{
            console.info('www data graphicImagePixelMap5_static_4000 pass');
            expect().assertFail();
          }).catch((err: Error) => {
            console.info('www data graphicImagePixelMap5_static_4000 error', JSON.stringify(err.code));
            expect(Number(err.code) === 7600201).assertTrue();
          });
        } catch(err){
          expect(Number(err.code) === 7600201).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_4100
     * @tc.number graphicImagePixelMap5_static_4100
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.NV21, size: { height: 4, width: 6 }
        }
        let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
        let pixelMap = image.createPixelMapSync(color, opts);

        await pixelMap.createCroppedAndScaledPixelMap(region, 10, 10).then(()=>{
          console.info('www data graphicImagePixelMap5_static_4100 pass');
        }).catch((err: Error) => {
          console.info('www data graphicImagePixelMap5_static_4100 error', JSON.stringify(err.code));
          expect(Number(err.code) === 7600205).assertTrue();
        });
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_4200
     * @tc.number graphicImagePixelMap5_static_4200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg = '=====www data graphicImagePixelMap5_static_4200=====';
        const color: ArrayBuffer = new ArrayBuffer(16);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
        }
        let optsForUnpre: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.UNPREMUL
        }
        let optsForPre: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.PREMUL
        }
        let srcPixelMap = image.createPixelMapSync(color, optsForUnpre);
        console.info(msg + 'srcPixelMap success', srcPixelMap.isEditable, srcPixelMap.isStrideAlignment);
        expect(srcPixelMap.isEditable).assertTrue();
        expect(srcPixelMap.isStrideAlignment).assertFalse();
        let dstPixelMap = image.createPixelMapSync(optsForPre);
        console.info(msg + 'dstPixelMap success', dstPixelMap.isEditable, dstPixelMap.isStrideAlignment);
        expect(dstPixelMap.isEditable).assertTrue();
        expect(dstPixelMap.isStrideAlignment).assertFalse();
        image.createPremultipliedPixelMap(srcPixelMap, dstPixelMap, (error: BusinessError | null) => {
          if(error) {
            console.error(msg + `Failed to convert pixelmap. code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(msg + ' Succeeded in converting pixelmap.');
            done();
          }
        })
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_4300
     * @tc.number graphicImagePixelMap5_static_4300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg = '=====www data graphicImagePixelMap5_static_4300=====';
        const color: ArrayBuffer = new ArrayBuffer(16);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
        }
        let optsForUnpre: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.UNPREMUL
        }
        let optsForPre: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.PREMUL
        }
        let srcPixelMap = image.createPixelMapSync(color, optsForUnpre);
        console.info(msg + 'srcPixelMap success', srcPixelMap.isEditable, srcPixelMap.isStrideAlignment);
        expect(srcPixelMap.isEditable).assertTrue();
        expect(srcPixelMap.isStrideAlignment).assertFalse();
        let dstPixelMap = image.createPixelMapSync(optsForPre);
        console.info(msg + 'dstPixelMap success', dstPixelMap.isEditable, dstPixelMap.isStrideAlignment);
        expect(dstPixelMap.isEditable).assertTrue();
        expect(dstPixelMap.isStrideAlignment).assertFalse();
        await image.createPremultipliedPixelMap(srcPixelMap, dstPixelMap).then(() => {
          console.info(msg + 'Succeeded in converting pixelmap.');
          done();
        }).catch((error: Error) => {
          console.error(msg + `Failed to convert pixelmap, error code is ${error}`);
          expect().assertFail();
          done();
        })
      })

    /**
     * @tc.name   testCreateUnpremultipliedPixelMap_callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_018
     * @tc.desc   The transparent channel premultiplied mode of PixelMap is changed to non-premultiplied mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateUnpremultipliedPixelMap_callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg = " =testCreateUnpremultipliedPixelMap_callback= "
        console.log(" www data 3" + msg + " begin ")
        const color: ArrayBuffer = new ArrayBuffer(16); // 16为需要创建的像素buffer大小，取值为：height * width *4
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
        }
        let opts2: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 } , alphaType: image.AlphaType.PREMUL}
        let opts3: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 } , alphaType: image.AlphaType.UNPREMUL}
        console.log(" www data 3.1" + msg)
        try {
          console.log(msg + " succeed in try createPixelMapSync ")
          let srcPixelMap = image.createPixelMapSync(color, opts2);
          console.info(msg + 'srcPixelMap success', srcPixelMap.isEditable, srcPixelMap.isStrideAlignment);
          expect(srcPixelMap.isEditable).assertTrue();
          expect(srcPixelMap.isStrideAlignment).assertFalse();
          let dstPixelMap = image.createPixelMapSync(opts3);
          console.info(msg + 'dstPixelMap success', dstPixelMap.isEditable, dstPixelMap.isStrideAlignment);
          expect(dstPixelMap.isEditable).assertTrue();
          expect(dstPixelMap.isStrideAlignment).assertFalse();
          console.log(" www data 3.2" + msg)
          image.createUnpremultipliedPixelMap(srcPixelMap, dstPixelMap, (error: BusinessError | null) => {
            if(error) {
              console.error(msg + ` Failed to convert pixelmap. code is ${error.code}, message is ${error.message} `);
              expect().assertFail()
              done()
            } else {
              console.log(" www data 3.3" + msg)
              console.info(msg + ' Succeeded in converting pixelmap.');
              done()
            }
          })
        } catch (err) {
          console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
          expect().assertFail()
          done()
        }
      })

    /**
     * @tc.name   testCreateUnpremultipliedPixelMap_promise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_019
     * @tc.desc   The transparent channel premultiplied mode of PixelMap is changed to non-premultiplied mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateUnpremultipliedPixelMap_promise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg = " =testCreateUnpremultipliedPixelMap_promise= "
        console.log(" www data 4" + msg + " begin ")
        const color: ArrayBuffer = new ArrayBuffer(16); // 16为需要创建的像素buffer大小，取值为：height * width *4
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
        }
        let opts2: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 } , alphaType: image.AlphaType.PREMUL}
        let opts3: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 } , alphaType: image.AlphaType.UNPREMUL}
        console.log(" www data 4.1" + msg)
        try {
          console.log(msg + " succeed in try createPixelMapSync ")
          let srcPixelMap = image.createPixelMapSync(color, opts2);
          console.info(msg + 'srcPixelMap success', srcPixelMap.isEditable, srcPixelMap.isStrideAlignment);
          expect(srcPixelMap.isEditable).assertTrue();
          expect(srcPixelMap.isStrideAlignment).assertFalse();
          let dstPixelMap = image.createPixelMapSync(opts3);
          console.info(msg + 'dstPixelMap success', dstPixelMap.isEditable, dstPixelMap.isStrideAlignment);
          expect(dstPixelMap.isEditable).assertTrue();
          expect(dstPixelMap.isStrideAlignment).assertFalse();
          console.log(" www data 4.2" + msg)
          image.createUnpremultipliedPixelMap(srcPixelMap, dstPixelMap).then(() => {
            console.log(" www data 4.3" + msg)
            console.info(msg + ' Succeeded in converting pixelmap.');
            done()
          }).catch((error) => {
            console.error(msg + ` Failed to convert pixelmap. code is ${error.code}, message is ${error.message}`);
            expect().assertFail()
            done()
          })
        } catch (err) {
          console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
          expect().assertFail()
          done()
        }
      })

    /**
     * @tc.name    graphicImagePixelMap5_static_0100
     * @tc.number  graphicImagePixelMap5_static_0100
     * @tc.desc    createPixelMapFromSurface function test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('graphicImagePixelMap5_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          // Test with valid parameters
          const surfaceId = "testSurface001";
          const region: image.Region = { x: 0, y: 0, size: { width: 100, height: 100 } };

          const pixelMap = await image.createPixelMapFromSurface(surfaceId, region);

          console.info(`www data graphicImagePixelMap5_static_0100 pixelMap: ${pixelMap}`);
          expect(pixelMap !== null).assertTrue();

          // Verify basic properties
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();

          console.info(`www data graphicImagePixelMap5_static_0100 success`);
          expect(false).assertTrue();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.error(`www data graphicImagePixelMap5_static_0100 error: ${error}, code: ${err.code}`);
          expect(error.code).assertEqual(62980178);
          done();
        }
      });

    /**
     * @tc.name    graphicImagePixelMap5_static_0200
     * @tc.number  graphicImagePixelMap5_static_0200
     * @tc.desc    createPixelMapFromSurface function test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('graphicImagePixelMap5_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          // Test with valid parameters
          const region: image.Region = { x: 0, y: 0, size: { width: 100, height: 100 } };

          const pixelMap = await image.createPixelMapFromSurface('', region);

          console.info(`www data graphicImagePixelMap5_static_0200 pixelMap: ${pixelMap}`);
          expect(pixelMap !== null).assertTrue();

          // Verify basic properties
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertTrue();

          console.info(`www data graphicImagePixelMap5_static_0200 success`);
          expect(false).assertTrue();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.error(`www data graphicImagePixelMap5_static_0200 error: ${error}, code: ${err.code}`);
          expect(error.code).assertEqual(62980178);
          done();
        }
      });

    /**
     * @tc.name   graphicImagePixelMap5_static_0300
     * @tc.number graphicImagePixelMap5_static_0300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
        try {
          let pixelMap: image.PixelMap = image.createPixelMapFromSurfaceSync('', region);
          console.info('www data succeed in graphicImagePixelMap5_static_0300');
          expect(pixelMap !== null).assertTrue();

          // Verify basic properties
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();

          console.info(`www data graphicImagePixelMap5_static_0300 success`);
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          console.error(`www data graphicImagePixelMap5_static_0300 error: ${err}, code: ${err.code}`);
          expect(Number(err.code) == 62980178).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_0400
     * @tc.number graphicImagePixelMap5_static_0400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let pixelMap: image.PixelMap = image.createPixelMapFromSurfaceSync('');
          console.info('www data succeed in graphicImagePixelMap5_static_0400');
          expect(pixelMap !== null).assertTrue();

          // Verify basic properties
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertTrue();

          console.info(`www data graphicImagePixelMap5_static_0400 success`);
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          console.error(`www data graphicImagePixelMap5_static_0400 error: ${err}, code: ${err.code}`);
          expect(Number(err.code) == 62980178).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_0500
     * @tc.number graphicImagePixelMap5_static_0500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 }
        }
        let pixelMap = image.createPixelMapSync(opts);
        try {
          pixelMap?.setMemoryNameSync('');
        } catch (err) {
          err = err as BusinessError;
          console.info('www data graphicImagePixelMap5_static_0500 error code ' + JSON.stringify(err.code))
          expect(err.code).assertEqual(401);
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_0600
     * @tc.number graphicImagePixelMap5_static_0600
     * @tc.desc   image pixelMap newAPI22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("graphicImagePixelMap5_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
      }
      let pixelMap = image.createPixelMapSync(color, opts);
      if(pixelMap != undefined){
        console.info('www data graphicImagePixelMap5_static_0600 create pixelMap pass');
        let flag1 = pixelMap.isReleased();
        console.info('www data graphicImagePixelMap5_static_0600 isReleased', flag1);
        expect(flag1).assertFalse();
        let id1 = pixelMap.getUniqueId();
        console.info('www data graphicImagePixelMap5_static_0600 getUniqueId', id1);
        expect(id1).assertLargerOrEqual(0);
        await pixelMap.release();
        let flag2 = pixelMap.isReleased();
        console.info('www data graphicImagePixelMap5_static_0600 isReleased', flag2);
        expect(flag2).assertTrue();
        try {
          let id2 = pixelMap.getUniqueId();
          console.info('www data graphicImagePixelMap5_static_0600 getUniqueId', id2);
          expect().assertFail();
        } catch(err){
          console.info('www data graphicImagePixelMap5_static_0600 getUniqueId error', err.code);
          expect(Number(err.code) == 7600201).assertTrue();
        }
        done();
      } else {
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   graphicImagePixelMap5_static_0700
     * @tc.number graphicImagePixelMap5_static_0700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
        let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        try {
          pixelMap.createCroppedAndScaledPixelMapSync(region, 10, 10);
          console.info('www data graphicImagePixelMap5_static_0700 pass', pixelMap.isEditable,
            pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertTrue();
        }catch(err){
          console.info('www data graphicImagePixelMap5_static_0700 error', JSON.stringify(err.code));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_0800
     * @tc.number graphicImagePixelMap5_static_0800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }
        }
        let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
        let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        try {
          await pixelMap.createCroppedAndScaledPixelMap(region, 10, 10);
          console.info('www data graphicImagePixelMap5_static_0800 pass', pixelMap.isEditable,
            pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertTrue();
        }catch(err){
          console.info('www data graphicImagePixelMap5_static_0800 error', JSON.stringify(err.code));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_0900
     * @tc.number graphicImagePixelMap5_static_0900
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let opts: image.InitializationOptions = { editable: true, srcPixelFormat: image.PixelMapFormat.RGBA_1010102,
            pixelFormat: image.PixelMapFormat.RGBA_1010102, size: { height: 4, width: 6 } }
          let pixelMap : image.PixelMap = image.createPixelMapSync(opts);
          let imgInfo = pixelMap.getImageInfoSync();
          console.info('www data graphicImagePixelMap5_static_0900 ', JSON.stringify(imgInfo));
          expect(imgInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_1010102);
          let imgInfoPromise = await pixelMap.getImageInfo();
          console.info('www data graphicImagePixelMap5_static_0900 ', JSON.stringify(imgInfoPromise));
          expect(imgInfoPromise.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_1010102);
          pixelMap.getImageInfo((err: BusinessError | null, imageInfoCallback: image.ImageInfo | undefined) => {
            if(imageInfoCallback !== undefined){
              console.info('www data graphicImagePixelMap5_static_0900 ', JSON.stringify(imageInfoCallback));
              expect(imageInfoCallback?.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_1010102);
            }
          })
        } catch (err) {
          console.info('www data graphicImagePixelMap5_static_0900 ', err);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_1000
     * @tc.number graphicImagePixelMap5_static_1000
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap5_static_1000 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.ASTC_4x4,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          alphaType: image.AlphaType.UNKNOWN,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        image.createPixelMap(color, opts, (error: BusinessError | null, pixelMap: image.PixelMap | undefined) => {
          if(error) {
            console.error(msgStr + `Failed to create pixelmap. code is ${error.code}`);
            expect().assertFail();
            done();
          } else {
            console.info(msgStr + 'success ', pixelMap?.isEditable, pixelMap?.isStrideAlignment);
            expect(pixelMap?.isEditable).assertTrue();
            expect(pixelMap?.isStrideAlignment).assertFalse();
            done();
          }
        })
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_1100
     * @tc.number graphicImagePixelMap5_static_1100
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap5_static_1100 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.ASTC_4x4,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          alphaType: image.AlphaType.UNKNOWN,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMap(color, opts)
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
        } catch(err){
          console.error(msgStr + ` Failed to create pixelmap. code is ${err.code}`);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_1200
     * @tc.number graphicImagePixelMap5_static_1200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap5_static_1200 ';
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.ARGB_8888,
          alphaType: image.AlphaType.PREMUL,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(opts);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_1300
     * @tc.number graphicImagePixelMap5_static_1300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg = '=====www data graphicImagePixelMap5_static_1300=====';
        const color: ArrayBuffer = new ArrayBuffer(16);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
        }
        let optsForUnpre: image.InitializationOptions = {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.UNPREMUL
        }
        let optsForPre: image.InitializationOptions = {
          editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.PREMUL
        }
        let srcPixelMap = image.createPixelMapUsingAllocatorSync(color, optsForUnpre, image.AllocatorType.DMA);
        console.info(msg + 'srcPixelMap success', srcPixelMap.isEditable, srcPixelMap.isStrideAlignment);
        expect(srcPixelMap.isEditable).assertFalse();
        expect(srcPixelMap.isStrideAlignment).assertTrue();
        let dstPixelMap = image.createPixelMapUsingAllocatorSync(color, optsForPre, image.AllocatorType.DMA);
        console.info(msg + 'dstPixelMap success', dstPixelMap.isEditable, dstPixelMap.isStrideAlignment);
        expect(dstPixelMap.isEditable).assertFalse();
        expect(dstPixelMap.isStrideAlignment).assertTrue();
        image.createPremultipliedPixelMap(srcPixelMap, dstPixelMap, (error: BusinessError | null) => {
          if(error) {
            console.error(msg + `Failed to convert pixelmap. code is ${error.code}, message is ${error.message}`);
            expect(Number(error.code)).assertEqual(62980248);
            done();
          } else {
            console.info(msg + ' Succeeded in converting pixelmap.');
            expect().assertFail();
            done();
          }
        })
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_4400
     * @tc.number graphicImagePixelMap5_static_4400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg = '=====www data graphicImagePixelMap5_static_4400=====';
        const color: ArrayBuffer = new ArrayBuffer(16);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
        }
        let optsForUnpre: image.InitializationOptions = {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.UNPREMUL
        }
        let optsForPre: image.InitializationOptions = {
          editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.PREMUL
        }
        let srcPixelMap = image.createPixelMapUsingAllocatorSync(color, optsForUnpre, image.AllocatorType.DMA);
        console.info(msg + 'srcPixelMap success', srcPixelMap.isEditable, srcPixelMap.isStrideAlignment);
        expect(srcPixelMap.isEditable).assertFalse();
        expect(srcPixelMap.isStrideAlignment).assertTrue();
        let dstPixelMap = image.createPixelMapUsingAllocatorSync(color, optsForPre, image.AllocatorType.DMA);
        console.info(msg + 'dstPixelMap success', dstPixelMap.isEditable, dstPixelMap.isStrideAlignment);
        expect(dstPixelMap.isEditable).assertFalse();
        expect(dstPixelMap.isStrideAlignment).assertTrue();
        await image.createPremultipliedPixelMap(srcPixelMap, dstPixelMap).then(() => {
          console.info(msg + 'Succeeded in converting pixelmap.');
          expect().assertFail();
          done();
        }).catch((error: Error) => {
          console.error(msg + `Failed to convert pixelmap, error code is ${error.code}`);
          expect(Number(error.code)).assertEqual(62980248);
          done();
        })
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_4500
     * @tc.number graphicImagePixelMap5_static_4500
     * @tc.desc   The transparent channel premultiplied mode of PixelMap is changed to non-premultiplied mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg = "www data  =graphicImagePixelMap5_static_4500= "
        console.log(" www data 3" + msg + " begin ")
        const color: ArrayBuffer = new ArrayBuffer(16); // 16为需要创建的像素buffer大小，取值为：height * width *4
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
        }
        let opts2: image.InitializationOptions = { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 } , alphaType: image.AlphaType.PREMUL}
        let opts3: image.InitializationOptions = { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 } , alphaType: image.AlphaType.UNPREMUL}
        try {
          console.log(msg + " succeed in try createPixelMapSync ")
          let srcPixelMap = image.createPixelMapUsingAllocatorSync(color, opts3, image.AllocatorType.DMA);
          console.info(msg + 'srcPixelMap success', srcPixelMap.isEditable, srcPixelMap.isStrideAlignment);
          expect(srcPixelMap.isEditable).assertFalse();
          expect(srcPixelMap.isStrideAlignment).assertTrue();
          let dstPixelMap = image.createPixelMapUsingAllocatorSync(color, opts2, image.AllocatorType.DMA);
          console.info(msg + 'dstPixelMap success', dstPixelMap.isEditable, dstPixelMap.isStrideAlignment);
          expect(dstPixelMap.isEditable).assertFalse();
          expect(dstPixelMap.isStrideAlignment).assertTrue();
          image.createUnpremultipliedPixelMap(srcPixelMap, dstPixelMap, (error: BusinessError | null) => {
            if(error) {
              console.error(msg + ` Failed to convert pixelmap. code is ${error.code}, message is ${error.message} `);
              expect(Number(error.code)).assertEqual(62980248);
              done()
            } else {
              console.info(msg + ' Succeeded in converting pixelmap.');
              expect().assertFail();
              done()
            }
          })
        } catch (err) {
          console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
          expect().assertFail()
          done()
        }
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_4600
     * @tc.number graphicImagePixelMap5_static_4600
     * @tc.desc   The transparent channel premultiplied mode of PixelMap is changed to non-premultiplied mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg = "www data =graphicImagePixelMap5_static_4600= "
        console.log(" www data 4" + msg + " begin ")
        const color: ArrayBuffer = new ArrayBuffer(16); // 16为需要创建的像素buffer大小，取值为：height * width *4
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
        }
        let opts2: image.InitializationOptions = { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 } , alphaType: image.AlphaType.PREMUL}
        let opts3: image.InitializationOptions = { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 } , alphaType: image.AlphaType.UNPREMUL}
        try {
          console.log(msg + " succeed in try createPixelMapSync ")
          let srcPixelMap = image.createPixelMapUsingAllocatorSync(color, opts2, image.AllocatorType.DMA);
          console.info(msg + 'srcPixelMap success', srcPixelMap.isEditable, srcPixelMap.isStrideAlignment);
          expect(srcPixelMap.isEditable).assertFalse();
          expect(srcPixelMap.isStrideAlignment).assertTrue();
          let dstPixelMap = image.createPixelMapUsingAllocatorSync(color, opts3, image.AllocatorType.DMA);
          console.info(msg + 'dstPixelMap success', dstPixelMap.isEditable, dstPixelMap.isStrideAlignment);
          expect(dstPixelMap.isEditable).assertFalse();
          expect(dstPixelMap.isStrideAlignment).assertTrue();
          image.createUnpremultipliedPixelMap(srcPixelMap, dstPixelMap).then(() => {
            console.info(msg + ' Succeeded in converting pixelmap.');
            expect().assertFail();
            done()
          }).catch((error) => {
            console.error(msg + ` Failed to convert pixelmap. code is ${error.code}, message is ${error.message}`);
            expect(Number(error.code)).assertEqual(62980248);
            done()
          })
        } catch (err) {
          console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
          expect().assertFail()
          done()
        }
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_4700
     * @tc.number graphicImagePixelMap5_static_4700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
        try {
          let pixelMap: image.PixelMap = image.createPixelMapFromSurfaceSync('123', region);
          console.info('www data succeed in graphicImagePixelMap5_static_4700');
          expect(pixelMap !== null).assertTrue();
          // Verify basic properties
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertTrue();
          console.info(`www data graphicImagePixelMap5_static_4700 success`);
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          console.error(`www data graphicImagePixelMap5_static_4700 error: ${err}, code: ${err.code}`);
          expect(Number(err.code) == 62980178).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   graphicImagePixelMap5_static_4800
     * @tc.number graphicImagePixelMap5_static_4800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap5_static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let pixelMap: image.PixelMap = image.createPixelMapFromSurfaceSync('123456');
          console.info('www data succeed in graphicImagePixelMap5_static_0400');
          expect(pixelMap !== null).assertTrue();

          // Verify basic properties
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();

          console.info(`www data graphicImagePixelMap5_static_4800 success`);
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          console.error(`www data graphicImagePixelMap5_static_4800 error: ${err}, code: ${err.code}`);
          expect(Number(err.code) == 62980178).assertTrue();
        }
        done();
      })

    /**
     * @tc.name    graphicImagePixelMap5_static_4900
     * @tc.number  graphicImagePixelMap5_static_4900
     * @tc.desc    createPixelMapFromSurface function test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('graphicImagePixelMap5_static_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          // Test with valid parameters
          const surfaceId = "testSurface001";
          const region: image.Region = { x: 0, y: 0, size: { width: 100, height: 100 } };

          const pixelMap = await image.createPixelMapFromSurface(surfaceId);

          console.info(`www data graphicImagePixelMap5_static_4900 pixelMap: ${pixelMap}`);
          expect(pixelMap !== null).assertTrue();

          // Verify basic properties
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();

          console.info(`www data graphicImagePixelMap5_static_4900 success`);
          expect(false).assertTrue();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.error(`www data graphicImagePixelMap5_static_4900 error: ${error}, code: ${err.code}`);
          expect(error.code).assertEqual(62980178);
          done();
        }
      });

    /**
     * @tc.name    graphicImagePixelMap5_static_5000
     * @tc.number  graphicImagePixelMap5_static_5000
     * @tc.desc    createPixelMapFromSurface function test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('graphicImagePixelMap5_static_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          // Test with valid parameters
          const region: image.Region = { x: 0, y: 0, size: { width: 100, height: 100 } };

          const pixelMap = await image.createPixelMapFromSurface('');

          console.info(`www data graphicImagePixelMap5_static_5000 pixelMap: ${pixelMap}`);
          expect(pixelMap !== null).assertTrue();

          // Verify basic properties
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertTrue();

          console.info(`www data graphicImagePixelMap5_static_5000 success`);
          expect(false).assertTrue();
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.error(`www data graphicImagePixelMap5_static_5000 error: ${error}, code: ${err.code}`);
          expect(error.code).assertEqual(62980178);
          done();
        }
      });

  })
}