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
import { Visibility } from '@ohos.arkui.component'
import { MessageManager } from '../../../../../ets/MainAbility/common/MessageManager'
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

export default function flexVisibility_BaselineJsunit() {
  describe('flexItemAlignBaselineTest8', () => {

    beforeAll(() => {
      console.info("flexItemAlignBaselineTest8 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("flexItemAlignBaselineTest8 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Baseline/ItemAlign_Baseline_FlexVisibility',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get flexItemAlignBaselineTest8 state pages:" + JSON.stringify(pages));
        if (!("ItemAlign_Baseline_FlexVisibility" == pages.name)) {
          console.info("get flexItemAlignBaselineTest8 pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push flexItemAlignBaselineTest8 page error:" + err);
      }
      console.info("flexItemAlignBaselineTest8 beforeEach end");
    });


    afterEach(async () : Promise<void> => {
      const routerInstance = AppStorage.get<Router>("router") as Router
      routerInstance.pushUrl({url:"MainAbility/pages/index/index"});
      await CommonFunc.sleep(1000);
      console.info("ItemAlign_Baseline_FlexVisibility after each called");
    });

    
    
/**
     * @tc.number   testFlexItemAlignBaselineSubSetVisibilityNone_static
     * @tc.name     testFlexItemAlignBaselineSubSetVisibilityNone_static
     * @tc.desc     testFlexItemAlignBaselineSubSetVisibilityNone_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexItemAlignBaselineSubSetVisibilityNone_static', Level.LEVEL0, async () : Promise<void> => {
      console.info('new testFlexItemAlignBaselineSubSetVisibilityNone_static START');
      try {
        let result = AppStorage.get<MessageManager<Visibility>>("messageManager")
        if (result !== null) {
          result!.notify({
            name: 'visibility', value: Visibility.None
          });
        }
        await CommonFunc.sleep(2000);
        let strJson1 = inspector.getInspectorByKey('ItemAlign_Baseline_flexVisible');

        let strJson2 = inspector.getInspectorByKey('ItemAlign_Baseline_textVisible01');

        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual("Visibility.None");

        let textVisible01: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_textVisible01')
        let textVisible02: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_textVisible02')
        let textVisible03: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_textVisible03')
        let flexVisible: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_flexVisible')
        expect(Math.abs(textVisible03.top - flexVisible.top) <= 1).assertTrue()
        expect(Math.abs(textVisible01.left - flexVisible.left) <= 1).assertTrue()
        expect(Math.abs(textVisible01.right - textVisible02.left) <= 1).assertTrue()
        expect(Math.abs(textVisible02.right - textVisible03.left) <= 1).assertTrue()

        expect(Math.abs(textVisible02.bottom - textVisible02.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1).assertTrue()
        expect(Math.abs(textVisible03.bottom - textVisible03.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue()
        expect(Math.abs(textVisible02.right - textVisible02.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue()
        expect(Math.abs(textVisible03.right - textVisible03.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue()
        expect(Math.abs(flexVisible.right - textVisible03.right - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200))) <= 1).assertTrue()

        expect(Math.abs(textVisible02.top - textVisible03.top - textVisible03.bottom + textVisible02.bottom) <= 1)
          .assertTrue()
        expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Visible");
        expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row')
        expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.Baseline')
      } catch (err) {
        console.error('[testFlexItemAlignBaselineSubSetVisibilityNone_static] failed');
        expect().assertFail();
      }
      console.info('new testFlexItemAlignBaselineSubSetVisibilityNone_static END');

    });

    
    
/**
     * @tc.number   testFlexItemAlignBaselineSubSetVisibilityHidden_static
     * @tc.name     testFlexItemAlignBaselineSubSetVisibilityHidden_static
     * @tc.desc     testFlexItemAlignBaselineSubSetVisibilityHidden_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexItemAlignBaselineSubSetVisibilityHidden_static', Level.LEVEL0, async () : Promise<void> => {
      console.info('new testFlexItemAlignBaselineSubSetVisibilityHidden_static START');
      try {
        let result = AppStorage.get<MessageManager<Visibility>>("messageManager")
        if (result !== null) {
          result!.notify({
            name: 'visibility', value: Visibility.Hidden
          });
        }
        await CommonFunc.sleep(2000);
        let strJson1 = inspector.getInspectorByKey('ItemAlign_Baseline_flexVisible');

        let strJson2 = inspector.getInspectorByKey('ItemAlign_Baseline_textVisible01');

        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Hidden");
        let textVisible01: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_textVisible01');
        let textVisible02: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_textVisible02');
        let textVisible03: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_textVisible03');
        let flexVisible: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_flexVisible');
        expect(Math.abs(textVisible03.top - flexVisible.top) <= 1).assertTrue()
        expect(Math.abs(textVisible01.left - flexVisible.left) <= 1).assertTrue()
        expect(Math.abs(textVisible01.right - textVisible02.left) <= 1).assertTrue()
        expect(Math.abs(textVisible02.right - textVisible03.left) <= 1).assertTrue()

        expect(Math.abs(textVisible01.bottom - textVisible01.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))) <= 1).assertTrue()
        expect(Math.abs(textVisible01.right - textVisible01.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue()
        expect(Math.abs(textVisible02.bottom - textVisible02.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1).assertTrue()
        expect(Math.abs(textVisible02.right - textVisible02.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue()
        expect(Math.abs(textVisible03.bottom - textVisible03.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue()
        expect(Math.abs(textVisible03.right - textVisible03.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue()

        expect(Math.abs(textVisible01.top - textVisible03.top - textVisible03.bottom + textVisible01.bottom) <= 1)
          .assertTrue()
        expect(Math.abs(textVisible02.top - textVisible03.top - textVisible03.bottom + textVisible02.bottom) <= 1)
          .assertTrue()

        expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row')
        expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.Baseline')
        expect(Math.abs(flexVisible.right - textVisible03.right - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))) <= 1).assertTrue()
      } catch (err) {
        console.error('[testFlexItemAlignBaselineSubSetVisibilityHidden_static] failed');
        expect().assertFail();
      }
      console.info('new testFlexItemAlignBaselineSubSetVisibilityHidden_static END');

    });
  })
}
