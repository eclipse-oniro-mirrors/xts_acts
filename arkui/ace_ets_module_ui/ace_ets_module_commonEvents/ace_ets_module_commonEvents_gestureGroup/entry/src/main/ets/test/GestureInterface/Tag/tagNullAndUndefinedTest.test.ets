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
import CommonFunc from '../../../MainAbility/common/Common'

export default function tagNullAndUndefined() {
  describe('tagNullAndUndefined', () => {
    beforeAll(async () => {
      console.info("tagNullAndUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureInterface/Tag/TagNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tagNullAndUndefined state success " + JSON.stringify(pages));
        if (!("TagNullAndUndefined" == pages.name)) {
          console.info("get tagNullAndUndefined state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push tagNullAndUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tagNullAndUndefined page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("tagNullAndUndefined after each called");
    });

    /**
     * @tc.name   tagEmptyV11001
     * @tc.number SUB_ARKUI_GESTUREINTERFACE_TAG_PARAM_001
     * @tc.desc   Test GestureInterface Tag with empty parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('tagEmptyV11001', Level.LEVEL0, async () => {
      console.info('[tagEmptyV11001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('tagEmptyBtn'));
      await button.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('tagEmptyResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[tagEmptyV11001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('tagEmptyTriggered');
      console.info('[tagEmptyV11001] END');
    });

    /**
     * @tc.name   tagNullV11002
     * @tc.number SUB_ARKUI_GESTUREINTERFACE_TAG_PARAM_002
     * @tc.desc   Test GestureInterface Tag with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('tagNullV11002', Level.LEVEL0, async () => {
      console.info('[tagNullV11002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('tagNullBtn'));
      await button.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('tagNullResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[tagNullV11002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('tagNullTriggered');
      console.info('[tagNullV11002] END');
    });

    /**
     * @tc.name   tagUndefinedV11003
     * @tc.number SUB_ARKUI_GESTUREINTERFACE_TAG_PARAM_003
     * @tc.desc   Test GestureInterface Tag with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('tagUndefinedV11003', Level.LEVEL0, async () => {
      console.info('[tagUndefinedV11003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('tagUndefinedBtn'));
      await button.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('tagUndefinedResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[tagUndefinedV11003] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('tagUndefinedTriggered');
      console.info('[tagUndefinedV11003] END');
    });
  })
}
