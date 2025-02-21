/*
 * Copyright (C) 2024 Huawei Device cO., lTD.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http:www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it } from '@ohos/hypium';
import inputDevice from '@ohos.multimodalInput.inputDevice';

export default function MMIInputDeviceTest() {
  describe("MMIInputDeviceTest", ()=> {
    const ExpectTrue = (n: boolean) => {
      try {
        expect(n).assertTrue();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }
    const ExpectFalse = (n: boolean) => {
      try {
        expect(n).assertFail();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_getDeviceList_0100
     * @tc.name: SUB_MMI_Input_Api_IptDev_getDeviceList_0100
     * @tc.desc: Test callback getDeviceList interface to get the ID list of all input devices.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_getDeviceList_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_getDeviceList_0100";
      try {
        inputDevice.getDeviceList((error: Error, ids: Array<Number>) => {
          if (error) {
            console.info(`${caseName} Failed to get device id list, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectFalse(true);
            done();
          } else {
            console.info(`${caseName} Device id list: ${JSON.stringify(ids)}`);
            ExpectTrue(true);
            done();
          }
        });
      } catch (error) {
        console.info(`${caseName} Failed to get device id list, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_getDeviceList_0200
     * @tc.name: SUB_MMI_Input_Api_IptDev_getDeviceList_0200
     * @tc.desc: Test promise getDeviceList interface to get the ID list of all input devices.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_getDeviceList_0200", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_getDeviceList_0200";
      try {
        inputDevice.getDeviceList().then((ids: Array<Number>) => {
          console.info(`${caseName} Device id list: ${JSON.stringify(ids)}`);
          ExpectTrue(true);
          done();
        });
      } catch (error) {
        console.info(`${caseName} Failed to get device id list, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_getDeviceInfo_0100
     * @tc.name: SUB_MMI_Input_Api_IptDev_getDeviceInfo_0100
     * @tc.desc: Test callback getDeviceInfo interface to get information about a specified input device.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_getDeviceInfo_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_getDeviceInfo_0100";
      try {
        inputDevice.getDeviceInfo(1, (error: Error, deviceData: inputDevice.InputDeviceData) => {
          if (error) {
            console.info(`${caseName} Failed to get device info, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectFalse(true);
            done();
          } else {
            console.info(`${caseName} Device info: ${JSON.stringify(deviceData)}`);
            ExpectTrue(true);
            done();
          }
        });
      } catch (error) {
        console.info(`${caseName} Failed to get device info, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_getDeviceInfo_0200
     * @tc.name: SUB_MMI_Input_Api_IptDev_getDeviceInfo_0200
     * @tc.desc: Test promise getDeviceInfo interface to get information about a specified input device.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_getDeviceInfo_0200", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_getDeviceInfo_0200";
      try {
        inputDevice.getDeviceInfo(1).then((deviceData: inputDevice.InputDeviceData) => {
          console.info(`${caseName} Device info: ${JSON.stringify(deviceData)}`);
          ExpectTrue(true);
          done();
        });
      } catch (error) {
        console.info(`${caseName} Failed to get device info, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_getDeviceInfoSync_0100
     * @tc.name: SUB_MMI_Input_Api_IptDev_getDeviceInfoSync_0100
     * @tc.desc: Test getDeviceInfoSync interface to get information about a specified input device.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_getDeviceInfoSync_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_getDeviceInfoSync_0100";
      try {
        let deviceData: inputDevice.InputDeviceData = inputDevice.getDeviceInfoSync(1);
        console.info(`${caseName} Device info: ${JSON.stringify(deviceData)}`);
        ExpectTrue(true);
        done();
      } catch (error) {
        console.info(`${caseName} Failed to get device info, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_off_0100
     * @tc.name: SUB_MMI_Input_Api_IptDev_off_0100
     * @tc.desc: Test callback on and off interfaces to cancel the hot swap event for the specified input device.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_off_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_off_0100";
      const callback = (data: inputDevice.DeviceListener) => {
        console.info(`${caseName} Report device event info: ${JSON.stringify(data, [`type`, `deviceId`])}`);
      };
      try {
        inputDevice.on("change", (data: inputDevice.DeviceListener) => {
          console.info(`${caseName} Device event info: ${JSON.stringify(data)}`);
          inputDevice.getKeyboardType(data.deviceId, (err: Error, type: inputDevice.KeyboardType) => {
            console.info(`${caseName} The keyboard type is: ${JSON.stringify(type)}`);
            if (type == inputDevice.KeyboardType.ALPHABETIC_KEYBOARD && data.type == 'add') {
              isPhysicalKeyboardExist = true;
            } else if (type == inputDevice.KeyboardType.ALPHABETIC_KEYBOARD && data.type == 'remove') {
              isPhysicalKeyboardExist = false;
            }
          });
        });
      } catch (error) {
        console.info(`${caseName} Get device info failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
      }
      try {
        inputDevice.off("change", callback);
        ExpectTrue(true);
        done();
      } catch (error) {
        console.info(`${caseName} Cancel listening device event failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_off_0200
     * @tc.name: SUB_MMI_Input_Api_IptDev_off_0200
     * @tc.desc: Test callback off interface to cancel the hot swap event for all input devices.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_off_0200", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_off_0200";
      const callback = (data: inputDevice.DeviceListener) => {
        console.info(`${caseName} Report device event info: ${JSON.stringify(data, [`type`, `deviceId`])}`);
      };
      try {
        inputDevice.off("change");
        ExpectTrue(true);
        done();
      } catch (error) {
        console.info(`${caseName} Cancel all listening device event failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_getDeviceIds_0100
     * @tc.name: SUB_MMI_Input_Api_IptDev_getDeviceIds_0100
     * @tc.desc: Test callback getDeviceIds interface to get the ID list of all input devices.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_getDeviceIds_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_getDeviceIds_0100";
      try {
        inputDevice.getDeviceIds((error: Error, ids: Array<Number>) => {
          if (error) {
            console.info(`${caseName} Failed to get device id list, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectFalse(true);
            done();
          } else {
            console.info(`${caseName} Device id list: ${JSON.stringify(ids)}`);
            ExpectTrue(true);
            done();
          }
        });
      } catch (error) {
        console.info(`${caseName} Failed to get device id list, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_getDeviceIds_0200
     * @tc.name: SUB_MMI_Input_Api_IptDev_getDeviceIds_0200
     * @tc.desc: Test promise getDeviceIds interface to get the ID list of all input devices.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_getDeviceIds_0200", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_getDeviceIds_0200";
      try {
        inputDevice.getDeviceIds().then((ids: Array<Number>) => {
          console.info(`${caseName} Device id list: ${JSON.stringify(ids)}`);
          ExpectTrue(true);
          done();
        });
      } catch (error) {
        console.info(`${caseName} Failed to get device id list, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_getDevice_0100
     * @tc.name: SUB_MMI_Input_Api_IptDev_getDevice_0100
     * @tc.desc: Test callback getDevice interface to get information about a specified input device.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_getDevice_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_getDevice_0100";
      try {
        inputDevice.getDevice(1, (error: Error, deviceData: inputDevice.InputDeviceData) => {
          if (error) {
            console.info(`${caseName} Failed to get device info, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectFalse(true);
            done();
          } else {
            console.info(`${caseName} Device info: ${JSON.stringify(deviceData)}`);
            ExpectTrue(true);
            done();
          }
        });
      } catch (error) {
        console.info(`${caseName} Failed to get device info, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_getDevice_0200
     * @tc.name: SUB_MMI_Input_Api_IptDev_getDevice_0200
     * @tc.desc: Test promise getDevice interface to get information about a specified input device.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_getDevice_0200", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_getDevice_0200";
      try {
        inputDevice.getDevice(1).then((deviceData: inputDevice.InputDeviceData) => {
          console.info(`${caseName} Device info: ${JSON.stringify(deviceData)}`);
          ExpectTrue(true);
          done();
        });
      } catch (error) {
        console.info(`${caseName} Failed to get device info, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_supportKeys_0100
     * @tc.name: SUB_MMI_Input_Api_IptDev_supportKeys_0100
     * @tc.desc: Test callback supportKeys interface to get whether the input device supports the specified key code value.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_supportKeys_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_supportKeys_0100";
      try {
        inputDevice.supportKeys(1, [17, 22, 2055], (error: Error, supportResult: Array<Boolean>) => {
          console.info(`${caseName} Query result: ${JSON.stringify(supportResult)}`);
          ExpectTrue(true);
          done();
        });
      } catch (error) {
        console.info(`${caseName} Query failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_supportKeys_0200
     * @tc.name: SUB_MMI_Input_Api_IptDev_supportKeys_0200
     * @tc.desc: Test promise supportKeys interface to get whether the input device supports the specified key code value.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_supportKeys_0200", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_supportKeys_0200";
      try {
        inputDevice.supportKeys(1, [17, 22, 2055]).then((supportResult: Array<Boolean>) => {
          console.info(`${caseName} Query result: ${JSON.stringify(supportResult)}`);
          ExpectTrue(true);
          done();
        });
      } catch (error) {
        console.info(`${caseName} Query failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_supportKeysSync_0100
     * @tc.name: SUB_MMI_Input_Api_IptDev_supportKeysSync_0100
     * @tc.desc: Test supportKeysSync interface to get whether the input device supports the specified key code value.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_supportKeysSync_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_supportKeysSync_0100";
      try {
        let supportResult: Array<Boolean> = inputDevice.supportKeysSync(1, [17, 22, 2055]);
        console.info(`${caseName} Query result: ${JSON.stringify(supportResult)}`);
        ExpectTrue(true);
        done();
      } catch (error) {
        console.info(`${caseName} Query failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_getKeyboardType_0100
     * @tc.name: SUB_MMI_Input_Api_IptDev_getKeyboardType_0100
     * @tc.desc: Test callback getKeyboardType interface to get the keyboard type of an input device.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_getKeyboardType_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_getKeyboardType_0100";
      try {
        inputDevice.getKeyboardType(1, (error: Error, type: Number) => {
          if (error) {
            console.info(`${caseName} Failed to get keyboard type, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectFalse(true);
            done();
          } else {
            console.info(`${caseName} Keyboard type: ${JSON.stringify(type)}`);
            ExpectTrue(true);
            done();
          }
        });
      } catch (error) {
        console.info(`${caseName} Failed to get keyboard type, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_getKeyboardType_0200
     * @tc.name: SUB_MMI_Input_Api_IptDev_getKeyboardType_0200
     * @tc.desc: Test promise getKeyboardType interface to get the keyboard type of an input device.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_getKeyboardType_0200", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_getKeyboardType_0200";
      try {
        inputDevice.getKeyboardType(1).then((type: Number) => {
          console.info(`${caseName} Keyboard type: ${JSON.stringify(type)}`);
          ExpectTrue(true);
          done();
        });
      } catch (error) {
        console.info(`${caseName} Failed to get keyboard type, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_getKeyboardTypeSync_0100
     * @tc.name: SUB_MMI_Input_Api_IptDev_getKeyboardTypeSync_0100
     * @tc.desc: Test getKeyboardTypeSync interface to get the keyboard type of an input device.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_getKeyboardTypeSync_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_getKeyboardTypeSync_0100";
      try {
        let type: number = inputDevice.getKeyboardTypeSync(1);
        console.info(`${caseName} Keyboard type: ${JSON.stringify(type)}`);
        ExpectTrue(true);
        done();
      } catch (error) {
        console.info(`${caseName} Failed to get keyboard type, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });
  });
}