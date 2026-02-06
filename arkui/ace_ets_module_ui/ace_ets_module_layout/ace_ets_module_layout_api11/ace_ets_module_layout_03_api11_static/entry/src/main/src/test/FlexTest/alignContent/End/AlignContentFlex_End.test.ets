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
export default function AlignContentFlex_End() {

  describe('AlignContentFlex_End', () => {
    beforeAll(() => {
      console.info("AlignContentFlex_End beforeEach start");
     await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("AlignContentFlex_End beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/End/AlignContentFlex_End',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AlignContentFlex_End state pages:" + JSON.stringify(pages));
        if (!("AlignContentFlex_End" == pages.name)) {
          console.info("get AlignContentFlex_End pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AlignContentFlex_End page error:" + err);
      }
      console.info("AlignContentFlex_End beforeEach end");
    });


    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(2000)
      console.info("AlignContentFlex_End after each called");
    });

    

    
    /**
     * @tc.number   testAlignContentEndFlexHeightSatisfy_static
     * @tc.name     testAlignContentEndFlexHeightSatisfy_static
     * @tc.desc     testAlignContentEndFlexHeightSatisfy_static
     * @tc.level    Level.LEVEL0
     */
it('testAlignContentEndFlexHeightSatisfy_static', Level.LEVEL0, async () => {
      console.info('testAlignContentEndFlexHeightSatisfy START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 360
      })
      await CommonFunc.sleep(3000)
      let strJson = inspector.getInspectorByKey('AlignContentFlexEnd_flex001');
      console.info('flex [getInspectorByKey] is:' + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info('flex obj.$attrs.constructor is:' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor')));
      let AlignContentFlexEnd_flex001: RectValue = CommonFunc.getComponentRect('AlignContentFlexEnd_flex001');
      let AlignContentFlexEnd_1: RectValue = CommonFunc.getComponentRect('AlignContentFlexEnd_flex001_1');
      let AlignContentFlexEnd_2: RectValue = CommonFunc.getComponentRect('AlignContentFlexEnd_flex001_2');
      let AlignContentFlexEnd_3: RectValue = CommonFunc.getComponentRect('AlignContentFlexEnd_flex001_3');
      let AlignContentFlexEnd_4: RectValue = CommonFunc.getComponentRect('AlignContentFlexEnd_flex001_4');

      console.log('AlignContentFlexEnd_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_flex001));
      console.log('AlignContentFlexEnd_1 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_1));
      console.log('AlignContentFlexEnd_2 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_2));
      console.log('AlignContentFlexEnd_3 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_3));
      console.log('AlignContentFlexEnd_4 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_4));
      expect(Math.floor(Math.abs((AlignContentFlexEnd_1.bottom - AlignContentFlexEnd_1.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexEnd_2.bottom - AlignContentFlexEnd_2.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexEnd_3.bottom - AlignContentFlexEnd_3.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexEnd_4.bottom - AlignContentFlexEnd_4.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexEnd_1.right - AlignContentFlexEnd_1.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexEnd_2.right - AlignContentFlexEnd_2.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexEnd_3.right - AlignContentFlexEnd_3.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexEnd_4.right - AlignContentFlexEnd_4.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(AlignContentFlexEnd_flex001.bottom - AlignContentFlexEnd_4.bottom)) <= 1).assertTrue();

      expect(Math.floor(Math.abs((AlignContentFlexEnd_2.top - AlignContentFlexEnd_flex001.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(60)))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs(AlignContentFlexEnd_4.top - AlignContentFlexEnd_2.bottom)) <= 1).assertTrue();

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual("FlexDirection.Row");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual("FlexAlign.End");

      console.info('testAlignContentEndFlexHeightSatisfy END');

    });

    

    
    /**
     * @tc.number   testAlignContentEndFlexHeightNoSatisfy_static
     * @tc.name     testAlignContentEndFlexHeightNoSatisfy_static
     * @tc.desc     testAlignContentEndFlexHeightNoSatisfy_static
     * @tc.level    Level.LEVEL0
     */
it('testAlignContentEndFlexHeightNoSatisfy_static', Level.LEVEL0, async () => {
      console.info('testAlignContentEndFlexHeightNoSatisfy START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 250
      })
      await CommonFunc.sleep(3000)
      let strJson = inspector.getInspectorByKey('AlignContentFlexEnd_flex001');
      let AlignContentFlexEnd_flex002: RectValue = CommonFunc.getComponentRect('AlignContentFlexEnd_flex001');
      let AlignContentFlexEnd_1: RectValue = CommonFunc.getComponentRect('AlignContentFlexEnd_flex001_1');
      let AlignContentFlexEnd_2: RectValue = CommonFunc.getComponentRect('AlignContentFlexEnd_flex001_2');
      let AlignContentFlexEnd_3: RectValue = CommonFunc.getComponentRect('AlignContentFlexEnd_flex001_3');
      let AlignContentFlexEnd_4: RectValue = CommonFunc.getComponentRect('AlignContentFlexEnd_flex001_4');

      console.log('AlignContentFlexEnd_flex002 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_flex002))

      console.log('AlignContentFlexEnd_1 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_1));
      console.log('AlignContentFlexEnd_2 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_2));
      console.log('AlignContentFlexEnd_3 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_3));
      console.log('AlignContentFlexEnd_4 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_4));
      expect(Math.floor(Math.abs((AlignContentFlexEnd_1.bottom - AlignContentFlexEnd_1.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexEnd_2.bottom - AlignContentFlexEnd_2.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexEnd_3.bottom - AlignContentFlexEnd_3.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexEnd_4.bottom - AlignContentFlexEnd_4.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexEnd_1.right - AlignContentFlexEnd_1.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexEnd_2.right - AlignContentFlexEnd_2.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexEnd_3.right - AlignContentFlexEnd_3.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexEnd_4.right - AlignContentFlexEnd_4.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs(AlignContentFlexEnd_1.top - AlignContentFlexEnd_flex002.top)) <= 1).assertTrue();
      expect(AlignContentFlexEnd_4.bottom).assertLarger(AlignContentFlexEnd_flex002.bottom);
      expect(Math.floor(Math.abs(AlignContentFlexEnd_2.bottom - AlignContentFlexEnd_4.top)) <= 1).assertTrue();

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual("FlexDirection.Row");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual("FlexAlign.End");

      console.info('testAlignContentEndFlexHeightNoSatisfy END');

    });
  })
}
