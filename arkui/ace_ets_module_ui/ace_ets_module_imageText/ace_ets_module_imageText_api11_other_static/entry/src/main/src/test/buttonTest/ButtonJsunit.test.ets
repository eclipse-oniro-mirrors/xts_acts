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

import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import router from '@ohos.router';
import window from '@ohos.window';
import events_emitter from '@ohos.events.emitter';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Color, FontWeight, ButtonType, FontStyle, $r } from '@ohos.arkui.component';


let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


const waitUiReadyMs = 1000;

export default function buttonJsunit() {
  describe('buttonJsunit', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("buttonJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/button/buttonExample',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get buttonJsunit state pages:" + JSON.stringify(pages));
        if (!("buttonExample" == pages.name)) {
          console.info("get buttonJsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push buttonJsunit page result:" + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push buttonJsunit page error:" + err);
        expect().assertFail();
      }

    });

    
/**
     * @tc.number   buttonJsunit_static_0100
     * @tc.name     buttonJsunit_static_0100
     * @tc.desc     buttonJsunit_static_0100
     * @tc.level    Level.LEVEL1
     */
it('buttonJsunit_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('buttonJsunitUITest_0100 START');
      await CommonFunc.sleep(1000);
      // 获取button组件的信息
      let strJson = inspector.getInspectorByKey('btok');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[buttonJsunit_static_0100'] component obj is: " + obj);
      expect(obj.getElement("$type").asString()).assertEqual('Button');
      expect(obj.getElement('$attrs').getString('type')).assertEqual('ButtonType.Normal');
      expect(obj.getElement('$attrs').getString('stateEffect')).assertEqual('true');
      expect(obj.getElement('$attrs').getString("fontSize")).assertEqual('12.00fp');
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual('#FFFF0000');
      expect(obj.getElement('$attrs').getString('fontFamily')).assertEqual('123');
      expect(obj.getElement('$attrs').getString('fontStyle')).assertEqual('FontStyle.Italic');
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Lighter');
      done();
    });

    
/**
     * @tc.number   buttonJsunit_static_0200
     * @tc.name     buttonJsunit_static_0200
     * @tc.desc     buttonJsunit_static_0200
     * @tc.level    Level.LEVEL1
     */
it('buttonJsunit_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('buttonJsunitUITest_0200 START');
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<ButtonType | boolean | string | Color | FontStyle | FontWeight>>("messageManager")!.notify({ name: 'stateEffect', value: false });
      await CommonFunc.sleep(200);
      let strJson2 = inspector.getInspectorByKey('btok');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[buttonJsunit_static_0200'] component2 obj is: " + obj2.getElement('$attrs').getString('stateEffect'));
      expect(obj2.getElement('$attrs').getString('stateEffect')).assertEqual('false');
      done();
    });


    
/**
     * @tc.number   buttonJsunit_static_0300
     * @tc.name     buttonJsunit_static_0300
     * @tc.desc     buttonJsunit_static_0300
     * @tc.level    Level.LEVEL1
     */
it('buttonJsunit_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('buttonJsunitUITest_0300 START');
      await CommonFunc.sleep(1000);
      // 动态修改Button组件的属性,设置为非法值
      AppStorage.get<MessageManager<ButtonType | boolean | string | Color | FontStyle | FontWeight>>("messageManager")!.notify({ name: 'bttype', value: '5' });
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('btok');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[buttonJsunit_static_0300'] component obj is: " + obj.getElement('$attrs').getString('type'));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('ButtonType.ROUNDED_RECTANGLE');
      done();
    });

    
/**
     * @tc.number   buttonJsunit_static_0400
     * @tc.name     buttonJsunit_static_0400
     * @tc.desc     buttonJsunit_static_0400
     * @tc.level    Level.LEVEL1
     */
it('buttonJsunit_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('buttonJsunitUITest_0400 START');
      // check the button is click
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('btdisable'));
      await driver.delayMs(waitUiReadyMs);
      let isClick = await (btn?.isClickable() as Promise<boolean>);
      expect(isClick).assertFalse();
      done();
    });

    
/**
     * @tc.number   buttonJsunit_static_0500
     * @tc.name     buttonJsunit_static_0500
     * @tc.desc     buttonJsunit_static_0500
     * @tc.level    Level.LEVEL1
     */
it('buttonJsunit_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('buttonJsunitUITest_0500 START');
      // 判断按钮的点击事件,通过按钮的文本可以判断
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('btdisable1'));
      await driver.delayMs(waitUiReadyMs);
      await (btn?.click() as Promise<void>);
      await driver.delayMs(2000);
      let tt = await (btn?.getText() as Promise<string>);
      console.info("[buttonJsunit_static_0500'] component obj is: " + tt);
      expect(tt == 'click').assertTrue();
      done();
    });

    
