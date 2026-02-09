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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from './Util.test';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.test';

export default function tabsFirstJsunit() {
  describe('tabsTest', () => {
    beforeAll(() => {
      console.info("scrollNestedScroll beforeEach start");


      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

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
         await UtilsTest.msSleep(2000);
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
      let strJson = inspector.getInspectorByKey('tabsTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_Divider_static_0300]:" + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('divider')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('divider')))
        .assertEqual('{"strokeWidth":"2.00vp","startMargin":"0.00vp","endMargin":"0.00vp","color":"#FFFF0000"}');
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
      let strJson = inspector.getInspectorByKey('tabsTest');
      console.info("[ArkUI_Tabs_FadingEdge_static_0100]:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('fadingEdge')).assertEqual('true');
      done();
    });

    
    
    /**
     * @tc.number   ArkUI_Tabs_BarOverlap_static_0200
     * @tc.name     ArkUI_Tabs_BarOverlap_static_0200
     * @tc.desc     ArkUI_Tabs_BarOverlap_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Tabs_BarOverlap_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_BarOverlap_static_0200 start");
      let strJson = inspector.getInspectorByKey('tabsTest');
      console.info("[ArkUI_Tabs_BarOverlap_static_0200]:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
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
      console.info("ArkUI_Tabs_BarBackgroundColor start");
      let strJson = inspector.getInspectorByKey('tabsTest');
      console.info("[ArkUI_Tabs_BarBackgroundColor_static_0100]:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      let barBackgroundColorObject = obj.getElement('$attrs').getString('barBackgroundColor');
      expect(barBackgroundColorObject).assertEqual("#FFFF64FF");
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
      let strJson = inspector.getInspectorByKey('tabsTest');
      console.info("[ArkUI_Tabs_Attrs_static_0100]: " + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('barPosition')).assertEqual('BarPosition.Start');
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
      let strJson = inspector.getInspectorByKey('tabsTest');
      console.info("[ArkUI_Tabs_Attrs_static_0200]: " + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('vertical')).assertEqual('true');
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
      let strJson = inspector.getInspectorByKey('tabsTest');
      console.info("[ArkUI_Tabs_Attrs_static_0300]: " + strJson);
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
      let strJson = inspector.getInspectorByKey('tabsTest');
      console.info("[ArkUI_Tabs_Attrs_static_0400]: " + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("barWidth: "+ obj.getElement('$attrs').getString('barWidth'));
	    let barWidth1: number = Math.round(Number(obj.getElement('$attrs').getString('barWidth')))
      console.info("barWidth1: "+ barWidth1);
      expect(Math.abs(barWidth1 -156) <= 0.001).assertTrue();

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
      let strJson = inspector.getInspectorByKey('tabsTest');
      console.info("[ArkUI_Tabs_Attrs_static_0500]: " + strJson);
      let obj = JSON.parseJsonElement(strJson);
	    let barHeight1: number = Math.round(Number(obj.getElement('$attrs').getString('barHeight')))
      console.info("barHeight1: "+ barHeight1);
      expect(Math.abs(barHeight1 -100) <= 0.001).assertTrue();
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
      let strJson = inspector.getInspectorByKey('tabsTest');
      console.info("[ArkUI_Tabs_Attrs_static_0600]: " + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getDouble('animationDuration')).assertEqual(300);
      done();
    });

    
    
    /**
     * @tc.number   ArkUI_Tabs_BarGridAlign_static_0200
     * @tc.name     ArkUI_Tabs_BarGridAlign_static_0200
     * @tc.desc     ArkUI_Tabs_BarGridAlign_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Tabs_BarGridAlign_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_static_0200] start");
      let strJson = inspector.getInspectorByKey('tabsTest');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0200]: " + strJson);
      let obj = JSON.parseJsonElement(strJson);

      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')).assertEqual('10.00vp');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')).assertEqual('15.00px');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('-1');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('-1');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('-1');
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
      let strJson = inspector.getInspectorByKey('tabsTest');
      console.info("[ArkUI_Tabs_BarMode_static_0200]: " + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('barMode'))
        .assertEqual('BarMode.Scrollable,{\"margin\":\"0.00vp\",\"nonScrollableLayoutStyle\":\"LayoutStyle.ALWAYS_CENTER\"}');
      console.info("[ArkUI_Tabs_BarMode_static_0200] end");
      done();
    });

    
    
    /**
     * @tc.number   ArkUI_Tabs_static_0011
     * @tc.name     ArkUI_Tabs_static_0011
     * @tc.desc     ArkUI_Tabs_static_0011
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Tabs_static_0011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUI_Tabs_static_0011 START');
      let driver = Driver.create();
      let button = await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)

      let strJson = inspector.getInspectorByKey('tabsTest');
      console.info("[ArkUI_Tabs_static_0011]:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      let barBackgroundColorObject = obj.getElement('$attrs').getString('barBackgroundColor');
      expect(barBackgroundColorObject).assertEqual("#FF122345");
      console.info('ArkUI_Tabs_static_0011 END');
      done();
    });
  })
}
