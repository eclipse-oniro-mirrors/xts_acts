/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
import window from '@ohos.window';

export default function dateTimeOptions() {
  describe('dateTimeOptions', () => {
    beforeEach(async (done: Function) => {
      console.info("dateTimeOptions beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TimePicker/dateTimeOptions',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get dateTimeOptions state pages: " + JSON.stringify(pages));
        if (!("dateTimeOptions" == pages.name)) {
          console.info("get dateTimeOptions state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push dateTimeOptions success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push dateTimeOptions page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   dateTimeOptions_0100
     * @tc.number SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0350
     * @tc.desc   To test that the Provide decorator supports union types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dateTimeOptions_0100', Level.LEVEL1, async (done: Function) => {
      console.info('dateTimeOptions_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('dateTimeOptionsXTS'));
      await button.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('dateTimeOptionsValue');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dateTimeOptions_0100] component obj is: " + JSON.stringify(obj));
      console.info("[dateTimeOptions_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('{"hour":"numeric","minute":"2-digit","second":"numeric"}');
      console.info('[dateTimeOptions_0100] END');
      done();
    });

  })
}

