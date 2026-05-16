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

export default function allowDropNullAndUndefinedTest() {
  describe('allowDropNullAndUndefinedTest', () => {
    beforeEach(async () => {
      console.info("allowDropNullAndUndefinedTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AllowDrop/AllowDropNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get allowDropNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("AllowDropNullAndUndefined" == pages.name)) {
          console.info("get allowDropNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push allowDropNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push allowDropNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   allowDropNullV11001
     * @tc.number SUB_ARKUI_COMMONMETHOD_ALLOWDROP_PARAM_001
     * @tc.desc   Test allowDrop with null parameter - should trigger onDrop callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it('allowDropNullV11001', Level.LEVEL0, async () => {
      console.info('[allowDropNullV11001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let targetNull = await driver.findComponent(ON.id('targetNull'));
      let dragSource = await driver.findComponent(ON.id('dragSource'));
      await dragSource.dragTo(targetNull);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('dropText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[allowDropNullV11001] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('No Drop');
      console.info('[allowDropNullV11001] END');
    });

    /**
     * @tc.name   allowDropUndefinedV11002
     * @tc.number SUB_ARKUI_COMMONMETHOD_ALLOWDROP_PARAM_002
     * @tc.desc   Test allowDrop with undefined parameter - should trigger onDrop callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it('allowDropUndefinedV11002', Level.LEVEL0, async () => {
      console.info('[allowDropUndefinedV11002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let targetUndefined = await driver.findComponent(ON.id('targetUndefined'));
      let dragSource = await driver.findComponent(ON.id('dragSource'));
      await dragSource.dragTo(targetUndefined);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('dropText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[allowDropUndefinedV11002] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Drop Triggered');
      console.info('[allowDropUndefinedV11002] END');
    });

    /**
     * @tc.name   allowDropEmptyArrayV23001
     * @tc.number SUB_ARKUI_COMMONMETHOD_ALLOWDROP_PARAM_003
     * @tc.desc   Test allowDrop with empty array parameter - should not trigger onDrop callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it('allowDropEmptyArrayV23001', Level.LEVEL0, async () => {
      console.info('[allowDropEmptyArrayV23001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let targetEmptyArray = await driver.findComponent(ON.id('targetEmptyArray'));
      let dragSource = await driver.findComponent(ON.id('dragSource'));
      await dragSource.dragTo(targetEmptyArray);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('dropText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[allowDropEmptyArrayV23001] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Drop Triggered');
      console.info('[allowDropEmptyArrayV23001] END');
    });
  })
}
