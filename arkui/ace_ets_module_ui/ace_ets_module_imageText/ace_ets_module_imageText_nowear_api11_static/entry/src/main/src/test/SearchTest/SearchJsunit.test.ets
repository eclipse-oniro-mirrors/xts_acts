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
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, MouseButton} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector';
import { Color, Font, TextAlign, CopyOptions,ResourceColor,FontStyle ,FontWeight} from '@ohos.arkui.component'
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import events_emitter from '@ohos.events.emitter'
import { RecordData } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


export default function SearchJsunit() {
  describe('SearchJsunit', (): void => {
    beforeAll(() => {
      console.info("SearchJsunit beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("SearchJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Search/SearchPage",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SearchJsunit state pages:" + "");
        if (!("SearchPage" == pages.name)) {
          console.info("get SearchJsunit pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SearchJsunit page error:" + err);
      }
      console.info("SearchJsunit beforeEach end");
    });

    /**
     * @tc.number   SearchJsunit_static_0100
     * @tc.name     SearchJsunit_static_0100
     * @tc.desc     SearchJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SearchJsunit_static_0100', Level.LEVEL0, async (done: () => void) => {
      // Get the information of the Search component
      console.info('[SearchJsunit_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('search');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SearchJsunit_0100] icon: " + obj.getElement('$attrs').getDouble('icon'));
      console.info("[SearchJsunit_0100] searchButton: " + obj.getElement('$attrs').getString('searchButton'));
      console.info("[SearchJsunit_0100] placeholderColor: " + obj.getElement('$attrs').getString('placeholderColor'));
      console.info("[SearchJsunit_0100] value: " + obj.getElement('$attrs').getString('value'));
      console.info("[SearchJsunit_0100] placeholder: " + obj.getElement('$attrs').getString('placeholder'));
      console.info("[SearchJsunit_0100] placeholderFont: " + obj.getElement('$attrs').getString('placeholder'));
      console.info("[SearchJsunit_0100] textFont: " + obj.getElement('$attrs').getString('textFont'));
      console.info("[SearchJsunit_0100] textAlign: " + obj.getElement('$attrs').getString('textAlign'));
      console.info("[SearchJsunit_0100] copyOption: " + obj.getElement('$attrs').getString('copyOption'));

        expect(obj.getElement('$attrs').getDouble('icon')).assertEqual(983081);
        expect(obj.getElement('$attrs').getString('searchButton')).assertEqual('SEARCH');
        expect(obj.getElement('$attrs').getString('placeholderColor')).assertEqual('#FF808080');
        expect(obj.getElement('$attrs').getString('value')).assertEqual('');
        expect(obj.getElement('$attrs').getString('placeholderFont')).assertEqual('{"style":"FontStyle.Normal","size":"14.00fp","weight":"400","fontFamily":"sans-serif"}');
        expect(obj.getElement('$attrs').getString('textFont')).assertEqual('{"fontSize":"14.00fp","fontStyle":"FontStyle.Normal","fontWeight":"400","fontFamily":"HarmonyOS Sans"}');
        expect(obj.getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Start');
        expect(obj.getElement('$attrs').getString('copyOption')).assertEqual('CopyOptions.InApp');
        expect(obj.getElement('$attrs').getString('placeholder')).assertEqual('Type to search...');
      console.info('[SearchJsunit_0100] END');
      done();
    });

    
    /**
     * @tc.number   SearchJsunit_static_0200
     * @tc.name     SearchJsunit_static_0200
     * @tc.desc     SearchJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SearchJsunit_static_0200', Level.LEVEL0, async (done: () => void) => {
      // Modify the properties of component Search
      console.info('[SearchJsunit_0200] START');
      await CommonFunc.sleep(500);
  let eventData: events_emitter.EventData = {
    data: {
      "searchIcon":  './resources/base/media/star_3.png',
      'searchButton': 'search',
      'placeholderColor':Color.Green,
      'changeValue':'hello',
      'placeholder':'Type to search...',
      'textFont':{size:'14.00fp',style:FontStyle.Normal,weight:400,family:"HarmonyOS Sans"} as Font,
        'textAlign':TextAlign.Center,
        'copyOption':CopyOptions.LocalDevice,
      "positionValue":2 as int
    } as Record<String,RecordData>
  }
  let innerEvent: events_emitter.InnerEvent = {
    eventId: 811,
    priority: events_emitter.EventPriority.LOW
  }
  events_emitter.emit(innerEvent, eventData)
      await CommonFunc.sleep(2000);

      // Get the properties of the Search component
      let strJson = inspector.getInspectorByKey('search');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SearchJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[SearchJsunit_0200] icon: " + obj.getElement('$attrs').getString('icon'));
      console.info("[SearchJsunit_0200] searchButton: " + obj.getElement('$attrs').getString('searchButton'));
      console.info("[SearchJsunit_0200] placeholderColor: " + obj.getElement('$attrs').getString('placeholderColor'));
      console.info("[SearchJsunit_0200] value: " + obj.getElement('$attrs').getString('value'));
      console.info("[SearchJsunit_0200] placeholder: " + obj.getElement('$attrs').getString('placeholder'));
      console.info("[SearchJsunit_0200] placeholderFont: " + obj.getElement('$attrs').getString('placeholder'));
      console.info("[SearchJsunit_0200] textFont: " + obj.getElement('$attrs').getString('textFont'));
      console.info("[SearchJsunit_0200] textAlign: " + obj.getElement('$attrs').getString('textAlign'));
      console.info("[SearchJsunit_0200] copyOption: " + obj.getElement('$attrs').getString('copyOption'));

        expect(obj.getElement('$attrs').getString('icon')).assertEqual('./resources/base/media/star_3.png');
        expect(obj.getElement('$attrs').getString('searchButton')).assertEqual('search');
        expect(obj.getElement('$attrs').getString('value')).assertEqual('hello');
        expect(obj.getElement('$attrs').getString('placeholderFont')).assertEqual('{"style":"FontStyle.Normal","size":"14.00fp","weight":"400","fontFamily":"sans-serif"}');
        expect(obj.getElement('$attrs').getString('textFont')).assertEqual('{"fontSize":"14.00fp","fontStyle":"FontStyle.Normal","fontWeight":"400","fontFamily":"HarmonyOS Sans"}');
        expect(obj.getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Center');
        expect(obj.getElement('$attrs').getString('copyOption')).assertEqual('CopyOptions.Local');
        expect(obj.getElement('$attrs').getString('placeholderColor')).assertEqual('#FF008000');
        expect(obj.getElement('$attrs').getString('placeholder')).assertEqual('Type to search...');
      console.info('[SearchJsunit_0200] END');
      done();
    });
    
    /**
     * @tc.number   SearchJsunit_static_0300
     * @tc.name     SearchJsunit_static_0300
     * @tc.desc     SearchJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('SearchJsunit_static_0300', Level.LEVEL0, async (done: () => void) => {
      // Verify the functions of the Search component
      console.info('[SearchJsunit_0300] START');
  let eventData: events_emitter.EventData = {
    data: {
      'changeValue':'',
      } as Record<String,RecordData>
    }
  let innerEvent: events_emitter.InnerEvent = {
    eventId: 811,
    priority: events_emitter.EventPriority.LOW
  }
  events_emitter.emit(innerEvent, eventData)
      await CommonFunc.sleep(1000);
      // Verify the onChange function of the Search component
      let driver = Driver.create()
      let textComponent1: Component|null = await driver.findComponent(ON.id('search'));
      if (textComponent1 != null && textComponent1 != undefined) {
        await (textComponent1.inputText("hello")  as Promise<void>)
        await driver.triggerKey(2047)
        await CommonFunc.sleep(1000);
        let strJson = inspector.getInspectorByKey('change');
        let obj = JSON.parseJsonElement(strJson);
          expect(obj.getElement('$attrs').getString('content')).assertEqual('onChange:hello');
        await CommonFunc.sleep(1000);
      }

      // Verify the onSubmit function of the Search component
      let textComponent2 = await driver.findComponent(ON.text('search'));
      if(!textComponent2){
        textComponent2 = await (driver.findComponent(ON.text('SEARCH')) as Promise<Component>);
      }
  await textComponent2!.click();
  await CommonFunc.sleep(1000);
  console.info("[SearchJsunit_0300] CLICK_SEARCH succ ");
  let strJson2 = inspector.getInspectorByKey('submit');
  let obj2 = JSON.parseJsonElement(strJson2);
  expect(obj2.getElement('$attrs').getString('content')).assertEqual('onSubmit:hello');

      // Verify the onCopy function of the Search component
      let driverX = Driver.create()
      let searchRect = CommonFunc.getComponentRectOnScreen('search')
      let clickX = Math.round((searchRect.right + searchRect.left)/2)
      let clickY = Math.round((searchRect.bottom + searchRect.top)/2)
      await driverX.mouseClick({ x: clickX as int, y: clickY as int }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      console.info("[SearchJsunit_0300] first mouseClick succ ");
      let textComponent3 = await (driver.findComponent(ON.text('全选')) as Promise<Component>);
  await textComponent3!.click()
  await driverX.mouseClick({ x: clickX as int, y: clickY as int }, MouseButton.MOUSE_BUTTON_RIGHT)
  await CommonFunc.sleep(1000);
      let textComponent4 = await (driver.findComponent(ON.text('复制')) as Promise<Component>);
  await textComponent4!.click()
  await CommonFunc.sleep(3000);
  console.info("[SearchJsunit_0300] click copy succ ");
  let strJson3 = inspector.getInspectorByKey('copy');
  let obj3 = JSON.parseJsonElement(strJson3);
  expect(obj3.getElement('$attrs').getString('content')).assertEqual('onCopy:hello');

      // Verify the onCut function of the Search component
      await driverX.mouseClick({ x: clickX as int, y: clickY as int}, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      console.info("[SearchJsunit_0300] secand mouseClick succ ");
      let textComponent5 = await (driver.findComponent(ON.text('全选')) as Promise<Component>);
  await textComponent5!.click()
  await driverX.mouseClick({ x: clickX as int, y: clickY as int}, MouseButton.MOUSE_BUTTON_RIGHT)
  await CommonFunc.sleep(1000);
      let textComponent6 = await (driver.findComponent(ON.text('剪切')) as Promise<Component>);

  await textComponent6!.click()
  await CommonFunc.sleep(3000);
  console.info("[SearchJsunit_0300] click cut succ ");
  let strJson4 = inspector.getInspectorByKey('cut');
  let obj4 = JSON.parseJsonElement(strJson4);
  console.info("[SearchJsunit_0300] obj4: " + JSON.stringify(obj4));
  expect(obj4.getElement('$attrs').getString('content')).assertEqual('onCut:hello');

      // Verify the onPaste function of the Search component
      await driverX.mouseClick({ x: clickX as int, y: clickY as int }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let textComponent8 = await (driver.findComponent(ON.text('粘贴')) as Promise<Component>);
  await textComponent8!.click()
  await CommonFunc.sleep(3000);
  console.info("[SearchJsunit_0300] click paste succ ");
  let strJson5 = inspector.getInspectorByKey('paste');
  let obj5 = JSON.parseJsonElement(strJson5);
  expect(obj5.getElement('$attrs').getString('content')).assertEqual('onPaste:hello');

      // Verify the caretPosition function of the Search component
      let textComponent7 = await (driver.findComponent(ON.id('button')) as Promise<Component>);
  await textComponent7!.click();
  await CommonFunc.sleep(1000);
  console.info("[SearchJsunit_0300] click button succ ");
  let strJson6 = inspector.getInspectorByKey('button');
  let obj6 = JSON.parseJsonElement(strJson6);
  expect(obj6.getElement('$attrs').getString('label')).assertEqual('Set caretPosition 2');
      console.info('[SearchJsunit_0300] END');
      done();
    });

    /**
     * @tc.number   SearchJsunit_static_0400
     * @tc.name     SearchJsunit_static_0400
     * @tc.desc     SearchJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('SearchJsunit_static_0400', Level.LEVEL0, async (done: () => void) => {
      // Illegal modification of properties of component Search
      console.info('[SearchJsunit_0400] START');
  let eventData: events_emitter.EventData = {
    data: {
      "searchIcon":  '10',
      'searchButton': '10',
      'placeholderColor':10,
      'changeValue':'10',
      'placeholder':'168',
      'placeholderFont':{style:FontStyle.Normal,size:"14.00fp",weight:400,family:"sans-serif"} as Font,
      'textFont':{size:"16.00fp",style:FontStyle.Normal,weight:FontWeight.Normal,family:"HarmonyOS Sans"} as Font,
      'textAlign':TextAlign.Start,
      'copyOption':CopyOptions.None
    } as Record<String,RecordData>
  }
  let innerEvent: events_emitter.InnerEvent = {
    eventId: 811,
    priority: events_emitter.EventPriority.LOW
  }
  events_emitter.emit(innerEvent, eventData)
  await CommonFunc.sleep(2000);
      // Get the properties of the Search component
      let strJson = inspector.getInspectorByKey('search');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SearchJsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[SearchJsunit_0400] icon: " + obj.getElement('$attrs').getString('icon'));
      console.info("[SearchJsunit_0400] searchButton: " + obj.getElement('$attrs').getString('searchButton'));
      console.info("[SearchJsunit_0400] placeholderColor: " + obj.getElement('$attrs').getString('placeholderColor'));
      console.info("[SearchJsunit_0400] value: " + obj.getElement('$attrs').getString('value'));
      console.info("[SearchJsunit_0400] placeholderFont: " + obj.getElement('$attrs').getString('placeholder'));
      console.info("[SearchJsunit_0400] textFont: " + obj.getElement('$attrs').getString('textFont'));
      console.info("[SearchJsunit_0400] textAlign: " + obj.getElement('$attrs').getString('textAlign'));
      console.info("[SearchJsunit_0400] copyOption: " + obj.getElement('$attrs').getString('copyOption'));
      console.info("[SearchJsunit_0400] placeholder: " + obj.getElement('$attrs').getString('placeholder'));

        expect(obj.getElement('$attrs').getString('icon')).assertEqual('10');
        expect(obj.getElement('$attrs').getString('searchButton')).assertEqual('10');
        expect(obj.getElement('$attrs').getString('placeholderColor')).assertEqual('#FF00000A');
        expect(obj.getElement('$attrs').getString('value')).assertEqual('10');
        expect(obj.getElement('$attrs').getString('placeholderFont')).assertEqual('{"style":"FontStyle.Normal","size":"14.00fp","weight":"400","fontFamily":"sans-serif"}');
        expect(obj.getElement('$attrs').getString('textFont')).assertEqual('{"fontSize":"16.00fp","fontStyle":"FontStyle.Normal","fontWeight":"FontWeight.Normal","fontFamily":"HarmonyOS Sans"}');
        expect(obj.getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Start');
        expect(obj.getElement('$attrs').getString('copyOption')).assertEqual('CopyOptions.None');
        expect(obj.getElement('$attrs').getString('placeholder')).assertEqual('168');

      console.info('[SearchJsunit_0400] END');
      done();
    });
  })
}
