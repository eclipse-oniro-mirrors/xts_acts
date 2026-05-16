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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '../../../../../hypium/index';
import router from '@ohos.router';

import CommonFunc, { RectValue } from '../../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { MessageManager } from '../../../../ets/MainAbility/common/MessageManager';
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

export default function rowMarPad_TextMarPadTest() {
  describe('RowMarPad_TextMarPadTest', () => {
    beforeAll(() => {
      console.info("rowMarPad_TextMarPadTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("RowMarPad_TextMarPadTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/subComponentChanged/RowMarPad_TextMarPad',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RowMarPad_TextMarPad state pages:" + "");
        if (!("RowMarPad_TextMarPad" == pages.name)) {
          console.info("get RowMarPad_TextMarPad pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push RowMarPad_TextMarPad page error:" + err);
      }
      console.info("RowMarPad_TextMarPadTest beforeEach end");
    });
    afterEach(async () => {
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'rowPadding', value: 0
      });
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'rowMargin', value: 0
      });
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'firstTextMargin', value: 0
      });
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'firstTextPadding', value: 0
      });
      await CommonFunc.sleep(1000);
      console.info("RowMarPad_TextMarPadTest after each called");
    });
    
    
    

/**
     * @tc.number   testRowMarPadTextPad_static_01
     * @tc.name     testRowMarPadTextPad_static_01
     * @tc.desc     testRowMarPadTextPad_static_01
     * @tc.level    Level.LEVEL0
     */
