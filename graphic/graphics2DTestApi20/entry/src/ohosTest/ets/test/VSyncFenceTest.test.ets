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
export default function VSyncFenceTest() {
  describe('VSyncFenceTest', () => {
    /**
     * @tc.number  : SUB_OH_NativeVSync_RequestFrame_0100
     * @tc.name    : SUB_OH_NativeVSync_RequestFrame_0100
     * @tc.desc    : test SUB_OH_NativeVSync_RequestFrame ok Scene
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_NativeVSync_RequestFrame_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_NativeVSync_RequestFrame_0100 start====");
          let result: number = libGraphics2DApi20.requestFrameSuccess();
          console.info("====>SUB_OH_NativeVSync_RequestFrame_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_NativeVSync_RequestFrame_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_NativeVSync_RequestFrame_0200
     * @tc.name    : SUB_OH_NativeVSync_RequestFrame_0200
     * @tc.desc    : test SUB_OH_NativeVSync_RequestFrame ok Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_NativeVSync_RequestFrame_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_NativeVSync_RequestFrame_0200 start====");
          let result: number = libGraphics2DApi20.requestFrameInvalue();
          console.info("====>SUB_OH_NativeVSync_RequestFrame_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_NativeVSync_RequestFrame_0200 catch err: " + err);
          done();
        }
      })

      /**
       * @tc.number  : SUB_OH_NativeVSync_DVSyncSwitch_0100
       * @tc.name    : SUB_OH_NativeVSync_DVSyncSwitch_0100
       * @tc.desc    : test SUB_OH_NativeVSync_DVSyncSwitch ok Scene
       * @tc.level   : Level0
       * @tc.size    : MediumTest
       * @tc.type    : Function
       */
      it('SUB_OH_NativeVSync_DVSyncSwitch_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
        async (done: Function) => {
          try {
            console.info("====>SUB_OH_NativeVSync_DVSyncSwitch_0100 start====");
            let result: number = libGraphics2DApi20.NativeVSyncDVSyncSwitchSuccess();
            console.info("====>SUB_OH_NativeVSync_DVSyncSwitch_0100 result====", result);
            expect(result).assertEqual(1);
            done();
          } catch (err) {
            console.error("====>SUB_OH_NativeVSync_DVSyncSwitch_0100 catch err: " + err);
          }
        })

      /**
       * @tc.number  : SUB_OH_NativeVSync_DVSyncSwitch_0200
       * @tc.name    : SUB_OH_NativeVSync_DVSyncSwitch_0200
       * @tc.desc    : test SUB_OH_NativeVSync_DVSyncSwitch ok Scene
       * @tc.level   : Level3
       * @tc.size    : MediumTest
       * @tc.type    : Function
       */
      it('SUB_OH_NativeVSync_DVSyncSwitch_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
        async (done: Function) => {
          try {
            console.info("====>SUB_OH_NativeVSync_DVSyncSwitch_0200 start====");
            let result: number = libGraphics2DApi20.NativeVSyncDVSyncSwitchInvalue();
            console.info("====>SUB_OH_NativeVSync_DVSyncSwitch_0200 result====", result);
            expect(result).assertEqual(1);
            done();
          } catch (err) {
            console.error("====>SUB_OH_NativeVSync_DVSyncSwitch_0200 catch err: " + err);
          }
        })
    /**
     * @tc.number  : SUB_OH_NativeFence_IsValid_0100
     * @tc.name    : SUB_OH_NativeFence_IsValid_0100
     * @tc.desc    : test SUB_OH_NativeFence_IsValid true Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_NativeFence_IsValid_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_NativeFence_IsValid_0100 start====");
          let result: number = libGraphics2DApi20.fenceIsValidTrue();
          console.info("====>SUB_OH_NativeFence_IsValid_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_NativeFence_IsValid_0100 catch err: " + err);
          done();
        }
      })
    /**
     * @tc.number  : SUB_OH_NativeFence_IsValid_0200
     * @tc.name    : SUB_OH_NativeFence_IsValid_0200
     * @tc.desc    : test SUB_OH_NativeFence_IsValid false Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_NativeFence_IsValid_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_NativeFence_IsValid_0200 start====");
          let result: number = libGraphics2DApi20.fenceIsValidFalse();
          console.info("====>SUB_OH_NativeFence_IsValid_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_NativeFence_IsValid_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_NativeFence_Wait_0100
     * @tc.name    : SUB_OH_NativeFence_Wait_0100
     * @tc.desc    : test SUB_OH_NativeFence_Wait true Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_NativeFence_Wait_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_NativeFence_Wait_0100 start====");
          let result: number = libGraphics2DApi20.fenceWaitTrue();
          console.info("====>SUB_OH_NativeFence_Wait_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_NativeFence_Wait_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_NativeFence_Wait_0200
     * @tc.name    : SUB_OH_NativeFence_Wait_0200
     * @tc.desc    : test SUB_OH_NativeFence_Wait false Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_NativeFence_Wait_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_NativeFence_Wait_0200 start====");
          let result: number = libGraphics2DApi20.fenceWaitFalse();
          console.info("====>SUB_OH_NativeFence_Wait_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_NativeFence_Wait_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_NativeFence_WaitForever_0100
     * @tc.name    : SUB_OH_NativeFence_WaitForever_0100
     * @tc.desc    : test SUB_OH_NativeFence_WaitForever true Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_NativeFence_WaitForever_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_NativeFence_WaitForever_0100 start====");
          let result: number = libGraphics2DApi20.fenceWaitForeverTrue();
          console.info("====>SUB_OH_NativeFence_WaitForever_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_NativeFence_WaitForever_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_NativeFence_WaitForever_0200
     * @tc.name    : SUB_OH_NativeFence_WaitForever_0200
     * @tc.desc    : test SUB_OH_NativeFence_WaitForever false Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_NativeFence_WaitForever_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_NativeFence_WaitForever_0200 start====");
          let result: number = libGraphics2DApi20.fenceWaitForeverFalse();
          console.info("====>SUB_OH_NativeFence_WaitForever_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_NativeFence_WaitForever_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_NativeFence_Close_0100
     * @tc.name    : SUB_OH_NativeFence_Close_0100
     * @tc.desc    : test SUB_OH_NativeFence_Close true Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_NativeFence_Close_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_NativeFence_Close_0100 start====");
          let result: number = libGraphics2DApi20.fenceCloseTrue();
          console.info("====>SUB_OH_NativeFence_Close_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_NativeFence_Close_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_NativeFence_Close_0200
     * @tc.name    : SUB_OH_NativeFence_Close_0200
     * @tc.desc    : test SUB_OH_NativeFence_Close false Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_NativeFence_Close_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_NativeFence_Close_0200 start====");
          let result: number = libGraphics2DApi20.fenceCloseFalse();
          console.info("====>SUB_OH_NativeFence_Close_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_NativeFence_Close_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_NativeVSync_SetExpectedFrameRateRange_0100
     * @tc.name    : SUB_OH_NativeVSync_SetExpectedFrameRateRange_0100
     * @tc.desc    : test SUB_OH_NativeVSync_SetExpectedFrameRateRange success Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_NativeVSync_SetExpectedFrameRateRange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_NativeVSync_SetExpectedFrameRateRange_0100 start====");
          let result: number = libGraphics2DApi20.setExpectedFrameRateRangeSuccess();
          console.info("====>SUB_OH_NativeVSync_SetExpectedFrameRateRange_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_NativeVSync_SetExpectedFrameRateRange_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_NativeVSync_SetExpectedFrameRateRange_0200
     * @tc.name    : SUB_OH_NativeVSync_SetExpectedFrameRateRange_0200
     * @tc.desc    : test SUB_OH_NativeVSync_SetExpectedFrameRateRange fail Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_NativeVSync_SetExpectedFrameRateRange_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_NativeVSync_SetExpectedFrameRateRange_0200 start====");
          let result: number = libGraphics2DApi20.setExpectedFrameRateRangeNull();
          console.info("====>SUB_OH_NativeVSync_SetExpectedFrameRateRange_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_NativeVSync_SetExpectedFrameRateRange_0200 catch err: " + err);
          done();
        }
      })
  })
}
