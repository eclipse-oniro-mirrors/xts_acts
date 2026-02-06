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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "../../../../hypium"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import {UtilsTest,startAbility} from '../Util.test'

export default function ApplyNormalAttributeTest() {
  describe('ApplyNormalAttributeTest', () => {
    beforeAll(() => {
      console.info("ApplyNormalAttributeTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.XNode.api15.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () => {
      console.info("ApplyNormalAttributeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AttributeUpdater/ApplyNormalAttributeTest',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        // let result = await router.replaceUrl(options);
        router.pushUrl(options);
        console.info("get ApplyNormalAttributeTest state pages:" + JSON.stringify(pages));
        if (!("ApplyNormalAttributeTest" == pages.name)) {
          console.info("get ApplyNormalAttributeTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ApplyNormalAttributeTest page error:" + err);
      }
      console.info("ApplyNormalAttributeTest beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ApplyNormalAttributeTest after each called");
    });

  
  
    /**
     * @tc.number   ApplyNormalAttributeTest_static_0100
     * @tc.name     ApplyNormalAttributeTest_static_0100
     * @tc.desc     ApplyNormalAttributeTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('ApplyNormalAttributeTest_static_0100', Level.LEVEL2, async (done: ()=>void) => {

      console.info('ApplyNormalAttributeTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('applyNormalAttribute_btn_id'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('applyNormalAttribute_value_id');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ApplyNormalAttributeTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ApplyNormalAttributeTest_0100] content obj is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('true');
      console.info('[ApplyNormalAttributeTest_0100] END');
      done();
    });

  })
}