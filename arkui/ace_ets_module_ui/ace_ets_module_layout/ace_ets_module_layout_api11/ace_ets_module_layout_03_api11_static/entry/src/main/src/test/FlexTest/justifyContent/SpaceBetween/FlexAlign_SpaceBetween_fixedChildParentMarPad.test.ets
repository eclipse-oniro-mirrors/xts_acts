'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
export default function flexAlign_SpaceBetween_fixedChildParentMarPad() {
  describe('FlexAlign_SpaceBetween_fixedChildParentMarPad', () => {
    beforeAll(async (): Promise<void> => {
      console.info("FlexAlign_SpaceBetween_fixedChildParentMarPad beforeEach start");
     await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("FlexAlign_SpaceBetween_fixedChildParentMarPad beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/SpaceBetween/FlexAlign_SpaceBetween_fixedChildParentMarPad',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FlexAlign_SpaceBetween_fixedChildParentMarPad state pages:" + JSON.stringify(pages));
        if (!("FlexAlign_SpaceBetween_fixedChildParentMarPad" == pages.name)) {
          console.info("get FlexAlign_SpaceBetween_fixedChildParentMarPad pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push FlexAlign_SpaceBetween_fixedChildParentMarPad page error:" + err);
      }
      console.info("FlexAlign_SpaceBetween_fixedChildParentMarPad beforeEach end");
    });


    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("FlexAlign_SpaceBetween_fixedChildParentMarPad afterEach called");
    });

    
    
    /**
     * @tc.number   testAlignSpaceBetweenRowNoWrapMarPadOutRange_static
     * @tc.name     testAlignSpaceBetweenRowNoWrapMarPadOutRange_static
     * @tc.desc     testAlignSpaceBetweenRowNoWrapMarPadOutRange_static
     * @tc.level    Level.LEVEL0
     */
it('testAlignSpaceBetweenRowNoWrapMarPadOutRange_static', Level.LEVEL0, async () => {
      console.info('new testAlignSpaceBetweenRowNoWrapMarPadOutRange START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'margin', value: 20
      })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 50
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('FlexAlignSpaceBetween6');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.NoWrap');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.SpaceBetween');
      let locationText1: RectValue = CommonFunc.getComponentRect('AlignSpaceBetween16');
      let locationText2: RectValue = CommonFunc.getComponentRect('AlignSpaceBetween17');
      let locationText3: RectValue = CommonFunc.getComponentRect('AlignSpaceBetween18');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexAlignSpaceBetween6');

      console.info('testAlignSpaceBetweenRowNoWrapMarPadOutRange_static_chazhi1:' + Math.floor(Math.abs(locationText1.top - locationText2.top)));
      console.info('testAlignSpaceBetweenRowNoWrapMarPadOutRange_static_chazhi2:' + Math.floor(Math.abs(locationText2.top - locationText3.top)));
      console.info('testAlignSpaceBetweenRowNoWrapMarPadOutRange_static_chazhi3:' + Math.floor(Math.abs((locationText1.top - locationFlex.top) -
       Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))));
      console.info('testAlignSpaceBetweenRowNoWrapMarPadOutRange_static_chazhi4:' + Math.floor(Math.abs((locationText1.bottom - locationText1.top) - 
      Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))));
      console.info('testAlignSpaceBetweenRowNoWrapMarPadOutRange_static_chazhi5:' + Math.floor(Math.abs((locationText2.bottom - locationText2.top) - 
      Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))));
      console.info('testAlignSpaceBetweenRowNoWrapMarPadOutRange_static_chazhi6:' + Math.floor(Math.abs((locationText3.bottom - locationText3.top) -
       Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))));
      console.info('testAlignSpaceBetweenRowNoWrapMarPadOutRange_static_chazhi7:' + Math.floor(Math.abs(locationFlex.bottom - locationText3.bottom)));
      console.info('testAlignSpaceBetweenRowNoWrapMarPadOutRange_static_chazhi8:' + Math.floor(Math.abs((locationText1.left - locationFlex.left) - 
      Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))));
      console.info('testAlignSpaceBetweenRowNoWrapMarPadOutRange_static_chazhi9:' + Math.floor(Math.abs(locationText1.right - locationText2.left)));
      console.info('testAlignSpaceBetweenRowNoWrapMarPadOutRange_static_chazhi10:' + Math.floor(Math.abs(locationText2.right - locationText3.left)));
      console.info('testAlignSpaceBetweenRowNoWrapMarPadOutRange_static_chazhi11:' + Math.floor(Math.abs(locationText3.right - 
      (locationFlex.right - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))));
      console.info('testAlignSpaceBetweenRowNoWrapMarPadOutRange_static_chazhi12:' + Math.floor(Math.abs((locationText1.right - locationText1.left) -
       (locationText2.right - locationText2.left))));
      console.info('testAlignSpaceBetweenRowNoWrapMarPadOutRange_static_chazhi13:' + Math.floor(Math.abs((locationText3.right - locationText3.left) - 
      (locationText2.right - locationText2.left))));
      console.info('testAlignSpaceBetweenRowNoWrapMarPadOutRange_static_chazhi14:' + Math.floor(Math.abs((locationText2.right - locationText2.left) -
       Number(AppStorage.get<UIContext>('uiContext')?.vp2px(400 / 3)))));

      expect(Math.floor(Math.abs(locationText1.top - locationText2.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText2.top - locationText3.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText1.top - locationFlex.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText1.bottom - locationText1.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText2.bottom - locationText2.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText3.bottom - locationText3.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationFlex.bottom - locationText3.bottom)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText1.left - locationFlex.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText1.right - locationText2.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText2.right - locationText3.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText3.right - (locationFlex.right - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - (locationText2.right - locationText2.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.right - locationText3.left) - (locationText2.right - locationText2.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.right - locationText2.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(400 / 3)))) <= 2).assertTrue();

      console.info('new testAlignSpaceBetweenRowNoWrapMarPadOutRange END');

    });

    
    
    /**
     * @tc.number   testAlignSpaceBetweenRowNoWrapMarPadInRange_static
     * @tc.name     testAlignSpaceBetweenRowNoWrapMarPadInRange_static
     * @tc.desc     testAlignSpaceBetweenRowNoWrapMarPadInRange_static
     * @tc.level    Level.LEVEL0
     */
