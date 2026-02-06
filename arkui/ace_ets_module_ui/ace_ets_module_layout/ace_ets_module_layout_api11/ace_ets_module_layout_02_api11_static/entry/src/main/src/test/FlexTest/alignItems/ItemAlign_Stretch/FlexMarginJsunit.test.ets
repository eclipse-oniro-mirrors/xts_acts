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

export default function flexMargin_StretchJsunit() {
  describe('flexMargin_StretchJsunit', () => {

    beforeAll(() => {
      console.info("flexMargin_StretchJsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("flexMargin_StretchJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Stretch/ItemAlign_Stretch_FlexMargin',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get flexMargin_StretchJsunit state pages:" + JSON.stringify(pages));
        if (!("ItemAlign_Stretch_FlexMargin" == pages.name)) {
          console.info("get flexMargin_StretchJsunit pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push flexMargin_StretchJsunit page error:" + err);
      }
      console.info("flexMargin_StretchJsunit beforeEach end");
    });

    afterEach(async () : Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ItemAlign_Stretch_FlexMargin after each called");
    });

    
    
/**
     * @tc.number   testItemAlignStretchParentSetMargin_static
     * @tc.name     testItemAlignStretchParentSetMargin_static
     * @tc.desc     testItemAlignStretchParentSetMargin_static
     * @tc.level    Level.LEVEL0
     */
it('testItemAlignStretchParentSetMargin_static', Level.LEVEL0, async () : Promise<void> => {
      console.info('new testItemAlignStretchParentSetMargin START');
      let strJson1 = inspector.getInspectorByKey('ItemAlign_Stretch_flexMargin');

      let textFlexMargin01: RectValue = CommonFunc.getComponentRect('ItemAlign_Stretch_textFlexMargin01');
      let textFlexMargin02: RectValue = CommonFunc.getComponentRect('ItemAlign_Stretch_textFlexMargin02');
      let textFlexMargin03: RectValue = CommonFunc.getComponentRect('ItemAlign_Stretch_textFlexMargin03');
      let flexMargin: RectValue = CommonFunc.getComponentRect('ItemAlign_Stretch_flexMargin');
      expect(Math.abs(textFlexMargin01.top - textFlexMargin02.top) <= 1).assertTrue()
      expect(Math.abs(textFlexMargin02.top - textFlexMargin03.top) <= 1).assertTrue()
      expect(Math.abs(textFlexMargin03.top - flexMargin.top) <= 1).assertTrue()

      expect(Math.abs(textFlexMargin01.bottom - textFlexMargin02.bottom) <= 1).assertTrue()
      expect(Math.abs(textFlexMargin02.bottom - textFlexMargin03.bottom) <= 1).assertTrue()
      expect(Math.abs(textFlexMargin03.bottom - flexMargin.bottom) <= 1).assertTrue()
      expect(Math.abs(textFlexMargin01.left - flexMargin.left) <= 1).assertTrue()
      expect(Math.abs(textFlexMargin02.left - textFlexMargin01.right) <= 1).assertTrue()
      expect(Math.abs(textFlexMargin03.left - textFlexMargin02.right) <= 1).assertTrue()
      expect(Math.abs((flexMargin.right - textFlexMargin03.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))) <= 1).assertTrue()

      expect(Math.abs((textFlexMargin01.bottom - textFlexMargin01.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200))) <= 1).assertTrue()
      expect(Math.abs((textFlexMargin02.bottom - textFlexMargin02.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200))) <= 1).assertTrue()
      expect(Math.abs((textFlexMargin03.bottom - textFlexMargin03.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200))) <= 1).assertTrue()
      expect(Math.abs((textFlexMargin01.right - textFlexMargin01.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue()
      expect(Math.abs((textFlexMargin02.right - textFlexMargin02.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue()
      expect(Math.abs((textFlexMargin03.right - textFlexMargin03.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue()
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row')
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.Stretch')
      console.info('new testItemAlignStretchParentSetMargin END');

    });
  })
}
