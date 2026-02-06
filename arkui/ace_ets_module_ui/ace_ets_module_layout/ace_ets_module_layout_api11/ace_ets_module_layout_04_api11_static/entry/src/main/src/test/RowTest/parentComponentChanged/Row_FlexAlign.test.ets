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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from "../../../../../hypium/index";
import router from '@ohos.router';

import CommonFunc, { RectValue } from '../../../../ets/MainAbility/common/Common'
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import { FlexAlign } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function Row_FlexAlign() {
  describe('Row_FlexAlign', () => {
    beforeAll(() => {
      console.info("Row_FlexAlign beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("Row_FlexAlign beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/parentComponentChanged/Row_FlexAlign',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        await CommonFunc.sleep(1000);
        let pages = routerInstance.getState();
        console.info("get Row_FlexAlign state success " + "");
        if (!("Row_FlexAlign" == pages.name)) {
          console.info("get Row_FlexAlign state success " + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Row_FlexAlign page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000)
      console.info("Row_FlexAlign beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000)
      console.info("Row_FlexAlign after each called");
    });

/**
     * @tc.number   testRowJustifyContentFlexAlignStart_static_01
     * @tc.name     testRowJustifyContentFlexAlignStart_static_01
     * @tc.desc     testRowJustifyContentFlexAlignStart_static_01
     * @tc.level    Level.LEVEL0
     */
it('testRowJustifyContentFlexAlignStart_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testRowJustifyContentFlexAlignStart_static_01 START');
        AppStorage.get<MessageManager<FlexAlign>>('messageManager')?.notify({
          name: 'justifyContent', value: FlexAlign.Start
        });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Row_ParentComponentChanged_Row');

     console.info('Row obj.$attrs is:' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      let Row: RectValue = CommonFunc.getComponentRect('Row_ParentComponentChanged_Row');
      console.log('Row rect_value is:' + JSON.stringify(Row));
      let Text1: RectValue = CommonFunc.getComponentRect('Text1');
      console.log('Text1 rect_value is:' + JSON.stringify(Text1));
      let Text2: RectValue = CommonFunc.getComponentRect('Text2');
      console.log('Text2 rect_value is:' + JSON.stringify(Text2));
      let Text3: RectValue = CommonFunc.getComponentRect('Text3');

      console.log('Text3 rect_value is:' + JSON.stringify(Text3));

      expect(Math.abs((Math.round(Text1.bottom - Text1.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.bottom - Text2.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.bottom - Text3.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text1.right - Text1.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.right - Text2.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.right - Text3.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();

     expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('justifyContent')).assertEqual("FlexAlign.Start");

      expect(Math.abs((Text1.left) - (Row.left)) <= 1).assertTrue();
      expect(Math.abs(Text1.left - Row.left) <= 1).assertTrue();
      expect(Math.abs(Math.round(Text1.top - Row.top) - Math.round(Row.bottom - Text1.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Text2.top - Row.top) - Math.round(Row.bottom - Text2.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Text3.top - Row.top) - Math.round(Row.bottom - Text3.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round(Text2.left - Text1.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.left - Text2.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1).assertTrue();
      expect(Row.right).assertLarger(Text3.right);

      console.info('testRowJustifyContentFlexAlignStart_static_01 END');
      done();
    });

/**
     * @tc.number   testRowJustifyContentFlexAlignCenter_static_02
     * @tc.name     testRowJustifyContentFlexAlignCenter_static_02
     * @tc.desc     testRowJustifyContentFlexAlignCenter_static_02
     * @tc.level    Level.LEVEL0
     */
it('testRowJustifyContentFlexAlignCenter_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testRowJustifyContentFlexAlignCenter_static_02 START');
      AppStorage.get<MessageManager<FlexAlign>>('messageManager')?.notify({
        name: 'justifyContent', value: FlexAlign.Center
      });
      await CommonFunc.sleep(3000)
      let strJson = inspector.getInspectorByKey('Row_ParentComponentChanged_Row');

     console.info('Row obj.$attrs is:' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      let Row: RectValue = CommonFunc.getComponentRect('Row_ParentComponentChanged_Row');
      let Text1: RectValue = CommonFunc.getComponentRect('Text1');
      let Text2: RectValue = CommonFunc.getComponentRect('Text2');
      let Text3: RectValue = CommonFunc.getComponentRect('Text3');

      console.log('Row rect_value is:' + JSON.stringify(Row));
      console.log('Text1 rect_value is:' + JSON.stringify(Text1));
      console.log('Text2 rect_value is:' + JSON.stringify(Text2));
      console.log('Text3 rect_value is:' + JSON.stringify(Text3));

      expect(Math.abs((Math.round(Text1.bottom - Text1.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.bottom - Text2.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.bottom - Text3.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text1.right - Text1.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.right - Text2.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.right - Text3.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
     expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('justifyContent')).assertEqual("FlexAlign.Center");

      expect(Math.abs(Math.round(Text1.left - Row.left) - Math.round(Row.right - Text3.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Text1.top - Row.top) - Math.round(Row.bottom - Text1.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Text2.top - Row.top) - Math.round(Row.bottom - Text2.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Text3.top - Row.top) - Math.round(Row.bottom - Text3.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.left - Text1.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.left - Text2.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1).assertTrue();

      console.info('testRowJustifyContentFlexAlignCenter_static_02 END');
      done();
    });

/**
     * @tc.number   testRowJustifyContentFlexAlignEnd_static_03
     * @tc.name     testRowJustifyContentFlexAlignEnd_static_03
     * @tc.desc     testRowJustifyContentFlexAlignEnd_static_03
     * @tc.level    Level.LEVEL0
     */
it('testRowJustifyContentFlexAlignEnd_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testRowJustifyContentFlexAlignEnd_static_03 START');
      AppStorage.get<MessageManager<FlexAlign>>('messageManager')?.notify({
        name: 'justifyContent', value: FlexAlign.End
      });
      await CommonFunc.sleep(3000)
      let strJson = inspector.getInspectorByKey('Row_ParentComponentChanged_Row');

     console.info('Row obj.$attrs is:' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      let Row: RectValue = CommonFunc.getComponentRect('Row_ParentComponentChanged_Row');
      let Text1: RectValue = CommonFunc.getComponentRect('Text1');
      let Text2: RectValue = CommonFunc.getComponentRect('Text2');
      let Text3: RectValue = CommonFunc.getComponentRect('Text3');

      console.log('Row rect_value is:' + JSON.stringify(Row));
      console.log('Text1 rect_value is:' + JSON.stringify(Text1));
      console.log('Text2 rect_value is:' + JSON.stringify(Text2));
      console.log('Text3 rect_value is:' + JSON.stringify(Text3));

      expect(Math.abs((Math.round(Text1.bottom - Text1.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.bottom - Text2.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.bottom - Text3.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text1.right - Text1.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.right - Text2.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.right - Text3.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
     expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('justifyContent')).assertEqual("FlexAlign.End");

      expect(Math.abs(Text3.right - Row.right) <= 1).assertTrue();
      expect(Math.abs(Math.round(Text1.top - Row.top) - Math.round(Row.bottom - Text1.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Text2.top - Row.top) - Math.round(Row.bottom - Text2.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Text3.top - Row.top) - Math.round(Row.bottom - Text3.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.left - Text1.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.left - Text2.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1).assertTrue();
      expect(Text1.left).assertLarger(Row.left);

      console.info('testRowJustifyContentFlexAlignEnd_static_03 END');
      done();
    });

/**
     * @tc.number   testRowJustifyContentFlexAlignSpaceBetween_static_04
     * @tc.name     testRowJustifyContentFlexAlignSpaceBetween_static_04
     * @tc.desc     testRowJustifyContentFlexAlignSpaceBetween_static_04
     * @tc.level    Level.LEVEL0
     */
it('testRowJustifyContentFlexAlignSpaceBetween_static_04', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testRowJustifyContentFlexAlignSpaceBetween_static_04 START');
      AppStorage.get<MessageManager<FlexAlign>>('messageManager')?.notify({
        name: 'justifyContent', value: FlexAlign.SpaceBetween
      });
      await CommonFunc.sleep(3000)
      let strJson = inspector.getInspectorByKey('Row_ParentComponentChanged_Row');

     console.info('Row obj.$attrs is:' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      let Row: RectValue = CommonFunc.getComponentRect('Row_ParentComponentChanged_Row');
      let Text1: RectValue = CommonFunc.getComponentRect('Text1');
      let Text2: RectValue = CommonFunc.getComponentRect('Text2');
      let Text3: RectValue = CommonFunc.getComponentRect('Text3');

      console.log('Row rect_value is:' + JSON.stringify(Row));
      console.log('Text1 rect_value is:' + JSON.stringify(Text1));
      console.log('Text2 rect_value is:' + JSON.stringify(Text2));
      console.log('Text3 rect_value is:' + JSON.stringify(Text3));

      expect(Math.abs((Math.round(Text1.bottom - Text1.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.bottom - Text2.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.bottom - Text3.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text1.right - Text1.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.right - Text2.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.right - Text3.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
     expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('justifyContent')).assertEqual("FlexAlign.SpaceBetween");

      expect(Math.abs(Text1.left - Row.left) <= 1).assertTrue();
      expect(Math.abs(Text3.right - Row.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(Math.round((Text2.left - Text1.right) * 10) / 10)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(25))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Math.round((Text3.left - Text2.right) * 10) / 10)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(25))))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Text1.top - Row.top) - Math.round(Row.bottom - Text1.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Text2.top - Row.top) - Math.round(Row.bottom - Text2.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Text3.top - Row.top) - Math.round(Row.bottom - Text3.bottom)) <= 1).assertTrue();

      console.info('testRowJustifyContentFlexAlignSpaceBetween_static_04 END');
      done();
    });

/**
     * @tc.number   testRowJustifyContentFlexAlignSpaceAround_static_05
     * @tc.name     testRowJustifyContentFlexAlignSpaceAround_static_05
     * @tc.desc     testRowJustifyContentFlexAlignSpaceAround_static_05
     * @tc.level    Level.LEVEL0
     */
it('testRowJustifyContentFlexAlignSpaceAround_static_05', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testRowJustifyContentFlexAlignSpaceAround_static_05 START');
      AppStorage.get<MessageManager<FlexAlign>>('messageManager')?.notify({
        name: 'justifyContent', value: FlexAlign.SpaceAround
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Row_ParentComponentChanged_Row');

     console.info('Row obj.$attrs is:' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      let Row: RectValue = CommonFunc.getComponentRect('Row_ParentComponentChanged_Row');
      let Text1: RectValue = CommonFunc.getComponentRect('Text1');
      let Text2: RectValue = CommonFunc.getComponentRect('Text2');
      let Text3: RectValue = CommonFunc.getComponentRect('Text3');

      console.log('Row rect_value is:' + JSON.stringify(Row));
      console.log('Text1 rect_value is:' + JSON.stringify(Text1));
      console.log('Text2 rect_value is:' + JSON.stringify(Text2));
      console.log('Text3 rect_value is:' + JSON.stringify(Text3));


      expect(Math.abs((Math.round(Text1.bottom - Text1.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.bottom - Text2.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.bottom - Text3.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text1.right - Text1.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.right - Text2.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.right - Text3.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
     expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('justifyContent')).assertEqual("FlexAlign.SpaceAround");

      expect(Math.abs(Math.round(Text1.left - Row.left) - Math.round(Row.right - Text3.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round((Text1.left - Row.left) * 10) / 10 - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50 / 6)) * 10) / 10) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Text2.left - Text1.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50 / 3))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.left - Text2.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50 / 3))))) <= 1).assertTrue();

      expect(Math.abs(Math.round(Text1.top - Row.top) - Math.round(Row.bottom - Text1.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Text2.top - Row.top) - Math.round(Row.bottom - Text2.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Text3.top - Row.top) - Math.round(Row.bottom - Text3.bottom)) <= 1).assertTrue();

      console.info('testRowJustifyContentFlexAlignSpaceAround_static_05 END');
      done();
    });

/**
     * @tc.number   testRowJustifyContentFlexAlignSpaceEvenly_static_06
     * @tc.name     testRowJustifyContentFlexAlignSpaceEvenly_static_06
     * @tc.desc     testRowJustifyContentFlexAlignSpaceEvenly_static_06
     * @tc.level    Level.LEVEL0
     */
it('testRowJustifyContentFlexAlignSpaceEvenly_static_06', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testRowJustifyContentFlexAlignSpaceEvenly_static_06 START');
      AppStorage.get<MessageManager<FlexAlign>>('messageManager')?.notify({
        name: 'justifyContent', value: FlexAlign.SpaceEvenly
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Row_ParentComponentChanged_Row');

     console.info('Row obj.$attrs is:' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      let Row: RectValue = CommonFunc.getComponentRect('Row_ParentComponentChanged_Row');
      let Text1: RectValue = CommonFunc.getComponentRect('Text1');
      let Text2: RectValue = CommonFunc.getComponentRect('Text2');
      let Text3: RectValue = CommonFunc.getComponentRect('Text3');

      console.log('Row rect_value is:' + JSON.stringify(Row));
      console.log('Text1 rect_value is:' + JSON.stringify(Text1));
      console.log('Text2 rect_value is:' + JSON.stringify(Text2));
      console.log('Text3 rect_value is:' + JSON.stringify(Text3));

      expect(Math.abs((Math.round(Text1.bottom - Text1.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.bottom - Text2.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.bottom - Text3.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text1.right - Text1.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.right - Text2.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.right - Text3.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
     expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('justifyContent')).assertEqual("FlexAlign.SpaceEvenly");

      expect(Math.abs(Math.round(Text1.left - Row.left) - Math.round(Row.right - Text3.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Math.round((Text1.left - Row.left) * 100) / 100) - Math.round(Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50 / 4)) * 100) / 100)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Math.round((Text2.left - Text1.right) * 100) / 100) - Math.round(Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50 / 4)) * 100) / 100)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Math.round((Text3.left - Text2.right) * 100) / 100) - Math.round(Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50 / 4)) * 100) / 100)) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(Text1.top - Row.top) - Math.round(Row.bottom - Text1.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Text2.top - Row.top) - Math.round(Row.bottom - Text2.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Text3.top - Row.top) - Math.round(Row.bottom - Text3.bottom)) <= 1).assertTrue();

      console.info('testRowJustifyContentFlexAlignSpaceEvenly_static_06 END');
      done();
    });

  })
}
