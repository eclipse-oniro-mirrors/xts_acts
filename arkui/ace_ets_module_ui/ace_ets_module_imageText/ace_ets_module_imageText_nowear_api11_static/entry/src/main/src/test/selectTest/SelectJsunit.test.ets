'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback, Message } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import {UtilsTest, startAbility, stopApplication} from "../Util.test"
import { Color, Font }  from '@ohos.arkui.component'
import events_emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function SelectJsunit() {
  describe('SelectJsunit', () => {
    beforeAll(() => {
      console.info("Builder0050TestJsunit beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      console.info("SelectJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/select/SelectPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SelectJsunit state pages: " + JSON.stringify(pages));
        if (!("SelectPage" == pages.name)) {
          console.info("get SelectJsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SelectJsunit page error: " + err);
      }
    });

    
    /**
     * @tc.number   SelectJsunit_static_0100
     * @tc.name     SelectJsunit_static_0100
     * @tc.desc     SelectJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SelectJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the Select component
      console.info('[SelectJsunit_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('select');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SelectJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[SelectJsunit_0100] selected: " + JSON.stringify(obj.getElement('$attrs').getString('selected')));
      console.info("[SelectJsunit_0100] value: " + JSON.stringify(obj.getElement('$attrs').getString('value')));
      console.info("[SelectJsunit_0100] font: " + JSON.stringify(obj.getElement('$attrs').getString('font')));
      console.info("[SelectJsunit_0100] fontColor: " + JSON.stringify(obj.getElement('$attrs').getString('fontColor')));
      console.info("[SelectJsunit_0100] selectedOptionBgColor: " + JSON.stringify(obj.getElement('$attrs').getString('selectedOptionBgColor')));
      console.info("[SelectJsunit_0100] selectedOptionFont: " + JSON.stringify(obj.getElement('$attrs').getString('selectedOptionFont')));
      console.info("[SelectJsunit_0100] selectedOptionFontColor: " + JSON.stringify(obj.getElement('$attrs').getString('selectedOptionFontColor')));
      console.info("[SelectJsunit_0100] optionBgColor: " + JSON.stringify(obj.getElement('$attrs').getString('optionBgColor')));
      console.info("[SelectJsunit_0100] optionFont: " + JSON.stringify(obj.getElement('$attrs').getString('optionFont')));
      console.info("[SelectJsunit_0100] optionFontColor: " + JSON.stringify(obj.getElement('$attrs').getString('optionFontColor')));

      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('indexValue');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SelectJsunit_0300] component obj1 is: " + JSON.stringify(obj1));
        expect(obj.getElement('$attrs').getString('selected')).assertEqual('0');
        expect(obj.getElement('$attrs').getString('value')).assertEqual('SelectButton');
        expect(obj.getElement('$attrs').getString('font')).assertEqual('{"size":"16.00fp","weight":"500","family":"","style":"FontStyle.Normal"}');
        expect(obj.getElement('$attrs').getString('fontColor')).assertEqual('#FF000000');
        expect(obj.getElement('$attrs').getString('selectedOptionBgColor')).assertEqual('#FF808080');
        expect(obj.getElement('$attrs').getString('selectedOptionFont')).assertEqual('{"size":"16.00fp","weight":"400","family":"","style":"FontStyle.Normal"}');
        expect(obj.getElement('$attrs').getString('selectedOptionFontColor')).assertEqual('#FFFF0000');
        expect(obj.getElement('$attrs').getString('optionBgColor')).assertEqual('#FF808080');
        expect(obj.getElement('$attrs').getString('optionFont')).assertEqual('{"size":"16.00fp","weight":"400","family":"","style":"FontStyle.Normal"}');
        expect(obj.getElement('$attrs').getString('optionFontColor')).assertEqual('#FFFF0000');
        expect(obj1.getElement('$attrs').getString('content')).assertEqual('indexValue:0');

      console.info('[SelectJsunit_0100] END');
      done();
    });

    /**
     * @tc.number   SelectJsunit_static_0200
     * @tc.name     SelectJsunit_static_0200
     * @tc.desc     SelectJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SelectJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Modify the properties of component select
      console.info('[SelectJsunit_0200] START');
  let eventData: events_emitter.EventData = {
    data: {
      "selected": 2 as int,
      "selectValue":'testButton',
      "selectFont":{ size: 16, weight: 500 } as Font,
      "selectedOptionBgColor":Color.Blue,
      "selectedOptionFont":{ size: 16, weight: 400 } as Font,
      "selectedOptionFontColor":Color.Yellow,
      "optionBgColor":Color.Grey,
      "optionFont":{ size: 16, weight: 400 } as Font,
      "optionFontColor":Color.Red,
      "fontColor":Color.Green
    } as Record<String,RecordData>
  } as events_emitter.EventData
  let indexEvent: events_emitter.InnerEvent = {
    eventId: 25,
    priority: events_emitter.EventPriority.LOW
  }
  console.info("[SelectJsunit_static_0200] start to publish emit");
  events_emitter.emit(indexEvent, eventData);
  await CommonFunc.sleep(2000);
      // Get the propoties value of the select component
      let strJson = inspector.getInspectorByKey('select');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SelectJsunit_0200] component obj is: " + JSON.stringify(obj));


        expect(obj.getElement('$attrs').getString('selected')).assertEqual('2');
        expect(obj.getElement('$attrs').getString('value')).assertEqual('testButton');
        expect(obj.getElement('$attrs').getString('font')).assertEqual('{"size":"16.00fp","weight":"FontWeight.Medium","family":"","style":"FontStyle.Normal"}');
        expect(obj.getElement('$attrs').getString('selectedOptionBgColor')).assertEqual('#FF0000FF');
        expect(obj.getElement('$attrs').getString('selectedOptionFont')).assertEqual('{"size":"16.00fp","weight":"400","family":"","style":"FontStyle.Normal"}');
        expect(obj.getElement('$attrs').getString('selectedOptionFontColor')).assertEqual('#FFFFFF00');
        expect(obj.getElement('$attrs').getString('optionBgColor')).assertEqual('#FF808080');
        expect(obj.getElement('$attrs').getString('optionFont')).assertEqual('{"size":"16.00fp","weight":"400","family":"","style":"FontStyle.Normal"}');
        expect(obj.getElement('$attrs').getString('optionFontColor')).assertEqual('#FFFF0000');
        expect(obj.getElement('$attrs').getString('fontColor')).assertEqual('#FF008000');

      await CommonFunc.sleep(1000);
      console.info('[SelectJsunit_0200] END');
      done();
    });

    
    
    
    /**
     * @tc.number   SelectJsunit_static_0300
     * @tc.name     SelectJsunit_static_0300
     * @tc.desc     SelectJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('SelectJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Verify the functions of the select component
      console.info('[SelectJsunit_0300] START');

      // Verify the click function of the select component
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let textComponent1 = await driver.findComponent(ON.id('select'));
      await CommonFunc.sleep(500);
      await (textComponent1?.click() as Promise<void>)
      await CommonFunc.sleep(500);
      // Verify the onSelect function of the select component
      let textMenuComponent = await driver.findComponent(ON.text('bbb'));
      await CommonFunc.sleep(500);
      await (textMenuComponent?.click() as Promise<void>)
      await CommonFunc.sleep(500);
      let strJson1 = inspector.getInspectorByKey('indexValue');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SelectJsunit_0300] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('indexValue:1');

      let strJson = inspector.getInspectorByKey('select');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SelectJsunit_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('value')).assertEqual('bbb');
      expect(obj.getElement('$attrs').getString('selected')).assertEqual('1');
        expect(obj1.getElement('$attrs').getString('content')).assertEqual('indexValue:1');
        expect(obj.getElement('$attrs').getString('value')).assertEqual('bbb');
        expect(obj.getElement('$attrs').getString('selected')).assertEqual('1');

      console.info('[SelectJsunit_0300] END');
      done();
    });

    /**
     * @tc.number   SelectJsunit_static_0400
     * @tc.name     SelectJsunit_static_0400
     * @tc.desc     SelectJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('SelectJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Illegal modification of properties of component select
      console.info('[SelectJsunit_0400] START');
  let eventData: events_emitter.EventData = {
    data: {
      "optionValue": '-20',
      "icon":'10',
      "selected":0 as int,
      "selectValue":'10',
      "selectFont":{ size: 16, weight: 500 } as Font,
      "fontColor":'123',
      "selectedOptionBgColor":'0',
      "selectedOptionFont":{ size: 16, weight: 500 } as Font,
      "selectedOptionFontColor":'hello',
      "optionBgColor":'-10',
      "optionFont":{ size: 16, weight: 500 } as Font,
      "optionFontColor":'123',
      "indexValue":'bbb'
    } as Record<String,RecordData>
  } as events_emitter.EventData
  let indexEvent: events_emitter.InnerEvent = {
    eventId: 25,
    priority: events_emitter.EventPriority.LOW
  }
  console.info("[SelectJsunit_static_0400] start to publish emit");
  events_emitter.emit(indexEvent, eventData);
      await CommonFunc.sleep(2000);

      // Get the propoties value of the select component
      let strJson = inspector.getInspectorByKey('select');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SelectJsunit_0400] component obj is: " + JSON.stringify(obj));

      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('indexValue');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SelectJsunit_0400] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('indexValue:1');

        expect(obj.getElement('$attrs').getString('selected')).assertEqual('0');
        expect(obj.getElement('$attrs').getString('value')).assertEqual('10');
        expect(obj.getElement('$attrs').getString('font')).assertEqual('{"size":"16.00fp","weight":"FontWeight.Medium","family":"","style":"FontStyle.Normal"}');
        expect(obj.getElement('$attrs').getString('fontColor')).assertEqual('#FF00007B');
        expect(obj.getElement('$attrs').getString('selectedOptionBgColor')).assertEqual('#FF0000FF');
        expect(obj.getElement('$attrs').getString('selectedOptionFont')).assertEqual('{"size":"16.00fp","weight":"400","family":"","style":"FontStyle.Normal"}');
        expect(obj.getElement('$attrs').getString('selectedOptionFontColor')).assertEqual('#FFFFFF00');
        expect(obj.getElement('$attrs').getString('optionBgColor')).assertEqual('#FF0000FF');
        expect(obj.getElement('$attrs').getString('optionFont')).assertEqual('{"size":"16.00fp","weight":"400","family":"","style":"FontStyle.Normal"}');
        expect(obj.getElement('$attrs').getString('optionFontColor')).assertEqual('#FFFFFF00');
        expect(obj1.getElement('$attrs').getString('content')).assertEqual('indexValue:1');

      console.info('[SelectJsunit_0400] END');
      done();
    });
  })
}
