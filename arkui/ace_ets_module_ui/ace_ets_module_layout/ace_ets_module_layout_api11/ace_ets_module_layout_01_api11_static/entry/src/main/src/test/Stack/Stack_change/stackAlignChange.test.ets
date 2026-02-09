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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium/index';
import router from '@ohos.router';
import {Alignment} from '@ohos.arkui.component'
import events_emitter from '@ohos.events.emitter'
import { UtilsTest,startAbility } from '../../Util.test'
import { AppStorage } from '@ohos.arkui.stateManagement';
import {  Router, UIContext } from '@ohos.arkui.UIContext';
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

export default function stackAlignChange() {
  describe('stackAlignChangeTest', () => {
    beforeAll(async () => {
      console.info("stackAlignChangeTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility");

    })
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/Stack_change/stackAlignChange',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router")
        routerInstance?.clear();
        let pages = routerInstance?.getState();
        await CommonFunc.sleep(1000);
        console.info("get stackAlignChange state success " + JSON.stringify(pages));
        if (!("stackAlignChange" == pages?.name)) {
          console.info("get stackAlignChange state success " + JSON.stringify(pages?.name));
          routerInstance?.pushUrl(options)
        }
      } catch (err) {
        console.error("push stackAlignChange page error " + JSON.stringify(err));
      }
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("stackAlignChangeTop after each called");
    });


    
    



    /**
     * @tc.number   testStackAlignTopStartAlignmentTopStart_static_001
     * @tc.name     testStackAlignTopStartAlignmentTopStart_static_001
     * @tc.desc     testStackAlignTopStartAlignmentTopStart_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignTopStartAlignmentTopStart_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopStartAlignmentTopStart_static START');
     /* globalThis.value.message.notify({
        name: 'align', value: Alignment.TopStart
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopStart
      });*/
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.TopStart
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((stackTopStartKey.left) - (stackTopStartKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.left) - (stackTopStartKey02.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      console.info('new testStackAlignTopStartAlignmentTopStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignTopStartAlignmentTop_static_001
     * @tc.name     testStackAlignTopStartAlignmentTop_static_001
     * @tc.desc     testStackAlignTopStartAlignmentTop_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignTopStartAlignmentTop_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopStartAlignmentTop_static START');
      /*globalThis.value.message.notify({
        name: 'align', value: Alignment.TopStart
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Top
      });*/
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.TopStart
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      console.info('new testStackAlignTopStartAlignmentTop_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignTopStartAlignmentEnd_static_001
     * @tc.name     testStackAlignTopStartAlignmentEnd_static_001
     * @tc.desc     testStackAlignTopStartAlignmentEnd_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignTopStartAlignmentEnd_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopStartAlignmentEnd_static START');
      /*globalThis.value.message.notify({
        name: 'align', value: Alignment.TopStart
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });*/
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.TopStart
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      console.info('new testStackAlignTopStartAlignmentEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignTopStartAlignmentStart_static_001
     * @tc.name     testStackAlignTopStartAlignmentStart_static_001
     * @tc.desc     testStackAlignTopStartAlignmentStart_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignTopStartAlignmentStart_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopStartAlignmentStart_static START');
      /*globalThis.value.message.notify({
        name: 'align', value: Alignment.TopStart
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Start
      });*/
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.TopStart
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      console.info('new testStackAlignTopStartAlignmentStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignTopStartAlignmentCenter_static_001
     * @tc.name     testStackAlignTopStartAlignmentCenter_static_001
     * @tc.desc     testStackAlignTopStartAlignmentCenter_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignTopStartAlignmentCenter_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopStartAlignmentCenter_static START');
      /*globalThis.value.message.notify({
        name: 'align', value: Alignment.TopStart
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Center
      });*/
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.TopStart
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart")
      console.info('new testStackAlignTopStartAlignmentCenter_static END');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignTopStartAlignmentEnd_static_002
     * @tc.name     testStackAlignTopStartAlignmentEnd_static_002
     * @tc.desc     testStackAlignTopStartAlignmentEnd_static_002
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignTopStartAlignmentEnd_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopStartAlignmentEnd_static START');
      /*globalThis.value.message.notify({
        name: 'align', value: Alignment.TopStart
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.End
      });*/
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.TopStart
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      console.info('new testStackAlignTopStartAlignmentEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number  testStackAlignTopStartAlignmentBottomStart_static_001
     * @tc.name     testStackAlignTopStartAlignmentBottomStart_static_001
     * @tc.desc     testStackAlignTopStartAlignmentBottomStart_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignTopStartAlignmentBottomStart_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopStartAlignmentBottomStart_static START');
      /*globalThis.value.message.notify({
        name: 'align', value: Alignment.TopStart
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });*/
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.TopStart
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.top) - (stackTopStartKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.top) - (stackTopStartKey02.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((stackTopStartKey.left) - (stackTopStartKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.left) - (stackTopStartKey02.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      console.info('new testStackAlignTopStartAlignmentBottomStart_static END');
      done();
    });

    
    



    /**
     * @tc.number  testStackAlignTopStartAlignmentBottom_static_001
     * @tc.name     testStackAlignTopStartAlignmentBottom_static_001
     * @tc.desc     testStackAlignTopStartAlignmentBottom_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignTopStartAlignmentBottom_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopStartAlignmentBottom_static START');
      /*globalThis.value.message.notify({
        name: 'align', value: Alignment.TopStart
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Bottom
      });*/
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.TopStart
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.top) - (stackTopStartKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.top) - (stackTopStartKey02.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((stackTopStartKey.left) - (stackTopStartKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.left) - (stackTopStartKey02.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      console.info('new testStackAlignTopStartAlignmentBottom_static END');
      done();
    });

    
    



    /**
     * @tc.number  testStackAlignTopStartAlignmentBottomEnd_static_001
     * @tc.name     testStackAlignTopStartAlignmentBottomEnd_static_001
     * @tc.desc     testStackAlignTopStartAlignmentBottomEnd_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignTopStartAlignmentBottomEnd_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopStartAlignmentBottomEnd_static START');
      /*globalThis.value.message.notify({
        name: 'align', value: Alignment.TopStart
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });*/
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.TopStart
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.top) - (stackTopStartKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.top) - (stackTopStartKey02.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((stackTopStartKey.left) - (stackTopStartKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.left) - (stackTopStartKey02.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      console.info('new testStackAlignTopStartAlignmentBottomEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number  testStackAlignTopAlignmentTopStart_static_001
     * @tc.name     testStackAlignTopAlignmentTopStart_static_001
     * @tc.desc     testStackAlignTopAlignmentTopStart_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignTopAlignmentTopStart_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopAlignmentTopStart_static START');
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Top
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Top")
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackAlignTopAlignmentTopStart_static END');
      done();
    });

    
    



    /**
     * @tc.number  testStackAlignTopAlignmentTop_static_001
     * @tc.name     testStackAlignTopAlignmentTop_static_001
     * @tc.desc     testStackAlignTopAlignmentTop_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignTopAlignmentTop_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopAlignmentTop_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Top
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Top
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Top
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Top")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackAlignTopAlignmentTop_static END');
      done();
    });

    
    



    /**
     * @tc.number  testStackAlignTopAlignmentTopEnd_static_001
     * @tc.name     testStackAlignTopAlignmentTopEnd_static_001
     * @tc.desc     testStackAlignTopAlignmentTopEnd_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignTopAlignmentTopEnd_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopAlignmentTopEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Top
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.TopEnd
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Top
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Top")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackAlignTopAlignmentTopEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number  testStackAlignTopAlignmentStart_static_001
     * @tc.name     testStackAlignTopAlignmentStart_static_001
     * @tc.desc     testStackAlignTopAlignmentStart_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignTopAlignmentStart_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopAlignmentStart_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Top
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Start
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Top
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Top")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackAlignTopAlignmentStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignTopAlignmentCenter_static_001
     * @tc.name     testStackAlignTopAlignmentCenter_static_001
     * @tc.desc     testStackAlignTopAlignmentCenter_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignTopAlignmentCenter_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopAlignmentCenter_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Top
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Center
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Top
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Top")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackAlignTopAlignmentCenter_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignTopAlignmentEnd_static_001
     * @tc.name     testStackAlignTopAlignmentEnd_static_001
     * @tc.desc     testStackAlignTopAlignmentEnd_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignTopAlignmentEnd_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopAlignmentEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Top
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.End
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Top
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Top")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackAlignTopAlignmentEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignTopAlignmentBottomStart_static_001
     * @tc.name     testStackAlignTopAlignmentBottomStart_static_001
     * @tc.desc     testStackAlignTopAlignmentBottomStart_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignTopAlignmentBottomStart_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopAlignmentBottomStart_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Top
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.BottomStart
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Top
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Top")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackAlignTopAlignmentBottomStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignTopAlignmentBottom_static_001
     * @tc.name     testStackAlignTopAlignmentBottom_static_001
     * @tc.desc     testStackAlignTopAlignmentBottom_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignTopAlignmentBottom_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopAlignmentBottom_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Top
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Bottom
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Top
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Top")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackAlignTopAlignmentBottom_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignTopAlignmentBottomEnd_static_001
     * @tc.name     testStackAlignTopAlignmentBottomEnd_static_001
     * @tc.desc     testStackAlignTopAlignmentBottomEnd_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignTopAlignmentBottomEnd_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopAlignmentBottomEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Top
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.BottomEnd
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Top
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Top")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackAlignTopAlignmentBottomEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignTopEndAlignmentTopStart_static_001
     * @tc.name     testStackAlignTopEndAlignmentTopStart_static_001
     * @tc.desc     testStackAlignTopEndAlignmentTopStart_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignTopEndAlignmentTopStart_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopEndAlignmentTopStart_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.TopEnd
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.TopStart
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.TopEnd
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignTopEndAlignmentTopStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignTopEndAlignmentTop_static_001
     * @tc.name     testStackAlignTopEndAlignmentTop_static_001
     * @tc.desc     testStackAlignTopEndAlignmentTop_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignTopEndAlignmentTop_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopEndAlignmentTop_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.TopEnd
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Top
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.TopEnd
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignTopEndAlignmentTop_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignTopEndAlignmentTopEnd_static_001
     * @tc.name     testStackAlignTopEndAlignmentTopEnd_static_001
     * @tc.desc     testStackAlignTopEndAlignmentTopEnd_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignTopEndAlignmentTopEnd_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopEndAlignmentTopEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.TopEnd
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.TopEnd
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.TopEnd
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignTopEndAlignmentTopEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignTopEndAlignmentStart_static_001
     * @tc.name     testStackAlignTopEndAlignmentStart_static_001
     * @tc.desc     testStackAlignTopEndAlignmentStart_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignTopEndAlignmentStart_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopEndAlignmentStart_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.TopEnd
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Start
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.TopEnd
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignTopEndAlignmentStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignTopEndAlignmentCenter_static_001
     * @tc.name     testStackAlignTopEndAlignmentCenter_static_001
     * @tc.desc     testStackAlignTopEndAlignmentCenter_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignTopEndAlignmentCenter_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopEndAlignmentCenter_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.TopEnd
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Center
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.TopEnd
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignTopEndAlignmentCenter_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignTopEndAlignmentEnd_static_001
     * @tc.name     testStackAlignTopEndAlignmentEnd_static_001
     * @tc.desc     testStackAlignTopEndAlignmentEnd_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignTopEndAlignmentEnd_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopEndAlignmentEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.TopEnd
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.End
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.TopEnd
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignTopEndAlignmentEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignTopEndAlignmentBottomStart_static_001
     * @tc.name     testStackAlignTopEndAlignmentBottomStart_static_001
     * @tc.desc     testStackAlignTopEndAlignmentBottomStart_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignTopEndAlignmentBottomStart_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopEndAlignmentBottomStart_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.TopEnd
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.BottomStart
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.TopEnd
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.top) - (stackTopStartKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.top) - (stackTopStartKey02.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((stackTopStartKey.right) - (stackTopStartKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.right) - (stackTopStartKey02.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignTopEndAlignmentBottomStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignTopEndAlignmentBottom_static_001
     * @tc.name     testStackAlignTopEndAlignmentBottom_static_001
     * @tc.desc     testStackAlignTopEndAlignmentBottom_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignTopEndAlignmentBottom_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopEndAlignmentBottom_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.TopEnd
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Bottom
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.TopEnd
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.top) - (stackTopStartKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.top) - (stackTopStartKey02.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((stackTopStartKey.right) - (stackTopStartKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.right) - (stackTopStartKey02.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignTopEndAlignmentBottom_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignTopEndAlignmentBottomEnd_static_001
     * @tc.name     testStackAlignTopEndAlignmentBottomEnd_static_001
     * @tc.desc     testStackAlignTopEndAlignmentBottomEnd_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignTopEndAlignmentBottomEnd_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopEndAlignmentBottomEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.TopEnd
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.BottomEnd
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.TopEnd
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.top) - (stackTopStartKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.top) - (stackTopStartKey02.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((stackTopStartKey.right) - (stackTopStartKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.right) - (stackTopStartKey02.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignTopEndAlignmentBottomEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignStartAlignmentTopStart_static_001
     * @tc.name     testStackAlignStartAlignmentTopStart_static_001
     * @tc.desc     testStackAlignStartAlignmentTopStart_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignStartAlignmentTopStart_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignStartAlignmentTopStart_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Start
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.TopStart
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Start
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Start")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackAlignStartAlignmentTopStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignStartAlignmentTop_static_001
     * @tc.name     testStackAlignStartAlignmentTop_static_001
     * @tc.desc     testStackAlignStartAlignmentTop_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignStartAlignmentTop_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignStartAlignmentTop_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Start
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Top
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Start
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Start")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackAlignStartAlignmentTop_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignStartAlignmentTopEnd_static_001
     * @tc.name     testStackAlignStartAlignmentTopEnd_static_001
     * @tc.desc     testStackAlignStartAlignmentTopEnd_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignStartAlignmentTopEnd_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignStartAlignmentTopEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Start
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.TopEnd
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Start
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Start")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackAlignStartAlignmentTopEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignStartAlignmentStart_static_001
     * @tc.name     testStackAlignStartAlignmentStart_static_001
     * @tc.desc     testStackAlignStartAlignmentStart_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignStartAlignmentStart_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignStartAlignmentStart_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Start
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Start
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Start
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Start")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackAlignStartAlignmentStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignStartAlignmentCenter_static_001
     * @tc.name     testStackAlignStartAlignmentCenter_static_001
     * @tc.desc     testStackAlignStartAlignmentCenter_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignStartAlignmentCenter_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignStartAlignmentCenter_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Start
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Center
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Start
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Start")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackAlignStartAlignmentCenter_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignStartAlignmentEnd_static_001
     * @tc.name     testStackAlignStartAlignmentEnd_static_001
     * @tc.desc     testStackAlignStartAlignmentEnd_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignStartAlignmentEnd_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignStartAlignmentEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Start
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.End
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Start
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Start")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackAlignStartAlignmentEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignStartAlignmentBottomStart_static_001
     * @tc.name     testStackAlignStartAlignmentBottomStart_static_001
     * @tc.desc     testStackAlignStartAlignmentBottomStart_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignStartAlignmentBottomStart_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignStartAlignmentBottomStart_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Start
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.BottomStart
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Start
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Start")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackAlignStartAlignmentBottomStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignStartAlignmentBottom_static_001
     * @tc.name     testStackAlignStartAlignmentBottom_static_001
     * @tc.desc     testStackAlignStartAlignmentBottom_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignStartAlignmentBottom_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignStartAlignmentBottom_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Start
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Bottom
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Start
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Start")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackAlignStartAlignmentBottom_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignStartAlignmentBottomEnd_static_001
     * @tc.name     testStackAlignStartAlignmentBottomEnd_static_001
     * @tc.desc     testStackAlignStartAlignmentBottomEnd_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignStartAlignmentBottomEnd_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignStartAlignmentBottomEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Start
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.BottomEnd
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Start
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Start")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackAlignStartAlignmentBottomEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignCenterAlignmentTopStart_static_001
     * @tc.name     testStackAlignCenterAlignmentTopStart_static_001
     * @tc.desc     testStackAlignCenterAlignmentTopStart_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignCenterAlignmentTopStart_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignCenterAlignmentTopStart_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Center
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.TopStart
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Center
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(Math.round(stackTopStartKey01.top - stackTopStartKey.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.top - stackTopStartKey01.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.left - stackTopStartKey.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.left - stackTopStartKey01.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.right - stackTopStartKey01.right) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey02.right) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey01.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.right - stackTopStartKey02.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Center")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackAlignCenterAlignmentTopStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignCenterAlignmentTop_static_001
     * @tc.name     testStackAlignCenterAlignmentTop_static_001
     * @tc.desc     testStackAlignCenterAlignmentTop_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignCenterAlignmentTop_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignCenterAlignmentTop_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Center
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Top
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Center
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(Math.round(stackTopStartKey01.top - stackTopStartKey.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.top - stackTopStartKey01.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.left - stackTopStartKey.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.left - stackTopStartKey01.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.right - stackTopStartKey01.right) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey02.right) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey01.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.right - stackTopStartKey02.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Center")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackAlignCenterAlignmentTop_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignCenterAlignmentTopEnd_static_001
     * @tc.name     testStackAlignCenterAlignmentTopEnd_static_001
     * @tc.desc     testStackAlignCenterAlignmentTopEnd_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignCenterAlignmentTopEnd_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignCenterAlignmentTopEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Center
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.TopEnd
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Center
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(Math.round(stackTopStartKey01.top - stackTopStartKey.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.top - stackTopStartKey01.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.left - stackTopStartKey.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.left - stackTopStartKey01.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.right - stackTopStartKey01.right) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey02.right) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey01.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.right - stackTopStartKey02.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Center")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackAlignCenterAlignmentTopEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignCenterAlignmentStart_static_001
     * @tc.name     testStackAlignCenterAlignmentStart_static_001
     * @tc.desc     testStackAlignCenterAlignmentStart_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignCenterAlignmentStart_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignCenterAlignmentStart_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Center
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Start
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Center
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(Math.round(stackTopStartKey01.top - stackTopStartKey.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.top - stackTopStartKey01.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.left - stackTopStartKey.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.left - stackTopStartKey01.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.right - stackTopStartKey01.right) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey02.right) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey01.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.right - stackTopStartKey02.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Center")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackAlignCenterAlignmentStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignCenterAlignmentCenter_static_001
     * @tc.name     testStackAlignCenterAlignmentCenter_static_001
     * @tc.desc     testStackAlignCenterAlignmentCenter_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignCenterAlignmentCenter_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignCenterAlignmentCenter_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Center
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Center
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Center
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(Math.round(stackTopStartKey01.top - stackTopStartKey.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.top - stackTopStartKey01.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.left - stackTopStartKey.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.left - stackTopStartKey01.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.right - stackTopStartKey01.right) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey02.right) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey01.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.right - stackTopStartKey02.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Center")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackAlignCenterAlignmentCenter_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignCenterAlignmentEnd_static_001
     * @tc.name     testStackAlignCenterAlignmentEnd_static_001
     * @tc.desc     testStackAlignCenterAlignmentEnd_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignCenterAlignmentEnd_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignCenterAlignmentEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Center
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.End
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Center
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(Math.round(stackTopStartKey01.top - stackTopStartKey.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.top - stackTopStartKey01.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.left - stackTopStartKey.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.left - stackTopStartKey01.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.right - stackTopStartKey01.right) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey02.right) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey01.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.right - stackTopStartKey02.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Center")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackAlignCenterAlignmentEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignCenterAlignmentBottomStart_static_001
     * @tc.name     testStackAlignCenterAlignmentBottomStart_static_001
     * @tc.desc     testStackAlignCenterAlignmentBottomStart_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignCenterAlignmentBottomStart_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignCenterAlignmentBottomStart_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Center
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.BottomStart
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Center
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(Math.round(stackTopStartKey01.top - stackTopStartKey.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.top - stackTopStartKey01.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.left - stackTopStartKey.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.left - stackTopStartKey01.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.right - stackTopStartKey01.right) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey02.right) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey01.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.right - stackTopStartKey02.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Center")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackAlignCenterAlignmentBottomStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignCenterAlignmentBottom_static_001
     * @tc.name     testStackAlignCenterAlignmentBottom_static_001
     * @tc.desc     testStackAlignCenterAlignmentBottom_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignCenterAlignmentBottom_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignCenterAlignmentBottom_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Center
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Bottom
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Center
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(Math.round(stackTopStartKey01.top - stackTopStartKey.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.top - stackTopStartKey01.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.left - stackTopStartKey.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.left - stackTopStartKey01.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.right - stackTopStartKey01.right) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey02.right) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey01.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.right - stackTopStartKey02.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Center")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackAlignCenterAlignmentBottom_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignCenterAlignmentBottomEnd_static_001
     * @tc.name     testStackAlignCenterAlignmentBottomEnd_static_001
     * @tc.desc     testStackAlignCenterAlignmentBottomEnd_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignCenterAlignmentBottomEnd_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignCenterAlignmentBottomEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Center
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.BottomEnd
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Center
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(Math.round(stackTopStartKey01.top - stackTopStartKey.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.top - stackTopStartKey01.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.left - stackTopStartKey.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.left - stackTopStartKey01.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.right - stackTopStartKey01.right) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey02.right) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey01.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.right - stackTopStartKey02.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Center")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackAlignCenterAlignmentBottomEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignEndAlignmentTopStart_static_001
     * @tc.name     testStackAlignEndAlignmentTopStart_static_001
     * @tc.desc     testStackAlignEndAlignmentTopStart_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignEndAlignmentTopStart_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignEndAlignmentTopStart_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.End
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.TopStart
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.End
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.End")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackAlignEndAlignmentTopStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignEndAlignmentTop_static_001
     * @tc.name     testStackAlignEndAlignmentTop_static_001
     * @tc.desc     testStackAlignEndAlignmentTop_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignEndAlignmentTop_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignEndAlignmentTop_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.End
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Top
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.End
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.End")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackAlignEndAlignmentTop_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignEndAlignmentTopEnd_static_001
     * @tc.name     testStackAlignEndAlignmentTopEnd_static_001
     * @tc.desc     testStackAlignEndAlignmentTopEnd_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignEndAlignmentTopEnd_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignEndAlignmentTopEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.End
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.TopEnd
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.End
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.End")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackAlignEndAlignmentTopEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignEndAlignmentStart_static_001
     * @tc.name     testStackAlignEndAlignmentStart_static_001
     * @tc.desc     testStackAlignEndAlignmentStart_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignEndAlignmentStart_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignEndAlignmentStart_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.End
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Start
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.End
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.End")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackAlignEndAlignmentStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignEndAlignmentCenter_static_001
     * @tc.name     testStackAlignEndAlignmentCenter_static_001
     * @tc.desc     testStackAlignEndAlignmentCenter_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignEndAlignmentCenter_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignEndAlignmentCenter_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.End
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Center
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.End
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.End")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackAlignEndAlignmentCenter_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignEndAlignmentEnd_static_001
     * @tc.name     testStackAlignEndAlignmentEnd_static_001
     * @tc.desc     testStackAlignEndAlignmentEnd_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignEndAlignmentEnd_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignEndAlignmentEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.End
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.End
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.End
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.End")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackAlignEndAlignmentEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignEndAlignmentBottomStart_static_001
     * @tc.name     testStackAlignEndAlignmentBottomStart_static_001
     * @tc.desc     testStackAlignEndAlignmentBottomStart_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignEndAlignmentBottomStart_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignEndAlignmentBottomStart_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.End
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.BottomStart
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.End
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.End")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackAlignEndAlignmentBottomStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignEndAlignmentBottom_static_001
     * @tc.name     testStackAlignEndAlignmentBottom_static_001
     * @tc.desc     testStackAlignEndAlignmentBottom_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignEndAlignmentBottom_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignEndAlignmentBottom_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.End
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Bottom
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.End
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.End")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackAlignEndAlignmentBottom_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignEndAlignmentBottomEnd_static_001
     * @tc.name     testStackAlignEndAlignmentBottomEnd_static_001
     * @tc.desc     testStackAlignEndAlignmentBottomEnd_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignEndAlignmentBottomEnd_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignEndAlignmentBottomEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.End
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.BottomEnd
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.End
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.End")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackAlignEndAlignmentBottomEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignBottomStartAlignmentTopStart_static_001
     * @tc.name     testStackAlignBottomStartAlignmentTopStart_static_001
     * @tc.desc     testStackAlignBottomStartAlignmentTopStart_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignBottomStartAlignmentTopStart_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomStartAlignmentTopStart_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.BottomStart
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.TopStart
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.BottomStart
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue()

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignBottomStartAlignmentTopStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignBottomStartAlignmentTop_static_001
     * @tc.name     testStackAlignBottomStartAlignmentTop_static_001
     * @tc.desc     testStackAlignBottomStartAlignmentTop_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignBottomStartAlignmentTop_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomStartAlignmentTop_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.BottomStart
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Top
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.BottomStart
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignBottomStartAlignmentTop_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignBottomStartAlignmentTopEnd_static_001
     * @tc.name     testStackAlignBottomStartAlignmentTopEnd_static_001
     * @tc.desc     testStackAlignBottomStartAlignmentTopEnd_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignBottomStartAlignmentTopEnd_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomStartAlignmentTopEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.BottomStart
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.TopEnd
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.BottomStart
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackTopStartKey.bottom) - (stackTopStartKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.bottom) - (stackTopStartKey02.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignBottomStartAlignmentTopEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignBottomStartAlignmentStart_static_001
     * @tc.name     testStackAlignBottomStartAlignmentStart_static_001
     * @tc.desc     testStackAlignBottomStartAlignmentStart_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignBottomStartAlignmentStart_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomStartAlignmentStart_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.BottomStart
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Start
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.BottomStart
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignBottomStartAlignmentStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignBottomStartAlignmentCenter_static_001
     * @tc.name     testStackAlignBottomStartAlignmentCenter_static_001
     * @tc.desc     testStackAlignBottomStartAlignmentCenter_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignBottomStartAlignmentCenter_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomStartAlignmentCenter_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.BottomStart
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Center
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.BottomStart
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignBottomStartAlignmentCenter_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignBottomStartAlignmentEnd_static_001
     * @tc.name     testStackAlignBottomStartAlignmentEnd_static_001
     * @tc.desc     testStackAlignBottomStartAlignmentEnd_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignBottomStartAlignmentEnd_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomStartAlignmentEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.BottomStart
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.End
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.BottomStart
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignBottomStartAlignmentEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignBottomStartAlignmentBottomStart_static_001
     * @tc.name     testStackAlignBottomStartAlignmentBottomStart_static_001
     * @tc.desc     testStackAlignBottomStartAlignmentBottomStart_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignBottomStartAlignmentBottomStart_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomStartAlignmentBottomStart_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.BottomStart
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.BottomStart
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.BottomStart
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.left) - (stackTopStartKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.left) - (stackTopStartKey02.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackTopStartKey.bottom) - (stackTopStartKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.bottom) - (stackTopStartKey02.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignBottomStartAlignmentBottomStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignBottomStartAlignmentBottom_static_001
     * @tc.name     testStackAlignBottomStartAlignmentBottom_static_001
     * @tc.desc     testStackAlignBottomStartAlignmentBottom_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignBottomStartAlignmentBottom_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomStartAlignmentBottom_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.BottomStart
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Bottom
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.BottomStart
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.left) - (stackTopStartKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.left) - (stackTopStartKey02.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackTopStartKey.bottom) - (stackTopStartKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.bottom) - (stackTopStartKey02.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignBottomStartAlignmentBottom_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignBottomStartAlignmentBottomEnd_static_001
     * @tc.name     testStackAlignBottomStartAlignmentBottomEnd_static_001
     * @tc.desc     testStackAlignBottomStartAlignmentBottomEnd_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignBottomStartAlignmentBottomEnd_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomStartAlignmentBottomEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.BottomStart
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.BottomEnd
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.BottomStart
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.left) - (stackTopStartKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.left) - (stackTopStartKey02.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackTopStartKey.bottom) - (stackTopStartKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.bottom) - (stackTopStartKey02.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignBottomStartAlignmentBottomEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignBottomAlignmentTopStart_static_001
     * @tc.name     testStackAlignBottomAlignmentTopStart_static_001
     * @tc.desc     testStackAlignBottomAlignmentTopStart_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignBottomAlignmentTopStart_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomAlignmentTopStart_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Bottom
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.TopStart
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Bottom
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue()

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Bottom")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignBottomAlignmentTopStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignBottomAlignmentTop_static_001
     * @tc.name     testStackAlignBottomAlignmentTop_static_001
     * @tc.desc     testStackAlignBottomAlignmentTop_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignBottomAlignmentTop_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomAlignmentTop_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Bottom
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Top
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Bottom
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Bottom")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignBottomAlignmentTop_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignBottomAlignmentTopEnd_static_001
     * @tc.name     testStackAlignBottomAlignmentTopEnd_static_001
     * @tc.desc     testStackAlignBottomAlignmentTopEnd_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignBottomAlignmentTopEnd_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomAlignmentTopEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Bottom
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.TopEnd
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Bottom
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Bottom")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignBottomAlignmentTopEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignBottomAlignmentStart_static_001
     * @tc.name     testStackAlignBottomAlignmentStart_static_001
     * @tc.desc     testStackAlignBottomAlignmentStart_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignBottomAlignmentStart_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomAlignmentStart_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Bottom
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Start
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Bottom
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Bottom")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignBottomAlignmentStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignBottomAlignmentCenter_static_001
     * @tc.name     testStackAlignBottomAlignmentCenter_static_001
     * @tc.desc     testStackAlignBottomAlignmentCenter_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignBottomAlignmentCenter_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomAlignmentCenter_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Bottom
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Center
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Bottom
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Bottom")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignBottomAlignmentCenter_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignBottomAlignmentEnd_static_001
     * @tc.name     testStackAlignBottomAlignmentEnd_static_001
     * @tc.desc     testStackAlignBottomAlignmentEnd_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignBottomAlignmentEnd_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomAlignmentEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Bottom
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.End
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Bottom
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Bottom")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignBottomAlignmentEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignBottomAlignmentBottomStart_static_001
     * @tc.name     testStackAlignBottomAlignmentBottomStart_static_001
     * @tc.desc     testStackAlignBottomAlignmentBottomStart_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignBottomAlignmentBottomStart_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomAlignmentBottomStart_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Bottom
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.BottomStart
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Bottom
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Bottom")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignBottomAlignmentBottomStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignBottomAlignmentBottom_static_001
     * @tc.name     testStackAlignBottomAlignmentBottom_static_001
     * @tc.desc     testStackAlignBottomAlignmentBottom_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignBottomAlignmentBottom_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomAlignmentBottom_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Bottom
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Bottom
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Bottom
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Bottom")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignBottomAlignmentBottom_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignBottomAlignmentBottomEnd_static_001
     * @tc.name     testStackAlignBottomAlignmentBottomEnd_static_001
     * @tc.desc     testStackAlignBottomAlignmentBottomEnd_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignBottomAlignmentBottomEnd_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomAlignmentBottomEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.Bottom
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.BottomEnd
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.Bottom
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Bottom")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignBottomAlignmentBottomEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignBottomEndAlignmentTopStart_static_001
     * @tc.name     testStackAlignBottomEndAlignmentTopStart_static_001
     * @tc.desc     testStackAlignBottomEndAlignmentTopStart_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignBottomEndAlignmentTopStart_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomEndAlignmentTopStart_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.BottomEnd
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.TopStart
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.BottomEnd
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue()

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignBottomEndAlignmentTopStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignBottomEndAlignmentTop_static_001
     * @tc.name     testStackAlignBottomEndAlignmentTop_static_001
     * @tc.desc     testStackAlignBottomEndAlignmentTop_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignBottomEndAlignmentTop_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomEndAlignmentTop_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.BottomEnd
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Top
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.BottomEnd
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignBottomEndAlignmentTop_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignBottomEndAlignmentTop_static_002
     * @tc.name     testStackAlignBottomEndAlignmentTop_static_002
     * @tc.desc     testStackAlignBottomEndAlignmentTop_static_002
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignBottomEndAlignmentTop_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomEndAlignmentTop_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.BottomEnd
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.TopEnd
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.BottomEnd
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignBottomEndAlignmentTop_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignBottomEndAlignmentStart_static_001
     * @tc.name     testStackAlignBottomEndAlignmentStart_static_001
     * @tc.desc     testStackAlignBottomEndAlignmentStart_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignBottomEndAlignmentStart_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomEndAlignmentStart_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.BottomEnd
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Start
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.BottomEnd
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignBottomEndAlignmentStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignBottomEndAlignmentCenter_static_001
     * @tc.name     testStackAlignBottomEndAlignmentCenter_static_001
     * @tc.desc     testStackAlignBottomEndAlignmentCenter_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignBottomEndAlignmentCenter_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomEndAlignmentCenter_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.BottomEnd
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Center
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.BottomEnd
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignBottomEndAlignmentCenter_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignBottomEndAlignmentEnd_static_001
     * @tc.name     testStackAlignBottomEndAlignmentEnd_static_001
     * @tc.desc     testStackAlignBottomEndAlignmentEnd_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignBottomEndAlignmentEnd_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomEndAlignmentEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.BottomEnd
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.End
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.BottomEnd
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignBottomEndAlignmentEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignBottomEndAlignmentBottomStart_static_001
     * @tc.name     testStackAlignBottomEndAlignmentBottomStart_static_001
     * @tc.desc     testStackAlignBottomEndAlignmentBottomStart_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignBottomEndAlignmentBottomStart_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomEndAlignmentBottomStart_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.BottomEnd
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.BottomStart
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.BottomEnd
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.right) - (stackTopStartKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.right) - (stackTopStartKey02.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackTopStartKey.bottom) - (stackTopStartKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.bottom) - (stackTopStartKey02.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignBottomEndAlignmentBottomStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignBottomEndAlignmentBottom_static_001
     * @tc.name     testStackAlignBottomEndAlignmentBottom_static_001
     * @tc.desc     testStackAlignBottomEndAlignmentBottom_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignBottomEndAlignmentBottom_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomEndAlignmentBottom_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.BottomEnd
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Bottom
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.BottomEnd
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.right) - (stackTopStartKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.right) - (stackTopStartKey02.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackTopStartKey.bottom) - (stackTopStartKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.bottom) - (stackTopStartKey02.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignBottomEndAlignmentBottom_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignBottomEndAlignmentBottomEnd_static_001
     * @tc.name     testStackAlignBottomEndAlignmentBottomEnd_static_001
     * @tc.desc     testStackAlignBottomEndAlignmentBottomEnd_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignBottomEndAlignmentBottomEnd_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomEndAlignmentBottomEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'align', value: Alignment.BottomEnd
      // });
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.BottomEnd
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'align', value: Alignment.BottomEnd
      });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');

      expect(Math.abs((stackTopStartKey.right) - (stackTopStartKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.right) - (stackTopStartKey02.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackTopStartKey.bottom) - (stackTopStartKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.bottom) - (stackTopStartKey02.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignBottomEndAlignmentBottomEnd_static END');
      done();
    });
  })
}