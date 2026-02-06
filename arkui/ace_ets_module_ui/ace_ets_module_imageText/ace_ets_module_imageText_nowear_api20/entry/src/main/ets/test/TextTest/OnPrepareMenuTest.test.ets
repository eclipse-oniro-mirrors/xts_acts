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

export default function OnPrepareMenuTest() {
  describe('OnPrepareMenuTest', () => {
    beforeEach(async (done: Function) => {
      console.info("OnPrepareMenuTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/OnPrepareMenuTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OnPrepareMenuTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("OnPrepareMenuTest" == pages.name)) {
          console.info("get OnPrepareMenuTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push OnPrepareMenuTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OnPrepareMenuTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("OnPrepareMenuTest after each called");
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_TEXT_AREA_ON_PREPARE_MENU_API_0001
    * @tc.name         OnPrepareMenuTest0001
    * @tc.desc         test editMenuOptions onPrepareMenu callback
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        3
     */
    it('OnPrepareMenuTest0001', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('OnPrepareMenuTest0001 START');
      let TextArea = await driver.findComponent(ON.id('TestOnPrepareMenu'))
      await CommonFunc.sleep(500);
      await TextArea.longClick()
      await CommonFunc.sleep(500);
      await driver.assertComponentExist(ON.text('prepare1'))
      let Button = await driver.findComponent(ON.text('prepare1'));
      if(Button){
         expect("").assertEqual("")
     }else{
         expect("false").assertEqual("")
     }
      console.info("[OnPrepareMenuTest0001] end");
      done();
    });
  })
}