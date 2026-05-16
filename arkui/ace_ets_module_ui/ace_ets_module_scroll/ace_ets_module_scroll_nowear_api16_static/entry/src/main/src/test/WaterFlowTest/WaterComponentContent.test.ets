'use static';
/**
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
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

export default function WaterComponentContent() {
  describe('WaterComponentContent', () => {
    beforeAll(() => {
      console.info("WaterComponentContent beforeEach start");
      await UtilsTest.msSleep(4000);
      await startAbility("com.arkui.ace.scroll.nowear.api16.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("WaterComponentContent beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WaterFlow/WaterComponentContent',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get WaterComponentContent state pages:" + JSON.stringify(pages));
        if (!('WaterComponentContent' == pages.name)) {
          console.info("get WaterComponentContent pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push WaterComponentContent page error:" + err);
      }
      console.info("WaterComponentContent beforeEach end");
    });

    
    
/**
     * @tc.number   WaterComponentContent_static_0100
     * @tc.name     WaterComponentContent_static_0100
     * @tc.desc     WaterComponentContent_static_0100
     * @tc.level    Level.LEVEL1
     */
it('WaterComponentContent_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('button1'));
      await (button1?.click() as Promise<void>);
      console.info('[WaterComponentContent_0100] Button1 Onclick');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('WaterFlow1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[WaterComponentContent_static_0100] component obj is: ' + JSON.stringifyJsonElement(obj));
      let text = await driver.findComponent(ON.id('footerContent1'));
      console.info('[WaterComponentContent_static_0100] footerContent1 is: ' + JSON.stringify(text));
      let obj1 = JSON.parseJsonElement(inspector.getInspectorByKey("footerContent1"));
      let textContent = obj1.getElement('$attrs').getString('content');
      console.info('[WaterComponentContent_static_0100] textContent is: ' + JSON.stringify(textContent));
      expect(textContent).assertEqual('footer');
      console.info('[WaterComponentContent_static_0100] END');
      done();
    });

    
    
/**
     * @tc.number   WaterComponentContent_static_0200
     * @tc.name     WaterComponentContent_static_0200
     * @tc.desc     WaterComponentContent_static_0200
     * @tc.level    Level.LEVEL1
     */
it('WaterComponentContent_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button2 = await driver.findComponent(ON.id('button2'));
      await (button2?.click() as Promise<void>);
      console.info('[WaterComponentContent_0200] Button2 Onclick');
      await CommonFunc.sleep(1000);
      let text01 = await driver.findComponent(ON.id('footerContent1'));
      expect(text01).assertEqual(null);
      console.info('[WaterComponentContent_static_0200] END');
      done();
    });

    
    
/**
     * @tc.number   WaterComponentContent_static_0300
     * @tc.name     WaterComponentContent_static_0300
     * @tc.desc     WaterComponentContent_static_0300
     * @tc.level    Level.LEVEL1
     */
it('WaterComponentContent_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let button3 = await driver.findComponent(ON.id('button3'));
      await (button3?.click() as Promise<void>);
      console.info('[WaterComponentContent_static_0300] Button3 Onclick');
      await CommonFunc.sleep(1000);
      let text02 = await driver.findComponent(ON.id('footerContent1'));
      expect(text02).assertEqual(null);
      console.info('[WaterComponentContent_static_0300] END');
      done();
    });
  })
}