/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, it, Level } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../MainAbility/common/Common';;

export default function focusJsunit() {
  describe('appInfoTest_four_2', () => {
    beforeEach(async (done: Function) => {
      console.info("focus beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/button/focus',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get focus state pages:" + JSON.stringify(pages));
        if (!("focus" == pages.name)) {
          console.info("get focus state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push focus page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push focus page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("focus after each called");
    });

    it('focusTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('focusTest_0100 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "focusable": true
          }
        }
        let indexEventOne: events_emitter.InnerEvent = {
          eventId: 101,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("focusTest_0100 start to publish emit");
        events_emitter.emit(indexEventOne, eventData);
      } catch (err) {
        console.log("focusTest_0100 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      console.info('focusTest_0100 END');
      done();
    });
  })
}