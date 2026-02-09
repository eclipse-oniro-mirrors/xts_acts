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

export default function flexExceed_StretchJsunit() {
  describe('flexExceed_StretchJsunit', () => {
    beforeAll(() => {
      console.info("flexExceed_StretchJsunit beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("flexExceed_StretchJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Stretch/ItemAlign_Stretch_FlexExceed',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get flexExceed_StretchJsunit state pages:" + JSON.stringify(pages));
        if (!("ItemAlign_Stretch_FlexExceed" == pages.name)) {
          console.info("get flexExceed_StretchJsunit pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push flexExceed_StretchJsunit page error:" + err);
      }
      console.info("flexExceed_StretchJsunit beforeEach end");
    });

    afterEach(async () : Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ItemAlign_Stretch_FlexExceed after each called");
    });

    
    
/**
     * @tc.number   testFlexItemAlignStretchSetMarPad_static
     * @tc.name     testFlexItemAlignStretchSetMarPad_static
     * @tc.desc     testFlexItemAlignStretchSetMarPad_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexItemAlignStretchSetMarPad_static', Level.LEVEL0, async () : Promise<void> => {
      console.info('new testFlexItemAlignStretchSetMarPad START');
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
      let strJson1 = inspector.getInspectorByKey('ItemAlign_Stretch_flexExceed01');

      let textExceed01: RectValue = CommonFunc.getComponentRect('ItemAlign_Stretch_textExceed01');
      let textExceed02: RectValue = CommonFunc.getComponentRect('ItemAlign_Stretch_textExceed02');
      let textExceed03: RectValue = CommonFunc.getComponentRect('ItemAlign_Stretch_textExceed03');
      let flexExceed01: RectValue = CommonFunc.getComponentRect('ItemAlign_Stretch_flexExceed01');
      expect(Math.floor(Math.abs(textExceed01.top - textExceed02.top)) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textExceed02.top - textExceed03.top)) <= 1).assertTrue()
      expect(textExceed01.top).assertLarger(flexExceed01.top)

      expect(Math.floor(Math.abs(textExceed01.bottom - textExceed02.bottom)) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textExceed02.bottom - textExceed03.bottom)) <= 1).assertTrue()
      expect(textExceed01.bottom).assertLess(flexExceed01.bottom)
      expect(textExceed01.left).assertLarger(flexExceed01.left)
      expect(textExceed03.right).assertLess(flexExceed01.right)
      expect(Math.floor(Math.abs((textExceed01.bottom - textExceed01.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(180)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((textExceed02.bottom - textExceed02.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(180)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((textExceed03.bottom - textExceed03.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(180)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((textExceed01.right - textExceed01.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((textExceed02.right - textExceed02.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((textExceed03.right - textExceed03.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue()
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row')
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.Stretch')
      console.info('new testFlexItemAlignStretchSetMarPad END');

    });

    
    
/**
     * @tc.number   testFlexItemAlignStretchSetMarPadExceed_static
     * @tc.name     testFlexItemAlignStretchSetMarPadExceed_static
     * @tc.desc     testFlexItemAlignStretchSetMarPadExceed_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexItemAlignStretchSetMarPadExceed_static', Level.LEVEL0, async () : Promise<void> => {
      console.info('new testFlexItemAlignStretchSetMarPadExceed START');
      let result = AppStorage.get<MessageManager<number>>("messageManager")
      if (result !== null) {
        result!.notify({
          name: 'padding', value: 30
        });
        result!.notify({
          name: 'margin', value: 30
        });
      }
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('ItemAlign_Stretch_flexExceed01');

      let textExceed01: RectValue = CommonFunc.getComponentRect('ItemAlign_Stretch_textExceed01');
      let textExceed02: RectValue = CommonFunc.getComponentRect('ItemAlign_Stretch_textExceed02');
      let textExceed03: RectValue = CommonFunc.getComponentRect('ItemAlign_Stretch_textExceed03');
      let flexExceed01: RectValue = CommonFunc.getComponentRect('ItemAlign_Stretch_flexExceed01');
      expect(Math.floor(Math.abs(textExceed01.top - textExceed02.top)) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textExceed02.top - textExceed03.top)) <= 1).assertTrue()
      expect(textExceed01.top).assertLarger(flexExceed01.top)

      expect(Math.floor(Math.abs(textExceed01.bottom - textExceed02.bottom)) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textExceed02.bottom - textExceed03.bottom)) <= 1).assertTrue()
      expect(textExceed01.bottom).assertLess(flexExceed01.bottom)
      expect(textExceed01.left).assertLarger(flexExceed01.left)
      expect(textExceed03.right).assertLess(flexExceed01.right)
      expect(Math.floor(Math.abs((textExceed01.bottom - textExceed01.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(140)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((textExceed02.bottom - textExceed02.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(140)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((textExceed03.bottom - textExceed03.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(140)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((textExceed01.right - textExceed01.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440 / 3)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((textExceed02.right - textExceed02.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440 / 3)))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((textExceed03.right - textExceed03.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440 / 3)))) <= 1).assertTrue()
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row')
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.Stretch')
      console.info('new testFlexItemAlignStretchSetMarPadExceed END');

    });
  })
}
