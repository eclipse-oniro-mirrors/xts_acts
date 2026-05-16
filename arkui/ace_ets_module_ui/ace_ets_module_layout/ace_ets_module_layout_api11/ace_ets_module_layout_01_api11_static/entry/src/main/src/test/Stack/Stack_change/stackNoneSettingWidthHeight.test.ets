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

export default function stackNoneSettingWidthHeight() {
  describe('stackNoneSettingWidthHeightTest', () => {
    beforeAll(async () => {
      console.info("stackNoneSettingWidthHeightTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility");

    })
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/Stack_change/stackNoneSettingWidthHeight',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router")
        routerInstance?.clear();
        let pages = routerInstance?.getState();
        console.info("get stackNoneSettingWidthHeight state success " + JSON.stringify(pages));
        if (!("stackNoneSettingWidthHeight" == pages?.name)) {
          console.info("get stackNoneSettingWidthHeight state success " + JSON.stringify(pages?.name));
          routerInstance?.pushUrl(options)
        }
      } catch (err) {
        console.error("push stackNoneSettingWidthHeight page error " + JSON.stringify(err));
      }
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("stackNoneSettingWidthHeight after each called");
    });

    
    



    /**
     * @tc.number   testStackDefaultSizeAlignContentTopStart_static
     * @tc.name     testStackDefaultSizeAlignContentTopStart_static
     * @tc.desc     testStackDefaultSizeAlignContentTopStart_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackDefaultSizeAlignContentTopStart_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackDefaultSizeAlignContentTopStart_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.TopStart
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeDefaultKey');

      let stackSizeDefaultKey: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey');
      let stackSizeDefaultKey01: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey01');
      expect(Math.abs((stackSizeDefaultKey.left) - (stackSizeDefaultKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.right) - (stackSizeDefaultKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.top) - (stackSizeDefaultKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.bottom) - (stackSizeDefaultKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeDefaultKey01.right - stackSizeDefaultKey01.left)) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      console.info('new testStackDefaultSizeAlignContentTopStart_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackDefaultSizeAlignContentTop_static
     * @tc.name     testStackDefaultSizeAlignContentTop_static
     * @tc.desc     testStackDefaultSizeAlignContentTop_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackDefaultSizeAlignContentTop_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackDefaultSizeAlignContentTop_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Top
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeDefaultKey');

      let stackSizeDefaultKey: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey');
      let stackSizeDefaultKey01: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey01');
      expect(Math.abs((stackSizeDefaultKey.left) - (stackSizeDefaultKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.right) - (stackSizeDefaultKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.top) - (stackSizeDefaultKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.bottom) - (stackSizeDefaultKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round((stackSizeDefaultKey01.right - stackSizeDefaultKey01.left))) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackDefaultSizeAlignContentTop_static END');
      done();
    });

    
    



    /**
     * @tc.number   testStackDefaultSizeAlignContentTopEnd_static
     * @tc.name     testStackDefaultSizeAlignContentTopEnd_static
     * @tc.desc     testStackDefaultSizeAlignContentTopEnd_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackDefaultSizeAlignContentTopEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackDefaultSizeAlignContentTopEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.TopEnd
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeDefaultKey');

      let stackSizeDefaultKey: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey');
      let stackSizeDefaultKey01: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey01');
      expect(Math.abs((stackSizeDefaultKey.left) - (stackSizeDefaultKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.right) - (stackSizeDefaultKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.top) - (stackSizeDefaultKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.bottom) - (stackSizeDefaultKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round((stackSizeDefaultKey01.right - stackSizeDefaultKey01.left))) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackDefaultSizeAlignContentTopEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number  testStackDefaultSizeAlignContentStart_static
     * @tc.name     testStackDefaultSizeAlignContentStart_static
     * @tc.desc     testStackDefaultSizeAlignContentStart_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackDefaultSizeAlignContentStart_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackDefaultSizeAlignContentStart_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Start
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeDefaultKey');

      let stackSizeDefaultKey: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey');
      let stackSizeDefaultKey01: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey01');
      expect(Math.abs((stackSizeDefaultKey.left) - (stackSizeDefaultKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.right) - (stackSizeDefaultKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.top) - (stackSizeDefaultKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.bottom) - (stackSizeDefaultKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round((stackSizeDefaultKey01.right - stackSizeDefaultKey01.left))) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackDefaultSizeAlignContentStart_static END');
      done();
    });

    
    



    /**
     * @tc.number  testStackDefaultSizeAlignContentCenter_static
     * @tc.name     testStackDefaultSizeAlignContentCenter_static
     * @tc.desc     testStackDefaultSizeAlignContentCenter_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackDefaultSizeAlignContentCenter_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackDefaultSizeAlignContentCenter_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Center
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeDefaultKey');

      let stackSizeDefaultKey: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey');
      let stackSizeDefaultKey01: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey01');
      expect(Math.abs((stackSizeDefaultKey.left) - (stackSizeDefaultKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.right) - (stackSizeDefaultKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.top) - (stackSizeDefaultKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.bottom) - (stackSizeDefaultKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round((stackSizeDefaultKey01.right - stackSizeDefaultKey01.left))) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackDefaultSizeAlignContentCenter_static END');
      done();
    });

    
    



    /**
     * @tc.number  testStackDefaultSizeAlignContentEnd_static
     * @tc.name     testStackDefaultSizeAlignContentEnd_static
     * @tc.desc     testStackDefaultSizeAlignContentEnd_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackDefaultSizeAlignContentEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackDefaultSizeAlignContentEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.End
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeDefaultKey');

      let stackSizeDefaultKey: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey');
      let stackSizeDefaultKey01: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey01');
      expect(Math.abs((stackSizeDefaultKey.left) - (stackSizeDefaultKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.right) - (stackSizeDefaultKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.top) - (stackSizeDefaultKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.bottom) - (stackSizeDefaultKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round((stackSizeDefaultKey01.right - stackSizeDefaultKey01.left))) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackDefaultSizeAlignContentEnd_static END');
      done();
    });

    
    



    /**
     * @tc.number  testStackDefaultSizeAlignContentBottomStart_static
     * @tc.name     testStackDefaultSizeAlignContentBottomStart_static
     * @tc.desc     testStackDefaultSizeAlignContentBottomStart_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackDefaultSizeAlignContentBottomStart_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackDefaultSizeAlignContentBottomStart_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.BottomStart
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeDefaultKey');

      let stackSizeDefaultKey: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey');
      let stackSizeDefaultKey01: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey01');
      expect(Math.abs((stackSizeDefaultKey.left) - (stackSizeDefaultKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.right) - (stackSizeDefaultKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.top) - (stackSizeDefaultKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.bottom) - (stackSizeDefaultKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round((stackSizeDefaultKey01.right - stackSizeDefaultKey01.left))) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackDefaultSizeAlignContentBottomStart_static END');
      done();
    });

    
    



    /**
     * @tc.number  testStackDefaultSizeAlignContentBottom_static
     * @tc.name     testStackDefaultSizeAlignContentBottom_static
     * @tc.desc     testStackDefaultSizeAlignContentBottom_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackDefaultSizeAlignContentBottom_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testStackDefaultSizeAlignContentBottom_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.Bottom
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeDefaultKey');

      let stackSizeDefaultKey: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey');
      let stackSizeDefaultKey01: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey01');
      expect(Math.abs((stackSizeDefaultKey.left) - (stackSizeDefaultKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.right) - (stackSizeDefaultKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.top) - (stackSizeDefaultKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.bottom) - (stackSizeDefaultKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round((stackSizeDefaultKey01.right - stackSizeDefaultKey01.left))) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackDefaultSizeAlignContentBottom_static END');
      done();
    });

    
    



    /**
     * @tc.number  testStackDefaultSizeAlignContentBottomEnd_static
     * @tc.name     testStackDefaultSizeAlignContentBottomEnd_static
     * @tc.desc     testStackDefaultSizeAlignContentBottomEnd_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackDefaultSizeAlignContentBottomEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> =>{
      console.info('new testStackDefaultSizeAlignContentBottomEnd_static START');
      // globalThis.value.message.notify({
      //   name: 'alignContent', value: Alignment.BottomEnd
      // });
      AppStorage.get<MessageManager<Alignment>>("messageManager")?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeDefaultKey');

      let stackSizeDefaultKey: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey');
      let stackSizeDefaultKey01: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey01');
      expect(Math.abs((stackSizeDefaultKey.left) - (stackSizeDefaultKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.right) - (stackSizeDefaultKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.top) - (stackSizeDefaultKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.bottom) - (stackSizeDefaultKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round((stackSizeDefaultKey01.right - stackSizeDefaultKey01.left))) - (Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackDefaultSizeAlignContentBottomEnd_static END');
      done();
    });
  })
}