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

import { describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import { inputDevice } from '@kit.InputKit';
import { inputConsumer } from '@kit.InputKit';

export default function MultimodalInputDeviceTest() {
  describe("MultimodalInputDeviceTest", ()=> {
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
    it("SUB_MMI_Input_Api_IptDev_getDeviceList_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_getDeviceList_0100";
      try {
        inputDevice.getDeviceList((error: Error, ids: Array<Number>) => {
          if (error) {
            console.info(`${caseName} Failed to get device id list, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectFalse(true);
            done();
          } else {
            console.info(`${caseName} Device id list: ${JSON.stringify(ids)}`);
            ExpectTrue(Array.isArray(ids));
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
    it("SUB_MMI_Input_Api_IptDev_getDeviceList_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_getDeviceList_0200";
      try {
        inputDevice.getDeviceList().then((ids: Array<Number>) => {
          console.info(`${caseName} Device id list: ${JSON.stringify(ids)}`);
          ExpectTrue(Array.isArray(ids));
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
    it("SUB_MMI_Input_Api_IptDev_getDeviceInfo_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_getDeviceInfo_0100";
      try {
        inputDevice.getDeviceInfo(1, (error: Error, deviceData: inputDevice.InputDeviceData) => {
          if (error) {
            console.info(`${caseName} Failed to get device info, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectFalse(true);
            done();
          } else {
            console.info(`${caseName} Device info: ${JSON.stringify(deviceData)}`);
            ExpectTrue(typeof(deviceData) == 'object');
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
    it("SUB_MMI_Input_Api_IptDev_getDeviceInfo_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_getDeviceInfo_0200";
      try {
        inputDevice.getDeviceInfo(1).then((deviceData: inputDevice.InputDeviceData) => {
          console.info(`${caseName} Device info: ${JSON.stringify(deviceData)}`);
          ExpectTrue(typeof(deviceData) == 'object');
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
    it("SUB_MMI_Input_Api_IptDev_getDeviceInfoSync_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_getDeviceInfoSync_0100";
      try {
        let deviceData: inputDevice.InputDeviceData = inputDevice.getDeviceInfoSync(1);
        console.info(`${caseName} Device info: ${JSON.stringify(deviceData)}`);
        ExpectTrue(typeof(deviceData) == 'object');
        done();
      } catch (error) {
        console.info(`${caseName} Failed to get device info, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_getDeviceInfoSync_0200
     * @tc.name: SUB_MMI_Input_Api_IptDev_getDeviceInfoSync_0200
     * @tc.desc: Test getDeviceInfoSync interface invalid input parameter
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_getDeviceInfoSync_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_getDeviceInfoSync_0200";
      try {
        let deviceData: inputDevice.InputDeviceData = inputDevice.getDeviceInfoSync(undefined);
        ExpectFalse(true);
        done();
      } catch (error) {
        console.info(`${caseName} Failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectTrue(error.code == 401);
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
    it("SUB_MMI_Input_Api_IptDev_off_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_off_0100";
      const callback = (data: inputDevice.DeviceListener) => {
        console.info(`${caseName} Report device event info: ${JSON.stringify(data, [`type`, `deviceId`])}`);
      };
      let isPhysicalKeyboardExist = true;
      let ifInputDeviceOffSuccess = 0;
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
        console.info(`${caseName} Cancel listening device event success, ifInputDeviceOffSuccess: ${JSON.stringify(ifInputDeviceOffSuccess)}`);
        ifInputDeviceOffSuccess++;  
        ExpectTrue(ifInputDeviceOffSuccess == 1);
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
    it("SUB_MMI_Input_Api_IptDev_off_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_off_0200";
      let ifInputDeviceOffSuccess = 0;
      const callback = (data: inputDevice.DeviceListener) => {
        console.info(`${caseName} Report device event info: ${JSON.stringify(data, [`type`, `deviceId`])}`);
      };
      try {
        inputDevice.off("change");
        ifInputDeviceOffSuccess++;
        ExpectTrue(ifInputDeviceOffSuccess == 1);
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
    it("SUB_MMI_Input_Api_IptDev_getDeviceIds_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_getDeviceIds_0100";
      try {
        inputDevice.getDeviceIds((error: Error, ids: Array<Number>) => {
          if (error) {
            console.info(`${caseName} Failed to get device id list, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectFalse(true);
            done();
          } else {
            console.info(`${caseName} Device id list: ${JSON.stringify(ids)}`);
            ExpectTrue(Array.isArray(ids));
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
    it("SUB_MMI_Input_Api_IptDev_getDeviceIds_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_getDeviceIds_0200";
      try {
        inputDevice.getDeviceIds().then((ids: Array<Number>) => {
          console.info(`${caseName} Device id list: ${JSON.stringify(ids)}`);
          ExpectTrue(Array.isArray(ids));
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
    it("SUB_MMI_Input_Api_IptDev_getDevice_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_getDevice_0100";
      try {
        inputDevice.getDevice(1, (error: Error, deviceData: inputDevice.InputDeviceData) => {
          if (error) {
            console.info(`${caseName} Failed to get device info, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectFalse(true);
            done();
          } else {
            console.info(`${caseName} Device info: ${JSON.stringify(deviceData)}`);
            ExpectTrue(typeof(deviceData) == 'object');
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
    it("SUB_MMI_Input_Api_IptDev_getDevice_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_getDevice_0200";
      try {
        inputDevice.getDevice(1).then((deviceData: inputDevice.InputDeviceData) => {
          console.info(`${caseName} Device info: ${JSON.stringify(deviceData)}`);
          ExpectTrue(typeof(deviceData) == 'object');
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
    it("SUB_MMI_Input_Api_IptDev_supportKeys_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_supportKeys_0100";
      try {
        inputDevice.supportKeys(1, [17, 22, 2055], (error: Error, supportResult: Array<Boolean>) => {
          console.info(`${caseName} Query result: ${JSON.stringify(supportResult)}`);
          ExpectTrue(Array.isArray(supportResult));
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
    it("SUB_MMI_Input_Api_IptDev_supportKeys_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_supportKeys_0200";
      try {
        inputDevice.supportKeys(1, [17, 22, 2055]).then((supportResult: Array<Boolean>) => {
          console.info(`${caseName} Query result: ${JSON.stringify(supportResult)}`);
          ExpectTrue(Array.isArray(supportResult));
          done();
        });
      } catch (error) {
        console.info(`${caseName} Query failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_supportKeys_0300
     * @tc.name: SUB_MMI_Input_Api_IptDev_supportKeys_0300
     * @tc.desc: Test promise supportKeys interface to set null value.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_supportKeys_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_supportKeys_0300";
      try {
        inputDevice.supportKeys(null, [17, 22, 2055]).then((supportResult: Array<Boolean>) => {
          console.info(`${caseName} Query result: ${JSON.stringify(supportResult)}`);
          ExpectFalse(true);
          done();
        });
      } catch (error) {
        console.info(`${caseName} Query failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectTrue(error.code == 401);
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
    it("SUB_MMI_Input_Api_IptDev_supportKeysSync_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_supportKeysSync_0100";
      try {
        let supportResult: Array<Boolean> = inputDevice.supportKeysSync(1, [17, 22, 2055]);
        console.info(`${caseName} Query result: ${JSON.stringify(supportResult)}`);
        ExpectTrue(Array.isArray(supportResult));
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
    it("SUB_MMI_Input_Api_IptDev_getKeyboardType_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_getKeyboardType_0100";
      try {
        inputDevice.getKeyboardType(1, (error: Error, type: Number) => {
          if (error) {
            console.info(`${caseName} Failed to get keyboard type, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectFalse(true);
            done();
          } else {
            console.info(`${caseName} Keyboard type: ${JSON.stringify(type)}`);
            ExpectTrue(type>=0 && type<=5);
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
    it("SUB_MMI_Input_Api_IptDev_getKeyboardType_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_getKeyboardType_0200";
      try {
        inputDevice.getKeyboardType(1).then((type: Number) => {
          console.info(`${caseName} Keyboard type: ${JSON.stringify(type)}`);
          ExpectTrue(type>=0 && type<=5);
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
    it("SUB_MMI_Input_Api_IptDev_getKeyboardTypeSync_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_getKeyboardTypeSync_0100";
      try {
        let type: number = inputDevice.getKeyboardTypeSync(1);
        console.info(`${caseName} Keyboard type: ${JSON.stringify(type)}`);
        ExpectTrue(type>=0 && type<=5);
        done();
      } catch (error) {
        console.info(`${caseName} Failed to get keyboard type, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_getKeyboardTypeSync_0200
     * @tc.name: SUB_MMI_Input_Api_IptDev_getKeyboardTypeSync_0200
     * @tc.desc: Test getKeyboardTypeSync interface invalid input parameter
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_getKeyboardTypeSync_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_getKeyboardTypeSync_0200";
      try {
        let type: number = inputDevice.getKeyboardTypeSync(undefined);
        ExpectFalse(true);
        done();
      } catch (error) {
        console.info(`${caseName} Failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectTrue(error.code == 401);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_getAllSystemHotkeys_0100
     * @tc.name: SUB_MMI_Input_Api_IptDev_getAllSystemHotkeys_0100
     * @tc.desc: Test promise getAllSystemHotkeys interface to get all the system hotkeys.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_getAllSystemHotkeys_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_getAllSystemHotkeys_0100";
      try {
        inputConsumer.getAllSystemHotkeys().then((data: Array<inputConsumer.HotkeyOptions>) => {
          console.info(`${caseName} list of system hotkeys: ${JSON.stringify(data)}`);
          ExpectTrue(data.length >= 0);
          done();
        });
      } catch (error) {
        console.info(`${caseName} failed to get system hotkeys, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectTrue(error.code == 801);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_getIntervalSinceLastInput_0100
     * @tc.name: SUB_MMI_Input_Api_IptDev_getIntervalSinceLastInput_0100
     * @tc.desc: Test promise getIntervalSinceLastInput interface to get the time interval since the last system input event.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_getIntervalSinceLastInput_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_getIntervalSinceLastInput_0100";
      try {
        inputDevice.getIntervalSinceLastInput().then((timeInterval: number) => {
          console.info(`${caseName} interval since last input: ${JSON.stringify(timeInterval)}`);
          ExpectTrue(timeInterval > 0);
          done();
        });
      } catch (error) {
        console.info(`${caseName} failed to get interval since last input, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_isFunctionKeyEnabled_0100
     * @tc.name: SUB_MMI_Input_Api_IptDev_isFunctionKeyEnabled_0100
     * @tc.desc: Test promise isFunctionKeyEnabled interface to set error FunctionKey(10000).
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_isFunctionKeyEnabled_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_isFunctionKeyEnabled_0100";
      try {
        await inputDevice.isFunctionKeyEnabled(10000).then((state1: boolean) => {
          console.info(`${caseName} capslock state1: ${JSON.stringify(state1)}`);
          ExpectFalse(true);
          done();
        });
      } catch (error) {
        console.info(`${caseName} failed to get capslock state, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectTrue(error.code == 401);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_isFunctionKeyEnabled_0200
     * @tc.name: SUB_MMI_Input_Api_IptDev_isFunctionKeyEnabled_0200
     * @tc.desc: Test promise isFunctionKeyEnabled interface to set error FunctionKey(-1).
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_isFunctionKeyEnabled_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_isFunctionKeyEnabled_0200";
      try {
        await inputDevice.isFunctionKeyEnabled(-1).then((state1: boolean) => {
          console.info(`${caseName} capslock state1: ${JSON.stringify(state1)}`);
          ExpectFalse(true);
          done();
        });
      } catch (error) {
        console.info(`${caseName} failed to get capslock state, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectTrue(error.code == 401);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_isFunctionKeyEnabled_0300
     * @tc.name: SUB_MMI_Input_Api_IptDev_isFunctionKeyEnabled_0300
     * @tc.desc: Test promise isFunctionKeyEnabled interface to unconnect keyboard device.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_isFunctionKeyEnabled_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_isFunctionKeyEnabled_0300";
      try {
        let CAPS_LOCK = inputDevice.FunctionKey.CAPS_LOCK;
        console.info(`${caseName} CAPS_LOCK: ${JSON.stringify(CAPS_LOCK)}`);
        ExpectTrue(CAPS_LOCK == 1);
        await inputDevice.isFunctionKeyEnabled(CAPS_LOCK).then((state1) => {
          console.info(`${caseName} capslock state1: ${JSON.stringify(state1)}`);
          ExpectTrue(Number(state1) == 0 || Number(state1) == 1);
          done();
        });
      } catch (error) {
        console.info(`${caseName} failed to get capslock state, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectTrue(error.code == 3900002);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_on_0100
     * @tc.name: SUB_MMI_Input_Api_IptDev_on_0100
     * @tc.desc: Test callback on and off interfaces to cancel the hot swap event for the specified input device.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_on_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_on_0100";
      try {
        const callback = null;
        inputDevice.on("change", callback);
        ExpectFalse(true);
        done();
      } catch (error) {
        console.info(`${caseName} Get device info failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectTrue(error.code == 401);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_off_0200
     * @tc.name: SUB_MMI_Input_Api_IptDev_off_0200
     * @tc.desc: Test callback on and off interfaces to cancel the hot swap event for the specified input device.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_off_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_off_0200";
      try {
        const callback = null;
        inputDevice.off("change", callback);
        ExpectFalse(true);
        done();
      } catch (error) {
        console.info(`${caseName} Cancel listening device event failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectTrue(error.code == 401);
        done();
      }
    });
  });
}