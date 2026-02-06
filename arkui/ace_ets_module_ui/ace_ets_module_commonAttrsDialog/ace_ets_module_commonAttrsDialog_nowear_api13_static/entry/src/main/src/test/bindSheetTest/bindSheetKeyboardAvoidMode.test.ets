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
import { beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function bindSheetKeyboardAvoidMode() {
  describe('bindSheetKeyboardAvoidMode', () => {

    beforeAll(() => {
      console.info("bindSheetKeyboardAvoidMode beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsDialog.nowear.api13.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("bindSheetKeyboardAvoidMode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindSheetTest/bindSheetKeyboardAvoidMode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get bindSheetKeyboardAvoidMode state pages:" + JSON.stringify(pages));
        if (!("bindSheetKeyboardAvoidMode" == pages.name)) {
          console.info("get bindSheetKeyboardAvoidMode pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push bindSheetKeyboardAvoidMode page error:" + err);
      }
      console.info("bindSheetKeyboardAvoidMode beforeEach end");
    });


    
    
/**
     * @tc.number   bindSheetKeyboardAvoidMode_static_0100
     * @tc.name     bindSheetKeyboardAvoidMode_static_0100
     * @tc.desc     bindSheetKeyboardAvoidMode_static_0100
     * @tc.level    Level.LEVEL0
     */
it('bindSheetKeyboardAvoidMode_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('bindSheetKeyboardAvoidMode_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(2000);
      let btn1 = await driver.findComponent(ON.id('noneButton'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      let btn2 = await driver.findComponent(ON.id('ipt'));
      await (btn2?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('text');
      console.info("[bindSheetKeyboardAvoidMode_static_0100] bindSheetKeyboardAvoidMode JSON.parseJsonElement(strJson) is: " + JSON.stringify(strJson));
      console.info("[bindSheetKeyboardAvoidMode_static_0100] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[bindSheetKeyboardAvoidMode_static_0100] title: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('0');
      await CommonFunc.sleep(2000);
      let btn3 = await driver.findComponent(ON.id('close'));
      await (btn3?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      console.info('[bindSheetKeyboardAvoidMode_static_0100] END');
      done();
    });


    
/**
     * @tc.number   bindSheetKeyboardAvoidMode_static_0200
     * @tc.name     bindSheetKeyboardAvoidMode_static_0200
     * @tc.desc     bindSheetKeyboardAvoidMode_static_0200
     * @tc.level    Level.LEVEL0
     */
it('bindSheetKeyboardAvoidMode_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('bindSheetKeyboardAvoidMode_static_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(2000);
      let btn1 = await driver.findComponent(ON.id('translateResizeButton'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      let btn2 = await driver.findComponent(ON.id('ipt'));
      await (btn2?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('text');
      console.info("[bindSheetKeyboardAvoidMode_static_0200] bindSheetKeyboardAvoidMode JSON.parseJsonElement(strJson) is: " + JSON.stringify(strJson));
      console.info("[bindSheetKeyboardAvoidMode_static_0200] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[bindSheetKeyboardAvoidMode_static_0200] title: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('1');
      await CommonFunc.sleep(2000);
      let btn3 = await driver.findComponent(ON.id('close'));
      await (btn3?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      console.info('[bindSheetKeyboardAvoidMode_static_0200] END');
      done();
    });


    
/**
     * @tc.number   bindSheetKeyboardAvoidMode_static_0300
     * @tc.name     bindSheetKeyboardAvoidMode_static_0300
     * @tc.desc     bindSheetKeyboardAvoidMode_static_0300
     * @tc.level    Level.LEVEL0
     */
it('bindSheetKeyboardAvoidMode_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('bindSheetKeyboardAvoidMode_static_0300 START');
      let driver = Driver.create()
      await CommonFunc.sleep(2000);
      let btn1 = await driver.findComponent(ON.id('resizeOnlyButton'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      let btn2 = await driver.findComponent(ON.id('ipt'));
      await (btn2?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('text');
      console.info("[bindSheetKeyboardAvoidMode_static_0300] bindSheetKeyboardAvoidMode JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(strJson));
      console.info("[bindSheetKeyboardAvoidMode_static_0300] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[bindSheetKeyboardAvoidMode_static_0300] title: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('2');
      await CommonFunc.sleep(2000);
      let btn3 = await driver.findComponent(ON.id('close'));
      await (btn3?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      console.info('[bindSheetKeyboardAvoidMode_static_0300] END');
      done();
    });

    
/**
     * @tc.number   bindSheetKeyboardAvoidMode_static_0400
     * @tc.name     bindSheetKeyboardAvoidMode_static_0400
     * @tc.desc     bindSheetKeyboardAvoidMode_static_0400
     * @tc.level    Level.LEVEL0
     */
it('bindSheetKeyboardAvoidMode_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('bindSheetKeyboardAvoidMode_static_0400 START');
      let driver = Driver.create()
      await CommonFunc.sleep(2000);
      let btn1 = await driver.findComponent(ON.id('translateScrollButton'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      let btn2 = await driver.findComponent(ON.id('ipt'));
      await (btn2?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('text1');
      console.info("[bindSheetKeyboardAvoidMode_static_0400] bindSheetKeyboardAvoidMode JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(strJson));
      console.info("[bindSheetKeyboardAvoidMode_static_0400] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[bindSheetKeyboardAvoidMode_static_0400] title: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('3');
      await CommonFunc.sleep(2000);
      let btn3 = await driver.findComponent(ON.id('close1'));
      await (btn3?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      console.info('[bindSheetKeyboardAvoidMode_static_0400] END');
      done();
    });
  })
}

