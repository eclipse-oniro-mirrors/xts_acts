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

const success = 0;
export default function NativeBufferTest() {
  describe('NativeBufferTest', () => {
    /**
     * @tc.name   SUB_OH_NativeBufferEBUFULL_0100
     * @tc.number SUB_OH_NativeBufferEBUFULL_0100
     * @tc.desc   Test testNativeBufferEBUFULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_NativeBufferEBUFULL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeBufferEBUFULL_0100 start====");
          let result: number = libGraphics2DApi20.testNativeBufferEBUFULL();
          console.info("====> SUB_OH_NativeBufferEBUFULL_0100 result====", result);
          expect(result).assertEqual(success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeBufferEBUFULL_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeBufferSMPTECFULL_0200
     * @tc.number SUB_OH_NativeBufferSMPTECFULL_0200
     * @tc.desc   Test testNativeBufferSMPTECFULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_NativeBufferSMPTECFULL_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeBufferSMPTECFULL_0200 start====");
          let result: number = libGraphics2DApi20.testNativeBufferSMPTECFULL();
          console.info("====> SUB_OH_NativeBufferSMPTECFULL_0200 result====", result);
          expect(result).assertEqual(success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeBufferSMPTECFULL_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeBufferEBULIMIT_0300
     * @tc.number SUB_OH_NativeBufferEBULIMIT_0300
     * @tc.desc   Test testNativeBufferEBULIMIT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_NativeBufferEBULIMIT_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeBufferEBULIMIT_0300 start====");
          let result: number = libGraphics2DApi20.testNativeBufferEBULIMIT();
          console.info("====> SUB_OH_NativeBufferEBULIMIT_0300 result====", result);
          expect(result).assertEqual(success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeBufferEBULIMIT_0300 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeBufferSMPTECLIMIT_0400
     * @tc.number SUB_OH_NativeBufferSMPTECLIMIT_0400
     * @tc.desc   Test testNativeBufferSMPTECLIMIT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_NativeBufferSMPTECLIMIT_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeBufferSMPTECLIMIT_0400 start====");
          let result: number = libGraphics2DApi20.testNativeBufferSMPTECLIMIT();
          console.info("====> SUB_OH_NativeBufferSMPTECLIMIT_0400 result====", result);
          expect(result).assertEqual(success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeBufferSMPTECLIMIT_0400 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeBufferADOBERGBFULL_0500
     * @tc.number SUB_OH_NativeBufferADOBERGBFULL_0500
     * @tc.desc   Test testNativeBufferADOBERGBFULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_NativeBufferADOBERGBFULL_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeBufferADOBERGBFULL_0500 start====");
          let result: number = libGraphics2DApi20.testNativeBufferADOBERGBFULL();
          console.info("====> SUB_OH_NativeBufferADOBERGBFULL_0500 result====", result);
          expect(result).assertEqual(success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeBufferADOBERGBFULL_0500 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeLINEARSRGB_0600
     * @tc.number SUB_OH_NativeLINEARSRGB_0600
     * @tc.desc   Test testNativeLINEARSRGB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_NativeLINEARSRGB_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeLINEARSRGB_0600 start====");
          let result: number = libGraphics2DApi20.testNativeLINEARSRGB();
          console.info("====> SUB_OH_NativeLINEARSRGB_0600 result====", result);
          expect(result).assertEqual(success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeLINEARSRGB_0600 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeBufferLINEARBT709_0700
     * @tc.number SUB_OH_NativeBufferLINEARBT709_0700
     * @tc.desc   Test testNativeBufferLINEARBT709
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_NativeBufferLINEARBT709_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeBufferLINEARBT709_0700 start====");
          let result: number = libGraphics2DApi20.testNativeBufferLINEARBT709();
          console.info("====> SUB_OH_NativeBufferLINEARBT709_0700 result====", result);
          expect(result).assertEqual(success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeBufferLINEARBT709_0700 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeLINEARP3_0800
     * @tc.number SUB_OH_NativeLINEARP3_0800
     * @tc.desc   Test testNativeLINEARP3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_NativeLINEARP3_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeLINEARP3_0800 start====");
          let result: number = libGraphics2DApi20.testNativeLINEARP3();
          console.info("====> SUB_OH_NativeLINEARP3_0800 result====", result);
          expect(result).assertEqual(success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeLINEARP3_0800 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeBufferLINEARBT2020_0900
     * @tc.number SUB_OH_NativeBufferLINEARBT2020_0900
     * @tc.desc   Test testNativeBufferLINEARBT2020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_NativeBufferLINEARBT2020_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeBufferLINEARBT2020_0900 start====");
          let result: number = libGraphics2DApi20.testNativeBufferLINEARBT2020();
          console.info("====> SUB_OH_NativeBufferLINEARBT2020_0900 result====", result);
          expect(result).assertEqual(success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeBufferLINEARBT2020_0900 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeBufferDISPLAYSRGB_1000
     * @tc.number SUB_OH_NativeBufferDISPLAYSRGB_1000
     * @tc.desc   Test testNativeBufferDISPLAYSRGB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_NativeBufferDISPLAYSRGB_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeBufferDISPLAYSRGB_1000 start====");
          let result: number = libGraphics2DApi20.testNativeBufferDISPLAYSRGB();
          console.info("====> SUB_OH_NativeBufferDISPLAYSRGB_1000 result====", result);
          expect(result).assertEqual(success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeBufferDISPLAYSRGB_1000 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeBufferDISPLAYP3SRGB_1100
     * @tc.number SUB_OH_NativeBufferDISPLAYP3SRGB_1100
     * @tc.desc   Test testNativeBufferDISPLAYP3SRGB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_NativeBufferDISPLAYP3SRGB_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeBufferDISPLAYP3SRGB_1100 start====");
          let result: number = libGraphics2DApi20.testNativeBufferDISPLAYP3SRGB();
          console.info("====> SUB_OH_NativeBufferDISPLAYP3SRGB_1100 result====", result);
          expect(result).assertEqual(success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeBufferDISPLAYP3SRGB_1100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeBufferDISPLAYP3HLG_1200
     * @tc.number SUB_OH_NativeBufferDISPLAYP3HLG_1200
     * @tc.desc   Test testNativeBufferDISPLAYP3HLG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_NativeBufferDISPLAYP3HLG_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeBufferDISPLAYP3HLG_1200 start====");
          let result: number = libGraphics2DApi20.testNativeBufferDISPLAYP3HLG();
          console.info("====> SUB_OH_NativeBufferDISPLAYP3HLG_1200 result====", result);
          expect(result).assertEqual(success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeBufferDISPLAYP3HLG_1200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeBufferDISPLAYP3PQ_1300
     * @tc.number SUB_OH_NativeBufferDISPLAYP3PQ_1300
     * @tc.desc   Test testNativeBufferDISPLAYP3PQ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_NativeBufferDISPLAYP3PQ_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeBufferDISPLAYP3PQ_1300 start====");
          let result: number = libGraphics2DApi20.testNativeBufferDISPLAYP3PQ();
          console.info("====> SUB_OH_NativeBufferDISPLAYP3PQ_1300 result====", result);
          expect(result).assertEqual(success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeBufferDISPLAYP3PQ_1300 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeBufferDISPLAYBT2020SRGB_1400
     * @tc.number SUB_OH_NativeBufferDISPLAYBT2020SRGB_1400
     * @tc.desc   Test testNativeBufferDISPLAYBT2020SRGB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_NativeBufferDISPLAYBT2020SRGB_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeBufferDISPLAYBT2020SRGB_1400 start====");
          let result: number = libGraphics2DApi20.testNativeBufferDISPLAYBT2020SRGB();
          console.info("====> SUB_OH_NativeBufferDISPLAYBT2020SRGB_1400 result====", result);
          expect(result).assertEqual(success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeBufferDISPLAYBT2020SRGB_1400 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeBufferDISPLAYBT2020HLG_1500
     * @tc.number SUB_OH_NativeBufferDISPLAYBT2020HLG_1500
     * @tc.desc   Test testNativeBufferDISPLAYBT2020HLG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_NativeBufferDISPLAYBT2020HLG_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeBufferDISPLAYBT2020HLG_1500 start====");
          let result: number = libGraphics2DApi20.testNativeBufferDISPLAYBT2020HLG();
          console.info("====> SUB_OH_NativeBufferDISPLAYBT2020HLG_1500 result====", result);
          expect(result).assertEqual(success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeBufferDISPLAYBT2020HLG_1500 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeBufferDISPLAYBT2020PQ_1600
     * @tc.number SUB_OH_NativeBufferDISPLAYBT2020PQ_1600
     * @tc.desc   Test testNativeBufferDISPLAYBT2020PQ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_NativeBufferDISPLAYBT2020PQ_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeBufferDISPLAYBT2020PQ_1600 start====");
          let result: number = libGraphics2DApi20.testNativeBufferDISPLAYBT2020PQ();
          console.info("====> SUB_OH_NativeBufferDISPLAYBT2020PQ_1600 result====", result);
          expect(result).assertEqual(success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeBufferDISPLAYBT2020PQ_1600 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeBuffer_ColorX_0100
     * @tc.number SUB_OH_NativeBuffer_ColorX_0100
     * @tc.desc   Test ColorX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_NativeBuffer_ColorX_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeBuffer_ColorX_0100 start====");
          let result: number = libGraphics2DApi20.ColorX();
          console.info("====> SUB_OH_NativeBuffer_ColorX_0100 result====", result);
          expect(result).assertEqual(success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeBuffer_ColorX_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeBuffer_ColorY_0200
     * @tc.number SUB_OH_NativeBuffer_ColorY_0200
     * @tc.desc   Test ColorY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_NativeBuffer_ColorY_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeBuffer_ColorY_0200 start====");
          let result: number = libGraphics2DApi20.ColorY();
          console.info("====> SUB_OH_NativeBuffer_ColorY_0200 result====", result);
          expect(result).assertEqual(success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeBuffer_ColorY_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeBuffer_Smpte2086Red_0300
     * @tc.number SUB_OH_NativeBuffer_Smpte2086Red_0300
     * @tc.desc   Test Smpte2086Red
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_NativeBuffer_Smpte2086Red_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeBuffer_Smpte2086Red_0300 start====");
          let result: number = libGraphics2DApi20.Smpte2086Red();
          console.info("====> SUB_OH_NativeBuffer_Smpte2086Red_0300 result====", result);
          expect(result).assertEqual(success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeBuffer_Smpte2086Red_0300 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeBuffer_Smpte2086Green_0400
     * @tc.number SUB_OH_NativeBuffer_Smpte2086Green_0400
     * @tc.desc   Test Smpte2086Green
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_NativeBuffer_Smpte2086Green_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeBuffer_Smpte2086Green_0400 start====");
          let result: number = libGraphics2DApi20.Smpte2086Green();
          console.info("====> SUB_OH_NativeBuffer_Smpte2086Green_0400 result====", result);
          expect(result).assertEqual(success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeBuffer_Smpte2086Green_0400 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeBuffer_Smpte2086Blue_0500
     * @tc.number SUB_OH_NativeBuffer_Smpte2086Blue_0500
     * @tc.desc   Test Smpte2086Blue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_NativeBuffer_Smpte2086Blue_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeBuffer_Smpte2086Blue_0500 start====");
          let result: number = libGraphics2DApi20.Smpte2086Blue();
          console.info("====> SUB_OH_NativeBuffer_Smpte2086Blue_0500 result====", result);
          expect(result).assertEqual(success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeBuffer_Smpte2086Blue_0500 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeBuffer_Smpte2086WhitePoint_0600
     * @tc.number SUB_OH_NativeBuffer_Smpte2086WhitePoint_0600
     * @tc.desc   Test Smpte2086WhitePoint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_NativeBuffer_Smpte2086WhitePoint_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeBuffer_Smpte2086WhitePoint_0600 start====");
          let result: number = libGraphics2DApi20.Smpte2086WhitePoint();
          console.info("====> SUB_OH_NativeBuffer_Smpte2086WhitePoint_0600 result====", result);
          expect(result).assertEqual(success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeBuffer_Smpte2086WhitePoint_0600 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeBuffer_Smpte2086MaxLum_0700
     * @tc.number SUB_OH_NativeBuffer_Smpte2086MaxLum_0700
     * @tc.desc   Test Smpte2086MaxLum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_NativeBuffer_Smpte2086MaxLum_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeBuffer_Smpte2086MaxLum_0700 start====");
          let result: number = libGraphics2DApi20.Smpte2086MaxLum();
          console.info("====> SUB_OH_NativeBuffer_Smpte2086MaxLum_0700 result====", result);
          expect(result).assertEqual(success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeBuffer_Smpte2086MaxLum_0700 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeBuffer_Smpte2086MinLum_0800
     * @tc.number SUB_OH_NativeBuffer_Smpte2086MinLum_0800
     * @tc.desc   Test Smpte2086MinLum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_NativeBuffer_Smpte2086MinLum_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeBuffer_Smpte2086MinLum_0800 start====");
          let result: number = libGraphics2DApi20.Smpte2086MinLum();
          console.info("====> SUB_OH_NativeBuffer_Smpte2086MinLum_0800 result====", result);
          expect(result).assertEqual(success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeBuffer_Smpte2086MinLum_0800 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeBuffer_Cta861_maxContentLightLevel_0900
     * @tc.number SUB_OH_NativeBuffer_Cta861_maxContentLightLevel_0900
     * @tc.desc   Test Cta861MaxContentLightLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_NativeBuffer_Cta861_maxContentLightLevel_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeBuffer_Cta861_maxContentLightLevel_0900 start====");
          let result: number = libGraphics2DApi20.Cta861MaxContentLightLevel();
          console.info("====> SUB_OH_NativeBuffer_Cta861_maxContentLightLevel_0900 result====", result);
          expect(result).assertEqual(success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeBuffer_Cta861_maxContentLightLevel_0900 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeBuffer_Cta861_maxContentLightLevel_1000
     * @tc.number SUB_OH_NativeBuffer_Cta861_maxContentLightLevel_1000
     * @tc.desc   Test Cta861MaxFrameAverageLightLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_NativeBuffer_Cta861_maxContentLightLevel_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeBuffer_Cta861_maxContentLightLevel_1000 start====");
          let result: number = libGraphics2DApi20.Cta861MaxFrameAverageLightLevel();
          console.info("====> SUB_OH_NativeBuffer_Cta861_maxContentLightLevel_1000 result====", result);
          expect(result).assertEqual(success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeBuffer_Cta861_maxContentLightLevel_1000 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeBuffer_Smpte2086_1100
     * @tc.number SUB_OH_NativeBuffer_Smpte2086_1100
     * @tc.desc   Test smpte2086
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_NativeBuffer_Smpte2086_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeBuffer_Smpte2086_1100 start====");
          let result: number = libGraphics2DApi20.smpte2086();
          console.info("====> SUB_OH_NativeBuffer_Smpte2086_1100 result====", result);
          expect(result).assertEqual(success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeBuffer_Smpte2086_1100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeBuffer_Cta861_1200
     * @tc.number SUB_OH_NativeBuffer_Cta861_1200
     * @tc.desc   Test cta861
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_NativeBuffer_Cta861_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeBuffer_Cta861_1200 start====");
          let result: number = libGraphics2DApi20.cta861();
          console.info("====> SUB_OH_NativeBuffer_Cta861_1200 result====", result);
          expect(result).assertEqual(success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeBuffer_Cta861_1200 catch err: " + err);
          done();
        }
      })
  })
}