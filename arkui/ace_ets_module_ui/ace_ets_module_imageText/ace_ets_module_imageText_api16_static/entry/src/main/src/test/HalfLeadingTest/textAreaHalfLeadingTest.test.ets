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

export default function textAreaHalfLeadingTest() {
  describe('textAreaHalfLeadingTest', () => {
    beforeAll(() => {
      console.info("textAreaHalfLeadingTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api16.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/HalfLeadingTest/textAreaHalfLeadingTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textAreaHalfLeadingTest state success " + JSON.stringify(pages));
        if (!("textAreaHalfLeadingTest" == pages.name)) {
          console.info("get textAreaHalfLeadingTest state success " + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push textAreaHalfLeadingTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textAreaHalfLeadingTest page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("textAreaHalfLeadingTest after each called");
    });


    
    
    /**
     * @tc.number   textAreaHalfLeadingTest_static_0001
     * @tc.name     textAreaHalfLeadingTest_static_0001
     * @tc.desc     textAreaHalfLeadingTest_static_0001
     * @tc.level    Level.LEVEL1
     */
it('textAreaHalfLeadingTest_static_0001', Level.LEVEL1, async () => {
      let driver = Driver.create();
      console.info('textAreaHalfLeadingTest textAreaHalfLeadingTest0001 START');
      await CommonFunc.sleep(1000);
      let area1 = inspector.getInspectorByKey('area1');
      let obj = JSON.parseJsonElement(area1);
      console.log('textAreaHalfLeadingTest0001---' + obj.getElement('$attrs').getBoolean('halfLeading'))
      expect(obj.getElement('$attrs').getBoolean('halfLeading')).assertEqual(true);
      console.info("[textAreaHalfLeadingTest0001] end");
    });


    
    
    /**
     * @tc.number   textAreaHalfLeadingTest_static_0002
     * @tc.name     textAreaHalfLeadingTest_static_0002
     * @tc.desc     textAreaHalfLeadingTest_static_0002
     * @tc.level    Level.LEVEL1
     */
it('textAreaHalfLeadingTest_static_0002', Level.LEVEL1, async () => {
      let driver = Driver.create();
      console.info('textAreaHalfLeadingTest textAreaHalfLeadingTest0002 START');
      await CommonFunc.sleep(1000);
      let area2 = inspector.getInspectorByKey('area2');
      let obj = JSON.parseJsonElement(area2);
      console.log('textAreaHalfLeadingTest0002---' + obj.getElement('$attrs').getBoolean('halfLeading'))
      expect(obj.getElement('$attrs').getBoolean('halfLeading')).assertEqual(false);
      console.info("[textAreaHalfLeadingTest0002] end");
    });


    
    
    /**
     * @tc.number   textAreaHalfLeadingTest_static_0003
     * @tc.name     textAreaHalfLeadingTest_static_0003
     * @tc.desc     textAreaHalfLeadingTest_static_0003
     * @tc.level    Level.LEVEL1
     */
it('textAreaHalfLeadingTest_static_0003', Level.LEVEL1, async () => {
      let driver = Driver.create();
      console.info('textAreaHalfLeadingTest textAreaHalfLeadingTest0003 START');
      await CommonFunc.sleep(1000);
      let area3 = inspector.getInspectorByKey('area3');
      let obj = JSON.parseJsonElement(area3);
      console.log('textAreaHalfLeadingTest0003---' + obj.getElement('$attrs').getBoolean('halfLeading'))
      expect(obj.getElement('$attrs').getBoolean('halfLeading')).assertEqual(false);
      console.info("[textAreaHalfLeadingTest0003] end");
    });


    
    
    /**
     * @tc.number   textAreaHalfLeadingTest_static_0004
     * @tc.name     textAreaHalfLeadingTest_static_0004
     * @tc.desc     textAreaHalfLeadingTest_static_0004
     * @tc.level    Level.LEVEL1
     */
it('textAreaHalfLeadingTest_static_0004', Level.LEVEL1, async () => {
      let driver = Driver.create();
      console.info('textAreaHalfLeadingTest textAreaHalfLeadingTest0004 START');
      await CommonFunc.sleep(1000);
      let area4 = inspector.getInspectorByKey('area4');
      let obj = JSON.parseJsonElement(area4);
      console.log('textAreaHalfLeadingTest0004---' + obj.getElement('$attrs').getBoolean('halfLeading'))
      expect(obj.getElement('$attrs').getBoolean('halfLeading')).assertEqual(false);
      console.info("[textAreaHalfLeadingTest0004] end");
    });

  })
}
