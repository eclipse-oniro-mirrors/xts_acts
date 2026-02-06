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

export default function flexHeightModify_StretchJsunit() {
  describe('flexHeightModify_StretchJsunit', () => {

    beforeAll(() => {
      console.info("flexHeightModify_StretchJsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("flexHeightModify_StretchJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Stretch/ItemAlign_Stretch_FlexHeightModify',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get flexHeightModify_StretchJsunit state pages:" + JSON.stringify(pages));
        if (!("ItemAlign_Stretch_FlexHeightModify" == pages.name)) {
          console.info("get flexHeightModify_StretchJsunit pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push flexHeightModify_StretchJsunit page error:" + err);
      }
      console.info("flexHeightModify_StretchJsunit beforeEach end");
    });

    afterEach(async () : Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ItemAlign_Stretch_FlexHeightModify after each called");
    });

    
    
/**
     * @tc.number   testFlexItemAlignStretchDefaultSize_static
     * @tc.name     testFlexItemAlignStretchDefaultSize_static
     * @tc.desc     testFlexItemAlignStretchDefaultSize_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexItemAlignStretchDefaultSize_static', Level.LEVEL0, async () : Promise<void> => {
      console.info('new testFlexItemAlignStretchDefaultSize START');
      let result = AppStorage.get<MessageManager<number>>("messageManager")
      if (result !== null) {
        result!.notify({
          name: 'height', value: 80
        });
      }
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('ItemAlign_Stretch_flexHeightModify');

      let textHeightModify01: RectValue = CommonFunc.getComponentRect('ItemAlign_Stretch_textHeightModify01');
      let textHeightModify02: RectValue = CommonFunc.getComponentRect('ItemAlign_Stretch_textHeightModify02');
      let textHeightModify03: RectValue = CommonFunc.getComponentRect('ItemAlign_Stretch_textHeightModify03');
      let flexHeightModify: RectValue = CommonFunc.getComponentRect('ItemAlign_Stretch_flexHeightModify');
      expect(Math.abs(textHeightModify01.top - textHeightModify02.top) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.top - textHeightModify03.top) <= 1).assertTrue()
      expect(Math.abs(textHeightModify03.top - flexHeightModify.top) <= 1).assertTrue()

      expect(Math.abs(textHeightModify01.bottom - textHeightModify02.bottom) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.bottom - textHeightModify03.bottom) <= 1).assertTrue()

      expect(Math.abs(textHeightModify01.left - flexHeightModify.left) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.left - textHeightModify01.right) <= 1).assertTrue()
      expect(textHeightModify03.right).assertLess(flexHeightModify.right)

      expect(Math.abs((textHeightModify01.bottom - textHeightModify01.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200))) <= 1).assertTrue()
      expect(Math.abs((textHeightModify02.bottom - textHeightModify02.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200))) <= 1).assertTrue()
      expect(Math.abs((textHeightModify03.bottom - textHeightModify03.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200))) <= 1).assertTrue()
      expect(Math.abs((textHeightModify01.right - textHeightModify01.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue()
      expect(Math.abs((textHeightModify02.right - textHeightModify02.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue()
      expect(Math.abs((textHeightModify03.right - textHeightModify03.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue()
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row')
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.Stretch')
      console.info('new testFlexItemAlignStretchDefaultSize END');

    });

    
    
/**
     * @tc.number   testFlexItemAlignStretchHeightModify_static
     * @tc.name     testFlexItemAlignStretchHeightModify_static
     * @tc.desc     testFlexItemAlignStretchHeightModify_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexItemAlignStretchHeightModify_static', Level.LEVEL0, async () : Promise<void> => {
      console.info('new testFlexItemAlignStretchHeightModify START');
      let result = AppStorage.get<MessageManager<number>>("messageManager")
      if (result !== null) {
        result!.notify({
          name: 'height', value: 80
        });
      }
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('ItemAlign_Stretch_flexHeightModify');

      let textHeightModify01: RectValue = CommonFunc.getComponentRect('ItemAlign_Stretch_textHeightModify01');
      let textHeightModify02: RectValue = CommonFunc.getComponentRect('ItemAlign_Stretch_textHeightModify02');
      let textHeightModify03: RectValue = CommonFunc.getComponentRect('ItemAlign_Stretch_textHeightModify03');
      let flexHeightModify: RectValue = CommonFunc.getComponentRect('ItemAlign_Stretch_flexHeightModify');
      expect(Math.abs(textHeightModify01.top - textHeightModify02.top) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.top - textHeightModify03.top) <= 1).assertTrue()
      expect(Math.abs(textHeightModify03.top - flexHeightModify.top) <= 1).assertTrue()

      expect(Math.abs(textHeightModify01.bottom - textHeightModify02.bottom) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.bottom - textHeightModify03.bottom) <= 1).assertTrue()

      expect(Math.abs(textHeightModify01.left - flexHeightModify.left) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.left - textHeightModify01.right) <= 1).assertTrue()
      expect(textHeightModify03.right).assertLess(flexHeightModify.right)

      expect(Math.abs((textHeightModify01.bottom - textHeightModify01.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200))) <= 1).assertTrue()
      expect(Math.abs((textHeightModify02.bottom - textHeightModify02.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200))) <= 1).assertTrue()
      expect(Math.abs((textHeightModify03.bottom - textHeightModify03.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200))) <= 1).assertTrue()
      expect(Math.abs((textHeightModify01.right - textHeightModify01.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue()
      expect(Math.abs((textHeightModify02.right - textHeightModify02.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue()
      expect(Math.abs((textHeightModify03.right - textHeightModify03.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue()
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row')
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.Stretch')
      console.info('new testFlexItemAlignStretchHeightModify END');

    });
  })
}
