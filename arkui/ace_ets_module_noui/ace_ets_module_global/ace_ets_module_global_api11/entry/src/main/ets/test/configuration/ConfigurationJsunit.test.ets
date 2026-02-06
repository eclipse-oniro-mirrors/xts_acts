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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../MainAbility/utils/Common';
import emitter from '@ohos.events.emitter';
export default function configurationJsunit() {
  describe('configurationJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("prompt beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/configuration/configuration',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get prompt state pages:" + JSON.stringify(pages));
        if (!("configuration" == pages.name)) {
          console.info("get prompt state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push prompt  page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push prompt  page error:" + err);
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("prompt each called");
    });
    /**
     * @tc.name   configurationTest_0100
     * @tc.number configurationTest
     * @tc.desc   configuration test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('configurationTest_0100', Level.LEVEL0, async(done: Function) => {
      console.info('configurationTest_0100 is start');
      try {
        let callBackConfiguration = (backData: events_emitter.EventData) => {
          console.info("configurationTest_0100 get configurationEvent result is: " + JSON.stringify(backData));
          expect(backData.data?.COUNTRY).assertEqual('CN');
          expect(backData.data?.DIR).assertEqual('ltr');
          done();
        }
        let configurationEvent: emitter.InnerEvent = {
          eventId: 78,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(configurationEvent, callBackConfiguration);
      } catch (err) {
        console.info("configurationTest_0100 on configurationEvent err : " + JSON.stringify(err));
      }
      console.info("testAppear01 click result is: " + JSON.stringify(sendEventByKey('button_c', 10, "")));
      console.info('[configurationTest01] END');
    }
    )
    ;
  })
}