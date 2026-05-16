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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext,Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest,  startAbility} from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function removeStyles() {
  describe('removeStyles', () => {
    beforeAll(() => {
      console.info("removeStyles beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("removeStyles beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/removeStyles",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get removeStyles state pages:" + JSON.stringify(pages));
        if (!("removeStyles" == pages.name)) {
          console.info("get removeStyles pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push removeStyles page error:" + err);
      }
      console.info("removeStyles beforeEach end");
    }); 

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("removeStyles after each called");
    });
    
    /**
     * @tc.number   removeStyles_static_0100
     * @tc.name     removeStyles_static_0100
     * @tc.desc     removeStyles_static_0100
     * @tc.level   Level.LEVEL0
     */
    it('removeStyles_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[removeStyles_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button1 = await (driver.findComponent(ON.id('firstLength')) as Promise<Component>);
      await button1.click();
      await CommonFunc.sleep(1000);

      let text1 = inspector.getInspectorByKey('lengthId');
      let Obj1  = JSON.parseJsonElement(text1);
      expect(Obj1.getElement('$attrs').getString('content')).assertEqual('6');
      await CommonFunc.sleep(500);


      let button2 = await (driver.findComponent(ON.id('endLength')) as Promise<Component>);
      await button2.click();
      await CommonFunc.sleep(1000);

      let text3 = inspector.getInspectorByKey('lengthId');
      let Obj3  = JSON.parseJsonElement(text3);
      expect(Obj3.getElement('$attrs').getString('content')).assertEqual('5');
      await CommonFunc.sleep(500);

      console.info('[removeStyles_0100] END');
      done();
    });

  })
}
