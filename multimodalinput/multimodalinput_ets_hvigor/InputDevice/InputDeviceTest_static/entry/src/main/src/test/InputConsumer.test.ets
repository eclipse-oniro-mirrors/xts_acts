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

import inputConsumer from '@ohos.multimodalInput.inputConsumer';
import { KeyEvent } from '@ohos.multimodalInput.keyEvent';
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from "@ohos.base";
import hilog from '@ohos.hilog';

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function InputConsumerTest() {
  describe("InputConsumerTest", () => {
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
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOn_0100
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOn_0100
     * @tc.desc   Test callback inputConsumer.on interface to subscribe Left_Alt + Z.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_0100";
        try {
          let hotkeyOptions: inputConsumer.HotkeyOptions = {
            preKeys: [2045],
            finalKey: 2042,
            isRepeat: true
          };
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          let ifInputConsumerOnSuccess = 0;
          try {
            inputConsumer.onHotkeyChange(hotkeyOptions, hotkeyCallback);
            console.info(`${caseName} success`);
            ifInputConsumerOnSuccess++;
            ExpectTrue(ifInputConsumerOnSuccess == 1);
            inputConsumer.offHotkeyChange(hotkeyOptions, hotkeyCallback);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} Subscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectTrue(error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to subscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });


    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOn_0200
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOn_0200
     * @tc.desc   Test callback inputConsumer.on interface to subscribe Left_Ctrl + Left_Alt + D + C.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_0200";
        try {
          let hotkeyOptions: inputConsumer.HotkeyOptions = {
            preKeys: [2072, 2045, 2020],
            finalKey: 2019,
            isRepeat: true
          };
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          try {
            inputConsumer.onHotkeyChange(hotkeyOptions, hotkeyCallback);
            console.info(`${caseName} success`);
            ExpectFalse(true);
            inputConsumer.offHotkeyChange(hotkeyOptions, hotkeyCallback);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} Subscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectTrue(error.code == 401 || error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to subscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOn_0300
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOn_0300
     * @tc.desc   Test callback inputConsumer.on interface to subscribe Left_Ctrl + Left_Alt + D + 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_0300";
        try {
          let hotkeyOptions: inputConsumer.HotkeyOptions = {
            preKeys: [2072, 2045, 2020],
            finalKey: 2009,
            isRepeat: true
          };
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          try {
            inputConsumer.onHotkeyChange(hotkeyOptions, hotkeyCallback);
            console.info(`${caseName} success`);
            ExpectFalse(true);
            inputConsumer.offHotkeyChange(hotkeyOptions, hotkeyCallback);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} Subscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectTrue(error.code == 401 || error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to subscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOn_0400
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOn_0400
     * @tc.desc   Test callback inputConsumer.on interface to subscribe 9 + D.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_0400";
        try {
          let hotkeyOptions: inputConsumer.HotkeyOptions = {
            preKeys: [2009],
            finalKey: 2020,
            isRepeat: true
          };
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          try {
            inputConsumer.onHotkeyChange(hotkeyOptions, hotkeyCallback);
            console.info(`${caseName} success`);
            ExpectFalse(true);
            inputConsumer.offHotkeyChange(hotkeyOptions, hotkeyCallback);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} Subscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectTrue(error.code == 401 || error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} fail to subscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOn_0500
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOn_0500
     * @tc.desc   Test callback inputConsumer.on interface to subscribe F + D.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_0500";
        try {
          let hotkeyOptions: inputConsumer.HotkeyOptions = {
            preKeys: [2022],
            finalKey: 2020,
            isRepeat: true
          };
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          try {
            inputConsumer.onHotkeyChange(hotkeyOptions, hotkeyCallback);
            console.info(`${caseName} success`);
            ExpectFalse(true);
            inputConsumer.offHotkeyChange(hotkeyOptions, hotkeyCallback);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} Subscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectTrue(error.code == 401 || error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to subscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOn_0600
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOn_0600
     * @tc.desc   Test callback inputConsumer.on interface to subscribe Left_Ctrl + Meta.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_0600";
        try {
          let hotkeyOptions: inputConsumer.HotkeyOptions = {
            preKeys: [2072],
            finalKey: 2076,
            isRepeat: true
          };
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          try {
            inputConsumer.onHotkeyChange(hotkeyOptions, hotkeyCallback);
            console.info(`${caseName} success`);
            ExpectFalse(true);
            inputConsumer.offHotkeyChange(hotkeyOptions, hotkeyCallback);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} Subscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectTrue(error.code == 401 || error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to subscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOn_0700
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOn_0700
     * @tc.desc   Test callback inputConsumer.on interface to subscribe Left_Ctrl + Right_Ctrl.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_0700";
        try {
          let hotkeyOptions: inputConsumer.HotkeyOptions = {
            preKeys: [2072],
            finalKey: 2073,
            isRepeat: true
          };
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          try {
            inputConsumer.onHotkeyChange(hotkeyOptions, hotkeyCallback);
            console.info(`${caseName} success`);
            ExpectFalse(true);
            inputConsumer.offHotkeyChange(hotkeyOptions, hotkeyCallback);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} Subscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectTrue(error.code == 401 || error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to subscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOn_0800
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOn_0800
     * @tc.desc   Test callback inputConsumer.on interface to subscribe Left_Alt + Z again.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_0800";
        try {
          let hotkeyOptions: inputConsumer.HotkeyOptions = {
            preKeys: [2045],
            finalKey: 2042,
            isRepeat: true
          };
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          try {
            inputConsumer.onHotkeyChange(hotkeyOptions, hotkeyCallback);
            inputConsumer.onHotkeyChange(hotkeyOptions, hotkeyCallback);
            console.info(`${caseName} success`);
            ExpectFalse(true);
            inputConsumer.offHotkeyChange(hotkeyOptions, hotkeyCallback);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} Subscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectTrue(error.code == 401 || error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to subscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOn_0900
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOn_0900
     * @tc.desc   Test callback inputConsumer.on interface to subscribe a nonexistent preKeys.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_0900";
        try {
          let hotkeyOptions: inputConsumer.HotkeyOptions = {
            preKeys: [8856],
            finalKey: 2042,
            isRepeat: true
          };
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          try {
            inputConsumer.onHotkeyChange(hotkeyOptions, hotkeyCallback);
            console.info(`${caseName} success`);
            ExpectFalse(true);
            inputConsumer.offHotkeyChange(hotkeyOptions, hotkeyCallback);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} Subscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectTrue(error.code == 401 || error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to subscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOn_1000
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOn_1000
     * @tc.desc   Test callback inputConsumer.on interface to subscribe a nonexistent finalKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_1000";
        try {
          let hotkeyOptions: inputConsumer.HotkeyOptions = {
            preKeys: [2045],
            finalKey: 8236,
            isRepeat: true
          };
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          let ifInputConsumerOnSuccess = 0;
          try {
            inputConsumer.onHotkeyChange(hotkeyOptions, hotkeyCallback);
            console.info(`${caseName} success`);
            ifInputConsumerOnSuccess++;
            ExpectTrue(ifInputConsumerOnSuccess == 1);
            inputConsumer.offHotkeyChange(hotkeyOptions, hotkeyCallback);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} Subscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectTrue(error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to subscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOn_1100
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOn_1100
     * @tc.desc   Test callback inputConsumer.on interface to subscribe Left_Alt + Tab.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_1100";
        try {
          let hotkeyOptions: inputConsumer.HotkeyOptions = {
            preKeys: [2045],
            finalKey: 2049,
            isRepeat: true
          };
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          try {
            inputConsumer.onHotkeyChange(hotkeyOptions, hotkeyCallback);
            console.info(`${caseName} success`);
            ExpectFalse(true);
            inputConsumer.offHotkeyChange(hotkeyOptions, hotkeyCallback);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} Subscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectTrue(error.code == 4200003 || error.code == 4200002 || error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to subscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOff_0100
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOff_0100
     * @tc.desc   Test callback inputConsumer.off interface to unsubscribe Left_Alt + Z.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_0100";
        try {
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          let hotkeyOption: inputConsumer.HotkeyOptions = {
            preKeys: [2045],
            finalKey: 2042,
            isRepeat: true
          };
          let ifInputConsumerOffSuccess = 0;
          try {
            inputConsumer.onHotkeyChange(hotkeyOption, hotkeyCallback);
            inputConsumer.offHotkeyChange(hotkeyOption, hotkeyCallback);
            console.info(`${caseName} unsubscribe success`);
            ifInputConsumerOffSuccess++;
            ExpectTrue(ifInputConsumerOffSuccess == 1);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectTrue(error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOff_0200
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOff_0200
     * @tc.desc   Test callback inputConsumer.off interface to unsubscribe from the combination keys subscribed by all the callback functions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_0200";
        try {
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          let hotkeyOption: inputConsumer.HotkeyOptions = {
            preKeys: [2045],
            finalKey: 2042,
            isRepeat: true
          };
          let ifInputConsumerOffSuccess = 0;
          try {
            inputConsumer.onHotkeyChange(hotkeyOption, hotkeyCallback);
            inputConsumer.offHotkeyChange(hotkeyOption);
            console.info(`${caseName} unsubscribe success`);
            ifInputConsumerOffSuccess++;
            ExpectTrue(ifInputConsumerOffSuccess == 1);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectTrue(error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOff_0300
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOff_0300
     * @tc.desc   Test callback inputConsumer.on and off interface to unsubscribe Left_Ctrl + Z.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_0300";
        try {
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          let hotkeyOption: inputConsumer.HotkeyOptions = {
            preKeys: [2072],
            finalKey: 2042,
            isRepeat: true
          };
          let ifInputConsumerOffSuccess = 0;
          try {
            inputConsumer.onHotkeyChange(hotkeyOption, hotkeyCallback);
            inputConsumer.offHotkeyChange(hotkeyOption, hotkeyCallback);
            console.info(`${caseName} unsubscribe success`);
            ifInputConsumerOffSuccess++;
            ExpectTrue(ifInputConsumerOffSuccess == 1);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectTrue(error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOff_0400
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOff_0400
     * @tc.desc   Test callback inputConsumer.on and off interface to unsubscribe Left_Ctrl + Left_Alt + Z.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_0400";
        try {
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          let hotkeyOption: inputConsumer.HotkeyOptions = {
            preKeys: [2072, 2045],
            finalKey: 2042,
            isRepeat: true
          };
          let ifInputConsumerOffSuccess = 0;
          try {
            inputConsumer.onHotkeyChange(hotkeyOption, hotkeyCallback);
            inputConsumer.offHotkeyChange(hotkeyOption, hotkeyCallback);
            console.info(`${caseName} unsubscribe success`);
            ifInputConsumerOffSuccess++;
            ExpectTrue(ifInputConsumerOffSuccess == 1);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectTrue(error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOff_0500
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOff_0500
     * @tc.desc   Test callback inputConsumer.on and off interface to unsubscribe Left_Shift + Left_Alt + Z.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_0500";
        try {
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          let hotkeyOption: inputConsumer.HotkeyOptions = {
            preKeys: [2047, 2045],
            finalKey: 2042,
            isRepeat: true
          };
          let ifInputConsumerOffSuccess = 0;
          try {
            inputConsumer.onHotkeyChange(hotkeyOption, hotkeyCallback);
            inputConsumer.offHotkeyChange(hotkeyOption, hotkeyCallback);
            console.info(`${caseName} unsubscribe success`);
            ifInputConsumerOffSuccess++;
            ExpectTrue(ifInputConsumerOffSuccess == 1);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectTrue(error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOff_0600
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOff_0600
     * @tc.desc   Test callback inputConsumer.on and off interface to unsubscribe Left_Shift + C.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_0600";
        try {
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          let hotkeyOption: inputConsumer.HotkeyOptions = {
            preKeys: [2047],
            finalKey: 2019,
            isRepeat: true
          };
          let ifInputConsumerOffSuccess = 0;
          try {
            inputConsumer.onHotkeyChange(hotkeyOption, hotkeyCallback);
            inputConsumer.offHotkeyChange(hotkeyOption, hotkeyCallback);
            console.info(`${caseName} unsubscribe success`);
            ifInputConsumerOffSuccess++;
            ExpectTrue(ifInputConsumerOffSuccess == 1);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectTrue(error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOff_0700
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOff_0700
     * @tc.desc   Test callback inputConsumer.on and off interface to unsubscribe Left_Ctrl + 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_0700";
        try {
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          let hotkeyOption: inputConsumer.HotkeyOptions = {
            preKeys: [2072],
            finalKey: 2009,
            isRepeat: true
          };
          let ifInputConsumerOffSuccess = 0;
          try {
            inputConsumer.onHotkeyChange(hotkeyOption, hotkeyCallback);
            inputConsumer.offHotkeyChange(hotkeyOption, hotkeyCallback);
            console.info(`${caseName} unsubscribe success`);
            ifInputConsumerOffSuccess++;
            ExpectTrue(ifInputConsumerOffSuccess == 1);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectTrue(error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOff_0800
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOff_0800
     * @tc.desc   Test callback inputConsumer.on and off interface to unsubscribe Left_Ctrl + ↑.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_0800";
        try {
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          let hotkeyOption: inputConsumer.HotkeyOptions = {
            preKeys: [2072],
            finalKey: 2012,
            isRepeat: true
          };
          let ifInputConsumerOffSuccess = 0;
          try {
            inputConsumer.onHotkeyChange(hotkeyOption, hotkeyCallback);
            inputConsumer.offHotkeyChange(hotkeyOption, hotkeyCallback);
            console.info(`${caseName} unsubscribe success`);
            ifInputConsumerOffSuccess++;
            ExpectTrue(ifInputConsumerOffSuccess == 1);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectTrue(error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOff_0900
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOff_0900
     * @tc.desc   Test callback inputConsumer.on and off interface to unsubscribe Left_Ctrl + ←.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_0900";
        try {
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          let hotkeyOption: inputConsumer.HotkeyOptions = {
            preKeys: [2072],
            finalKey: 2014,
            isRepeat: true
          };
          let ifInputConsumerOffSuccess = 0;
          try {
            inputConsumer.onHotkeyChange(hotkeyOption, hotkeyCallback);
            inputConsumer.offHotkeyChange(hotkeyOption, hotkeyCallback);
            console.info(`${caseName} unsubscribe success`);
            ifInputConsumerOffSuccess++;
            ExpectTrue(ifInputConsumerOffSuccess == 1);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectTrue(error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOff_1000
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOff_1000
     * @tc.desc   Test callback inputConsumer.on and off interface to unsubscribe Left_Ctrl + F1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_1000";
        try {
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          let hotkeyOption: inputConsumer.HotkeyOptions = {
            preKeys: [2072],
            finalKey: 2090,
            isRepeat: true
          };
          let ifInputConsumerOffSuccess = 0;
          try {
            inputConsumer.onHotkeyChange(hotkeyOption, hotkeyCallback);
            inputConsumer.offHotkeyChange(hotkeyOption, hotkeyCallback);
            console.info(`${caseName} unsubscribe success`);
            ifInputConsumerOffSuccess++;
            ExpectTrue(ifInputConsumerOffSuccess == 1);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectTrue(error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOff_1100
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOff_1100
     * @tc.desc   Test callback inputConsumer.on and off interface to unsubscribe Left_Ctrl + Home.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_1100";
        try {
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          let hotkeyOption: inputConsumer.HotkeyOptions = {
            preKeys: [2072],
            finalKey: 2081,
            isRepeat: true
          };
          let ifInputConsumerOffSuccess = 0;
          try {
            inputConsumer.onHotkeyChange(hotkeyOption, hotkeyCallback);
            inputConsumer.offHotkeyChange(hotkeyOption, hotkeyCallback);
            console.info(`${caseName} unsubscribe success`);
            ifInputConsumerOffSuccess++;
            ExpectTrue(ifInputConsumerOffSuccess == 1);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectTrue(error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOff_1200
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOff_1200
     * @tc.desc   Test callback inputConsumer.on and off interface to unsubscribe Left_Ctrl + Enter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_1200";
        try {
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          let hotkeyOption: inputConsumer.HotkeyOptions = {
            preKeys: [2072],
            finalKey: 2054,
            isRepeat: true
          };
          let ifInputConsumerOffSuccess = 0;
          try {
            inputConsumer.onHotkeyChange(hotkeyOption, hotkeyCallback);
            inputConsumer.offHotkeyChange(hotkeyOption, hotkeyCallback);
            console.info(`${caseName} unsubscribe success`);
            ifInputConsumerOffSuccess++;
            ExpectTrue(ifInputConsumerOffSuccess == 1);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectTrue(error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOff_1300
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOff_1300
     * @tc.desc   Test callback inputConsumer.on and off interface to unsubscribe Left_Ctrl + P.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_1300";
        try {
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          let hotkeyOption: inputConsumer.HotkeyOptions = {
            preKeys: [2072],
            finalKey: 2032,
            isRepeat: true
          };
          let ifInputConsumerOffSuccess = 0;
          try {
            inputConsumer.offHotkeyChange(hotkeyOption, hotkeyCallback);
            console.info(`${caseName} unsubscribe success`);
            ifInputConsumerOffSuccess++;
            ExpectTrue(ifInputConsumerOffSuccess == 1);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectTrue(error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOff_1400
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOff_1400
     * @tc.desc   Test callback inputConsumer.on and off interface to unsubscribe Left_Ctrl + Scroll Lock.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_1400";
        try {
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          let hotkeyOption: inputConsumer.HotkeyOptions = {
            preKeys: [2072],
            finalKey: 2075,
            isRepeat: true
          };
          let ifInputConsumerOffSuccess = 0;
          try {
            inputConsumer.onHotkeyChange(hotkeyOption, hotkeyCallback);
            inputConsumer.offHotkeyChange(hotkeyOption, hotkeyCallback);
            console.info(`${caseName} unsubscribe success`);
            ifInputConsumerOffSuccess++;
            ExpectTrue(ifInputConsumerOffSuccess == 1);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectTrue(error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOff_1500
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOff_1500
     * @tc.desc   Test callback inputConsumer.on and off interface to unsubscribe Left_Ctrl + Table.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_1500";
        try {
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          let hotkeyOption: inputConsumer.HotkeyOptions = {
            preKeys: [2072],
            finalKey: 2049,
            isRepeat: true
          };
          let ifInputConsumerOffSuccess = 0;
          try {
            inputConsumer.onHotkeyChange(hotkeyOption, hotkeyCallback);
            inputConsumer.offHotkeyChange(hotkeyOption, hotkeyCallback);
            console.info(`${caseName} unsubscribe success`);
            ifInputConsumerOffSuccess++;
            ExpectTrue(ifInputConsumerOffSuccess == 1);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectTrue(error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOff_1600
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOff_1600
     * @tc.desc   Test callback inputConsumer.on and off interface to unsubscribe a nonexistent preKeys.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_1600";
        try {
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          let hotkeyOption: inputConsumer.HotkeyOptions = {
            preKeys: [2045, 4562],
            finalKey: 2049,
            isRepeat: true
          };
          try {
            inputConsumer.onHotkeyChange(hotkeyOption, hotkeyCallback);
            inputConsumer.offHotkeyChange(hotkeyOption, hotkeyCallback);
            console.info(`${caseName} unsubscribe success`);
            ExpectFalse(true);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectTrue(error.code == 401 || error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOff_1700
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOff_1700
     * @tc.desc   Test callback inputConsumer.on and off interface to unsubscribe a nonexistent finalKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_1700";
        try {
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          let hotkeyOption: inputConsumer.HotkeyOptions = {
            preKeys: [2045],
            finalKey: 99999,
            isRepeat: true
          };
          let ifInputConsumerOffSuccess = 0;
          try {
            inputConsumer.onHotkeyChange(hotkeyOption, hotkeyCallback);
            inputConsumer.offHotkeyChange(hotkeyOption, hotkeyCallback);
            console.info(`${caseName} unsubscribe success`);
            ifInputConsumerOffSuccess++;
            ExpectTrue(ifInputConsumerOffSuccess == 1);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectTrue(error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOn_1200
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOn_1200
     * @tc.desc   Test callback inputConsumer.on and off interface to subscribe and unsubscribe volume+&down&repeatTrue listening.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_1200";
        try {
          let options: inputConsumer.KeyPressedConfig = {
            key: 16,
            action: 1,
            isRepeat: true
          }
          let callback = (event: KeyEvent) => {
            console.info(`${caseName} KeyEvent is: ${JSON.stringify(event)}`);
          }
          let ifInputConsumerOnSuccess = 0;
          try {
            inputConsumer.offKeyPressed();
            inputConsumer.onKeyPressed(options, callback);
            inputConsumer.offKeyPressed(callback);
            inputConsumer.offKeyPressed();
            ifInputConsumerOnSuccess++;
            console.info(`${caseName} subscribe and unsubscribe success.`);
            ExpectTrue(ifInputConsumerOnSuccess == 1);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} subscribe and unsubscribe failed, error: ${JSON.stringify(error,
              [`code`, `message`])}`);
            ExpectTrue(error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOn_1300
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOn_1300
     * @tc.desc   Test callback inputConsumer.on and off interface to subscribe and unsubscribe volume+&down&repeatFalse listening.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_1300";
        try {
          let options: inputConsumer.KeyPressedConfig = {
            key: 16,
            action: 1,
            isRepeat: false
          }
          let callback = (event: KeyEvent) => {
            console.info(`${caseName} KeyEvent is: ${JSON.stringify(event)}`);
          }
          let ifInputConsumerOnSuccess = 0;
          try {
            inputConsumer.offKeyPressed();
            inputConsumer.onKeyPressed(options, callback);
            inputConsumer.offKeyPressed(callback);
            inputConsumer.offKeyPressed();
            ifInputConsumerOnSuccess++;
            console.info(`${caseName} subscribe and unsubscribe success.`);
            ExpectTrue(ifInputConsumerOnSuccess == 1);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} subscribe and unsubscribe failed, error: ${JSON.stringify(error,
              [`code`, `message`])}`);
            ExpectTrue(error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOn_1400
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOn_1400
     * @tc.desc   Test callback inputConsumer.on and off interface to subscribe and unsubscribe volume-&down&repeatTrue listening.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_1400";
        try {
          let options: inputConsumer.KeyPressedConfig = {
            key: 17,
            action: 1,
            isRepeat: true
          }
          let callback = (event: KeyEvent) => {
            console.info(`${caseName} KeyEvent is: ${JSON.stringify(event)}`);
          }
          let ifInputConsumerOnSuccess = 0;
          try {
            inputConsumer.offKeyPressed();
            inputConsumer.onKeyPressed(options, callback);
            inputConsumer.offKeyPressed(callback);
            inputConsumer.offKeyPressed();
            ifInputConsumerOnSuccess++;
            console.info(`${caseName} subscribe and unsubscribe success.`);
            ExpectTrue(ifInputConsumerOnSuccess == 1);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} subscribe and unsubscribe failed, error: ${JSON.stringify(error,
              [`code`, `message`])}`);
            ExpectTrue(error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOn_1500
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOn_1500
     * @tc.desc   Test callback inputConsumer.on and off interface to subscribe and unsubscribe volume-&down&repeatFalse listening.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_1500";
        try {
          let options: inputConsumer.KeyPressedConfig = {
            key: 17,
            action: 1,
            isRepeat: false
          }
          let callback = (event: KeyEvent) => {
            console.info(`${caseName} KeyEvent is: ${JSON.stringify(event)}`);
          }
          let ifInputConsumerOnSuccess = 0;
          try {
            inputConsumer.offKeyPressed();
            inputConsumer.onKeyPressed(options, callback);
            inputConsumer.offKeyPressed(callback);
            inputConsumer.offKeyPressed();
            ifInputConsumerOnSuccess++;
            console.info(`${caseName} subscribe and unsubscribe success.`);
            ExpectTrue(ifInputConsumerOnSuccess == 1);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} subscribe and unsubscribe failed, error: ${JSON.stringify(error,
              [`code`, `message`])}`);
            ExpectTrue(error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOn_1600
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOn_1600
     * @tc.desc   Test callback inputConsumer.on and off interface to subscribe and unsubscribe volume+&down&repeatTrue listening again.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_1600";
        try {
          let options: inputConsumer.KeyPressedConfig = {
            key: 16,
            action: 1,
            isRepeat: true
          }
          let callback = (event: KeyEvent) => {
            console.info(`${caseName} KeyEvent is: ${JSON.stringify(event)}`);
          }
          let callback2 = (event: KeyEvent) => {
            console.info(`${caseName} KeyEvent is: ${JSON.stringify(event)}`);
          }
          let ifInputConsumerOnSuccess = 0;
          try {
            inputConsumer.offKeyPressed();
            inputConsumer.onKeyPressed(options, callback);
            inputConsumer.onKeyPressed(options, callback2);
            inputConsumer.offKeyPressed(callback);
            inputConsumer.offKeyPressed(callback2);
            inputConsumer.offKeyPressed();
            ifInputConsumerOnSuccess++;
            console.info(`${caseName} subscribe and unsubscribe success.`);
            ExpectTrue(ifInputConsumerOnSuccess == 1);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} subscribe and unsubscribe failed, error: ${JSON.stringify(error,
              [`code`, `message`])}`);
            ExpectTrue(error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOn_1700
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOn_1700
     * @tc.desc   Test callback inputConsumer.on and off interface to subscribe and unsubscribe volume-&down&repeatFalse listening again.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_1700";
        try {
          let options: inputConsumer.KeyPressedConfig = {
            key: 17,
            action: 1,
            isRepeat: false
          }
          let callback = (event: KeyEvent) => {
            console.info(`${caseName} KeyEvent is: ${JSON.stringify(event)}`);
          }
          let callback2 = (event: KeyEvent) => {
            console.info(`${caseName} KeyEvent is: ${JSON.stringify(event)}`);
          }
          let ifInputConsumerOnSuccess = 0;
          try {
            inputConsumer.offKeyPressed();
            inputConsumer.onKeyPressed(options, callback);
            inputConsumer.onKeyPressed(options, callback2);
            inputConsumer.offKeyPressed(callback);
            inputConsumer.offKeyPressed(callback2);
            inputConsumer.offKeyPressed();
            ifInputConsumerOnSuccess++;
            console.info(`${caseName} subscribe and unsubscribe success.`);
            ExpectTrue(ifInputConsumerOnSuccess == 1);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} subscribe and unsubscribe failed, error: ${JSON.stringify(error,
              [`code`, `message`])}`);
            ExpectTrue(error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOff_1900
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOff_1900
     * @tc.desc   Test callback inputConsumer.off interface to unsubscribe some listening.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_1900";
        try {
          let options: inputConsumer.KeyPressedConfig = {
            key: 16,
            action: 1,
            isRepeat: true
          }
          let options2: inputConsumer.KeyPressedConfig = {
            key: 17,
            action: 1,
            isRepeat: true
          }
          let options3: inputConsumer.KeyPressedConfig = {
            key: 16,
            action: 1,
            isRepeat: false
          }
          let options4: inputConsumer.KeyPressedConfig = {
            key: 17,
            action: 1,
            isRepeat: false
          }
          let callback = (event: KeyEvent) => {
            console.info(`${caseName} KeyEvent is: ${JSON.stringify(event)}`);
          }
          let callback2 = (event: KeyEvent) => {
            console.info(`${caseName} KeyEvent is: ${JSON.stringify(event)}`);
          }
          let callback3 = (event: KeyEvent) => {
            console.info(`${caseName} KeyEvent is: ${JSON.stringify(event)}`);
          }
          let callback4 = (event: KeyEvent) => {
            console.info(`${caseName} KeyEvent is: ${JSON.stringify(event)}`);
          }
          let ifInputConsumerOffSuccess = 0;
          try {
            inputConsumer.offKeyPressed();
            inputConsumer.onKeyPressed(options, callback);
            inputConsumer.onKeyPressed(options2, callback2);
            inputConsumer.onKeyPressed(options3, callback3);
            inputConsumer.onKeyPressed(options4, callback4);
            inputConsumer.offKeyPressed(callback);
            inputConsumer.offKeyPressed(callback4);
            inputConsumer.offKeyPressed();
            ifInputConsumerOffSuccess++;
            console.info(`${caseName} subscribe and unsubscribe success.`);
            ExpectTrue(ifInputConsumerOffSuccess == 1);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} subscribe and unsubscribe failed, error: ${JSON.stringify(error,
              [`code`, `message`])}`);
            ExpectTrue(error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOff_2000
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOff_2000
     * @tc.desc   Test callback inputConsumer.off interface to unsubscribe some repeated listening.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_2000";
        try {
          let options: inputConsumer.KeyPressedConfig = {
            key: 16,
            action: 1,
            isRepeat: false
          }
          let options2: inputConsumer.KeyPressedConfig = {
            key: 17,
            action: 1,
            isRepeat: false
          }
          let options3: inputConsumer.KeyPressedConfig = {
            key: 16,
            action: 1,
            isRepeat: true
          }
          let options4: inputConsumer.KeyPressedConfig = {
            key: 17,
            action: 1,
            isRepeat: true
          }
          let callback = (event: KeyEvent) => {
            console.info(`${caseName} KeyEvent is: ${JSON.stringify(event)}`);
          }
          let callback2 = (event: KeyEvent) => {
            console.info(`${caseName} KeyEvent is: ${JSON.stringify(event)}`);
          }
          let callback3 = (event: KeyEvent) => {
            console.info(`${caseName} KeyEvent is: ${JSON.stringify(event)}`);
          }
          let callback4 = (event: KeyEvent) => {
            console.info(`${caseName} KeyEvent is: ${JSON.stringify(event)}`);
          }
          try {
            inputConsumer.offKeyPressed();
            inputConsumer.onKeyPressed(options, callback);
            inputConsumer.onKeyPressed(options2, callback2);
            inputConsumer.onKeyPressed(options3, callback3);
            inputConsumer.onKeyPressed(options4, callback4);
            inputConsumer.offKeyPressed(callback3);
            inputConsumer.offKeyPressed(callback3);
            inputConsumer.offKeyPressed();
            console.info(`${caseName} subscribe and unsubscribe success.`);
            ExpectFalse(true);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} subscribe and unsubscribe failed, error: ${JSON.stringify(error,
              [`code`, `message`])}`);
            ExpectTrue(error.code == 401 || error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOff_2100
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOff_2100
     * @tc.desc   Test callback inputConsumer.off interface to unsubscribe all the listening.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_2100";
        try {
          let options: inputConsumer.KeyPressedConfig = {
            key: 16,
            action: 1,
            isRepeat: true
          }
          let options2: inputConsumer.KeyPressedConfig = {
            key: 16,
            action: 1,
            isRepeat: false
          }
          let options3: inputConsumer.KeyPressedConfig = {
            key: 17,
            action: 1,
            isRepeat: true
          }
          let options4: inputConsumer.KeyPressedConfig = {
            key: 17,
            action: 1,
            isRepeat: false
          }
          let callback = (event: KeyEvent) => {
            console.info(`${caseName} KeyEvent is: ${JSON.stringify(event)}`);
          }
          let callback2 = (event: KeyEvent) => {
            console.info(`${caseName} KeyEvent is: ${JSON.stringify(event)}`);
          }
          let callback3 = (event: KeyEvent) => {
            console.info(`${caseName} KeyEvent is: ${JSON.stringify(event)}`);
          }
          let callback4 = (event: KeyEvent) => {
            console.info(`${caseName} KeyEvent is: ${JSON.stringify(event)}`);
          }
          let ifInputConsumerOffSuccess = 0;
          try {
            inputConsumer.offKeyPressed();
            inputConsumer.onKeyPressed(options, callback);
            inputConsumer.onKeyPressed(options2, callback2);
            inputConsumer.onKeyPressed(options3, callback3);
            inputConsumer.onKeyPressed(options4, callback4);
            inputConsumer.offKeyPressed();
            console.info(`${caseName} subscribe and unsubscribe success.`);
            ifInputConsumerOffSuccess++;
            ExpectTrue(ifInputConsumerOffSuccess == 1);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} subscribe and unsubscribe failed, error: ${JSON.stringify(error,
              [`code`, `message`])}`);
            ExpectTrue(error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOff_2200
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOff_2200
     * @tc.desc   Test callback inputConsumer.off interface to unsubscribe.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_2200";
        try {
          let callback = (event: KeyEvent) => {
            console.info(`${caseName} KeyEvent is: ${JSON.stringify(event)}`);
          }
          try {
            inputConsumer.offKeyPressed(callback);
            console.info(`${caseName} subscribe and unsubscribe success.`);
            ExpectFalse(true);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} subscribe and unsubscribe failed, error: ${JSON.stringify(error,
              [`code`, `message`])}`);
            ExpectTrue(error.code == 401 || error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOn_1800
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOn_1800
     * @tc.desc   Test callback inputConsumer.on and off interface to subscribe and unsubscribe power&down&repeatTrue listening.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_1800";
        try {
          let options: inputConsumer.KeyPressedConfig = {
            key: 18,
            action: 1,
            isRepeat: true
          }
          let callback = (event: KeyEvent) => {
            console.info(`${caseName} KeyEvent is: ${JSON.stringify(event)}`);
          }
          try {
            inputConsumer.offKeyPressed();
            inputConsumer.onKeyPressed(options, callback);
            inputConsumer.offKeyPressed();
            console.info(`${caseName} subscribe and unsubscribe success.`);
            ExpectFalse(true);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} subscribe and unsubscribe failed, error: ${JSON.stringify(error,
              [`code`, `message`])}`);
            ExpectTrue(error.code == 401 || error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOn_1900
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOn_1900
     * @tc.desc   Test callback inputConsumer.on and off interface to subscribe and unsubscribe 10000&down&repeatTrue listening.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_1900";
        try {
          let options: inputConsumer.KeyPressedConfig = {
            key: 10000,
            action: 1,
            isRepeat: true
          }
          let callback = (event: KeyEvent) => {
            console.info(`${caseName} KeyEvent is: ${JSON.stringify(event)}`);
          }
          try {
            inputConsumer.offKeyPressed();
            inputConsumer.onKeyPressed(options, callback);
            inputConsumer.offKeyPressed();
            console.info(`${caseName} subscribe and unsubscribe success.`);
            ExpectFalse(true);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} subscribe and unsubscribe failed, error: ${JSON.stringify(error,
              [`code`, `message`])}`);
            ExpectTrue(error.code == 401 || error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOn_2000
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOn_2000
     * @tc.desc   Test callback inputConsumer.on and off interface to subscribe and unsubscribe -1&down&repeatTrue listening.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_2000";
        try {
          let options: inputConsumer.KeyPressedConfig = {
            key: -1,
            action: 1,
            isRepeat: true
          }
          let callback = (event: KeyEvent) => {
            console.info(`${caseName} KeyEvent is: ${JSON.stringify(event)}`);
          }
          try {
            inputConsumer.offKeyPressed();
            inputConsumer.onKeyPressed(options, callback);
            inputConsumer.offKeyPressed();
            console.info(`${caseName} subscribe and unsubscribe success.`);
            ExpectFalse(true);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} subscribe and unsubscribe failed, error: ${JSON.stringify(error,
              [`code`, `message`])}`);
            ExpectTrue(error.code == 401 || error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOn_2100
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOn_2100
     * @tc.desc   Test callback inputConsumer.on and off interface to subscribe and unsubscribe volume+&0&repeatTrue listening.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_2100";
        try {
          let options: inputConsumer.KeyPressedConfig = {
            key: 16,
            action: 0,
            isRepeat: true
          }
          let callback = (event: KeyEvent) => {
            console.info(`${caseName} KeyEvent is: ${JSON.stringify(event)}`);
          }
          try {
            inputConsumer.offKeyPressed();
            inputConsumer.onKeyPressed(options, callback);
            inputConsumer.offKeyPressed();
            console.info(`${caseName} subscribe and unsubscribe success.`);
            ExpectFalse(true);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} subscribe and unsubscribe failed, error: ${JSON.stringify(error,
              [`code`, `message`])}`);
            ExpectTrue(error.code == 401 || error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOn_2200
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOn_2200
     * @tc.desc   Test callback inputConsumer.on and off interface to subscribe and unsubscribe volume-&2&repeatTrue listening.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_2200";
        try {
          let options: inputConsumer.KeyPressedConfig = {
            key: 17,
            action: 3,
            isRepeat: true
          }
          let callback = (event: KeyEvent) => {
            console.info(`${caseName} KeyEvent is: ${JSON.stringify(event)}`);
          }
          try {
            inputConsumer.offKeyPressed();
            inputConsumer.onKeyPressed(options, callback);
            inputConsumer.offKeyPressed();
            console.info(`${caseName} subscribe and unsubscribe success.`);
            ExpectFalse(true);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} subscribe and unsubscribe failed, error: ${JSON.stringify(error,
              [`code`, `message`])}`);
            ExpectTrue(error.code == 401 || error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_inputConsumerOn_2300
     * @tc.number SUB_MMI_Input_Api_IptDev_inputConsumerOn_2300
     * @tc.desc   Test callback inputConsumer.on and off interface to subscribe and unsubscribe volume-&-1&repeatTrue listening.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_2300";
        try {
          let options: inputConsumer.KeyPressedConfig = {
            key: 17,
            action: -1,
            isRepeat: true
          }
          let callback = (event: KeyEvent) => {
            console.info(`${caseName} KeyEvent is: ${JSON.stringify(event)}`);
          }
          try {
            inputConsumer.offKeyPressed();
            inputConsumer.onKeyPressed(options, callback);
            inputConsumer.offKeyPressed();
            console.info(`${caseName} subscribe and unsubscribe success.`);
            ExpectFalse(true);
            done();
          } catch (error: BusinessError) {
            console.info(`${caseName} subscribe and unsubscribe failed, error: ${JSON.stringify(error,
              [`code`, `message`])}`);
            ExpectTrue(error.code == 401 || error.code == 801);
            done();
          }
        } catch (error: BusinessError) {
          console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });
  });
}