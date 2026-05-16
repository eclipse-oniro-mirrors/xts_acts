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

export default function gestureNullAndUndefined() {
  describe('gestureNullAndUndefined', () => {
    beforeAll(async () => {
      console.info("gestureNullAndUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Gesture/GestureNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gestureNullAndUndefined state success " + JSON.stringify(pages));
        if (!("GestureNullAndUndefined" == pages.name)) {
          console.info("get gestureNullAndUndefined state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push gestureNullAndUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gestureNullAndUndefined page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("gestureNullAndUndefined after each called");
    });

    /**
     * @tc.name   gestureNullV11001
     * @tc.number SUB_ARKUI_COMMONMETHOD_GESTURE_PARAM_001
     * @tc.desc   Test gesture with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('gestureNullV11001', Level.LEVEL0, async () => {
      console.info('[gestureNullV11001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('gestureNull'));
      await button.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('gestureNullResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[gestureNullV11001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Init');
      console.info('[gestureNullV11001] END');
    });

    /**
     * @tc.name   gestureUndefinedV11002
     * @tc.number SUB_ARKUI_COMMONMETHOD_GESTURE_PARAM_002
     * @tc.desc   Test gesture with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('gestureUndefinedV11002', Level.LEVEL0, async () => {
      console.info('[gestureUndefinedV11002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('gestureUndefined'));
      await button.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('gestureUndefinedResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[gestureUndefinedV11002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Init');
      console.info('[gestureUndefinedV11002] END');
    });

    /**
     * @tc.name   gestureMaskNullV11003
     * @tc.number SUB_ARKUI_COMMONMETHOD_GESTURE_PARAM_003
     * @tc.desc   Test gesture with null mask parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('gestureMaskNullV11003', Level.LEVEL0, async () => {
      console.info('[gestureMaskNullV11003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('gestureMaskNull'));
      await button.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('gestureMaskNullResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[gestureMaskNullV11003] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('gestureMaskNullTriggered');
      console.info('[gestureMaskNullV11003] END');
    });

    /**
     * @tc.name   gestureMaskUndefinedV11004
     * @tc.number SUB_ARKUI_COMMONMETHOD_GESTURE_PARAM_004
     * @tc.desc   Test gesture with undefined mask parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('gestureMaskUndefinedV11004', Level.LEVEL0, async () => {
      console.info('[gestureMaskUndefinedV11004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('gestureMaskUndefined'));
      await button.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('gestureMaskUndefinedResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[gestureMaskUndefinedV11004] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('gestureMaskUndefinedTriggered');
      console.info('[gestureMaskUndefinedV11004] END');
    });
  })
}
