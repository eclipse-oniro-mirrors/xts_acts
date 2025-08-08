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

export default function StyledStringOnTouchTest() {
  describe('StyledStringOnTouchTest', () => {
    beforeEach(async (done: Function) => {
      console.info("StyledStringOnTouchTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/StyledStringOnTouchTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StyledStringOnTouchTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        await CommonFunc.sleep(1000);
        if (!("StyledStringOnTouchTest" == pages.name)) {
          console.info("get StyledStringOnTouchTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push StyledStringOnTouchTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StyledStringOnTouchTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(500);
      console.info("StyledStringOnTouchTest after each called");
    });

    /*
    * @tc.number       SUB_ACE_BASIC_STYLED_STRING_ON_TOUCH_ETS_API_0001
    * @tc.name         StyledStringOnTouchTest0001
    * @tc.desc         test StyledString OnHover callback
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('StyledStringOnTouchTest0001', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('StyledStringOnTouchTest0001 START');
      let styledString = await driver.findComponent(ON.id('StyledStringOnTouchText_id'))
      await CommonFunc.sleep(500);
      await styledString.click()
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('StyledStringOnTouch')).assertEqual('true');
      AppStorage.delete('StyledStringOnTouch')
      console.info("[StyledStringOnTouchTest0001] end");
      done();
    });
  })
}