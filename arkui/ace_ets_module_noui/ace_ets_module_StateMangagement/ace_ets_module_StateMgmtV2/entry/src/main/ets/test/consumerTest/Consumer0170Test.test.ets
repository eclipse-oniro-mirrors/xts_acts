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
import { Driver, Component, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function Consumer0170Test() {
  describe('Consumer0170Test', () => {
    beforeEach(async (done: Function) => {
      console.info("Consumer0170Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/consumer/Consumer0170",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("Consumer0170" == pages.name)) {
          console.info("get Consumer0170Test pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Consumer0170Test page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Consumer0170Test page error:" + err);
      }
      console.info("Consumer0170Test beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Consumer0170Test after each called");
    });

    /**
     * @tc.name   Consumer0170Test_001
     * @tc.number Consumer0170Test_001
     * @tc.desc   Persistently store UI related data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Consumer0170Test_001', Level.LEVEL1, async (done: Function) => {
      console.info('[Consumer0170Test_001] START');
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvChildConsumer01701'));
      console.info("[Consumer0170Test_001] obj content: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('5');
      console.info('[Consumer0170Test_001] END');
      done();
    });

    /**
     * @tc.name   Consumer0170Test_002
     * @tc.number Consumer0170Test_002
     * @tc.desc   Persistently store UI related data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Consumer0170Test_002', Level.LEVEL1, async (done: Function) => {
      console.info('[Consumer0170Test_002] START');
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(getInspectorByKey('tvChildConsumer01702'));
      console.info("[Consumer0170Test_002] obj1 content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('1000');
      console.info('[Consumer0170Test_002] END');
      done();
    });
  })
}
