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

export default function TextInputTest() {
  describe('TextInputTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextInputTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ShowCounterTest/TextInputTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        await CommonFunc.sleep(1000);
        if (!("TextInputTest" == pages.name)) {
          console.info("get TextInputTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push TextInputTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextInputTest after each called");
    });

    /**
     * @tc.name   TextInputTest_0040
     * @tc.number TextInputTest_0040
     * @tc.desc   Test the alt interface to set normal values
     * @tc.level  LEVEL2
     * @tc.type   Function
     * @tc.size   MediumTest
     */
    it('TextInputTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[TextInputTest_0040] START');
      let strJson = getInspectorByKey('textInput');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextInputTest_0040] showCounter: ' + JSON.stringify(obj.$attrs.showCounterApi22));
      expect(obj.$attrs.showCounterApi22.options.counterTextColor+'').assertEqual('#FFFF0000');
      expect(obj.$attrs.showCounterApi22.options.counterTextOverflowColor+'').assertEqual('#FFFFA500');
      console.info("[TextInputTest_0040] END");
      done();
    });
  })
}