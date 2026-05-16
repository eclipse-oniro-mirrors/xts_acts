'use static';
/*
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

import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
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
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function LayoutInspectorTest() {
  describe('LayoutInspectorTest', () => {
    beforeAll(() => {
      console.info("GridRowNoColumnsTest beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.layout.api20.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("LayoutInspectorTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/inspector/layoutInspector',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get LayoutInspectorTest state pages:" + JSON.stringify(pages));
        if (!("layoutInspector" == pages.name)) {
          console.info("get LayoutInspectorTest pages.name:" + JSON.stringify(pages.name));
          
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push LayoutInspectorTest page error:" + err);
      }
      console.info("LayoutInspectorTest beforeEach end");
      
    });
    afterEach(async () => {
    });

    
    
/**
     * @tc.number   ISLAYOUT_INSPECTOR_static_0100
     * @tc.name     ISLAYOUT_INSPECTOR_static_0100
     * @tc.desc     ISLAYOUT_INSPECTOR_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ISLAYOUT_INSPECTOR_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ISLAYOUT_INSPECTOR_0100 START');
      
      let testStr: string = AppStorage.get<UIContext>("uiContext")!.getFilteredInspectorTree(['isLayoutInspector'])
      console.info("ISLAYOUT_INSPECTOR_0100 testStr: " + testStr);
  console.info('ISLAYOUT_INSPECTOR_0100 content' + JSON.parseJsonElement(testStr).getElement("content"));

      let isContainContent: boolean = JSON.parseJsonElement(testStr).getElement("content") === undefined ? false : true
      
      expect(isContainContent).assertEqual(true);
      console.info('[ISLAYOUT_INSPECTOR_0100] END');
      done();
    });

    
    
/**
     * @tc.number   ISLAYOUT_INSPECTOR_static_0200
     * @tc.name     ISLAYOUT_INSPECTOR_static_0200
     * @tc.desc     ISLAYOUT_INSPECTOR_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ISLAYOUT_INSPECTOR_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ISLAYOUT_INSPECTOR_0200 start: ");
      
      let testStr: string = AppStorage.get<UIContext>("uiContext")!.getFilteredInspectorTree(['content'])
      console.info("ISLAYOUT_INSPECTOR_0200 testStr: " + testStr);
      console.info("ISLAYOUT_INSPECTOR_0200 testStr: " + JSON.stringify(JSON.parseJsonElement(testStr)));
      console.info('ISLAYOUT_INSPECTOR_0200 content' + JSON.parseJsonElement(testStr).getString("content"));
      
      let isContainContent: boolean = JSON.parseJsonElement(testStr).getString("content") === undefined ? true : false
      
      expect(isContainContent).assertEqual(true);
      console.info('[ISLAYOUT_INSPECTOR_0200] END');
      done();
    });
  })
}