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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import {Driver, Component, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import {UtilsTest, startAbility, stopApplication} from "../Util.test"
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function TitleOptionsToolOptions() {
  describe('TitleOptionsToolOptions', () => {
    beforeAll(() => {
      console.info("TitleOptionsToolOptions beforeEach start");
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.navigation13.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info("TitleOptionsToolOptions beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/TitleOptionsToolOptions',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TitleOptionsToolOptions state pages:" + JSON.stringify(pages));
        if (!("TitleOptionsToolOptions" == pages.name)) {
          console.info("get TitleOptionsToolOptions pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TitleOptionsToolOptions page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TitleOptionsToolOptions page error:" + err);
      }
      console.info("TitleOptionsToolOptions beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("TitleOptionsToolOptions after each called");
    });


    
    

    /**
     * @tc.number   TitleOptionsToolOptions_static_0100
     * @tc.name     TitleOptionsToolOptions_static_0100
     * @tc.desc     TitleOptionsToolOptions_static_0100
     * @tc.level    Level.LEVEL0
     */
it('TitleOptionsToolOptions_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('TitleOptionsToolOptions_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
  console.info('TitleOptionsToolOptions_0100 START  11');
    let obj1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));  //appDied
      await CommonFunc.sleep(1000);
  console.info('TitleOptionsToolOptions_0100 START  22');
      expect(obj1.getArray("$children")[0].getArray("$children")[0].getArray("$children")[0].getElement('$attrs').getElement('backgroundBlurStyle').getString('value')).assertEqual("BlurStyle.BACKGROUND_THIN");
      expect(obj1.getArray("$children")[0].getArray("$children")[0].getArray("$children")[0].getElement('$attrs').getString('backgroundColor')).assertEqual("#80004AAF");
  console.info('TitleOptionsToolOptions_0100 START  33');
      let btn2 = await driver.findComponent(ON.text('switch'));
      await (btn2?.click() as Promise<void>)
      console.info('[TitleOptionsToolOptions_0100] btn2 click');
      await CommonFunc.sleep(3000);

      let obj2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);

      expect(obj2.getArray("$children")[0].getArray("$children")[0].getArray("$children")[0].getElement('$attrs').getElement('backgroundBlurStyle').getString('value')).assertEqual("BlurStyle.BACKGROUND_THICK");
      expect(obj2.getArray("$children")[0].getArray("$children")[0].getArray("$children")[0].getElement('$attrs').getString('backgroundColor')).assertEqual("#802787D9");

      console.info('TitleOptionsToolOptions_0100 END');
      done();
    });

        
    

    /**
     * @tc.number   TitleOptionsToolOptions_static_0200
     * @tc.name     TitleOptionsToolOptions_static_0200
     * @tc.desc     TitleOptionsToolOptions_static_0200
     * @tc.level    Level.LEVEL0
     */
it('TitleOptionsToolOptions_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('TitleOptionsToolOptions_0200 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let push = await driver.findComponent(ON.text('push'));
      await (push?.click() as Promise<void>)
      console.info('[TitleOptionsToolOptions_0100] push click');
      await CommonFunc.sleep(2000);

      let obj1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);

      expect(obj1.getArray("$children")[0].getArray("$children")[1].getArray("$children")[0].getArray("$children")[0].getElement('$attrs').getElement('backgroundBlurStyle').getString('value')).assertEqual("BlurStyle.BACKGROUND_THIN");
      expect(obj1.getArray("$children")[0].getArray("$children")[1].getArray("$children")[0].getArray("$children")[0].getElement('$attrs').getString('backgroundColor')).assertEqual("#80004AAF");

      let btn2 = await driver.findComponent(ON.text('switch'));
      await (btn2?.click() as Promise<void>)
      console.info('[TitleOptionsToolOptions_0200] btn2 click');
      await CommonFunc.sleep(3000);

      let obj2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);

      expect(obj2.getArray("$children")[0].getArray("$children")[0].getArray("$children")[0].getElement('$attrs').getElement('backgroundBlurStyle').getString('value')).assertEqual("BlurStyle.BACKGROUND_THICK");
      expect(obj2.getArray("$children")[0].getArray("$children")[0].getArray("$children")[0].getElement('$attrs').getString('backgroundColor')).assertEqual("#802787D9");

      console.info('TitleOptionsToolOptions_0200 END');
      done();
    });

  })
}