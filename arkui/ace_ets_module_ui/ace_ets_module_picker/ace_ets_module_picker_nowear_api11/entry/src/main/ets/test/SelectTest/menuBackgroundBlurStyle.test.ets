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


export default function menuBackgroundBlurStyle() {
  describe('menuBackgroundBlurStyle', () => {
    beforeEach(async (done: Function) => {
      console.info("menuBackgroundBlurStyle beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Select/menuBackgroundBlurStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get menuBackgroundBlurStyle state pages: " + JSON.stringify(pages));
        if (!("menuBackgroundBlurStyle" == pages.name)) {
          console.info("get menuBackgroundBlurStyle state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push menuBackgroundBlurStyle success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push menuBackgroundBlurStyle page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_menuBackgroundBlurStyle_0100
     * @tc.name      menuBackgroundBlurStyle_0100
     * @tc.desc      To test that the menuBackgroundBlurStyle decorator.
     * @tc.level     Level 2
     */
    it('menuBackgroundBlurStyle_0100', Level.LEVEL1, async (done: Function) => {
      console.info('menuBackgroundBlurStyle_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let Select = await driver.findComponent(ON.id('menuBackgroundBlurStyle'));
      await Select.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('menuBackgroundBlurStyle');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[menuBackgroundBlurStyle_0100] component obj is: " + JSON.stringify(obj));
      console.info("[menuBackgroundBlurStyle_0100] title: " + JSON.stringify(obj.$attrs.menuBackgroundBlurStyle));
      expect(obj.$attrs.menuBackgroundBlurStyle).assertEqual('BlurStyle.Thin');
      console.info('[menuBackgroundBlurStyle_0100] END');
      done();
    });


  })
}

