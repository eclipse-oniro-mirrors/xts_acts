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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import CommonFunc from '../../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';


export default function VideoReset1() {
  describe('VideoReset1', () => {
    beforeEach(async (done: Function) => {
      console.info("VideoReset1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Video/VideoReset/VideoReset1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get VideoReset1 state success " + JSON.stringify(pages));
        if (!("VideoReset1" == pages.name)) {
          console.info("get VideoReset1 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push VideoReset1 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push VideoReset1 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("VideoReset1 after each called");
    });

    /**
     * @tc.name   VideoReset1_0100
     * @tc.number VideoReset1_0100
     * @tc.desc   Test video reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VideoReset1_0100', Level.LEVEL2, async  (done:Function) =>{
      console.info('[VideoReset1_0100] START');
      await CommonFunc.sleep(5000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('VideoReset1_start'));
      await btn1.click()
      console.info("[VideoReset1_0100] btnStart");
      await CommonFunc.sleep(3000);

      let btn2 = await driver.findComponent(ON.id('VideoReset1_reset'));
      await btn2.click()
      console.info("[VideoReset1_0100] btnReset");
      await CommonFunc.sleep(3000);

      let strJson1 = getInspectorByKey('VideoReset1_text2');
      await CommonFunc.sleep(1000);
      console.info("[VideoReset1_0100] JSON.parse(strJson1) is: " + JSON.stringify(JSON.parse(strJson1)));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('0');

      await btn1.click()
      console.info("[VideoReset1_0100] btnStart click2");
      await CommonFunc.sleep(3000);

      let strJson2 = getInspectorByKey('VideoReset1_text1');
      await CommonFunc.sleep(1000);
      console.info("[VideoReset1_0100] JSON.parse(strJson2) is: " + JSON.stringify(JSON.parse(strJson2)));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('onStart2');

      let strJson3 = getInspectorByKey('VideoReset1_text2');
      await CommonFunc.sleep(1000);
      console.info("[VideoReset1_0100] JSON.parse(strJson3) is: " + JSON.stringify(JSON.parse(strJson3)));
      expect(Number(JSON.parse(strJson3).$attrs.content) > 0).assertTrue();
      console.info('[VideoReset1_0100] END');
      done();
    });
  })
}

