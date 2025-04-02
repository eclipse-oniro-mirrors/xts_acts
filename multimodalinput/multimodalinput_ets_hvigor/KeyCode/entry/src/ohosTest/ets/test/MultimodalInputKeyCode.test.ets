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
import { KeyCode } from '@kit.InputKit';

export default function MultimodalInputKeyCodeTest() {
  describe("MultimodalInputKeyCodeTest", ()=> {
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
     * @tc.number: SUB_MMI_Input_Api_KEYCODE_SWITCHVIDEOMODE_0100
     * @tc.name: SUB_MMI_Input_Api_KEYCODE_SWITCHVIDEOMODE_0100
     * @tc.desc: Test keycode KEYCODE_SWITCHVIDEOMODE.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_KEYCODE_SWITCHVIDEOMODE_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_KEYCODE_SWITCHVIDEOMODE_0100";
      try {
        let KEYCODE_SWITCHVIDEOMODE = KeyCode.KEYCODE_SWITCHVIDEOMODE;
        console.info(`${caseName} success, keyCode value ${JSON.stringify(KEYCODE_SWITCHVIDEOMODE)}`);
        ExpectTrue(KEYCODE_SWITCHVIDEOMODE == 2841);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_KEYCODE_SEARCH_0100
     * @tc.name: SUB_MMI_Input_Api_KEYCODE_SEARCH_0100
     * @tc.desc: Test keycode KEYCODE_SEARCH.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_KEYCODE_SEARCH_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_KEYCODE_SEARCH_0100";
      try {
        let KEYCODE_SEARCH = KeyCode.KEYCODE_SEARCH;
        console.info(`${caseName} success, keyCode value ${JSON.stringify(KEYCODE_SEARCH)}`);
        ExpectTrue(KEYCODE_SEARCH == 9);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_KEYCODE_MEDIA_RECORD_0100
     * @tc.name: SUB_MMI_Input_Api_KEYCODE_MEDIA_RECORD_0100
     * @tc.desc: Test keycode KEYCODE_MEDIA_RECORD.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_KEYCODE_MEDIA_RECORD_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_KEYCODE_MEDIA_RECORD_0100";
      try {
        let KEYCODE_MEDIA_RECORD = KeyCode.KEYCODE_MEDIA_RECORD;
        console.info(`${caseName} success, keyCode value ${JSON.stringify(KEYCODE_MEDIA_RECORD)}`);
        ExpectTrue(KEYCODE_MEDIA_RECORD == 2089);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_KEYCODE_ASSISTANT_0100
     * @tc.name: SUB_MMI_Input_Api_KEYCODE_ASSISTANT_0100
     * @tc.desc: Test keycode KEYCODE_ASSISTANT.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_KEYCODE_ASSISTANT_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_KEYCODE_ASSISTANT_0100";
      try {
        let KEYCODE_ASSISTANT = KeyCode.KEYCODE_ASSISTANT;
        console.info(`${caseName} success, keyCode value ${JSON.stringify(KEYCODE_ASSISTANT)}`);
        ExpectTrue(KEYCODE_ASSISTANT == 2722);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });
    
    /**
     * @tc.number: SUB_MMI_Input_Api_KEYCODE_BUTTON_A_0100
     * @tc.name: SUB_MMI_Input_Api_KEYCODE_BUTTON_A_0100
     * @tc.desc: Test keycode KEYCODE_BUTTON_A.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_KEYCODE_BUTTON_A_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_KEYCODE_BUTTON_A_0100";
      try {
        let KEYCODE_BUTTON_A = KeyCode.KEYCODE_BUTTON_A;
        console.info(`${caseName} success, keyCode value ${JSON.stringify(KEYCODE_BUTTON_A)}`);
        ExpectTrue(KEYCODE_BUTTON_A == 2301);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_KEYCODE_BUTTON_B_0100
     * @tc.name: SUB_MMI_Input_Api_KEYCODE_BUTTON_B_0100
     * @tc.desc: Test keycode KEYCODE_BUTTON_B.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_KEYCODE_BUTTON_B_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_KEYCODE_BUTTON_B_0100";
      try {
        let KEYCODE_BUTTON_B = KeyCode.KEYCODE_BUTTON_B;
        console.info(`${caseName} success, keyCode value ${JSON.stringify(KEYCODE_BUTTON_B)}`);
        ExpectTrue(KEYCODE_BUTTON_B == 2302);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_KEYCODE_BUTTON_X_0100
     * @tc.name: SUB_MMI_Input_Api_KEYCODE_BUTTON_X_0100
     * @tc.desc: Test keycode KEYCODE_BUTTON_X.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_KEYCODE_BUTTON_X_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_KEYCODE_BUTTON_X_0100";
      try {
        let KEYCODE_BUTTON_X = KeyCode.KEYCODE_BUTTON_X;
        console.info(`${caseName} success, keyCode value ${JSON.stringify(KEYCODE_BUTTON_X)}`);
        ExpectTrue(KEYCODE_BUTTON_X == 2304);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_KEYCODE_BUTTON_Y_0100
     * @tc.name: SUB_MMI_Input_Api_KEYCODE_BUTTON_Y_0100
     * @tc.desc: Test keycode KEYCODE_BUTTON_Y.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_KEYCODE_BUTTON_Y_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_KEYCODE_BUTTON_Y_0100";
      try {
        let KEYCODE_BUTTON_Y = KeyCode.KEYCODE_BUTTON_Y;
        console.info(`${caseName} success, keyCode value ${JSON.stringify(KEYCODE_BUTTON_Y)}`);
        ExpectTrue(KEYCODE_BUTTON_Y == 2305);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_KEYCODE_BUTTON_L1_0100
     * @tc.name: SUB_MMI_Input_Api_KEYCODE_BUTTON_L1_0100
     * @tc.desc: Test keycode KEYCODE_BUTTON_L1.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_KEYCODE_BUTTON_L1_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_KEYCODE_BUTTON_L1_0100";
      try {
        let KEYCODE_BUTTON_L1 = KeyCode.KEYCODE_BUTTON_L1;
        console.info(`${caseName} success, keyCode value ${JSON.stringify(KEYCODE_BUTTON_L1)}`);
        ExpectTrue(KEYCODE_BUTTON_L1 == 2307);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_KEYCODE_BUTTON_R1_0100
     * @tc.name: SUB_MMI_Input_Api_KEYCODE_BUTTON_R1_0100
     * @tc.desc: Test keycode KEYCODE_BUTTON_R1.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_KEYCODE_BUTTON_R1_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_KEYCODE_BUTTON_R1_0100";
      try {
        let KEYCODE_BUTTON_R1 = KeyCode.KEYCODE_BUTTON_R1;
        console.info(`${caseName} success, keyCode value ${JSON.stringify(KEYCODE_BUTTON_R1)}`);
        ExpectTrue(KEYCODE_BUTTON_R1 == 2308);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_KEYCODE_BUTTON_L2_0100
     * @tc.name: SUB_MMI_Input_Api_KEYCODE_BUTTON_L2_0100
     * @tc.desc: Test keycode KEYCODE_BUTTON_L2.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_KEYCODE_BUTTON_L2_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_KEYCODE_BUTTON_L2_0100";
      try {
        let KEYCODE_BUTTON_L2 = KeyCode.KEYCODE_BUTTON_L2;
        console.info(`${caseName} success, keyCode value ${JSON.stringify(KEYCODE_BUTTON_L2)}`);
        ExpectTrue(KEYCODE_BUTTON_L2 == 2309);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_KEYCODE_BUTTON_R2_0100
     * @tc.name: SUB_MMI_Input_Api_KEYCODE_BUTTON_R2_0100
     * @tc.desc: Test keycode KEYCODE_BUTTON_R2.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_KEYCODE_BUTTON_R2_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_KEYCODE_BUTTON_R2_0100";
      try {
        let KEYCODE_BUTTON_R2 = KeyCode.KEYCODE_BUTTON_R2;
        console.info(`${caseName} success, keyCode value ${JSON.stringify(KEYCODE_BUTTON_R2)}`);
        ExpectTrue(KEYCODE_BUTTON_R2 == 2310);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_KEYCODE_BUTTON_SELECT_0100
     * @tc.name: SUB_MMI_Input_Api_KEYCODE_BUTTON_SELECT_0100
     * @tc.desc: Test keycode KEYCODE_BUTTON_SELECT.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_KEYCODE_BUTTON_SELECT_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_KEYCODE_BUTTON_SELECT_0100";
      try {
        let KEYCODE_BUTTON_SELECT = KeyCode.KEYCODE_BUTTON_SELECT;
        console.info(`${caseName} success, keyCode value ${JSON.stringify(KEYCODE_BUTTON_SELECT)}`);
        ExpectTrue(KEYCODE_BUTTON_SELECT == 2311);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_KEYCODE_BUTTON_START_0100
     * @tc.name: SUB_MMI_Input_Api_KEYCODE_BUTTON_START_0100
     * @tc.desc: Test keycode KEYCODE_BUTTON_START.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_KEYCODE_BUTTON_START_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_KEYCODE_BUTTON_START_0100";
      try {
        let KEYCODE_BUTTON_START = KeyCode.KEYCODE_BUTTON_START;
        console.info(`${caseName} success, keyCode value ${JSON.stringify(KEYCODE_BUTTON_START)}`);
        ExpectTrue(KEYCODE_BUTTON_START == 2312);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_KEYCODE_BUTTON_MODE_0100
     * @tc.name: SUB_MMI_Input_Api_KEYCODE_BUTTON_MODE_0100
     * @tc.desc: Test keycode KEYCODE_BUTTON_MODE.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_KEYCODE_BUTTON_MODE_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_KEYCODE_BUTTON_MODE_0100";
      try {
        let KEYCODE_BUTTON_MODE = KeyCode.KEYCODE_BUTTON_MODE;
        console.info(`${caseName} success, keyCode value ${JSON.stringify(KEYCODE_BUTTON_MODE)}`);
        ExpectTrue(KEYCODE_BUTTON_MODE == 2313);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_KEYCODE_BUTTON_THUMBL_0100
     * @tc.name: SUB_MMI_Input_Api_KEYCODE_BUTTON_THUMBL_0100
     * @tc.desc: Test keycode KEYCODE_BUTTON_THUMBL.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_KEYCODE_BUTTON_THUMBL_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_KEYCODE_BUTTON_THUMBL_0100";
      try {
        let KEYCODE_BUTTON_THUMBL = KeyCode.KEYCODE_BUTTON_THUMBL;
        console.info(`${caseName} success, keyCode value ${JSON.stringify(KEYCODE_BUTTON_THUMBL)}`);
        ExpectTrue(KEYCODE_BUTTON_THUMBL == 2314);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_KEYCODE_BUTTON_THUMBR_0100
     * @tc.name: SUB_MMI_Input_Api_KEYCODE_BUTTON_THUMBR_0100
     * @tc.desc: Test keycode KEYCODE_BUTTON_THUMBR.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_KEYCODE_BUTTON_THUMBR_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_KEYCODE_BUTTON_THUMBR_0100";
      try {
        let KEYCODE_BUTTON_THUMBR = KeyCode.KEYCODE_BUTTON_THUMBR;
        console.info(`${caseName} success, keyCode value ${JSON.stringify(KEYCODE_BUTTON_THUMBR)}`);
        ExpectTrue(KEYCODE_BUTTON_THUMBR == 2315);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });
  });
}