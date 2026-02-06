/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';

export default function tabsAnimationDuration() {
  describe('tabsAnimationDuration', () => {
    beforeEach(async (done: Function) => {
      console.info("tabsAnimationDuration beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/tabsAnimationDuration',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsAnimationDuration state pages: " + JSON.stringify(pages));
        if (!("tabsAnimationDuration" == pages.name)) {
          console.info("get tabsAnimationDuration state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push tabsAnimationDuration success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsAnimationDuration page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   tabsAnimationDuration_0100
     * @tc.number SUB_ACE_Tabs_ANIMATIOnDuration_0100
     * @tc.desc   Set animationDuration for tabs switch animation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tabsAnimationDuration_0100', Level.LEVEL1, async (done: Function) => {
      console.info('tabsAnimationDuration_0100 START');
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('animationDuration_1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[tabsAnimationDuration_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[tabsAnimationDuration_0100] animationDuration1: " + JSON.stringify(obj1.$attrs.animationDuration));
      expect(obj1.$attrs.animationDuration).assertEqual(300);

      let strJson2 = getInspectorByKey('animationDuration_2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[tabsAnimationDuration_0100] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.animationDuration).assertEqual(600);
      console.info('[tabsAnimationDuration_0100] END');
      done();
    });
  })
}