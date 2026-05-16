/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter'
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

export default function TestSweepGradientOptions() {
  describe('TestSweepGradientOptions', () => {
    beforeEach(async (done: Function) => {
      console.info('TestSweepGradientOptions beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TestSweepGradientOptions',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TestSweepGradientOptions state pages:' + JSON.stringify(pages));
        if (!('TestSweepGradientOptions' == pages.name)) {
          console.info('get TestSweepGradientOptions pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push TestSweepGradientOptions page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TestSweepGradientOptions page error:' + err);
      }
      console.info('TestSweepGradientOptions beforeEach end');
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('TestSweepGradientOptions after each called');
    });

    /**
     * @tc.name   TestSweepGradientOptions_001
     * @tc.number TestSweepGradientOptions_001
     * @tc.desc   test sweepGradient repeating
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TestSweepGradientOptions_001', Level.LEVEL0, async (done: Function) => {
      console.info('[TestSweepGradientOptions_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);

      let strJson: string = getInspectorByKey('testSweepGradientOptionsId');
      console.info("TestSweepGradientOptions_001 obj is: " + strJson);
      console.info("TestSweepGradientOptions_001 obj repeating is: " + JSON.parse(strJson)?.$attrs?.sweepGradient?.repeating);
      console.info("TestSweepGradientOptions_001 obj rotation is : " +JSON.parse(strJson)?.$attrs?.sweepGradient?.rotation);
      expect(JSON.parse(strJson)?.$attrs?.sweepGradient?.repeating).assertEqual('false');

      let btn = await driver.findComponent(ON.id('changeId'));
      await btn.click();
      await driver.delayMs(1000);
      console.log("[TestSweepGradientOptions_001] click btn");
      await driver.delayMs(1000);
      let strJson2: string = getInspectorByKey('testSweepGradientOptionsId');
      expect(JSON.parse(strJson2)?.$attrs?.sweepGradient?.repeating).assertEqual('true');
      done();
    });
  })
}