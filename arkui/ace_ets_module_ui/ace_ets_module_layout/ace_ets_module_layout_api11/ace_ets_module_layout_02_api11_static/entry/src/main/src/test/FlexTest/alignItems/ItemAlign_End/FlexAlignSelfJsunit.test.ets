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

export default function flexAlignSelf_EndJsunit() {
  describe('flexItemAlignEndTest7', () => {
    beforeAll(() => {
      console.info("flexItemAlignEndTest7 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("flexItemAlignEndTest7 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_End/ItemAlign_End_FlexAlignSelf',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get flexItemAlignEndTest7 state pages:" + JSON.stringify(pages));
        if (!("ItemAlign_End_FlexAlignSelf" == pages.name)) {
          console.info("get flexItemAlignEndTest7 pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push flexItemAlignEndTest7 page error:" + err);
      }
      console.info("flexItemAlignEndTest7 beforeEach end");
    });

    afterEach(async () : Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ItemAlign_End_FlexAlignSelf after each called");
    });

    
    
/**
     * @tc.number   testFlexItemAlignEndSetAlignSelf_static
     * @tc.name     testFlexItemAlignEndSetAlignSelf_static
     * @tc.desc     testFlexItemAlignEndSetAlignSelf_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexItemAlignEndSetAlignSelf_static', Level.LEVEL0, async () : Promise<void> => {
      console.info('new testFlexItemAlignEndSetAlignSelf START');
      let strJson1 = inspector.getInspectorByKey('ItemAlign_End_flexAlignSelf');

      let strJson2 = inspector.getInspectorByKey('ItemAlign_End_textAlignSelf01');

      let textAlignSelf01: RectValue = CommonFunc.getComponentRect('ItemAlign_End_textAlignSelf01');
      let textAlignSelf02: RectValue = CommonFunc.getComponentRect('ItemAlign_End_textAlignSelf02');
      let textAlignSelf03: RectValue = CommonFunc.getComponentRect('ItemAlign_End_textAlignSelf03');
      let flexAlignSelf01: RectValue = CommonFunc.getComponentRect('ItemAlign_End_flexAlignSelf');
      expect(Math.abs(textAlignSelf01.left - flexAlignSelf01.left) <= 1).assertTrue()
      expect(Math.abs(textAlignSelf01.right - textAlignSelf02.left) <= 1).assertTrue()
      expect(Math.abs(textAlignSelf02.right - textAlignSelf03.left) <= 1).assertTrue()
      expect(Math.abs(textAlignSelf01.bottom - textAlignSelf02.bottom) <= 1).assertTrue()
      expect(Math.abs(textAlignSelf02.bottom - textAlignSelf03.bottom) <= 1).assertTrue()
      expect(Math.abs(textAlignSelf01.bottom - flexAlignSelf01.bottom) <= 1).assertTrue()

      expect(Math.abs((textAlignSelf01.bottom - textAlignSelf01.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))) <= 1).assertTrue()
      expect(Math.abs((textAlignSelf01.right - textAlignSelf01.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue()
      expect(Math.abs((textAlignSelf02.bottom - textAlignSelf02.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1).assertTrue()
      expect(Math.abs((textAlignSelf02.right - textAlignSelf02.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue()
      expect(Math.abs((textAlignSelf03.bottom - textAlignSelf03.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue()
      expect(Math.abs((textAlignSelf03.right - textAlignSelf03.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue()

      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row')
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.End')
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('alignSelf')).assertEqual("ItemAlign.End");
      console.info('new testFlexItemAlignEndSetAlignSelf END');

    });
  })
}
