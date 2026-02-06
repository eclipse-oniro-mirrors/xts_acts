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

export default function TextAreaOnWillAttachIMETest() {
  describe('TextAreaOnWillAttachIMETest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextAreaOnWillAttachIMETest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextAreaApi22/TextAreaOnWillAttachIME',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextAreaOnWillAttachIMETest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        await CommonFunc.sleep(1000);
        if (!("TextAreaOnWillAttachIME" == pages.name)) {
          console.info("get TextAreaOnWillAttachIMETest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push TextAreaOnWillAttachIMETest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAreaOnWillAttachIMETest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextAreaOnWillAttachIMETest after each called");
    });

    /**
     * @tc.name   TextAreaOnWillAttachIMETest_0010
     * @tc.number SUB_ACE_BASIC_ETS_API_TextAreaOnWillAttachIMETest_0010
     * @tc.desc   test TextArea: OnWillAttachIME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaOnWillAttachIMETest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaOnWillAttachIMETest_0010] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let TextArea = await driver.findComponent(ON.id('TextArea_onWillAttachIME'))
      await CommonFunc.sleep(500);
      await TextArea.click()
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('TextArea_onWillAttachIME')).assertEqual('onWillAttachIME');
      AppStorage.delete('TextArea_onWillAttachIME')
      console.info("[TextAreaOnWillAttachIMETest_0010] END");
      done();
    });

    /**
     * @tc.name   TextAreaOnWillAttachIMETest_0020
     * @tc.number SUB_ACE_BASIC_ETS_API_TextAreaOnWillAttachIMETest_0020
     * @tc.desc   test TextAreaModifier: OnWillAttachIME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaOnWillAttachIMETest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaOnWillAttachIMETest_0020] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let TextArea = await driver.findComponent(ON.id('TextAreaModifier_onWillAttachIME'))
      await CommonFunc.sleep(500);
      await TextArea.click()
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('TextAreaModifier_onWillAttachIME')).assertEqual('onWillAttachIME');
      AppStorage.delete('TextAreaModifier_onWillAttachIME')
      console.info("[TextAreaOnWillAttachIMETest_0020] END");
      done();
    });
  })
}