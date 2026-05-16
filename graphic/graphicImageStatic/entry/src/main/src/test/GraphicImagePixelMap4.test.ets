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

export default function graphicImagePixelMap4() {

  describe("graphicImagePixelMap4", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   graphicImagePixelMap4_static_0100
     * @tc.number graphicImagePixelMap4_static_0100
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_0100 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true, srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height:4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
          console.info(msgStr+ ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          done();
        } catch(error){
          console.error(msgStr+ `Failed. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_0200
     * @tc.number graphicImagePixelMap4_static_0200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_0200 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.UNKNOWN,
          pixelFormat: image.PixelMapFormat.UNKNOWN,
          alphaType: image.AlphaType.UNKNOWN,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect().assertFail();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual(7600201);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_0300
     * @tc.number graphicImagePixelMap4_static_0300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_0300 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.ARGB_8888,
          alphaType: image.AlphaType.OPAQUE,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.DMA);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect().assertFail();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual(7600201);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_0400
     * @tc.number graphicImagePixelMap4_static_0400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_0400 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.RGB_565,
          pixelFormat: image.PixelMapFormat.RGB_565,
          alphaType: image.AlphaType.PREMUL,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.SHARE_MEMORY);
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
     * @tc.name   graphicImagePixelMap4_static_0500
     * @tc.number graphicImagePixelMap4_static_0500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_0500 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          alphaType: image.AlphaType.UNPREMUL,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
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
     * @tc.name   graphicImagePixelMap4_static_0600
     * @tc.number graphicImagePixelMap4_static_0600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_0600 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          alphaType: image.AlphaType.UNKNOWN,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.DMA);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertTrue();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_0700
     * @tc.number graphicImagePixelMap4_static_0700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_0700 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.RGB_888,
          pixelFormat: image.PixelMapFormat.RGB_888,
          alphaType: image.AlphaType.OPAQUE,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.SHARE_MEMORY);
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
     * @tc.name   graphicImagePixelMap4_static_0800
     * @tc.number graphicImagePixelMap4_static_0800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_0800 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ALPHA_8,
          pixelFormat: image.PixelMapFormat.ALPHA_8,
          alphaType: image.AlphaType.PREMUL,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
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
     * @tc.name   graphicImagePixelMap4_static_0900
     * @tc.number graphicImagePixelMap4_static_0900
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_0900 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.RGBA_F16,
          pixelFormat: image.PixelMapFormat.RGBA_F16,
          alphaType: image.AlphaType.UNPREMUL,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.DMA);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect().assertFail();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual(7600201);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_1000
     * @tc.number graphicImagePixelMap4_static_1000
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_1000 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.NV21,
          pixelFormat: image.PixelMapFormat.NV21,
          alphaType: image.AlphaType.UNKNOWN,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.SHARE_MEMORY);
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
     * @tc.name   graphicImagePixelMap4_static_1100
     * @tc.number graphicImagePixelMap4_static_1100
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_1100 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.NV12,
          pixelFormat: image.PixelMapFormat.NV12,
          alphaType: image.AlphaType.OPAQUE,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
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
     * @tc.name   graphicImagePixelMap4_static_1200
     * @tc.number graphicImagePixelMap4_static_1200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_1200 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.RGBA_1010102,
          pixelFormat: image.PixelMapFormat.RGBA_1010102,
          alphaType: image.AlphaType.PREMUL,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.DMA);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect().assertFail();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual(7600201);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_1300
     * @tc.number graphicImagePixelMap4_static_1300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_1300 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.YCBCR_P010,
          pixelFormat: image.PixelMapFormat.YCBCR_P010,
          alphaType: image.AlphaType.UNPREMUL,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.SHARE_MEMORY);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect().assertFail();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual(7600201);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_1400
     * @tc.number graphicImagePixelMap4_static_1400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_1400 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.YCRCB_P010,
          pixelFormat: image.PixelMapFormat.YCRCB_P010,
          alphaType: image.AlphaType.UNKNOWN,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect().assertFail();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual(7600201);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_1500
     * @tc.number graphicImagePixelMap4_static_1500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_1500 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ASTC_4x4,
          pixelFormat: image.PixelMapFormat.ASTC_4x4,
          alphaType: image.AlphaType.OPAQUE,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.DMA);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect().assertFail();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual(7600201);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_1600
     * @tc.number graphicImagePixelMap4_static_1600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_1600 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.RGB_565,
          alphaType: image.AlphaType.PREMUL,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = await image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.SHARE_MEMORY);
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
     * @tc.name   graphicImagePixelMap4_static_1700
     * @tc.number graphicImagePixelMap4_static_1700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_1700 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.RGB_565,
          alphaType: image.AlphaType.PREMUL,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.SHARE_MEMORY);
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
     * @tc.name   graphicImagePixelMap4_static_1800
     * @tc.number graphicImagePixelMap4_static_1800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_1800 ';
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
          let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect().assertFail();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual(7600201);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_1900
     * @tc.number graphicImagePixelMap4_static_1900
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_1900 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.ARGB_8888,
          alphaType: image.AlphaType.OPAQUE,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect().assertFail();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual(7600201);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_2000
     * @tc.number graphicImagePixelMap4_static_2000
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_2000 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGB_565,
          pixelFormat: image.PixelMapFormat.RGB_565,
          alphaType: image.AlphaType.PREMUL,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.SHARE_MEMORY);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_2100
     * @tc.number graphicImagePixelMap4_static_2100
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_2100 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          alphaType: image.AlphaType.UNPREMUL,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_2200
     * @tc.number graphicImagePixelMap4_static_2200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_2200 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          alphaType: image.AlphaType.UNKNOWN,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertTrue();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_2300
     * @tc.number graphicImagePixelMap4_static_2300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_2300 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGB_888,
          pixelFormat: image.PixelMapFormat.RGB_888,
          alphaType: image.AlphaType.OPAQUE,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.SHARE_MEMORY);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_2400
     * @tc.number graphicImagePixelMap4_static_2400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_2400 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.ALPHA_8,
          pixelFormat: image.PixelMapFormat.ALPHA_8,
          alphaType: image.AlphaType.PREMUL,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_2500
     * @tc.number graphicImagePixelMap4_static_2500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_2500 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_F16,
          pixelFormat: image.PixelMapFormat.RGBA_F16,
          alphaType: image.AlphaType.UNPREMUL,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect().assertFail();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual(7600201);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_2600
     * @tc.number graphicImagePixelMap4_static_2600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_2600 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.NV21,
          pixelFormat: image.PixelMapFormat.NV21,
          alphaType: image.AlphaType.UNKNOWN,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.SHARE_MEMORY);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_2700
     * @tc.number graphicImagePixelMap4_static_2700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_2700 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.NV12,
          pixelFormat: image.PixelMapFormat.NV12,
          alphaType: image.AlphaType.OPAQUE,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_2800
     * @tc.number graphicImagePixelMap4_static_2800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_2800 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_1010102,
          pixelFormat: image.PixelMapFormat.RGBA_1010102,
          alphaType: image.AlphaType.PREMUL,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect().assertFail();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual(7600201);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_2900
     * @tc.number graphicImagePixelMap4_static_2900
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_2900 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.YCBCR_P010,
          pixelFormat: image.PixelMapFormat.YCBCR_P010,
          alphaType: image.AlphaType.UNPREMUL,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.SHARE_MEMORY);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect().assertFail();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual(7600201);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_3000
     * @tc.number graphicImagePixelMap4_static_3000
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_3000 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.YCRCB_P010,
          pixelFormat: image.PixelMapFormat.YCRCB_P010,
          alphaType: image.AlphaType.UNKNOWN,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect().assertFail();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual(7600201);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_3100
     * @tc.number graphicImagePixelMap4_static_3100
     * @tc.desc   image API ArkTS1.2
     *wc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_3100 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.ASTC_4x4,
          pixelFormat: image.PixelMapFormat.ASTC_4x4,
          alphaType: image.AlphaType.OPAQUE,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect().assertFail();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual(7600201);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_3200
     * @tc.number graphicImagePixelMap4_static_3200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_3200 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.RGB_565,
          alphaType: image.AlphaType.PREMUL,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.SHARE_MEMORY);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_3300
     * @tc.number graphicImagePixelMap4_static_3300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_3300 ';
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.RGB_565,
          alphaType: image.AlphaType.PREMUL,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.SHARE_MEMORY);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_3400
     * @tc.number graphicImagePixelMap4_static_3400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_3400 ';
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.UNKNOWN,
          pixelFormat: image.PixelMapFormat.UNKNOWN,
          alphaType: image.AlphaType.UNKNOWN,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
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
     * @tc.name   graphicImagePixelMap4_static_3500
     * @tc.number graphicImagePixelMap4_static_3500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_3500 ';
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.ARGB_8888,
          alphaType: image.AlphaType.OPAQUE,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.DMA);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect().assertFail();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual(7600201);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_3600
     * @tc.number graphicImagePixelMap4_static_3600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_3600 ';
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.RGB_565,
          pixelFormat: image.PixelMapFormat.RGB_565,
          alphaType: image.AlphaType.PREMUL,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.SHARE_MEMORY);
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
     * @tc.name   graphicImagePixelMap4_static_3700
     * @tc.number graphicImagePixelMap4_static_3700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_3700 ';
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          alphaType: image.AlphaType.UNPREMUL,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_3800
     * @tc.number graphicImagePixelMap4_static_3800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_3800 ';
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          alphaType: image.AlphaType.UNKNOWN,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.DMA);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertTrue();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_3900
     * @tc.number graphicImagePixelMap4_static_3900
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_3900 ';
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGB_888,
          pixelFormat: image.PixelMapFormat.RGB_888,
          alphaType: image.AlphaType.OPAQUE,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.SHARE_MEMORY);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_4000
     * @tc.number graphicImagePixelMap4_static_4000
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_4000 ';
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ALPHA_8,
          pixelFormat: image.PixelMapFormat.ALPHA_8,
          alphaType: image.AlphaType.PREMUL,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
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
     * @tc.name   graphicImagePixelMap4_static_4100
     * @tc.number graphicImagePixelMap4_static_4100
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_4100 ';
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_F16,
          pixelFormat: image.PixelMapFormat.RGBA_F16,
          alphaType: image.AlphaType.UNPREMUL,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.DMA);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect().assertFail();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual(7600201);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_4200
     * @tc.number graphicImagePixelMap4_static_4200
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_4200 ';
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.NV21,
          pixelFormat: image.PixelMapFormat.NV21,
          alphaType: image.AlphaType.UNKNOWN,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.SHARE_MEMORY);
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
     * @tc.name   graphicImagePixelMap4_static_4300
     * @tc.number graphicImagePixelMap4_static_4300
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_4300 ';
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.NV12,
          pixelFormat: image.PixelMapFormat.NV12,
          alphaType: image.AlphaType.OPAQUE,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_4400
     * @tc.number graphicImagePixelMap4_static_4400
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_4400 ';
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.RGBA_1010102,
          pixelFormat: image.PixelMapFormat.RGBA_1010102,
          alphaType: image.AlphaType.PREMUL,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.DMA);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect().assertFail();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual(7600201);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_4500
     * @tc.number graphicImagePixelMap4_static_4500
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_4500 ';
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.YCBCR_P010,
          pixelFormat: image.PixelMapFormat.YCBCR_P010,
          alphaType: image.AlphaType.UNPREMUL,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.SHARE_MEMORY);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect().assertFail();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual(7600201);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_4600
     * @tc.number graphicImagePixelMap4_static_4600
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_4600 ';
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.YCRCB_P010,
          pixelFormat: image.PixelMapFormat.YCRCB_P010,
          alphaType: image.AlphaType.UNKNOWN,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect().assertFail();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual(7600201);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_4700
     * @tc.number graphicImagePixelMap4_static_4700
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_4700 ';
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.ASTC_4x4,
          pixelFormat: image.PixelMapFormat.ASTC_4x4,
          alphaType: image.AlphaType.OPAQUE,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.DMA);
          console.info(msgStr + ' success', pixelMap.isEditable, pixelMap.isStrideAlignment);
          expect().assertFail();
          done();
        } catch(error){
          console.error(msgStr + `Failed. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual(7600201);
          done();
        }
      })

    /**
     * @tc.name   graphicImagePixelMap4_static_4800
     * @tc.number graphicImagePixelMap4_static_4800
     * @tc.desc   image API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImagePixelMap4_static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data graphicImagePixelMap4_static_4800 ';
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.RGB_565,
          alphaType: image.AlphaType.PREMUL,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        }
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.SHARE_MEMORY);
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

  })
}
