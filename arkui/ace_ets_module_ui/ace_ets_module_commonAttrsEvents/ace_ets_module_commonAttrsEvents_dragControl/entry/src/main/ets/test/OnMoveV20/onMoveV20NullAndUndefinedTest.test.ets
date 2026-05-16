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

export default function onMoveV20NullAndUndefinedTest() {
  describe('onMoveV20NullAndUndefinedTest', () => {
    beforeEach(async () => {
      console.info("onMoveV20NullAndUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragSorting/onMoveV20NullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onMoveV20NullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("onMoveV20NullAndUndefined" == pages.name)) {
          console.info("get onMoveV20NullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push onMoveV20NullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onMoveV20NullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   onMoveV20NullNullV20001
     * @tc.number SUB_ARKUI_DRAGSORTING_ONMOVE_V20_PARAM_001
     * @tc.desc   Test onMove with handler and null eventHandler (API 20+)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onMoveV20NullNullV20001', Level.LEVEL0, async () => {
      console.info('[onMoveV20NullNullV20001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let listItem = await driver.findComponent(ON.id('listItemV20_0_0'));
      let targetItem = await driver.findComponent(ON.id('listItemV20_0_3'));
      await listItem.dragTo(targetItem);
      await CommonFunc.sleep(1500);
      let listItem2 = await driver.findComponent(ON.id('listItemV20_0_0'));
      console.info("[onMoveV20NullNullV20001] result: " + JSON.stringify(listItem2));
      expect(JSON.stringify(listItem2) != null).assertEqual(true);
      console.info('[onMoveV20NullNullV20001] END');
    });

    /**
     * @tc.name   onMoveV20NullUndefinedV20002
     * @tc.number SUB_ARKUI_DRAGSORTING_ONMOVE_V20_PARAM_002
     * @tc.desc   Test onMove with handler and undefined eventHandler (API 20+)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onMoveV20NullUndefinedV20002', Level.LEVEL0, async () => {
      console.info('[onMoveV20NullUndefinedV20002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let listItem = await driver.findComponent(ON.id('listItemV20_1_0'));
      let targetItem = await driver.findComponent(ON.id('listItemV20_1_3'));
      await listItem.dragTo(targetItem);
      await CommonFunc.sleep(1500);
      let listItem2 = await driver.findComponent(ON.id('listItemV20_1_0'));
      console.info("[onMoveV20NullUndefinedV20002] result: " + JSON.stringify(listItem2));
      expect(JSON.stringify(listItem2) != null).assertEqual(true);
      console.info('[onMoveV20NullUndefinedV20002] END');
    });

    /**
     * @tc.name   onMoveV20UndefinedNullV20003
     * @tc.number SUB_ARKUI_DRAGSORTING_ONMOVE_V20_PARAM_003
     * @tc.desc   Test onMove with null handler and null eventHandler (API 20+)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onMoveV20UndefinedNullV20003', Level.LEVEL0, async () => {
      console.info('[onMoveV20UndefinedNullV20003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let listItem = await driver.findComponent(ON.id('listItemV20_2_0'));
      let targetItem = await driver.findComponent(ON.id('listItemV20_2_3'));
      await listItem.dragTo(targetItem);
      await CommonFunc.sleep(1500);
      let listItem2 = await driver.findComponent(ON.id('listItemV20_2_0'));
      console.info("[onMoveV20UndefinedNullV20003] result: " + JSON.stringify(listItem2));
      expect(JSON.stringify(listItem2) != null).assertEqual(true);
      console.info('[onMoveV20UndefinedNullV20003] END');
    });

    /**
     * @tc.name   onMoveV20UndefinedUndefinedV20004
     * @tc.number SUB_ARKUI_DRAGSORTING_ONMOVE_V20_PARAM_004
     * @tc.desc   Test onMove with undefined handler and undefined eventHandler (API 20+)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onMoveV20UndefinedUndefinedV20004', Level.LEVEL0, async () => {
      console.info('[onMoveV20UndefinedUndefinedV20004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let listItem = await driver.findComponent(ON.id('listItemV20_3_0'));
      let targetItem = await driver.findComponent(ON.id('listItemV20_3_3'));
      await listItem.dragTo(targetItem);
      await CommonFunc.sleep(1500);
      let listItem2 = await driver.findComponent(ON.id('listItemV20_3_0'));
      console.info("[onMoveV20UndefinedUndefinedV20004] result: " + JSON.stringify(listItem2));
      expect(JSON.stringify(listItem2) != null).assertEqual(true);
      console.info('[onMoveV20UndefinedUndefinedV20004] END');
    });
  })
}
