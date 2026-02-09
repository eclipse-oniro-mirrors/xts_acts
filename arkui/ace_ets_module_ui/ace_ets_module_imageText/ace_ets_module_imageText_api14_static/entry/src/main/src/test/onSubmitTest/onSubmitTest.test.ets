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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function onSubmitTest() {
  describe('onSubmitTest', () => {
    beforeAll(() => {
      console.info("onSubmitTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api14.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      console.info("onSubmitTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/onSubmit/onSubmitTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get onSubmitTest state pages: " + JSON.stringify(pages));
        if (!("onHover" == pages.name)) {
          console.info("get onSubmitTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push onSubmitTest page error: " + err);
        expect().assertFail();
      }
    });

    
    

    /**
     * @tc.number   onSubmitTest_static_0010
     * @tc.name     onSubmitTest_static_0010
     * @tc.desc     onSubmitTest_static_0010
     * @tc.level    Level.LEVEL2
     */
it('onSubmitTest_static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('onSubmitTest_0010 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let TextArea = await driver.findComponent(ON.id('TextArea'));
      await (TextArea?.inputText('这是测试文本') as Promise<void>)
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2054)
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('enterKeyType');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("TextArea enterKeyType content: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('6');
      let strJson2 = inspector.getInspectorByKey('TextAreaevent');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("TextArea TextAreaEventText content: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('这是测试文本');
      let strJson3 = inspector.getInspectorByKey('TextAreaIsEdit');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("TextArea TextAreaIsEdit content: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('false');
      console.info('[onSubmitTest_0010] END');
      done();
    });
    
    

    /**
     * @tc.number   onSubmitTest_static_0020
     * @tc.name     onSubmitTest_static_0020
     * @tc.desc     onSubmitTest_static_0020
     * @tc.level    Level.LEVEL2
     */
it('onSubmitTest_static_0020', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('onSubmitTest_0020 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('changeIsCallKeepEditableState'));
      await CommonFunc.sleep(1000);
      await (button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let TextArea: Component | null = await driver.findComponent(ON.id('TextArea'));
      await (TextArea?.inputText('这是测试文本') as Promise<void>)
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2054)
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('enterKeyType');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("TextArea enterKeyType content: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('6');
      let strJson2 = inspector.getInspectorByKey('TextAreaevent');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("TextArea TextAreaEventText content: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('这是测试文本');
      let strJson3 = inspector.getInspectorByKey('TextAreaIsEdit');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("TextArea TextAreaIsEdit content: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('true');
      console.info('[onSubmitTest_0020] END');
      done();
    });

    
    

    /**
     * @tc.number   onSubmitTest_static_0030
     * @tc.name     onSubmitTest_static_0030
     * @tc.desc     onSubmitTest_static_0030
     * @tc.level    Level.LEVEL2
     */
it('onSubmitTest_static_0030', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('onSubmitTest_0030 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let Search: Component | null = await driver.findComponent(ON.id('Search'));
      await (Search?.inputText('这是测试文本') as Promise<void>)
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2054)
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('searchText');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("Search searchText content: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('这是测试文本');
      let strJson2 = inspector.getInspectorByKey('event');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("Search event content: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('这是测试文本');
      let strJson3 = inspector.getInspectorByKey('searchIsEditing');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("TextArea searchIsEditing content: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('false');
      console.info('[onSubmitTest_0030] END');
      done();
    });
    
    

    /**
     * @tc.number   onSubmitTest_static_0040
     * @tc.name     onSubmitTest_static_0040
     * @tc.desc     onSubmitTest_static_0040
     * @tc.level    Level.LEVEL2
     */
it('onSubmitTest_static_0040', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('onSubmitTest_0040 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('changeIsCallKeepEditableState'));
      await CommonFunc.sleep(1000);
      await (button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Search: Component | null = await driver.findComponent(ON.id('Search'));
      await (Search?.inputText('这是测试文本') as Promise<void>)
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2054)
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('searchText');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("Search searchText content: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('这是测试文本');
      let strJson2 = inspector.getInspectorByKey('event');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("Search event content: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('这是测试文本');
      let strJson3 = inspector.getInspectorByKey('searchIsEditing');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("searchIsEditing content: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('true');
      console.info('[onSubmitTest_0040] END');
      done();
    });
  })
}