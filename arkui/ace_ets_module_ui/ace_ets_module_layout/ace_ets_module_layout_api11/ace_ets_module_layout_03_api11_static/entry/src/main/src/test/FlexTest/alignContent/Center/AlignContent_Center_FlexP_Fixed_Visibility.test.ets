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

import { Visibility } from '@ohos.arkui.component';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
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
import { UtilsTest } from '../../../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function AlignContent_Center_FlexP_Fixed_Visibility() {

  describe('AlignContent_Center_FlexP_Fixed_Visibility', () => {
    beforeAll(() => {
      console.info("AlignContent_Center_FlexP_Fixed_Visibility beforeEach start");
     await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("AlignContent_Center_FlexP_Fixed_Visibility beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/Center/AlignContent_Center_FlexP_Fixed_Visibility',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AlignContent_Center_FlexP_Fixed_Visibility state pages:" + JSON.stringify(pages));
        if (!("AlignContent_Center_FlexP_Fixed_Visibility" == pages.name)) {
          console.info("get AlignContent_Center_FlexP_Fixed_Visibility pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AlignContent_Center_FlexP_Fixed_Visibility page error:" + err);
      }
      console.info("AlignContent_Center_FlexP_Fixed_Visibility beforeEach end");
    });


    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(2000);
      console.info("AlignContent_Center_FlexP_Fixed_Visibility after each called");
    });

    

    
    /**
     * @tc.number   testAlignContentCenterFlexfixedVisibilityHidden_static
     * @tc.name     testAlignContentCenterFlexfixedVisibilityHidden_static
     * @tc.desc     testAlignContentCenterFlexfixedVisibilityHidden_static
     * @tc.level    Level.LEVEL0
     */
