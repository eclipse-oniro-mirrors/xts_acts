/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import Utils from './Utils';
import router from '@system.router';

export default function tabsThirdJsunit() {
  describe('tabsThirdTest', function () {
    beforeEach(async function (done) {
      console.info("tabsThird beforeEach start");
      let options = {
        uri: 'MainAbility/pages/tabsThird',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsThird state pages: " + JSON.stringify(pages));
        if (!("tabsThird" == pages.name)) {
          console.info("get tabsThird state pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push tabsThird page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsThird page error: " + err);
      }
      done();
    });

    /**
     * @tc.number ArkUI_Tabs_BarGridAlign_0200
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_Tabs_BarGridAlign_0200', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_0200] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_BarGridAlign_0200]: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.barGridAlign.margin).assertEqual('0.00vp');
      expect(obj.$attrs.barGridAlign.gutter).assertEqual('0.00vp');
      expect(obj.$attrs.barGridAlign.sm).assertEqual('0');
      expect(obj.$attrs.barGridAlign.md).assertEqual('0');
      expect(obj.$attrs.barGridAlign.lg).assertEqual('0');
      console.info("[ArkUI_Tabs_BarGridAlign_0200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Tabs_BarMode_0200
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_Tabs_BarMode_0200', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarMode_0200] start");
      let strJson = getInspectorByKey('tabsBarModeTest');
      console.info("[ArkUI_Tabs_BarMode_0200]: " + JSON.stringify(strJson));
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_BarMode_0200]: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$attrs.barMode).assertEqual('BarMode.Fixed');
      console.info("[ArkUI_Tabs_BarMode_0200] end");
      done();
    });
  })
}