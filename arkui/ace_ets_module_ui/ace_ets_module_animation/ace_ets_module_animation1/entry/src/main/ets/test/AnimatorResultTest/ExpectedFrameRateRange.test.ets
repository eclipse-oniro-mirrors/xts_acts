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
import CommonFunc from '../../MainAbility/common/Common';
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
export default function ExpectedFrameRateRange() {
  describe('ExpectedFrameRateRange', () => {
    beforeEach(async (done: Function) => {
      console.info('ExpectedFrameRateRange beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AnimatorResult/ExpectedFrameRateRange',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ExpectedFrameRateRange state pages:' + JSON.stringify(pages));
        if (!('ExpectedFrameRateRange' == pages.name)) {
          console.info('get ExpectedFrameRateRange pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push ExpectedFrameRateRange page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ExpectedFrameRateRange page error:' + err);
      }
      console.info('ExpectedFrameRateRange beforeEach end');
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ExpectedFrameRateRange after each called');
    });
    /**
     * @tc.name   ExpectedFrameRateRange_001
     * @tc.number sExpectedFrameRateRange_001
     * @tc.desc   test min、 max、expected value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ExpectedFrameRateRange_001', Level.LEVEL3, async (done: Function) => {
      console.info('[ExpectedFrameRateRange_001] START');
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 60,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
          console.info('ExpectedFrameRateRange_001 get state result is: ' + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data?.min).assertEqual(60);
          expect(indexEvent.data?.max).assertEqual(120);
          expect(indexEvent.data?.expected).assertEqual(90);
        } catch (err) {
          console.info('ExpectedFrameRateRange_001 get state result is err: ' + JSON.stringify(err));
        }
        console.info('[ExpectedFrameRateRange_001] END');
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info('ExpectedFrameRateRange_001 on events_emitter err : ' + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let play = await driver.findComponent(ON.id('circleId'));
      await play.click();
      console.log('[ExpectedFrameRateRange_001] play btn clicked')
    });
  })
}