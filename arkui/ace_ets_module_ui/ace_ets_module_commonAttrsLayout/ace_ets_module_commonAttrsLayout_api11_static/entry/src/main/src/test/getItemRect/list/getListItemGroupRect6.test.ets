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

export default function getListItemGroupRect6() {
  describe('getListItemGroupRect6', () => {
    beforeAll(async (): Promise<void> => {
      console.info("getListItemGroupRect6 beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.commonAttrsLayout.api11.static", "EntryAbility")

    });
    beforeEach(() => {
      console.info("getListItemGroupRect6 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getItemRect/list/getListItemGroupRect6',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get getListItemGroupRect6 state pages: " + JSON.stringify(pages));
        if (!("getListItemGroupRect6" == pages.name)) {
          console.info("get getListItemGroupRect6 state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push getListItemGroupRect6 page error: " + err);
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
     * @tc.number   getListItemGroupRect6_static_0100
     * @tc.name     getListItemGroupRect6_static_0100
     * @tc.desc     getListItemGroupRect6_static_0100
     * @tc.level    Level.LEVEL0
     */
it('getListItemGroupRect6_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getListItemGroupRect6_static_0100] START');
      let uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
      const message: MessageManager<Int> = AppStorage.get<MessageManager<Int>>("messageManager")!
      message.notify({ name: 'index', value: 0 });
      message.notify({ name: 'indexInGroup', value: -1 });
      await CommonFunc.sleep(1000);

      console.log('get Initial value')
      let listItemGroup_3: RectValue =
        CommonFunc.getComponentRect('getListItemGroupRect6_listItemGroup_3') as RectValue;

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('delete')
      await driver.swipe(
        Math.round((listItemGroup_3.right - listItemGroup_3.left) * 0.9 + listItemGroup_3.left +
        Number(AppStorage.get<number>("winLeft"))) as int,
        Math.round((listItemGroup_3.bottom - listItemGroup_3.top) * 0.5 + listItemGroup_3.top +
        Number(AppStorage.get<number>("winTop"))) as int,
        Math.round((listItemGroup_3.right - listItemGroup_3.left) * 0.1 + listItemGroup_3.left +
        Number(AppStorage.get<number>("winLeft"))) as int,
        Math.round((listItemGroup_3.bottom - listItemGroup_3.top) * 0.5 + listItemGroup_3.top +
        Number(AppStorage.get<number>("winTop"))) as int
      )
      await CommonFunc.sleep(1000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getListItemGroupRect6_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getListItemGroupRect6_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getListItemGroupRect6_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getListItemGroupRect6_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getListItemGroupRect6_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.round(x)).assertEqual(Math.round(0));
      expect(Math.round(y)).assertEqual(Math.round(0));

      console.log('assert size')
      expect(Math.round(width)).assertEqual(Math.round(0));
      expect(Math.round(height)).assertEqual(Math.round(0));

      done();
    });


  })
}
