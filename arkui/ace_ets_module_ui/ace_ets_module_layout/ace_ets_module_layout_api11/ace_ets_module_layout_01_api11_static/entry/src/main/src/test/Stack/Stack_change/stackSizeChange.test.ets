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

export default function stackSizeChange() {
  describe('stackSizeChangeTest', () => {
    beforeAll(async () => {
      console.info("stackSizeChangeTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility");

    })
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/Stack_change/stackSizeChange',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router")
        routerInstance?.clear();
        let pages = routerInstance?.getState();
        console.info("get stackSizeChange state success " + JSON.stringify(pages));
        if (!("stackSizeChange" == pages?.name)) {
          console.info("get stackSizeChange state success " + JSON.stringify(pages?.name));
          routerInstance?.pushUrl(options)

        }
      } catch (err) {
        console.error("push stackSizeChange page error " + JSON.stringify(err));
      }
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("stackSizeChange after each called");
    });

    
    



    /**
     * @tc.number   testStackLargerAlignContentTopStart_static
     * @tc.name     testStackLargerAlignContentTopStart_static
     * @tc.desc     testStackLargerAlignContentTopStart_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackLargerAlignContentTopStart_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackLargerAlignContentTopStart_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.TopStart
      // });
      // globalThis.value.message.notify({
      //   name: 'height', value: 300
      // });
      // globalThis.value.message.notify({
      //   name: 'width', value: 300
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 300
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 300
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.right - stackSizeKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.bottom - stackSizeKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      console.info('new testStackLargerAlignContentTopStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackLargerAlignContentTop_static
     * @tc.name     testStackLargerAlignContentTop_static
     * @tc.desc     testStackLargerAlignContentTop_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackLargerAlignContentTop_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackLargerAlignContentTop_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Top
      // });
      // globalThis.value.message.notify({
      //   name: 'height', value: 300
      // });
      // globalThis.value.message.notify({
      //   name: 'width', value: 300
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 300
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 300
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((Math.round(stackSizeKey01.left - stackSizeKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.right - stackSizeKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.bottom - stackSizeKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackLargerAlignContentTop_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackLargerAlignContentTopEnd_static
     * @tc.name     testStackLargerAlignContentTopEnd_static
     * @tc.desc     testStackLargerAlignContentTopEnd_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackLargerAlignContentTopEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackLargerAlignContentTopEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.TopEnd
      // });
      // globalThis.value.message.notify({
      //   name: 'height', value: 300
      // });
      // globalThis.value.message.notify({
      //   name: 'width', value: 300
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 300
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 300
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.left - stackSizeKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.bottom - stackSizeKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackLargerAlignContentTopEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackLargerAlignContentStart_static
     * @tc.name     testStackLargerAlignContentStart_static
     * @tc.desc     testStackLargerAlignContentStart_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackLargerAlignContentStart_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackLargerAlignContentStart_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Start
      // });
      // globalThis.value.message.notify({
      //   name: 'height', value: 300
      // });
      // globalThis.value.message.notify({
      //   name: 'width', value: 300
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 300
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 300
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.right - stackSizeKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.top - stackSizeKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.bottom - stackSizeKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackLargerAlignContentStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackLargerAlignContentCenter_static
     * @tc.name     testStackLargerAlignContentCenter_static
     * @tc.desc     testStackLargerAlignContentCenter_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackLargerAlignContentCenter_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackLargerAlignContentCenter_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Center
      // });
      // globalThis.value.message.notify({
      //   name: 'height', value: 300
      // });
      // globalThis.value.message.notify({
      //   name: 'width', value: 300
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 300
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 300
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((Math.round(stackSizeKey01.left - stackSizeKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.right - stackSizeKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.top - stackSizeKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.bottom - stackSizeKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackLargerAlignContentCenter_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackLargerAlignContentEnd_static
     * @tc.name     testStackLargerAlignContentEnd_static
     * @tc.desc     testStackLargerAlignContentEnd_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackLargerAlignContentEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackLargerAlignContentEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.End
      // });
      // globalThis.value.message.notify({
      //   name: 'height', value: 300
      // });
      // globalThis.value.message.notify({
      //   name: 'width', value: 300
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.End
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 300
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 300
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.left - stackSizeKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.top - stackSizeKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.bottom - stackSizeKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackLargerAlignContentEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackLargerAlignContentBottomStart_static
     * @tc.name     testStackLargerAlignContentBottomStart_static
     * @tc.desc     testStackLargerAlignContentBottomStart_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackLargerAlignContentBottomStart_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackLargerAlignContentBottomStart_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.BottomStart
      // });
      // globalThis.value.message.notify({
      //   name: 'height', value: 300
      // });
      // globalThis.value.message.notify({
      //   name: 'width', value: 300
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 300
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 300
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.right - stackSizeKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.top - stackSizeKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackLargerAlignContentBottomStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackLargerAlignContentBottom_static
     * @tc.name     testStackLargerAlignContentBottom_static
     * @tc.desc     testStackLargerAlignContentBottom_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackLargerAlignContentBottom_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackLargerAlignContentBottom_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Bottom
      // });
      // globalThis.value.message.notify({
      //   name: 'height', value: 300
      // });
      // globalThis.value.message.notify({
      //   name: 'width', value: 300
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 300
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 300
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((Math.round(stackSizeKey01.left - stackSizeKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.right - stackSizeKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.top - stackSizeKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackLargerAlignContentBottom_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackLargerAlignContentBottomEnd_static
     * @tc.name     testStackLargerAlignContentBottomEnd_static
     * @tc.desc     testStackLargerAlignContentBottomEnd_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackLargerAlignContentBottomEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackLargerAlignContentBottomEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.BottomEnd
      // });
      // globalThis.value.message.notify({
      //   name: 'height', value: 300
      // });
      // globalThis.value.message.notify({
      //   name: 'width', value: 300
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 300
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 300
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((Math.round(stackSizeKey01.left - stackSizeKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.top - stackSizeKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackLargerAlignContentBottomEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackEqualAlignContentBottomTopStart_static
     * @tc.name     testStackEqualAlignContentBottomTopStart_static
     * @tc.desc     testStackEqualAlignContentBottomTopStart_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackEqualAlignContentBottomTopStart_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackEqualAlignContentBottomTopStart_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.TopStart
      // });
      // globalThis.value.message.notify({
      //   name: 'height', value: 200
      // });
      // globalThis.value.message.notify({
      //   name: 'width', value: 200
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 200
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 200
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      console.info('new testStackEqualAlignContentBottomTopStart_static END');
      done();
    });

    
    



    /**
     * @tc.number  testStackEqualAlignContentBottomTop_static
     * @tc.name     testStackEqualAlignContentBottomTop_static
     * @tc.desc     testStackEqualAlignContentBottomTop_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackEqualAlignContentBottomTop_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackEqualAlignContentBottomTop_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Top
      // });
      // globalThis.value.message.notify({
      //   name: 'height', value: 200
      // });
      // globalThis.value.message.notify({
      //   name: 'width', value: 200
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 200
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 200
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackEqualAlignContentBottomTop_static END');
      done();
    });

    
    



    /**
     * @tc.number  testStackEqualAlignContentBottomTopEnd_static
     * @tc.name     testStackEqualAlignContentBottomTopEnd_static
     * @tc.desc     testStackEqualAlignContentBottomTopEnd_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackEqualAlignContentBottomTopEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackEqualAlignContentBottomTopEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.TopEnd
      // });
      // globalThis.value.message.notify({
      //   name: 'height', value: 200
      // });
      // globalThis.value.message.notify({
      //   name: 'width', value: 200
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 200
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 200
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackEqualAlignContentBottomTopEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number  testStackEqualAlignContentBottomStart_static
     * @tc.name     testStackEqualAlignContentBottomStart_static
     * @tc.desc     testStackEqualAlignContentBottomStart_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackEqualAlignContentBottomStart_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackEqualAlignContentBottomStart_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Start
      // });
      // globalThis.value.message.notify({
      //   name: 'height', value: 200
      // });
      // globalThis.value.message.notify({
      //   name: 'width', value: 200
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 200
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 200
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackEqualAlignContentBottomStart_static END');
      done();
    });

    
    



    /**
     * @tc.number  testStackEqualAlignContentCenter_static
     * @tc.name     testStackEqualAlignContentCenter_static
     * @tc.desc     testStackEqualAlignContentCenter_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackEqualAlignContentCenter_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackEqualAlignContentCenter_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Center
      // });
      // globalThis.value.message.notify({
      //   name: 'height', value: 200
      // });
      // globalThis.value.message.notify({
      //   name: 'width', value: 200
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 200
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 200
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackEqualAlignContentCenter_static END');
      done();
    });

    
    



    /**
     * @tc.number  testStackEqualAlignContentEnd_static
     * @tc.name     testStackEqualAlignContentEnd_static
     * @tc.desc     testStackEqualAlignContentEnd_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackEqualAlignContentEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackEqualAlignContentEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.End
      // });
      // globalThis.value.message.notify({
      //   name: 'height', value: 200
      // });
      // globalThis.value.message.notify({
      //   name: 'width', value: 200
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.End
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 200
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 200
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackEqualAlignContentEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackEqualAlignContentBottomStart_static_001
     * @tc.name     testStackEqualAlignContentBottomStart_static_001
     * @tc.desc     testStackEqualAlignContentBottomStart_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testStackEqualAlignContentBottomStart_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackEqualAlignContentBottomStart_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.BottomStart
      // });
      // globalThis.value.message.notify({
      //   name: 'height', value: 200
      // });
      // globalThis.value.message.notify({
      //   name: 'width', value: 200
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 200
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 200
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackEqualAlignContentBottomStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackEqualAlignContentBottom_static
     * @tc.name     testStackEqualAlignContentBottom_static
     * @tc.desc     testStackEqualAlignContentBottom_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackEqualAlignContentBottom_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackEqualAlignContentBottom_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Bottom
      // });
      // globalThis.value.message.notify({
      //   name: 'height', value: 200
      // });
      // globalThis.value.message.notify({
      //   name: 'width', value: 200
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 200
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 200
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackEqualAlignContentBottom_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackEqualAlignContentBottomEnd_static
     * @tc.name     testStackEqualAlignContentBottomEnd_static
     * @tc.desc     testStackEqualAlignContentBottomEnd_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackEqualAlignContentBottomEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackEqualAlignContentBottomEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.BottomEnd
      // });
      // globalThis.value.message.notify({
      //   name: 'height', value: 200
      // });
      // globalThis.value.message.notify({
      //   name: 'width', value: 200
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 200
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 200
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackEqualAlignContentBottomEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackLessAlignContentTopStart_static
     * @tc.name     testStackLessAlignContentTopStart_static
     * @tc.desc     testStackLessAlignContentTopStart_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackLessAlignContentTopStart_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackLessAlignContentTopStart_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.TopStart
      // });
      // globalThis.value.message.notify({
      //   name: 'height', value: 100
      // });
      // globalThis.value.message.notify({
      //   name: 'width', value: 100
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 100
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 100
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.bottom - stackSizeKey.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      console.info('new testStackLessAlignContentTopStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackLessAlignContentTop_static
     * @tc.name     testStackLessAlignContentTop_static
     * @tc.desc     testStackLessAlignContentTop_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackLessAlignContentTop_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackLessAlignContentTop_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Top
      // });
      // globalThis.value.message.notify({
      //   name: 'height', value: 100
      // });
      // globalThis.value.message.notify({
      //   name: 'width', value: 100
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 100
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 100
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((Math.round(stackSizeKey.left - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.bottom - stackSizeKey.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackLessAlignContentTop_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackLessAlignContentTopEnd_static
     * @tc.name     testStackLessAlignContentTopEnd_static
     * @tc.desc     testStackLessAlignContentTopEnd_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackLessAlignContentTopEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackLessAlignContentTopEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.TopEnd
      // });
      // globalThis.value.message.notify({
      //   name: 'height', value: 100
      // });
      // globalThis.value.message.notify({
      //   name: 'width', value: 100
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 100
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 100
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.left - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.bottom - stackSizeKey.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackLessAlignContentTopEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackLessAlignContentStart_static
     * @tc.name     testStackLessAlignContentStart_static
     * @tc.desc     testStackLessAlignContentStart_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackLessAlignContentStart_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackLessAlignContentStart_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Start
      // });
      // globalThis.value.message.notify({
      //   name: 'height', value: 100
      // });
      // globalThis.value.message.notify({
      //   name: 'width', value: 100
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 100
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 100
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.top - stackSizeKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.bottom - stackSizeKey.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackLessAlignContentStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackLessAlignContentCenter_static
     * @tc.name     testStackLessAlignContentCenter_static
     * @tc.desc     testStackLessAlignContentCenter_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackLessAlignContentCenter_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackLessAlignContentCenter_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Center
      // });
      // globalThis.value.message.notify({
      //   name: 'height', value: 100
      // });
      // globalThis.value.message.notify({
      //   name: 'width', value: 100
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 100
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 100
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((Math.round(stackSizeKey.left - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.top - stackSizeKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.bottom - stackSizeKey.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackLessAlignContentCenter_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackLessAlignContentEnd_static
     * @tc.name     testStackLessAlignContentEnd_static
     * @tc.desc     testStackLessAlignContentEnd_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackLessAlignContentEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackLessAlignContentEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.End
      // });
      // globalThis.value.message.notify({
      //   name: 'height', value: 100
      // });
      // globalThis.value.message.notify({
      //   name: 'width', value: 100
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.End
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 100
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 100
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.left - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.top - stackSizeKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.bottom - stackSizeKey.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackLessAlignContentEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackLessAlignContentBottomStart_static
     * @tc.name     testStackLessAlignContentBottomStart_static
     * @tc.desc     testStackLessAlignContentBottomStart_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackLessAlignContentBottomStart_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackLessAlignContentBottomStart_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.BottomStart
      // });
      // globalThis.value.message.notify({
      //   name: 'height', value: 100
      // });
      // globalThis.value.message.notify({
      //   name: 'width', value: 100
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 100
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 100
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.top - stackSizeKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackLessAlignContentBottomStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackLessAlignContentBottom_static
     * @tc.name     testStackLessAlignContentBottom_static
     * @tc.desc     testStackLessAlignContentBottom_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackLessAlignContentBottom_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackLessAlignContentBottom_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Bottom
      // });
      // globalThis.value.message.notify({
      //   name: 'height', value: 100
      // });
      // globalThis.value.message.notify({
      //   name: 'width', value: 100
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 100
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 100
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((Math.round(stackSizeKey.left - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.top - stackSizeKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackLessAlignContentBottom_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackLessAlignContentBottomEnd_static
     * @tc.name     testStackLessAlignContentBottomEnd_static
     * @tc.desc     testStackLessAlignContentBottomEnd_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackLessAlignContentBottomEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackLessAlignContentBottomEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.BottomEnd
      // });
      // globalThis.value.message.notify({
      //   name: 'height', value: 100
      // });
      // globalThis.value.message.notify({
      //   name: 'width', value: 100
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 100
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 100
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((Math.round(stackSizeKey.left - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.top - stackSizeKey01.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackLessAlignContentBottomEnd_static END');
      done();
    });
  })
}