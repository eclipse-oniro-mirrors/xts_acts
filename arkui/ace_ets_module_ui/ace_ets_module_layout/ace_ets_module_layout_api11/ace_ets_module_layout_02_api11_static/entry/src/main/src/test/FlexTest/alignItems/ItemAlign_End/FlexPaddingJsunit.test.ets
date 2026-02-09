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

export default function flexPadding_EndJsunit() {
  describe('flexItemAlignEndTest', () => {
    beforeAll(() => {
      console.info("flexItemAlignEndTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("flexItemAlignEndTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_End/ItemAlign_End_FlexPadding',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get flexItemAlignEndTest state pages:" + JSON.stringify(pages));
        if (!("ItemAlign_End_FlexPadding" == pages.name)) {
          console.info("get flexItemAlignEndTest pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push flexItemAlignEndTest page error:" + err);
      }
      console.info("flexItemAlignEndTest beforeEach end");
    });

    afterEach(async () : Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ItemAlign_End_FlexPadding after each called");
    });

    
    
/**
     * @tc.number   testFlexItemAlignEndParentSetPadding_static
     * @tc.name     testFlexItemAlignEndParentSetPadding_static
     * @tc.desc     testFlexItemAlignEndParentSetPadding_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexItemAlignEndParentSetPadding_static', Level.LEVEL0, async () : Promise<void> => {
      console.info('new testFlexItemAlignEndParentSetPadding START');
      let result = AppStorage.get<MessageManager<number>>("messageManager")
      if (result !== null) {
        result!.notify({
          name: 'padding', value: 10
        });
      }
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('ItemAlign_End_flexPadding01');
      let strJson2 = inspector.getInspectorByKey('ItemAlign_End_textFlexPadding01');
      let textFlexPadding01: RectValue = CommonFunc.getComponentRect('ItemAlign_End_textFlexPadding01')
      let textFlexPadding02: RectValue = CommonFunc.getComponentRect('ItemAlign_End_textFlexPadding02')
      let textFlexPadding03: RectValue = CommonFunc.getComponentRect('ItemAlign_End_textFlexPadding03')
      let flexPadding01: RectValue = CommonFunc.getComponentRect('ItemAlign_End_flexPadding01')
      expect(Math.floor(Math.abs(textFlexPadding01.bottom - textFlexPadding02.bottom)) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textFlexPadding02.bottom - textFlexPadding03.bottom)) <= 1).assertTrue()
      expect(Math.floor(Math.abs(flexPadding01.bottom - textFlexPadding01.bottom - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textFlexPadding01.left - flexPadding01.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))) <= 1).assertTrue()
      expect(textFlexPadding03.right).assertLess(flexPadding01.right)

      expect(Math.floor(Math.abs(textFlexPadding01.bottom - textFlexPadding01.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textFlexPadding02.bottom - textFlexPadding02.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textFlexPadding03.bottom - textFlexPadding03.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue()

      expect(Math.floor(Math.abs(textFlexPadding01.right - textFlexPadding01.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textFlexPadding02.right - textFlexPadding02.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textFlexPadding03.right - textFlexPadding03.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue()
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row')
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.End')
      console.info('new testFlexItemAlignEndParentSetPadding END');

    });


  })
}
