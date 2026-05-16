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
import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,Level
} from '../../../../hypium/index';
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function repeatVirtualScrollJsunit() {
  describe('repeatVirtualScrollJsunit', () => {

    beforeAll(() => {
      console.info("repeatVirtualScrollJsunit beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("repeatVirtualScrollJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Repeat/repeatVirtualScroll',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get repeatVirtualScrollJsunit state pages:" + JSON.stringify(pages));
        if (!("repeatVirtualScroll" == pages.name)) {
          console.info("get repeatVirtualScrollJsunit pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push repeatVirtualScrollJsunit page error:" + err);
      }
      console.info("repeatVirtualScrollJsunit beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("repeatVirtualScrollJsunit after each called");
    });

    
    
    /**
     * @tc.number   repeatVirtualScrollJsunit_static_0100
     * @tc.name     repeatVirtualScrollJsunit_static_0100
     * @tc.desc     repeatVirtualScrollJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('repeatVirtualScrollJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RepeatEachJsunit_0100 START');
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('text3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[repeatVirtualScrollJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("3:3ReuseString123");
      console.info('[repeatVirtualScrollJsunit_static_0100] END');

      let strJson1 = inspector.getInspectorByKey('text4');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[repeatVirtualScrollJsunit_static_0100] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("4:4ReuseNumber123");
      console.info('[repeatVirtualScrollJsunit_static_0100] END');

      let strJson2 = inspector.getInspectorByKey('text5');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[repeatVirtualScrollJsunit_static_0100] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("5:5eachMessage123");
      console.info('[repeatVirtualScrollJsunit_static_0100] END');
      done();
    });

    
    
    /**
     * @tc.number   repeatVirtualScrollJsunit_static_0200
     * @tc.name     repeatVirtualScrollJsunit_static_0200
     * @tc.desc     repeatVirtualScrollJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('repeatVirtualScrollJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('repeatVirtualScrollJsunit_static_0200 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let scrollBar: Component|null = await driver.findComponent(ON.type('Scroll'))
      if (scrollBar) {
        let button = await ( scrollBar.scrollSearch(ON.id('init_repeat')) as Promise<Component> );
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let button1 = await ( scrollBar.scrollSearch(ON.id('scroll_data1')) as Promise<Component> ) ;
        await (button1?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
      }

      let strJson = inspector.getInspectorByKey('text7');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[repeatVirtualScrollJsunit_static_0200] component obj is: " + JSON.stringify(obj));
      console.info("[repeatVirtualScrollJsunit_static_0200] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("7:8eachMessage666");
      console.info('[repeatVirtualScrollJsunit_static_0200] END');
      done();
    });


    
    
    /**
     * @tc.number   repeatVirtualScrollJsunit_static_0300
     * @tc.name     repeatVirtualScrollJsunit_static_0300
     * @tc.desc     repeatVirtualScrollJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('repeatVirtualScrollJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('repeatVirtualScrollJsunit_static_0300 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let scrollBar: Component|null = await driver.findComponent(ON.type('Scroll'))
      if (scrollBar) {
        let button = await ( scrollBar.scrollSearch(ON.id('init_repeat')) as Promise<Component> );
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let button1 = await ( scrollBar.scrollSearch(ON.id('repeat_modify')) as Promise<Component> );
        await (button1?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
      }

      let strJson = inspector.getInspectorByKey('text7');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[repeatVirtualScrollJsunit_static_0300] component obj is: " + JSON.stringify(obj));
      console.info("[repeatVirtualScrollJsunit_static_0300] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("7:333eachMessage666");
      console.info('[repeatVirtualScrollJsunit_static_0300] END');

      done();
    });


    
    
    /**
     * @tc.number   repeatVirtualScrollJsunit_static_0400
     * @tc.name     repeatVirtualScrollJsunit_static_0400
     * @tc.desc     repeatVirtualScrollJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('repeatVirtualScrollJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('repeatVirtualScrollJsunit_static_0400 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let scrollBar: Component|null = await driver.findComponent(ON.type('Scroll'))
      if (scrollBar) {
        let button = await ( scrollBar.scrollSearch(ON.id('init_repeat')) as Promise<Component> );
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let button1 = await (scrollBar.scrollSearch(ON.id('repeat_3')) as Promise<Component>);
        await (button1?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
      }
      let strJson = inspector.getInspectorByKey('text5');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[repeatVirtualScrollJsunit_static_0400] component obj is: " + JSON.stringify(obj));
      console.info("[repeatVirtualScrollJsunit_static_0400] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("5:6eachMessage666");
      console.info('[repeatVirtualScrollJsunit_static_0200] END');
      done();
    });


    
    
    /**
     * @tc.number   repeatVirtualScrollJsunit_static_0500
     * @tc.name     repeatVirtualScrollJsunit_static_0500
     * @tc.desc     repeatVirtualScrollJsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('repeatVirtualScrollJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('repeatVirtualScrollJsunit_static_0500 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let scrollBar: Component|null = await driver.findComponent(ON.type('Scroll'))
      if (scrollBar) {
        let button = await ( scrollBar.scrollSearch(ON.id('init_repeat')) as Promise<Component> );
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let button1 = await ( scrollBar.scrollSearch(ON.id('repeat_2')) as Promise<Component> );
        await (button1?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
      }
      let strJson = inspector.getInspectorByKey('text7');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[repeatVirtualScrollJsunit_static_0200] component obj is: " + JSON.stringify(obj));
      console.info("[repeatVirtualScrollJsunit_static_0200] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("7:9eachMessage666");
      console.info('[repeatVirtualScrollJsunit_static_0200] END');

      let strJson1 = inspector.getInspectorByKey('text8');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[repeatVirtualScrollJsunit_static_0200] component obj1 is: " + JSON.stringify(obj1));
      console.info("[repeatVirtualScrollJsunit_static_0200] text: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("8:8eachMessage666");
      console.info('[repeatVirtualScrollJsunit_static_0200] END');
      done();
    });
  })
}

