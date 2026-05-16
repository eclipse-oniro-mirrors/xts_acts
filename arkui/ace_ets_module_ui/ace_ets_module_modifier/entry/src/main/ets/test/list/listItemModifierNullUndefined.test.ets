/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, PointerMatrix} from '@ohos.UiTest';
import Utils from '../Utils';

export default function listItemModifierNullUndefined() {
  describe('listItemModifierNullUndefined', () => {
    beforeEach(async (done: Function) => {
      console.info("listItemModifierNullUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/list/listItemModifierNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get listItemModifierNullUndefined state pages: " + JSON.stringify(pages));
        if (!("listItemModifierNullUndefined" == pages.name)) {
          console.info("get listItemModifierNullUndefined state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push listItemModifierNullUndefined success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listItemModifierNullUndefined page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   listItemModifierNullUndefinedTest_0100
     * @tc.number listItemModifierNullUndefinedTest_0100
     * @tc.desc   Test ListItemModifier applyNormalAttribute property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemModifierNullUndefinedTest_0100', Level.LEVEL0, async () => {
      console.info('[listItemModifierNullUndefinedTest_0100] START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_listItemModifier_null'));
      await button1.click();
      await Utils.sleep(1500);
      expect(AppStorage.get('ListItemAttributeNullUndefined')).assertEqual(null);
      AppStorage.delete('ListItemAttributeNullUndefined')
      console.info('[listItemModifierNullUndefinedTest_0100] END');
    })

    /**
     * @tc.name   listItemModifierNullUndefinedTest_0200
     * @tc.number listItemModifierNullUndefinedTest_0200
     * @tc.desc   Test ListItemModifier applyNormalAttribute property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemModifierNullUndefinedTest_0200', Level.LEVEL0, async () => {
      console.info('[listItemModifierNullUndefinedTest_0200] START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_listItemModifier_undefined'));
      await button1.click();
      await Utils.sleep(1500);
      expect(AppStorage.get('ListItemAttributeNullUndefined')).assertEqual(undefined);
      AppStorage.delete('ListItemAttributeNullUndefined')
      console.info('[listItemModifierNullUndefinedTest_0200] END');
    })

  })
}
