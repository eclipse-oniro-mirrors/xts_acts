/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of this License at
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
import { Driver, ON, Component } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function keyboardShortcutNullTest() {
  describe('keyboardShortcutNullTest', () => {
    beforeAll(async () => {
      console.info("keyboardShortcutNullTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/keyboardShortcutNull/keyboardShortcutNull'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get keyboardShortcutNullTest state success " + JSON.stringify(pages));
        if (!("keyboardShortcutNull" == pages.name)) {
          console.info("get keyboardShortcutNullTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push keyboardShortcutNullTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push keyboardShortcutNullTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("keyboardShortcutNullTest after each called");
    });

    /**
     * @tc.name   keyboardShortcutValueNull001
     * @tc.number SUB_ARKUI_KEYBOARDSHORTCUT_VALUENULL_001
     * @tc.desc   Test keyboardShortcut with value null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('keyboardShortcutValueNull001', Level.LEVEL0, async () => {
      console.info('[keyboardShortcutValueNull001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      
      let btn = await driver.findComponent(ON.text('Test short cut 1'));
      await btn.click();
      await CommonFunc.sleep(1000);
      
      let strJson = getInspectorByKey('resultTextKeyboardShortcut');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[keyboardShortcutValueNull001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('I clicked Button 1');
      console.info('[keyboardShortcutValueNull001] END');
    });

    /**
     * @tc.name   keyboardShortcutValueUndefined002
     * @tc.number SUB_ARKUI_KEYBOARDSHORTCUT_VALUEUNDEFINED_002
     * @tc.desc   Test keyboardShortcut with value undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('keyboardShortcutValueUndefined002', Level.LEVEL0, async () => {
      console.info('[keyboardShortcutValueUndefined002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      
      let btn = await driver.findComponent(ON.text('Test short cut 2'));
      await btn.click();
      await CommonFunc.sleep(1000);
      
      let strJson = getInspectorByKey('resultTextKeyboardShortcut');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[keyboardShortcutValueUndefined002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('I clicked Button 2');
      console.info('[keyboardShortcutValueUndefined002] END');
    });

    /**
     * @tc.name   keyboardShortcutValueEmpty003
     * @tc.number SUB_ARKUI_KEYBOARDSHORTCUT_VALUEEMPTY_003
     * @tc.desc   Test keyboardShortcut with value empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('keyboardShortcutValueEmpty003', Level.LEVEL0, async () => {
      console.info('[keyboardShortcutValueEmpty003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      
      let btn = await driver.findComponent(ON.text('Test short cut 3'));
      await btn.click();
      await CommonFunc.sleep(1000);
      
      let strJson = getInspectorByKey('resultTextKeyboardShortcut');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[keyboardShortcutValueEmpty003] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('I clicked Button 3');
      console.info('[keyboardShortcutValueEmpty003] END');
    });

    /**
     * @tc.name   keyboardShortcutKeysNull004
     * @tc.number SUB_ARKUI_KEYBOARDSHORTCUT_KEYSNULL_004
     * @tc.desc   Test keyboardShortcut with keys null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('keyboardShortcutKeysNull004', Level.LEVEL0, async () => {
      console.info('[keyboardShortcutKeysNull004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      
      let btn = await driver.findComponent(ON.text('Test short cut 4'));
      await btn.click();
      await CommonFunc.sleep(1000);
      
      let strJson = getInspectorByKey('resultTextKeyboardShortcut');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[keyboardShortcutKeysNull004] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('I clicked Button 4');
      console.info('[keyboardShortcutKeysNull004] END');
    });

    /**
     * @tc.name   keyboardShortcutKeysUndefined005
     * @tc.number SUB_ARKUI_KEYBOARDSHORTCUT_KEYSUNDEFINED_005
     * @tc.desc   Test keyboardShortcut with keys undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('keyboardShortcutKeysUndefined005', Level.LEVEL0, async () => {
      console.info('[keyboardShortcutKeysUndefined005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      
      let btn = await driver.findComponent(ON.text('Test short cut 5'));
      await btn.click();
      await CommonFunc.sleep(1000);
      
      let strJson = getInspectorByKey('resultTextKeyboardShortcut');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[keyboardShortcutKeysUndefined005] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('I clicked Button 5');
      console.info('[keyboardShortcutKeysUndefined005] END');
    });
  })
}
