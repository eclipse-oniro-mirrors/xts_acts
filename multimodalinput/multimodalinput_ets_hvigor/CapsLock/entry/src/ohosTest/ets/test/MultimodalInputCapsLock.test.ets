/*
 * Copyright (C) 2025 Huawei Device cO., lTD.
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
import { inputDevice } from '@kit.InputKit';
import { BusinessError }  from '@ohos.base';

export default function MultimodalInputCapsLockTest() {
  describe("MultimodalInputCapsLockTest", ()=> {
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
     * @tc.number: SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0100
     * @tc.name: SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0100
     * @tc.desc: Test promise setFunctionKeyEnabled and isFunctionKeyEnabled interface to call a non-input method application.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0100";
      try {
        let state1 = await inputDevice.isFunctionKeyEnabled(1).then((state1: boolean) => {
          console.info(`${caseName} capslock state1: ${JSON.stringify(state1)}`);
          return state1;
        });
        await inputDevice.setFunctionKeyEnabled(1, Boolean(state1)).then(() => {
          console.info(`${caseName} Set capslock state success`);
        }).catch((error: BusinessError) => {
          console.info(`${caseName} Set capslock state failed, error=${JSON.stringify(error)}`);
          ExpectTrue(error.code == 3900003);
          done();
        });
        await inputDevice.isFunctionKeyEnabled(1).then((state2: boolean) => {
          console.info(`${caseName} capslock state2: ${JSON.stringify(state2)}`);
          ExpectTrue(state1 == state2);
          done();
        });
      } catch (error) {
        console.info(`${caseName} failed to get capslock state, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectTrue(error.code == 3900002);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0200
     * @tc.name: SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0200
     * @tc.desc: Test promise setFunctionKeyEnabled interface to  set error FunctionKey(10000).
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0200", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0200";
      try {
        await inputDevice.setFunctionKeyEnabled(10000, true).then(() => {
          console.info(`${caseName} Set capslock state success`);
          ExpectFalse(true);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} Set capslock state failed, error=${JSON.stringify(error)}`);
          ExpectFalse(true);
          done();
        });
      } catch (error) {
        console.info(`${caseName} failed to set capslock state, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectTrue(error.code == 401);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0300
     * @tc.name: SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0300
     * @tc.desc: Test promise setFunctionKeyEnabled interface to  set error FunctionKey(-1).
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0300", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0300";
      try {
        await inputDevice.setFunctionKeyEnabled(-1, false).then(() => {
          console.info(`${caseName} Set capslock state success`);
          ExpectFalse(true);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} Set capslock state failed, error=${JSON.stringify(error)}`);
          ExpectFalse(true);
          done();
        });
      } catch (error) {
        console.info(`${caseName} failed to set capslock state, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectTrue(error.code == 401);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0400
     * @tc.name: SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0400
     * @tc.desc: Test promise setFunctionKeyEnabled interface to call a non-input method application.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0400", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0400";
      try {
        await inputDevice.setFunctionKeyEnabled(1, false).then(() => {
          console.info(`${caseName} Set capslock state success`);
          ExpectFalse(true);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} Set capslock state failed, error=${JSON.stringify(error)}`);
          ExpectTrue(error.code == 3900003);
          done();
        });
      } catch (error) {
        console.info(`${caseName} failed to set capslock state, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });
  });
}