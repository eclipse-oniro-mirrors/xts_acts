'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, Level, beforeAll } from '../../../hypium/index'
import Utils from '../../ets/MainAbility/common/Utils';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'

export default function tabsThirdJsunit() {
  describe('tabsThirdTest', () => {
    beforeAll(() => {
        console.info("tabsThirdTest beforeEach start");
        await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("tabsThird beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/tabsThird',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get tabsThird state pages: " + JSON.stringify(pages));
        if (!("tabsThird" == pages.name)) {
          console.info("get tabsThird state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push tabsThird page error: " + err);
      }
    });

   
    
    
/**
     * @tc.number   ArkUI_Tabs_BarGridAlign_static_0200
     * @tc.name     ArkUI_Tabs_BarGridAlign_static_0200
     * @tc.desc     ArkUI_Tabs_BarGridAlign_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Tabs_BarGridAlign_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_static_0200] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BarGridAlign_static_0200]: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('0');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('0');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('0');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0200] end");
      done();
    });

   
    
    
/**
     * @tc.number   ArkUI_Tabs_BarMode_static_0200
     * @tc.name     ArkUI_Tabs_BarMode_static_0200
     * @tc.desc     ArkUI_Tabs_BarMode_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Tabs_BarMode_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_static_0200] start");
      let strJson = inspector.getInspectorByKey('tabsBarModeTest');
      console.info("[ArkUI_Tabs_BarMode_static_0200]: " + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BarMode_static_0200]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      console.info("[ArkUI_Tabs_BarMode_static_0200] end");
      done();
    });
  })
}