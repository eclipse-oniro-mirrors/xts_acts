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
import { inputConsumer } from '@kit.InputKit';

export default function MultimodalInputConsumerTest() {
  describe("MultimodalInputConsumerTest", ()=> {
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
     * @tc.number: SUB_MMI_Input_Api_IptDev_inputConsumerOn_0100
     * @tc.name: SUB_MMI_Input_Api_IptDev_inputConsumerOn_0100
     * @tc.desc: Test callback inputConsumer.on interface to subscribe Left_Alt + Z.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_0100";
      try {
        let hotkeyOptions: inputConsumer.HotkeyOptions = {
          preKeys: [ 2045 ],
          finalKey: 2042,
          isRepeat: true
        };
        let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
          console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
        }
        let ifInputConsumerOnSuccess = 0;
        try {
          inputConsumer.on("hotkeyChange", hotkeyOptions, hotkeyCallback);
          console.info(`${caseName} success`);
          ifInputConsumerOnSuccess++;
          ExpectTrue(ifInputConsumerOnSuccess == 1);
          inputConsumer.off("hotkeyChange", hotkeyOptions, hotkeyCallback);
          done();
        } catch (error) {
          console.info(`${caseName} Subscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 801);
          done();
        }
      } catch (error) {
        console.info(`${caseName} failed to subscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });


    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_inputConsumerOn_0200
     * @tc.name: SUB_MMI_Input_Api_IptDev_inputConsumerOn_0200
     * @tc.desc: Test callback inputConsumer.on interface to subscribe Left_Ctrl + Left_Alt + D + C.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_0200", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_0200";
      try {
        let hotkeyOptions: inputConsumer.HotkeyOptions = {
          preKeys: [ 2072, 2045, 2020 ],
          finalKey: 2019,
          isRepeat: true
        };
        let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
          console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
        }
        try {
          inputConsumer.on("hotkeyChange", hotkeyOptions, hotkeyCallback);
          console.info(`${caseName} success`);
          ExpectFalse(true);
          inputConsumer.off("hotkeyChange", hotkeyOptions, hotkeyCallback);
          done();
        } catch (error) {
          console.info(`${caseName} Subscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 401 || error.code == 801);
          done();
        }
      } catch (error) {
        console.info(`${caseName} failed to subscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_inputConsumerOn_0300
     * @tc.name: SUB_MMI_Input_Api_IptDev_inputConsumerOn_0300
     * @tc.desc: Test callback inputConsumer.on interface to subscribe Left_Ctrl + Left_Alt + D + 9.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_0300", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_0300";
      try {
        let hotkeyOptions: inputConsumer.HotkeyOptions = {
          preKeys: [ 2072, 2045, 2020 ],
          finalKey: 2009,
          isRepeat: true
        };
        let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
          console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
        }
        try {
          inputConsumer.on("hotkeyChange", hotkeyOptions, hotkeyCallback);
          console.info(`${caseName} success`);
          ExpectFalse(true);
          inputConsumer.off("hotkeyChange", hotkeyOptions, hotkeyCallback);
          done();
        } catch (error) {
          console.info(`${caseName} Subscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 401 || error.code == 801);
          done();
        }
      } catch (error) {
        console.info(`${caseName} failed to subscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_inputConsumerOn_0400
     * @tc.name: SUB_MMI_Input_Api_IptDev_inputConsumerOn_0400
     * @tc.desc: Test callback inputConsumer.on interface to subscribe 9 + D.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_0400", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_0400";
      try {
        let hotkeyOptions: inputConsumer.HotkeyOptions = {
          preKeys: [ 2009 ],
          finalKey: 2020,
          isRepeat: true
        };
        let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
          console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
        }
        try {
          inputConsumer.on("hotkeyChange", hotkeyOptions, hotkeyCallback);
          console.info(`${caseName} success`);
          ExpectFalse(true);
          inputConsumer.off("hotkeyChange", hotkeyOptions, hotkeyCallback);
          done();
        } catch (error) {
          console.info(`${caseName} Subscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 401 || error.code == 801);
          done();
        }
      } catch (error) {
        console.info(`${caseName} fail to subscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_inputConsumerOn_0500
     * @tc.name: SUB_MMI_Input_Api_IptDev_inputConsumerOn_0500
     * @tc.desc: Test callback inputConsumer.on interface to subscribe F + D.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_0500", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_0500";
      try {
        let hotkeyOptions: inputConsumer.HotkeyOptions = {
          preKeys: [ 2022 ],
          finalKey: 2020,
          isRepeat: true
        };
        let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
          console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
        }
        try {
          inputConsumer.on("hotkeyChange", hotkeyOptions, hotkeyCallback);
          console.info(`${caseName} success`);
          ExpectFalse(true);
          inputConsumer.off("hotkeyChange", hotkeyOptions, hotkeyCallback);
          done();
        } catch (error) {
          console.info(`${caseName} Subscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 401 || error.code == 801);
          done();
        }
      } catch (error) {
        console.info(`${caseName} failed to subscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_inputConsumerOn_0600
     * @tc.name: SUB_MMI_Input_Api_IptDev_inputConsumerOn_0600
     * @tc.desc: Test callback inputConsumer.on interface to subscribe Left_Ctrl + Meta.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_0600", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_0600";
      try {
        let hotkeyOptions: inputConsumer.HotkeyOptions = {
          preKeys: [ 2072 ],
          finalKey: 2076,
          isRepeat: true
        };
        let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
          console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
        }
        try {
          inputConsumer.on("hotkeyChange", hotkeyOptions, hotkeyCallback);
          console.info(`${caseName} success`);
          ExpectFalse(true);
          inputConsumer.off("hotkeyChange", hotkeyOptions, hotkeyCallback);
          done();
        } catch (error) {
          console.info(`${caseName} Subscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 401 || error.code == 801);
          done();
        }
      } catch (error) {
        console.info(`${caseName} failed to subscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_inputConsumerOn_0700
     * @tc.name: SUB_MMI_Input_Api_IptDev_inputConsumerOn_0700
     * @tc.desc: Test callback inputConsumer.on interface to subscribe Left_Ctrl + Right_Ctrl.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_0700", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_0700";
      try {
        let hotkeyOptions: inputConsumer.HotkeyOptions = {
          preKeys: [ 2072 ],
          finalKey: 2073,
          isRepeat: true
        };
        let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
          console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
        }
        try {
          inputConsumer.on("hotkeyChange", hotkeyOptions, hotkeyCallback);
          console.info(`${caseName} success`);
          ExpectFalse(true);
          inputConsumer.off("hotkeyChange", hotkeyOptions, hotkeyCallback);
          done();
        } catch (error) {
          console.info(`${caseName} Subscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 401 || error.code == 801);
          done();
        }
      } catch (error) {
        console.info(`${caseName} failed to subscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_inputConsumerOn_0800
     * @tc.name: SUB_MMI_Input_Api_IptDev_inputConsumerOn_0800
     * @tc.desc: Test callback inputConsumer.on interface to subscribe Left_Alt + Z again.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_0800", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_0800";
      try {
        let hotkeyOptions: inputConsumer.HotkeyOptions = {
          preKeys: [ 2045 ],
          finalKey: 2042,
          isRepeat: true
        };
        let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
          console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
        }
        try {
          inputConsumer.on("hotkeyChange", hotkeyOptions, hotkeyCallback);
          inputConsumer.on("hotkeyChange", hotkeyOptions, hotkeyCallback);
          console.info(`${caseName} success`);
          ExpectFalse(true);
          inputConsumer.off("hotkeyChange", hotkeyOptions, hotkeyCallback);
          done();
        } catch (error) {
          console.info(`${caseName} Subscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 401 || error.code == 801);
          done();
        }
      } catch (error) {
        console.info(`${caseName} failed to subscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_inputConsumerOn_0900
     * @tc.name: SUB_MMI_Input_Api_IptDev_inputConsumerOn_0900
     * @tc.desc: Test callback inputConsumer.on interface to subscribe a nonexistent preKeys.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_0900", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_0900";
      try {
        let hotkeyOptions: inputConsumer.HotkeyOptions = {
          preKeys: [ 8856 ],
          finalKey: 2042,
          isRepeat: true
        };
        let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
          console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
        }
        try {
          inputConsumer.on("hotkeyChange", hotkeyOptions, hotkeyCallback);
          console.info(`${caseName} success`);
          ExpectFalse(true);
          inputConsumer.off("hotkeyChange", hotkeyOptions, hotkeyCallback);
          done();
        } catch (error) {
          console.info(`${caseName} Subscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 401 || error.code == 801);
          done();
        }
      } catch (error) {
        console.info(`${caseName} failed to subscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_inputConsumerOn_1000
     * @tc.name: SUB_MMI_Input_Api_IptDev_inputConsumerOn_1000
     * @tc.desc: Test callback inputConsumer.on interface to subscribe a nonexistent finalKey.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_1000", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_1000";
      try {
        let hotkeyOptions: inputConsumer.HotkeyOptions = {
          preKeys: [ 2045 ],
          finalKey: 8236,
          isRepeat: true
        };
        let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
          console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
        }
        let ifInputConsumerOnSuccess = 0;
        try {
          inputConsumer.on("hotkeyChange", hotkeyOptions, hotkeyCallback);
          console.info(`${caseName} success`);
          ifInputConsumerOnSuccess++;
          ExpectTrue(ifInputConsumerOnSuccess == 1);
          inputConsumer.off("hotkeyChange", hotkeyOptions, hotkeyCallback);
          done();
        } catch (error) {
          console.info(`${caseName} Subscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 801);
          done();
        }
      } catch (error) {
        console.info(`${caseName} failed to subscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_inputConsumerOn_1100
     * @tc.name: SUB_MMI_Input_Api_IptDev_inputConsumerOn_1100
     * @tc.desc: Test callback inputConsumer.on interface to subscribe Left_Alt + Tab.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOn_1100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOn_1100";
      try {
        let hotkeyOptions: inputConsumer.HotkeyOptions = {
          preKeys: [ 2045 ],
          finalKey: 2049,
          isRepeat: true
        };
        let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
          console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
        }
        try {
          inputConsumer.on("hotkeyChange", hotkeyOptions, hotkeyCallback);
          console.info(`${caseName} success`);
          ExpectFalse(true);
          inputConsumer.off("hotkeyChange", hotkeyOptions, hotkeyCallback);
          done();
        } catch (error) {
          console.info(`${caseName} Subscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 4200003 || error.code == 4200002 || error.code == 801);
          done();
        }
      } catch (error) {
        console.info(`${caseName} failed to subscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_inputConsumerOff_0100
     * @tc.name: SUB_MMI_Input_Api_IptDev_inputConsumerOff_0100
     * @tc.desc: Test callback inputConsumer.off interface to unsubscribe Left_Alt + Z.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_0100";
      try {
        let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
          console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
        }
        let hotkeyOption: inputConsumer.HotkeyOptions = {
          preKeys: [ 2045 ],
          finalKey: 2042,
          isRepeat: true
        };
        let ifInputConsumerOffSuccess = 0;
        try {
          inputConsumer.on("hotkeyChange", hotkeyOption, hotkeyCallback);
          inputConsumer.off("hotkeyChange", hotkeyOption, hotkeyCallback);
          console.info(`${caseName} unsubscribe success`);
          ifInputConsumerOffSuccess++;
          ExpectTrue(ifInputConsumerOffSuccess == 1);
          done();
        } catch (error) {
          console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 801);
          done();
        }
      } catch (error) {
        console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_inputConsumerOff_0200
     * @tc.name: SUB_MMI_Input_Api_IptDev_inputConsumerOff_0200
     * @tc.desc: Test callback inputConsumer.off interface to unsubscribe from the combination keys subscribed by all the callback functions.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_0200", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_0200";
      try {
        let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
          console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
        }
        let hotkeyOption: inputConsumer.HotkeyOptions = {
          preKeys: [ 2045 ],
          finalKey: 2042,
          isRepeat: true
        };
        let ifInputConsumerOffSuccess = 0;
        try {
          inputConsumer.on("hotkeyChange", hotkeyOption, hotkeyCallback);
          inputConsumer.off("hotkeyChange", hotkeyOption);
          console.info(`${caseName} unsubscribe success`);
          ifInputConsumerOffSuccess++;
          ExpectTrue(ifInputConsumerOffSuccess == 1);
          done();
        } catch (error) {
          console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 801);
          done();
        }
      } catch (error) {
        console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_inputConsumerOff_0300
     * @tc.name: SUB_MMI_Input_Api_IptDev_inputConsumerOff_0300
     * @tc.desc: Test callback inputConsumer.on and off interface to unsubscribe Left_Ctrl + Z.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_0300", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_0300";
      try {
        let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
          console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
        }
        let hotkeyOption: inputConsumer.HotkeyOptions = {
          preKeys: [ 2072 ],
          finalKey: 2042,
          isRepeat: true
        };
        let ifInputConsumerOffSuccess = 0;
        try {
          inputConsumer.on("hotkeyChange", hotkeyOption, hotkeyCallback);
          inputConsumer.off("hotkeyChange", hotkeyOption, hotkeyCallback);
          console.info(`${caseName} unsubscribe success`);
          ifInputConsumerOffSuccess++;
          ExpectTrue(ifInputConsumerOffSuccess == 1);
          done();
        } catch (error) {
          console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 801);
          done();
        }
      } catch (error) {
        console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_inputConsumerOff_0400
     * @tc.name: SUB_MMI_Input_Api_IptDev_inputConsumerOff_0400
     * @tc.desc: Test callback inputConsumer.on and off interface to unsubscribe Left_Ctrl + Left_Alt + Z.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_0400", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_0400";
      try {
        let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
          console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
        }
        let hotkeyOption: inputConsumer.HotkeyOptions = {
          preKeys: [ 2072, 2045 ],
          finalKey: 2042,
          isRepeat: true
        };
        let ifInputConsumerOffSuccess = 0;
        try {
          inputConsumer.on("hotkeyChange", hotkeyOption, hotkeyCallback);
          inputConsumer.off("hotkeyChange", hotkeyOption, hotkeyCallback);
          console.info(`${caseName} unsubscribe success`);
          ifInputConsumerOffSuccess++;
          ExpectTrue(ifInputConsumerOffSuccess == 1);
          done();
        } catch (error) {
          console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 801);
          done();
        }
      } catch (error) {
        console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_inputConsumerOff_0500
     * @tc.name: SUB_MMI_Input_Api_IptDev_inputConsumerOff_0500
     * @tc.desc: Test callback inputConsumer.on and off interface to unsubscribe Left_Shift + Left_Alt + Z.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_0500", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_0500";
      try {
        let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
          console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
        }
        let hotkeyOption: inputConsumer.HotkeyOptions = {
          preKeys: [ 2047, 2045 ],
          finalKey: 2042,
          isRepeat: true
        };
        let ifInputConsumerOffSuccess = 0;
        try {
          inputConsumer.on("hotkeyChange", hotkeyOption, hotkeyCallback);
          inputConsumer.off("hotkeyChange", hotkeyOption, hotkeyCallback);
          console.info(`${caseName} unsubscribe success`);
          ifInputConsumerOffSuccess++;
          ExpectTrue(ifInputConsumerOffSuccess == 1);
          done();
        } catch (error) {
          console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 801);
          done();
        }
      } catch (error) {
        console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_inputConsumerOff_0600
     * @tc.name: SUB_MMI_Input_Api_IptDev_inputConsumerOff_0600
     * @tc.desc: Test callback inputConsumer.on and off interface to unsubscribe Left_Shift + C.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_0600", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_0600";
      try {
        let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
          console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
        }
        let hotkeyOption: inputConsumer.HotkeyOptions = {
          preKeys: [ 2047 ],
          finalKey: 2019,
          isRepeat: true
        };
        let ifInputConsumerOffSuccess = 0;
        try {
          inputConsumer.on("hotkeyChange", hotkeyOption, hotkeyCallback);
          inputConsumer.off("hotkeyChange", hotkeyOption, hotkeyCallback);
          console.info(`${caseName} unsubscribe success`);
          ifInputConsumerOffSuccess++;
          ExpectTrue(ifInputConsumerOffSuccess == 1);
          done();
        } catch (error) {
          console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 801);
          done();
        }
      } catch (error) {
        console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_inputConsumerOff_0700
     * @tc.name: SUB_MMI_Input_Api_IptDev_inputConsumerOff_0700
     * @tc.desc: Test callback inputConsumer.on and off interface to unsubscribe Left_Ctrl + 9.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_0700", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_0700";
      try {
        let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
          console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
        }
        let hotkeyOption: inputConsumer.HotkeyOptions = {
          preKeys: [ 2072 ],
          finalKey: 2009,
          isRepeat: true
        };
        let ifInputConsumerOffSuccess = 0;
        try {
          inputConsumer.on("hotkeyChange", hotkeyOption, hotkeyCallback);
          inputConsumer.off("hotkeyChange", hotkeyOption, hotkeyCallback);
          console.info(`${caseName} unsubscribe success`);
          ifInputConsumerOffSuccess++;
          ExpectTrue(ifInputConsumerOffSuccess == 1);
          done();
        } catch (error) {
          console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 801);
          done();
        }
      } catch (error) {
        console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_inputConsumerOff_0800
     * @tc.name: SUB_MMI_Input_Api_IptDev_inputConsumerOff_0800
     * @tc.desc: Test callback inputConsumer.on and off interface to unsubscribe Left_Ctrl + ↑.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_0800", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_0800";
      try {
        let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
          console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
        }
        let hotkeyOption: inputConsumer.HotkeyOptions = {
          preKeys: [ 2072 ],
          finalKey: 2012,
          isRepeat: true
        };
        let ifInputConsumerOffSuccess = 0;
        try {
          inputConsumer.on("hotkeyChange", hotkeyOption, hotkeyCallback);
          inputConsumer.off("hotkeyChange", hotkeyOption, hotkeyCallback);
          console.info(`${caseName} unsubscribe success`);
          ifInputConsumerOffSuccess++;
          ExpectTrue(ifInputConsumerOffSuccess == 1);
          done();
        } catch (error) {
          console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 801);
          done();
        }
      } catch (error) {
        console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_inputConsumerOff_0900
     * @tc.name: SUB_MMI_Input_Api_IptDev_inputConsumerOff_0900
     * @tc.desc: Test callback inputConsumer.on and off interface to unsubscribe Left_Ctrl + ←.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_0900", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_0900";
      try {
        let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
          console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
        }
        let hotkeyOption: inputConsumer.HotkeyOptions = {
          preKeys: [ 2072 ],
          finalKey: 2014,
          isRepeat: true
        };
        let ifInputConsumerOffSuccess = 0;
        try {
          inputConsumer.on("hotkeyChange", hotkeyOption, hotkeyCallback);
          inputConsumer.off("hotkeyChange", hotkeyOption, hotkeyCallback);
          console.info(`${caseName} unsubscribe success`);
          ifInputConsumerOffSuccess++;
          ExpectTrue(ifInputConsumerOffSuccess == 1);
          done();
        } catch (error) {
          console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 801);
          done();
        }
      } catch (error) {
        console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_inputConsumerOff_1000
     * @tc.name: SUB_MMI_Input_Api_IptDev_inputConsumerOff_1000
     * @tc.desc: Test callback inputConsumer.on and off interface to unsubscribe Left_Ctrl + F1.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_1000", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_1000";
      try {
        let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
          console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
        }
        let hotkeyOption: inputConsumer.HotkeyOptions = {
          preKeys: [ 2072 ],
          finalKey: 2090,
          isRepeat: true
        };
        let ifInputConsumerOffSuccess = 0;
        try {
          inputConsumer.on("hotkeyChange", hotkeyOption, hotkeyCallback);
          inputConsumer.off("hotkeyChange", hotkeyOption, hotkeyCallback);
          console.info(`${caseName} unsubscribe success`);
          ifInputConsumerOffSuccess++;
          ExpectTrue(ifInputConsumerOffSuccess == 1);
          done();
        } catch (error) {
          console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 801);
          done();
        }
      } catch (error) {
        console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_inputConsumerOff_1100
     * @tc.name: SUB_MMI_Input_Api_IptDev_inputConsumerOff_1100
     * @tc.desc: Test callback inputConsumer.on and off interface to unsubscribe Left_Ctrl + Home.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_1100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_1100";
      try {
        let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
          console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
        }
        let hotkeyOption: inputConsumer.HotkeyOptions = {
          preKeys: [ 2072 ],
          finalKey: 2081,
          isRepeat: true
        };
        let ifInputConsumerOffSuccess = 0;
        try {
          inputConsumer.on("hotkeyChange", hotkeyOption, hotkeyCallback);
          inputConsumer.off("hotkeyChange", hotkeyOption, hotkeyCallback);
          console.info(`${caseName} unsubscribe success`);
          ifInputConsumerOffSuccess++;
          ExpectTrue(ifInputConsumerOffSuccess == 1);
          done();
        } catch (error) {
          console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 801);
          done();
        }
      } catch (error) {
        console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_inputConsumerOff_1200
     * @tc.name: SUB_MMI_Input_Api_IptDev_inputConsumerOff_1200
     * @tc.desc: Test callback inputConsumer.on and off interface to unsubscribe Left_Ctrl + Enter.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_1200", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_1200";
      try {
        let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
          console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
        }
        let hotkeyOption: inputConsumer.HotkeyOptions = {
          preKeys: [ 2072 ],
          finalKey: 2054,
          isRepeat: true
        };
        let ifInputConsumerOffSuccess = 0;
        try {
          inputConsumer.on("hotkeyChange", hotkeyOption, hotkeyCallback);
          inputConsumer.off("hotkeyChange", hotkeyOption, hotkeyCallback);
          console.info(`${caseName} unsubscribe success`);
          ifInputConsumerOffSuccess++;
          ExpectTrue(ifInputConsumerOffSuccess == 1);
          done();
        } catch (error) {
          console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 801);
          done();
        }
      } catch (error) {
        console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_inputConsumerOff_1300
     * @tc.name: SUB_MMI_Input_Api_IptDev_inputConsumerOff_1300
     * @tc.desc: Test callback inputConsumer.on and off interface to unsubscribe Left_Ctrl + P.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_1300", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_1300";
      try {
        let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
          console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
        }
        let hotkeyOption: inputConsumer.HotkeyOptions = {
          preKeys: [ 2072 ],
          finalKey: 2032,
          isRepeat: true
        };
        let ifInputConsumerOffSuccess = 0;
        try {
          inputConsumer.off("hotkeyChange", hotkeyOption, hotkeyCallback);
          console.info(`${caseName} unsubscribe success`);
          ifInputConsumerOffSuccess++;
          ExpectTrue(ifInputConsumerOffSuccess == 1);
          done();
        } catch (error) {
          console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 801);
          done();
        }
      } catch (error) {
        console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_inputConsumerOff_1400
     * @tc.name: SUB_MMI_Input_Api_IptDev_inputConsumerOff_1400
     * @tc.desc: Test callback inputConsumer.on and off interface to unsubscribe Left_Ctrl + Scroll Lock.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_1400", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_1400";
      try {
        let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
          console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
        }
        let hotkeyOption: inputConsumer.HotkeyOptions = {
          preKeys: [ 2072 ],
          finalKey: 2075,
          isRepeat: true
        };
        let ifInputConsumerOffSuccess = 0;
        try {
          inputConsumer.on("hotkeyChange", hotkeyOption, hotkeyCallback);
          inputConsumer.off("hotkeyChange", hotkeyOption, hotkeyCallback);
          console.info(`${caseName} unsubscribe success`);
          ifInputConsumerOffSuccess++;
          ExpectTrue(ifInputConsumerOffSuccess == 1);
          done();
        } catch (error) {
          console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 801);
          done();
        }
      } catch (error) {
        console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_inputConsumerOff_1500
     * @tc.name: SUB_MMI_Input_Api_IptDev_inputConsumerOff_1500
     * @tc.desc: Test callback inputConsumer.on and off interface to unsubscribe Left_Ctrl + Table.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_1500", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_1500";
      try {
        let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
          console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
        }
        let hotkeyOption: inputConsumer.HotkeyOptions = {
          preKeys: [ 2072 ],
          finalKey: 2049,
          isRepeat: true
        };
        let ifInputConsumerOffSuccess = 0;
        try {
          inputConsumer.on("hotkeyChange", hotkeyOption, hotkeyCallback);
          inputConsumer.off("hotkeyChange", hotkeyOption, hotkeyCallback);
          console.info(`${caseName} unsubscribe success`);
          ifInputConsumerOffSuccess++;
          ExpectTrue(ifInputConsumerOffSuccess == 1);
          done();
        } catch (error) {
          console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 801);
          done();
        }
      } catch (error) {
        console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_inputConsumerOff_1600
     * @tc.name: SUB_MMI_Input_Api_IptDev_inputConsumerOff_1600
     * @tc.desc: Test callback inputConsumer.on and off interface to unsubscribe a nonexistent preKeys.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_1600", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_1600";
      try {
        let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
          console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
        }
        let hotkeyOption: inputConsumer.HotkeyOptions = {
          preKeys: [ 2045, 4562 ],
          finalKey: 2049,
          isRepeat: true
        };
        try {
          inputConsumer.on("hotkeyChange", hotkeyOption, hotkeyCallback);
          inputConsumer.off("hotkeyChange", hotkeyOption, hotkeyCallback);
          console.info(`${caseName} unsubscribe success`);
          ExpectFalse(true);
          done();
        } catch (error) {
          console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 401 || error.code == 801);
          done();
        }
      } catch (error) {
        console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_inputConsumerOff_1700
     * @tc.name: SUB_MMI_Input_Api_IptDev_inputConsumerOff_1700
     * @tc.desc: Test callback inputConsumer.on and off interface to unsubscribe a nonexistent finalKey.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_inputConsumerOff_1700", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_inputConsumerOff_1700";
      try {
        let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
          console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
        }
        let hotkeyOption: inputConsumer.HotkeyOptions = {
          preKeys: [ 2045 ],
          finalKey: 99999,
          isRepeat: true
        };
        let ifInputConsumerOffSuccess = 0;
        try {
          inputConsumer.on("hotkeyChange", hotkeyOption, hotkeyCallback);
          inputConsumer.off("hotkeyChange", hotkeyOption, hotkeyCallback);
          console.info(`${caseName} unsubscribe success`);
          ifInputConsumerOffSuccess++;
          ExpectTrue(ifInputConsumerOffSuccess == 1);
          done();
        } catch (error) {
          console.info(`${caseName} unsubscribe failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 801);
          done();
        }
      } catch (error) {
        console.info(`${caseName} failed to unsubscribe, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });
  });
}