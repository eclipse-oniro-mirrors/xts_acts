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
import { MessageManager, Callback } from '../../../../../ets/MainAbility/common/MessageManager';
import { Visibility } from '@ohos.arkui.component';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { MessageManager } from '../../../../../ets/MainAbility/common/MessageManager'
import RectValue from '../../../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import { UIContext } from "@ohos.arkui.UIContext";
import inspector from '@ohos.arkui.inspector';
import { GlobalContext } from '../../../../../ets/MainAbility/common/GlobalContext'
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
export default function AlignContent_End_FlexP_Fixed_Visibility() {

  describe('AlignContent_End_FlexP_Fixed_Visibility', () => {
    beforeAll(() => {
      console.info("AlignContent_End_FlexP_Fixed_Visibility beforeEach start");
     await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("AlignContent_End_FlexP_Fixed_Visibility beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/End/AlignContent_End_FlexP_Fixed_Visibility',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AlignContent_End_FlexP_Fixed_Visibility state pages:" + JSON.stringify(pages));
        if (!("AlignContent_End_FlexP_Fixed_Visibility" == pages.name)) {
          console.info("get AlignContent_End_FlexP_Fixed_Visibility pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AlignContent_End_FlexP_Fixed_Visibility page error:" + err);
      }
      console.info("AlignContent_End_FlexP_Fixed_Visibility beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(2000)
      console.info("AlignContent_End_FlexP_Fixed_Visibility after each called");
    });

    

    
    /**
     * @tc.number   testAlignContentEndFlexfixedVisibilityHidden_static
     * @tc.name     testAlignContentEndFlexfixedVisibilityHidden_static
     * @tc.desc     testAlignContentEndFlexfixedVisibilityHidden_static
     * @tc.level    Level.LEVEL0
     */
it('testAlignContentEndFlexfixedVisibilityHidden_static', Level.LEVEL0, async () => {
      console.info('testAlignContentEndFlexfixedVisibilityHidden START');
      AppStorage.get<MessageManager<Visibility>>("messageManager")?.notify({
        name: 'visibility', value: Visibility.Hidden
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('AlignContent_End_FlexP_Fixed_Visibility_flex001');
      let strJsonText1 = inspector.getInspectorByKey('AlignContent_End_FlexP_Fixed_Visibility_1');
      let AlignContentFlexEnd_flex001: RectValue = CommonFunc.getComponentRect('AlignContent_End_FlexP_Fixed_Visibility_flex001');
      let AlignContentFlexEnd_2: RectValue = CommonFunc.getComponentRect('AlignContent_End_FlexP_Fixed_Visibility_2');
      let AlignContentFlexEnd_3: RectValue = CommonFunc.getComponentRect('AlignContent_End_FlexP_Fixed_Visibility_3');
      let AlignContentFlexEnd_4: RectValue = CommonFunc.getComponentRect('AlignContent_End_FlexP_Fixed_Visibility_4');

      console.log('AlignContent_End_FlexP_Fixed_Visibility_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_flex001));
      console.log('AlignContentFlexEnd_2 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_2));
      console.log('AlignContentFlexEnd_3 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_3));
      console.log('AlignContentFlexEnd_4 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_4));
      expect(Math.abs(Math.round(AlignContentFlexEnd_2.bottom - AlignContentFlexEnd_2.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_3.bottom - AlignContentFlexEnd_3.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_4.bottom - AlignContentFlexEnd_4.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_2.right - AlignContentFlexEnd_2.left) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_3.right - AlignContentFlexEnd_3.left) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_4.right - AlignContentFlexEnd_4.left) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1)
        .assertTrue();


      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual("FlexDirection.Row");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual("FlexAlign.End");
      expect(JSON.parseJsonElement(strJsonText1).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Hidden");

      expect(Math.abs(Math.round(AlignContentFlexEnd_flex001.bottom) - Math.round(AlignContentFlexEnd_4.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_3.top - AlignContentFlexEnd_flex001.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_4.top) - Math.round(AlignContentFlexEnd_3.bottom)) <= 1)
        .assertTrue();


      expect(Math.abs(Math.round(AlignContentFlexEnd_2.left - AlignContentFlexEnd_flex001.left) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_flex001.bottom - AlignContentFlexEnd_4.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200)))) <= 1)
        .assertTrue();


      console.info('testAlignContentEndFlexfixedVisibilityHidden END');

    });

    

    
    /**
     * @tc.number   testAlignContentEndFlexfixedVisibilityNone_static
     * @tc.name     testAlignContentEndFlexfixedVisibilityNone_static
     * @tc.desc     testAlignContentEndFlexfixedVisibilityNone_static
     * @tc.level    Level.LEVEL0
     */
it('testAlignContentEndFlexfixedVisibilityNone_static', Level.LEVEL0, async () => {
      console.info('testAlignContentEndFlexfixedVisibilityNone START');
      AppStorage.get<MessageManager<Visibility>>("messageManager")?.notify({
        name: 'visibility', value: Visibility.None
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('AlignContent_End_FlexP_Fixed_Visibility_flex001');

      let strJsonText1 = inspector.getInspectorByKey('AlignContent_End_FlexP_Fixed_Visibility_1');
      let AlignContentFlexEnd_flex002: RectValue = CommonFunc.getComponentRect('AlignContent_End_FlexP_Fixed_Visibility_flex001');
      let AlignContentFlexEnd_1: RectValue = CommonFunc.getComponentRect('AlignContent_End_FlexP_Fixed_Visibility_1');
      let AlignContentFlexEnd_2: RectValue = CommonFunc.getComponentRect('AlignContent_End_FlexP_Fixed_Visibility_2');
      let AlignContentFlexEnd_3: RectValue = CommonFunc.getComponentRect('AlignContent_End_FlexP_Fixed_Visibility_3');
      let AlignContentFlexEnd_4: RectValue = CommonFunc.getComponentRect('AlignContent_End_FlexP_Fixed_Visibility_4');

      console.log('AlignContent_End_FlexP_Fixed_Visibility_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_flex002))
      console.log('AlignContentFlexEnd_1 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_1));
      console.log('AlignContentFlexEnd_2 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_2));
      console.log('AlignContentFlexEnd_3 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_3));
      console.log('AlignContentFlexEnd_4 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_4));
      expect(Math.abs(Math.round(AlignContentFlexEnd_2.bottom - AlignContentFlexEnd_2.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_3.bottom - AlignContentFlexEnd_3.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_4.bottom - AlignContentFlexEnd_4.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_2.right - AlignContentFlexEnd_2.left) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_3.right - AlignContentFlexEnd_3.left) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexEnd_4.right - AlignContentFlexEnd_4.left) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1)
        .assertTrue();


      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual("FlexDirection.Row");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual("FlexAlign.End");
      expect(JSON.parseJsonElement(strJsonText1).getElement('$attrs').getString('visibility')).assertEqual("Visibility.None");

      expect(AlignContentFlexEnd_flex002.bottom).assertEqual(AlignContentFlexEnd_4.bottom);
      expect(AlignContentFlexEnd_2.top).assertEqual(AlignContentFlexEnd_3.top);
      expect(AlignContentFlexEnd_4.top).assertEqual(AlignContentFlexEnd_3.top);
      expect(AlignContentFlexEnd_2.left).assertEqual(AlignContentFlexEnd_flex002.left);

      console.info('testAlignContentEndFlexfixedVisibilityNone END');

    });
  })
}
