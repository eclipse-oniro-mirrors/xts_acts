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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';


export default function IMonitorTest() {
  describe('IMonitorTest', () => {
    beforeEach(async (done: Function) => {
      console.info("IMonitorTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Monitor/IMonitor',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get IMonitorTest state pages: " + JSON.stringify(pages));
        if (!("IMonitor" == pages.name)) {
          console.info("get IMonitorTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push IMonitorTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push IMonitorTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    IMonitorTest_0100
     * @tc.name      IMonitorTest_0100
     * @tc.desc      test the api of IMonitor: before and now
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('IMonitorTest_0100', 0, async (done: Function) => {
      console.info('IMonitorTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('IMonitor_button'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('IMonitorValue_before');
      let obj: ESObject = JSON.parse(strJson);
      let strJson1 = getInspectorByKey('IMonitorValue_now');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[IMonitorTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Tom');
      expect(obj1.$attrs.content).assertEqual('IMonitor succ');
      console.info('[IMonitorTest_0100] END');
      done();
    });
  })
}

