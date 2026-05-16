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

export default function Stack_Position_Change() {
  describe('Stack_Position_ChangeTest', () => {
    beforeAll(async () => {
      console.info("Stack_Position_ChangeTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility");

    })
    beforeEach(async (): Promise<void> => {
      console.info("Stack_Position_ChangeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Stack/StackItem_change/stack_position_change",
      };
      try {
        const routerInstance = AppStorage.get<Router>("router")
        // routerInstance?.clear();
        let pages = routerInstance?.getState();
        console.info("get Stack_Position_Change state pages:" + JSON.stringify(pages));
        if (!("stack_position_change" == pages?.name)) {
          console.info("get Stack_Position_Change pages.name:" + JSON.stringify(pages?.name));
          routerInstance?.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Stack_Position_Change page error " + JSON.stringify(err));
        expect().assertFail();
      }
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Stack_Position_Change after each called")
    });
    
    



    /**
     * @tc.number   testStackPositionChangeWithAlignmentTopStart_static
     * @tc.name     testStackPositionChangeWithAlignmentTopStart_static
     * @tc.desc     testStackPositionChangeWithAlignmentTopStart_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackPositionChangeWithAlignmentTopStart_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackPositionChangeWithAlignmentTopStart_static] START');
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_Position_Change_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart');
      let Stack_Position_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_011');
      let Stack_Position_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_012');
      let Stack_Position_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_01');
      expect(Math.abs((Stack_Position_Change_012.left) - (Stack_Position_Change_01.left)) <= 1).assertTrue();
      expect(Math.abs((Stack_Position_Change_012.top) - (Stack_Position_Change_01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.top - Stack_Position_Change_01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.left - Stack_Position_Change_01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.bottom - Stack_Position_Change_011.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.bottom - Stack_Position_Change_012.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.right - Stack_Position_Change_011.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.right - Stack_Position_Change_012.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackPositionChangeWithAlignmentTopStart_static] END');
      done();
    });
    
    



    /**
     * @tc.number   testStackPositionChangeWithAlignmentTop_static
     * @tc.name     testStackPositionChangeWithAlignmentTop_static
     * @tc.desc     testStackPositionChangeWithAlignmentTop_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackPositionChangeWithAlignmentTop_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackPositionChangeWithAlignmentTop_static] START');
      // globalThis.value.message.notify({
      //   name: 'addAlignContent', value: Alignment.Top
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_Position_Change_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top');
      let Stack_Position_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_011');
      let Stack_Position_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_012');
      let Stack_Position_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_01');
      expect(Math.abs((Stack_Position_Change_012.top) - (Stack_Position_Change_01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.left - Stack_Position_Change_01.left)) - (Math.round(Stack_Position_Change_01.right - Stack_Position_Change_012.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.top - Stack_Position_Change_01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.left - Stack_Position_Change_01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.bottom - Stack_Position_Change_011.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.bottom - Stack_Position_Change_012.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.right - Stack_Position_Change_011.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.right - Stack_Position_Change_012.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackPositionChangeWithAlignmentTop_static] END');
      done();
    });
    
    



    /**
     * @tc.number   testStackPositionChangeWithAlignmentTopEnd_static
     * @tc.name     testStackPositionChangeWithAlignmentTopEnd_static
     * @tc.desc     testStackPositionChangeWithAlignmentTopEnd_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackPositionChangeWithAlignmentTopEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackPositionChangeWithAlignmentTopEnd_static] START');
      // globalThis.value.message.notify({
      //   name: 'addAlignContent', value: Alignment.TopEnd
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_Position_Change_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd');
      let Stack_Position_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_011');
      let Stack_Position_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_012');
      let Stack_Position_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_01');
      expect(Math.abs((Stack_Position_Change_012.right) - (Stack_Position_Change_01.right)) <= 1).assertTrue();
      expect(Math.abs((Stack_Position_Change_012.top) - (Stack_Position_Change_01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.top - Stack_Position_Change_01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.left - Stack_Position_Change_01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.bottom - Stack_Position_Change_011.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.bottom - Stack_Position_Change_012.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.right - Stack_Position_Change_011.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.right - Stack_Position_Change_012.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackPositionChangeWithAlignmentTopEnd_static] END');
      done();
    });
    
    



    /**
     * @tc.number   testStackPositionChangeWithAlignmentStart_static
     * @tc.name     testStackPositionChangeWithAlignmentStart_static
     * @tc.desc     testStackPositionChangeWithAlignmentStart_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackPositionChangeWithAlignmentStart_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackPositionChangeWithAlignmentStart_static] START');
      // globalThis.value.message.notify({
      //   name: 'addAlignContent', value: Alignment.Start
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_Position_Change_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start');
      let Stack_Position_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_011');
      let Stack_Position_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_012');
      let Stack_Position_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_01');
      expect(Math.abs((Stack_Position_Change_012.left) - (Stack_Position_Change_01.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.top - Stack_Position_Change_01.top)) - (Math.round(Stack_Position_Change_01.bottom - Stack_Position_Change_012.bottom))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.top - Stack_Position_Change_01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.left - Stack_Position_Change_01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.bottom - Stack_Position_Change_011.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.bottom - Stack_Position_Change_012.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.right - Stack_Position_Change_011.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.right - Stack_Position_Change_012.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackPositionChangeWithAlignmentStart_static] END');
      done();
    });
    
    



    /**
     * @tc.number   testStackPositionChangeWithAlignmentCenter_static
     * @tc.name     testStackPositionChangeWithAlignmentCenter_static
     * @tc.desc     testStackPositionChangeWithAlignmentCenter_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackPositionChangeWithAlignmentCenter_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackPositionChangeWithAlignmentCenter_static] START');
      // globalThis.value.message.notify({
      //   name: 'addAlignContent', value: Alignment.Center
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_Position_Change_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center');
      let Stack_Position_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_011');
      let Stack_Position_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_012');
      let Stack_Position_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_01');
      expect(Math.abs((Math.round(Stack_Position_Change_012.left - Stack_Position_Change_01.left)) - (Math.round(Stack_Position_Change_01.right - Stack_Position_Change_012.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.top - Stack_Position_Change_01.top)) - (Math.round(Stack_Position_Change_01.bottom - Stack_Position_Change_012.bottom))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.top - Stack_Position_Change_01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.left - Stack_Position_Change_01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.bottom - Stack_Position_Change_011.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.bottom - Stack_Position_Change_012.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.right - Stack_Position_Change_011.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.right - Stack_Position_Change_012.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackPositionChangeWithAlignmentCenter_static] END');
      done();
    });
    
    



    /**
     * @tc.number  testStackPositionChangeWithAlignmentEnd_static
     * @tc.name     testStackPositionChangeWithAlignmentEnd_static
     * @tc.desc     testStackPositionChangeWithAlignmentEnd_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackPositionChangeWithAlignmentEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackPositionChangeWithAlignmentEnd_static] START');
      // globalThis.value.message.notify({
      //   name: 'addAlignContent', value: Alignment.End
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.End
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_Position_Change_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End');
      let Stack_Position_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_011');
      let Stack_Position_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_012');
      let Stack_Position_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_01');
      expect(Math.abs((Stack_Position_Change_012.right) - (Stack_Position_Change_01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.top - Stack_Position_Change_01.top)) - (Math.round(Stack_Position_Change_01.bottom - Stack_Position_Change_012.bottom))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.top - Stack_Position_Change_01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.left - Stack_Position_Change_01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.bottom - Stack_Position_Change_011.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.bottom - Stack_Position_Change_012.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.right - Stack_Position_Change_011.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.right - Stack_Position_Change_012.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackPositionChangeWithAlignmentEnd_static] END');
      done();
    });
    
    



    /**
     * @tc.number  testStackPositionChangeWithAlignmentBottomStart_static
     * @tc.name     testStackPositionChangeWithAlignmentBottomStart_static
     * @tc.desc     testStackPositionChangeWithAlignmentBottomStart_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackPositionChangeWithAlignmentBottomStart_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackPositionChangeWithAlignmentBottomStart_static] START');
      // globalThis.value.message.notify({
      //   name: 'addAlignContent', value: Alignment.BottomStart
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_Position_Change_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart');
      let Stack_Position_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_011');
      let Stack_Position_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_012');
      let Stack_Position_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_01');
      expect(Math.abs((Stack_Position_Change_012.left) - (Stack_Position_Change_01.left)) <= 1).assertTrue();
      expect(Math.abs((Stack_Position_Change_012.bottom) - (Stack_Position_Change_01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.top - Stack_Position_Change_01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.left - Stack_Position_Change_01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.bottom - Stack_Position_Change_011.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.bottom - Stack_Position_Change_012.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.right - Stack_Position_Change_011.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.right - Stack_Position_Change_012.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackPositionChangeWithAlignmentBottomStart_static] END');
      done();
    });
    
    



    /**
     * @tc.number  testStackPositionChangeWithAlignmentBottom_static
     * @tc.name     testStackPositionChangeWithAlignmentBottom_static
     * @tc.desc     testStackPositionChangeWithAlignmentBottom_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackPositionChangeWithAlignmentBottom_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackPositionChangeWithAlignmentBottom_static] START');
      // globalThis.value.message.notify({
      //   name: 'addAlignContent', value: Alignment.Bottom
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_Position_Change_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom');
      let Stack_Position_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_011');
      let Stack_Position_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_012');
      let Stack_Position_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_01');
      expect(Math.abs((Stack_Position_Change_012.bottom) - (Stack_Position_Change_01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.left - Stack_Position_Change_01.left)) - (Math.round(Stack_Position_Change_01.right - Stack_Position_Change_012.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.top - Stack_Position_Change_01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.left - Stack_Position_Change_01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.bottom - Stack_Position_Change_011.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.bottom - Stack_Position_Change_012.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.right - Stack_Position_Change_011.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.right - Stack_Position_Change_012.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackPositionChangeWithAlignmentBottom_static] END');
      done();
    });
    
    



    /**
     * @tc.number   testStackPositionChangeWithAlignmentBottomEnd_static
     * @tc.name     testStackPositionChangeWithAlignmentBottomEnd_static
     * @tc.desc     testStackPositionChangeWithAlignmentBottomEnd_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackPositionChangeWithAlignmentBottomEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackPositionChangeWithAlignmentBottomEnd_static] START');
      // globalThis.value.message.notify({
      //   name: 'addAlignContent', value: Alignment.BottomEnd
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_Position_Change_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd');
      let Stack_Position_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_011');
      let Stack_Position_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_012');
      let Stack_Position_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_01');
      expect(Math.abs((Stack_Position_Change_012.bottom) - (Stack_Position_Change_01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Stack_Position_Change_012.right) - (Stack_Position_Change_01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.top - Stack_Position_Change_01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.left - Stack_Position_Change_01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.bottom - Stack_Position_Change_011.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.bottom - Stack_Position_Change_012.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.right - Stack_Position_Change_011.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.right - Stack_Position_Change_012.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackPositionChangeWithAlignmentBottomEnd_static] END');
      done();
    });
  })
}
