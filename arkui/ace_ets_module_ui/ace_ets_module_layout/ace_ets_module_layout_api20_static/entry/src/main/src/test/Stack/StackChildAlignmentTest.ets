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

import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import RectValue from '../../../ets/MainAbility/common/Rect';
import Utils from '../../../ets/MainAbility/common/Utils';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function StackChildAlignmentTest() {
  describe('StackChildAlignmentTest', () => {
    beforeAll(() => {
      console.info("StackChildAlignmentTest beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.layout.api20.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("StackChildAlignmentTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/StackChildAlignment',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get StackChildAlignmentTest state pages:" + JSON.stringify(pages));
        if (!("StackChildAlignmentTest" == pages.name)) {
          console.info("get StackChildAlignmentTest pages.name:" + JSON.stringify(pages.name));
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push StackChildAlignmentTest page error:" + err);
      }
      console.info("StackChildAlignmentTest beforeEach end");
      
    });
    afterEach(async () => {
    });

    
/**
     * @tc.number   StackChildAlignmentTest_static_0100
     * @tc.name     StackChildAlignmentTest_static_0100
     * @tc.desc     StackChildAlignmentTest_static_0100
     * @tc.level    Level.LEVEL1
     */
it('StackChildAlignmentTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[StackChildAlignmentTest_static_0100] START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('AlignmentText1');
      console.log('[StackChildAlignmentTest_static_0100] layoutGravity1 is:' +
      JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getString("layoutGravity")));
      let strJson2 = inspector.getInspectorByKey('AlignmentText2');
      console.log('[StackChildAlignmentTest_static_0100] layoutGravity2 is:' +
      JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString("layoutGravity")));
      let strJson3 = inspector.getInspectorByKey('AlignmentText3');
      console.log('[StackChildAlignmentTest_static_0100] layoutGravity3 is:' +
      JSON.stringify(JSON.parseJsonElement(strJson3).getElement('$attrs').getString("layoutGravity")));
      let strJson4 = inspector.getInspectorByKey('AlignmentText4');
      console.log('[StackChildAlignmentTest_static_0100] layoutGravity4 is:' +
      JSON.stringify(JSON.parseJsonElement(strJson4).getElement('$attrs').getString("layoutGravity")));
      let strJson5 = inspector.getInspectorByKey('AlignmentText5');
      console.log('[StackChildAlignmentTest_static_0100] layoutGravity5 is:' +
      JSON.stringify(JSON.parseJsonElement(strJson5).getElement('$attrs').getString("layoutGravity")));
      let strJson6 = inspector.getInspectorByKey('AlignmentText6');
      console.log('[StackChildAlignmentTest_static_0100] layoutGravity6 is:' +
      JSON.stringify(JSON.parseJsonElement(strJson6).getElement('$attrs').getString("layoutGravity")));
      let strJson7 = inspector.getInspectorByKey('AlignmentText7');
      console.log('[StackChildAlignmentTest_static_0100] layoutGravity7 is:' +
      JSON.stringify(JSON.parseJsonElement(strJson7).getElement('$attrs').getString("layoutGravity")));
      let strJson8 = inspector.getInspectorByKey('AlignmentText8');
      console.log('[StackChildAlignmentTest_static_0100] layoutGravity8 is:' +
      JSON.stringify(JSON.parseJsonElement(strJson8).getElement('$attrs').getString("layoutGravity")));
      let strJson9 = inspector.getInspectorByKey('AlignmentText9');
      console.log('[StackChildAlignmentTest_static_0100] layoutGravity9 is:' +
      JSON.stringify(JSON.parseJsonElement(strJson9).getElement('$attrs').getString("layoutGravity")));

      expect(JSON.parseJsonElement(strJson1).getElement("$attrs").getString("layoutGravity"))
        .assertEqual('Alignment.TopStart');
      expect(JSON.parseJsonElement(strJson2).getElement("$attrs").getString("layoutGravity"))
        .assertEqual('Alignment.Top');
      expect(JSON.parseJsonElement(strJson3).getElement("$attrs").getString("layoutGravity"))
        .assertEqual('Alignment.TopEnd');
      expect(JSON.parseJsonElement(strJson4).getElement("$attrs").getString("layoutGravity"))
        .assertEqual('Alignment.Start');
      expect(JSON.parseJsonElement(strJson5).getElement("$attrs").getString("layoutGravity"))
        .assertEqual('Alignment.Center');
      expect(JSON.parseJsonElement(strJson6).getElement("$attrs").getString("layoutGravity"))
        .assertEqual('Alignment.End');
      expect(JSON.parseJsonElement(strJson7).getElement("$attrs").getString("layoutGravity"))
        .assertEqual('Alignment.BottomStart');
      expect(JSON.parseJsonElement(strJson8).getElement("$attrs").getString("layoutGravity"))
        .assertEqual('Alignment.Bottom');
      expect(JSON.parseJsonElement(strJson9).getElement("$attrs").getString("layoutGravity"))
        .assertEqual('Alignment.BottomEnd');

      console.info('[StackChildAlignmentTest_static_0100] END');
      done();
    });


  })
}