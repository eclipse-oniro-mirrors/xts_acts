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

export default function flexTextMargin_EndJsunit() {
  describe('flexItemAlignEndTest4', () => {
    beforeAll(() => {
      console.info("flexItemAlignEndTest4 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("flexItemAlignEndTest4 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_End/ItemAlign_End_FlexTextMargin',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get flexItemAlignEndTest4 state pages:" + JSON.stringify(pages));
        if (!("ItemAlign_End_FlexTextMargin" == pages.name)) {
          console.info("get flexItemAlignEndTest4 pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push flexItemAlignEndTest4 page error:" + err);
      }
      console.info("flexItemAlignEndTest4 beforeEach end");
    });

    afterEach(async () : Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("flexItemAlignEndTest4 after each called");
    });

    
    
/**
     * @tc.number   testFlexItemAlignEndSubSetMargin_static
     * @tc.name     testFlexItemAlignEndSubSetMargin_static
     * @tc.desc     testFlexItemAlignEndSubSetMargin_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexItemAlignEndSubSetMargin_static', Level.LEVEL0, async () : Promise<void> => {
      console.info('new testFlexItemAlignEndSubSetMargin START');
      let result = AppStorage.get<MessageManager<number>>("messageManager")
      if (result !== null) {
        result!.notify({
          name: 'margin', value: 10
        });
      }
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('ItemAlign_End_flexTextMargin01');
      let textMargin01: RectValue = CommonFunc.getComponentRect('ItemAlign_End_textMargin01');
      let textMargin02: RectValue = CommonFunc.getComponentRect('ItemAlign_End_textMargin02');
      let textMargin03: RectValue = CommonFunc.getComponentRect('ItemAlign_End_textMargin03');
      let flexTextMargin01: RectValue = CommonFunc.getComponentRect('ItemAlign_End_flexTextMargin01');
      expect(Math.floor(Math.abs(textMargin01.left - flexTextMargin01.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textMargin02.left - textMargin01.right - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textMargin02.right - textMargin03.left)) <= 1).assertTrue()
      expect(Math.floor(Math.abs(flexTextMargin01.right - textMargin03.right - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30)))) <= 1).assertTrue()

      expect(Math.floor(Math.abs(flexTextMargin01.bottom - textMargin01.bottom - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textMargin02.bottom - textMargin03.bottom)) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textMargin03.bottom - flexTextMargin01.bottom)) <= 1).assertTrue()

      expect(Math.floor(Math.abs(textMargin01.bottom - textMargin01.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textMargin02.bottom - textMargin02.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textMargin03.bottom - textMargin03.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textMargin01.right - textMargin01.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textMargin02.right - textMargin02.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textMargin03.right - textMargin03.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue()
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row')
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.End')
      console.info('new testFlexItemAlignEndSubSetMargin END');

    });

    
    
/**
     * @tc.number   testFlexItemAlignEndSubSetMarginExceed_static
     * @tc.name     testFlexItemAlignEndSubSetMarginExceed_static
     * @tc.desc     testFlexItemAlignEndSubSetMarginExceed_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexItemAlignEndSubSetMarginExceed_static', Level.LEVEL0, async () : Promise<void> => {
      console.info('new testFlexItemAlignEndSubSetMarginExceed START');
      let result = AppStorage.get<MessageManager<number>>("messageManager")
      if (result !== null) {
        result!.notify({
          name: 'margin', value: 30
        });
      }
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('ItemAlign_End_flexTextMargin01');

      let textMargin01: RectValue = CommonFunc.getComponentRect('ItemAlign_End_textMargin01');
      let textMargin02: RectValue = CommonFunc.getComponentRect('ItemAlign_End_textMargin02');
      let textMargin03: RectValue = CommonFunc.getComponentRect('ItemAlign_End_textMargin03');
      let flexTextMargin01: RectValue = CommonFunc.getComponentRect('ItemAlign_End_flexTextMargin01');
      expect(Math.floor(Math.abs(textMargin01.left - flexTextMargin01.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textMargin02.left - textMargin01.right - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textMargin02.right - textMargin03.left)) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textMargin03.right - flexTextMargin01.right)) <= 1).assertTrue()
      expect(Math.floor(Math.abs(flexTextMargin01.bottom - textMargin01.bottom - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textMargin02.bottom - textMargin03.bottom)) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textMargin03.bottom - flexTextMargin01.bottom)) <= 1).assertTrue()

      expect(Math.floor(Math.abs(textMargin01.bottom - textMargin01.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textMargin02.bottom - textMargin02.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textMargin03.bottom - textMargin03.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textMargin01.right - textMargin01.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440 / 3)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textMargin02.right - textMargin02.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440 / 3)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textMargin03.right - textMargin03.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440 / 3)))) <= 1).assertTrue()
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row')
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.End')
      console.info('new testFlexItemAlignEndSubSetMarginExceed END');

    });
  })
}
