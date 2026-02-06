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

export default function Row_Size() {
  describe('Row_Size', () => {
    beforeAll(() => {
      console.info("Row_Size beforeAll start");
   
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("Row_Size beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/parentComponentChanged/Row_Size',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        await CommonFunc.sleep(1000);
        let pages = routerInstance.getState();
        console.info("get Row_Size state success " + "");
        if (!("Row_Size" == pages.name)) {
          console.info("get Row_Size state success " + "");
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push Row_Size page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000)
      console.info("Row_Size beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000)
      console.info("Row_Size after each called");
    });

    

    
    

/**
     * @tc.number   testRowSizeBothSatisfy_static_01
     * @tc.name     testRowSizeBothSatisfy_static_01
     * @tc.desc     testRowSizeBothSatisfy_static_01
     * @tc.level    Level.LEVEL0
     */
it('testRowSizeBothSatisfy_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testRowSizeBothSatisfy_static_01 START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'width', value: 350
      });
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'height', value: 200
      });
      await CommonFunc.sleep(3000);
      let Row: RectValue = CommonFunc.getComponentRect('Row_Size_Row');
      let Text1: RectValue = CommonFunc.getComponentRect('Row_Size_Text1');
      let Text2: RectValue = CommonFunc.getComponentRect('Row_Size_Text2');
      let Text3: RectValue = CommonFunc.getComponentRect('Row_Size_Text3');

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

      expect(Math.abs(Text1.left - Row.left) <= 1).assertTrue();

      expect(Math.abs(Text1.top - Row.top - (Row.bottom - Text1.bottom)) <= 1).assertTrue();
      expect(Math.abs(Text2.top - Row.top - (Row.bottom - Text2.bottom)) <= 1).assertTrue();
      expect(Math.abs(Text3.top - Row.top - (Row.bottom - Text3.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round(Text2.left - Text1.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.left - Text2.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1).assertTrue();

      expect(Row.right).assertLarger(Text3.right);
      console.info('testRowSizeBothSatisfy_static_01 END');
      done();
    });

    

    
    

/**
     * @tc.number   testRowSizeWidthNOSatisfy_static_02
     * @tc.name     testRowSizeWidthNOSatisfy_static_02
     * @tc.desc     testRowSizeWidthNOSatisfy_static_02
     * @tc.level    Level.LEVEL0
     */
it('testRowSizeWidthNOSatisfy_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testRowSizeWidthNOSatisfy_static_02 START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'width', value: 200
      });
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'height', value: 200
      });
      await CommonFunc.sleep(3000)
      let Row: RectValue = CommonFunc.getComponentRect('Row_Size_Row');
      let Text1: RectValue = CommonFunc.getComponentRect('Row_Size_Text1');
      let Text2: RectValue = CommonFunc.getComponentRect('Row_Size_Text2');
      let Text3: RectValue = CommonFunc.getComponentRect('Row_Size_Text3');

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
      expect(Math.abs(Text1.left - Row.left) <= 1).assertTrue();
      expect(Math.abs(Text1.top - Row.top - (Row.bottom - Text1.bottom)) <= 1).assertTrue();
      expect(Math.abs(Text2.top - Row.top - (Row.bottom - Text2.bottom)) <= 1).assertTrue();
      expect(Math.abs(Text3.top - Row.top - (Row.bottom - Text3.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.left - Text1.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.left - Text2.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1).assertTrue();
      expect(Text3.right).assertLarger(Row.right);

      console.info('testRowSizeWidthNOSatisfy_static_02 END');
      done();
    });

    

    
    

/**
     * @tc.number   testRowSizeHeightNOSatisfy_static_03
     * @tc.name     testRowSizeHeightNOSatisfy_static_03
     * @tc.desc     testRowSizeHeightNOSatisfy_static_03
     * @tc.level    Level.LEVEL0
     */
it('testRowSizeHeightNOSatisfy_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testRowSizeHeightNOSatisfy_static_03 START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'width', value: 350
      });
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'height', value: 100
      });
      await CommonFunc.sleep(3000)
      let Row: RectValue = CommonFunc.getComponentRect('Row_Size_Row');
      let Text1: RectValue = CommonFunc.getComponentRect('Row_Size_Text1');
      let Text2: RectValue = CommonFunc.getComponentRect('Row_Size_Text2');
      let Text3: RectValue = CommonFunc.getComponentRect('Row_Size_Text3');

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

      expect(Math.abs(Text1.left - Row.left) <= 1).assertTrue();
      expect(Math.abs(Text1.top - Row.top - (Row.bottom - Text1.bottom)) <= 1).assertTrue();
      expect(Math.abs(Text2.top - Row.top - (Row.bottom - Text2.bottom)) <= 1).assertTrue();
      expect(Math.abs(Text3.top - Row.top - (Row.bottom - Text3.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.left - Text1.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.left - Text2.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1).assertTrue();
      expect(Text3.bottom).assertLarger(Row.bottom);
      expect(Row.top).assertLarger(Text3.top);

      console.info('testRowSizeHeightNOSatisfy_static_03 END');
      done();
    });
  })
}
