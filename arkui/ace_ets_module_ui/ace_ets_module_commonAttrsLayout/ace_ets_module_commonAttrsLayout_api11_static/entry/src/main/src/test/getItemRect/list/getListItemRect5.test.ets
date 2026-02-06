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
import { Axis } from '@ohos.arkui.component';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { ComponentUtils, Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../../Util.test';
import { BusinessError } from '@ohos.base';
import { MessageManager } from '../../../../ets/MainAbility/common/MessageManager';
import RectValue from '../../../../ets/MainAbility/common/Rect';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function getListItemRect5() {
  describe('getListItemRect5', () => {




    beforeAll(async (): Promise<void> => {
      console.info("getListItemRect5 beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsLayout.api11.static", "EntryAbility")
    });
    beforeEach(() => {
      console.info("getListItemRect5 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getItemRect/list/getListItemRect5',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get getListItemRect5 state pages: " + JSON.stringify(pages));
        if (!("getListItemRect5" == pages.name)) {
          console.info("get getListItemRect5 state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push getListItemRect5 page error: " + err);
        expect().assertFail();
      }
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);

      // const routerInstance = AppStorage.get<Router>("router") as Router
      // routerInstance.back();
      console.info("BadgeFocus after each called");
    });


    
    /**
     * @tc.number   getListItemRect5_static_0100
     * @tc.name     getListItemRect5_static_0100
     * @tc.desc     getListItemRect5_static_0100
     * @tc.level    Level.LEVEL0
     */
it('getListItemRect5_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getListItemRect5_static_0100] START');
      let uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
      const message: MessageManager<number> = AppStorage.get<MessageManager<number>>("messageManager")!
      message.notify({ name: 'index', value: 0.0 as Double })
      await CommonFunc.sleep(1000);

      console.log('get Initial value')
      let listItem_0: RectValue = CommonFunc.getComponentRect('getListItemRect5_listItem_0') as RectValue;

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getListItemRect5_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getListItemRect5_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getListItemRect5_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getListItemRect5_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getListItemRect5_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.abs(Math.round(x) - Math.round(0)) <= 1).assertTrue();

      expect(Math.abs(Math.round(y) - Math.round(0)) <= 1).assertTrue();

      console.log('assert size')
      console.log('listItem_0.right - listItem_0.left' + (listItem_0.right - listItem_0.left))
      expect(Math.abs(UIContext.resolveUIContext()!.vp2px(Math.round(width)) - Math.round(listItem_0.right - listItem_0.left)) <= 1)
        .assertTrue();
      console.log('listItem_0.bottom - listItem_0.top' + (listItem_0.bottom - listItem_0.top))
      expect(Math.abs(UIContext.resolveUIContext()!.vp2px(Math.round(height)) - Math.round(listItem_0.bottom - listItem_0.top)) <= 1)
        .assertTrue();

      done();
    });


    
    /**
     * @tc.number   getListItemRect5_static_0200
     * @tc.name     getListItemRect5_static_0200
     * @tc.desc     getListItemRect5_static_0200
     * @tc.level    Level.LEVEL0
     */
it('getListItemRect5_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getListItemRect5_static_0200] START');
      let uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
      const message: MessageManager<Object> = AppStorage.get<MessageManager<Object>>("messageManager")!
      const message1: MessageManager<Axis> = AppStorage.get<MessageManager<Axis>>("messageManagerAxis")!
      const message2: MessageManager<string> = AppStorage.get<MessageManager<string>>("messageManagerString")!
      message.notify({ name: 'index', value: 0.0 as Double })
      message1.notify({ name: 'listDirection1', value: Axis.Horizontal })
      message.notify({ name: 'width2', value: 30.0 })
      message2.notify({ name: 'height2', value: '100%' })
      await CommonFunc.sleep(1000);

      console.log('get Initial value')
      let listItem_0: RectValue = CommonFunc.getComponentRect('getListItemRect5_listItem_0') as RectValue;

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getListItemRect5_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getListItemRect5_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getListItemRect5_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getListItemRect5_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getListItemRect5_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.abs(Math.round(x) - Math.round(0)) <= 1).assertTrue();

      expect(Math.abs(Math.round(y) - Math.round(0)) <= 1).assertTrue();

      console.log('assert size')
      console.log('listItem_0.right - listItem_0.left' + (listItem_0.right - listItem_0.left))
      expect(Math.abs(UIContext.resolveUIContext()!.vp2px(Math.round(width)) - Math.round(listItem_0.right - listItem_0.left)) <= 1)
        .assertTrue();
      console.log('listItem_0.bottom - listItem_0.top' + (listItem_0.bottom - listItem_0.top))
      expect(Math.abs(UIContext.resolveUIContext()!.vp2px(Math.round(height)) - Math.round(listItem_0.bottom - listItem_0.top)) <= 1)
        .assertTrue();

      done();
    });

  })
}
