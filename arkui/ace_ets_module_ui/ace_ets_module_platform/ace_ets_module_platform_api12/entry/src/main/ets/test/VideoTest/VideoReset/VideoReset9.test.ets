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
import CommonFunc from '../../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';


export default function VideoReset9() {
  describe('VideoReset9', () => {
    beforeEach(async (done: Function) => {
      console.info("VideoReset9 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Video/VideoReset/VideoReset9',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get VideoReset9 state success " + JSON.stringify(pages));
        if (!("VideoReset9" == pages.name)) {
          console.info("get VideoReset9 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push VideoReset9 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push VideoReset9 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("VideoReset9 after each called");
    });

    /**
     * @tc.number    VideoReset9_0100
     * @tc.name      VideoReset9_0100
     * @tc.desc      Test video reset
     * @tc.level     Level 2
     */
    it('VideoReset9_0100', 0, async function (done) {
      console.info('[VideoReset9_0100] START');
      await CommonFunc.sleep(5000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn1 = await driver.findComponent(ON.id('VideoReset9_start'));
      await btn1.click()
      console.info("[VideoReset9_0100] btnStart");
      await CommonFunc.sleep(3000);

      let btn2 = await driver.findComponent(ON.id('VideoReset9_reset'));
      await btn2.click()
      console.info("[VideoReset9_0100] btnReset click1");
      await CommonFunc.sleep(3000);
      await btn2.click()
      console.info("[VideoReset9_0100] btnReset click2");
      await CommonFunc.sleep(3000);

      let strJson1 = getInspectorByKey('VideoReset9_text2');
      let obj1 = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[VideoReset9_0100] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('0');

      let btnAutoPlay = await driver.findComponent(ON.id('VideoReset9_autoPlay'));
      await btnAutoPlay.click()
      console.info("[VideoReset9_0100] btnAutoPlay");
      await CommonFunc.sleep(3000);

      await btn2.click()
      console.info("[VideoReset9_0100] btnReset click3");
      await CommonFunc.sleep(4000);
      await btn2.click()
      console.info("[VideoReset9_0100] btnReset click4");
      await CommonFunc.sleep(4000);

      let strJson2 = getInspectorByKey('VideoReset9_text1');
      let obj2 = JSON.parse(strJson2);
      await CommonFunc.sleep(1000);
      console.info("[VideoReset9_0100] obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('onStart3');

      console.info('[VideoReset9_0100] END');
      done();
    });
  })
}

