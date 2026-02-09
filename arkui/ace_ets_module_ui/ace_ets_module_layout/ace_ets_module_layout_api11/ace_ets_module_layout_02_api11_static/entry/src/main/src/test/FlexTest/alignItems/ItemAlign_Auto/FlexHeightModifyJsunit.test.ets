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

export default function flexHeightModify_AutoJsunit() {
  describe('flexItemAlignAutoTest6', () => {

    beforeAll(() => {
      console.info("flexItemAlignAutoTest6 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("flexItemAlignAutoTest6 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Auto/ItemAlign_Auto_FlexHeightModify',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get flexItemAlignAutoTest6 state pages:" + JSON.stringify(pages));
        if (!("ItemAlign_Auto_FlexHeightModify" == pages.name)) {
          console.info("get flexItemAlignAutoTest6 pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push flexItemAlignAutoTest6 page error:" + err);
      }
      console.info("flexItemAlignAutoTest6 beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ItemAlign_Auto_FlexHeightModify after each called");
    });

    
    
/**
     * @tc.number   testFlexItemAlignAutoTextHeiCheck_static
     * @tc.name     testFlexItemAlignAutoTextHeiCheck_static
     * @tc.desc     testFlexItemAlignAutoTextHeiCheck_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexItemAlignAutoTextHeiCheck_static', Level.LEVEL0, async (): Promise<void> => {
      console.info('new testFlexItemAlignAutoTextHeiCheck_static START');
      let strJson1 = inspector.getInspectorByKey('ItemAlign_Auto_flexHeightModify');
      let textHeightModify01: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textHeightModify01');
      let textHeightModify02: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textHeightModify02');
      let textHeightModify03: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textHeightModify03');
      let flexHeightModify: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_flexHeightModify');

      expect(Math.abs(textHeightModify01.top - textHeightModify02.top) <= 1).assertTrue();
      expect(Math.abs(textHeightModify02.top - textHeightModify03.top) <= 1).assertTrue();
      expect(Math.abs(textHeightModify01.top - flexHeightModify.top) <= 1).assertTrue();

      expect(Math.abs(textHeightModify01.left - flexHeightModify.left) <= 1).assertTrue();
      expect(Math.abs(textHeightModify02.left - textHeightModify01.right) <= 1).assertTrue();
      expect(Math.abs(textHeightModify01.bottom - textHeightModify01.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))) <= 1).assertTrue();
      expect(Math.abs(textHeightModify02.bottom - textHeightModify02.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(textHeightModify03.bottom - textHeightModify03.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(textHeightModify01.right - textHeightModify01.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(textHeightModify02.right - textHeightModify02.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(textHeightModify03.right - textHeightModify03.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.Auto');
      console.info('new testFlexItemAlignAutoTextHeiCheck_static END');

    });

    
    
/**
     * @tc.number   testFlexItemAlignAutoTextHei_static
     * @tc.name     testFlexItemAlignAutoTextHei_static
     * @tc.desc     testFlexItemAlignAutoTextHei_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexItemAlignAutoTextHei_static', Level.LEVEL0, async (): Promise<void> => {
      console.info('new testFlexItemAlignAutoTextHei_static START');
      let result = AppStorage.get<MessageManager<number>>("messageManager")
      if (result !== null) {
        result!.notify({
          name: 'height', value: 80
        });
      }
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('ItemAlign_Auto_flexHeightModify');

      let textHeightModify01: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textHeightModify01');
      let textHeightModify02: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textHeightModify02');
      let textHeightModify03: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textHeightModify03');
      let flexHeightModify: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_flexHeightModify');
      expect(Math.abs(textHeightModify01.top - textHeightModify02.top) <= 1).assertTrue();
      expect(Math.abs(textHeightModify02.top - textHeightModify03.top) <= 1).assertTrue();
      expect(Math.abs(textHeightModify01.top - flexHeightModify.top) <= 1).assertTrue();

      expect(Math.abs(textHeightModify01.left - flexHeightModify.left) <= 1).assertTrue();
      expect(Math.abs(textHeightModify02.left - textHeightModify01.right) <= 1).assertTrue();

      expect(Math.abs(textHeightModify01.bottom - textHeightModify01.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(80))) <= 1).assertTrue();
      expect(Math.abs(textHeightModify02.bottom - textHeightModify02.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(textHeightModify03.bottom - textHeightModify03.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(textHeightModify01.right - textHeightModify01.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(textHeightModify02.right - textHeightModify02.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(textHeightModify03.right - textHeightModify03.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.Auto');
      console.info('new testFlexItemAlignAutoTextHei_static END');

    });
  })
}
