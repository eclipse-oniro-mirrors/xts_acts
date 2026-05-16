/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function nextFocusNullAndUndefinedTest() {
  describe('nextFocusNullAndUndefinedTest', () => {
    beforeEach(async () => {
      console.info("nextFocusNullAndUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonMethod/nextFocusNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get nextFocusNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("nextFocusNullAndUndefined" == pages.name)) {
          console.info("get nextFocusNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push nextFocusNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push nextFocusNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   nextFocusNullV18001
     * @tc.number SUB_ARKUI_COMMONMETHOD_NEXTFOCUS_PARAM_001
     * @tc.desc   Test nextFocus with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('nextFocusNullV18001', Level.LEVEL0, async () => {
      console.info('[nextFocusNullV18001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('focusText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[nextFocusNullV18001] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('nextFocusNullFocused');
      console.info('[nextFocusNullV18001] END');
    });

    /**
     * @tc.name   nextFocusUndefinedV18002
     * @tc.number SUB_ARKUI_COMMONMETHOD_NEXTFOCUS_PARAM_002
     * @tc.desc   Test nextFocus with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('nextFocusUndefinedV18002', Level.LEVEL0, async () => {
      console.info('[nextFocusUndefinedV18002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('focusText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[nextFocusUndefinedV18002] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('nextFocusUndefinedFocused');
      console.info('[nextFocusUndefinedV18002] END');
    });
  })
}
