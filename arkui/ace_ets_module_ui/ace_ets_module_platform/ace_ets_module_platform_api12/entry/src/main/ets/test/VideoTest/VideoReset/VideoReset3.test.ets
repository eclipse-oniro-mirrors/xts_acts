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


export default function VideoReset3() {
  describe('VideoReset3', () => {
    beforeEach(async (done: Function) => {
      console.info("VideoReset3 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Video/VideoReset/VideoReset3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get VideoReset3 state success " + JSON.stringify(pages));
        if (!("VideoReset3" == pages.name)) {
          console.info("get VideoReset3 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push VideoReset3 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push VideoReset3 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("VideoReset3 after each called");
    });

    /**
     * @tc.number    VideoReset3_0100
     * @tc.name      VideoReset3_0100
     * @tc.desc      Test video reset
     * @tc.level     Level 2
     */
    it('VideoReset3_0100', 0, async function (done) {
      console.info('[VideoReset3_0100] START');
      await CommonFunc.sleep(5000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('VideoReset3_start'));
      await btn1.click()
      console.info("[VideoReset3_0100] btnStart");
      await CommonFunc.sleep(3000);

      let slider = await driver.findComponent(ON.type('Slider'));
      let point = await slider.getBoundsCenter()
      console.info("[VideoReset3_0100] slider centerX:" + point.x + 'centerY:' + point.y);
      await driver.click(Math.round(point.x), Math.round(point.y))
      await CommonFunc.sleep(2000);

      let btn2 = await driver.findComponent(ON.id('VideoReset3_enabled'));
      await btn2.click()
      console.info("[VideoReset3_0100] btnEnabled");
      await CommonFunc.sleep(1000);

      let btn3 = await driver.findComponent(ON.id('VideoReset3_reset'));
      await btn3.click()
      console.info("[VideoReset3_0100] btnReset");
      await CommonFunc.sleep(3000);

      let strJson1 = getInspectorByKey('VideoReset3_text2');
      let obj1 = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[VideoReset3_0100] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('0');

      await btn1.click()
      console.info("[VideoReset3_0100] btnStart click2");
      await CommonFunc.sleep(3000);

      let strJson2 = getInspectorByKey('VideoReset3_text1');
      let obj2 = JSON.parse(strJson2);
      await CommonFunc.sleep(1000);
      console.info("[VideoReset3_0100] obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('onStart2');

      console.info('[VideoReset3_0100] END');
      done();
    });
  })
}

