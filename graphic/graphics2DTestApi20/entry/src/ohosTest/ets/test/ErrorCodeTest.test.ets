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
export default function ErrorCodeTest() {
  describe('ErrorCodeTest', () => {
    /**
     * @tc.number  : SUB_OH_OHNativeErrorCode_0100
     * @tc.name    : SUB_OH_OHNativeErrorCode_0100
     * @tc.desc    : test SUB_OH_OHNativeErrorCode ok Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_OHNativeErrorCode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_OHNativeErrorCode_0100 start====");
          let result: number = libGraphics2DApi20.OHNativeErrorCodeOK();
          console.info("====>SUB_OH_OHNativeErrorCode_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_OHNativeErrorCode_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_OHNativeErrorCode_0200
     * @tc.name    : SUB_OH_OHNativeErrorCode_0200
     * @tc.desc    : test SUB_OH_OHNativeErrorCode invalid Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_OHNativeErrorCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_OHNativeErrorCode_0100 start====");
          let result: number = libGraphics2DApi20.OHNativeErrorCodeInvalid();
          console.info("====>SUB_OH_OHNativeErrorCode_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_OHNativeErrorCode_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_BufferErrorCodeOK_0100
     * @tc.name    : SUB_OH_Drawing_BufferErrorCodeOK_0100
     * @tc.desc    : test SUB_OH_Drawing_BufferErrorCode return ok Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_BufferErrorCodeOK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_BufferErrorCodeOK_0100 start====");
          let result: number = libGraphics2DApi20.OHDrawingBufferErrorCodeOK();
          console.info("====>SUB_OH_Drawing_BufferErrorCodeOK_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_BufferErrorCodeOK_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_OHNativeErrorCodeBuffer_0200
     * @tc.name    : SUB_OH_OHNativeErrorCodeBuffer_0200
     * @tc.desc    : test SUB_OH_OHNativeErrorCodeBuffer invalid Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_OHNativeErrorCodeBuffer_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_OHNativeErrorCodeBuffer_0200 start====");
          let result: number = libGraphics2DApi20.OHNativeErrorCodeBufferInvalid();
          console.info("====>SUB_OH_OHNativeErrorCodeBuffer_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_OHNativeErrorCodeBuffer_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_OHNativeErrorCodeBufferSupport_0100
     * @tc.name    : SUB_OH_OHNativeErrorCodeBufferSupport_0100
     * @tc.desc    : test SUB_OH_OHNativeErrorCodeBuffer UNSUPPORTED Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_OHNativeErrorCodeBufferSupport_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_OHNativeErrorCodeBufferSupport_0100 start====");
          let result: number = libGraphics2DApi20.OHNativeErrorCodeBufferSupport();
          console.info("====>SUB_OH_OHNativeErrorCodeBufferSupport_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_OHNativeErrorCodeBufferSupport_0100 catch err: " + err);
          done();
        }
      })


    /**
     * @tc.number  : SUB_OH_Drawing_BufferHDIError_0100
     * @tc.name    : SUB_OH_Drawing_BufferHDIError_0100
     * @tc.desc    : test SUB_OH_Drawing_BufferHDIError code Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_BufferHDIError_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_BufferHDIError_0100 start====");
          let result: number = libGraphics2DApi20.OHDrawingBufferHDIError();
          console.info("====>SUB_OH_Drawing_BufferHDIError_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_BufferHDIError_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_OHNativeErrorCodeBufferImage_0100
     * @tc.name    : SUB_OH_OHNativeErrorCodeBufferImage_0100
     * @tc.desc    : test SUB_OH_OHNativeErrorCodeBufferImage unsupport Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_OHNativeErrorCodeBufferImage_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_OHNativeErrorCodeBufferImage_0100 start====");
          let result: number = libGraphics2DApi20.OHNativeErrorCodeImageSupport();
          console.info("====>SUB_OH_OHNativeErrorCodeBufferImage_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_OHNativeErrorCodeBufferImage_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_OHNativeErrorCodeImageNoBuffer_0100
     * @tc.name    : SUB_OH_OHNativeErrorCodeImageNoBuffer_0100
     * @tc.desc    : test SUB_OH_OHNativeErrorCodeImage no buffer Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_OHNativeErrorCodeImageNoBuffer_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_OHNativeErrorCodeImageNoBuffer_0100 start====");
          let result: number = libGraphics2DApi20.OHNativeErrorCodeImageNoBuffer();
          console.info("====>SUB_OH_OHNativeErrorCodeImageNoBuffer_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_OHNativeErrorCodeImageNoBuffer_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_NativeImage_ErrCodeBUFFER_STATE_INVALID
     * @tc.name    : SUB_OH_NativeImage_ErrCodeBUFFER_STATE_INVALID
     * @tc.desc    : test SUB_OH_NativeImage_ErrCodeBUFFER_STATE_INVALID Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_NativeImage_ErrCodeBUFFER_STATE_INVALID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_NativeImage_ErrCodeBUFFER_STATE_INVALID start====");
          let result: number = libGraphics2DApi20.OHNativeImageErrCodeBUFFER_STATE_INVALID();
          console.info("====>SUB_OH_NativeImage_ErrCodeBUFFER_STATE_INVALID result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_NativeImage_ErrCodeBUFFER_STATE_INVALID catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_NativeImage_ErrCodeBUFFER_NOT_IN_CACHE
     * @tc.name    : SUB_OH_NativeImage_ErrCodeBUFFER_NOT_IN_CACHE
     * @tc.desc    : test SUB_OH_NativeImage_ErrCodeBUFFER_NOT_IN_CACHE Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_NativeImage_ErrCodeBUFFER_NOT_IN_CACHE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_NativeImage_ErrCodeBUFFER_NOT_IN_CACHE start====");
          let result: number = libGraphics2DApi20.OHNativeImage_ErrCodeBUFFER_NOT_IN_CACHE();
          console.info("====>SUB_OH_NativeImage_ErrCodeBUFFER_NOT_IN_CACHE result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_NativeImage_ErrCodeBUFFER_NOT_IN_CACHE catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_OHNativeErrorCodeVSync_0100
     * @tc.name    : SUB_OH_OHNativeErrorCodeVSync_0100
     * @tc.desc    : test SUB_OH_OHNativeErrorCodeVSync ok Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_OHNativeErrorCodeVSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_OHNativeErrorCodeVSync_0100 start====");
          let result: number = libGraphics2DApi20.OHNativeErrorCodeVSyncOk();
          console.info("====>SUB_OH_OHNativeErrorCodeVSync_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_OHNativeErrorCodeVSync_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_OHNativeErrorCodeVSync_0200
     * @tc.name    : SUB_OH_OHNativeErrorCodeVSync_0200
     * @tc.desc    : test SUB_OH_OHNativeErrorCodeVSync Invalid Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_OHNativeErrorCodeVSync_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_OHNativeErrorCodeVSync_0200 start====");
          let result: number = libGraphics2DApi20.OHNativeErrorCodeVSyncInvalid();
          console.info("====>SUB_OH_OHNativeErrorCodeVSync_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_OHNativeErrorCodeVSync_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_OHNativeErrorCodeWindow_0100
     * @tc.name    : SUB_OH_OHNativeErrorCodeWindow_0100
     * @tc.desc    : test SUB_OH_OHNativeErrorCodeWindow ok Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_OHNativeErrorCodeWindow_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_OHNativeErrorCodeWindow_0100 start====");
          let result: number = libGraphics2DApi20.OHNativeErrorCodeWindowOk();
          console.info("====>SUB_OH_OHNativeErrorCodeWindow_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_OHNativeErrorCodeWindow_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_OHNativeErrorCodeWindowInvalid_0100
     * @tc.name    : SUB_OH_OHNativeErrorCodeWindowInvalid_0100
     * @tc.desc    : test SUB_OH_OHNativeErrorCodeWindowInvalid Invalid Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_OHNativeErrorCodeWindowInvalid_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_OHNativeErrorCodeWindowInvalid_0100 start====");
          let result: number = libGraphics2DApi20.OHNativeErrorCodeWindowInvalid();
          console.info("====>SUB_OH_OHNativeErrorCodeWindowInvalid_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_OHNativeErrorCodeWindowInvalid_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_NativeErrorCodeWindowUNKNOW_0100
     * @tc.name    : SUB_OH_NativeErrorCodeWindowUNKNOW_0100
     * @tc.desc    : test SUB_OH_NativeErrorCodeWindowUNKNOW Invalid Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_NativeErrorCodeWindowUNKNOW_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_NativeErrorCodeWindowUNKNOW_0100 start====");
          let result: number = libGraphics2DApi20.OHNativeErrorCodeWindowUNKNOW();
          console.info("====>SUB_OH_NativeErrorCodeWindowUNKNOW_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_NativeErrorCodeWindowUNKNOW_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_DrawingErrorCode_0100
     * @tc.name    : SUB_OH_Drawing_DrawingErrorCode_0100
     * @tc.desc    : test SUB_OH_Drawing_DrawingErrorCode Alloc Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_DrawingErrorCode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_DrawingErrorCode_0100 start====");
          let result: number = libGraphics2DApi20.OHDrawingErrorCodeSuccess();
          console.info("====>SUB_OH_Drawing_DrawingErrorCode_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_DrawingErrorCode_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_LineTypographyGetLineBreak_0100
     * @tc.name    : SUB_OH_Drawing_LineTypographyGetLineBreak_0100
     * @tc.desc    : test SUB_OH_Drawing_LineTypographyGetLineBreak invalue Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_LineTypographyGetLineBreak_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_LineTypographyGetLineBreak_0100 start====");
          let result: number = libGraphics2DApi20.OHDrawingLineTypographyGetLineBreakInvalue();
          console.info("====>SUB_OH_Drawing_LineTypographyGetLineBreak_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_LineTypographyGetLineBreak_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_LineTypographyCreateLineInvalue_0100
     * @tc.name    : SUB_OH_Drawing_LineTypographyCreateLineInvalue_0100
     * @tc.desc    : test SUB_OH_Drawing_LineTypographyCreateLineInvalue invalue Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_LineTypographyCreateLineInvalue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_LineTypographyCreateLineInvalue_0100 start====");
          let result: number = libGraphics2DApi20.OHDrawingLineTypographyCreateLineInvalue();
          console.info("====>SUB_OH_Drawing_LineTypographyCreateLineInvalue_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_LineTypographyCreateLineInvalue_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_EffectTileModeREPEATSuccess_0100
     * @tc.name    : SUB_OH_EffectTileModeREPEATSuccess_0100
     * @tc.desc    : test SUB_OH_EffectTileModeREPEAT Success Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_EffectTileModeREPEATSuccess_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_EffectTileModeREPEATSuccess_0100 start====");
          let result: number = libGraphics2DApi20.EffectTileModeREPEATSuccess();
          console.info("====>SUB_OH_EffectTileModeREPEATSuccess_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_EffectTileModeREPEATSuccess_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_EffectTileModeMIRROR_0100
     * @tc.name    : SUB_OH_EffectTileModeMIRROR_0100
     * @tc.desc    : test SUB_OH_EffectTileModeMIRROR Success Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_EffectTileModeMIRROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_EffectTileModeMIRROR_0100 start====");
          let result: number = libGraphics2DApi20.EffectTileModeMIRRORSuccess();
          console.info("====>SUB_OH_EffectTileModeMIRROR_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_EffectTileModeMIRROR_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_EffectTileModeDECAL_0100
     * @tc.name    : SUB_OH_EffectTileModeDECAL_0100
     * @tc.desc    : test SUB_OH_EffectTileModeDECAL Success Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_EffectTileModeDECAL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_EffectTileModeDECAL_0100 start====");
          let result: number = libGraphics2DApi20.EffectTileModeDECALSuccess();
          console.info("====>SUB_OH_EffectTileModeDECAL_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_EffectTileModeDECAL_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_SamplingOptionsCopy_0100
     * @tc.name    : SUB_OH_Drawing_SamplingOptionsCopy_0100
     * @tc.desc    : test SUB_OH_Drawing_SamplingOptionsCopy Success Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_SamplingOptionsCopy_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_SamplingOptionsCopy_0100 start====");
          let result: number = libGraphics2DApi20.samplingOptionsCopySuccess();
          console.info("====>SUB_OH_Drawing_SamplingOptionsCopy_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_SamplingOptionsCopy_0100 catch err: " + err);
          done();
        }
      })
    /**
     * @tc.number  : SUB_OH_Drawing_SamplingOptionsCopy_0200
     * @tc.name    : SUB_OH_Drawing_SamplingOptionsCopy_0200
     * @tc.desc    : test SUB_OH_Drawing_SamplingOptionsCopy Fail Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_SamplingOptionsCopy_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_SamplingOptionsCopy_0200 start====");
          let result: number = libGraphics2DApi20.samplingOptionsCopyInvalue();
          console.info("====>SUB_OH_Drawing_SamplingOptionsCopy_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_SamplingOptionsCopy_0200 catch err: " + err);
          done();
        }
      })
  })
}
