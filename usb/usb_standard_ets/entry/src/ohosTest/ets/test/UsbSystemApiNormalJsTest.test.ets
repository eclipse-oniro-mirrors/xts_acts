/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { beforeAll, afterAll, describe, it, expect, TestType, Size, Level } from "@ohos/hypium"
import usbMgr from "@ohos.usbManager"
import bundleManager from '@ohos.bundle.bundleManager'


export default function UsbSystemApiNormalJsTest() {
  

  describe('UsbSystemApiNormalJsTest', () => {

    const TAG: string = "[UsbSystemApiNormalJsTest]";
    let deviceList = usbMgr.getDevices();
    let portCurrentMode = 0;
    

    beforeAll(async () => {
      console.log('*************Usb Unit UsbSystemApiNormalJsTest Begin*************');
      if (deviceList.length > 0) {
        portCurrentMode = 1;
      }
    })

    afterAll(() => {
      console.log('*************Usb Unit UsbSystemApiNormalJsTest End*************');
    })
  

    /**
     * @tc.number     : SUB_USB_Spec_Sec_SysApiAuthen_0100
     * @tc.name       : testUsbAddDeviceAccessRightNormalApp001
     * @tc.desc       : addDeviceAccessRight Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testUsbAddDeviceAccessRightNormalApp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      if (portCurrentMode != 1) {
        console.info('usb case get_device port is device');
        done()
        return
      }
      try {
        let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
        await bundleManager.getBundleInfoForSelf(bundleFlags).then((bundleInfo) => {
            console.info(TAG, 'getBundleInfoForSelf success Data: ', JSON.stringify(bundleInfo));
            let tokenId = bundleInfo.appInfo.accessTokenId;
            let tokenIdStr = tokenId.toString();
            console.info(TAG, 'testUsbAddDeviceAccessRightNormalApp001 addDeviceAccessRight begin');

            let rightResult = usbMgr.addDeviceAccessRight(tokenIdStr, deviceList[0].name);
            console.log(TAG, 'addDeviceAccessRight failed result: ' + rightResult);
            expect(rightResult === null).assertTrue();
        })
      } catch (err) {
        console.info(TAG, 'usb testUsbAddDeviceAccessRightNormalApp001 catch err code: ',
          err.code, ', message: ', err.message);
        expect(err.code).assertEqual(202);
      }
      done()
    });

    /**
     * @tc.number     : SUB_USB_Spec_Sec_SysApiAuthen_0200
     * @tc.name       : testGetFunctionsFromStringNormalApp001
     * @tc.desc       : getFunctionsFromString Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetFunctionsFromStringNormalApp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let strMaskCode = 'hdc';
      try {
        let nMaskCode = usbMgr.getFunctionsFromString(strMaskCode);
        console.info(TAG, 'Test USB getFunctionsFromString nMaskCode: ' + nMaskCode);
        expect(nMaskCode === null).assertTrue();
      } catch(err) {
        console.info(TAG, 'usb testGetFunctionsFromStringNormalApp001 catch err code: ',
          err.code, ', message: ', err.message);
        expect(err.code).assertEqual(202);
        done()
      }
    });

    /**
     * @tc.number     : SUB_USB_Spec_Sec_SysApiAuthen_0300
     * @tc.name       : testGetStringFromFunctionsNormalApp001
     * @tc.desc       : getStringFromFunctions Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetStringFromFunctionsNormalApp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let funcs: number = 4;
      try {
        let maskCode = usbMgr.getStringFromFunctions(funcs);
        console.info(TAG, 'Test USB getStringFromFunctions maskCode: ' + maskCode);
        expect(maskCode === null).assertTrue();
      } catch(err) {
        console.info(TAG, 'usb testGetStringFromFunctionsNormalApp001 catch err code: ',
          err.code, ', message: ', err.message);
        expect(err.code).assertEqual(202);
        done()
      }
    });

    /**
     * @tc.number     : SUB_USB_Spec_Sec_SysApiAuthen_0400
     * @tc.name       : testSetDeviceFunctionsNormalApp001
     * @tc.desc       : setDeviceFunctions Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetDeviceFunctionsNormalApp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let funcs: number = 4;
      try {
        await usbMgr.setDeviceFunctions(funcs).then((data) => {
          console.info(TAG, 'Test USB setDeviceFunctions nMaskCode: ' + data);
          expect(data === null).assertTrue();
        })
      } catch(err) {
        console.info(TAG, 'usb testSetDeviceFunctionsNormalApp001 catch err code: ',
          err.code, ', message: ', err.message);
        expect(err.code).assertEqual(202);
        done()
      }
    });

    /**
     * @tc.number     : SUB_USB_Spec_Sec_SysApiAuthen_0500
     * @tc.name       : testGetDeviceFunctionsNormalApp001
     * @tc.desc       : getDeviceFunctions Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetDeviceFunctionsNormalApp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      try {
        let maskCode = usbMgr.getDeviceFunctions();
        console.info(TAG, 'Test USB getDeviceFunctions maskCode: ' + maskCode);
        expect(maskCode === null).assertTrue();
      } catch(err) {
        console.info(TAG, 'usb testGetDeviceFunctionsNormalApp001 catch err code: ',
          err.code, ', message: ', err.message);
        expect(err.code).assertEqual(202);
        done()
      }
    });

    /**
     * @tc.number     : SUB_USB_Spec_Sec_SysApiAuthen_0600
     * @tc.name       : testGetPortListNormalApp001
     * @tc.desc       : getPortList Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetPortListNormalApp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      try {
        let portList = usbMgr.getPortList();
        console.info(TAG, 'Test USB getPortList maskCode: ' + JSON.stringify(portList));
        expect(portList === null).assertTrue();
      } catch(err) {
        console.info(TAG, 'usb testGetPortListNormalApp001 catch err code: ', err.code, ', message: ', err.message);
        expect(err.code).assertEqual(202);
        done()
      }
    });

    /**
     * @tc.number     : SUB_USB_Spec_Sec_SysApiAuthen_0700
     * @tc.name       : testGetPortSupportModesNormalApp001
     * @tc.desc       : getPortSupportModes Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetPortSupportModesNormalApp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let portId: number = 1;
      try {
        let portMode = usbMgr.getPortSupportModes(portId);
        console.info(TAG, 'Test USB getPortSupportModes maskCode: ' + JSON.stringify(portMode));
        expect(portMode === null).assertTrue();
      } catch(err) {
        console.info(TAG, 'usb testGetPortSupportModesNormalApp001 catch err code: ',
          err.code, ', message: ', err.message);
        expect(err.code).assertEqual(202);
        done()
      }
    });

    /**
     * @tc.number     : SUB_USB_Spec_Sec_SysApiAuthen_0800
     * @tc.name       : testSetPortRoleTypesNormalApp001
     * @tc.desc       : setPortRoleTypes Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetPortRoleTypesNormalApp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let portId: number = 1;
      let powerRoleTy: number = 2;
      let dataRoleTy: number = 2;
      try {
        await usbMgr.setPortRoleTypes(portId, powerRoleTy, dataRoleTy)
          .then((data) => {
            console.info(TAG, 'Test USB setPortRoleTypes nMaskCode: ' + data);
            expect(data === null).assertTrue();
        })
      } catch(err) {
        console.info(TAG, 'usb testSetPortRoleTypesNormalApp001 catch err code: ',
          err.code, ', message: ', err.message);
        expect(err.code).assertEqual(202);
        done()
      }
    });

  })
}
