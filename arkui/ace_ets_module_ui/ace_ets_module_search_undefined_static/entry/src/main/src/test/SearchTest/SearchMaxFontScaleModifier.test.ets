'use static'
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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../../hypium/index";
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import { EnterKeyType } from '@ohos.arkui.component'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { UtilsTest } from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, Component } from '@kit.TestKit';


export default function SearchMaxFontScaleModifierTest() {
  describe('SearchMaxFontScaleModifierTest', () => {
    beforeAll(() => {
      console.info("SearchMaxFontScaleModifierTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.search.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("SearchMaxFontScaleModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchMaxFontScaleModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SearchMaxFontScaleModifierTest state pages: " + JSON.stringify(pages));
        if (!("SearchMaxFontScaleModifier" == pages.name)) {
          console.info("get SearchMaxFontScaleModifierTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SearchMaxFontScaleModifierTest page error: " + err);
        expect().assertFail();
      }
    });
    /**
         * @tc.number   SearchMaxFontScaleModifierTest_static_0010
         * @tc.name     SearchMaxFontScaleModifierTest_static_0010
         * @tc.desc     SearchMaxFontScaleModifierTest_static_0010
         * @tc.level    Level.LEVEL0
         */
    it('SearchMaxFontScaleModifierTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SearchMaxFontScaleModifierTest_static_0010] START');
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('Search_MaxFontScale_Modifier_Undefined0');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[SearchMaxFontScaleModifierTest_static_0010] SearchMaxFontScaleModifierUndefined: ' + JSON.stringify(obj1.getElement('$attrs').getString('maxFontScale')));
      expect(obj1.getElement('$attrs').getString('maxFontScale')).assertEqual('2.000000');
      let strJson2 = inspector.getInspectorByKey('Search_MaxFontScale_Modifier_Dynamic0');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('[SearchMaxFontScaleModifierTest_static_0010] SearchMaxFontScaleModifierDynamic: ' + JSON.stringify(obj2.getElement('$attrs').getString('maxFontScale')));
      expect(obj2.getElement('$attrs').getString('maxFontScale')).assertEqual('1.100000');

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('Search_MaxFontScale_Modifier_Button0')) as Component;
      await button.click();
      await CommonFunc.sleep(500);

      let strJson3 = inspector.getInspectorByKey('Search_MaxFontScale_Modifier_Dynamic0');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('[SearchMaxFontScaleModifierTest_static_0010] SearchMaxFontScaleModifierDynamic: ' + JSON.stringify(obj3.getElement('$attrs').getString('maxFontScale')));
      expect(obj3.getElement('$attrs').getString('maxFontScale')).assertEqual('2.000000');
      console.info('[SearchMaxFontScaleModifierTest_static_0010] END');
      done();
    });

  })
}