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


export default function VideoReset14() {
  describe('VideoReset14', () => {
    beforeEach(async (done: Function) => {
      console.info("VideoReset14 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Video/VideoReset/VideoReset14',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get VideoReset14 state success " + JSON.stringify(pages));
        if (!("VideoReset14" == pages.name)) {
          console.info("get VideoReset14 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push VideoReset14 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push VideoReset14 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("VideoReset14 after each called");
    });

    /**
     * @tc.number VideoReset14_0100
     * @tc.name VideoReset14_0100
     * @tc.desc Test video reset
     * @tc.level Level 2
     */
    it('VideoReset14_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[VideoReset14_0100] START');
      await CommonFunc.sleep(5000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('VideoReset14_start'));
      await btn1.click()
      console.info("[VideoReset14_0100] btnStart");
      await CommonFunc.sleep(3000);

      let slider = await driver.findComponent(ON.type('Slider'));
      let point = await slider.getBoundsCenter()
      console.info("[VideoReset14_0100] slider centerX:" + point.x + 'centerY:' + point.y);
      await driver.click(Math.round(point.x), Math.round(point.y))
      await CommonFunc.sleep(2000);

      let btn2 = await driver.findComponent(ON.id('VideoReset14_reset'));
      await btn2.click()
      console.info("[VideoReset14_0100] btnReset");
      await CommonFunc.sleep(3000);

      let strJson1 = getInspectorByKey('VideoReset14_text2');

      await CommonFunc.sleep(1000);
      console.info("[VideoReset14_0100] JSON.parse(strJson1).$attrs.content is: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('0');

      await btn1.click()
      console.info("[VideoReset14_0100] btnStart click2");
      await CommonFunc.sleep(3000);

      let strJson2 = getInspectorByKey('VideoReset14_text1');

      await CommonFunc.sleep(1000);
      console.info("[VideoReset14_0100] JSON.parse(strJson2).$attrs.content is: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('onStart2');

      let btn3 = await driver.findComponent(ON.id('VideoReset14_setCurrentTime'));
      await btn3.click()
      console.info("[VideoReset14_0100] setCurrentTime");
      await CommonFunc.sleep(3000);

      let strJson3 = getInspectorByKey('VideoReset14_text2');

      await CommonFunc.sleep(1000);
      console.info("[VideoReset1_0100] JSON.parse(strJson3).$attrs.content is: " + JSON.stringify(JSON.parse(strJson3).$attrs.content));
      expect(Number(JSON.parse(strJson3).$attrs.content) >= 9).assertTrue();

      await btn2.click()
      console.info("[VideoReset14_0100] btnReset click2");
      await CommonFunc.sleep(3000);

      let strJson4 = getInspectorByKey('VideoReset14_text2');
      await CommonFunc.sleep(1000);
      console.info("[VideoReset14_0100] JSON.parse(strJson4).$attrs.content is: " + JSON.stringify(JSON.parse(strJson4).$attrs.content));
      expect(JSON.parse(strJson4).$attrs.content).assertEqual('0');

      console.info('[VideoReset14_0100] END');
      done();
    });
  })
}

