/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { colorSpaceManager, sendableColorSpaceManager } from '@kit.ArkGraphics2D';
import { collections } from '@kit.ArkTS';

export default function sendableColorSpaceManagerTest() {
  describe('sendableColorSpaceManagerTest', () => {
    console.log('describe sendableColorSpaceManagerTest start!!!')
    beforeAll(async ()=> {
    })

    /**
     * @tc.name   testSendableColorSpaceManagerCreate_Standard
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICCOLORSPACE_JS_API_0090
     * @tc.desc   Create standard sharable color management.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableColorSpaceManagerCreate_Standard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let msg = "====testSendableColorSpaceManagerCreate_Standard===="
      console.log(msg + ' begin')
      try {
        let colorSpace: sendableColorSpaceManager.ColorSpaceManager;
        colorSpace = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB);
        console.info(msg + 'Succeeded in sendableColorSpaceManager.create.');
        done()        
      } catch (exception) {
        console.error(msg + 'Failed to sendableColorSpaceManager.create. Cause:' + JSON.stringify(exception));
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testSendableColorSpaceManagerCreate_UserDefined
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICCOLORSPACE_JS_API_0100
     * @tc.desc   Creates user-defined sharable color management instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableColorSpaceManagerCreate_UserDefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let msg = "====testSendableColorSpaceManagerCreate_UserDefined===="
      console.log(msg + ' begin')
      try {
        let colorSpace: sendableColorSpaceManager.ColorSpaceManager;
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
        let gamma: number = 2.2;
        colorSpace = sendableColorSpaceManager.create(primaries, gamma);
        console.info(msg + 'Succeeded in sendableColorSpaceManager.create.');
        done()        
      } catch (exception) {
        console.error(msg + 'Failed to sendableColorSpaceManager.create. Cause:' + JSON.stringify(exception));
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testGetColorSpaceName_Standard
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICCOLORSPACE_JS_API_0110
     * @tc.desc   Create standard sharable color management, Obtains the color gamut gamma value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetColorSpaceName_Standard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let msg = "====testGetColorSpaceName_Standard===="
      console.log(msg + ' begin')
      try {
        let colorSpace: sendableColorSpaceManager.ColorSpaceManager;
        colorSpace = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB);
        let spaceName: colorSpaceManager.ColorSpace = colorSpace.getColorSpaceName();
        console.info(msg + 'Succeeded in sendableColorSpaceManager.create.');
        console.info(msg + 'Succeeded in sendableColorSpaceManager.create. spaceName: ' + spaceName );
        console.info(msg + 'Succeeded in sendableColorSpaceManager.create. spaceName: ' + JSON.stringify(spaceName) );
        done()        
      } catch (exception) {
        console.error(msg + 'Failed to sendableColorSpaceManager.create. Cause:' + JSON.stringify(exception));
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testGetWhitePoint_Standard
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICCOLORSPACE_JS_API_0120
     * @tc.desc   Create standard sharable color management, Obtains the color gamut white point value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetWhitePoint_Standard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "====testGetWhitePoint_Standard===="
      console.log(msg + ' begin')
      try {
        let colorSpace: sendableColorSpaceManager.ColorSpaceManager;
        colorSpace = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB);
        let point: collections.Array<number> = colorSpace.getWhitePoint();
        console.info(msg + 'Succeeded in sendableColorSpaceManager.create.');
        console.info(msg + 'Succeeded in sendableColorSpaceManager.create. point: ' + point );
        console.info(msg + 'Succeeded in sendableColorSpaceManager.create. point: ' + JSON.stringify(point) );
        done()        
      } catch (exception) {
        console.error(msg + 'Failed to sendableColorSpaceManager.create. Cause:' + JSON.stringify(exception));
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testGetGamma_Standard
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICCOLORSPACE_JS_API_0130
     * @tc.desc   Create standard sharable color management, Obtains the color gamut type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetGamma_Standard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "====testGetGamma_Standard===="
      console.log(msg + ' begin')
      try {
        let colorSpace: sendableColorSpaceManager.ColorSpaceManager;
        colorSpace = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB);
        let gamma: number = colorSpace.getGamma();
        console.info(msg + 'Succeeded in sendableColorSpaceManager.create.');
        console.info(msg + 'Succeeded in sendableColorSpaceManager.create. gamma: ' + gamma );
        console.info(msg + 'Succeeded in sendableColorSpaceManager.create. gamma: ' + JSON.stringify(gamma) );
        done()        
      } catch (exception) {
        console.error(msg + 'Failed to sendableColorSpaceManager.create. Cause:' + JSON.stringify(exception));
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testGetColorSpaceName_UserDefined
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICCOLORSPACE_JS_API_0140
     * @tc.desc   Creates user-defined sharable color management instances, Obtains the color gamut gamma value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetColorSpaceName_UserDefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let msg = "====testGetColorSpaceName_UserDefined===="
      console.log(msg + ' begin')
      try {
        let colorSpace: sendableColorSpaceManager.ColorSpaceManager;
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
        let gamma: number = 2.2;
        colorSpace = sendableColorSpaceManager.create(primaries, gamma);
        let spaceName: colorSpaceManager.ColorSpace = colorSpace.getColorSpaceName();
        console.info(msg + 'Succeeded in sendableColorSpaceManager.create.');
        console.info(msg + 'Succeeded in sendableColorSpaceManager.create. spaceName: ' + spaceName );
        console.info(msg + 'Succeeded in sendableColorSpaceManager.create. spaceName: ' + JSON.stringify(spaceName) );
        done()        
      } catch (exception) {
        console.error(msg + 'Failed to sendableColorSpaceManager.create. Cause:' + JSON.stringify(exception));
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testGetWhitePoint_UserDefined
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICCOLORSPACE_JS_API_0150
     * @tc.desc   Creates user-defined sharable color management instances, Obtains the color gamut white point value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetWhitePoint_UserDefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "====testGetWhitePoint_UserDefined===="
      console.log(msg + ' begin')
      try {
        let colorSpace: sendableColorSpaceManager.ColorSpaceManager;
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
        let gamma: number = 2.2;
        colorSpace = sendableColorSpaceManager.create(primaries, gamma);
        let point: collections.Array<number> = colorSpace.getWhitePoint();
        console.info(msg + 'Succeeded in sendableColorSpaceManager.create.');
        console.info(msg + 'Succeeded in sendableColorSpaceManager.create. point: ' + point );
        console.info(msg + 'Succeeded in sendableColorSpaceManager.create. point: ' + JSON.stringify(point) );
        done()        
      } catch (exception) {
        console.error(msg + 'Failed to sendableColorSpaceManager.create. Cause:' + JSON.stringify(exception));
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testGetGamma_UserDefined
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICCOLORSPACE_JS_API_0160
     * @tc.desc   Creates user-defined sharable color management instances, Obtains the color gamut type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetGamma_UserDefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "====testGetGamma_UserDefined===="
      console.log(msg + ' begin')
      try {
        let colorSpace: sendableColorSpaceManager.ColorSpaceManager;
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
        let gamma: number = 2.2;
        colorSpace = sendableColorSpaceManager.create(primaries, gamma);
        let gamma_get: number = colorSpace.getGamma();
        console.info(msg + 'Succeeded in sendableColorSpaceManager.create.');
        console.info(msg + 'Succeeded in sendableColorSpaceManager.create. gamma: ' + gamma_get );
        console.info(msg + 'Succeeded in sendableColorSpaceManager.create. gamma: ' + JSON.stringify(gamma_get) );
        done()        
      } catch (exception) {
        console.error(msg + 'Failed to sendableColorSpaceManager.create. Cause:' + JSON.stringify(exception));
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testCreateErrorCode
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICCOLORSPACE_JS_API_0170
     * @tc.desc   test sendableColorSpaceManager.create ErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateErrorCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "====testCreateErrorCode===="
      console.log(msg + ' begin')
      try {
        let colorSpace: sendableColorSpaceManager.ColorSpaceManager;
        try{
          colorSpace = sendableColorSpaceManager.create(100);
          console.info(msg + 'Succeeded in sendableColorSpaceManager.create. ERROR!!!');
          expect().assertFail();
          done()
        }catch(error){
          if(error.code == 401){
            console.log(msg + ' Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types. ')
            console.log(msg + ' Case End Successfully')
            done()
          }else{
            console.error(`Failed to do layout, error: ${JSON.stringify(error)} message: ${error.message}`);
            expect().assertFail();
            done()
          }
        }       
      } catch (exception) {
        console.error(msg + 'Failed to sendableColorSpaceManager.create. Cause:' + JSON.stringify(exception));
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   getSendableColorSpaceEnum_0100
     * @tc.number getSendableColorSpaceEnum_0100
     * @tc.desc   the get sendableColorSpace Enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSendableColorSpaceEnum_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      console.info('test getSendableColorSpaceEnum_0100 begin');
      try {
        let colorSpace1 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998);
        let colorSpaceName1 = colorSpace1.getColorSpaceName();
        expect(colorSpaceName1).assertEqual(colorSpaceManager.ColorSpace.ADOBE_RGB_1998);
        let colorSpace2 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3);
        let colorSpaceName2 = colorSpace2.getColorSpaceName();
        expect(colorSpaceName2).assertEqual(colorSpaceManager.ColorSpace.DCI_P3);
        let colorSpace3 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3);
        let colorSpaceName3 = colorSpace3.getColorSpaceName();
        expect(colorSpaceName3).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3);
        let colorSpace4 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB);
        let colorSpaceName4 = colorSpace4.getColorSpaceName();
        expect(colorSpaceName4).assertEqual(colorSpaceManager.ColorSpace.SRGB);
        let colorSpace5 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.BT709);
        let colorSpaceName5 = colorSpace5.getColorSpaceName();
        expect(colorSpaceName5).assertEqual(colorSpaceManager.ColorSpace.BT709);
        let colorSpace6 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_EBU);
        let colorSpaceName6 = colorSpace6.getColorSpaceName();
        expect(colorSpaceName6).assertEqual(colorSpaceManager.ColorSpace.BT601_EBU);
        let colorSpace7 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C);
        let colorSpaceName7 = colorSpace7.getColorSpaceName();
        expect(colorSpaceName7).assertEqual(colorSpaceManager.ColorSpace.BT601_SMPTE_C);
        let colorSpace8 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_HLG);
        let colorSpaceName8 = colorSpace8.getColorSpaceName();
        expect(colorSpaceName8).assertEqual(colorSpaceManager.ColorSpace.BT2020_HLG);
        let colorSpace9 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_PQ);
        let colorSpaceName9 = colorSpace9.getColorSpaceName();
        expect(colorSpaceName9).assertEqual(colorSpaceManager.ColorSpace.BT2020_PQ);
        let colorSpace10 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.P3_HLG);
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
     * @tc.name   getSendableColorSpaceEnum_0200
     * @tc.number getSendableColorSpaceEnum_0200
     * @tc.desc   the get sendableColorSpace Enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSendableColorSpaceEnum_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      console.info('test getSendableColorSpaceEnum_0200 begin');
      try {
        let colorSpace1 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.P3_PQ);
        let colorSpaceName1 = colorSpace1.getColorSpaceName();
        expect(colorSpaceName1).assertEqual(colorSpaceManager.ColorSpace.P3_PQ);
        let colorSpace2 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998_LIMIT);
        let colorSpaceName2 = colorSpace2.getColorSpaceName();
        expect(colorSpaceName2).assertEqual(colorSpaceManager.ColorSpace.ADOBE_RGB_1998_LIMIT);
        let colorSpace3 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_LIMIT);
        let colorSpaceName3 = colorSpace3.getColorSpaceName();
        expect(colorSpaceName3).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3_LIMIT);
        let colorSpace4 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB_LIMIT);
        let colorSpaceName4 = colorSpace4.getColorSpaceName();
        expect(colorSpaceName4).assertEqual(colorSpaceManager.ColorSpace.SRGB_LIMIT);
        let colorSpace5 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.BT709_LIMIT);
        let colorSpaceName5 = colorSpace5.getColorSpaceName();
        expect(colorSpaceName5).assertEqual(colorSpaceManager.ColorSpace.BT709_LIMIT);
        let colorSpace6 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_EBU_LIMIT);
        let colorSpaceName6 = colorSpace6.getColorSpaceName();
        expect(colorSpaceName6).assertEqual(colorSpaceManager.ColorSpace.BT601_EBU_LIMIT);
        let colorSpace7 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C_LIMIT);
        let colorSpaceName7 = colorSpace7.getColorSpaceName();
        expect(colorSpaceName7).assertEqual(colorSpaceManager.ColorSpace.BT601_SMPTE_C_LIMIT);
        let colorSpace8 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_HLG_LIMIT);
        let colorSpaceName8 = colorSpace8.getColorSpaceName();
        expect(colorSpaceName8).assertEqual(colorSpaceManager.ColorSpace.BT2020_HLG_LIMIT);
        let colorSpace9 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_PQ_LIMIT);
        let colorSpaceName9 = colorSpace9.getColorSpaceName();
        expect(colorSpaceName9).assertEqual(colorSpaceManager.ColorSpace.BT2020_PQ_LIMIT);
        let colorSpace10 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.P3_HLG_LIMIT);
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
     * @tc.name   getSendableColorSpaceEnum_0300
     * @tc.number getSendableColorSpaceEnum_0300
     * @tc.desc   the get sendableColorSpace Enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSendableColorSpaceEnum_0300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      console.info('test getSendableColorSpaceEnum_0300 begin');
      try {
        let colorSpace1 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.P3_PQ_LIMIT);
        let colorSpaceName1 = colorSpace1.getColorSpaceName();
        expect(colorSpaceName1).assertEqual(colorSpaceManager.ColorSpace.P3_PQ_LIMIT);
        let colorSpace2 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_P3);
        let colorSpaceName2 = colorSpace2.getColorSpaceName();
        expect(colorSpaceName2).assertEqual(colorSpaceManager.ColorSpace.LINEAR_P3);
        let colorSpace3 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_SRGB);
        let colorSpaceName3 = colorSpace3.getColorSpaceName();
        expect(colorSpaceName3).assertEqual(colorSpaceManager.ColorSpace.LINEAR_SRGB);
        let colorSpace4 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_BT709);
        let colorSpaceName4 = colorSpace4.getColorSpaceName();
        expect(colorSpaceName4).assertEqual(colorSpaceManager.ColorSpace.LINEAR_BT709);
        let colorSpace5 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_BT2020);
        let colorSpaceName5 = colorSpace5.getColorSpaceName();
        expect(colorSpaceName5).assertEqual(colorSpaceManager.ColorSpace.LINEAR_BT2020);
        let colorSpace6 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.H_LOG);
        let colorSpaceName6 = colorSpace6.getColorSpaceName();
        expect(colorSpaceName6).assertEqual(colorSpaceManager.ColorSpace.H_LOG);
        let colorSpace7 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_BT2020_SRGB);
        let colorSpaceName7 = colorSpace7.getColorSpaceName();
        expect(colorSpaceName7).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_BT2020_SRGB);
        let colorSpace8 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_SRGB);
        let colorSpaceName8 = colorSpace8.getColorSpaceName();
        expect(colorSpaceName8).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_SRGB);
        let colorSpace9 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_SRGB);
        let colorSpaceName9 = colorSpace9.getColorSpaceName();
        expect(colorSpaceName9).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3_SRGB);
        let colorSpace10 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_HLG);
        let colorSpaceName10 = colorSpace10.getColorSpaceName();
        expect(colorSpaceName10).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3_HLG);
        let colorSpace11 = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_PQ);
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
     * @tc.name   getSendableColorSpaceEnum_0400
     * @tc.number getSendableColorSpaceEnum_0400
     * @tc.desc   test the interface of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSendableColorSpaceEnum_0400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      console.info('test getSendableColorSpaceEnum_0400 begin');
      try {
        let csManager = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.UNKNOWN);
        expect(csManager != null).assertTrue();
        let colorSpaceName = csManager.getColorSpaceName();
        console.info("the name is " + colorSpaceName);
        expect(colorSpaceName).assertEqual(colorSpaceManager.ColorSpace.UNKNOWN);
        done();
      } catch (err) {
        console.log('www data test enum value of ColorSpace Manager not support error ' + JSON.stringify(err));
        expect(err.code).assertEqual(18600001);
        done();
      }
    })
    
    /**
     * @tc.name   getSendableColorSpaceEnum_0500
     * @tc.number getSendableColorSpaceEnum_0500
     * @tc.desc   test the interface of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSendableColorSpaceEnum_0500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      console.info('test getSendableColorSpaceEnum_0500 begin');
      try {
        let csManager = sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.CUSTOM);
        expect(csManager != null).assertTrue();
        let colorSpaceName = csManager.getColorSpaceName();
        console.info("the name is " + colorSpaceName);
        expect(colorSpaceName).assertEqual(colorSpaceManager.ColorSpace.UNKNOWN);
        done();
      } catch (err) {
        console.log('www data test enum value of ColorSpace Manager not support error ' + JSON.stringify(err));
        expect(err.code == 18600001).assertTrue();
        done();
      }
    })

  })
}