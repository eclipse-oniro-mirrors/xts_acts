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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium/index'
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { UIContext,Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest,  startAbility} from '../../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function TextAreaTest() {
  describe('TextAreaTest', () => {
    beforeAll(() => {
      console.info("TextAreaTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextAreaTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/TextAreaAPI/TextArea",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextAreaTest state pages:" + JSON.stringify(pages));
        if (!("TextArea" == pages.name)) {
          console.info("get TextAreaTest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextAreaTest page error:" + err);
      }
      console.info("TextAreaTest beforeEach end");
    }); 

    
    /**
     * @tc.number   TextAreaTest_static_0100
     * @tc.name     TextAreaTest_static_0100
     * @tc.desc     TextAreaTest_static_0100
     * @tc.level   Level.LEVEL0
     */
    it('TextAreaTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextAreaTest_0100 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await (driver.findComponent(ON.id('TextArea_5')) as Promise<Component>);
      await button.click();
      await CommonFunc.sleep(1000);
	    await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await button.inputText("hello")
	    await driver.triggerKey(2047)
      await CommonFunc.sleep(2000);
	    await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('TextArea_1');
      let obj = JSON.parseJsonElement(strJson);
      let strJson1 = inspector.getInspectorByKey('TextArea_2');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[TextAreaTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onWillInsert');
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('onDidInsert');
      console.info('[TextAreaTest_0100] END');
      done();
    });
    
    /**
     * @tc.number   TextAreaTest_static_0200
     * @tc.name     TextAreaTest_static_0200
     * @tc.desc     TextAreaTest_static_0200
     * @tc.level   Level.LEVEL0
     */
    it('TextAreaTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextAreaTest_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await (driver.findComponent(ON.id('TextArea_6')) as Promise<Component>);
      await button.click();
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await button.clearText()
      await CommonFunc.sleep(3000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('TextArea_3');
      let obj = JSON.parseJsonElement(strJson);
      let strJson1 = inspector.getInspectorByKey('TextArea_4');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[TextAreaTest_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onWillDelete');
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('onDidDelete');
      console.info('[TextAreaTest_0200] END');
      done();
    });
  })
}

