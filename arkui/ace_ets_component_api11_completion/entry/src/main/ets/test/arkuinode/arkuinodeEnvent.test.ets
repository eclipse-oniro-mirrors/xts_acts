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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/utils/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function arkuiNodeEventTest() {
  describe('arkuiNodeEventTest', function () {
    beforeEach(async function (done) {
      console.info("arkuiNodeEventTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get arkuiNodeEventTest state pages:" + JSON.stringify(pages));
        if (!("arkuinodeEvent" == pages.name)) {
          console.info("get arkuinodeEvent pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/arkuinode/arkuinodeEvent"})
          await CommonFunc.sleep(2000);
          console.info("push arkuiNodeEventTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push arkuiNodeEventTest page error:" + err);
      }
      console.info("arkuiNodeEventTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("arkuiNodeEventTest after each called");
    });

    /**
     * @tc.number    SUB_ACE_arkuinodeEvent0100
     * @tc.name      testarkuinodeevent_0100
     * @tc.desc      set api
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('arkuinodeevent_0100', 0, async function (done) {
      console.info('[arkuinodeevent_0100] START');
      await CommonFunc.sleep(2000);
      // touch
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn1 = await driver.findComponent(ON.id('nodeTest'));
      await btn1.click();
      await CommonFunc.sleep(1000);

      let json = getInspectorByKey('nodeeventButton');
      let Obj1 = JSON.parse(json);
      console.info("arkuinodeevent_0100 json info " + JSON.stringify(json));
      expect(Obj1.$attrs.label).assertEqual('button this is a string');

      done();
    });

    /**
     * @tc.number    SUB_ACE_arkuinodeEvent0200
     * @tc.name      testarkuinodeevent_0200
     * @tc.desc      test postTouchEvent
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('arkuinodeevent_0200', 0, async function (done) {
      console.info('[arkuinodeevent_0200] START');
      await CommonFunc.sleep(2000);
      // touch
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn1 = await driver.findComponent(ON.id('columnTest'));
      await btn1.click();
      await CommonFunc.sleep(1000);

      let json = getInspectorByKey('nodeeventButton');
      let Obj1 = JSON.parse(json);
      console.info("arkuinodeevent_0100 json info " + JSON.stringify(json));
      expect(Obj1.$attrs.label).assertEqual('button this is a string');

      done();
    });

  })
}
