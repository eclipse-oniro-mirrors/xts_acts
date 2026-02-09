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

export default function flexAlignSelf_BaselineJsunit() {
  describe('flexAlignSelfBaselineJsunit', () => {

    beforeAll(() => {
      console.info("flexItemAlignAutoTest8 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("flexItemAlignAutoTest8 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Baseline/ItemAlign_Baseline_FlexAlignSelf',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get flexItemAlignAutoTest8 state pages:" + JSON.stringify(pages));
        if (!("ItemAlign_Baseline_FlexAlignSelf" == pages.name)) {
          console.info("get flexItemAlignAutoTest8 pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push flexItemAlignAutoTest8 page error:" + err);
      }
      console.info("flexItemAlignAutoTest8 beforeEach end");
    });

    afterEach(async () : Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ItemAlign_Baseline_FlexAlignSelf after each called");
    });

    
    
/**
     * @tc.number   testFlexItemAlignBaselineSetAlignSelf_static
     * @tc.name     testFlexItemAlignBaselineSetAlignSelf_static
     * @tc.desc     testFlexItemAlignBaselineSetAlignSelf_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexItemAlignBaselineSetAlignSelf_static', Level.LEVEL0, async () : Promise<void> => {
      console.info('new testFlexItemAlignBaselineSetAlignSelf_static START');
      let strJson1 = inspector.getInspectorByKey('ItemAlign_Baseline_flexAlignSelf');

      let strJson2 = inspector.getInspectorByKey('ItemAlign_Baseline_textAlignSelf01');

      let alignSelf01: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_textAlignSelf01');
      let alignSelf02: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_textAlignSelf02');
      let alignSelf03: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_textAlignSelf03');
      let flexAlignSelf01: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_flexAlignSelf');
      expect(Math.abs(alignSelf01.bottom - flexAlignSelf01.bottom) <= 1).assertTrue()
      expect(Math.abs(alignSelf03.top - flexAlignSelf01.top) <= 1).assertTrue()
      expect(Math.abs(alignSelf02.top - alignSelf03.top - (alignSelf03.bottom - alignSelf02.bottom)) <= 1).assertTrue()
      expect(Math.abs(Math.round(alignSelf01.bottom - alignSelf01.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue()
      expect(Math.abs(Math.round(alignSelf02.bottom - alignSelf02.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue()
      expect(Math.abs(Math.round(alignSelf03.bottom - alignSelf03.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue()
      expect(Math.abs(Math.round(alignSelf01.right - alignSelf01.left) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue()
      expect(Math.abs(Math.round(alignSelf02.right - alignSelf02.left) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue()
      expect(Math.abs(Math.round(alignSelf03.right - alignSelf03.left) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue()

      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row')
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.Baseline')
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('alignSelf')).assertEqual("ItemAlign.End");
      console.info('new testFlexItemAlignBaselineSetAlignSelf_static_static END');

    });
  })
}
