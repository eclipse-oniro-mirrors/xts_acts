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

export default function DateTimeOptions() {
  describe('DateTimeOptions', () => {
    beforeEach(async (done: Function) => {
      console.info("DateTimeOptions beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TimePickerDialog/DateTimeOptions",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DateTimeOptions state pages: " + JSON.stringify(pages));
        if (!("DateTimeOptions" == pages.name)) {
          console.info("get DateTimeOptions state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push DateTimeOptions success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DateTimeOptions page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0350
    * @tc.name  : DateTimeOptions_0100
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('DateTimeOptions_0100', Level.LEVEL2, async (done: Function) => {
      console.info('DateTimeOptions_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let Column = await driver.findComponent(ON.id('DateTimeOptions'));
      await Column.click();
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('DateTimeOptionsValue');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[DateTimeOptions_0100] component obj is: " + JSON.stringify(obj));
      console.info("[DateTimeOptions_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('{"hour":"numeric","minute":"2-digit"} / false');
      console.info('[DateTimeOptions_0100] END');
      done();
    });


  })
}

