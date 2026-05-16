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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium';
import router from '@ohos.router';
import {Alignment} from '@ohos.arkui.component'
import  CommonFunc from '../../../../ets/MainAbility/common/Common';
import  RectValue from '../../../../ets/MainAbility/common/Rect';
import {MessageManager} from '../../../../ets/MainAbility/common/MessageManager'
// import screenshot from '@ohos.screenshot';
import image from '@ohos.multimedia.image';
import window from '@ohos.window';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {  Router, UIContext } from '@ohos.arkui.UIContext';
import { BusinessError } from '@ohos.base';
import { UtilsTest,startAbility } from '../../Util.test'
import inspector from '@ohos.arkui.inspector';

export default function Stack_Offset_Change() {
  describe('Stack_Offset_ChangeTest', () => {
    beforeAll(async () => {
      console.info("Stack_Offset_ChangeTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility");

    })
    beforeEach(async (): Promise<void> => {
      console.info("Stack_Offset_ChangeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Stack/StackItem_change/stack_offset_change",
      };
      try {
        const routerInstance = AppStorage.get<Router>("router")
        routerInstance?.clear();
        let pages = routerInstance?.getState();
        console.info("get Stack_Offset_Change state pages:" + JSON.stringify(pages));
        if (!("stack_offset_change" == pages?.name)) {
          console.info("get Stack_Offset_Change pages.name:" + JSON.stringify(pages?.name));
          routerInstance?.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Stack_Offset_Change page error " + JSON.stringify(err));
        expect().assertFail();
      }
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Stack_Offset_Change after each called")
    });
    
    



    /**
     * @tc.number   testStackOffsetChangeWithAlignmentTopStart_static
     * @tc.name     testStackOffsetChangeWithAlignmentTopStart_static
     * @tc.desc     testStackOffsetChangeWithAlignmentTopStart_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackOffsetChangeWithAlignmentTopStart_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackOffsetChangeWithAlignmentTopStart_static] START');
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_Offset_Change_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart');
      let Stack_Offset_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_011');
      let Stack_Offset_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_012');
      let Stack_Offset_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_01');
      expect(Math.abs((Stack_Offset_Change_012.left) - (Stack_Offset_Change_01.left)) <= 1).assertTrue();
      expect(Math.abs((Stack_Offset_Change_012.top) - (Stack_Offset_Change_01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.top - Stack_Offset_Change_01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.left - Stack_Offset_Change_01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.bottom - Stack_Offset_Change_011.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.bottom - Stack_Offset_Change_012.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.right - Stack_Offset_Change_011.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.right - Stack_Offset_Change_012.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackOffsetChangeWithAlignmentTopStart_static] END');
      done();
    });
    
    



    /**
     * @tc.number   testStackOffsetChangeWithAlignmentTop_static
     * @tc.name     testStackOffsetChangeWithAlignmentTop_static
     * @tc.desc     testStackOffsetChangeWithAlignmentTop_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackOffsetChangeWithAlignmentTop_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackOffsetChangeWithAlignmentTop_static] START');
      // globalThis.value.message.notify({
      //   name: 'addAlignContent', value: Alignment.Top
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_Offset_Change_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top');
      let Stack_Offset_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_011');
      let Stack_Offset_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_012');
      let Stack_Offset_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_01');
      expect(Math.abs((Stack_Offset_Change_012.top) - (Stack_Offset_Change_01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.left - Stack_Offset_Change_01.left)) - (Math.round(Stack_Offset_Change_01.right - Stack_Offset_Change_012.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.top - Stack_Offset_Change_01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.left - Stack_Offset_Change_01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(70)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.bottom - Stack_Offset_Change_011.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.bottom - Stack_Offset_Change_012.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.right - Stack_Offset_Change_011.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.right - Stack_Offset_Change_012.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackOffsetChangeWithAlignmentTop_static] END');
      done();
    });
    
    



    /**
     * @tc.number   testStackOffsetChangeWithAlignmentTopEnd_static
     * @tc.name     testStackOffsetChangeWithAlignmentTopEnd_static
     * @tc.desc     testStackOffsetChangeWithAlignmentTopEnd_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackOffsetChangeWithAlignmentTopEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackOffsetChangeWithAlignmentTopEnd_static] START');
      // globalThis.value.message.notify({
      //   name: 'addAlignContent', value: Alignment.TopEnd
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_Offset_Change_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd');
      let Stack_Offset_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_011');
      let Stack_Offset_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_012');
      let Stack_Offset_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_01');
      expect(Math.abs((Stack_Offset_Change_012.right) - (Stack_Offset_Change_01.right)) <= 1).assertTrue();
      expect(Math.abs((Stack_Offset_Change_012.top) - (Stack_Offset_Change_01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.top - Stack_Offset_Change_01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.right - Stack_Offset_Change_01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.bottom - Stack_Offset_Change_011.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.bottom - Stack_Offset_Change_012.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.right - Stack_Offset_Change_011.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.right - Stack_Offset_Change_012.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackOffsetChangeWithAlignmentTopEnd_static] END');
      done();
    });
    
    



    /**
     * @tc.number   testStackOffsetChangeWithAlignmentStart_static
     * @tc.name     testStackOffsetChangeWithAlignmentStart_static
     * @tc.desc     testStackOffsetChangeWithAlignmentStart_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackOffsetChangeWithAlignmentStart_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackOffsetChangeWithAlignmentStart_static] START');
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_Offset_Change_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start');
      let Stack_Offset_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_011');
      let Stack_Offset_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_012');
      let Stack_Offset_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_01');
      expect(Math.abs((Stack_Offset_Change_012.left) - (Stack_Offset_Change_01.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.top - Stack_Offset_Change_01.top)) - (Math.round(Stack_Offset_Change_01.bottom - Stack_Offset_Change_012.bottom))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.top - Stack_Offset_Change_01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(70)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.left - Stack_Offset_Change_01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.bottom - Stack_Offset_Change_011.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.bottom - Stack_Offset_Change_012.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.right - Stack_Offset_Change_011.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.right - Stack_Offset_Change_012.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackOffsetChangeWithAlignmentStart_static] END');
      done();
    });
    
    



    /**
     * @tc.number  testStackOffsetChangeWithAlignmentCenter_static
     * @tc.name     testStackOffsetChangeWithAlignmentCenter_static
     * @tc.desc     testStackOffsetChangeWithAlignmentCenter_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackOffsetChangeWithAlignmentCenter_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackOffsetChangeWithAlignmentCenter_static] START');
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_Offset_Change_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center');
      let Stack_Offset_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_011');
      let Stack_Offset_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_012');
      let Stack_Offset_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_01');
      expect(Math.abs((Math.round(Stack_Offset_Change_012.left - Stack_Offset_Change_01.left)) - (Math.round(Stack_Offset_Change_01.right - Stack_Offset_Change_012.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.top - Stack_Offset_Change_01.top)) - (Math.round(Stack_Offset_Change_01.bottom - Stack_Offset_Change_012.bottom))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.top - Stack_Offset_Change_01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(70)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.left - Stack_Offset_Change_01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(70)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.bottom - Stack_Offset_Change_011.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.bottom - Stack_Offset_Change_012.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.right - Stack_Offset_Change_011.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.right - Stack_Offset_Change_012.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackOffsetChangeWithAlignmentCenter_static] END');
      done();
    });
    
    



    /**
     * @tc.number  testStackOffsetChangeWithAlignmentEnd_static
     * @tc.name     testStackOffsetChangeWithAlignmentEnd_static
     * @tc.desc     testStackOffsetChangeWithAlignmentEnd_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackOffsetChangeWithAlignmentEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackOffsetChangeWithAlignmentEnd_static] START');
      // globalThis.value.message.notify({
      //   name: 'addAlignContent', value: Alignment.End
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.End
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_Offset_Change_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End');
      let Stack_Offset_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_011');
      let Stack_Offset_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_012');
      let Stack_Offset_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_01');
      expect(Math.abs((Stack_Offset_Change_012.right) - (Stack_Offset_Change_01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.top - Stack_Offset_Change_01.top)) - (Math.round(Stack_Offset_Change_01.bottom - Stack_Offset_Change_012.bottom))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.top - Stack_Offset_Change_01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(70)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.right - Stack_Offset_Change_01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.bottom - Stack_Offset_Change_011.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.bottom - Stack_Offset_Change_012.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.right - Stack_Offset_Change_011.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.right - Stack_Offset_Change_012.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackOffsetChangeWithAlignmentEnd_static] END');
      done();
    });
    
    



    /**
     * @tc.number  testStackOffsetChangeWithAlignmentBottomStart_static
     * @tc.name     testStackOffsetChangeWithAlignmentBottomStart_static
     * @tc.desc     testStackOffsetChangeWithAlignmentBottomStart_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackOffsetChangeWithAlignmentBottomStart_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackOffsetChangeWithAlignmentBottomStart_static] START');
      // globalThis.value.message.notify({
      //   name: 'addAlignContent', value: Alignment.BottomStart
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_Offset_Change_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart');
      let Stack_Offset_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_011');
      let Stack_Offset_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_012');
      let Stack_Offset_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_01');
      expect(Math.abs((Stack_Offset_Change_012.left) - (Stack_Offset_Change_01.left)) <= 1).assertTrue();
      expect(Math.abs((Stack_Offset_Change_012.bottom) - (Stack_Offset_Change_01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.bottom - Stack_Offset_Change_01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.left - Stack_Offset_Change_01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.bottom - Stack_Offset_Change_011.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.bottom - Stack_Offset_Change_012.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.right - Stack_Offset_Change_011.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.right - Stack_Offset_Change_012.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackOffsetChangeWithAlignmentBottomStart_static] END');
      done();
    });
    
    



    /**
     * @tc.number  testStackOffsetChangeWithAlignmentBottom_static
     * @tc.name     testStackOffsetChangeWithAlignmentBottom_static
     * @tc.desc     testStackOffsetChangeWithAlignmentBottom_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackOffsetChangeWithAlignmentBottom_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackOffsetChangeWithAlignmentBottom_static] START');
      // globalThis.value.message.notify({
      //   name: 'addAlignContent', value: Alignment.Bottom
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_Offset_Change_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom');
      let Stack_Offset_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_011');
      let Stack_Offset_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_012');
      let Stack_Offset_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_01');
      expect(Math.abs((Stack_Offset_Change_012.bottom) - (Stack_Offset_Change_01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.left - Stack_Offset_Change_01.left)) - (Math.round(Stack_Offset_Change_01.right - Stack_Offset_Change_012.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.bottom - Stack_Offset_Change_01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.left - Stack_Offset_Change_01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(70)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.bottom - Stack_Offset_Change_011.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.bottom - Stack_Offset_Change_012.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.right - Stack_Offset_Change_011.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.right - Stack_Offset_Change_012.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackOffsetChangeWithAlignmentBottom_static] END');
      done();
    });
    
    



    /**
     * @tc.number  testStackOffsetChangeWithAlignmentBottomEnd_static
     * @tc.name     testStackOffsetChangeWithAlignmentBottomEnd_static
     * @tc.desc     testStackOffsetChangeWithAlignmentBottomEnd_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackOffsetChangeWithAlignmentBottomEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackOffsetChangeWithAlignmentBottomEnd_static] START');
      // globalThis.value.message.notify({
      //   name: 'addAlignContent', value: Alignment.BottomEnd
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_Offset_Change_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd');
      let Stack_Offset_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_011');
      let Stack_Offset_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_012');
      let Stack_Offset_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_01');
      expect(Math.abs((Stack_Offset_Change_012.bottom) - (Stack_Offset_Change_01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Stack_Offset_Change_012.right) - (Stack_Offset_Change_01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.bottom - Stack_Offset_Change_01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.right - Stack_Offset_Change_01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.bottom - Stack_Offset_Change_011.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.bottom - Stack_Offset_Change_012.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.right - Stack_Offset_Change_011.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.right - Stack_Offset_Change_012.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackOffsetChangeWithAlignmentBottomEnd_static] END');
      done();
    });
  })
}
