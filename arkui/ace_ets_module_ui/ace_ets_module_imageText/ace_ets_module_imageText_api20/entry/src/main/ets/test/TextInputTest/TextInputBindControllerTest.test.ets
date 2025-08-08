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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function TextInputBindControllerTest() {
  describe('TextInputBindControllerTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextInputBindControllerTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/TextInputBindControllerTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputBindControllerTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        await CommonFunc.sleep(1000);
        if (!("TextInputBindControllerTest" == pages.name)) {
          console.info("get TextInputBindControllerTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push TextInputBindControllerTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputBindControllerTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(500);
      console.info("TextInputBindControllerTest after each called");
    });

    /*
    * @tc.number       SUB_ACE_BASIC_TEXT_INPUT_BIND_CONTROLLER_ETS_API_0001
    * @tc.name         TextInputBindControllerTest0001
    * @tc.desc         test FrameNode BindController TextInput  callback success
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        3
     */
    it('TextInputBindControllerTest0001', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('TextInputBindControllerTest0001 START');
      let textInputSuccess = await driver.findComponent(ON.id('TextInput_successStr_bnt_id'))
      await CommonFunc.sleep(500);
      await textInputSuccess.click()
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('TextInputSuccessStr')).assertEqual('true');
      AppStorage.delete('TextInputSuccessStr')
      console.info("[TextInputBindControllerTest0001] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_TEXT_INPUT_BIND_CONTROLLER_ETS_API_0002
    * @tc.name         TextInputBindControllerTest0002
    * @tc.desc         test FrameNode BindController TextInput  callback error code 100023
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        3
     */
    it('TextInputBindControllerTest0002', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('TextInputBindControllerTest0002 START');
      let textInputError = await driver.findComponent(ON.id('TextInput_error_bnt100023_id'))
      await CommonFunc.sleep(500);
      await textInputError.click()
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('TextInputErrorStr100023')).assertEqual('100023');
      AppStorage.delete('TextInputErrorStr100023')
      console.info("[TextInputBindControllerTest0002] end");
      done();
    });
  })
}