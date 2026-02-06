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

export default function stackPaddingChange() {
  describe('stackPaddingChangeTest', () => {
    beforeAll(async () => {
      console.info("stackPaddingChangeTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility");

    })
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/Stack_change/stackPaddingChange',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router")
        routerInstance?.clear();
        let pages = routerInstance?.getState();
        console.info("get stackPaddingChange state success " + JSON.stringify(pages));
        if (!("stackPaddingChange" == pages?.name)) {
          console.info("get stackPaddingChange state success " + JSON.stringify(pages?.name));
          routerInstance?.pushUrl(options)
        }
      } catch (err) {
        console.error("push stackPaddingChange page error " + JSON.stringify(err));
      }
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("stackPaddingChange after each called");
    });

    
    



    /**
     * @tc.number   testStackAlignPaddingAlignTopStart_static
     * @tc.name     testStackAlignPaddingAlignTopStart_static
     * @tc.desc     testStackAlignPaddingAlignTopStart_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignPaddingAlignTopStart_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingAlignTopStart_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.TopStart
      // });
      // globalThis.value.message.notify({
      //   name: 'padding', value: 10
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 10
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - AppStorage.get<UIContext>("uiContext")!.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - AppStorage.get<UIContext>("uiContext")!.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      console.info('new testStackAlignPaddingAlignTopStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignPaddingAlignTop_static
     * @tc.name     testStackAlignPaddingAlignTop_static
     * @tc.desc     testStackAlignPaddingAlignTop_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignPaddingAlignTop_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingAlignTop_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Top
      // });
      // globalThis.value.message.notify({
      //   name: 'padding', value: 10
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 10
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - AppStorage.get<UIContext>("uiContext")!.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackAlignPaddingAlignTop_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignPaddingAlignTopEnd_static
     * @tc.name     testStackAlignPaddingAlignTopEnd_static
     * @tc.desc     testStackAlignPaddingAlignTopEnd_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignPaddingAlignTopEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingAlignTopEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.TopEnd
      // });
      // globalThis.value.message.notify({
      //   name: 'padding', value: 10
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 10
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - AppStorage.get<UIContext>("uiContext")!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - AppStorage.get<UIContext>("uiContext")!.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignPaddingAlignTopEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignPaddingAlignStart_static
     * @tc.name     testStackAlignPaddingAlignStart_static
     * @tc.desc     testStackAlignPaddingAlignStart_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignPaddingAlignStart_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingAlignStart_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Start
      // });
      // globalThis.value.message.notify({
      //   name: 'padding', value: 10
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 10
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - AppStorage.get<UIContext>("uiContext")!.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackAlignPaddingAlignStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignPaddingAlignCenter_static
     * @tc.name     testStackAlignPaddingAlignCenter_static
     * @tc.desc     testStackAlignPaddingAlignCenter_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignPaddingAlignCenter_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingAlignCenter_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Center
      // });
      // globalThis.value.message.notify({
      //   name: 'padding', value: 10
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 10
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(250))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackAlignPaddingAlignCenter_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignPaddingAlignEnd_static
     * @tc.name     testStackAlignPaddingAlignEnd_static
     * @tc.desc     testStackAlignPaddingAlignEnd_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignPaddingAlignEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingAlignEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.End
      // });
      // globalThis.value.message.notify({
      //   name: 'padding', value: 10
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.End
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 10
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(40))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - AppStorage.get<UIContext>("uiContext")!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(250))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackAlignPaddingAlignEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignPaddingAlignBottomStart_static
     * @tc.name     testStackAlignPaddingAlignBottomStart_static
     * @tc.desc     testStackAlignPaddingAlignBottomStart_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignPaddingAlignBottomStart_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingAlignBottomStart_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.BottomStart
      // });
      // globalThis.value.message.notify({
      //   name: 'padding', value: 10
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 10
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - AppStorage.get<UIContext>("uiContext")!.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - AppStorage.get<UIContext>("uiContext")!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignPaddingAlignBottomStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignPaddingAlignBottom_static
     * @tc.name     testStackAlignPaddingAlignBottom_static
     * @tc.desc     testStackAlignPaddingAlignBottom_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignPaddingAlignBottom_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingAlignBottom_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Bottom
      // });
      // globalThis.value.message.notify({
      //   name: 'padding', value: 10
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 10
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - AppStorage.get<UIContext>("uiContext")!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignPaddingAlignBottom_static END');
      done();
    });

    
    



    /**
     * @tc.number  testStackAlignPaddingAlignBottomEnd_static
     * @tc.name     testStackAlignPaddingAlignBottomEnd_static
     * @tc.desc     testStackAlignPaddingAlignBottomEnd_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignPaddingAlignBottomEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingAlignBottomEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.BottomEnd
      // });
      // globalThis.value.message.notify({
      //   name: 'padding', value: 10
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 10
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - AppStorage.get<UIContext>("uiContext")!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - AppStorage.get<UIContext>("uiContext")!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignPaddingAlignBottomEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number  testStackAlignPaddingExceedAlignTopStart_static
     * @tc.name     testStackAlignPaddingExceedAlignTopStart_static
     * @tc.desc     testStackAlignPaddingExceedAlignTopStart_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignPaddingExceedAlignTopStart_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingExceedAlignTopStart_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.TopStart
      // });
      // globalThis.value.message.notify({
      //   name: 'padding', value: 30
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 30
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - AppStorage.get<UIContext>("uiContext")!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - AppStorage.get<UIContext>("uiContext")!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      console.info('new testStackAlignPaddingExceedAlignTopStart_static END');
      done();
    });

    
    



    /**
     * @tc.number  testStackAlignPaddingExceedAlignTop_static
     * @tc.name     testStackAlignPaddingExceedAlignTop_static
     * @tc.desc     testStackAlignPaddingExceedAlignTop_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignPaddingExceedAlignTop_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingExceedAlignTop_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Top
      // });
      // globalThis.value.message.notify({
      //   name: 'padding', value: 30
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 30
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - AppStorage.get<UIContext>("uiContext")!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackAlignPaddingExceedAlignTop_static END');
      done();
    });

    
    



    /**
     * @tc.number  testStackAlignPaddingExceedAlignTopEnd_static
     * @tc.name     testStackAlignPaddingExceedAlignTopEnd_static
     * @tc.desc     testStackAlignPaddingExceedAlignTopEnd_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignPaddingExceedAlignTopEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingExceedAlignTopEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.TopEnd
      // });
      // globalThis.value.message.notify({
      //   name: 'padding', value: 30
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 30
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - AppStorage.get<UIContext>("uiContext")!.vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - AppStorage.get<UIContext>("uiContext")!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignPaddingExceedAlignTopEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number  testStackAlignPaddingExceedAlignStart_static
     * @tc.name     testStackAlignPaddingExceedAlignStart_static
     * @tc.desc     testStackAlignPaddingExceedAlignStart_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignPaddingExceedAlignStart_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingExceedAlignStart_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Start
      // });
      // globalThis.value.message.notify({
      //   name: 'padding', value: 30
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 30
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - AppStorage.get<UIContext>("uiContext")!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackAlignPaddingExceedAlignStart_static END');
      done();
    });

    
    



    /**
     * @tc.number  testStackAlignPaddingExceedAlignCenter_static
     * @tc.name     testStackAlignPaddingExceedAlignCenter_static
     * @tc.desc     testStackAlignPaddingExceedAlignCenter_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignPaddingExceedAlignCenter_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingExceedAlignCenter_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Center
      // });
      // globalThis.value.message.notify({
      //   name: 'padding', value: 30
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 30
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackAlignPaddingExceedAlignCenter_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignPaddingExceedAlignEnd_static
     * @tc.name     testStackAlignPaddingExceedAlignEnd_static
     * @tc.desc     testStackAlignPaddingExceedAlignEnd_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignPaddingExceedAlignEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingExceedAlignEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.End
      // });
      // globalThis.value.message.notify({
      //   name: 'padding', value: 30
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.End
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 30
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - AppStorage.get<UIContext>("uiContext")!.vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackAlignPaddingExceedAlignEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignPaddingExceedAlignBottomStart_static
     * @tc.name     testStackAlignPaddingExceedAlignBottomStart_static
     * @tc.desc     testStackAlignPaddingExceedAlignBottomStart_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignPaddingExceedAlignBottomStart_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingExceedAlignBottomStart_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.BottomStart
      // });
      // globalThis.value.message.notify({
      //   name: 'padding', value: 30
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 30
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - AppStorage.get<UIContext>("uiContext")!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - AppStorage.get<UIContext>("uiContext")!.vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignPaddingExceedAlignBottomStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignPaddingExceedAlignBottom_static
     * @tc.name     testStackAlignPaddingExceedAlignBottom_static
     * @tc.desc     testStackAlignPaddingExceedAlignBottom_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignPaddingExceedAlignBottom_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingExceedAlignBottom_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Bottom
      // });
      // globalThis.value.message.notify({
      //   name: 'padding', value: 30
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 30
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left)- AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - AppStorage.get<UIContext>("uiContext")!.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - AppStorage.get<UIContext>("uiContext")!.vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignPaddingExceedAlignBottom_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackAlignPaddingExceedAlignBottomEnd_static
     * @tc.name     testStackAlignPaddingExceedAlignBottomEnd_static
     * @tc.desc     testStackAlignPaddingExceedAlignBottomEnd_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignPaddingExceedAlignBottomEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingExceedAlignBottomEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.BottomEnd
      // });
      // globalThis.value.message.notify({
      //   name: 'padding', value: 30
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 30
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - AppStorage.get<UIContext>("uiContext")!.vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - AppStorage.get<UIContext>("uiContext")!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - AppStorage.get<UIContext>("uiContext")!.vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignPaddingExceedAlignBottomEnd_static END');
      done();
    });
  })
}