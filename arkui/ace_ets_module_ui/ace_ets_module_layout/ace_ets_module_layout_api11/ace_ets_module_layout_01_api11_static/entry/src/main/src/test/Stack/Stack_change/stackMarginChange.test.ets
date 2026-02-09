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

export default function stackMarginChange() {
  describe('stackMarginChangeTest', () => {
    beforeAll(async () => {
      console.info("stackMarginChangeTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility");

    })
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/Stack_change/stackMarginChange',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router")
        routerInstance?.clear();
        let pages = routerInstance?.getState();
        console.info("get stackMarginChange state success " + JSON.stringify(pages));
        if (!("stackMarginChange" == pages?.name)) {
          console.info("get stackMarginChange state success " + JSON.stringify(pages?.name));
          routerInstance?.pushUrl(options)
        }
      } catch (err) {
        console.error("push stackMarginChange page error " + JSON.stringify(err));
      }
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("stackMarginChange after each called");
    });

    
    



    /**
     * @tc.number   testStackMarginAlignContentTopStart_static
     * @tc.name     testStackMarginAlignContentTopStart_static
     * @tc.desc     testStackMarginAlignContentTopStart_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackMarginAlignContentTopStart_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackMarginAlignContentTopStart_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.TopStart
      // });
      // globalThis.value.message.notify({
      //   name: 'margin', value: 20
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'margin', value: 20
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackMarginKey');

      let stackMarginKey: RectValue = CommonFunc.getComponentRect('stackMarginKey');
      let stackMarginKey01: RectValue = CommonFunc.getComponentRect('stackMarginKey01');
      expect(Math.abs((stackMarginKey01.left) - (stackMarginKey.left)) <= 1).assertTrue();
      expect(Math.abs((stackMarginKey01.top) - (stackMarginKey.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackMarginKey.right - stackMarginKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey.bottom - stackMarginKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey01.right - stackMarginKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      console.info('new testStackMarginAlignContentTopStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackMarginAlignContentTop_static
     * @tc.name     testStackMarginAlignContentTop_static
     * @tc.desc     testStackMarginAlignContentTop_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackMarginAlignContentTop_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackMarginAlignContentTop_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Top
      // });
      // globalThis.value.message.notify({
      //   name: 'margin', value: 20
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'margin', value: 20
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackMarginKey');

      let stackMarginKey: RectValue = CommonFunc.getComponentRect('stackMarginKey');
      let stackMarginKey01: RectValue = CommonFunc.getComponentRect('stackMarginKey01');
      expect(Math.abs((Math.round(stackMarginKey01.left - stackMarginKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey.right - stackMarginKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackMarginKey01.top) - (stackMarginKey.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackMarginKey.bottom - stackMarginKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey01.right - stackMarginKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackMarginAlignContentTop_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackMarginAlignContentTopEnd_static
     * @tc.name     testStackMarginAlignContentTopEnd_static
     * @tc.desc     testStackMarginAlignContentTopEnd_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackMarginAlignContentTopEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackMarginAlignContentTopEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.TopEnd
      // });
      // globalThis.value.message.notify({
      //   name: 'margin', value: 20
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'margin', value: 20
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackMarginKey');

      let stackMarginKey: RectValue = CommonFunc.getComponentRect('stackMarginKey');
      let stackMarginKey01: RectValue = CommonFunc.getComponentRect('stackMarginKey01');
      expect(Math.abs((Math.round(stackMarginKey01.left - stackMarginKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackMarginKey01.right) - (stackMarginKey.right)) <= 1).assertTrue();
      expect(Math.abs((stackMarginKey01.top) - (stackMarginKey.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackMarginKey.bottom - stackMarginKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey01.right - stackMarginKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackMarginAlignContentTopEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackMarginAlignContentStart_static
     * @tc.name     testStackMarginAlignContentStart_static
     * @tc.desc     testStackMarginAlignContentStart_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackMarginAlignContentStart_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackMarginAlignContentStart_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Start
      // });
      // globalThis.value.message.notify({
      //   name: 'margin', value: 20
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'margin', value: 20
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackMarginKey');

      let stackMarginKey: RectValue = CommonFunc.getComponentRect('stackMarginKey');
      let stackMarginKey01: RectValue = CommonFunc.getComponentRect('stackMarginKey01');
      expect(Math.abs((stackMarginKey01.left) - (stackMarginKey.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackMarginKey.right - stackMarginKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey01.top - stackMarginKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey.bottom - stackMarginKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey01.right - stackMarginKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackMarginAlignContentStart_static END');
      done();
    });

    
    



    /**
     * @tc.number  testStackMarginAlignContentCenter_static
     * @tc.name     testStackMarginAlignContentCenter_static
     * @tc.desc     testStackMarginAlignContentCenter_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackMarginAlignContentCenter_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackMarginAlignContentCenter_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Center
      // });
      // globalThis.value.message.notify({
      //   name: 'margin', value: 20
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'margin', value: 20
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackMarginKey');

      let stackMarginKey: RectValue = CommonFunc.getComponentRect('stackMarginKey');
      let stackMarginKey01: RectValue = CommonFunc.getComponentRect('stackMarginKey01');
      expect(Math.abs((Math.round(stackMarginKey01.left - stackMarginKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey.right - stackMarginKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey01.top - stackMarginKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey.bottom - stackMarginKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey01.right - stackMarginKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackMarginAlignContentCenter_static END');
      done();
    });

    
    



    /**
     * @tc.number  testStackMarginAlignContentEnd_static
     * @tc.name     testStackMarginAlignContentEnd_static
     * @tc.desc     testStackMarginAlignContentEnd_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackMarginAlignContentEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackMarginAlignContentEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.End
      // });
      // globalThis.value.message.notify({
      //   name: 'margin', value: 20
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.End
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'margin', value: 20
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackMarginKey');

      let stackMarginKey: RectValue = CommonFunc.getComponentRect('stackMarginKey');
      let stackMarginKey01: RectValue = CommonFunc.getComponentRect('stackMarginKey01');
      expect(Math.abs((Math.round(stackMarginKey01.left - stackMarginKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackMarginKey01.right) - (stackMarginKey.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackMarginKey01.top - stackMarginKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey.bottom - stackMarginKey01.bottom)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey01.right - stackMarginKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackMarginAlignContentEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number  testStackMarginAlignContentBottomStart_static
     * @tc.name     testStackMarginAlignContentBottomStart_static
     * @tc.desc     testStackMarginAlignContentBottomStart_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackMarginAlignContentBottomStart_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackMarginAlignContentBottomStart_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.BottomStart
      // });
      // globalThis.value.message.notify({
      //   name: 'margin', value: 20
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'margin', value: 20
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackMarginKey');

      let stackMarginKey: RectValue = CommonFunc.getComponentRect('stackMarginKey');
      let stackMarginKey01: RectValue = CommonFunc.getComponentRect('stackMarginKey01');
      expect(Math.abs((stackMarginKey01.left) - (stackMarginKey.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackMarginKey.right - stackMarginKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey01.top - stackMarginKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackMarginKey01.bottom) - (stackMarginKey.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackMarginKey01.right - stackMarginKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackMarginAlignContentBottomStart_static END');
      done();
    });

    
    



    /**
     * @tc.number  testStackMarginAlignContentBottom_static
     * @tc.name     testStackMarginAlignContentBottom_static
     * @tc.desc     testStackMarginAlignContentBottom_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackMarginAlignContentBottom_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackMarginAlignContentBottom_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Bottom
      // });
      // globalThis.value.message.notify({
      //   name: 'margin', value: 20
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'margin', value: 20
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackMarginKey');

      let stackMarginKey: RectValue = CommonFunc.getComponentRect('stackMarginKey');
      let stackMarginKey01: RectValue = CommonFunc.getComponentRect('stackMarginKey01');
      expect(Math.abs((Math.round(stackMarginKey01.left - stackMarginKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey.right - stackMarginKey01.right)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey01.top - stackMarginKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackMarginKey01.bottom) - (stackMarginKey.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackMarginKey01.right - stackMarginKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackMarginAlignContentBottom_static END');
      done();
    });

    
    



    /**
     * @tc.number  testStackMarginAlignContentBottomEnd_static
     * @tc.name     testStackMarginAlignContentBottomEnd_static
     * @tc.desc     testStackMarginAlignContentBottomEnd_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackMarginAlignContentBottomEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackMarginAlignContentBottomEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.BottomEnd
      // });
      // globalThis.value.message.notify({
      //   name: 'margin', value: 20
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'margin', value: 20
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackMarginKey');

      let stackMarginKey: RectValue = CommonFunc.getComponentRect('stackMarginKey');
      let stackMarginKey01: RectValue = CommonFunc.getComponentRect('stackMarginKey01');
      expect(Math.abs((Math.round(stackMarginKey01.left - stackMarginKey.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackMarginKey01.right) - (stackMarginKey.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackMarginKey01.top - stackMarginKey.top)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackMarginKey01.bottom) - (stackMarginKey.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackMarginKey01.right - stackMarginKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackMarginAlignContentBottomEnd_static END');
      done();
    });
  })
}