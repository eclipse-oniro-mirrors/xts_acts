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
export default function flexOffset_CenterJsunit() {
  describe('flexItemAlignCenterTest1', () => {

    beforeAll(() => {
      console.info("flexItemAlignCenterTest1 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("flexItemAlignCenterTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Center/ItemAlign_Center_FlexOffset',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get flexItemAlignCenterTest1 state pages:" + JSON.stringify(pages));
        if (!("ItemAlign_Center_FlexOffset" == pages.name)) {
          console.info("get flexItemAlignCenterTest1 pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push flexItemAlignCenterTest1 page error:" + err);
      }
      console.info("ItemAlign_Center_FlexOffset beforeEach end");
    });


    afterEach(async () : Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("flexItemAlignCenterTest1 after each called");
    });

    
    
/**
     * @tc.number   testFlexItemAlignCenterSetOffset_static
     * @tc.name     testFlexItemAlignCenterSetOffset_static
     * @tc.desc     testFlexItemAlignCenterSetOffset_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexItemAlignCenterSetOffset_static', Level.LEVEL0, async () : Promise<void> => {
      console.info('new testFlexItemAlignCenterSetOffset START');
      let strJson1 = inspector.getInspectorByKey('ItemAlign_Center_flexOffset');

      let textOffset01: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_textOffset01');
      let textOffset02: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_textOffset02');
      let textOffset03: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_textOffset03');
      let flexOffset: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_flexOffset');
      expect(Math.abs(((textOffset01.right - textOffset02.left) * 10) / 10 - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(15)) * 10) / 10) <= 1)
        .assertTrue()
      expect(Math.abs(((textOffset01.top - flexOffset.top) * 10) / 10 - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(105)) * 10) / 10) <= 1)
        .assertTrue()
      expect(Math.abs(((textOffset01.left - flexOffset.left) * 10) / 10 - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(15)) * 10) / 10) <= 1)
        .assertTrue()
      expect(Math.abs(((flexOffset.bottom - textOffset01.bottom) * 10) / 10 - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(45)) * 10) / 10) <= 1)
        .assertTrue()
      expect(Math.abs(textOffset02.top - flexOffset.top - (flexOffset.bottom - textOffset02.bottom)) <= 1).assertTrue()
      expect(Math.abs(textOffset03.top - flexOffset.top - (flexOffset.bottom - textOffset03.bottom)) <= 1).assertTrue()
      expect(Math.abs(textOffset01.bottom - textOffset01.top - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue()
      expect(Math.abs(textOffset02.bottom - textOffset02.top - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue()
      expect(Math.abs(textOffset03.bottom - textOffset03.top - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue()
      expect(Math.abs(textOffset01.right - textOffset01.left - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue()
      expect(Math.abs(textOffset02.right - textOffset02.left - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue()
      expect(Math.abs(textOffset03.right - textOffset03.left - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue()
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row')
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.Center')
      console.info('new testFlexItemAlignCenterSetOffset END');

    });
  })
}
