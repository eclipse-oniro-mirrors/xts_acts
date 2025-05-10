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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import CommonFunc from '../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';


export default function VideoTest1() {
  describe('VideoTest1', () => {
    beforeEach(async (done: Function) => {
      console.info("VideoTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Video/VideoTest1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get VideoTest1 state success " + JSON.stringify(pages));
        if (!("VideoTest1" == pages.name)) {
          console.info("get VideoTest1 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push VideoTest1 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push VideoTest1 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("VideoTest1 after each called");
    });

    /**
     * @tc.number VideoTest1_0100
     * @tc.name VideoTest1_0100
     * @tc.desc Test video onStop
     * @tc.level Level 2
     */
    it('VideoTest1_0100', 0, async (done: Function) => {
      console.info('[VideoTest1_0100] START');
      await CommonFunc.sleep(2000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('VideoTest1_start'));
      await btn1.click()
      console.info("[VideoTest1_0100] btn1");
      await CommonFunc.sleep(2000);

      let btn2 = await driver.findComponent(ON.id('VideoTest1_stop'));
      await btn2.click()
      console.info("[VideoTest1_0100] btn2");
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('VideoTest1_text');
      await CommonFunc.sleep(1000);
      console.info("[VideoTest1_0100] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('onStop');

      console.info('[VideoTest1_0100] END');
      done();
    });
  })
}

