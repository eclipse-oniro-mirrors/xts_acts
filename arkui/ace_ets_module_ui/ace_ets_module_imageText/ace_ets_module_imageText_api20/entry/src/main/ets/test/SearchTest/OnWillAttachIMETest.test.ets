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

export default function OnWillAttachIMETest() {
  describe('OnWillAttachIMETest', () => {
    beforeEach(async (done: Function) => {
      console.info("OnWillAttachIMETest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/OnWillAttachIMETest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OnWillAttachIMETest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        await CommonFunc.sleep(1000);
        if (!("OnWillAttachIMETest" == pages.name)) {
          console.info("get OnWillAttachIMETest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push OnWillAttachIMETest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OnWillAttachIMETest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("OnWillAttachIMETest after each called");
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ON_WILL_ATTACH_IME_ETS_API_0001
    * @tc.name         OnWillAttachIMETest0001
    * @tc.desc         test  Search onWillAttachIME callback
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        3
     */
    it('OnWillAttachIMETest0001', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('OnWillAttachIMETest0001 START');
      let search = await driver.findComponent(ON.id('OnWillAttachIMESearch'))
      await CommonFunc.sleep(500);
      await search.click()
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('SearchClient')).assertContain('"nodeId":');
      await driver.triggerKey(2070);
      AppStorage.delete('SearchClient')
      console.info("[OnWillAttachIMETest0001] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ON_WILL_ATTACH_IME_ETS_API_0002
    * @tc.name         OnWillAttachIMETest0002
    * @tc.desc         test  TextInput onWillAttachIME callback
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        3
     */
    it('OnWillAttachIMETest0002', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('OnWillAttachIMETest0002 START');
      let textInput = await driver.findComponent(ON.id('OnWillAttachIMETextInput'))
      await CommonFunc.sleep(500);
      await textInput.click()
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('TextInputClient')).assertContain('"nodeId":');
      await driver.triggerKey(2070);
      AppStorage.delete('TextInputClient')
      console.info("[OnWillAttachIMETest0002] end");
      done();
    });
  })
}