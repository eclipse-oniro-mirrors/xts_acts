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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium/index';
import router from '@ohos.router';
import { Driver, ON, Component, Rect } from '@ohos.UiTest';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function TextClockApiTest() {
  describe("TextClockApiTest", (): void => {
    beforeAll(() => {
      console.info("TextClockApiTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextClockApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextClock/TextClockApi/TextClockApi",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextClockApiTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get TextClockApiTest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextClockApiTest page error:" + err);
      }
      console.info("TextClockApiTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextClockApiTest after each called");
    });

    /**
     * @tc.number   TextClockApiTest_static_001
     * @tc.name     TextClockApiTest_static_001
     * @tc.desc     TextClockApiTest_static_001
     * @tc.level   Level.LEVEL0
     */
    it("TextClockApiTest_static_001",  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[TextClockApiTest_001] START");
      await CommonFunc.sleep(1000);
      let started = inspector.getInspectorByKey("started");
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(started).getElement('$attrs').getString('content')).assertEqual("true");
      console.info("[TextClockApiTest_001] END");
      done();
    });

    /**
     * @tc.number   TextClockApiTest_static_002
     * @tc.name     TextClockApiTest_static_002
     * @tc.desc     TextClockApiTest_static_002
     * @tc.level   Level.LEVEL0
     */
    it("TextClockApiTest_static_002",  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[TextClockApiTest_002] START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let stop = await driver.findComponent(ON.id("stop"));
      await (stop?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let TimeValue = inspector.getInspectorByKey("TimeValue");
      console.info("TimeValue11--" + JSON.parseJsonElement(TimeValue).getElement('$attrs').getDouble('content'));
      let time1 = JSON.parseJsonElement(TimeValue).getElement('$attrs').getDouble('content')
      console.info("time1--" + time1);
      await CommonFunc.sleep(1000);
      let start = await driver.findComponent(ON.id("start"));
      await (start?.click() as Promise<void>);
      let TimeValue2 = inspector.getInspectorByKey("TimeValue2");
      console.info("TimeValue22--" + JSON.parseJsonElement(TimeValue2).getElement('$attrs').getDouble('content'));
      await CommonFunc.sleep(1000);
      let time2 = JSON.parseJsonElement(TimeValue).getElement('$attrs').getDouble('content')
      console.info("time2--" + time2);
      await CommonFunc.sleep(1000);
      expect(Math.abs(time2 - time1) <= 3).assertTrue();
      console.info("[TextClockApiTest_002] END");
      done();
    });

  })
}
