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
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext: common.UIAbilityContext;

export default function colorSpaceManagerTest() {

  describe("colorSpaceManagerTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(() => {
    })

    /**
     * @tc.name   SUB_GRAPHIC_COLOR_SPACE_API_static_001
     * @tc.number SUB_GRAPHIC_COLOR_SPACE_API_static_001
     * @tc.desc   color space API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GRAPHIC_COLOR_SPACE_API_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('test the enum value of ColorSpace Manager begin');
        try {
          expect('0').assertEqual(colorSpaceManager.ColorSpace.UNKNOWN + '');
          expect('1').assertEqual(colorSpaceManager.ColorSpace.ADOBE_RGB_1998 + '');
          expect('2').assertEqual(colorSpaceManager.ColorSpace.DCI_P3 + '');
          expect('3').assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3 + '');
          expect('4').assertEqual(colorSpaceManager.ColorSpace.SRGB + '');
          expect('5').assertEqual(colorSpaceManager.ColorSpace.CUSTOM + '');
          expect('6').assertEqual(colorSpaceManager.ColorSpace.BT709 + '');
          expect('7').assertEqual(colorSpaceManager.ColorSpace.BT601_EBU + '');
          expect('8').assertEqual(colorSpaceManager.ColorSpace.BT601_SMPTE_C + '');
          expect('9').assertEqual(colorSpaceManager.ColorSpace.BT2020_HLG + '');
          expect('10').assertEqual(colorSpaceManager.ColorSpace.BT2020_PQ + '');
          expect('11').assertEqual(colorSpaceManager.ColorSpace.P3_HLG + '');
          expect('12').assertEqual(colorSpaceManager.ColorSpace.P3_PQ + '');
          expect('13').assertEqual(colorSpaceManager.ColorSpace.ADOBE_RGB_1998_LIMIT + '');
          expect('14').assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3_LIMIT + '');
          expect('15').assertEqual(colorSpaceManager.ColorSpace.SRGB_LIMIT + '');
          expect('16').assertEqual(colorSpaceManager.ColorSpace.BT709_LIMIT + '');
          expect('17').assertEqual(colorSpaceManager.ColorSpace.BT601_EBU_LIMIT + '');
          expect('18').assertEqual(colorSpaceManager.ColorSpace.BT601_SMPTE_C_LIMIT + '');
          expect('19').assertEqual(colorSpaceManager.ColorSpace.BT2020_HLG_LIMIT + '');
          expect('20').assertEqual(colorSpaceManager.ColorSpace.BT2020_PQ_LIMIT + '');
          expect('21').assertEqual(colorSpaceManager.ColorSpace.P3_HLG_LIMIT + '');
          expect('22').assertEqual(colorSpaceManager.ColorSpace.P3_PQ_LIMIT + '');
          expect('23').assertEqual(colorSpaceManager.ColorSpace.LINEAR_P3 + '');
          expect('24').assertEqual(colorSpaceManager.ColorSpace.LINEAR_SRGB + '');
          expect('25').assertEqual(colorSpaceManager.ColorSpace.LINEAR_BT2020 + '');
          expect('26').assertEqual(colorSpaceManager.ColorSpace.H_LOG + '');
          expect('24').assertEqual(colorSpaceManager.ColorSpace.LINEAR_BT709 + '');
          expect('4').assertEqual(colorSpaceManager.ColorSpace.DISPLAY_SRGB + '');
          expect('3').assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3_SRGB + '');
          expect('11').assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3_HLG + '');
          expect('12').assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3_PQ + '');
          hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        } catch(err){
          hilog.info(domain, tag, '%{public}s', 'beforeAll end');
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   SUB_GRAPHIC_COLOR_SPACE_API_static_002
     * @tc.number SUB_GRAPHIC_COLOR_SPACE_API_static_002
     * @tc.desc   color space API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GRAPHIC_COLOR_SPACE_API_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
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
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_GRAPHIC_COLOR_SPACE_API_static_003
     * @tc.number SUB_GRAPHIC_COLOR_SPACE_API_static_003
     * @tc.desc   color space API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GRAPHIC_COLOR_SPACE_API_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.info('test createcolorspacemanager begin');
      try {
        let csManager = colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB);
        expect(csManager != null).assertTrue();
        let colorSpaceName = csManager.getColorSpaceName();
        console.info("www data the name is " + colorSpaceName);
        expect(colorSpaceName).assertEqual(colorSpaceManager.ColorSpace.SRGB);
        done();
      } catch (err) {
        console.log('www data test enum value of ColorSpace Manager not support error ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_GRAPHIC_COLOR_SPACE_API_static_004
     * @tc.number SUB_GRAPHIC_COLOR_SPACE_API_static_004
     * @tc.desc   color space API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GRAPHIC_COLOR_SPACE_API_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
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
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_GRAPHIC_COLOR_SPACE_API_static_005
     * @tc.number SUB_GRAPHIC_COLOR_SPACE_API_static_005
     * @tc.desc   color space API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GRAPHIC_COLOR_SPACE_API_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
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
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_GRAPHIC_COLOR_SPACE_API_static_006
     * @tc.number SUB_GRAPHIC_COLOR_SPACE_API_static_006
     * @tc.desc   color space API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GRAPHIC_COLOR_SPACE_API_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
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
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_GRAPHIC_COLOR_SPACE_API_static_007
     * @tc.number SUB_GRAPHIC_COLOR_SPACE_API_static_007
     * @tc.desc   color space API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GRAPHIC_COLOR_SPACE_API_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.info('test createcolorspacemanager begin');
      try {
        let csManager = colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_PQ);
        expect(csManager != null).assertTrue();
        let colorSpaceName = csManager.getColorSpaceName();
        console.info("the name is " + colorSpaceName);
        expect(colorSpaceName).assertEqual(colorSpaceManager.ColorSpace.P3_PQ);
        done();
      } catch (err) {
        console.log('test enum value of ColorSpace Manager not support error ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_GRAPHIC_COLOR_SPACE_API_static_008
     * @tc.number SUB_GRAPHIC_COLOR_SPACE_API_static_008
     * @tc.desc   color space API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GRAPHIC_COLOR_SPACE_API_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
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
        let ga = colorSpaceMgr.getGamma();
        let gap = ga - gamma;
        let wp: number[] = colorSpaceMgr.getWhitePoint();
        console.info('www data wp ' + typeof(colorSpaceMgr.getWhitePoint()));
        expect(gap == 0).assertTrue();
        expect(Math.abs(primaries.whitePointX - wp[0]) <= 0.00001).assertTrue();
        expect(Math.abs(primaries.whitePointY - wp[1]) <= 0.00001).assertTrue();
        done();
      } catch (err) {
        console.log('test enum value of ColorSpace Manager error ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_GRAPHIC_COLOR_SPACE_API_static_009
     * @tc.number SUB_GRAPHIC_COLOR_SPACE_API_static_009
     * @tc.desc   color space API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GRAPHIC_COLOR_SPACE_API_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.info('test createcolorspacemanager begin');
      try {
        expect('4').assertEqual(colorSpaceManager.ColorSpace.DISPLAY_SRGB + '');
        let colorSpace = colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_SRGB);
        expect(colorSpace != null).assertTrue();
        let colorSpaceName = colorSpace.getColorSpaceName();
        console.info("the name is " + colorSpaceName);
        expect(colorSpaceName).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_SRGB);
        done();
      } catch (err) {
        console.log('test enum value of ColorSpace Manager error ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_GRAPHIC_COLOR_SPACE_API_static_010
     * @tc.number SUB_GRAPHIC_COLOR_SPACE_API_static_010
     * @tc.desc   color space API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GRAPHIC_COLOR_SPACE_API_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.info('test createcolorspacemanager begin');
      try {
        let colorSpace = colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_EBU);
        expect(colorSpace != null).assertTrue();
        let colorSpaceName = colorSpace.getColorSpaceName();
        expect(colorSpaceName).assertEqual(colorSpaceManager.ColorSpace.BT601_EBU);
        done();
      } catch (err) {
        console.log('test enum value of ColorSpace Manager error ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_GRAPHIC_COLOR_SPACE_API_static_011
     * @tc.number SUB_GRAPHIC_COLOR_SPACE_API_static_011
     * @tc.desc   color space API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GRAPHIC_COLOR_SPACE_API_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.info('test SUB_GRAPHIC_COLOR_SPACE_API_static_011 begin');
      try {
        let csManager = colorSpaceManager.create(colorSpaceManager.ColorSpace.H_LOG);
        expect(csManager != null).assertTrue();
        let colorSpaceName = csManager.getColorSpaceName();
        console.info("the name is " + colorSpaceName);
        expect(colorSpaceName).assertEqual(colorSpaceManager.ColorSpace.H_LOG);
        done();
      } catch (err) {
        console.log('test enum value of ColorSpace Manager error ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_GRAPHIC_COLOR_SPACE_API_static_012
     * @tc.number SUB_GRAPHIC_COLOR_SPACE_API_static_012
     * @tc.desc   color space API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GRAPHIC_COLOR_SPACE_API_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.info('test SUB_GRAPHIC_COLOR_SPACE_API_static_012 begin');
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
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_GRAPHIC_COLOR_SPACE_API_static_013
     * @tc.number SUB_GRAPHIC_COLOR_SPACE_API_static_013
     * @tc.desc   color space API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GRAPHIC_COLOR_SPACE_API_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.info('test SUB_GRAPHIC_COLOR_SPACE_API_static_013 begin');
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
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_GRAPHIC_COLOR_SPACE_API_static_014
     * @tc.number SUB_GRAPHIC_COLOR_SPACE_API_static_014
     * @tc.desc   color space API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GRAPHIC_COLOR_SPACE_API_static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.info('test SUB_GRAPHIC_COLOR_SPACE_API_static_014 begin');
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
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_GRAPHIC_COLOR_SPACE_API_static_015
     * @tc.number SUB_GRAPHIC_COLOR_SPACE_API_static_015
     * @tc.desc   color space API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GRAPHIC_COLOR_SPACE_API_static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.info('test SUB_GRAPHIC_COLOR_SPACE_API_static_015 begin');
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
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_GRAPHIC_COLOR_SPACE_API_static_016
     * @tc.number SUB_GRAPHIC_COLOR_SPACE_API_static_016
     * @tc.desc   color space API ArkTS1.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GRAPHIC_COLOR_SPACE_API_static_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.info('test SUB_GRAPHIC_COLOR_SPACE_API_static_016 begin');
      try {
        let colorSpace = colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998);
        let point = colorSpace.getWhitePoint();
        expect(point.length > 0).assertTrue();
        expect(point[0] > 0).assertTrue();
        expect(point[1] > 0).assertTrue();
        done();
      } catch (err) {
        console.log('test enum value of ColorSpace Manager error ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

  })
}