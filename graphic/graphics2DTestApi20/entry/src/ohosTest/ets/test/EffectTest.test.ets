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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import libGraphics2DApi20 from 'libgraphicsApiNdk.so'
export default function EffectTest() {
  describe('EffectTest', () => {
    /**
     * @tc.number  : SUB_OH_Filter_CreateEffect_0200,
     * @tc.name    : SUB_OH_Filter_CreateEffect_0200
     * @tc.desc    : test SUB_OH_Filter_CreateEffect fail Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Filter_CreateEffect_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Filter_CreateEffect_0200 start====");
          let result: number = libGraphics2DApi20.createEffectFail();
          console.info("====>SUB_OH_Filter_CreateEffect_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Filter_CreateEffect_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_Filter_Release_0200
     * @tc.name    : SUB_OH_Filter_Release_0200
     * @tc.desc    : test SUB_OH_Filter_Release_0200 success Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Filter_Release_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Filter_Release_0200 start====");
          let result: number = libGraphics2DApi20.releaseFail();
          console.info("====>SUB_OH_Filter_Release_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Filter_Release_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_Filter_BlurWithTileMode_0100
     * @tc.name    : SUB_OH_Filter_BlurWithTileMode_0100
     * @tc.desc    : test SUB_OH_Filter_BlurWithTileMode success Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Filter_BlurWithTileMode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Filter_BlurWithTileMode_0100 start====");
          let result: number = libGraphics2DApi20.blurWithTileModeSuccess();
          console.info("====>SUB_OH_Filter_BlurWithTileMode_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Filter_BlurWithTileMode_0100 catch err: " + err);
          done();
        }
      })
    /**
     * @tc.number  : SUB_OH_Filter_BlurWithTileMode_0200
     * @tc.name    : SUB_OH_Filter_BlurWithTileMode_0200
     * @tc.desc    : test SUB_OH_Filter_BlurWithTileMode fail Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Filter_BlurWithTileMode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Filter_BlurWithTileMode_0200 start====");
          let result: number = libGraphics2DApi20.blurWithTileModeFail();
          console.info("====>SUB_OH_Filter_BlurWithTileMode_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Filter_BlurWithTileMode_0200 catch err: " + err);
          done();
        }
      })
    /**
     * @tc.number  : SUB_OH_Filter_GetEffectPixelMap_0200
     * @tc.name    : SUB_OH_Filter_GetEffectPixelMap_0200
     * @tc.desc    : test SUB_OH_Filter_GetEffectPixelMap fail Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Filter_GetEffectPixelMap_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Filter_GetEffectPixelMap_0200 start====");
          let result: number = libGraphics2DApi20.getEffectPixelMapFail();
          console.info("====>SUB_OH_Filter_GetEffectPixelMap_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Filter_GetEffectPixelMap_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_NativeImage_GetTransformMatrixV2_0100
     * @tc.name    : SUB_OH_NativeImage_GetTransformMatrixV2_0100
     * @tc.desc    : test SUB_OH_NativeImage_GetTransformMatrixV2 success Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_NativeImage_GetTransformMatrixV2_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_NativeImage_GetTransformMatrixV2_0100 start====");
          let result: number = libGraphics2DApi20.getTransformMatrixV2Success();
          console.info("====>SUB_OH_NativeImage_GetTransformMatrixV2_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_NativeImage_GetTransformMatrixV2_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_NativeImage_AcquireNativeWindowBuffer_0100
     * @tc.name    : SUB_OH_NativeImage_AcquireNativeWindowBuffer_0100
     * @tc.desc    : test SUB_OH_NativeImage_AcquireNativeWindowBuffer success Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_NativeImage_AcquireNativeWindowBuffer_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_NativeImage_AcquireNativeWindowBuffer_0100 start====");
          let result: number = libGraphics2DApi20.acquireNativeWindowBufferSuccess();
          console.info("====>SUB_OH_NativeImage_AcquireNativeWindowBuffer_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_NativeImage_AcquireNativeWindowBuffer_0100 catch err: " + err);
          done();
        }
      })
    /**
     * @tc.number  : SUB_OH_NativeImage_AcquireNativeWindowBuffer_0200
     * @tc.name    : SUB_OH_NativeImage_AcquireNativeWindowBuffer_0200
     * @tc.desc    : test SUB_OH_NativeImage_AcquireNativeWindowBuffer success Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_NativeImage_AcquireNativeWindowBuffer_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_NativeImage_AcquireNativeWindowBuffer_0200 start====");
          let result: number = libGraphics2DApi20.acquireNativeWindowBufferFail();
          console.info("====>SUB_OH_NativeImage_AcquireNativeWindowBuffer_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_NativeImage_AcquireNativeWindowBuffer_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_NativeImage_ReleaseNativeWindowBuffer_0200
     * @tc.name    : SUB_OH_NativeImage_ReleaseNativeWindowBuffer_0200
     * @tc.desc    : test SUB_OH_NativeImage_ReleaseNativeWindowBuffer fail Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_NativeImage_ReleaseNativeWindowBuffer_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_NativeImage_ReleaseNativeWindowBuffer_0200 start====");
          let result: number = libGraphics2DApi20.releaseNativeWindowBufferFail();
          console.info("====>SUB_OH_NativeImage_ReleaseNativeWindowBuffer_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_NativeImage_ReleaseNativeWindowBuffer_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_NativeImage_SetDropBufferMode_0100
     * @tc.name    : SUB_OH_NativeImage_SetDropBufferMode_0100
     * @tc.desc    : test SUB_OH_NativeImage_SetDropBufferMode success Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_NativeImage_SetDropBufferMode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_NativeImage_SetDropBufferMode_0100 start====");
          let result: number = libGraphics2DApi20.setDropBufferModeSuccess();
          console.info("====>SUB_OH_NativeImage_SetDropBufferMode_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_NativeImage_SetDropBufferMode_0100 catch err: " + err);
          done();
        }
      })

  })
}
