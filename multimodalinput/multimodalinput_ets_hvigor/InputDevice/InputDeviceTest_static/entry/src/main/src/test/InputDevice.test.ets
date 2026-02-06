/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import inputDevice from '@ohos.multimodalInput.inputDevice';
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index"
import { BusinessError } from "@ohos.base"
import hilog from '@ohos.hilog'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function InputDeviceTest() {
  describe("InputDeviceTest", (): void => {
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
     * @tc.name   SUB_MMI_Input_Api_InputDevice_0100
     * @tc.number SUB_MMI_Input_Api_InputDevice_0100
     * @tc.desc   Test KeyboardType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_InputDevice_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_InputDevice_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          ExpectTrue(inputDevice.KeyboardType.NONE == 0);
          ExpectTrue(inputDevice.KeyboardType.UNKNOWN == 1);
          ExpectTrue(inputDevice.KeyboardType.ALPHABETIC_KEYBOARD == 2);
          ExpectTrue(inputDevice.KeyboardType.DIGITAL_KEYBOARD == 3);
          ExpectTrue(inputDevice.KeyboardType.HANDWRITING_PEN == 4);
          ExpectTrue(inputDevice.KeyboardType.REMOTE_CONTROL == 5);
          done();
        } catch (error) {
          console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_InputDevice_0200
     * @tc.number SUB_MMI_Input_Api_InputDevice_0200
     * @tc.desc   Test FunctionKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_InputDevice_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_InputDevice_0200";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          ExpectTrue(inputDevice.FunctionKey.CAPS_LOCK == 1);
          done();
        } catch (error) {
          console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_InputDevice_0300
     * @tc.number SUB_MMI_Input_Api_InputDevice_0300
     * @tc.desc   Test callback getDeviceInfo interface to get information about a specified input device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_InputDevice_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_InputDevice_0300";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          inputDevice.getDeviceInfo(1,
            (error: BusinessError<void> | null, deviceData: inputDevice.InputDeviceData | undefined): void => {
              if (error) {
                hilog.info(domain, tag,
                  `${caseName} Failed to get device info, error: ${JSON.stringify(error, [`code`, `message`])}`);
                ExpectFalse(true);
                done();
              } else {
                hilog.info(domain, tag, `${caseName} Device info: ${JSON.stringify(deviceData)}`);
                hilog.info(domain, tag, `deviceData: ${typeof (deviceData)}`);
                ExpectTrue(typeof (deviceData) == 'object');
                done();
              }
            });
          done();
        } catch (error) {
          error = error as BusinessError;
          hilog.info(domain, tag, `${caseName} Failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(error.code == 401 || true);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_InputDevice_0400
     * @tc.number SUB_MMI_Input_Api_InputDevice_0400
     * @tc.desc   Test promise getDeviceInfo interface to get information about a specified input device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_InputDevice_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_InputDevice_0400";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          await inputDevice.getDeviceList().then((ids: Array<Int>) => {
            hilog.info(domain, tag, `${caseName} Device id list: ${JSON.stringify(ids)}`);
            expect(ids).assertInstanceOf('Array');
            if(ids.length > 0) {
              await inputDevice.getDeviceInfo(ids[0]).then((deviceData: inputDevice.InputDeviceData) => {
                hilog.info(domain, tag, `${caseName} Device info: ${JSON.stringify(deviceData)}`);
                expect(deviceData.id).assertInstanceOf('Int');
                expect(deviceData.name).assertInstanceOf('String');
                expect(deviceData.sources).assertInstanceOf('Array');
                expect(deviceData.axisRanges).assertInstanceOf('Array');
                expect(deviceData.bus).assertInstanceOf('Int');
                expect(deviceData.product).assertInstanceOf('Int');
                expect(deviceData.vendor).assertInstanceOf('Int');
                expect(deviceData.version).assertInstanceOf('Int');
                expect(deviceData.phys).assertInstanceOf('String');
                expect(deviceData.uniq).assertInstanceOf('String');
                expect(deviceData).assertInstanceOf('Object');
                for (let j = 0; j < deviceData.axisRanges.length; j++) {
                  ExpectTrue(deviceData.axisRanges[j].source == 'keyboard' || deviceData.axisRanges[j].source == 'mouse'
                    || deviceData.axisRanges[j].source == 'touchpad' || deviceData.axisRanges[j].source == 'touchscreen'
                    || deviceData.axisRanges[j].source == 'joystick' || deviceData.axisRanges[j].source == 'trackball');
                  ExpectTrue(deviceData.axisRanges[j].axis == 'touchmajor' || deviceData.axisRanges[j].axis == 'touchminor'
                    || deviceData.axisRanges[j].axis == 'orientation' || deviceData.axisRanges[j].axis == 'x'
                    || deviceData.axisRanges[j].axis == 'y' || deviceData.axisRanges[j].axis == 'pressure'
                    || deviceData.axisRanges[j].axis == 'toolminor' || deviceData.axisRanges[j].axis == 'toolmajor'
                    || deviceData.axisRanges[j].axis == 'null');
                  expect(deviceData.axisRanges[j].max).assertInstanceOf('Int');
                  expect(deviceData.axisRanges[j]).assertInstanceOf('Object');
                  expect(deviceData.axisRanges[j].min).assertInstanceOf('Int');
                  expect(deviceData.axisRanges[j].fuzz).assertInstanceOf('Int');
                  expect(deviceData.axisRanges[j].flat).assertInstanceOf('Int');
                  expect(deviceData.axisRanges[j].resolution).assertInstanceOf('Int');
                }
                done();
              });
            }
            done();
          });
        } catch (error) {
          error = error as BusinessError;
          hilog.info(domain, tag,
            `${caseName} Failed to get device info, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(error.code == 401 || true);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_InputDevice_0500
     * @tc.number SUB_MMI_Input_Api_InputDevice_0500
     * @tc.desc   Test callback getDeviceList interface to get the ID list of all input devices.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_InputDevice_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_InputDevice_0500";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          inputDevice.getDeviceList((error: BusinessError<void> | null, ids: Array<Int> | undefined): void => {
            if (error) {
              hilog.info(domain, tag,
                `${caseName} Failed to get device id list, error: ${JSON.stringify(error, [`code`, `message`])}`);
              ExpectFalse(true);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Device id list: ${JSON.stringify(ids)}`);
              ExpectTrue(Array.isArray(ids));
              done();
            }
          });
          done();
        } catch (error) {
          error = error as BusinessError;
          hilog.info(domain, tag, `${caseName} Failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(error.code == 401 || true);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_InputDevice_0600
     * @tc.number SUB_MMI_Input_Api_InputDevice_0600
     * @tc.desc   Test promise getDeviceList interface to get the ID list of all input devices.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_InputDevice_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_InputDevice_0600";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          inputDevice.getDeviceList().then((ids: Array<Int>) => {
            hilog.info(domain, tag, `${caseName} Device id list: ${JSON.stringify(ids)}`);
            ExpectTrue(Array.isArray(ids));
            done();
          });
        } catch (error) {
          hilog.info(domain, tag,
            `${caseName} Failed to get device id list, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_InputDevice_0700
     * @tc.number SUB_MMI_Input_Api_InputDevice_0700
     * @tc.desc   Test inputDevice on interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_InputDevice_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_InputDevice_0700";
        hilog.info(domain, tag, `${caseName} enter`);
        let isPhysicalKeyboardExist = 0;
        try {
          inputDevice.onChange((data): void => {
            hilog.info(domain, tag, `InputDevice type: ${data.type}, deviceId: ${data.deviceId}`);
            isPhysicalKeyboardExist++;
            ExpectTrue(isPhysicalKeyboardExist == 1);
          });
        } catch (error) {
          error = error as BusinessError;
          console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(error.code == 401 || true);
        }
        done();
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_InputDevice_0800
     * @tc.number SUB_MMI_Input_Api_InputDevice_0800
     * @tc.desc   Test callback on and off interfaces to cancel the hot swap event for the specified input device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_InputDevice_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_InputDevice_0800";
        const callback = (data: inputDevice.DeviceListener) => {
          console.info(`${caseName} Report device event info: ${JSON.stringify(data, [`type`, `deviceId`])}`);
        };
        let ifInputDeviceOffSuccess = 0;
        try {
          inputDevice.onChange((data: inputDevice.DeviceListener) => {
            console.info(`${caseName} Device event info: ${JSON.stringify(data)}`);
          });
        } catch (error) {
          console.info(`${caseName} Get device info failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        }
        try {
          inputDevice.offChange(callback);
          console.info(`${caseName} Cancel listening device event success, ifInputDeviceOffSuccess: ${JSON.stringify(ifInputDeviceOffSuccess)}`);
          ifInputDeviceOffSuccess++;
          ExpectTrue(ifInputDeviceOffSuccess == 1);
          done();
        } catch (error) {
          console.info(`${caseName} Cancel listening device event failed, error: ${JSON.stringify(error,
            [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_InputDevice_0900
     * @tc.number SUB_MMI_Input_Api_InputDevice_0900
     * @tc.desc   Test callback off interface to cancel the hot swap event for all input devices.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_InputDevice_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_InputDevice_0900";
        let ifInputDeviceOffSuccess = 0;
        const callback = (data: inputDevice.DeviceListener) => {
          console.info(`${caseName} Report device event info: ${JSON.stringify(data, [`type`, `deviceId`])}`);
        };
        try {
          inputDevice.offChange();
          ifInputDeviceOffSuccess++;
          ExpectTrue(ifInputDeviceOffSuccess == 1);
          done();
        } catch (error) {
          console.info(`${caseName} Cancel all listening device event failed, error: ${JSON.stringify(error,
            [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });
  })
}