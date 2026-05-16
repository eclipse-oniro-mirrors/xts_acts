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

export default function tagHandlerNullAndUndefined() {
  describe('tagHandlerNullAndUndefined', () => {
    beforeAll(async () => {
      console.info("tagHandlerNullAndUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureHandler/Tag/TagHandlerNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tagHandlerNullAndUndefined state success " + JSON.stringify(pages));
        if (!("TagHandlerNullAndUndefined" == pages.name)) {
          console.info("get tagHandlerNullAndUndefined state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push tagHandlerNullAndUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tagHandlerNullAndUndefined page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("tagHandlerNullAndUndefined after each called");
    });

    /**
     * @tc.name   tagHandlerEmptyV12001
     * @tc.number SUB_ARKUI_GESTUREHANDLER_TAG_PARAM_001
     * @tc.desc   Test GestureHandler Tag with empty parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('tagHandlerEmptyV12001', Level.LEVEL0, async () => {
      console.info('[tagHandlerEmptyV12001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('tagEmptyBtn'));
      await button.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('tagEmptyResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[tagHandlerEmptyV12001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('tagEmptyTriggered');
      console.info('[tagHandlerEmptyV12001] END');
    });

    /**
     * @tc.name   tagHandlerNullV12002
     * @tc.number SUB_ARKUI_GESTUREHANDLER_TAG_PARAM_002
     * @tc.desc   Test GestureHandler Tag with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('tagHandlerNullV12002', Level.LEVEL0, async () => {
      console.info('[tagHandlerNullV12002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('tagNullBtn'));
      await button.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('tagNullResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[tagHandlerNullV12002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('tagNullTriggered');
      console.info('[tagHandlerNullV12002] END');
    });

    /**
     * @tc.name   tagHandlerUndefinedV12003
     * @tc.number SUB_ARKUI_GESTUREHANDLER_TAG_PARAM_003
     * @tc.desc   Test GestureHandler Tag with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('tagHandlerUndefinedV12003', Level.LEVEL0, async () => {
      console.info('[tagHandlerUndefinedV12003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('tagUndefinedBtn'));
      await button.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('tagUndefinedResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[tagHandlerUndefinedV12003] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('tagUndefinedTriggered');
      console.info('[tagHandlerUndefinedV12003] END');
    });
  })
}
