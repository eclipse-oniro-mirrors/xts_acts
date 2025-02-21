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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';

export default function tabsAnimationMode() {
  describe('tabsAnimationMode', () => {
    beforeEach(async (done: Function) => {
      console.info("tabsAnimationMode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/tabsAnimationMode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsAnimationMode state pages: " + JSON.stringify(pages));
        if (!("tabsAnimationMode" == pages.name)) {
          console.info("get tabsAnimationMode state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push tabsAnimationMode success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsAnimationMode page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
    * @tc.number: SUB_ACE_Tabs_ANIMATIONMODE_0100
    * @tc.name  : tabsAnimationMode_0100
    * @tc.desc  : Set animation mode for tabs switch animation
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('tabsAnimationMode_0100', 0, async (done: Function) => {
      console.info('tabsAnimationMode_0100 START');
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('animationMode_1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[tabsAnimationMode_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[tabsAnimationMode_0100] animationMode1: " + JSON.stringify(obj1.$attrs.animationMode));
      expect(obj1.$attrs.animationMode).assertEqual('AnimationMode.CONTENT_FIRST');

      let strJson2 = getInspectorByKey('animationMode_2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[tabsAnimationMode_0100] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.animationMode).assertEqual('AnimationMode.ACTION_FIRST');

      let strJson3 = getInspectorByKey('animationMode_3');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[tabsAnimationMode_0100] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.$attrs.animationMode).assertEqual('AnimationMode.NO_ANIMATION');
      console.info('[tabsAnimationMode_0100] END');
      done();
    });

  })
}