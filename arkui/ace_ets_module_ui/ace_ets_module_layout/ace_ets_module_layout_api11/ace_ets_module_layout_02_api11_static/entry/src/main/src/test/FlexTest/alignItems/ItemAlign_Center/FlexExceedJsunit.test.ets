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

export default function flexExceed_CenterJsunit() {
  describe('flexItemAlignCenterTest2', () => {

    beforeAll(() => {
      console.info("flexItemAlignCenterTest2 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("flexItemAlignCenterTest2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Center/ItemAlign_Center_FlexExceed',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get flexItemAlignCenterTest2 state pages:" + JSON.stringify(pages));
        if (!("ItemAlign_Center_FlexExceed" == pages.name)) {
          console.info("get flexItemAlignCenterTest2 pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push flexItemAlignCenterTest2 page error:" + err);
      }
      console.info("flexItemAlignCenterTest2 beforeEach end");
    });

    afterEach(async () : Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ItemAlign_Center_FlexExceed after each called");
    });

    
    
/**
     * @tc.number   testFlexItemAlignCenterSetMarPad_static
     * @tc.name     testFlexItemAlignCenterSetMarPad_static
     * @tc.desc     testFlexItemAlignCenterSetMarPad_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexItemAlignCenterSetMarPad_static', Level.LEVEL0, async () : Promise<void> => {
      console.info('new testFlexItemAlignCenterSetMarPad_static START');
      let result = AppStorage.get<MessageManager<number>>("messageManager")
      if (result !== null) {
        result!.notify({
          name: 'padding', value: 10
        });
        result!.notify({
          name: 'margin', value: 10
        });
      }
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('ItemAlign_Center_flexExceed01');

      let textExceed01: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_textExceed01');
      let textExceed02: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_textExceed02');
      let textExceed03: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_textExceed03');
      let flexExceed01: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_flexExceed01');
      expect(Math.abs(textExceed01.left - flexExceed01.left - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))) <= 1).assertTrue()
      expect(textExceed03.right).assertLess(flexExceed01.right)
      expect(Math.abs(textExceed01.top - flexExceed01.top - (flexExceed01.bottom - textExceed01.bottom)) <= 1)
        .assertTrue()
      expect(Math.abs(textExceed02.top - flexExceed01.top - (flexExceed01.bottom - textExceed02.bottom)) <= 1)
        .assertTrue()
      expect(Math.abs(textExceed03.top - flexExceed01.top - (flexExceed01.bottom - textExceed03.bottom)) <= 1)
        .assertTrue()
      expect(Math.abs(textExceed01.bottom - textExceed01.top - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue()
      expect(Math.abs(textExceed02.bottom - textExceed02.top - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue()
      expect(Math.abs(textExceed03.bottom - textExceed03.top - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue()
      expect(Math.abs(textExceed01.right - textExceed01.left - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue()
      expect(Math.abs(textExceed02.right - textExceed02.left - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue()
      expect(Math.abs(textExceed03.right - textExceed03.left - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue()
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row')
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.Center')
      console.info('new testFlexItemAlignCenterSetMarPad_static END');
    });
  })
}
