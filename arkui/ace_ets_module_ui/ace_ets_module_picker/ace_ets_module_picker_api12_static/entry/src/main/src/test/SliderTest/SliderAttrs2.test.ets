'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import router from '@ohos.router'
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function SliderAttrs2() {
  describe('SliderAttrs2', () => {

    beforeAll(() => {
      console.info("SliderAttrs2 beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.api12.static", "EntryAbility")

      console.info("SliderAttrs2 beforeAll end");
    });

    beforeEach(async () => {
      console.info("SliderAttrs2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Slider/SliderAttrs2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SliderAttrs2 state success " + JSON.stringify(pages));
        if (!("SliderAttrs2" == pages.name)) {
          console.info("get SliderAttrs2 state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          await Utils.sleep(2000);
          // console.info("push SliderAttrs2 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SliderAttrs2 page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("SliderAttrs2 after each called");
    });


    
    /**
     * @tc.number   SliderAttrs2_static_001
     * @tc.name     SliderAttrs2_static_001
     * @tc.desc     SliderAttrs2_static_001
     * @tc.level    Level.LEVEL1
     */
    it('SliderAttrs2_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SliderAttrs2_static_001] START');
      await Utils.sleep(1000);

      let driver = Driver.create();
      await Utils.sleep(1000);
      let slider = await driver.findComponent(ON.id('SliderAttrs2_slider2')) as Component;
      let point = await slider!.getBoundsCenter();
      await driver.click(point.x, point.y)
      await Utils.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('SliderAttrs2_text2');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SliderAttrs2_static_001] obj1 is: " + JSON.stringifyJsonElement(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('true');

      console.info('[SliderAttrs2_static_001] END');
      done();
    });


  })
}


