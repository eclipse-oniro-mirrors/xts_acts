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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICCOLORSPACE_JS_API_0090
     * @tc.name      : testSendableColorSpaceManagerCreate_Standard
     * @tc.desc      : Create standard sharable color management.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICCOLORSPACE_JS_API_0100
     * @tc.name      : testSendableColorSpaceManagerCreate_UserDefined
     * @tc.desc      : Creates user-defined sharable color management instances.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICCOLORSPACE_JS_API_0110
     * @tc.name      : testGetColorSpaceName_Standard
     * @tc.desc      : Create standard sharable color management, Obtains the color gamut gamma value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICCOLORSPACE_JS_API_0120
     * @tc.name      : testGetWhitePoint_Standard
     * @tc.desc      : Create standard sharable color management, Obtains the color gamut white point value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICCOLORSPACE_JS_API_0130
     * @tc.name      : testGetGamma_Standard
     * @tc.desc      : Create standard sharable color management, Obtains the color gamut type.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICCOLORSPACE_JS_API_0140
     * @tc.name      : testGetColorSpaceName_UserDefined
     * @tc.desc      : Creates user-defined sharable color management instances, Obtains the color gamut gamma value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICCOLORSPACE_JS_API_0150
     * @tc.name      : testGetWhitePoint_UserDefined
     * @tc.desc      : Creates user-defined sharable color management instances, Obtains the color gamut white point value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICCOLORSPACE_JS_API_0160
     * @tc.name      : testGetGamma_UserDefined
     * @tc.desc      : Creates user-defined sharable color management instances, Obtains the color gamut type.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICCOLORSPACE_JS_API_0170
     * @tc.name      : testCreateErrorCode
     * @tc.desc      : test sendableColorSpaceManager.create ErrorCode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateErrorCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
  })
}