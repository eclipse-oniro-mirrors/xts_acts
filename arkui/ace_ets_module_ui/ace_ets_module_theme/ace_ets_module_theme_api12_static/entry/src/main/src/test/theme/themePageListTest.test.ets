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
import { describe, beforeEach, it, expect, Level, beforeAll, beforeEach, Size,afterEach, TestType } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import Utils from '../../../ets/MainAbility/common/Utils';
export default function themePageListTest() {
  describe('themePageListTest', () => {
    beforeAll(() => {
      console.info("themePageListTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.acts.arkui.theme.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("themePageListTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/theme/themePageListTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router" ) as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get themePageListTest state pages:" + JSON.stringify(pages));
        if (!("themePageListTest" == pages.name)) {
          console.info("get themePageListTest pages.name:" + '');
          
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push themePageListTest page error:" + err);
      }
      console.info("themePageListTest beforeEach end");
    }); 

    
    


/**
     * @tc.number   themeListInterfaceTest_static_0100
     * @tc.name     themeListInterfaceTest_static_0100
     * @tc.desc     themeListInterfaceTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('themeListInterfaceTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('frameNodeGetInterfaceTest_static_0100 START');
      let driver = Driver.create()
      await Utils.sleep(1000);
      
      let button = await driver.findComponent(ON.id('themeClick'));
  await Utils.sleep(1000);
      await (button?.click() as Promise<void>);
      await Utils.sleep(2000);
      // test the color whether change
      let strJson = inspector.getInspectorByKey('1bg');
      console.info("[frameNodeGetInterfaceTest_static_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[frameNodeGetInterfaceTest_static_0100] component obj is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor')).assertEqual('#00000000');
      // simulate the longClick
      let listItem: Component|null = await driver.findComponent(ON.id('1bg'));
  await Utils.sleep(1000);
      listItem!.longClick();
      // test the theme color whether change
      let strJson2 = inspector.getInspectorByKey('1bg');
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('backgroundColor')).assertEqual('#00000000');
      console.info('themeListInterfaceTest_0100 END');
      done();
    });
  })
}