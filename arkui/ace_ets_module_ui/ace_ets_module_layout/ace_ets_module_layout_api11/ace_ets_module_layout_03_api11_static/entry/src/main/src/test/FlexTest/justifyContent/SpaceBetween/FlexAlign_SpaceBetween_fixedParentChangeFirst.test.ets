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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../../Util.test';
import RectValue from '../../../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import { UIContext } from "@ohos.arkui.UIContext";
import inspector from '@ohos.arkui.inspector';
import { GlobalContext } from '../../../../../ets/MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function flexAlign_SpaceBetween_fixedParentChangeFirst() {
  describe('FlexAlign_SpaceBetween_fixedParentChangeFirst', () => {
    beforeAll(() => {
      console.info("FlexAlign_SpaceBetween_fixedParentChangeFirst beforeEach start");
     await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("FlexAlign_SpaceBetween_fixedParentChangeFirst beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/SpaceBetween/FlexAlign_SpaceBetween_fixedParentChangeFirst',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FlexAlign_SpaceBetween_fixedParentChangeFirst state pages:" + JSON.stringify(pages));
        if (!("FlexAlign_SpaceBetween_fixedParentChangeFirst" == pages.name)) {
          console.info("get FlexAlign_SpaceBetween_fixedParentChangeFirst pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push FlexAlign_SpaceBetween_fixedParentChangeFirst page error:" + err);
      }
      console.info("FlexAlign_SpaceBetween_fixedParentChangeFirst beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("FlexAlign_SpaceBetween_fixedParentChangeFirst afterEach called");
    });

    
    
    /**
     * @tc.number   testAlignSpaceBetweenRowNoWrapChangeFirstLayoutWeight_static_122
     * @tc.name     testAlignSpaceBetweenRowNoWrapChangeFirstLayoutWeight_static_122
     * @tc.desc     testAlignSpaceBetweenRowNoWrapChangeFirstLayoutWeight_static_122
     * @tc.level    Level.LEVEL0
     */
it('testAlignSpaceBetweenRowNoWrapChangeFirstLayoutWeight_static_122', Level.LEVEL0, async () => {
      console.info('new testAlignSpaceBetweenRowNoWrapChangeFirstLayoutWeight122 START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'testFirstlayoutWeight', value: 1
      })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'testSecondlayoutWeight', value: 2
      })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'testThirdlayoutWeight', value: 2
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('FlexAlignSpaceBetween12');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.NoWrap');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.SpaceBetween');
      let locationText1: RectValue = CommonFunc.getComponentRect('AlignSpaceBetween34');
      let locationText2: RectValue = CommonFunc.getComponentRect('AlignSpaceBetween35');
      let locationText3: RectValue = CommonFunc.getComponentRect('AlignSpaceBetween36');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexAlignSpaceBetween12');
      expect(Math.abs((locationText1.top) - (locationText2.top)) <= 1).assertTrue();
      expect(Math.abs((locationText2.top) - (locationText3.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.top - locationFlex.top)) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(0)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.bottom - locationText1.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.bottom - locationText2.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText3.bottom - locationText3.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationFlex.bottom - locationText3.bottom)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText1.left - locationFlex.left)) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(0)))) <= 1).assertTrue();
      expect(Math.abs((locationText1.right) - (locationText2.left)) <= 1).assertTrue();
      expect(Math.abs((locationText2.right) - (locationText3.left)) <= 1).assertTrue();
      expect(Math.abs((locationText3.right) - (locationFlex.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.right - locationText1.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.right - locationText2.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText3.right - locationText3.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200))))) <= 1)
        .assertTrue();
      console.info('new testAlignSpaceBetweenRowNoWrapChangeFirstLayoutWeight122 END');

    });

    
    
    /**
     * @tc.number   testAlignSpaceBetweenRowNoWrapChangeFirstLayoutWeight_static_120
     * @tc.name     testAlignSpaceBetweenRowNoWrapChangeFirstLayoutWeight_static_120
     * @tc.desc     testAlignSpaceBetweenRowNoWrapChangeFirstLayoutWeight_static_120
     * @tc.level    Level.LEVEL0
     */
it('testAlignSpaceBetweenRowNoWrapChangeFirstLayoutWeight_static_120', Level.LEVEL0, async () => {
      console.info('new testAlignSpaceBetweenRowNoWrapChangeFirstLayoutWeight120 START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'testFirstlayoutWeight', value: 1
      })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'testSecondlayoutWeight', value: 2
      })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'testThirdlayoutWeight', value: 0
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('FlexAlignSpaceBetween12');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.NoWrap');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.SpaceBetween');
      let locationText1: RectValue = CommonFunc.getComponentRect('AlignSpaceBetween34');
      let locationText2: RectValue = CommonFunc.getComponentRect('AlignSpaceBetween35');
      let locationText3: RectValue = CommonFunc.getComponentRect('AlignSpaceBetween36');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexAlignSpaceBetween12');
      expect(Math.abs((locationText1.top) - (locationText2.top)) <= 1).assertTrue();
      expect(Math.abs((locationText2.top) - (locationText3.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.top - locationFlex.top)) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(0)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.bottom - locationText1.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.bottom - locationText2.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText3.bottom - locationText3.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationFlex.bottom - locationText3.bottom)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText1.left - locationFlex.left)) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(0)))) <= 1).assertTrue();
      expect(Math.abs((locationText1.right) - (locationText2.left)) <= 1).assertTrue();
      expect(Math.abs((locationText2.right) - (locationText3.left)) <= 1).assertTrue();
      expect(Math.abs((locationText3.right) - (locationFlex.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round((locationText1.right - locationText1.left) * 10) / 10) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(350 / 3)) * 10) / 10)) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round((locationText2.right - locationText2.left) * 10) / 10) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(700 / 3)) * 10) / 10)) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText3.right - locationText3.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      console.info('new testAlignSpaceBetweenRowNoWrapChangeFirstLayoutWeight120 END');

    });
  })
}