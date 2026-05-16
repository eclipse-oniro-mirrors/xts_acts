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


export default function RadioContentModifier() {
  describe('RadioContentModifier', () => {

    beforeAll(() => {
      console.info("RadioContentModifier beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.api12.static", "EntryAbility")

      console.info("RadioContentModifier beforeAll end");
    });

    beforeEach(async () => {
      console.info("RadioContentModifier beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Radio/RadioContentModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RadioContentModifier state success " + JSON.stringify(pages));
        if (!("RadioContentModifier" == pages.name)) {
          console.info("get RadioContentModifier state success " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push RadioContentModifier page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RadioContentModifier page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RadioContentModifier after each called");
    });


    
    /**
     * @tc.number   RadioContentModifier_static_001
     * @tc.name     RadioContentModifier_static_001
     * @tc.desc     RadioContentModifier_static_001
     * @tc.level    Level.LEVEL1
     */
    it('RadioContentModifier_static_001', Level.LEVEL1, async (done: () => void): Promise<void> =>    {
      console.info('[RadioContentModifier_static_001] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('RadioContentModifier_btn')) as Component;
      await btn1.click()
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('RadioContentModifier_btn');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[RadioContentModifier_static_001] obj1 is: " + JSON.stringifyJsonElement(obj1));
      expect(obj1.getElement('$attrs').getString('label')).assertEqual('off');

      console.info('[RadioContentModifier_static_001] END');
      done();
    });
  })
}


