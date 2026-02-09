/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import common from '@ohos.bluetooth.common';
import hid from '@ohos.bluetooth.hid';
const PERMISSION_DENIED_CODE = 201;
let PERMISSION_TEXT:string = "允许";
let OPEN_BT_TEXT:string = "开启";
let hidDevice: hid.HidDeviceProfile;
function onReceiveEvent_boolean(data : boolean){
    console.info('[bluetooth_js]hid registerHidDevice result'+ JSON.stringify(data));
    expect(data).assertTrue();
}
export default function btHidNopUiJsunit() {
  describe('btHidNopUiJsunit', () => {
    beforeAll(async (done : Function) =>  {
      hidDevice = hid.createHidDeviceProfile();
      console.info('[bluetooth_js]createHidDeviceProfile success'+ JSON.stringify(hidDevice));
      done();
    });
    beforeEach(() => {
      console.info('beforeEach end');
    });
    afterEach(() => {
      console.info('afterEach end');
    });
    afterAll(() => {
      console.info('afterAll end');
    });
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOP_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOP_0100
     * @tc.desc   Test registerHidDevice(参数): void; api23.201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOP_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
          let descriptors: Uint8Array = new Uint8Array([
            0x11, 0x22,
            0x33, 0x44,
            0x55, 0x66,
            0x77, 0x88,
            0x99, 0xAA,
            0xBB, 0xCC,
            0xDD, 0xEE,
          ]);
          let sdp: hid.HidDeviceSdp = {
            "name": "testName",
            "description": "testDescription",
            "provider": "testProvoder",
            "subclass": hid.Subclass.SUBCLASS_KEYBOARD,
            "descriptors": descriptors,
          };
          let inqos: hid.HidDeviceQos = {
            "serviceType": hid.ServiceType.SERVICE_BEST_EFFORT,
            "tokenRate": 0,
            "tokenBucketSize": 0,
            "peakBandwidth": 0,
            "latency": -1,
            "delayVariation": -1,
          };
          let outqos: hid.HidDeviceQos = {};
          hidDevice.registerHidDevice(sdp, inqos, outqos, onReceiveEvent_boolean);
          console.info("[bluetooth_js]hid registerHidDevice is success ");
          expect().assertFail();
        } catch (error) {
          console.error(`[bluetooth_js]registerHidDevice  is failed, code is ${error.code},message is ${error.message}`);
          expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
        }
        done();
      })
      /**
       * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOP_0200
       * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOP_0200
       * @tc.desc   Test unregisterHidDevice(): void; api23.201
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOP_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
          hidDevice.unregisterHidDevice();
          console.info("[bluetooth_js]hid unregisterHidDevice is success ");
          expect().assertFail();
        } catch (error) {
          console.error(`[bluetooth_js]unregisterHidDevice  is failed, code is ${error.code},message is ${error.message}`);
          expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
        }
        done();
      })
      /**
       * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOP_0300
       * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOP_0300
       * @tc.desc   Test connect(deviceId: BluetoothAddress): void; api23.201
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOP_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
          let deviceId: common.BluetoothAddress = {
            "address": "11:22:33:44:55:66",
            "addressType": common.BluetoothAddressType.REAL,
          };
          hidDevice.connect(deviceId);
          console.info("[bluetooth_js]hid connect is success ");
          expect().assertFail();
        } catch (error) {
          console.error(`[bluetooth_js]connect  is failed, code is ${error.code},message is ${error.message}`);
          expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
        }
        done();
      })
  
      /**
       * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOP_0400
       * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOP_0400
       * @tc.desc   Test disconnect(): void;api23.201
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOP_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
          hidDevice.disconnect();
          console.info("[bluetooth_js]hid disconnect is success ");
          expect().assertFail();
        } catch (error) {
          console.error(`[bluetooth_js]disconnect  is failed, code is ${error.code},message is ${error.message}`);
          expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
        }
        done();
      })
  
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOP_0500
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOP_0500
     * @tc.desc   Test sendReport: void;api23.201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOP_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
			    let id: number = 1;
			    let reportData: Uint8Array = new Uint8Array([0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77]);
          hidDevice.sendReport(id,reportData);
          console.info("[bluetooth_js]hid sendReport is success ");
          expect().assertFail();
        } catch (error) {
            console.error(`[bluetooth_js]sendReport  is failed, code is ${error.code},message is ${error.message}`);
            expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
        }
        done();
    })	
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOP_0600
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOP_0600
     * @tc.desc   Test replyReport: void;api23. 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOP_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
          let type1: hid.ReportType = hid.ReportType.REPORT_TYPE_INPUT;
          let id: number = 1;
          let reportData: Uint8Array = new Uint8Array([0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77]);
          hidDevice.replyReport(type1,id,reportData);
          console.info("[bluetooth_js]hid replyReport is success ");
          expect().assertFail();
        } catch (error) {
            console.error(`[bluetooth_js] replyReport is failed, code is ${error.code},message is ${error.message}`);
            expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
        }
        done();
    })	
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOP_0700
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOP_0700
     * @tc.desc   Test reportError void;api23. 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOP_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
        try {
			    let error: hid.ErrorReason = hid.ErrorReason.RSP_SUCCESS;
          hidDevice.reportError(error);
          console.info("[bluetooth_js]hid reportError is success ");
          expect().assertFail();
        } catch (error) {
            console.error(`[bluetooth_js]reportError is failed, code is ${error.code},message is ${error.message}`);
            expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
        }
        done();
    })
  })
}

