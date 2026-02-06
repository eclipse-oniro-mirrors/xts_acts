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

export default function TextAreaBindControllerTest() {
  describe('TextAreaBindControllerTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextAreaBindControllerTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/TextAreaBindControllerTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextAreaBindControllerTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        await CommonFunc.sleep(1000);
        if (!("TextAreaBindControllerTest" == pages.name)) {
          console.info("get TextAreaBindControllerTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push TextAreaBindControllerTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAreaBindControllerTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(500);
      console.info("TextAreaBindControllerTest after each called");
    });

    /**
     * @tc.name   TextAreaBindControllerTest0001
     * @tc.number SUB_ACE_BASIC_TEXT_AREA_BIND_CONTROLLER_ETS_API_0001
     * @tc.desc   test FrameNode BindController TextArea  callback success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TextAreaBindControllerTest0001', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('TextAreaBindControllerTest0001 START');
      let textAreaSuccess = await driver.findComponent(ON.id('TextArea_successStr_bnt_id'))
      await CommonFunc.sleep(500);
      await textAreaSuccess.click()
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('TextAreaSuccessStr')).assertEqual('true');
      AppStorage.delete('TextAreaSuccessStr')
      console.info("[TextAreaBindControllerTest0001] end");
      done();
    });

    /**
     * @tc.name   TextAreaBindControllerTest0002
     * @tc.number SUB_ACE_BASIC_TEXT_AREA_BIND_CONTROLLER_ETS_API_0002
     * @tc.desc   test FrameNode BindController TextArea  callback error code 100023
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TextAreaBindControllerTest0002', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('TextAreaBindControllerTest0002 START');
      let textAreaError = await driver.findComponent(ON.id('TextArea_error_bnt100023_id'))
      await CommonFunc.sleep(500);
      await textAreaError.click()
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('TextAreaErrorStr100023')).assertEqual('100023');
      AppStorage.delete('TextAreaErrorStr100023')
      console.info("[TextAreaBindControllerTest0002] end");
      done();
    });
  })
}