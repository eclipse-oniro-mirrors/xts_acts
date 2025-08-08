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

export default function CustomSpan() {
  describe('CustomSpan', () => {
    beforeEach(async (done: Function) => {
      console.info("CustomSpan beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/CustomSpan',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CustomSpan state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("CustomSpan" == pages.name)) {
          console.info("get CustomSpan state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push CustomSpan page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CustomSpan page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("CustomSpan after each called");
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0001
    * @tc.name         CustomSpan0001
    * @tc.desic        The CustomSpan Attributes
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('CustomSpan0001', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('StyledString CustomSpan0001 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('invalidate'))
      await CommonFunc.sleep(500);
      await set.click();
      await CommonFunc.sleep(500);
      console.info('StyledString CustomSpan0001 CustomSpanFontSize ' + AppStorage.get('CustomSpanFontSize'));
      expect('' + AppStorage.get('CustomSpanFontSize')).assertEqual('30');
      console.info('StyledString CustomSpan0001 CustomSpanWord ' + AppStorage.get('CustomSpanWord'));
      expect('' + AppStorage.get('CustomSpanWord')).assertEqual('你好');
      AppStorage.delete('CustomSpanFontSize')
      AppStorage.delete('CustomSpanWord')
      console.info("[CustomSpan0001] end");
      done();
    });
  })
}