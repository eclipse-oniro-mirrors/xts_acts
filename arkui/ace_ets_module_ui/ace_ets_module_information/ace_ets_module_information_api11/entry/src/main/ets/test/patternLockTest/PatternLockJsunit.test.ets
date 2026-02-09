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
import { describe, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../MainAbility/common/Common';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.information/MainAbility';

export default function patternLockJsunit() {
  describe('appInfoTest_four_5', () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("patternLock beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/patternLock/patternLock',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get patternLock state pages: " + JSON.stringify(pages));
        if (!("button" == pages.name)) {
          console.info("get patternLock state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push patternLock page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("patternLock after each called");
    })

    /**
     * @tc.name   testPatternLock_01
     * @tc.number testPatternLock_01
     * @tc.desc   testPatternLock_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPatternLock_01', Level.LEVEL0, async (done: Function) => {
      console.info('testPatternLock_01 START');
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("testPatternLock_01 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data?.ACTION).assertEqual(true);
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 153,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("testPatternLock_01 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("testPatternLock_01 click result is: " + JSON.stringify(sendEventByKey('button1', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('testPatternLock_01 END');
      done();
    });
  })
}
