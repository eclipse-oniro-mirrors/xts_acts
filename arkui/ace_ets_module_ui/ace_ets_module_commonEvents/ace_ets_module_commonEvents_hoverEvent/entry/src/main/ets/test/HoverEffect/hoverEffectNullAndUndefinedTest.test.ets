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

export default function hoverEffectNullAndUndefined() {
  describe('hoverEffectNullAndUndefined', () => {
    beforeAll(async () => {
      console.info("hoverEffectNullAndUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/HoverEffect/HoverEffectNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get hoverEffectNullAndUndefined state success " + JSON.stringify(pages));
        if (!("HoverEffectNullAndUndefined" == pages.name)) {
          console.info("get hoverEffectNullAndUndefined state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push hoverEffectNullAndUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push hoverEffectNullAndUndefined page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("hoverEffectNullAndUndefined after each called");
    });

    /**
     * @tc.name   hoverEffectNullV1001
     * @tc.number SUB_ARKUI_HOVEREFFECT_PARAM_001
     * @tc.desc   Test hoverEffect with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hoverEffectNullV1001', Level.LEVEL0, async () => {
      console.info('[hoverEffectNullV1001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('hoverEffectNull'));
      let rect = await button.getBounds();
      let centerX = Math.floor((rect.left + rect.right) / 2);
      let centerY = Math.floor((rect.top + rect.bottom) / 2);
      await driver.mouseMoveTo({ x: centerX, y: centerY });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[hoverEffectNullV1001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('hoverEffectNull');
      console.info('[hoverEffectNullV1001] END');
    });

    /**
     * @tc.name   hoverEffectUndefinedV1002
     * @tc.number SUB_ARKUI_HOVEREFFECT_PARAM_002
     * @tc.desc   Test hoverEffect with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hoverEffectUndefinedV1002', Level.LEVEL0, async () => {
      console.info('[hoverEffectUndefinedV1002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('hoverEffectUndefined'));
      let rect = await button.getBounds();
      let centerX = Math.floor((rect.left + rect.right) / 2);
      let centerY = Math.floor((rect.top + rect.bottom) / 2);
      await driver.mouseMoveTo({ x: centerX, y: centerY });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[hoverEffectUndefinedV1002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('hoverEffectUndefined');
      console.info('[hoverEffectUndefinedV1002] END');
    });
  })
}
