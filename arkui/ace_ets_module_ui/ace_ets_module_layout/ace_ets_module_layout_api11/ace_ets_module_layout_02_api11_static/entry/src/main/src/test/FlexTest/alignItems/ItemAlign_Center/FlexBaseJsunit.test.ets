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

export default function flexBase_CenterJsunit() {
  describe('flexItemAlignCenterTest3', () => {

    beforeAll(() => {
      console.info("flexItemAlignCenterTest3 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("flexItemAlignCenterTest3 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Center/ItemAlign_Center_FlexBase',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get flexItemAlignCenterTest3 state pages:" + JSON.stringify(pages));
        if (!("ItemAlign_Center_FlexBase" == pages.name)) {
          console.info("get flexItemAlignCenterTest3 pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push flexItemAlignCenterTest3 page error:" + err);
      }
      console.info("flexItemAlignCenterTest3 beforeEach end");
    });

    afterEach(async () : Promise<void>=> {
      await CommonFunc.sleep(1000);
      console.info("ItemAlign_Center_FlexBase after each called");
    });

    
    
/**
     * @tc.number   testFlexItemAlignCenter_static
     * @tc.name     testFlexItemAlignCenter_static
     * @tc.desc     testFlexItemAlignCenter_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexItemAlignCenter_static', Level.LEVEL0, async () : Promise<void>=> {
      console.info('new testFlexItemAlignCenter START');
      let result = AppStorage.get<MessageManager<number>>("messageManager")
      if (result !== null) {
        result!.notify({
          name: 'height', value: 200
        });
        result!.notify({
          name: 'width', value: 500
        });
      }
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('ItemAlign_Center_flex01');

      let textFlex01: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_textFlex01');
      let textFlex02: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_textFlex02');
      let textFlex03: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_textFlex03');
      let flex01: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_flex01');
      expect(Math.abs(textFlex01.left - flex01.left) <= 1).assertTrue()
      expect(Math.abs(textFlex01.right - textFlex02.left) <= 1).assertTrue()
      expect(Math.abs(textFlex02.right - textFlex03.left) <= 1).assertTrue()
      expect(Math.abs(flex01.right - textFlex03.right - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))) <= 1).assertTrue()
      expect(Math.abs(textFlex01.top - flex01.top - flex01.bottom + textFlex01.bottom) <= 1).assertTrue()
      expect(Math.abs(textFlex02.top - flex01.top - flex01.bottom + textFlex02.bottom) <= 1).assertTrue()
      expect(Math.abs(textFlex03.top - flex01.top - flex01.bottom + textFlex03.bottom) <= 1).assertTrue()
      expect(Math.abs(textFlex01.bottom - textFlex01.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))) <= 1).assertTrue()
      expect(Math.abs(textFlex02.bottom - textFlex02.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1).assertTrue()
      expect(Math.abs(textFlex03.bottom - textFlex03.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue()
      expect(Math.abs(textFlex01.right - textFlex01.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue()
      expect(Math.abs(textFlex02.right - textFlex02.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue()
      expect(Math.abs(textFlex03.right - textFlex03.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue()
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row')
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.Center')
      console.info('new testFlexItemAlignCenter END');

    });

    
    
/**
     * @tc.number   testFlexItemAlignCenterExceed_static
     * @tc.name     testFlexItemAlignCenterExceed_static
     * @tc.desc     testFlexItemAlignCenterExceed_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexItemAlignCenterExceed_static', Level.LEVEL0, async () : Promise<void>=> {
      console.info('new testFlexItemAlignCenterExceed_static START');
      let result = AppStorage.get<MessageManager<number>>("messageManager")
      if (result !== null) {
        result!.notify({
          name: 'height', value: 140
        });
        result!.notify({
          name: 'width', value: 420
        });
      }

      await CommonFunc.sleep(3000);
      let strJson1 = inspector.getInspectorByKey('ItemAlign_Center_flex01');
      let textFlex01: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_textFlex01');
      let textFlex02: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_textFlex02');
      let textFlex03: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_textFlex03');
      let flex01: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_flex01');
      expect(Math.abs(textFlex01.left - flex01.left) <= 1).assertTrue()
      expect(Math.abs(textFlex01.right - textFlex02.left) <= 1).assertTrue()
      expect(Math.abs(textFlex02.right - textFlex03.left) <= 1).assertTrue()
      expect(textFlex03.top).assertLess(flex01.top)
      expect(textFlex03.bottom).assertLarger(flex01.bottom)
      expect(Math.abs(textFlex03.right - flex01.right) <= 1).assertTrue()
      expect(Math.abs(textFlex01.top - flex01.top - flex01.bottom + textFlex01.bottom) <= 1).assertTrue()
      expect(Math.abs(textFlex02.top - flex01.top - flex01.bottom + textFlex02.bottom) <= 1).assertTrue()
      expect(Math.abs(textFlex01.bottom - textFlex01.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))) <= 1).assertTrue()
      expect(Math.abs(textFlex02.bottom - textFlex02.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1).assertTrue()
      expect(Math.abs(textFlex03.bottom - textFlex03.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue()
      expect(Math.abs(textFlex01.right - textFlex01.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(140))) <= 1).assertTrue()
      expect(Math.abs(textFlex02.right - textFlex02.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(140))) <= 1).assertTrue()
      expect(Math.abs(textFlex03.right - textFlex03.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(140))) <= 1).assertTrue()

      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row')
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.Center')
      console.info('new testFlexItemAlignCenterExceed_static END');

    });
  })
}
