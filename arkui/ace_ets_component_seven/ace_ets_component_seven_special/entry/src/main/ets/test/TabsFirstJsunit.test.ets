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

import router from '@ohos.router'
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium'
import Utils from './Utils';
export default function tabsFirstJsunit() {
  describe('tabsFirstTest', () => {
    beforeEach(async (done: Function) => {
      console.info("tabsFirst beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/tabsFirst',
      }
      let result: ESObject;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsFirst state pages: " + JSON.stringify(pages));
        if (!("tabsFirst" == pages.name)) {
          console.info("get tabsFirst state pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push tabsFirst page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsFirst page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_Divider_0300
     * @tc.number ArkUI_Tabs_Divider_0300
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Tabs_Divider_0300', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Tabs_Divider_0300 start");
      let strJson = getInspectorByKey('tabsTest2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_Divider_0300] divider:" + JSON.stringify(obj.$attrs.divider));
      let dividerObject: ESObject = obj.$attrs.divider;
      expect(dividerObject.strokeWidth).assertEqual("10.00vp");
      expect(dividerObject.color).assertEqual('#FFFF0000');
      expect(dividerObject.startMargin).assertEqual("5.00vp");
      expect(dividerObject.endMargin).assertEqual("5.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_FadingEdge_0100
     * @tc.number ArkUI_Tabs_FadingEdge_0100
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_Tabs_FadingEdge_0100', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Tabs_FadingEdge_0100 start");      
      let strJson = getInspectorByKey('tabsTest2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_FadingEdge_0100] fadingEdge:" + obj.$attrs.fadingEdge);
      expect(obj.$attrs.fadingEdge).assertEqual('true');
      done();
    });

  })
}
