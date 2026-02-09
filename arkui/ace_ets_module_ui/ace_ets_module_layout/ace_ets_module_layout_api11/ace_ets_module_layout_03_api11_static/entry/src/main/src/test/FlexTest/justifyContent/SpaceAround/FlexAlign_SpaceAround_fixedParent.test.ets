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
import { Visibility } from '@ohos.arkui.component';
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
export default function flexAlign_SpaceAround_fixedParent() {
  describe('FlexAlign_SpaceAround_fixedParent', () => {
    beforeAll(() => {
      console.info("FlexAlign_SpaceAround_fixedParent beforeEach start");
      
     await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("FlexAlign_SpaceAround_fixedParent beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/SpaceAround/FlexAlign_SpaceAround_fixedParent',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FlexAlign_SpaceAround_fixedParent state pages:" + JSON.stringify(pages));
        if (!("FlexAlign_SpaceAround_fixedParent" == pages.name)) {
          console.info("get FlexAlign_SpaceAround_fixedParent pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push FlexAlign_SpaceAround_fixedParent page error:" + err);
      }
      console.info("FlexAlign_SpaceAround_fixedParent beforeEach end");
    });


    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("FlexAlign_SpaceAround_fixedParent afterEach called");
    });

    
    
    /**
     * @tc.number   testAlignSpaceAroundRowNoWrapOffset_static
     * @tc.name     testAlignSpaceAroundRowNoWrapOffset_static
     * @tc.desc     testAlignSpaceAroundRowNoWrapOffset_static
     * @tc.level    Level.LEVEL0
     */
it('testAlignSpaceAroundRowNoWrapOffset_static', Level.LEVEL0, async () => {
      console.info('new testAlignSpaceAroundRowNoWrapOffset START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'x', value: 15
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'y', value: 30
      });
      // AppStorage.get<MessageManager<object>>("messageManager")?.notify({//1.1的ets中不存在visibility变量接受value
      //   name: 'visibility', value: Visibility.Visible
      // });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('FlexAlignSpaceAround9');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.NoWrap');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.SpaceAround');
      let strJson2 = inspector.getInspectorByKey('AlignSpaceAround25');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual('Visibility.Visible');
      let locationText1: RectValue = CommonFunc.getComponentRect('AlignSpaceAround25');
      let locationText2: RectValue = CommonFunc.getComponentRect('AlignSpaceAround26');
      let locationText3: RectValue = CommonFunc.getComponentRect('AlignSpaceAround27');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexAlignSpaceAround9');

      expect(Math.floor(Math.abs(locationText1.top - locationFlex.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText1.left - locationFlex.left -
        (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(15)) + (locationFlex.right - locationText3.right)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText2.top - locationText3.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText3.top - locationFlex.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText1.bottom - locationText1.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText2.bottom - locationText2.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText3.bottom - locationText3.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationFlex.bottom - locationText3.bottom - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();

      expect(Math.floor(Math.abs(locationText1.right - locationText1.left -
        (locationText2.right - locationText2.left))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText3.right - locationText3.left -
        (locationText2.right - locationText2.left))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText2.right - locationText2.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText2.left - locationText1.right + Number(AppStorage.get<UIContext>('uiContext')?.vp2px(15)) -
        (locationText3.left - locationText2.right))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText1.left - locationFlex.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(15)) -
        (locationFlex.right - locationText3.right))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText3.left - locationText2.right -
        2 * (locationFlex.right - locationText3.right))) <= 2).assertTrue();
      console.info('new testAlignSpaceAroundRowNoWrapOffset END');

    });
  })
}