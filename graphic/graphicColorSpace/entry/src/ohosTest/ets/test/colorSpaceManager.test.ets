/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';
import common from '@ohos.app.ability.common';
import ohosWindow from '@ohos.window';


export default function colorSpaceManagerTest(context: common.UIAbilityContext, windowStage: ohosWindow.WindowStage, abilityStorage: LocalStorage) {
  describe('colorSpaceManagerTest', () => {
    console.info('describe colorSpaceManagerTest start!!!');
    beforeAll(() => {
      console.info('before all');
    })
    beforeEach(() => {
      console.info('before each');
    })
    afterEach(async (done: Function) => {
      console.info('afterEach');
      done();
    })
    afterAll(() => {
      console.info('afterAll');
    })

    /**
     * @tc.number SUB_GRAPHIC_ENUMCOLORSPACE_JSAPI_001
     * @tc.name Test enumcolorspace_Test_001
     * @tc.desc test the value of enum color space
     */
    it('SUB_GRAPHIC_ENUMCOLORSPACE_JSAPI_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.info('test the enum value of ColorSpace Manager begin');
      try {
        expect(0).assertEqual(colorSpaceManager.ColorSpace.UNKNOWN);
        expect(1).assertEqual(colorSpaceManager.ColorSpace.ADOBE_RGB_1998);
        expect(2).assertEqual(colorSpaceManager.ColorSpace.DCI_P3);
        expect(3).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3);
        expect(4).assertEqual(colorSpaceManager.ColorSpace.SRGB);
        expect(5).assertEqual(colorSpaceManager.ColorSpace.CUSTOM);
        expect(6).assertEqual(colorSpaceManager.ColorSpace.BT709);
        expect(7).assertEqual(colorSpaceManager.ColorSpace.BT601_EBU);
        expect(8).assertEqual(colorSpaceManager.ColorSpace.BT601_SMPTE_C);
        expect(9).assertEqual(colorSpaceManager.ColorSpace.BT2020_HLG);
        expect(10).assertEqual(colorSpaceManager.ColorSpace.BT2020_PQ);
        expect(11).assertEqual(colorSpaceManager.ColorSpace.P3_HLG);
        expect(12).assertEqual(colorSpaceManager.ColorSpace.P3_PQ);
        expect(13).assertEqual(colorSpaceManager.ColorSpace.ADOBE_RGB_1998_LIMIT);
        expect(14).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3_LIMIT);
        expect(15).assertEqual(colorSpaceManager.ColorSpace.SRGB_LIMIT);
        expect(16).assertEqual(colorSpaceManager.ColorSpace.BT709_LIMIT);
        expect(17).assertEqual(colorSpaceManager.ColorSpace.BT601_EBU_LIMIT);
        expect(18).assertEqual(colorSpaceManager.ColorSpace.BT601_SMPTE_C_LIMIT);
        expect(19).assertEqual(colorSpaceManager.ColorSpace.BT2020_HLG_LIMIT);
        expect(20).assertEqual(colorSpaceManager.ColorSpace.BT2020_PQ_LIMIT);
        expect(21).assertEqual(colorSpaceManager.ColorSpace.P3_HLG_LIMIT);
        expect(22).assertEqual(colorSpaceManager.ColorSpace.P3_PQ_LIMIT);
        expect(23).assertEqual(colorSpaceManager.ColorSpace.LINEAR_P3);
        expect(24).assertEqual(colorSpaceManager.ColorSpace.LINEAR_SRGB);
        expect(25).assertEqual(colorSpaceManager.ColorSpace.LINEAR_BT2020);
        expect(24).assertEqual(colorSpaceManager.ColorSpace.LINEAR_BT709);
        expect(4).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_SRGB);
        expect(3).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3_SRGB);
        expect(11).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3_HLG);
        expect(12).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3_PQ);
        done();
      } catch (err) {
        console.info('test enum value of ColorSpace Manager error ' + JSON.stringify(err));
        expect.assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_GRAPHIC_CREATE_JSAPI_002
     * @tc.name Test createcolorspacemanager_Test_002
     * @tc.desc test the interface of create
     */
    it('SUB_GRAPHIC_CREATE_JSAPI_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('test createcolorspacemanager begin');
      try {
        let csManager = colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998);
        expect(csManager != null).assertTrue();
        let colorSpaceName = csManager.getColorSpaceName();
        console.info("the name is " + colorSpaceName);
        expect(colorSpaceName).assertEqual(colorSpaceManager.ColorSpace.ADOBE_RGB_1998);
        done();
      } catch (err) {
        console.log('test enum value of ColorSpace Manager error ' + JSON.stringify(err));
        expect.assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_GRAPHIC_CREATE_JSAPI_003
     * @tc.name Test createcolorspacemanager_Test_003
     * @tc.desc test the interface of create
     */
    it('SUB_GRAPHIC_CREATE_JSAPI_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('test createcolorspacemanager begin');
      try {
        let csManager = colorSpaceManager.create(colorSpaceManager.ColorSpace.UNKNOWN);
        expect(csManager != null).assertTrue();
        let colorSpaceName = csManager.getColorSpaceName();
        console.info("the name is " + colorSpaceName);
        expect(colorSpaceName).assertEqual(colorSpaceManager.ColorSpace.UNKNOWN);
        done();
      } catch (err) {
        console.log('test enum value of ColorSpace Manager not support error ' + JSON.stringify(err));
        expect(err.code).assertEqual(18600001);
        done();
      }
    })

    /**
     * @tc.number SUB_GRAPHIC_CREATE_JSAPI_004
     * @tc.name Test createcolorspacemanager_Test_004
     * @tc.desc test the interface of create
     */
    it('SUB_GRAPHIC_CREATE_JSAPI_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('test createcolorspacemanager begin');
      try {
        let csManager = colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3);
        expect(csManager != null).assertTrue();
        let colorSpaceName = csManager.getColorSpaceName();
        console.info("the name is " + colorSpaceName);
        expect(colorSpaceName).assertEqual(colorSpaceManager.ColorSpace.DCI_P3);
        done();
      } catch (err) {
        console.log('test enum value of ColorSpace Manager error ' + JSON.stringify(err));
        expect.assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_GRAPHIC_CREATE_JSAPI_005
     * @tc.name Test createcolorspacemanager_Test_005
     * @tc.desc test the interface of create
     */
    it('SUB_GRAPHIC_CREATE_JSAPI_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('test createcolorspacemanager begin');
      try {
        let csManager = colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3);
        expect(csManager != null).assertTrue();
        let colorSpaceName = csManager.getColorSpaceName();
        console.info("the name is " + colorSpaceName);
        expect(colorSpaceName).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3);
        done();
      } catch (err) {
        console.log('test enum value of ColorSpace Manager error ' + JSON.stringify(err));
        expect.assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_GRAPHIC_CREATE_JSAPI_006
     * @tc.name Test createcolorspacemanager_Test_006
     * @tc.desc test the interface of create
     */
    it('SUB_GRAPHIC_CREATE_JSAPI_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('test createcolorspacemanager begin');
      try {
        let csManager = colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB);
        expect(csManager != null).assertTrue();
        let colorSpaceName = csManager.getColorSpaceName();
        console.info("the name is " + colorSpaceName);
        expect(colorSpaceName).assertEqual(colorSpaceManager.ColorSpace.SRGB);
        done();
      } catch (err) {
        console.log('test enum value of ColorSpace Manager error ' + JSON.stringify(err));
        expect.assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_GRAPHIC_CREATE_JSAPI_007
     * @tc.name Test createcolorspacemanager_Test_007
     * @tc.desc test the interface of create colorSpaceManager.ColorSpace.CUSTOM invalid
     */
    it('SUB_GRAPHIC_CREATE_JSAPI_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('test createcolorspacemanager begin');
      try {
        let csManager = colorSpaceManager.create(colorSpaceManager.ColorSpace.CUSTOM);
        expect(csManager != null).assertTrue();
        let colorSpaceName = csManager.getColorSpaceName();
        console.info("the name is " + colorSpaceName);
        expect(colorSpaceName).assertEqual(colorSpaceManager.ColorSpace.UNKNOWN);
        done();
      } catch (err) {
        console.log('test enum value of ColorSpace Manager not support error ' + JSON.stringify(err));
        expect(err.code == 18600001).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_GRAPHIC_CREATE_JSAPI_008
     * @tc.name Test createcolorspacemanager_Test_008
     * @tc.desc test the interface of create
     */
    it('SUB_GRAPHIC_CREATE_JSAPI_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('test createcolorspacemanager08 begin');
      try {
        let primaries: colorSpaceManager.ColorSpacePrimaries = {
          redX: 0.64,
          redY: 0.33,
          greenX: 0.3,
          greenY: 0.6,
          blueX: 0.15,
          blueY: 0.06,
          whitePointX: 0.3127,
          whitePointY: 0.3290
        };
        let gamma = 2.875;
        let colorSpaceMgr = colorSpaceManager.create(primaries, gamma);
        expect(colorSpaceMgr != null).assertTrue();
        let colorSpaceName = colorSpaceMgr.getColorSpaceName();
        expect(colorSpaceName).assertEqual(colorSpaceManager.ColorSpace.CUSTOM);
        let ga = colorSpaceMgr.getGamma();
        let gap = ga - gamma;
        let wp: number[] = colorSpaceMgr.getWhitePoint();
        expect(gap == 0).assertTrue();
        expect(Math.abs(primaries.whitePointX - wp[0]) <= 0.00001).assertTrue();
        expect(Math.abs(primaries.whitePointY - wp[1]) <= 0.00001).assertTrue();
        done();
      } catch (err) {
        console.log('test enum value of ColorSpace Manager error ' + JSON.stringify(err));
        expect.assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_GRAPHIC_CREATE_JSAPI_009
     * @tc.name Test createcolorspacemanager_Test_009
     * @tc.desc test the interface of create
     */
    it('SUB_GRAPHIC_CREATE_JSAPI_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('test createcolorspacemanager begin');
      try {
        expect(26).assertEqual(colorSpaceManager.ColorSpace.H_LOG);
        let colorSpace = colorSpaceManager.create(colorSpaceManager.ColorSpace.H_LOG);
        expect(colorSpace != null).assertTrue();
        let colorSpaceName = colorSpace.getColorSpaceName();
        console.info("the name is " + colorSpaceName);
        expect(colorSpaceName).assertEqual(colorSpaceManager.ColorSpace.H_LOG);
        done();
      } catch (err) {
        console.log('test enum value of ColorSpace Manager error ' + JSON.stringify(err));
        expect.assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_GRAPHIC_CREATE_JSAPI_010
     * @tc.name Test createcolorspacemanager_Test_010
     * @tc.desc test the interface of create
     */
    it('SUB_GRAPHIC_CREATE_JSAPI_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('test createcolorspacemanager begin');
      try {
        let colorSpace = colorSpaceManager.create(null);
        expect().assertFail();
        done();
      } catch (err) {
        console.log('test enum value of ColorSpace Manager error ' + JSON.stringify(err));
        expect(401).assertEqual(err.code);
        done();
      }
    })

    /**
     * @tc.number    : testColorSpace_create001
     * @tc.name      : testColorSpace_create001
     * @tc.desc      : test ColorSpaceManager ErrorCode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testColorSpace_create001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let colorSpace: colorSpaceManager.ColorSpaceManager;
      try {
        let primaries: colorSpaceManager.ColorSpacePrimaries = {
          redX: 0.1,
          redY: 0.1,
          greenX: 0.2,
          greenY: 0.2,
          blueX: 0.3,
          blueY: 0.3,
          whitePointX: 0.4,
          whitePointY: 0.4
        };
        let gamma = 2.2;
        try {
          colorSpace = colorSpaceManager.create(primaries, null);
          expect().assertFail();
          done();
        } catch(err){
          expect(Number(err.code) == 401).assertTrue();
          done();
        }
      } catch (err) {
        console.log('test enum value of ColorSpace Manager error ' + JSON.stringify(err));
        expect.assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_GRAPHIC_CREATE_JSAPI_011
     * @tc.name: SUB_GRAPHIC_CREATE_JSAPI_011
     * @tc.desc: the DISPLAY_BT2020_SRGB
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_GRAPHIC_CREATE_JSAPI_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('test createcolorspacemanager begin');
      try {
        expect(27).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_BT2020_SRGB);
        let colorSpace = colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_BT2020_SRGB);
        expect(colorSpace != null).assertTrue();
        let colorSpaceName = colorSpace.getColorSpaceName();
        console.info("the name is " + colorSpaceName);
        expect(colorSpaceName).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_BT2020_SRGB);
        done();
      } catch (err) {
        console.log('test enum value of ColorSpace Manager error ' + JSON.stringify(err));
        expect.assertFail();
        done();
      }
    })

    /**
     * @tc.number     getColorSpaceEnum_0100
     * @tc.name       getColorSpaceEnum_0100
     * @tc.desc       the get colorSpace Enum
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('getColorSpaceEnum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('test getColorSpaceEnum_0100 begin');
      try {
        let colorSpace1 = colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998);
        let colorSpaceName1 = colorSpace1.getColorSpaceName();
        expect(colorSpaceName1).assertEqual(colorSpaceManager.ColorSpace.ADOBE_RGB_1998);
        let colorSpace2 = colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3);
        let colorSpaceName2 = colorSpace2.getColorSpaceName();
        expect(colorSpaceName2).assertEqual(colorSpaceManager.ColorSpace.DCI_P3);
        let colorSpace3 = colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3);
        let colorSpaceName3 = colorSpace3.getColorSpaceName();
        expect(colorSpaceName3).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3);
        let colorSpace4 = colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB);
        let colorSpaceName4 = colorSpace4.getColorSpaceName();
        expect(colorSpaceName4).assertEqual(colorSpaceManager.ColorSpace.SRGB);
        let colorSpace5 = colorSpaceManager.create(colorSpaceManager.ColorSpace.BT709);
        let colorSpaceName5 = colorSpace5.getColorSpaceName();
        expect(colorSpaceName5).assertEqual(colorSpaceManager.ColorSpace.BT709);
        let colorSpace6 = colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_EBU);
        let colorSpaceName6 = colorSpace6.getColorSpaceName();
        expect(colorSpaceName6).assertEqual(colorSpaceManager.ColorSpace.BT601_EBU);
        let colorSpace7 = colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C);
        let colorSpaceName7 = colorSpace7.getColorSpaceName();
        expect(colorSpaceName7).assertEqual(colorSpaceManager.ColorSpace.BT601_SMPTE_C);
        let colorSpace8 = colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_HLG);
        let colorSpaceName8 = colorSpace8.getColorSpaceName();
        expect(colorSpaceName8).assertEqual(colorSpaceManager.ColorSpace.BT2020_HLG);
        let colorSpace9 = colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_PQ);
        let colorSpaceName9 = colorSpace9.getColorSpaceName();
        expect(colorSpaceName9).assertEqual(colorSpaceManager.ColorSpace.BT2020_PQ);
        let colorSpace10 = colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_HLG);
        let colorSpaceName10 = colorSpace10.getColorSpaceName();
        expect(colorSpaceName10).assertEqual(colorSpaceManager.ColorSpace.P3_HLG);
        done();
      } catch (err) {
        console.log('test enum value of ColorSpace Manager error ' + JSON.stringify(err));
        expect.assertFail();
        done();
      }
    })

    /**
     * @tc.number     getColorSpaceEnum_0200
     * @tc.name       getColorSpaceEnum_0200
     * @tc.desc       the get colorSpace Enum
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('getColorSpaceEnum_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('test getColorSpaceEnum_0200 begin');
      try {
        let colorSpace1 = colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_PQ);
        let colorSpaceName1 = colorSpace1.getColorSpaceName();
        expect(colorSpaceName1).assertEqual(colorSpaceManager.ColorSpace.P3_PQ);
        let colorSpace2 = colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998_LIMIT);
        let colorSpaceName2 = colorSpace2.getColorSpaceName();
        expect(colorSpaceName2).assertEqual(colorSpaceManager.ColorSpace.ADOBE_RGB_1998_LIMIT);
        let colorSpace3 = colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_LIMIT);
        let colorSpaceName3 = colorSpace3.getColorSpaceName();
        expect(colorSpaceName3).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3_LIMIT);
        let colorSpace4 = colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB_LIMIT);
        let colorSpaceName4 = colorSpace4.getColorSpaceName();
        expect(colorSpaceName4).assertEqual(colorSpaceManager.ColorSpace.SRGB_LIMIT);
        let colorSpace5 = colorSpaceManager.create(colorSpaceManager.ColorSpace.BT709_LIMIT);
        let colorSpaceName5 = colorSpace5.getColorSpaceName();
        expect(colorSpaceName5).assertEqual(colorSpaceManager.ColorSpace.BT709_LIMIT);
        let colorSpace6 = colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_EBU_LIMIT);
        let colorSpaceName6 = colorSpace6.getColorSpaceName();
        expect(colorSpaceName6).assertEqual(colorSpaceManager.ColorSpace.BT601_EBU_LIMIT);
        let colorSpace7 = colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C_LIMIT);
        let colorSpaceName7 = colorSpace7.getColorSpaceName();
        expect(colorSpaceName7).assertEqual(colorSpaceManager.ColorSpace.BT601_SMPTE_C_LIMIT);
        let colorSpace8 = colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_HLG_LIMIT);
        let colorSpaceName8 = colorSpace8.getColorSpaceName();
        expect(colorSpaceName8).assertEqual(colorSpaceManager.ColorSpace.BT2020_HLG_LIMIT);
        let colorSpace9 = colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_PQ_LIMIT);
        let colorSpaceName9 = colorSpace9.getColorSpaceName();
        expect(colorSpaceName9).assertEqual(colorSpaceManager.ColorSpace.BT2020_PQ_LIMIT);
        let colorSpace10 = colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_HLG_LIMIT);
        let colorSpaceName10 = colorSpace10.getColorSpaceName();
        expect(colorSpaceName10).assertEqual(colorSpaceManager.ColorSpace.P3_HLG_LIMIT);
        done();
      } catch (err) {
        console.log('test enum value of ColorSpace Manager error ' + JSON.stringify(err));
        expect.assertFail();
        done();
      }
    })

    /**
     * @tc.number     getColorSpaceEnum_0300
     * @tc.name       getColorSpaceEnum_0300
     * @tc.desc       the get colorSpace Enum
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('getColorSpaceEnum_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('test getColorSpaceEnum_0300 begin');
      try {
        let colorSpace1 = colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_PQ_LIMIT);
        let colorSpaceName1 = colorSpace1.getColorSpaceName();
        expect(colorSpaceName1).assertEqual(colorSpaceManager.ColorSpace.P3_PQ_LIMIT);
        let colorSpace2 = colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_P3);
        let colorSpaceName2 = colorSpace2.getColorSpaceName();
        expect(colorSpaceName2).assertEqual(colorSpaceManager.ColorSpace.LINEAR_P3);
        let colorSpace3 = colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_SRGB);
        let colorSpaceName3 = colorSpace3.getColorSpaceName();
        expect(colorSpaceName3).assertEqual(colorSpaceManager.ColorSpace.LINEAR_SRGB);
        let colorSpace4 = colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_BT709);
        let colorSpaceName4 = colorSpace4.getColorSpaceName();
        expect(colorSpaceName4).assertEqual(colorSpaceManager.ColorSpace.LINEAR_BT709);
        let colorSpace5 = colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_BT2020);
        let colorSpaceName5 = colorSpace5.getColorSpaceName();
        expect(colorSpaceName5).assertEqual(colorSpaceManager.ColorSpace.LINEAR_BT2020);
        let colorSpace6 = colorSpaceManager.create(colorSpaceManager.ColorSpace.H_LOG);
        let colorSpaceName6 = colorSpace6.getColorSpaceName();
        expect(colorSpaceName6).assertEqual(colorSpaceManager.ColorSpace.H_LOG);
        let colorSpace7 = colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_BT2020_SRGB);
        let colorSpaceName7 = colorSpace7.getColorSpaceName();
        expect(colorSpaceName7).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_BT2020_SRGB);
        let colorSpace8 = colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_SRGB);
        let colorSpaceName8 = colorSpace8.getColorSpaceName();
        expect(colorSpaceName8).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_SRGB);
        let colorSpace9 = colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_SRGB);
        let colorSpaceName9 = colorSpace9.getColorSpaceName();
        expect(colorSpaceName9).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3_SRGB);
        let colorSpace10 = colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_HLG);
        let colorSpaceName10 = colorSpace10.getColorSpaceName();
        expect(colorSpaceName10).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3_HLG);
        let colorSpace11 = colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_PQ);
        let colorSpaceName11 = colorSpace11.getColorSpaceName();
        expect(colorSpaceName11).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3_PQ);
        done();
      } catch (err) {
        console.log('test enum value of ColorSpace Manager error ' + JSON.stringify(err));
        expect.assertFail();
        done();
      }
    })

    /**
     * @tc.number     testGetWhitePoint_0100
     * @tc.name       testGetWhitePoint_0100
     * @tc.desc       test getWhitePoint
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testGetWhitePoint_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('test getColorSpaceEnum_0300 begin');
      try {
        let colorSpace = colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998);
        let point = colorSpace.getWhitePoint();
        expect(point.length > 0).assertTrue();
        expect(point[0] > 0).assertTrue();
        expect(point[1] > 0).assertTrue();
        done();
      } catch (err) {
        console.log('test enum value of ColorSpace Manager error ' + JSON.stringify(err));
        expect.assertFail();
        done();
      }
    })

  })
}