it('testRowMarPadTextPad_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testRowMarPadTextPad_static_01] START');
      let firstText: RectValue = CommonFunc.getComponentRect('RowMarPad_TextMarPad1');
      let firstTextTop: number = firstText.top;
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'rowMargin', value: 5
      });
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'rowPadding', value: 10
      });
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'firstTextPadding', value: 10
      });
      await CommonFunc.sleep(3000);
      firstText = CommonFunc.getComponentRect('RowMarPad_TextMarPad1');
      let secondText: RectValue = CommonFunc.getComponentRect('RowMarPad_TextMarPad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('RowMarPad_TextMarPad3');
      let rowContainer: RectValue = CommonFunc.getComponentRect('RowMarPad_TextMarPad_Container01');
      let columnContainer: RectValue = CommonFunc.getComponentRect('Column_RowMarPad_TextMarPad_Container01');
      let rowContainerStrJson = inspector.getInspectorByKey('RowMarPad_TextMarPad_Container01');
  let obj = JSON.parseJsonElement(rowContainerStrJson);
  expect(obj.getString('$type')).assertEqual('Row');

      expect(Math.floor(Math.abs((firstText.bottom - firstText.top)- Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.bottom - secondText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - thirdText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.right - firstText.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((secondText.right - secondText.left) - (thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((firstText.top - rowContainer.top) - (rowContainer.bottom - firstText.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((secondText.top - rowContainer.top) - (rowContainer.bottom - secondText.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((thirdText.top - rowContainer.top) - (rowContainer.bottom - thirdText.bottom))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((rowContainer.top - columnContainer.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(5)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((firstText.top - firstTextTop) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(5)))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((firstText.left - rowContainer.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.left - firstText.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.left - firstText.right) - (thirdText.left - secondText.right))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((rowContainer.right - thirdText.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20)))) <= 1).assertTrue();
      console.info('[testRowMarPadTextPad_static_01] END');
      done();
    });
    
    
    

/**
     * @tc.number   testRowMarPadTextMar_static_02
     * @tc.name     testRowMarPadTextMar_static_02
     * @tc.desc     testRowMarPadTextMar_static_02
     * @tc.level    Level.LEVEL0
     */
it('testRowMarPadTextMar_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testRowMarPadTextMar_static_02] START');
      let firstText: RectValue = CommonFunc.getComponentRect('RowMarPad_TextMarPad1');
      let firstTextTop: number = firstText.top;
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'rowMargin', value: 5
      });
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'rowPadding', value: 10
      });
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'firstTextMargin', value: 10
      });
      await CommonFunc.sleep(3000);
      firstText = CommonFunc.getComponentRect('RowMarPad_TextMarPad1');
      let secondText: RectValue = CommonFunc.getComponentRect('RowMarPad_TextMarPad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('RowMarPad_TextMarPad3');
      let rowContainer: RectValue = CommonFunc.getComponentRect('RowMarPad_TextMarPad_Container01');
      let columnContainer: RectValue = CommonFunc.getComponentRect('Column_RowMarPad_TextMarPad_Container01');
      let rowContainerStrJson = inspector.getInspectorByKey('RowMarPad_TextMarPad_Container01');

  let obj = JSON.parseJsonElement(rowContainerStrJson);
  expect(obj.getString('$type')).assertEqual('Row');

      expect(Math.floor(Math.abs((firstText.bottom - firstText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.bottom - secondText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - thirdText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.right - firstText.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((secondText.right - secondText.left) - (thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((firstText.top - rowContainer.top) - (rowContainer.bottom - firstText.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((secondText.top - rowContainer.top) - (rowContainer.bottom - secondText.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((thirdText.top - rowContainer.top) - (rowContainer.bottom - thirdText.bottom))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((rowContainer.top - columnContainer.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(5)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((firstText.top - firstTextTop) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(5)))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((firstText.left - rowContainer.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.left - firstText.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.left - secondText.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))) <= 1).assertTrue();

      expect(Math.floor(Math.abs(rowContainer.right - thirdText.right)) <= 2).assertTrue();
      console.info('[testRowMarPadTextMar_static_02] END');
      done();
    });
    
    
    

/**
     * @tc.number   testRowMarPadTextMarPad_static_03
     * @tc.name     testRowMarPadTextMarPad_static_03
     * @tc.desc     testRowMarPadTextMarPad_static_03
     * @tc.level    Level.LEVEL0
     */
it('testRowMarPadTextMarPad_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testRowMarPadTextMarPad_static_03] START');
      let firstText: RectValue = CommonFunc.getComponentRect('RowMarPad_TextMarPad1');
      let firstTextTop: number = firstText.top;
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'rowMargin', value: 5
      });
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'rowPadding', value: 10
      });
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'firstTextMargin', value: 10
      });
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'firstTextPadding', value: 10
      });
      await CommonFunc.sleep(3000);
      firstText = CommonFunc.getComponentRect('RowMarPad_TextMarPad1');
      let secondText: RectValue = CommonFunc.getComponentRect('RowMarPad_TextMarPad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('RowMarPad_TextMarPad3');
      let rowContainer: RectValue = CommonFunc.getComponentRect('RowMarPad_TextMarPad_Container01');
      let columnContainer: RectValue = CommonFunc.getComponentRect('Column_RowMarPad_TextMarPad_Container01');
      let rowContainerStrJson = inspector.getInspectorByKey('RowMarPad_TextMarPad_Container01');

  let obj = JSON.parseJsonElement(rowContainerStrJson);
  expect(obj.getString('$type')).assertEqual('Row');

      expect(Math.floor(Math.abs((firstText.bottom - firstText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.bottom - secondText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - thirdText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.right - firstText.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((secondText.right - secondText.left) - (thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((firstText.top - rowContainer.top) - (rowContainer.bottom - firstText.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((secondText.top - rowContainer.top) - (rowContainer.bottom - secondText.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((thirdText.top - rowContainer.top) - (rowContainer.bottom - thirdText.bottom))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((rowContainer.top - columnContainer.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(5)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((firstText.top - firstTextTop) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(5)))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((firstText.left - rowContainer.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.left - firstText.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.left - secondText.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))) <= 1).assertTrue();

      expect(Math.floor(Math.abs(rowContainer.right - thirdText.right)) <= 2).assertTrue();
      console.info('[testRowMarPadTextMarPad_static_03] END');
      done();
    });
  })
}
