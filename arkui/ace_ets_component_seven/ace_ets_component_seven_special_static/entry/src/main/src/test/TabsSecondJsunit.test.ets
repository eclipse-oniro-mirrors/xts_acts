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
import router from '@ohos.router'
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'

export default function tabsSecondJsunit() {
  describe('tabsSecondTest', () => {
    beforeAll(() => {
        console.info("tabsSecondTest beforeEach start");
        await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("tabsSecond beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/tabsSecond',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get tabsSecond state pages: " + JSON.stringify(pages));
        if (!("tabsSecond" == pages.name)) {
          console.info("get tabsSecond state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push tabsSecond page error: " + err);
      }
    });

   
    
    
/**
     * @tc.number   ArkUI_Tabs_BarOverlap_static_0200
     * @tc.name     ArkUI_Tabs_BarOverlap_static_0200
     * @tc.desc     ArkUI_Tabs_BarOverlap_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Tabs_BarOverlap_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_BarOverlap_static_0200 start");
      let strJson = inspector.getInspectorByKey('TabsOverlapTest2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BarOverlap_static_0200] barOverlap:" + obj.getElement('$attrs').getString('barOverlap'));
      expect(obj.getElement('$attrs').getString('barOverlap')).assertEqual("true");
      done();
    });


    
    
/**
     * @tc.number   ArkUI_Tabs_BarBackgroundColor_static_0100
     * @tc.name     ArkUI_Tabs_BarBackgroundColor_static_0100
     * @tc.desc     ArkUI_Tabs_BarBackgroundColor_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Tabs_BarBackgroundColor_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_BarBackgroundColor_static_0100 start");
      let strJson = inspector.getInspectorByKey('TabsOverlapTest1');

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BarBackgroundColor_static_0100] barBackgroundColor:" + JSON.stringify(obj.getElement('$attrs').getString('barBackgroundColor')));
      let barBackgroundColorObject = obj.getElement('$attrs').getString('barBackgroundColor');
      expect(barBackgroundColorObject).assertEqual("#00000000");
      done();
    });


    
    
/**
     * @tc.number   ArkUI_Tabs_Attrs_static_0100
     * @tc.name     ArkUI_Tabs_Attrs_static_0100
     * @tc.desc     ArkUI_Tabs_Attrs_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Tabs_Attrs_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_Attrs_static_0100 start");
      let strJson = inspector.getInspectorByKey('TabsOverlapTest1');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('barPosition')).assertEqual('BarPosition.End');
      done();
    });


    
    
/**
     * @tc.number   ArkUI_Tabs_Attrs_static_0200
     * @tc.name     ArkUI_Tabs_Attrs_static_0200
     * @tc.desc     ArkUI_Tabs_Attrs_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Tabs_Attrs_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_Attrs_static_0200 start");
      let strJson = inspector.getInspectorByKey('TabsOverlapTest1');
      let obj = JSON.parseJsonElement(strJson);

      expect(obj.getElement('$attrs').getString('vertical')).assertEqual('false');
      done();
    });


    
    
/**
     * @tc.number   ArkUI_Tabs_Attrs_static_0300
     * @tc.name     ArkUI_Tabs_Attrs_static_0300
     * @tc.desc     ArkUI_Tabs_Attrs_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Tabs_Attrs_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_Attrs_static_0300 start");
      let strJson = inspector.getInspectorByKey('TabsOverlapTest1');
      let obj = JSON.parseJsonElement(strJson);

      expect(obj.getElement('$attrs').getBoolean('scrollable')).assertEqual(true);
      done();
    });

    
    
    
/**
     * @tc.number   ArkUI_Tabs_Attrs_static_0400
     * @tc.name     ArkUI_Tabs_Attrs_static_0400
     * @tc.desc     ArkUI_Tabs_Attrs_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Tabs_Attrs_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_Attrs_static_0400 start");
      let strJson = inspector.getInspectorByKey('TabsOverlapTest1');
      console.info("barWidth: "+ Math.round(Number(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barWidth'))));
      expect(Math.abs(Math.round(Number(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barWidth'))) -350) <= 0.001).assertTrue();
      done();
    });

   
    
    
/**
     * @tc.number   ArkUI_Tabs_Attrs_static_0500
     * @tc.name     ArkUI_Tabs_Attrs_static_0500
     * @tc.desc     ArkUI_Tabs_Attrs_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Tabs_Attrs_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_Attrs_static_0500 start");
      let strJson = inspector.getInspectorByKey('TabsOverlapTest1');
      console.info("barHeight: "+ Math.round(Number(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barHeight'))));
      expect(Math.abs(Math.round(Number(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barHeight'))) -70) <= 0.001).assertTrue();
      done();
    });

   
    
    
/**
     * @tc.number   ArkUI_Tabs_Attrs_static_0600
     * @tc.name     ArkUI_Tabs_Attrs_static_0600
     * @tc.desc     ArkUI_Tabs_Attrs_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Tabs_Attrs_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_Attrs_static_0600 start");
      let strJson = inspector.getInspectorByKey('TabsOverlapTest1');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getDouble('animationDuration')).assertEqual(200);
      done();
    });


  })
}
