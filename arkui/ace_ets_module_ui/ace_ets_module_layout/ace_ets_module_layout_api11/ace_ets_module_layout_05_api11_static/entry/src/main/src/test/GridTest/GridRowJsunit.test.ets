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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from "../../../../hypium/index"
import { BreakPoints, GridRowDirection, GutterOption } from '@ohos.arkui.component'
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function GridRowJsunit() {
  describe('GridRowJsunit', () => {
    beforeAll(() => {
      console.info("GridRowJsunit beforeAll start");
           
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("GridRowJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridRowPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get GridRowJsunit state pages: " + JSON.stringify(pages));
        if (!("GridRowPage" == pages.name)) {
          console.info("get GridRowJsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push GridRowJsunit page error: " + err);
      }
    });
    
    
    

/**
     * @tc.number   GridRowJsunit_static_0100
     * @tc.name     GridRowJsunit_static_0100
     * @tc.desc     GridRowJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('GridRowJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridRowJsunit_static_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('gridRow');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridRowJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[GridRowJsunit_static_0100] columns: " +
      JSON.stringify(obj.getElement('$attrs').getString('columns')));
      console.info("[GridRowJsunit_static_0100] breakpoints: " +
      JSON.stringify(obj.getElement('$attrs').getString('breakpoints')));
      console.info("[GridRowJsunit_static_0100] direction: " +
      JSON.stringify(obj.getElement('$attrs').getString('direction')));
      console.info("[GridRowJsunit_static_0100] gutter: " +
      JSON.stringify(obj.getElement('$attrs').getString('gutter')));
      expect(obj.getElement('$attrs').getString('columns')).assertEqual('4');
      expect(obj.getElement('$attrs').getString('breakpoints')).assertEqual('[400vp, 600vp, 800vp,]');
      expect(obj.getElement('$attrs').getString('direction')).assertEqual('Row');
      

      let x = Number(UIContext.resolveUIContext()!.vp2px(5)).toFixed(6);
      let y = Number(UIContext.resolveUIContext()!.vp2px(10)).toFixed(6);
      let str = '<' + x + ', ' + y;
      expect(obj.getElement('$attrs').getString('gutter')).assertEqual(str);
      console.info('[GridRowJsunit_static_0100] END');
      done();
    });
    
    
    

/**
     * @tc.number   GridRowJsunit_static_0200
     * @tc.name     GridRowJsunit_static_0200
     * @tc.desc     GridRowJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('GridRowJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridRowJsunit_static_0200] START');
      AppStorage.get<MessageManager<string | number | GutterOption | BreakPoints | GridRowDirection>>('messageManager')?.notify({
        name: 'columns',
        value: '12'
      })
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<string | number | GutterOption | BreakPoints | GridRowDirection>>('messageManager')?.notify({
        name: 'gutter', value: {
          x: 7.5,
          y: 15
        } as GutterOption
      })
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<string | number | GutterOption | BreakPoints | GridRowDirection>>('messageManager')?.notify({
        name: 'currentBp',
        value: 'sm'
      })
      await CommonFunc.sleep(200);

      
      let strJson = inspector.getInspectorByKey('gridRow');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridRowJsunit_static_0200] component obj is: " + JSON.stringify(obj));
      console.info("[GridRowJsunit_static_0200] columns: " +
      JSON.stringify(obj.getElement('$attrs').getString('columns')));
      console.info("[GridRowJsunit_static_0200] breakpoints: " +
      JSON.stringify(obj.getElement('$attrs').getString('breakpoints')));
      console.info("[GridRowJsunit_static_0200] direction: " +
      JSON.stringify(obj.getElement('$attrs').getString('direction')));
      console.info("[GridRowJsunit_static_0200] gutter: " +
      JSON.stringify(obj.getElement('$attrs').getString('gutter')));

      if (UIContext.resolveUIContext()!.px2vp(AppStorage.get<number>("winWidth")!) < 320) {
        expect(obj.getElement('$attrs').getString('columns')).assertEqual('2');
      } else if (UIContext.resolveUIContext()!.px2vp(AppStorage.get<number>("winWidth")!) < 600) {
        expect(obj.getElement('$attrs').getString('columns')).assertEqual('12');
      } else if (UIContext.resolveUIContext()!.px2vp(AppStorage.get<number>("winWidth")!) < 840) {
        expect(obj.getElement('$attrs').getString('columns')).assertEqual('8');
      } else {
        expect(obj.getElement('$attrs').getString('columns')).assertEqual('12');
      }
      expect(obj.getElement('$attrs').getString('breakpoints')).assertEqual('[400vp, 600vp, 800vp,]');
      expect(obj.getElement('$attrs').getString('direction')).assertEqual('Row');
      console.info('[GridRowJsunit_static_0200] END');
      done();
    });
    
    
    

/**
     * @tc.number   GridRowJsunit_static_0300
     * @tc.name     GridRowJsunit_static_0300
     * @tc.desc     GridRowJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('GridRowJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridRowJsunit_static_0300] START');
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<string | number | GutterOption | BreakPoints | GridRowDirection>>('messageManager')?.notify({
        name: 'columns',
        value: '-5'
      })
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<string | number | GutterOption | BreakPoints | GridRowDirection>>('messageManager')?.notify({
        name: 'currentBp',
        value: '110'
      })
      await CommonFunc.sleep(200);
      let strJson = inspector.getInspectorByKey('gridRow');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridRowJsunit_static_0300] component obj is: " + JSON.stringify(obj));
      console.info("[GridRowJsunit_static_0300] columns: " +
      JSON.stringify(obj.getElement('$attrs').getString('columns')));
      console.info("[GridRowJsunit_static_0300] breakpoints: " +
      JSON.stringify(obj.getElement('$attrs').getString('breakpoints')));
      console.info("[GridRowJsunit_static_0300] direction: " +
      JSON.stringify(obj.getElement('$attrs').getString('direction')));
      console.info("[GridRowJsunit_static_0300] gutter: " +
      JSON.stringify(obj.getElement('$attrs').getString('gutter')));

      if (UIContext.resolveUIContext()!.px2vp(AppStorage.get<number>("winWidth")!) < 320) {
        expect(obj.getElement('$attrs').getString('columns')).assertEqual('2');
      } else if (UIContext.resolveUIContext()!.px2vp(AppStorage.get<number>("winWidth")!) < 600) {
        expect(obj.getElement('$attrs').getString('columns')).assertEqual('4');
      } else if (UIContext.resolveUIContext()!.px2vp(AppStorage.get<number>("winWidth")!) < 840) {
        expect(obj.getElement('$attrs').getString('columns')).assertEqual('8');
      } else {
        expect(obj.getElement('$attrs').getString('columns')).assertEqual('12');
      }
      expect(obj.getElement('$attrs').getString('breakpoints')).assertEqual('[400vp, 600vp, 800vp,]');
      expect(obj.getElement('$attrs').getString('direction')).assertEqual('Row');
      console.info('[GridRowJsunit_static_0300] END');
      done();
    });
    
    
    

/**
     * @tc.number   GridRowJsunit_static_0400
     * @tc.name     GridRowJsunit_static_0400
     * @tc.desc     GridRowJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('GridRowJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridRowJsunit_static_0400] START');
      let strJson = inspector.getInspectorByKey('gridRow_default');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridRowJsunit_static_0400] component obj is: " + JSON.stringify(obj));
      console.info("[GridRowJsunit_static_0400] columns: " +
      JSON.stringify(obj.getElement('$attrs').getString('columns')));
      console.info("[GridRowJsunit_static_0400] breakpoints: " +
      JSON.stringify(obj.getElement('$attrs').getString('breakpoints')));
      console.info("[GridRowJsunit_static_0400] direction: " +
      JSON.stringify(obj.getElement('$attrs').getString('direction')));
      console.info("[GridRowJsunit_static_0400] gutter: " +
      JSON.stringify(obj.getElement('$attrs').getString('gutter')));
      console.info("AppStorage.get<number>(winWidth): " + AppStorage.get<number>("winWidth"));
      if (UIContext.resolveUIContext()!.px2vp(AppStorage.get<number>("winWidth")!) < 320) {
        expect(obj.getElement('$attrs').getString('columns')).assertEqual('2');
      } else if (UIContext.resolveUIContext()!.px2vp(AppStorage.get<number>("winWidth")!) < 600) {
        expect(obj.getElement('$attrs').getString('columns')).assertEqual('4');
      } else if (UIContext.resolveUIContext()!.px2vp(AppStorage.get<number>("winWidth")!) < 840) {
        expect(obj.getElement('$attrs').getString('columns')).assertEqual('8');
      } else {
        expect(obj.getElement('$attrs').getString('columns')).assertEqual('12');
      }
      expect(obj.getElement('$attrs').getString('gutter')).assertEqual('<0.000000, 0.000000');
      expect(obj.getElement('$attrs').getString('breakpoints')).assertEqual('[320vp, 600vp, 840vp,]');
      expect(obj.getElement('$attrs').getString('direction')).assertEqual('Row');
      console.info('[GridRowJsunit_static_0400] END');
      done();
    });
  })
}
