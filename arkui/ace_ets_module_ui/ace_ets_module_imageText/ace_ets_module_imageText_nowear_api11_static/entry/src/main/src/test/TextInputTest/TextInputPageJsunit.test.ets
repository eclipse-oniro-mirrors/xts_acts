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
import {
  InputType,
  Color,
  EnterKeyType,
  TextAlign,Font,$r
} from '@ohos.arkui.component'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, MouseButton} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
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
let testAbilityContext:common.UIAbilityContext;

export default function TextInputPageJsunit() {
  describe('TextInputPageJsunit', () :void=> {
    beforeAll(() => {
      console.info("TextInputPageJsunit beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextInputPageJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextInput/TextInputPage",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputPageJsunit state pages:" + "");
        if (!("TextInputPage" == pages.name)) {
          console.info("get TextInputPageJsunit pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextInputPageJsunit page error:" + err);
      }
      console.info("TextInputPageJsunit beforeEach end");
    });

    afterEach(() => {
      const routerInstance = AppStorage.get<Router>("router") as Router
      routerInstance.pushUrl({url:'MainAbility/pages/index/index'});
    })


    /**
     * @tc.number   TextInputPageJsunit_static_0100
     * @tc.name     TextInputPageJsunit_static_0100
     * @tc.desc     TextInputPageJsunit_static_0100
     * @tc.level    Level.LEVEL1
     */
it('TextInputPageJsunit_static_0100', Level.LEVEL1, async (done: ()=>void) => {
      // Get the information of the TextInput component
      console.info('[TextInputPageJsunit_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('textInput');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextInputPageJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[TextInputPageJsunit_0100] placeholder: " + JSON.stringify(obj.getElement('$attrs').getString('placeholder')));
      console.info("[TextInputPageJsunit_0100] type: " + JSON.stringify(obj.getElement('$attrs').getString('type')));
      console.info("[TextInputPageJsunit_0100] placeholderColor: " + JSON.stringify(obj.getElement('$attrs').getString('placeholderColor')));
      console.info("[TextInputPageJsunit_0100] placeholderFont: " + JSON.stringify(obj.getElement('$attrs').getString('placeholderFont')));
      console.info("[TextInputPageJsunit_0100] enterKeyType: " + JSON.stringify(obj.getElement('$attrs').getString('enterKeyType')));
      console.info("[TextInputPageJsunit_0100] caretColor: " + JSON.stringify(obj.getElement('$attrs').getString('caretColor')));
      console.info("[TextInputPageJsunit_0100] maxLength: " + JSON.stringify(obj.getElement('$attrs').getString('maxLength')));
      console.info("[TextInputPageJsunit_0100] copyOption: " + JSON.stringify(obj.getElement('$attrs').getString('copyOption')));
      console.info("[TextInputPageJsunit_0100] showPasswordIcon: " + JSON.stringify(obj.getElement('$attrs').getBoolean('showPasswordIcon')));
      console.info("[TextInputPageJsunit_0100] style: " + JSON.stringify(obj.getElement('$attrs').getString('style')));
      console.info("[TextInputPageJsunit_0100] textAlign: " + JSON.stringify(obj.getElement('$attrs').getString('textAlign')));
      expect(obj.getElement('$attrs').getString('placeholder')).assertEqual('input your word...');
      expect(obj.getElement('$attrs').getString('type')).assertEqual('InputType.Email');
      expect(obj.getElement('$attrs').getString('placeholderColor')).assertEqual('#FF808080');
      expect(obj.getElement('$attrs').getString('placeholderFont')).assertEqual('{"style":"FontStyle.Normal","size":"14.00fp","weight":"400","fontFamily":"sans-serif"}');
      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Search');
      expect(obj.getElement('$attrs').getString('caretColor')).assertEqual('#FF0000FF');
      expect(obj.getElement('$attrs').getString('maxLength')).assertEqual('10');
      expect(obj.getElement('$attrs').getString('style')).assertEqual('TextInputStyle.Default');
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Center');
      expect(obj.getElement('$attrs').getString('copyOption')).assertEqual('CopyOptions.InApp');
      expect(obj.getElement('$attrs').getBoolean('showPasswordIcon')).assertEqual(false);
      console.info('[TextInputPageJsunit_0100] END');
      done();
    });




    /**
     * @tc.number   TextInputPageJsunit_static_0200
     * @tc.name     TextInputPageJsunit_static_0200
     * @tc.desc     TextInputPageJsunit_static_0200
     * @tc.level    Level.LEVEL1
     */
it('TextInputPageJsunit_static_0200', Level.LEVEL1, async (done: ()=>void) => {
      // Get default attributes of TextInput component
      console.info('[TextInputPageJsunit_0200] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('input');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextInputPageJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[TextInputPageJsunit_0200] placeholder: " + JSON.stringify(obj.getElement('$attrs').getString('placeholder')));
      console.info("[TextInputPageJsunit_0200] type: " + JSON.stringify(obj.getElement('$attrs').getString('type')));
      console.info("[TextInputPageJsunit_0200] placeholderColor: " + JSON.stringify(obj.getElement('$attrs').getString('placeholderColor')));
      console.info("[TextInputPageJsunit_0200] placeholderFont: " + JSON.stringify(obj.getElement('$attrs').getString('placeholderFont')));
      console.info("[TextInputPageJsunit_0200] enterKeyType: " + JSON.stringify(obj.getElement('$attrs').getString('enterKeyType')));
      console.info("[TextInputPageJsunit_0200] caretColor: " + JSON.stringify(obj.getElement('$attrs').getString('caretColor')));
      console.info("[TextInputPageJsunit_0200] maxLength: " + JSON.stringify(obj.getElement('$attrs').getString('maxLength')));
      console.info("[TextInputPageJsunit_0200] copyOption: " + JSON.stringify(obj.getElement('$attrs').getString('copyOption')));
      console.info("[TextInputPageJsunit_0200] showPasswordIcon: " + JSON.stringify(obj.getElement('$attrs').getBoolean('showPasswordIcon')));
      console.info("[TextInputPageJsunit_0200] style: " + JSON.stringify(obj.getElement('$attrs').getString('style')));
      console.info("[TextInputPageJsunit_0200] textAlign: " + JSON.stringify(obj.getElement('$attrs').getString('textAlign')));
      let resourceSize = AppStorage.get<UIContext>('uiContext')!.getHostContext()?.resourceManager.getDouble($r('sys.float.ohos_id_text_size_body1').id) as double
      expect(obj.getElement('$attrs').getString('placeholder')).assertEqual('inline style');
      expect(obj.getElement('$attrs').getString('type')).assertEqual('InputType.Normal');
      expect(obj.getElement('$attrs').getString('placeholderFont')).assertEqual('{"style":"FontStyle.Normal","size":"'+AppStorage.get<UIContext>('uiContext')!.px2fp(resourceSize)+'.00fp","weight":"400","fontFamily":"sans-serif"}');
      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Done');
      expect(obj.getElement('$attrs').getString('maxLength')).assertEqual('INF');
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Start');
      expect(obj.getElement('$attrs').getBoolean('showPasswordIcon')).assertEqual(true);

      await CommonFunc.sleep(1000);
      console.info('[TextInputPageJsunit_0200] END');
      done();
    });

    /**
     * @tc.number   TextInputPageJsunit_static_0300
     * @tc.name     TextInputPageJsunit_static_0300
     * @tc.desc     TextInputPageJsunit_static_0300
     * @tc.level    Level.LEVEL1
     */
it('TextInputPageJsunit_static_0300', Level.LEVEL1, async (done: ()=>void) => {
      // Modify the properties of TextInput component
      console.info('[TextInputPageJsunit_0300] START');

  let eventData: events_emitter.EventData = {
    data: {
      "textAlign":  TextAlign.Start,
      'maxLength': 8 as int,
      'caretColor':Color.Red,
      'enterKeyType':EnterKeyType.Done,
      'placeholderFont':{ size: 18, weight: 500 } as Font,
      'placeholderColor':Color.Green,
      'type':InputType.Normal,
      'placeholder':'place input your word...'
    } as Record<String,RecordData>
  }
  let innerEvent: events_emitter.InnerEvent = {
    eventId: 811,
    priority: events_emitter.EventPriority.LOW
  }
  events_emitter.emit(innerEvent, eventData)
  await CommonFunc.sleep(2000);

      // Get the propoties value of the TextInput component
      let strJson = inspector.getInspectorByKey('textInput');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextInputPageJsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[TextInputPageJsunit_0300] placeholder: " + JSON.stringify(obj.getElement('$attrs').getString('placeholder')));
      console.info("[TextInputPageJsunit_0300] type: " + JSON.stringify(obj.getElement('$attrs').getString('type')));
      console.info("[TextInputPageJsunit_0300] placeholderColor: " + JSON.stringify(obj.getElement('$attrs').getString('placeholderColor')));
      console.info("[TextInputPageJsunit_0300] placeholderFont: " + JSON.stringify(obj.getElement('$attrs').getString('placeholderFont')));
      console.info("[TextInputPageJsunit_0300] enterKeyType: " + JSON.stringify(obj.getElement('$attrs').getString('enterKeyType')));
      console.info("[TextInputPageJsunit_0300] caretColor: " + JSON.stringify(obj.getElement('$attrs').getString('caretColor')));
      console.info("[TextInputPageJsunit_0300] maxLength: " + JSON.stringify(obj.getElement('$attrs').getString('maxLength')));
      console.info("[TextInputPageJsunit_0300] textAlign: " + JSON.stringify(obj.getElement('$attrs').getString('textAlign')));
      expect(obj.getElement('$attrs').getString('placeholder')).assertEqual('place input your word...');
      expect(obj.getElement('$attrs').getString('type')).assertEqual('InputType.Normal');
      expect(obj.getElement('$attrs').getString('placeholderFont')).assertEqual('{"style":"FontStyle.Normal","size":"18.00fp","weight":"500","fontFamily":"sans-serif"}');
      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Done');
      expect(obj.getElement('$attrs').getString('caretColor')).assertEqual('#FFFF0000');
      expect(obj.getElement('$attrs').getString('maxLength')).assertEqual('8');
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Start');
      console.info('[TextInputPageJsunit_0300] END');
      done();
    });
    /**
     * @tc.number   TextInputPageJsunit_static_0400
     * @tc.name     TextInputPageJsunit_static_0400
     * @tc.desc     TextInputPageJsunit_static_0400
     * @tc.level    Level.LEVEL1
     */
it('TextInputPageJsunit_static_0400', Level.LEVEL1, async (done: ()=>void) => {
      // Verify functions of TextInput component
      console.info('[TextInputPageJsunit_0400] START');
      let driver = Driver.create()
      let textComponent = await driver.findComponent(ON.id('textInput'));
      await (textComponent?.click() as Promise<void>)
      await CommonFunc.sleep(500);
      await (textComponent?.inputText("hello") as Promise<void>)
	    await driver.triggerKey(2047)
      await CommonFunc.sleep(1000);
      let component = await driver.findComponent(ON.id('text'));
      let text = await (component?.getText() as Promise<string>);
      expect(text).assertEqual('hello');
      console.info("[TextInputPageJsunit_0400] inputText hello succ !");

      // Verify submit function of TextInput component
      let textComponent1 = await driver.findComponent(ON.id('submit'));
      let text1 = await (textComponent1?.getText()  as Promise<string>);
      expect(text1).assertEqual('onSubmit:');
      console.info("[TextInputPageJsunit_0400] Verify submit succ !");

      // Verify editChange function of TextInput component
      let textComponent2 = await driver.findComponent(ON.id('editChange'));
      let text2 = await (textComponent2?.getText() as Promise<string>);
      expect(text2).assertEqual('onEditChange:true');
      let password = await driver.findComponent(ON.id('password'));
      await (password?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let textFalse = await (textComponent2?.getText() as Promise<string>);
      expect(textFalse).assertEqual('onEditChange:false');
      console.info("[TextInputPageJsunit_0400] Verify editChange succ !");

      // Verify onCopy function of TextInput component
      let driverX = Driver.create()
      let textInputRect = CommonFunc.getComponentRectOnScreen('textInput')
      let clickX = Math.round((textInputRect.right + textInputRect.left)/2).toInt()
      let clickY = Math.round((textInputRect.bottom + textInputRect.top)/2).toInt()
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(3000);
      let textComponent3 = await driver.findComponent(ON.text('全选'));
      await (textComponent3?.click() as Promise<void>)
      await CommonFunc.sleep(3000);
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let textComponent4 = await driver.findComponent(ON.text('复制'));
      await (textComponent4?.click() as Promise<void>)
      await (textComponent?.click() as Promise<void>)
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('copy');
      await CommonFunc.sleep(3000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextInputPageJsunit_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onCopy:hello');


      console.info("[TextInputPageJsunit_0400] Verify copy succ !");

      // Verify onCut function of TextInput component
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let textComponent5 = await driver.findComponent(ON.text('全选'));
      await (textComponent5?.click() as Promise<void>)
      await CommonFunc.sleep(3000);
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let textComponent6 = await driver.findComponent(ON.text('剪切'));
      await (textComponent6?.click() as Promise<void>)
      await CommonFunc.sleep(3000);
      let strJson1 = inspector.getInspectorByKey('cut');

      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[TextInputPageJsunit_0400] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('onCut:hello');
      console.info("[TextInputPageJsunit_0400] Verify cut succ !");

      // Verify onPaste function of TextInput component
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let textComponent7 = await driver.findComponent(ON.text('粘贴'));
      await (textComponent7?.click() as Promise<void>)
      await CommonFunc.sleep(3000);
      let strJson2 = inspector.getInspectorByKey('paste');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[TextInputPageJsunit_0400] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('onPaste:hello');
      console.info("[TextInputPageJsunit_0400] Verify paste succ !");
      console.info('[TextInputPageJsunit_0400] END');
      done();
    });
  })
}
