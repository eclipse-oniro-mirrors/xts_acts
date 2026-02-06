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

export default function flexMargin_BaselineJsunit() {
  describe('flexItemAlignBaselineTest5', () => {

    beforeAll(() => {
      console.info("flexItemAlignBaselineTest5 beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("flexItemAlignBaselineTest5 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Baseline/ItemAlign_Baseline_FlexMargin',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get flexItemAlignBaselineTest5 state pages:" + JSON.stringify(pages));
        if (!("ItemAlign_Baseline_FlexMargin" == pages.name)) {
          console.info("get flexItemAlignBaselineTest5 pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push flexItemAlignBaselineTest5 page error:" + err);
      }
      console.info("flexItemAlignBaselineTest5 beforeEach end");
    });

    afterEach(async () : Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ItemAlign_Baseline_FlexMargin after each called");
    });

    
    
/**
     * @tc.number   testItemAlignBaselineParentSetMargin_static
     * @tc.name     testItemAlignBaselineParentSetMargin_static
     * @tc.desc     testItemAlignBaselineParentSetMargin_static
     * @tc.level    Level.LEVEL0
     */
it('testItemAlignBaselineParentSetMargin_static', Level.LEVEL0, async () : Promise<void> => {
      console.info('new testItemAlignBaselineParentSetMargin_static START');
      let strJson1 = inspector.getInspectorByKey ('ItemAlign_Baseline_flexMargin');

      let textFlexMargin01: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_textFlexMargin01');
      let textFlexMargin02: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_textFlexMargin02');
      let textFlexMargin03: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_textFlexMargin03');
      let flexMargin: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_flexMargin');
      expect(Math.abs(textFlexMargin01.left - flexMargin.left) <= 1).assertTrue()
      expect(Math.abs(textFlexMargin01.right - textFlexMargin02.left) <= 1).assertTrue()
      expect(Math.abs(textFlexMargin02.right - textFlexMargin03.left) <= 1).assertTrue()
      expect(Math.abs(Math.round(flexMargin.right - textFlexMargin03.right) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue()

      expect(Math.abs(textFlexMargin03.top - flexMargin.top) <= 1).assertTrue()
      expect(Math.abs(textFlexMargin01.top - textFlexMargin03.top - (textFlexMargin03.bottom - textFlexMargin01.bottom)) <= 1)
        .assertTrue()
      expect(Math.abs(textFlexMargin02.top - textFlexMargin03.top - (textFlexMargin03.bottom - textFlexMargin02.bottom)) <= 1)
        .assertTrue()

      expect(Math.abs(Math.round(textFlexMargin01.bottom - textFlexMargin01.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1)
        .assertTrue()
      expect(Math.abs(Math.round(textFlexMargin02.bottom - textFlexMargin02.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1)
        .assertTrue()
      expect(Math.abs(Math.round(textFlexMargin03.bottom - textFlexMargin03.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1)
        .assertTrue()
      expect(Math.abs(Math.round(textFlexMargin01.right - textFlexMargin01.left) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1)
        .assertTrue()
      expect(Math.abs(Math.round(textFlexMargin02.right - textFlexMargin02.left) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1)
        .assertTrue()
      expect(Math.abs(Math.round(textFlexMargin03.right - textFlexMargin03.left) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1)
        .assertTrue()
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row')
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.Baseline')
      console.info('new testItemAlignBaselineParentSetMargin_static END');

    });
  })
}
