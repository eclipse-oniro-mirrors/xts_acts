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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium"
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { Component } from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function RichEditorMaxLinesTest() {
  describe('RichEditorMaxLinesTest', () => {
    beforeAll(() => {
      console.info("RichEditorMaxLinesTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api18.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("RichEditorMaxLinesTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/RichEditorMaxLinesTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RichEditorMaxLinesTest state pages:" + JSON.stringify(pages));
        if (!("RichEditorMaxLinesTest" == pages.name)) {
          console.info("get RichEditorMaxLinesTest pages.name:" + JSON.stringify(pages.name));
          
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push RichEditorMaxLinesTest page error:" + err);
      }
      console.info("RichEditorMaxLinesTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RichEditorMaxLinesTest after each called");
    });

    
    
    
/**
     * @tc.number   RichEditorMaxLinesTest_static_0001
     * @tc.name     RichEditorMaxLinesTest_static_0001
     * @tc.desc     RichEditorMaxLinesTest_static_0001
     * @tc.level    Level.LEVEL1
     */
it('RichEditorMaxLinesTest_static_0001', Level.LEVEL1, async (done: () => void) => {      let driver = Driver.create();
      console.info('RichEditorMaxLinesTest0001 START');
      let strJson: string = inspector.getInspectorByKey('RichEditorMaxLines');
      let obj = JSON.parseJsonElement(strJson);
      console.log('RichEditorMaxLinesTest-----' + obj.getElement('$attrs').getString('maxLines'));
      expect(obj.getElement('$attrs').getString('maxLines')).assertEqual('4294967295');
      console.info("[RichEditorMaxLinesTest0001] end");
      done();
    });

    
    
    
/**
     * @tc.number   RichEditorMaxLinesTest_static_0002
     * @tc.name     RichEditorMaxLinesTest_static_0002
     * @tc.desc     RichEditorMaxLinesTest_static_0002
     * @tc.level    Level.LEVEL1
     */
it('RichEditorMaxLinesTest_static_0002', Level.LEVEL1, async (done: () => void) => {      let driver = Driver.create();
      console.info('RichEditorMaxLinesTest0002 START');
      await CommonFunc.sleep(1000);
      let set:Component = await driver.findComponent(ON.id('setMaxLine1')) as Component
      await CommonFunc.sleep(500);
      await set.click()
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('RichEditorMaxLines');
      let obj = JSON.parseJsonElement(strJson);
      console.log('RichEditorMaxLinesTest-----' + obj.getElement('$attrs').getString('maxLines'));
      expect(obj.getElement('$attrs').getString('maxLines')).assertEqual('2');
      console.info("[RichEditorMaxLinesTest0002] end");
      done();
    });

    
    
    
/**
     * @tc.number   RichEditorMaxLinesTest_static_0003
     * @tc.name     RichEditorMaxLinesTest_static_0003
     * @tc.desc     RichEditorMaxLinesTest_static_0003
     * @tc.level    Level.LEVEL1
     */
it('RichEditorMaxLinesTest_static_0003', Level.LEVEL1, async (done: () => void) => {      let driver = Driver.create();
      console.info(' RichEditorMaxLinesTest0003 START');
      await CommonFunc.sleep(1000);
      let set:Component = await driver.findComponent(ON.id('setMaxLine2')) as Component
      await CommonFunc.sleep(500);
      await set.click()
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('RichEditorMaxLines');
      let obj = JSON.parseJsonElement(strJson);
      console.log('RichEditorMaxLinesTest-----' + obj.getElement('$attrs').getString('maxLines'));
      expect(obj.getElement('$attrs').getString('maxLines')).assertEqual('6');
      console.info("[RichEditorMaxLinesTest0003] end");
      done();
    });

    
    
    
/**
     * @tc.number   RichEditorMaxLinesTest_static_0004
     * @tc.name     RichEditorMaxLinesTest_static_0004
     * @tc.desc     RichEditorMaxLinesTest_static_0004
     * @tc.level    Level.LEVEL1
     */
it('RichEditorMaxLinesTest_static_0004', Level.LEVEL1, async (done: () => void) => {      let driver = Driver.create();
      console.info(' RichEditorMaxLinesTest0004 START');
      await CommonFunc.sleep(1000);
      let set:Component = await driver.findComponent(ON.id('setMaxLine3')) as Component
      await CommonFunc.sleep(500);
      await set.click()
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('RichEditorMaxLines');
      let obj = JSON.parseJsonElement(strJson);
      console.log('RichEditorMaxLinesTest-----' + obj.getElement('$attrs').getString('maxLines'));
      expect(obj.getElement('$attrs').getString('maxLines')).assertEqual('4294967295');
      console.info("[RichEditorMaxLinesTest0004] end");
      done();
    });
  })
}