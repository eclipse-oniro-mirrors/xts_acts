/*
 * Copyright (C) 2021-2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import usb from '@ohos.usb';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

/* usb core functions test */
export default function UsbFunctionsJsFunctionsTestEx() {
describe('UsbFunctionsJsFunctionsTestEx', function () {

  var invalidCode = 0;

  beforeAll(function () {
    console.log('*************Usb Unit UsbFunctionsJsFunctionsTestEx Begin*************');
    var Version = usb.getVersion()
    console.info('begin test getversion :' + Version)
    //  17 version host currentMode = 2 device currentMode = 1
    var usbPortList = usb.getPorts()
    if (usbPortList.length > 0) {
      if (usbPortList[0].status.currentMode == 2) {
        usb.setPortRoles(usbPortList[0].id, usb.SINK, usb.DEVICE).then(data => {
          console.info('usb case setPortRoles return: ' + data);
        }).catch(error => {
          console.info('usb case setPortRoles error : ' + error);
        });
        CheckEmptyUtils.sleep(8000)
        console.log('*************Usb Unit switch to device Begin*************');
      }
    }
  })
  beforeEach(function () {
    console.info('beforeEach: *************Usb Unit Test Case*************');
  })

  afterEach(function () {
    console.info('afterEach: *************Usb Unit Test Case*************');
  })

  afterAll(function () {
    console.log('*************Usb Unit UsbFunctionsJsFunctionsTest End*************');
  })

  /**
   * @tc.number: SUB_USB_JS_0930
   * @tc.name: usbFunctionsToString
   * @tc.desc: Positive test: input 0, return 'none'
   */
  it('SUB_USB_JS_0930', 0, function () {
    console.info('usb SUB_USB_JS_0930 begin');
    var maskCode = usb.NONE
    console.info('usb case maskCode : ' + usb.NONE);
    var strMaskCode = usb.usbFunctionsToString(maskCode)
    console.info('usb case maskCode ' + maskCode + ' usbFunctionsToString return int: ' + strMaskCode);
    expect(strMaskCode).assertEqual('none');
    console.info('usb SUB_USB_JS_0930 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0940
   * @tc.name: usbFunctionsToString
   * @tc.desc: Positive test: input 1, return 'acm'
   */
  it('SUB_USB_JS_0940', 0, function () {
    console.info('usb SUB_USB_JS_0940 begin');
    var maskCode = usb.ACM
    console.info('usb case maskCode : ' + usb.ACM);
    var strMaskCode = usb.usbFunctionsToString(maskCode)
    console.info('usb case maskCode ' + maskCode + ' usbFunctionsToString return int: ' + strMaskCode);
    expect(strMaskCode).assertEqual('acm');
    console.info('usb SUB_USB_JS_0940 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0950
   * @tc.name: usbFunctionsToString
   * @tc.desc: Positive test: input 2, return 'ecm'
   */
  it('SUB_USB_JS_0950', 0, function () {
    console.info('usb SUB_USB_JS_0950 begin');
    var maskCode = usb.ECM
    console.info('usb case maskCode : ' + maskCode);
    var strMaskCode = usb.usbFunctionsToString(maskCode)
    console.info('usb case maskCode ' + maskCode + ' usbFunctionsToString return int: ' + strMaskCode);
    expect(strMaskCode).assertEqual('ecm');
    console.info('usb SUB_USB_JS_0950 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0960
   * @tc.name: usbFunctionsToString
   * @tc.desc: Positive test: input 3, return 'acm,ecm'
   */
  it('SUB_USB_JS_0960', 0, function () {
    console.info('usb SUB_USB_JS_0960 begin');
    var maskCode = usb.ACM | usb.ECM
    console.info('usb case maskCode : ' + maskCode);
    var strMaskCode = usb.usbFunctionsToString(maskCode)
    console.info('usb case maskCode ' + maskCode + ' usbFunctionsToString return int: ' + strMaskCode);
    expect(strMaskCode).assertEqual('acm,ecm');
    console.info('usb SUB_USB_JS_0960 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0970
   * @tc.name: usbFunctionsToString
   * @tc.desc: Positive test: input 4, return 'hdc'
   */
  it('SUB_USB_JS_0970', 0, function () {
    console.info('usb SUB_USB_JS_0970 begin');
    var maskCode = usb.HDC
    console.info('usb case maskCode : ' + maskCode);
    var strMaskCode = usb.usbFunctionsToString(maskCode)
    console.info('usb case maskCode ' + maskCode + ' usbFunctionsToString return int: ' + strMaskCode);
    expect(strMaskCode).assertEqual('hdc');
    console.info('usb SUB_USB_JS_0970 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0980
   * @tc.name: usbFunctionsToString
   * @tc.desc: Positive test: input 5, return 'acm,hdc'
   */
  it('SUB_USB_JS_0980', 0, function () {
    console.info('usb SUB_USB_JS_0980 begin');
    var maskCode = usb.ACM | usb.HDC
    console.info('usb case maskCode : ' + maskCode);
    var strMaskCode = usb.usbFunctionsToString(maskCode)
    console.info('usb case maskCode ' + maskCode + ' usbFunctionsToString return int: ' + strMaskCode);
    expect(strMaskCode).assertEqual('acm,hdc');
    console.info('usb SUB_USB_JS_0980 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0990
   * @tc.name: usbFunctionsToString
   * @tc.desc: Positive test: input 6, return 'ecm,hdc'
   */
  it('SUB_USB_JS_0990', 0, function () {
    console.info('usb SUB_USB_JS_0990 begin');
    var maskCode = usb.ECM | usb.HDC
    console.info('usb case maskCode : ' + maskCode);
    var strMaskCode = usb.usbFunctionsToString(maskCode)
    console.info('usb case maskCode ' + maskCode + ' usbFunctionsToString return int: ' + strMaskCode);
    expect(strMaskCode).assertEqual('ecm,hdc');
    console.info('usb SUB_USB_JS_0990 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_1160
   * @tc.name: usbFunctionsToString
   * @tc.desc: Negative test: Mask converted to description character, parameter type error
   */
  it('SUB_USB_JS_1160', 0, function () {
    console.info('usb SUB_USB_JS_1160 begin');
    try {
      var maskCode = usb.usbFunctionsToString("invalid");
      console.info('usb 1160 case usbFunctionsToString return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1160 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1160 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_1360
   * @tc.name: usbFunctionsToString
   * @tc.desc: Negative test: Mask converted to description character,
   * parameter number exception, necessary parameters not input
   */
  it('SUB_USB_JS_1360', 0, function () {
    console.info('usb SUB_USB_JS_1360 begin');
    try {
      var maskCode = usb.usbFunctionsToString();
      console.info('usb 1360 case usbFunctionsToString return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1360 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1360 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_0860
   * @tc.name: usbFunctionsFromString
   * @tc.desc: Positive test: input 'none', return 0
   */
  it('SUB_USB_JS_0860', 0, function () {
    console.info('usb SUB_USB_JS_0860 begin');
    var strMaskCode = 'none'
    var nMaskCode = usb.usbFunctionsFromString(strMaskCode)
    console.info('usb case strMaskCode ' + strMaskCode + ' usbFunctionsFromString return int: ' + nMaskCode);
    expect(nMaskCode).assertEqual(usb.NONE);
    console.info('usb SUB_USB_JS_0860 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0870
   * @tc.name: usbFunctionsFromString
   * @tc.desc: Positive test: input 'acm', return 1
   */
  it('SUB_USB_JS_0870', 0, function () {
    console.info('usb SUB_USB_JS_0870 begin');
    var strMaskCode = 'acm'
    var nMaskCode = usb.usbFunctionsFromString(strMaskCode)
    console.info('usb case strMaskCode ' + strMaskCode + ' usbFunctionsFromString return int: ' + nMaskCode);
    expect(nMaskCode).assertEqual(usb.ACM);
    console.info('usb SUB_USB_JS_0870 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0880
   * @tc.name: usbFunctionsFromString
   * @tc.desc: Positive test: input 'ecm', return 2
   */
  it('SUB_USB_JS_0880', 0, function () {
    console.info('usb SUB_USB_JS_0880 begin');
    var strMaskCode = 'ecm'
    var nMaskCode = usb.usbFunctionsFromString(strMaskCode)
    console.info('usb case strMaskCode ' + strMaskCode + ' usbFunctionsFromString return int: ' + nMaskCode);
    expect(nMaskCode).assertEqual(usb.ECM);
    console.info('usb SUB_USB_JS_0880 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0890
   * @tc.name: usbFunctionsFromString
   * @tc.desc: Positive test: input 'acm,ecm', return 3
   */
  it('SUB_USB_JS_0890', 0, function () {
    console.info('usb SUB_USB_JS_0890 begin');
    var strMaskCode = 'acm,ecm'
    var nMaskCode = usb.usbFunctionsFromString(strMaskCode)
    console.info('usb case strMaskCode ' + strMaskCode + ' usbFunctionsFromString return int: ' + nMaskCode);
    expect(nMaskCode).assertEqual(usb.ACM | usb.ECM);
    console.info('usb SUB_USB_JS_0890 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0900
   * @tc.name: usbFunctionsFromString
   * @tc.desc: Positive test: input 'hdc', return 4
   */
  it('SUB_USB_JS_0900', 0, function () {
    console.info('usb SUB_USB_JS_0900 begin');
    var strMaskCode = 'hdc'
    var nMaskCode = usb.usbFunctionsFromString(strMaskCode)
    console.info('usb case strMaskCode ' + strMaskCode + ' usbFunctionsFromString return int: ' + nMaskCode);
    expect(nMaskCode).assertEqual(usb.HDC);
    console.info('usb SUB_USB_JS_0900 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0910
   * @tc.name: usbFunctionsFromString
   * @tc.desc: Positive test: input 'acm,hdc', return 5
   */
  it('SUB_USB_JS_0910', 0, function () {
    console.info('usb SUB_USB_JS_0910 begin');
    var strMaskCode = 'acm,hdc'
    var nMaskCode = usb.usbFunctionsFromString(strMaskCode)
    console.info('usb case strMaskCode ' + strMaskCode + ' usbFunctionsFromString return int: ' + nMaskCode);
    expect(nMaskCode).assertEqual(usb.HDC | usb.ACM);
    console.info('usb SUB_USB_JS_0910 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_0920
   * @tc.name: usbFunctionsFromString
   * @tc.desc: Positive test: input 'ecm,hdc', return 6
   */
  it('SUB_USB_JS_0920', 0, function () {
    console.info('usb SUB_USB_JS_0920 begin');
    var strMaskCode = 'ecm,hdc'
    var nMaskCode = usb.usbFunctionsFromString(strMaskCode)
    console.info('usb case strMaskCode ' + strMaskCode + ' usbFunctionsFromString return int: ' + nMaskCode);
    expect(nMaskCode).assertEqual(usb.HDC | usb.ECM);
    console.info('usb SUB_USB_JS_0920 :  PASS');
  })

  /**
   * @tc.number: SUB_USB_JS_1170
   * @tc.name: usbFunctionsFromString
   * @tc.desc: Negative test: Description character converted to mask, parameter type error
   */
  it('SUB_USB_JS_1170', 0, function () {
    console.info('usb SUB_USB_JS_1170 begin');
    try {
      var maskCode = usb.usbFunctionsFromString(invalidCode);
      console.info('usb 1170 case usbFunctionsFromString return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1170 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1170 :  PASS');
    }
  })

  /**
   * @tc.number: SUB_USB_JS_1370
   * @tc.name: usbFunctionsFromString
   * @tc.desc: Negative test: Description character converted to mask,
   * parameter number exception, necessary parameters not input
   */
  it('SUB_USB_JS_1370', 0, function () {
    console.info('usb SUB_USB_JS_1370 begin');
    try {
      var maskCode = usb.usbFunctionsFromString();
      console.info('usb 1370 case usbFunctionsFromString return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1370 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1370 :  PASS');
    }
  })
})
}
