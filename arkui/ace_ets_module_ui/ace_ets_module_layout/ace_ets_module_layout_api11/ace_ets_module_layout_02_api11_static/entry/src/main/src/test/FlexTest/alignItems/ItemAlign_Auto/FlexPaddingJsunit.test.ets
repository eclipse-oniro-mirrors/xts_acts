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

import { describe, beforeEach, it, expect, Level, afterEach, beforeAll,Level } from '../../../../../../hypium/index'
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../../Util.test';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector';
import RectValue from '../../../../../ets/MainAbility/common/Rect';
import { FaceValue } from '../../../../../ets/MainAbility/common/Value';
import GlobalContext from '../../../../../ets/MainAbility/common/GlobalContext';
import { Router } from '@ohos.arkui.UIContext';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { MessageManager, Callback } from '../../../../../ets/MainAbility/common/MessageManager';
import { BusinessError } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function flexPadding_AutoJsunit() {

  describe('flexItemAlignAutoTest', () => {
    beforeAll(() => {
      console.info("flexItemAlignAutoTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("flexItemAlignAutoTest beforeEach start");
      let options: router.RouterOptions = {
        url:  'MainAbility/pages/Flex/alignItems/ItemAlign_Auto/ItemAlign_Auto_FlexPadding',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get flexItemAlignAutoTest state pages:" + JSON.stringify(pages));
        if (!("ItemAlign_Auto_FlexPadding" == pages.name)) {
          console.info("get flexItemAlignAutoTest pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push flexItemAlignAutoTest page error:" + err);
      }
      console.info("flexItemAlignAutoTest beforeEach end");
    });

    afterEach(async (): Promise<void>  => {
      await CommonFunc.sleep(1000);
      console.info("ItemAlign_Auto_FlexPadding after each called");
    });

    
    
/**
     * @tc.number   testFlexItemAlignAutoFlexPadMeet_static
     * @tc.name     testFlexItemAlignAutoFlexPadMeet_static
     * @tc.desc     testFlexItemAlignAutoFlexPadMeet_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexItemAlignAutoFlexPadMeet_static', Level.LEVEL0, async (): Promise<void>  => {
      console.info('new testFlexItemAlignAutoFlexPadMeet_static START');
      let result = AppStorage.get<MessageManager<number>>("messageManager")
      if (result !== null) {
        result!.notify({
          name: 'padding', value: 10
        });
      }
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('ItemAlign_Auto_flexPadding01');

      let textFlexPadding01: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textFlexPadding01');
      let textFlexPadding02: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textFlexPadding02');
      let textFlexPadding03: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textFlexPadding03');
      let flexPadding01: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_flexPadding01');

      expect(Math.abs(textFlexPadding01.left - flexPadding01.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(textFlexPadding01.right - textFlexPadding02.left) <= 1).assertTrue();
      expect(Math.abs(textFlexPadding02.right - textFlexPadding03.left) <= 1).assertTrue();

      expect(Math.abs(textFlexPadding01.top - textFlexPadding02.top) <= 1).assertTrue();
      expect(Math.abs(textFlexPadding02.top - textFlexPadding03.top) <= 1).assertTrue();
      expect(Math.abs(textFlexPadding01.top - flexPadding01.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))) <= 1).assertTrue();

      expect(Math.abs(textFlexPadding01.bottom - textFlexPadding01.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))) <= 1).assertTrue();
      expect(Math.abs(textFlexPadding02.bottom - textFlexPadding02.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(textFlexPadding03.bottom - textFlexPadding03.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();

      expect(Math.abs(textFlexPadding01.right - textFlexPadding01.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(textFlexPadding02.right - textFlexPadding02.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(textFlexPadding03.right - textFlexPadding03.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.Auto');
      console.info('new testFlexItemAlignAutoFlexPadMeet END');

    });

    
    
/**
     * @tc.number   testFlexItemAlignAutoFlexPadOverflow_static
     * @tc.name     testFlexItemAlignAutoFlexPadOverflow_static
     * @tc.desc     testFlexItemAlignAutoFlexPadOverflow_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexItemAlignAutoFlexPadOverflow_static', Level.LEVEL0, async () => {
      console.info('new testFlexItemAlignAutoFlexPadOverflow_static START');
      let result = AppStorage.get<MessageManager<number>>("messageManager")
      if (result !== null) {
        result!.notify({
          name: 'padding', value: 30
        });
      }
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('ItemAlign_Auto_flexPadding01');

      let textFlexPadding01: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textFlexPadding01');
      let textFlexPadding02: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textFlexPadding02');
      let textFlexPadding03: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textFlexPadding03');
      let flexPadding01: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_flexPadding01');
      expect(Math.abs(textFlexPadding01.left - flexPadding01.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30))) <= 1).assertTrue();
      expect(Math.abs(textFlexPadding01.right - textFlexPadding02.left) <= 1).assertTrue();
      expect(Math.abs(textFlexPadding02.right - textFlexPadding03.left) <= 1).assertTrue();

      expect(Math.abs(textFlexPadding01.top - textFlexPadding02.top) <= 1).assertTrue();
      expect(Math.abs(textFlexPadding02.top - textFlexPadding03.top) <= 1).assertTrue();
      expect(Math.abs(textFlexPadding01.top - flexPadding01.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30))) <= 1).assertTrue();

      expect(Math.abs(textFlexPadding01.bottom - textFlexPadding01.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))) <= 1).assertTrue();
      expect(Math.abs(textFlexPadding02.bottom - textFlexPadding02.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(textFlexPadding03.bottom - textFlexPadding03.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(textFlexPadding01.right - textFlexPadding01.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440 / 3))) <= 1).assertTrue();
      expect(Math.abs(textFlexPadding02.right - textFlexPadding02.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440 / 3))) <= 1).assertTrue();
      expect(Math.abs(textFlexPadding03.right - textFlexPadding03.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440 / 3))) <= 1).assertTrue();
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.Auto');
      console.info('new testFlexItemAlignAutoFlexPadOverflow_static END');
    });
  })
}
