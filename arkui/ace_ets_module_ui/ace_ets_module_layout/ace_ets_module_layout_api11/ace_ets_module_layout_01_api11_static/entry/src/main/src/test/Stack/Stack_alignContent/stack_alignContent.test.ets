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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium';
import router from '@ohos.router';
import {Alignment} from '@ohos.arkui.component'
import events_emitter from '@ohos.events.emitter'
import { UtilsTest,startAbility } from '../../Util.test'
import { AppStorage } from '@ohos.arkui.stateManagement';
import {  Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import { BusinessError } from '@ohos.base';
import {MessageManager} from '../../../../ets/MainAbility/common/MessageManager'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import RectValue from '../../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function Stack_AlignContent() {
  describe('Stack_AlignContent_Test',  ()=> {
    beforeAll(async () => {
      console.info("Stack_AlignContent_Test beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility");

    })
    beforeEach(async (): Promise<void> => {
      console.info("Stack_AlignContent_Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Stack/Stack_alignContent/stack_alignContent",
      };
      try {
        const routerInstance = AppStorage.get<Router>("router")
        routerInstance?.clear();
        let pages = routerInstance?.getState();
        console.info("get Stack_AlignContent state pages:" + JSON.stringify(pages));
        if (!("stack_alignContent" == pages?.name)) {
          console.info("get stack_alignContent pages.name:" + JSON.stringify(pages?.name));
          routerInstance?.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push stack_alignContent page error " + JSON.stringify(err));
        expect().assertFail();
      }
    });
    afterEach(async  () =>{
      await CommonFunc.sleep(2000);
      console.info("stack_alignContent after each called")
    });
    
    



    /**
     * @tc.number   testStackAlignContentNotConfig_static
     * @tc.name     testStackAlignContentNotConfig_static
     * @tc.desc     testStackAlignContentNotConfig_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignContentNotConfig_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackAlignContentNotConfig_static] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Stack_AlignContent_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center');
      let stack_alignContent_011:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_011');
      let stack_alignContent_012:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_012');
      let stack_alignContent_013:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_013');
      let stack_alignContent_01:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_01');
      expect(Math.abs((stack_alignContent_011.left - stack_alignContent_01.left) - (stack_alignContent_01.right - stack_alignContent_011.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_012.left - stack_alignContent_01.left) - (stack_alignContent_01.right - stack_alignContent_012.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_013.left - stack_alignContent_01.left) - (stack_alignContent_01.right - stack_alignContent_013.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_011.top - stack_alignContent_01.top) - (stack_alignContent_01.bottom - stack_alignContent_011.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_012.top - stack_alignContent_01.top) - (stack_alignContent_01.bottom - stack_alignContent_012.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_013.top - stack_alignContent_01.top) - (stack_alignContent_01.bottom - stack_alignContent_013.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_011.bottom - stack_alignContent_011.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_012.bottom - stack_alignContent_012.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_013.bottom - stack_alignContent_013.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_011.right - stack_alignContent_011.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_012.right - stack_alignContent_012.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_013.right - stack_alignContent_013.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackAlignContentNotConfig_static] END');
      done();
    });
    
    



    /**
     * @tc.number   testStackAlignContentTopStart_static
     * @tc.name     testStackAlignContentTopStart_static
     * @tc.desc     testStackAlignContentTopStart_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignContentTopStart_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackAlignContentTopStart_static] START');
      //
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_AlignContent_02');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart');
      let stack_alignContent_021:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_021');
      let stack_alignContent_022:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_022');
      let stack_alignContent_023:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_023');
      let stack_alignContent_02:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_02');
      expect(Math.abs((stack_alignContent_021.left) - (stack_alignContent_02.left)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.left) - (stack_alignContent_02.left)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.left) - (stack_alignContent_02.left)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_021.top) - (stack_alignContent_02.top)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.top) - (stack_alignContent_02.top)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.top) - (stack_alignContent_02.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.bottom - stack_alignContent_021.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.bottom - stack_alignContent_022.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.bottom - stack_alignContent_023.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.right - stack_alignContent_021.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.right - stack_alignContent_022.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.right - stack_alignContent_023.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackAlignContentTopStart_static] END');
      done();
    });
    
    



    /**
     * @tc.number   testStackAlignContentTop_static
     * @tc.name     testStackAlignContentTop_static
     * @tc.desc     testStackAlignContentTop_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignContentTop_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackAlignContentTop_static] START');
      // globalThis.value.message.notify({ name: 'addAlignContent', value: Alignment.Top });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_AlignContent_02');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top');
      let stack_alignContent_021:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_021');
      let stack_alignContent_022:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_022');
      let stack_alignContent_023:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_023');
      let stack_alignContent_02:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_02');
      expect(Math.abs((stack_alignContent_021.left - stack_alignContent_02.left) - (stack_alignContent_02.right - stack_alignContent_021.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.left - stack_alignContent_02.left) - (stack_alignContent_02.right - stack_alignContent_022.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.left - stack_alignContent_02.left) - (stack_alignContent_02.right - stack_alignContent_023.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_021.top) - (stack_alignContent_02.top)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.top) - (stack_alignContent_02.top)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.top) - (stack_alignContent_02.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.bottom - stack_alignContent_021.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.bottom - stack_alignContent_022.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.bottom - stack_alignContent_023.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.right - stack_alignContent_021.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.right - stack_alignContent_022.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.right - stack_alignContent_023.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackAlignContentTop_static] END');
      done();
    });
    
    



    /**
     * @tc.number  testStackAlignContentTopEnd_static
     * @tc.name     testStackAlignContentTopEnd_static
     * @tc.desc     testStackAlignContentTopEnd_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignContentTopEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackAlignContentTopEnd_static] START');
      // globalThis.value.message.notify({ name: 'addAlignContent', value: Alignment.TopEnd });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_AlignContent_02');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd');
      let stack_alignContent_021:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_021');
      let stack_alignContent_022:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_022');
      let stack_alignContent_023:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_023');
      let stack_alignContent_02:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_02');
      expect(Math.abs((stack_alignContent_021.top) - (stack_alignContent_02.top)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.top) - (stack_alignContent_02.top)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.top) - (stack_alignContent_02.top)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_021.right) - (stack_alignContent_02.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.right) - (stack_alignContent_02.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.right) - (stack_alignContent_02.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.bottom - stack_alignContent_021.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.bottom - stack_alignContent_022.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.bottom - stack_alignContent_023.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.right - stack_alignContent_021.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.right - stack_alignContent_022.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.right - stack_alignContent_023.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackAlignContentTopEnd_static] END');
      done();
    });
    
    



    /**
     * @tc.number  testStackAlignContentStart_static
     * @tc.name     testStackAlignContentStart_static
     * @tc.desc     testStackAlignContentStart_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignContentStart_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackAlignContentStart] START');
      // globalThis.value.message.notify({ name: 'addAlignContent', value: Alignment.Start });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_AlignContent_02');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start');
      let stack_alignContent_021:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_021');
      let stack_alignContent_022:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_022');
      let stack_alignContent_023:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_023');
      let stack_alignContent_02:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_02');
      expect(Math.abs((stack_alignContent_021.left) - (stack_alignContent_02.left)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.left) - (stack_alignContent_02.left)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.left) - (stack_alignContent_02.left)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_021.top - stack_alignContent_02.top) - (stack_alignContent_02.bottom - stack_alignContent_021.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.top - stack_alignContent_02.top) - (stack_alignContent_02.bottom - stack_alignContent_022.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.top - stack_alignContent_02.top) - (stack_alignContent_02.bottom - stack_alignContent_023.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.bottom - stack_alignContent_021.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.bottom - stack_alignContent_022.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.bottom - stack_alignContent_023.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.right - stack_alignContent_021.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.right - stack_alignContent_022.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.right - stack_alignContent_023.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackAlignContentStart] END');
      done();
    });
    
    



    /**
     * @tc.number  testStackAlignContentCenter_static
     * @tc.name     testStackAlignContentCenter_static
     * @tc.desc     testStackAlignContentCenter_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignContentCenter_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackAlignContentCenter] START');
      // globalThis.value.message.notify({ name: 'addAlignContent', value: Alignment.Center });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_AlignContent_02');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center');
      let stack_alignContent_021:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_021');
      let stack_alignContent_022:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_022');
      let stack_alignContent_023:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_023');
      let stack_alignContent_02:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_02');
      expect(Math.abs((stack_alignContent_021.left - stack_alignContent_02.left) - (stack_alignContent_02.right - stack_alignContent_021.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.left - stack_alignContent_02.left) - (stack_alignContent_02.right - stack_alignContent_022.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.left - stack_alignContent_02.left) - (stack_alignContent_02.right - stack_alignContent_023.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_021.top - stack_alignContent_02.top) - (stack_alignContent_02.bottom - stack_alignContent_021.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.top - stack_alignContent_02.top) - (stack_alignContent_02.bottom - stack_alignContent_022.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.top - stack_alignContent_02.top) - (stack_alignContent_02.bottom - stack_alignContent_023.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.bottom - stack_alignContent_021.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.bottom - stack_alignContent_022.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.bottom - stack_alignContent_023.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.right - stack_alignContent_021.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.right - stack_alignContent_022.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.right - stack_alignContent_023.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackAlignContentCenter] END');
      done();
    });
    
    



    /**
     * @tc.number  testStackAlignContentEnd_static
     * @tc.name     testStackAlignContentEnd_static
     * @tc.desc     testStackAlignContentEnd_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignContentEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackAlignContentEnd] START');
      // globalThis.value.message.notify({ name: 'addAlignContent', value: Alignment.End });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.End
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_AlignContent_02');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End');
      let stack_alignContent_021:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_021');
      let stack_alignContent_022:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_022');
      let stack_alignContent_023:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_023');
      let stack_alignContent_02:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_02');
      expect(Math.abs((stack_alignContent_021.right) - (stack_alignContent_02.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.right) - (stack_alignContent_02.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.right) - (stack_alignContent_02.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_021.top - stack_alignContent_02.top) - (stack_alignContent_02.bottom - stack_alignContent_021.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.top - stack_alignContent_02.top) - (stack_alignContent_02.bottom - stack_alignContent_022.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.top - stack_alignContent_02.top) - (stack_alignContent_02.bottom - stack_alignContent_023.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.bottom - stack_alignContent_021.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.bottom - stack_alignContent_022.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.bottom - stack_alignContent_023.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.right - stack_alignContent_021.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.right - stack_alignContent_022.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.right - stack_alignContent_023.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackAlignContentEnd] END');
      done();
    });
    
    



    /**
     * @tc.number  testStackAlignContentBottomStart_static
     * @tc.name     testStackAlignContentBottomStart_static
     * @tc.desc     testStackAlignContentBottomStart_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignContentBottomStart_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackAlignContentBottomStart] START');
      // globalThis.value.message.notify({ name: 'addAlignContent', value: Alignment.BottomStart });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_AlignContent_02');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart');
      let stack_alignContent_021:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_021');
      let stack_alignContent_022:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_022');
      let stack_alignContent_023:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_023');
      let stack_alignContent_02:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_02');
      expect(Math.abs((stack_alignContent_021.left) - (stack_alignContent_02.left)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.left) - (stack_alignContent_02.left)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.left) - (stack_alignContent_02.left)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_021.bottom) - (stack_alignContent_02.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.bottom) - (stack_alignContent_02.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.bottom) - (stack_alignContent_02.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.bottom - stack_alignContent_021.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.bottom - stack_alignContent_022.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.bottom - stack_alignContent_023.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.right - stack_alignContent_021.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.right - stack_alignContent_022.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.right - stack_alignContent_023.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackAlignContentBottomStart] END');
      done();
    });
    
    



    /**
     * @tc.number   testStackAlignContentBottom_static
     * @tc.name     testStackAlignContentBottom_static
     * @tc.desc     testStackAlignContentBottom_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignContentBottom_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackAlignContentBottom] START');
      // globalThis.value.message.notify({ name: 'addAlignContent', value: Alignment.Bottom });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_AlignContent_02');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom');
      let stack_alignContent_021:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_021');
      let stack_alignContent_022:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_022');
      let stack_alignContent_023:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_023');
      let stack_alignContent_02:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_02');
      expect(Math.abs((stack_alignContent_021.bottom) - (stack_alignContent_02.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.bottom) - (stack_alignContent_02.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.bottom) - (stack_alignContent_02.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_021.left - stack_alignContent_02.left) - (stack_alignContent_02.right - stack_alignContent_021.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.left - stack_alignContent_02.left) - (stack_alignContent_02.right - stack_alignContent_022.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.left - stack_alignContent_02.left) - (stack_alignContent_02.right - stack_alignContent_023.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.bottom - stack_alignContent_021.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.bottom - stack_alignContent_022.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.bottom - stack_alignContent_023.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.right - stack_alignContent_021.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.right - stack_alignContent_022.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.right - stack_alignContent_023.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackAlignContentBottom] END');
      done();
    });
    
    



    /**
     * @tc.number   testStackAlignContentBottomEnd_static
     * @tc.name     testStackAlignContentBottomEnd_static
     * @tc.desc     testStackAlignContentBottomEnd_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignContentBottomEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackAlignContentBottomEnd] START');
      // globalThis.value.message.notify({ name: 'addAlignContent', value: Alignment.BottomEnd });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_AlignContent_02');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd');
      let stack_alignContent_021:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_021');
      let stack_alignContent_022:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_022');
      let stack_alignContent_023:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_023');
      let stack_alignContent_02:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_02');
      expect(Math.abs((stack_alignContent_021.bottom) - (stack_alignContent_02.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.bottom) - (stack_alignContent_02.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.bottom) - (stack_alignContent_02.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_021.right) - (stack_alignContent_02.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.right) - (stack_alignContent_02.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.right) - (stack_alignContent_02.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.bottom - stack_alignContent_021.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.bottom - stack_alignContent_022.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.bottom - stack_alignContent_023.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.right - stack_alignContent_021.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.right - stack_alignContent_022.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.right - stack_alignContent_023.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackAlignContentBottomEnd] END');
      done();
    });
  })
}
