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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { startAbility, stopApplication, UtilsTest } from '../Util.test'

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function textInputHalfLeadingTest() {
  describe('textInputHalfLeadingTest', () => {
    beforeAll(() => {
      console.info("textInputHalfLeadingTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api16.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/HalfLeadingTest/textInputHalfLeadingTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textInputHalfLeadingTest state success " + JSON.stringify(pages));
        if (!("textInputHalfLeadingTest" == pages.name)) {
          console.info("get textInputHalfLeadingTest state success " + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push textInputHalfLeadingTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textInputHalfLeadingTest page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("textInputHalfLeadingTest after each called");
    });


    
    
    /**
     * @tc.number   textInputHalfLeadingTest_static_0001
     * @tc.name     textInputHalfLeadingTest_static_0001
     * @tc.desc     textInputHalfLeadingTest_static_0001
     * @tc.level    Level.LEVEL0
     */
it('textInputHalfLeadingTest_static_0001', Level.LEVEL0, async () => {
      let driver = Driver.create();
      console.info('textInputHalfLeadingTest textInputHalfLeadingTest0001 START');
      await CommonFunc.sleep(1000);
      let input1 = inspector.getInspectorByKey('input1');
      let obj = JSON.parseJsonElement(input1);
      console.log('textInputHalfLeadingTest0001---' + obj.getElement('$attrs').getBoolean('halfLeading'))
      expect(obj.getElement('$attrs').getBoolean('halfLeading')).assertEqual(true);
      console.info("[textInputHalfLeadingTest0001] end");
    });


    
    
    /**
     * @tc.number   textInputHalfLeadingTest_static_0002
     * @tc.name     textInputHalfLeadingTest_static_0002
     * @tc.desc     textInputHalfLeadingTest_static_0002
     * @tc.level    Level.LEVEL0
     */
it('textInputHalfLeadingTest_static_0002', Level.LEVEL0, async () => {
      let driver = Driver.create();
      console.info('textInputHalfLeadingTest textInputHalfLeadingTest0002 START');
      await CommonFunc.sleep(1000);
      let input2 = inspector.getInspectorByKey('input2');
      let obj = JSON.parseJsonElement(input2);
      console.log('textInputHalfLeadingTest0002---' + obj.getElement('$attrs').getBoolean('halfLeading'))
      expect(obj.getElement('$attrs').getBoolean('halfLeading')).assertEqual(false);
      console.info("[textInputHalfLeadingTest0002] end");
    });


    
    
    /**
     * @tc.number   textInputHalfLeadingTest_static_0003
     * @tc.name     textInputHalfLeadingTest_static_0003
     * @tc.desc     textInputHalfLeadingTest_static_0003
     * @tc.level    Level.LEVEL0
     */
it('textInputHalfLeadingTest_static_0003', Level.LEVEL0, async () => {
      let driver = Driver.create();
      console.info('textInputHalfLeadingTest textInputHalfLeadingTest0003 START');
      await CommonFunc.sleep(1000);
      let input3 = inspector.getInspectorByKey('input3');
      let obj = JSON.parseJsonElement(input3);
      console.log('textInputHalfLeadingTest0003---' + obj.getElement('$attrs').getBoolean('halfLeading'))
      expect(obj.getElement('$attrs').getBoolean('halfLeading')).assertEqual(false);
      console.info("[textInputHalfLeadingTest0003] end");
    });


    
    
    /**
     * @tc.number   textInputHalfLeadingTest_static_0004
     * @tc.name     textInputHalfLeadingTest_static_0004
     * @tc.desc     textInputHalfLeadingTest_static_0004
     * @tc.level    Level.LEVEL0
     */
it('textInputHalfLeadingTest_static_0004', Level.LEVEL0, async () => {
      let driver = Driver.create();
      console.info('textInputHalfLeadingTest textInputHalfLeadingTest0004 START');
      await CommonFunc.sleep(1000);
      let input4 = inspector.getInspectorByKey('input4');
      let obj = JSON.parseJsonElement(input4);
      console.log('textInputHalfLeadingTest0004---' + obj.getElement('$attrs').getBoolean('halfLeading'))
      expect(obj.getElement('$attrs').getBoolean('halfLeading')).assertEqual(false);
      console.info("[textInputHalfLeadingTest0004] end");
    });

  })
}
