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
import { describe, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function TextInputOnWillAttachIMETest() {
  describe('TextInputOnWillAttachIMETest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextInputOnWillAttachIMETest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInputApi22/TextInputOnWillAttachIME',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputOnWillAttachIMETest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        await CommonFunc.sleep(1000);
        if (!("TextInputOnWillAttachIME" == pages.name)) {
          console.info("get TextInputOnWillAttachIMETest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push TextInputOnWillAttachIMETest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputOnWillAttachIMETest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextInputOnWillAttachIMETest after each called");
    });

    /**
     * @tc.name   TextInputOnWillAttachIMETest_0010
     * @tc.number SUB_ACE_BASIC_ETS_API_TextInputOnWillAttachIMETest_0010
     * @tc.desc   test TextInput: OnWillAttachIME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextInputOnWillAttachIMETest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[TextInputOnWillAttachIMETest_0010] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let TextInput = await driver.findComponent(ON.id('TextInput_onWillAttachIME'))
      await CommonFunc.sleep(500);
      await TextInput.click()
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('TextInput_onWillAttachIME')).assertEqual('onWillAttachIME');
      AppStorage.delete('TextInput_onWillAttachIME')
      console.info("[TextInputOnWillAttachIMETest_0010] END");
      done();
    });

    /**
     * @tc.name   TextInputOnWillAttachIMETest_0020
     * @tc.number SUB_ACE_BASIC_ETS_API_TextInputOnWillAttachIMETest_0020
     * @tc.desc   test TextInputModifier: OnWillAttachIME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextInputOnWillAttachIMETest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[TextInputOnWillAttachIMETest_0020] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let TextInput = await driver.findComponent(ON.id('TextInputModifier_onWillAttachIME'))
      await CommonFunc.sleep(500);
      await TextInput.click()
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('TextInputModifier_onWillAttachIME')).assertEqual('onWillAttachIME');
      AppStorage.delete('TextInputModifier_onWillAttachIME')
      console.info("[TextInputOnWillAttachIMETest_0020] END");
      done();
    });
  })
}