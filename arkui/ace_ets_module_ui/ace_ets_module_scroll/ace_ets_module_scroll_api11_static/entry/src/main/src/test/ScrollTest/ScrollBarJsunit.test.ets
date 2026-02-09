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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import { BarState } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import {
  ScrollBarDirection, Color, ScrollDirection,
} from '@ohos.arkui.component'

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function ScrollBarJsunit() {
  describe('ScrollBarJsunit', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("ScrollBarJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/ScrollBarPage',
      }
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get ScrollBarJsunit state pages: " + JSON.stringify(pages));
        if (!("ScrollBarPage" == pages.name)) {
          console.info("get ScrollBarJsunit state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options);
          routerAlp.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ScrollBarJsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ScrollBarJsunit page error: " + err);
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   ScrollBarJsunit_static_0100
     * @tc.name     ScrollBarJsunit_static_0100
     * @tc.desc     ScrollBarJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ScrollBarJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the ScrollBar component
      console.info('[ScrollBarJsunit_static_0100] START');
      let strJson = inspector.getInspectorByKey('scrollBar');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ScrollBarJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('direction')).assertEqual('ScrollBarDirection.Vertical');
      expect(obj.getElement('$attrs').getString('state')).assertEqual('BarState.Auto');
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF808080');
      console.info('[ScrollBarJsunit_static_0100] END');
      done();
    });


    
    /**
     * @tc.number   ScrollBarJsunit_static_0200
     * @tc.name     ScrollBarJsunit_static_0200
     * @tc.desc     ScrollBarJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ScrollBarJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Modify the direction of the ScrollBar component
      console.info('[ScrollBarJsunit_static_0200] START');
      AppStorage.get<MessageManager<ScrollBarDirection | string>>('messageManager')?.notify({
        name: 'scrollBarDirection',
        value: 'ScrollBarDirection.Horizontal'
      })
      await CommonFunc.sleep(2000);
      // Get the direction of the ScrollBar component
      let strJson = inspector.getInspectorByKey('scrollBar');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ScrollBarJsunit_static_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('direction')).assertEqual('ScrollBarDirection.Vertical');
      console.info('[ScrollBarJsunit_static_0200] END');
      done();
    });


    
    /**
     * @tc.number   ScrollBarJsunit_static_0300
     * @tc.name     ScrollBarJsunit_static_0300
     * @tc.desc     ScrollBarJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ScrollBarJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Modify the state of the ScrollBar component
      console.info('[ScrollBarJsunit_static_0300] START');
      AppStorage.get<MessageManager<BarState>>('messageManager')?.notify({ name: 'state', value: BarState.Auto })
      await CommonFunc.sleep(1500);
      // Get the state value of the ScrollBar component
      let strJson = inspector.getInspectorByKey('scrollBar');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ScrollBarJsunit_static_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('state')).assertEqual('BarState.Auto');
      console.info('[ScrollBarJsunit_static_0300] END');
      done();
    });


    
    /**
     * @tc.number   ScrollBarJsunit_static_0400
     * @tc.name     ScrollBarJsunit_static_0400
     * @tc.desc     ScrollBarJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ScrollBarJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Modify the backgroundColor of the ScrollBar component
      console.info('[ScrollBarJsunit_static_0400] START');
      AppStorage.get<MessageManager<Color>>('messageManager')?.notify({ name: 'backColor', value: Color.Blue })
      await CommonFunc.sleep(2000);
      // Get the backgroundColor of the ScrollBar component
      let strJson = inspector.getInspectorByKey('scrollBar');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ScrollBarJsunit_static_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF808080');
      console.info('[ScrollBarJsunit_static_0400] END');
      done();
    });


    
    /**
     * @tc.number   ScrollBarJsunit_static_0500
     * @tc.name     ScrollBarJsunit_static_0500
     * @tc.desc     ScrollBarJsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ScrollBarJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Illegal modification of attribute value of the ScrollBar component
      console.info('[ScrollBarJsunit_static_0500] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({ name: 'scrollBarDirection', value: '1' })
      await CommonFunc.sleep(800);
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({ name: 'state', value: '1' })
      await CommonFunc.sleep(800);
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({ name: 'backColor', value: '1' })
      await CommonFunc.sleep(800);
      // Get the attribute value of the ScrollBar component
      let strJson = inspector.getInspectorByKey('scrollBar');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ScrollBarJsunit_static_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('direction')).assertEqual('ScrollBarDirection.Vertical');
      expect(obj.getElement('$attrs').getString('state')).assertEqual('BarState.Auto');
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF808080');
      console.info('[ScrollBarJsunit_static_0500] END');
      done();
    });


    
    /**
     * @tc.number   ScrollBarJsunit_static_0600
     * @tc.name     ScrollBarJsunit_static_0600
     * @tc.desc     ScrollBarJsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ScrollBarJsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Modify the direction of the Scroll component and ScrollBar component
      console.info('[ScrollBarJsunit_static_0600] START');
      AppStorage.get<MessageManager<ScrollDirection | string>>('messageManager')?.notify({
        name: 'ScrollDirection',
        value: 'ScrollDirection.Horizontal'
      })
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<ScrollBarDirection | string>>('messageManager')?.notify({
        name: 'scrollBarDirection',
        value: 'ScrollBarDirection.Horizontal'
      })
      await CommonFunc.sleep(2000);
      // Get the direction of the ScrollBar component
      let strJson = inspector.getInspectorByKey('scrollBar');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ScrollBarJsunit_static_0600] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('direction')).assertEqual('ScrollBarDirection.Vertical');
      console.info('[ScrollBarJsunit_static_0600] END');
      done();
    });
  })
}