/**
     * @tc.number   buttonJsunit_static_0600
     * @tc.name     buttonJsunit_static_0600
     * @tc.desc     buttonJsunit_static_0600
     * @tc.level    Level.LEVEL1
     */
it('buttonJsunit_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // buton 通用字体属性判断
      console.info('buttonJsunitUITest_0600 START');
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<ButtonType | boolean | string | Color | FontStyle | FontWeight>>("messageManager")!.notify({ name: 'fontSize', value: '13' });
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<ButtonType | boolean | string | Color | FontStyle | FontWeight>>("messageManager")!.notify({ name: 'fontColor', value: Color.Green });
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<ButtonType | boolean | string | Color | FontStyle | FontWeight>>("messageManager")!.notify({ name: 'fontFamily', value: 'HarmonyOS Sans' });
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<ButtonType | boolean | string | Color | FontStyle | FontWeight>>("messageManager")!.notify({ name: 'fontStyle', value: FontStyle.Normal });
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<ButtonType | boolean | string | Color | FontStyle | FontWeight>>("messageManager")!.notify({ name: 'fontWeight', value: FontWeight.Bold });
      await CommonFunc.sleep(200);
      let strJson = inspector.getInspectorByKey('btok');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[buttonJsunit_static_0600'] component obj is: " + obj);
      expect(obj.getElement('$attrs').getString("fontSize")).assertEqual('13.00fp');
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual('#FF008000');
      expect(obj.getElement('$attrs').getString('fontFamily')).assertEqual('HarmonyOS Sans');
      expect(obj.getElement('$attrs').getString('fontStyle')).assertEqual('FontStyle.Normal');
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Bold');
      done();
    });

    
/**
     * @tc.number   buttonJsunit_static_0700
     * @tc.name     buttonJsunit_static_0700
     * @tc.desc     buttonJsunit_static_0700
     * @tc.level    Level.LEVEL1
     */
it('buttonJsunit_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // buton 通用字体非法属性判断
      console.info('buttonJsunitUITest_0700 START');
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<ButtonType | boolean | string | Color | FontStyle | FontWeight>>("messageManager")!.notify({ name: 'fontSize', value: '-200' });
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<ButtonType | boolean | string | Color | FontStyle | FontWeight>>("messageManager")!.notify({ name: 'fontColor', value: "#ff" });
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<ButtonType | boolean | string | Color | FontStyle | FontWeight>>("messageManager")!.notify({ name: 'fontFamily', value: '233' });
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<ButtonType | boolean | string | Color | FontStyle | FontWeight>>("messageManager")!.notify({ name: 'fontStyle', value: '4444' });
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<ButtonType | boolean | string | Color | FontStyle | FontWeight>>("messageManager")!.notify({ name: 'fontWeight', value: '-20' });
      await CommonFunc.sleep(200);
      let strJson = inspector.getInspectorByKey('btok');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[buttonJsunit_static_0700'] component obj is: " + obj.getElement('$attrs').getString("fontSize") + obj.getElement('$attrs').getString('fontColor') +
      obj.getElement('$attrs').getString('fontFamily') + obj.getElement('$attrs').getString('fontStyle') + obj.getElement('$attrs').getString('fontWeight'));
      const uiContext = AppStorage.get<UIContext>('uiContext')!;
      let resourceSize = uiContext.getHostContext()!.resourceManager.getDouble($r('sys.float.ohos_id_text_size_body1').id)
      console.info("[TextInputPageJsunit_0200] size: " + uiContext.px2fp(resourceSize));
      expect(obj.getElement('$attrs').getString("fontSize")).assertEqual('' + uiContext.px2fp(resourceSize) + '.00fp');
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual('#FFFFFFFF');
      expect(obj.getElement('$attrs').getString('fontFamily')).assertEqual('233');
      expect(obj.getElement('$attrs').getString('fontStyle')).assertEqual('FontStyle.Normal');
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Normal');
      done();
    });

    
/**
     * @tc.number   buttonJsunit_static_0800
     * @tc.name     buttonJsunit_static_0800
     * @tc.desc     buttonJsunit_static_0800
     * @tc.level    Level.LEVEL1
     */
it('buttonJsunit_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('buttonJsunitUITest_0800 START');
      await CommonFunc.sleep(1000);
      // 动态修改Button组件的属性
      AppStorage.get<MessageManager<ButtonType | boolean | string | Color | FontStyle | FontWeight>>("messageManager")!.notify({ name: 'bttype', value: ButtonType.Capsule });
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('btok');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[buttonJsunit_static_0800'] component obj is: " + obj.getElement('$attrs').getString('type'));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('ButtonType.Capsule');
      done();
    });

  })
}