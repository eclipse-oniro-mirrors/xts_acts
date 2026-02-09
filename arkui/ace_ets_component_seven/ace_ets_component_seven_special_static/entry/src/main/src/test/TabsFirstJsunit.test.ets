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

import router from '@ohos.router'
import { describe, beforeEach, afterEach, it, expect, Level, beforeAll } from '../../../hypium/index'
import Utils from '../../ets/MainAbility/common/Utils';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'

export default function tabsFirstJsunit() {
  describe('tabsFirstTest', () => {
    beforeAll(() => {
        console.info("tabsFirstTest beforeEach start");
        await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("tabsFirst beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/tabsFirst',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get tabsFirst state pages: " + JSON.stringify(pages));
        if (!("tabsFirst" == pages.name)) {
          console.info("get tabsFirst state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push tabsFirst page error: " + err);
      }
    });

  
    
    
/**
     * @tc.number   ArkUI_Tabs_Divider_static_0300
     * @tc.name     ArkUI_Tabs_Divider_static_0300
     * @tc.desc     ArkUI_Tabs_Divider_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Tabs_Divider_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_Divider_static_0300 start");
      let strJson = inspector.getInspectorByKey('tabsTest2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_Divider_static_0300] divider:" + JSON.stringify(obj.getElement('$attrs').getElement('divider')));
      let dividerObject = obj.getElement('$attrs').getElement('divider');
      expect(dividerObject.getString('strokeWidth')).assertEqual("10.00vp");
      expect(dividerObject.getString('color')).assertEqual('#FFFF0000');
      expect(dividerObject.getString('startMargin')).assertEqual("5.00vp");
      expect(dividerObject.getString('endMargin')).assertEqual("5.00vp");
      done();
    });

   
    
    
/**
     * @tc.number   ArkUI_Tabs_FadingEdge_static_0100
     * @tc.name     ArkUI_Tabs_FadingEdge_static_0100
     * @tc.desc     ArkUI_Tabs_FadingEdge_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Tabs_FadingEdge_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_FadingEdge_static_0100 start");      
      let strJson = inspector.getInspectorByKey('tabsTest2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_FadingEdge_static_0100] fadingEdge:" + obj.getElement('$attrs').getString('fadingEdge'));
      expect(obj.getElement('$attrs').getString('fadingEdge')).assertEqual('true');
      done();
    });

  })
}
