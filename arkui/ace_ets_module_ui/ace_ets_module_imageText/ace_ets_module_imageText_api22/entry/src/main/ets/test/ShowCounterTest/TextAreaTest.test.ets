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

export default function TextAreaTest() {
  describe('TextAreaTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextAreaTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ShowCounterTest/TextAreaTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextAreaTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        await CommonFunc.sleep(1000);
        if (!("TextAreaTest" == pages.name)) {
          console.info("get TextAreaTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push TextAreaTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAreaTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextAreaTest after each called");
    });
    /**
     * @tc.name    TextAreaTest_0030
     * @tc.number  TextAreaTest_0030
     * @tc.desc    TextArea ShowCounter test succ
     * @tc.level   LEVEL2
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('TextAreaTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaTest_0030] START');
      let strJson = getInspectorByKey('textArea');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaTest_0030] showCounter: ' + JSON.stringify(obj.$attrs.showCounterApi22));
      expect(obj.$attrs.showCounterApi22.options.counterTextColor+'').assertEqual('#FFFF0000');
      expect(obj.$attrs.showCounterApi22.options.counterTextOverflowColor+'').assertEqual('#FFFFA500');
      console.info("[TextAreaTest_0030] END");
      done();
    });
  })
}