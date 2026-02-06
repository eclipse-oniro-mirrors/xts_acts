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

export default function Vector2TTest() {
  describe('Vector2TTest', () => {
    beforeEach(async (done: Function) => {
      console.info('Vector2TTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Vector2TTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get Vector2TTest state pages:' + JSON.stringify(pages));
        if (!('Vector2TTest' == pages.name)) {
          console.info('get Vector2TTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push Vector2TTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push Vector2TTest page error:' + err);
      }
      console.info('Vector2TTest beforeEach end');
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('Vector2TTest after each called');
    });

    /**
     * @tc.number Vector2TTest_001
     * @tc.name Vector2TTest_001
     * @tc.desc test annulusRegion
     * @tc.level Level 0
     * @tc.type
     * @tc.size
     */
    it('Vector2TTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('[Vector2TTest_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);

      let textObj =  getInspectorByKey('textId');
      console.log('Vector2TTest_001 LengthMetricsUnit ', JSON.parse(textObj)?.$attrs.width)
      expect(JSON.parse(textObj)?.$attrs.width).assertEqual('300.00vp');

      let filterTree =  getInspectorByKey('particleId');
      let xValue: string = JSON.parse(filterTree)?.$attrs?.particles[0]?.emitter?.annulusRegion?.center?.x;
      console.log('Vector2TTest_001 center x', xValue);
      expect(xValue).assertEqual('50.00%');
      let yValue: string = JSON.parse(filterTree)?.$attrs?.particles[0]?.emitter?.annulusRegion?.center?.y;
      console.log('Vector2TTest_001 center y', yValue);
      expect(yValue).assertEqual('50.00%');
      done();
    });
  })
}