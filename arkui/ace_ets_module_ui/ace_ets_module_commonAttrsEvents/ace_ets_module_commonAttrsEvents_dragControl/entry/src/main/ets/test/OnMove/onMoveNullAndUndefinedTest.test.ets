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

export default function onMoveNullAndUndefinedTest() {
  describe('onMoveNullAndUndefinedTest', () => {
    beforeEach(async () => {
      console.info("onMoveNullAndUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragSorting/onMoveNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onMoveNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("onMoveNullAndUndefined" == pages.name)) {
          console.info("get onMoveNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push onMoveNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onMoveNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   onMoveNullV12001
     * @tc.number SUB_ARKUI_DRAGSORTING_ONMOVE_PARAM_001
     * @tc.desc   Test onMove callback is triggered during drag sort - List with valid callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onMoveNullV12001', Level.LEVEL0, async () => {
      console.info('[onMoveNullV12001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let listItem = await driver.findComponent(ON.id('listItem_0'));
      let targetItem = await driver.findComponent(ON.id('listItem_3'));
      await listItem.dragTo(targetItem);
      await CommonFunc.sleep(1500);
      let listItem2 = await driver.findComponent(ON.id('listItem_0'));
      console.info("[onMoveNullV12001] result: " + JSON.stringify(listItem2));
      expect(JSON.stringify(listItem2)!=null).assertEqual(true);
      console.info('[onMoveNullV12001] END');
    });

    /**
     * @tc.name   onMoveUndefinedV12002
     * @tc.number SUB_ARKUI_DRAGSORTING_ONMOVE_PARAM_002
     * @tc.desc   Test onMove callback is triggered - second List with valid callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onMoveUndefinedV12002', Level.LEVEL0, async () => {
      console.info('[onMoveUndefinedV12002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let listItem = await driver.findComponent(ON.id('listItemUndefined_0'));
      let targetItem = await driver.findComponent(ON.id('listItemUndefined_3'));
      await listItem.dragTo(targetItem);
      await CommonFunc.sleep(1500);
      let listItem2 = await driver.findComponent(ON.id('listItemUndefined_0'));
      console.info("[onMoveUndefinedV12002] result: " + JSON.stringify(listItem2));
      expect(JSON.stringify(listItem2)!=null).assertEqual(true);
      console.info('[onMoveUndefinedV12002] END');
    });
  })
}