it('testAlignSpaceBetweenRowNoWrapMarPadInRange_static', Level.LEVEL0, async () => {
      console.info('new testAlignSpaceBetweenRowNoWrapMarPadInRange START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'margin', value: 20
      })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 5
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('FlexAlignSpaceBetween6');
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.NoWrap');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.SpaceBetween');
      let locationText1: RectValue = CommonFunc.getComponentRect('AlignSpaceBetween16');
      let locationText2: RectValue = CommonFunc.getComponentRect('AlignSpaceBetween17');
      let locationText3: RectValue = CommonFunc.getComponentRect('AlignSpaceBetween18');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexAlignSpaceBetween6');

      console.info('testAlignSpaceBetweenRowNoWrapMarPadInRange_static1:' + Math.floor(Math.abs(locationText1.top - locationText2.top)));
      console.info('testAlignSpaceBetweenRowNoWrapMarPadInRange_static2:' + Math.floor(Math.abs(locationText2.top - locationText3.top)));
      console.info('testAlignSpaceBetweenRowNoWrapMarPadInRange_static3:' + Math.floor(Math.abs((Math.round((locationText1.top - locationFlex.top) * 10) / 10) -
       (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(5)) * 10) / 10))));
      console.info('testAlignSpaceBetweenRowNoWrapMarPadInRange_static4:' + Math.floor(Math.abs((locationText1.bottom - locationText1.top) -
       Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))));
      console.info('testAlignSpaceBetweenRowNoWrapMarPadInRange_static5:' + Math.floor(Math.abs((locationText2.bottom - locationText2.top) - 
      Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))));
      console.info('testAlignSpaceBetweenRowNoWrapMarPadInRange_static6:' + Math.floor(Math.abs((locationText3.bottom - locationText3.top) -
       Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))));
      console.info('testAlignSpaceBetweenRowNoWrapMarPadInRange_static7:' + Math.floor(Math.abs(((locationFlex.bottom - locationText3.bottom) * 10) / 10 -
       (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(45)) * 10) / 10)));
      console.info('testAlignSpaceBetweenRowNoWrapMarPadInRange_static8:' + Math.floor(Math.abs(((locationText1.left - locationFlex.left) * 10) / 10 - 
      (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(5)) * 10) / 10)));
      console.info('testAlignSpaceBetweenRowNoWrapMarPadInRange_static9:' + Math.floor(Math.abs(((locationText3.right) * 10) / 10 - 
      ((locationFlex.right - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(5))) * 10) / 10)));
      console.info('testAlignSpaceBetweenRowNoWrapMarPadInRange_static10:' + Math.floor(Math.abs((locationText1.right - locationText1.left) - 
      (locationText2.right - locationText2.left))));
      console.info('testAlignSpaceBetweenRowNoWrapMarPadInRange_static11:' + Math.floor(Math.abs((locationText3.right - locationText3.left) - 
      (locationText2.right - locationText2.left))));
      console.info('testAlignSpaceBetweenRowNoWrapMarPadInRange_static12:' + Math.floor(Math.abs((locationText2.right - locationText2.left) - 
      Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))));
      console.info('testAlignSpaceBetweenRowNoWrapMarPadInRange_static13:' + Math.floor(Math.abs((locationText2.left - locationText1.right) - 
      (locationText3.left - locationText2.right))));
      console.info('testAlignSpaceBetweenRowNoWrapMarPadInRange_static14:' + Math.floor(Math.abs((locationText2.left - locationText1.right) - 
      Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20)))));

      expect(Math.floor(Math.abs(locationText1.top - locationText2.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText2.top - locationText3.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Math.round((locationText1.top - locationFlex.top) * 10) / 10) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(5)) * 10) / 10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.bottom - locationText1.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText2.bottom - locationText2.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText3.bottom - locationText3.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(((locationFlex.bottom - locationText3.bottom) * 10) / 10 - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(45)) * 10) / 10)) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(((locationText1.left - locationFlex.left) * 10) / 10 - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(5)) * 10) / 10)) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(((locationText3.right) * 10) / 10 - ((locationFlex.right - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(5))) * 10) / 10)) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - (locationText2.right - locationText2.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.right - locationText3.left) - (locationText2.right - locationText2.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.right - locationText2.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText2.left - locationText1.right) - (locationText3.left - locationText2.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.left - locationText1.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20)))) <= 1).assertTrue();

      console.info('new testAlignSpaceBetweenRowNoWrapMarPadInRange END');

    });
  })
}