it('testAlignContentCenterFlexfixedVisibilityHidden_static', Level.LEVEL0, async () => {
      console.info('testAlignContentCenterFlexfixedVisibilityHidden START');
      AppStorage.get<MessageManager<Visibility>>("messageManager")?.notify({
        name: 'visibility', value: Visibility.Hidden
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('AlignContent_Center_FlexP_Fixed_Visibility_flex001');

      let textStrJson = inspector.getInspectorByKey('AlignContent_Center_FlexP_Fixed_Visibility_1');
      console.info('flex [getInspectorByKey] is:' + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info('flex obj.$attrs.constructor is:' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor')));
      console.info('Text1 textObj.$attrs is:' + JSON.stringify(JSON.parseJsonElement(textStrJson).getElement('$attrs')));
      let AlignContentFlexCenter_flex001: RectValue = CommonFunc.getComponentRect('AlignContent_Center_FlexP_Fixed_Visibility_flex001');
      let AlignContentFlexCenter_2: RectValue = CommonFunc.getComponentRect('AlignContent_Center_FlexP_Fixed_Visibility_2');
      let AlignContentFlexCenter_3: RectValue = CommonFunc.getComponentRect('AlignContent_Center_FlexP_Fixed_Visibility_3');
      let AlignContentFlexCenter_4: RectValue = CommonFunc.getComponentRect('AlignContent_Center_FlexP_Fixed_Visibility_4');

      console.log('AlignContent_Center_FlexP_Fixed_Visibility_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_flex001));

      console.log('AlignContentFlexCenter_2 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_2));
      console.log('AlignContentFlexCenter_3 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_3));
      console.log('AlignContentFlexCenter_4 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_4));
      expect(Math.abs((AlignContentFlexCenter_2.bottom - AlignContentFlexCenter_2.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_3.bottom - AlignContentFlexCenter_3.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_4.bottom - AlignContentFlexCenter_4.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200))) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_2.right - AlignContentFlexCenter_2.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_3.right - AlignContentFlexCenter_3.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_4.right - AlignContentFlexCenter_4.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual("FlexDirection.Row");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual("FlexAlign.Center");
      expect(JSON.parseJsonElement(textStrJson).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Hidden");

      expect(Math.abs((AlignContentFlexCenter_flex001.bottom - AlignContentFlexCenter_4.bottom) - (AlignContentFlexCenter_3.top - AlignContentFlexCenter_flex001.top)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexCenter_flex001.bottom - AlignContentFlexCenter_4.bottom) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.abs(AlignContentFlexCenter_4.top - AlignContentFlexCenter_3.bottom) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_2.left - AlignContentFlexCenter_flex001.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexCenter_4.top - AlignContentFlexCenter_2.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();


      console.info('testAlignContentCenterFlexfixedVisibilityHidden END');

    });

    

    
    /**
     * @tc.number   testAlignContentCenterFlexfixedVisibilityNone_static
     * @tc.name     testAlignContentCenterFlexfixedVisibilityNone_static
     * @tc.desc     testAlignContentCenterFlexfixedVisibilityNone_static
     * @tc.level    Level.LEVEL0
     */
it('testAlignContentCenterFlexfixedVisibilityNone_static', Level.LEVEL0, async () => {
      console.info('testAlignContentCenterFlexfixedVisibilityNone START');
      AppStorage.get<MessageManager<Visibility>>("messageManager")?.notify({
        name: 'visibility', value: Visibility.None
      });
      await CommonFunc.sleep(3000)
      let strJson = inspector.getInspectorByKey('AlignContent_Center_FlexP_Fixed_Visibility_flex001');

      let textStrJson = inspector.getInspectorByKey('AlignContent_Center_FlexP_Fixed_Visibility_1');
      let AlignContentFlexCenter_flex002: RectValue = CommonFunc.getComponentRect('AlignContent_Center_FlexP_Fixed_Visibility_flex001');

      let AlignContentFlexCenter_2: RectValue = CommonFunc.getComponentRect('AlignContent_Center_FlexP_Fixed_Visibility_2');
      let AlignContentFlexCenter_3: RectValue = CommonFunc.getComponentRect('AlignContent_Center_FlexP_Fixed_Visibility_3');
      let AlignContentFlexCenter_4: RectValue = CommonFunc.getComponentRect('AlignContent_Center_FlexP_Fixed_Visibility_4');

      console.log('AlignContent_Center_FlexP_Fixed_Visibility_flex002 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_flex002))

      console.log('AlignContentFlexCenter_2 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_2));
      console.log('AlignContentFlexCenter_3 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_3));
      console.log('AlignContentFlexCenter_4 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_4));
      const uiContext = new UIContext();
      expect(Math.abs((AlignContentFlexCenter_2.bottom - AlignContentFlexCenter_2.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_3.bottom - AlignContentFlexCenter_3.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_4.bottom - AlignContentFlexCenter_4.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200))) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_2.right - AlignContentFlexCenter_2.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_3.right - AlignContentFlexCenter_3.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_4.right - AlignContentFlexCenter_4.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();


      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual("FlexDirection.Row");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual("FlexAlign.Center");
      expect(JSON.parseJsonElement(textStrJson).getElement('$attrs').getString('visibility')).assertEqual("Visibility.None");

      expect(Math.abs((AlignContentFlexCenter_flex002.bottom - AlignContentFlexCenter_4.bottom) - (AlignContentFlexCenter_3.top - AlignContentFlexCenter_flex002.top)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexCenter_2.top - AlignContentFlexCenter_flex002.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(AlignContentFlexCenter_2.top - AlignContentFlexCenter_3.top) <= 1).assertTrue();
      expect(Math.abs(AlignContentFlexCenter_4.top - AlignContentFlexCenter_3.top) <= 1).assertTrue();
      expect(Math.abs(AlignContentFlexCenter_2.left - AlignContentFlexCenter_flex002.left) <= 1).assertTrue();

      console.info('testAlignContentCenterFlexfixedVisibilityNone END');

    });
  })
}
