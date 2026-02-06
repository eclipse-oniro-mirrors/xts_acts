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
const DCI_P3 = 2;
const DISPLAY_P3 = 3;
const SRGB = 4;
const CUSTOM  = 0;
const BT709 = 6;
const BT601_EBU  = 7;
const BT601_SMPTE_C  = 8;
const BT2020_HLG  = 9;
const BT2020_PQ = 10;
const P3_HLG = 11;
const P3_PQ = 12;
const ADOBE_RGB_LIMIT = 13;
const DISPLAY_P3_LIMIT = 14;
const SRGB_LIMIT = 15;
const BT709_LIMIT = 16;
const BT601_EBU_LIMIT = 17;
const BT601_SMPTE_C_LIMIT = 18;
const BT2020_HLG_LIMIT = 19;
const BT2020_PQ_LIMIT = 20;
const P3_HLG_LIMIT = 21;
const P3_PQ_LIMIT = 22;
const LINEAR_P3 = 23;
const LINEAR_SRGB = 24;
const LINEAR_BT709 = 24;
const LINEAR_BT2020 = 25;
export default function ColorSpaceNameTest() {
  describe('ColorSpaceNameTest', () => {
    /**
     * @tc.number  : SUB_OH_CreateColorSpaceFromNameBT601EBU_0100
     * @tc.name    : SUB_OH_CreateColorSpaceFromNameBT601EBU_0100
     * @tc.desc    : Test OHCreateColorSpaceFromNameBT601EBU
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_CreateColorSpaceFromNameBT601EBU_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_CreateColorSpaceFromNameBT601EBU_0100 start====");
          let result: number = libGraphics2DApi20.OHCreateColorSpaceFromNameBT601EBU();
          console.info("====> SUB_OH_CreateColorSpaceFromNameBT601EBU_0100 result====", result);
          expect(result).assertEqual(BT601_EBU);
          done();
        } catch (err) {
          console.error("====> SUB_OH_CreateColorSpaceFromNameBT601EBU_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_CreateColorSpaceFromNameBT601SMPTEC_0200
     * @tc.name    : SUB_OH_CreateColorSpaceFromNameBT601SMPTEC_0200
     * @tc.desc    : Test OHCreateColorSpaceFromNameBT601SMPTEC
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_CreateColorSpaceFromNameBT601SMPTEC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_CreateColorSpaceFromNameBT601SMPTEC_0200 start====");
          let result: number = libGraphics2DApi20.OHCreateColorSpaceFromNameBT601SMPTEC();
          console.info("====> SUB_OH_CreateColorSpaceFromNameBT601SMPTEC_0200 result====", result);
          expect(result).assertEqual(BT601_SMPTE_C);
          done();
        } catch (err) {
          console.error("====> SUB_OH_CreateColorSpaceFromNameBT601SMPTEC_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_CreateColorSpaceFromNameBT2020HLG_0300
     * @tc.name    : SUB_OH_CreateColorSpaceFromNameBT2020HLG_0300
     * @tc.desc    : Test OHCreateColorSpaceFromNameBT2020HLG
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_CreateColorSpaceFromNameBT2020HLG_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_CreateColorSpaceFromNameBT2020HLG_0300 start====");
          let result: number = libGraphics2DApi20.OHCreateColorSpaceFromNameBT2020HLG();
          console.info("====> SUB_OH_CreateColorSpaceFromNameBT2020HLG_0300 result====", result);
          expect(result).assertEqual(BT2020_HLG);
          done();
        } catch (err) {
          console.error("====> SUB_OH_CreateColorSpaceFromNameBT2020HLG_0300 catch err: " + err);
          done();
        }
    })

    /**
     * @tc.number  : SUB_OH_CreateColorSpaceFromNameBT2020PQ_0400
     * @tc.name    : SUB_OH_CreateColorSpaceFromNameBT2020PQ_0400
     * @tc.desc    : Test OHCreateColorSpaceFromNameBT2020PQ
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_CreateColorSpaceFromNameBT2020PQ_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_CreateColorSpaceFromNameBT2020PQ_0400 start====");
          let result: number = libGraphics2DApi20.OHCreateColorSpaceFromNameBT2020PQ();
          console.info("====> SUB_OH_CreateColorSpaceFromNameBT2020PQ_0400 result====", result);
          expect(result).assertEqual(BT2020_PQ);
          done();
        } catch (err) {
          console.error("====> SUB_OH_CreateColorSpaceFromNameBT2020PQ_0400 catch err: " + err);
          done();
        }
    })

    /**
     * @tc.number  : SUB_OH_CreateColorSpaceFromNameP3HLG_0500
     * @tc.name    : SUB_OH_CreateColorSpaceFromNameP3HLG_0500
     * @tc.desc    : Test OHCreateColorSpaceFromNameP3HLG
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_CreateColorSpaceFromNameP3HLG_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_CreateColorSpaceFromNameP3HLG_0500 start====");
          let result: number = libGraphics2DApi20.OHCreateColorSpaceFromNameP3HLG();
          console.info("====> SUB_OH_CreateColorSpaceFromNameP3HLG_0500 result====", result);
          expect(result).assertEqual(P3_HLG);
          done();
        } catch (err) {
          console.error("====> SUB_OH_CreateColorSpaceFromNameP3HLG_0500 catch err: " + err);
          done();
        }
    })

    /**
     * @tc.number  : SUB_OH_CreateColorSpaceFromNameP3PQ_0600
     * @tc.name    : SUB_OH_CreateColorSpaceFromNameP3PQ_0600
     * @tc.desc    : Test OHCreateColorSpaceFromNameP3PQ
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_CreateColorSpaceFromNameP3PQ_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_CreateColorSpaceFromNameP3PQ_0600 start====");
          let result: number = libGraphics2DApi20.OHCreateColorSpaceFromNameP3PQ();
          console.info("====> SUB_OH_CreateColorSpaceFromNameP3PQ_0600 result====", result);
          expect(result).assertEqual(P3_PQ);
          done();
        } catch (err) {
          console.error("====> SUB_OH_CreateColorSpaceFromNameP3PQ_0600 catch err: " + err);
          done();
        }
    })

    /**
     * @tc.number  : SUB_OH_CreateColorSpaceFromNameADOBERGBLIMIT_0700
     * @tc.name    : SUB_OH_CreateColorSpaceFromNameADOBERGBLIMIT_0700
     * @tc.desc    : Test OHCreateColorSpaceFromNameADOBERGBLIMIT
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_CreateColorSpaceFromNameADOBERGBLIMIT_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_CreateColorSpaceFromNameADOBERGBLIMIT_0700 start====");
          let result: number = libGraphics2DApi20.OHCreateColorSpaceFromNameADOBERGBLIMIT();
          console.info("====> SUB_OH_CreateColorSpaceFromNameADOBERGBLIMIT_0700 result====", result);
          expect(result).assertEqual(ADOBE_RGB_LIMIT);
          done();
        } catch (err) {
          console.error("====> SUB_OH_CreateColorSpaceFromNameADOBERGBLIMIT_0700 catch err: " + err);
          done();
        }
    })

    /**
     * @tc.number  : SUB_OH_CreateColorSpaceFromNameDISPLAYP3LIMIT_0800
     * @tc.name    : SUB_OH_CreateColorSpaceFromNameDISPLAYP3LIMIT_0800
     * @tc.desc    : Test OHCreateColorSpaceFromNameDISPLAYP3LIMIT
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_CreateColorSpaceFromNameDISPLAYP3LIMIT_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_CreateColorSpaceFromNameDISPLAYP3LIMIT_0800 start====");
          let result: number = libGraphics2DApi20.OHCreateColorSpaceFromNameDISPLAYP3LIMIT();
          console.info("====> SUB_OH_CreateColorSpaceFromNameDISPLAYP3LIMIT_0800 result====", result);
          expect(result).assertEqual(DISPLAY_P3_LIMIT);
          done();
        } catch (err) {
          console.error("====> SUB_OH_CreateColorSpaceFromNameDISPLAYP3LIMIT_0800 catch err: " + err);
          done();
        }
    })

    /**
     * @tc.number  : SUB_OH_CreateColorSpaceFromNameSRGBLIMIT_0900
     * @tc.name    : SUB_OH_CreateColorSpaceFromNameSRGBLIMIT_0900
     * @tc.desc    : Test OHCreateColorSpaceFromNameSRGBLIMIT
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_CreateColorSpaceFromNameSRGBLIMIT_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_CreateColorSpaceFromNameSRGBLIMIT_0900 start====");
          let result: number = libGraphics2DApi20.OHCreateColorSpaceFromNameSRGBLIMIT();
          console.info("====> SUB_OH_CreateColorSpaceFromNameSRGBLIMIT_0900 result====", result);
          expect(result).assertEqual(SRGB_LIMIT);
          done();
        } catch (err) {
          console.error("====> SUB_OH_CreateColorSpaceFromNameSRGBLIMIT_0900 catch err: " + err);
          done();
        }
    })

    /**
     * @tc.number  : SUB_OH_CreateColorSpaceFromNameSRGBLIMIT_1000
     * @tc.name    : SUB_OH_CreateColorSpaceFromNameSRGBLIMIT_1000
     * @tc.desc    : Test OHCreateColorSpaceFromNameSRGBLIMIT
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_CreateColorSpaceFromNameSRGBLIMIT_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_CreateColorSpaceFromNameSRGBLIMIT_1000 start====");
          let result: number = libGraphics2DApi20.OHCreateColorSpaceFromNameBT709LIMIT();
          console.info("====> SUB_OH_CreateColorSpaceFromNameSRGBLIMIT_1000 result====", result);
          expect(result).assertEqual(BT709_LIMIT);
          done();
        } catch (err) {
          console.error("====> SUB_OH_CreateColorSpaceFromNameSRGBLIMIT_1000 catch err: " + err);
          done();
        }
    })

    /**
     * @tc.number  : SUB_OH_CreateColorSpaceFromNameBT601EBULIMIT_1100
     * @tc.name    : SUB_OH_CreateColorSpaceFromNameBT601EBULIMIT_1100
     * @tc.desc    : Test OHCreateColorSpaceFromNameBT601EBULIMIT
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_CreateColorSpaceFromNameBT601EBULIMIT_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_CreateColorSpaceFromNameBT601EBULIMIT_1100 start====");
          let result: number = libGraphics2DApi20.OHCreateColorSpaceFromNameBT601EBULIMIT();
          console.info("====> SUB_OH_CreateColorSpaceFromNameBT601EBULIMIT_1100 result====", result);
          expect(result).assertEqual(BT601_EBU_LIMIT);
          done();
        } catch (err) {
          console.error("====> SUB_OH_CreateColorSpaceFromNameBT601EBULIMIT_1100 catch err: " + err);
          done();
        }
    })

    /**
     * @tc.number  : SUB_OH_CreateColorSpaceFromNameBT601SMPTECLIMIT_1200
     * @tc.name    : SUB_OH_CreateColorSpaceFromNameBT601SMPTECLIMIT_1200
     * @tc.desc    : Test OHCreateColorSpaceFromNameBT601SMPTECLIMIT
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_CreateColorSpaceFromNameBT601SMPTECLIMIT_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_CreateColorSpaceFromNameBT601SMPTECLIMIT_1200 start====");
          let result: number = libGraphics2DApi20.OHCreateColorSpaceFromNameBT601SMPTECLIMIT();
          console.info("====> SUB_OH_CreateColorSpaceFromNameBT601SMPTECLIMIT_1200 result====", result);
          expect(result).assertEqual(BT601_SMPTE_C_LIMIT);
          done();
        } catch (err) {
          console.error("====> SUB_OH_CreateColorSpaceFromNameBT601SMPTECLIMIT_1200 catch err: " + err);
          done();
        }
    })

    /**
     * @tc.number  : SUB_OH_CreateColorSpaceFromNameBT2020HLGLIMIT_1300
     * @tc.name    : SUB_OH_CreateColorSpaceFromNameBT2020HLGLIMIT_1300
     * @tc.desc    : Test OHCreateColorSpaceFromNameBT2020HLGLIMIT
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_CreateColorSpaceFromNameBT2020HLGLIMIT_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_CreateColorSpaceFromNameBT2020HLGLIMIT_1300 start====");
          let result: number = libGraphics2DApi20.OHCreateColorSpaceFromNameBT2020HLGLIMIT();
          console.info("====> SUB_OH_CreateColorSpaceFromNameBT2020HLGLIMIT_1300 result====", result);
          expect(result).assertEqual(BT2020_HLG_LIMIT);
          done();
        } catch (err) {
          console.error("====> SUB_OH_CreateColorSpaceFromNameBT2020HLGLIMIT_1300 catch err: " + err);
          done();
        }
    })

    /**
     * @tc.number  : SUB_OH_CreateColorSpaceFromNameBT2020PQLIMIT_1400
     * @tc.name    : SUB_OH_CreateColorSpaceFromNameBT2020PQLIMIT_1400
     * @tc.desc    : Test OHCreateColorSpaceFromNameBT2020PQLIMIT
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_CreateColorSpaceFromNameBT2020PQLIMIT_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_CreateColorSpaceFromNameBT2020PQLIMIT_1400 start====");
          let result: number = libGraphics2DApi20.OHCreateColorSpaceFromNameBT2020PQLIMIT();
          console.info("====> SUB_OH_CreateColorSpaceFromNameBT2020PQLIMIT_1400 result====", result);
          expect(result).assertEqual(BT2020_PQ_LIMIT);
          done();
        } catch (err) {
          console.error("====> SUB_OH_CreateColorSpaceFromNameBT2020PQLIMIT_1400 catch err: " + err);
          done();
        }
    })

    /**
     * @tc.number  : SUB_OH_CreateColorSpaceFromNameP3HLGLIMIT_1500
     * @tc.name    : SUB_OH_CreateColorSpaceFromNameP3HLGLIMIT_1500
     * @tc.desc    : Test OHCreateColorSpaceFromNameP3HLGLIMIT
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_CreateColorSpaceFromNameP3HLGLIMIT_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_CreateColorSpaceFromNameP3HLGLIMIT_1500 start====");
          let result: number = libGraphics2DApi20.OHCreateColorSpaceFromNameP3HLGLIMIT();
          console.info("====> SUB_OH_CreateColorSpaceFromNameP3HLGLIMIT_1500 result====", result);
          expect(result).assertEqual(P3_HLG_LIMIT);
          done();
        } catch (err) {
          console.error("====> SUB_OH_CreateColorSpaceFromNameP3HLGLIMIT_1500 catch err: " + err);
          done();
        }
    })

    /**
     * @tc.number  : SUB_OH_CreateColorSpaceFromNameP3PQLIMIT_1600
     * @tc.name    : SUB_OH_CreateColorSpaceFromNameP3PQLIMIT_1600
     * @tc.desc    : Test OHCreateColorSpaceFromNameP3PQLIMIT
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_CreateColorSpaceFromNameP3PQLIMIT_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_CreateColorSpaceFromNameP3PQLIMIT_1600 start====");
          let result: number = libGraphics2DApi20.OHCreateColorSpaceFromNameP3PQLIMIT();
          console.info("====> SUB_OH_CreateColorSpaceFromNameP3PQLIMIT_1600 result====", result);
          expect(result).assertEqual(P3_PQ_LIMIT);
          done();
        } catch (err) {
          console.error("====> SUB_OH_CreateColorSpaceFromNameP3PQLIMIT_1600 catch err: " + err);
          done();
        }
    })

    /**
     * @tc.number  : SUB_OH_CreateColorSpaceFromNameLINEARP3_1700
     * @tc.name    : SUB_OH_CreateColorSpaceFromNameLINEARP3_1700
     * @tc.desc    : Test OHCreateColorSpaceFromNameLINEARP3
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_CreateColorSpaceFromNameLINEARP3_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_CreateColorSpaceFromNameLINEARP3_1700 start====");
          let result: number = libGraphics2DApi20.OHCreateColorSpaceFromNameLINEARP3();
          console.info("====> SUB_OH_CreateColorSpaceFromNameLINEARP3_1700 result====", result);
          expect(result).assertEqual(LINEAR_P3);
          done();
        } catch (err) {
          console.error("====> SUB_OH_CreateColorSpaceFromNameLINEARP3_1700 catch err: " + err);
          done();
        }
    })

    /**
     * @tc.number  : SUB_OH_CreateColorSpaceFromNameLINEARSRGB_1800
     * @tc.name    : SUB_OH_CreateColorSpaceFromNameLINEARSRGB_1800
     * @tc.desc    : Test OHCreateColorSpaceFromNameLINEARSRGB
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_CreateColorSpaceFromNameLINEARSRGB_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_CreateColorSpaceFromNameLINEARSRGB_1800 start====");
          let result: number = libGraphics2DApi20.OHCreateColorSpaceFromNameLINEARSRGB();
          console.info("====> SUB_OH_CreateColorSpaceFromNameLINEARSRGB_1800 result====", result);
          expect(result).assertEqual(LINEAR_SRGB);
          done();
        } catch (err) {
          console.error("====> SUB_OH_CreateColorSpaceFromNameLINEARSRGB_1800 catch err: " + err);
          done();
        }
    })

    /**
     * @tc.number  : SUB_OH_CreateColorSpaceFromNameLINEARBT709_1900
     * @tc.name    : SUB_OH_CreateColorSpaceFromNameLINEARBT709_1900
     * @tc.desc    : Test OHCreateColorSpaceFromNameLINEARBT709
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_CreateColorSpaceFromNameLINEARBT709_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_CreateColorSpaceFromNameLINEARBT709_1900 start====");
          let result: number = libGraphics2DApi20.OHCreateColorSpaceFromNameLINEARBT709();
          console.info("====> SUB_OH_CreateColorSpaceFromNameLINEARBT709_1900 result====", result);
          expect(result).assertEqual(LINEAR_BT709);
          done();
        } catch (err) {
          console.error("====> SUB_OH_CreateColorSpaceFromNameLINEARBT709_1900 catch err: " + err);
          done();
        }
    })

    /**
     * @tc.number  : SUB_OH_OHCreateColorSpaceFromNameLINEARBT2020_2000
     * @tc.name    : SUB_OH_OHCreateColorSpaceFromNameLINEARBT2020_2000
     * @tc.desc    : Test OHCreateColorSpaceFromNameLINEARBT2020
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_OHCreateColorSpaceFromNameLINEARBT2020_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_OHCreateColorSpaceFromNameLINEARBT2020_2000 start====");
          let result: number = libGraphics2DApi20.OHCreateColorSpaceFromNameLINEARBT2020();
          console.info("====> SUB_OH_OHCreateColorSpaceFromNameLINEARBT2020_2000 result====", result);
          expect(result).assertEqual(LINEAR_BT2020);
          done();
        } catch (err) {
          console.error("====> SUB_OH_OHCreateColorSpaceFromNameLINEARBT2020_2000 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_CreateColorSpaceFromNameDCIP3_2100
     * @tc.name    : SUB_OH_CreateColorSpaceFromNameDCIP3_2100
     * @tc.desc    : Test OHCreateColorSpaceFromNameDCIP3
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_CreateColorSpaceFromNameDCIP3_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_CreateColorSpaceFromNameDCIP3_2100 start====");
          let result: number = libGraphics2DApi20.OHCreateColorSpaceFromNameDCIP3();
          console.info("====> SUB_OH_CreateColorSpaceFromNameDCIP3_2100 result====", result);
          expect(result).assertEqual(DCI_P3);
          done();
        } catch (err) {
          console.error("====> SUB_OH_CreateColorSpaceFromNameDCIP3_2100 catch err: " + err);
          done();
        }
    })

    /**
     * @tc.number  : SUB_OH_CreateColorSpaceFromNameDISPLAYP3_2200
     * @tc.name    : SUB_OH_CreateColorSpaceFromNameDISPLAYP3_2200
     * @tc.desc    : Test OHCreateColorSpaceFromNameDISPLAYP3
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_CreateColorSpaceFromNameDISPLAYP3_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_CreateColorSpaceFromNameDISPLAYP3_2200 start====");
          let result: number = libGraphics2DApi20.OHCreateColorSpaceFromNameDISPLAYP3();
          console.info("====> SUB_OH_CreateColorSpaceFromNameDISPLAYP3_2200 result====", result);
          expect(result).assertEqual(DISPLAY_P3);
          done();
        } catch (err) {
          console.error("====> SUB_OH_CreateColorSpaceFromNameDISPLAYP3_2200 catch err: " + err);
          done();
        }
    })

    /**
     * @tc.number  : SUB_OH_CreateColorSpaceFromNameBT709_2300
     * @tc.name    : SUB_OH_CreateColorSpaceFromNameBT709_2300
     * @tc.desc    : Test OHCreateColorSpaceFromNameBT709
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_CreateColorSpaceFromNameBT709_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_CreateColorSpaceFromNameBT709_2300 start====");
          let result: number = libGraphics2DApi20.OHCreateColorSpaceFromNameBT709();
          console.info("====> SUB_OH_CreateColorSpaceFromNameBT709_2300 result====", result);
          expect(result).assertEqual(BT709);
          done();
        } catch (err) {
          console.error("====> SUB_OH_CreateColorSpaceFromNameBT709_2300 catch err: " + err);
          done();
        }
    })

    /**
     * @tc.number  : SUB_OH_CreateColorSpaceFromNameDISPLAYSRGB_2400
     * @tc.name    : SUB_OH_CreateColorSpaceFromNameDISPLAYSRGB_2400
     * @tc.desc    : Test OHCreateColorSpaceFromNameDISPLAYSRGB
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_CreateColorSpaceFromNameDISPLAYSRGB_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_CreateColorSpaceFromNameDISPLAYSRGB_2400 start====");
          let result: number = libGraphics2DApi20.OHCreateColorSpaceFromNameDISPLAYSRGB();
          console.info("====> SUB_OH_CreateColorSpaceFromNameDISPLAYSRGB_2400 result====", result);
          expect(result).assertEqual(SRGB);
          done();
        } catch (err) {
          console.error("====> SUB_OH_CreateColorSpaceFromNameDISPLAYSRGB_2400 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_CreateColorSpaceFromNameDISPLAYP3SRGB_2500
     * @tc.name    : SUB_OH_CreateColorSpaceFromNameDISPLAYP3SRGB_2500
     * @tc.desc    : Test OHCreateColorSpaceFromNameDISPLAYP3SRGB
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_CreateColorSpaceFromNameDISPLAYP3SRGB_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_CreateColorSpaceFromNameDISPLAYP3SRGB_2500 start====");
          let result: number = libGraphics2DApi20.OHCreateColorSpaceFromNameDISPLAYP3SRGB();
          console.info("====> SUB_OH_CreateColorSpaceFromNameDISPLAYP3SRGB_2500 result====", result);
          expect(result).assertEqual(DISPLAY_P3);
          done();
        } catch (err) {
          console.error("====> SUB_OH_CreateColorSpaceFromNameDISPLAYP3SRGB_2500 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_CreateColorSpaceFromNameDISPLAYP3HLG_2600
     * @tc.name    : SUB_OH_CreateColorSpaceFromNameDISPLAYP3HLG_2600
     * @tc.desc    : Test OHCreateColorSpaceFromNameDISPLAYP3HLG
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_CreateColorSpaceFromNameDISPLAYP3HLG_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_CreateColorSpaceFromNameDISPLAYP3HLG_2600 start====");
          let result: number = libGraphics2DApi20.OHCreateColorSpaceFromNameDISPLAYP3HLG();
          console.info("====> SUB_OH_CreateColorSpaceFromNameDISPLAYP3HLG_2600 result====", result);
          expect(result).assertEqual(P3_HLG);
          done();
        } catch (err) {
          console.error("====> SUB_OH_CreateColorSpaceFromNameDISPLAYP3HLG_2600 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_CreateColorSpaceFromNameDISPLAYP3PQ_2700
     * @tc.name    : SUB_OH_CreateColorSpaceFromNameDISPLAYP3PQ_2700
     * @tc.desc    : Test OHCreateColorSpaceFromNameDISPLAYP3PQ
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_CreateColorSpaceFromNameDISPLAYP3PQ_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_CreateColorSpaceFromNameDISPLAYP3PQ_2700 start====");
          let result: number = libGraphics2DApi20.OHCreateColorSpaceFromNameDISPLAYP3PQ();
          console.info("====> SUB_OH_CreateColorSpaceFromNameDISPLAYP3PQ_2700 result====", result);
          expect(result).assertEqual(P3_PQ);
          done();
        } catch (err) {
          console.error("====> SUB_OH_CreateColorSpaceFromNameDISPLAYP3PQ_2700 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_CreateColorSpaceFromNameCUSTOM_2800
     * @tc.name    : SUB_OH_CreateColorSpaceFromNameCUSTOM_2800
     * @tc.desc    : Test OHCreateColorSpaceFromNameCUSTOM
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_CreateColorSpaceFromNameCUSTOM_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_CreateColorSpaceFromNameCUSTOM_2800 start====");
          let result: number = libGraphics2DApi20.OHCreateColorSpaceFromNameCUSTOM();
          console.info("====> SUB_OH_CreateColorSpaceFromNameCUSTOM_2800 result====", result);
          expect(result).assertEqual(CUSTOM);
          done();
        } catch (err) {
          console.error("====> SUB_OH_CreateColorSpaceFromNameCUSTOM_2800 catch err: " + err);
          done();
        }
      })
  })
}