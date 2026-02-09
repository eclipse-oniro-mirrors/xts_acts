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
import wifiMg from '@ohos.wifiManager';

export default function VideoReset13() {
  describe('VideoReset13', () => {
    beforeEach(async (done: Function) => {
      console.info("VideoReset13 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Video/VideoReset/VideoReset13',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get VideoReset13 state success " + JSON.stringify(pages));
        if (!("VideoReset13" == pages.name)) {
          console.info("get VideoReset13 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push VideoReset13 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push VideoReset13 page error: " + err);
      }

      if(!wifiMg.isWifiActive()){
        console.info("======> wifi_test/enable wifi:" + wifiMg.enableWifi());
        await CommonFunc.sleep(5000);
      }
      
      try {
        let data: wifiMg.WifiLinkedInfo = await wifiMg.getLinkedInfo();
        console.info("======> Internet WifiLinkedInfo : " + JSON.stringify(data));
        console.info("======> Internet speed : " + JSON.stringify(data.linkSpeed));
        console.info("======> Internet chload : " + JSON.stringify(data.chload));
        console.info("======> Internet rssi : " + JSON.stringify(data.rssi));
            
        if (data.connState == wifiMg.ConnState.CONNECTED) {
          console.info("======> WLAN connection established ");
        } else {
          expect().message("======> WLAN Network error").assertFail(); //方式一
          //throw new Error("======> WLAN Network error");//方式二
          done();
        }
        if (data.chload >= 900 || data.rssi <= -80) {
          expect().message("======> WLAN Network error").assertFail();//方式一
          //throw new Error("======> WLAN Network error");//方式二
          done();
        } else if (data.chload >= 500) {
          console.info("======> The internet connection is poor. ");
        }
            
      } catch (err) {
        console.info("======> getLinkedInfo promise failed, err :" + JSON.stringify(err));
        throw (err as Error);
        done();
      }
      
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("VideoReset13 after each called");
    });

    /**
     * @tc.name   VideoReset13_0100
     * @tc.number VideoReset13_0100
     * @tc.desc   Test video reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VideoReset13_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[VideoReset13_0100] START');
      await CommonFunc.sleep(5000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn1 = await driver.findComponent(ON.id('VideoReset13_start'));
      await btn1.click()
      console.info("[VideoReset13_0100] btnStart");
      await CommonFunc.sleep(3000);

      let btn2 = await driver.findComponent(ON.id('VideoReset13_pause'));
      await btn2.click()
      console.info("[VideoReset13_0100] btnPause");
      await CommonFunc.sleep(3000);

      let btn3 = await driver.findComponent(ON.id('VideoReset13_reset'));
      await btn3.click()
      console.info("[VideoReset13_0100] btnReset");
      await CommonFunc.sleep(3000);

      let strJson1 = getInspectorByKey('VideoReset13_text2');

      await CommonFunc.sleep(1000);
      console.info("[VideoReset13_0100] JSON.parse(strJson1) is: " + JSON.stringify(JSON.parse(strJson1)));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('0');

      await btn1.click()
      console.info("[VideoReset13_0100] btnStart click2");
      await CommonFunc.sleep(3000);

      let strJson2 = getInspectorByKey('VideoReset13_text1');

      await CommonFunc.sleep(1000);
      console.info("[VideoReset13_0100] JSON.parse(strJson2) is: " + JSON.stringify(JSON.parse(strJson2)));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('onStart2');

      let btnAutoPlay = await driver.findComponent(ON.id('VideoReset13_autoPlay'));
      await btnAutoPlay.click()
      console.info("[VideoReset13_0100] btnAutoPlay");
      await CommonFunc.sleep(3000);

      await btn3.click()
      console.info("[VideoReset13_0100] btnReset click2");
      await CommonFunc.sleep(3000);

      let strJson3 = getInspectorByKey('VideoReset13_text1');

      await CommonFunc.sleep(1000);
      console.info("[VideoReset13_0100] JSON.parse(strJson3) is: " + JSON.stringify(JSON.parse(strJson3)));
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('onStart3');

      console.info('[VideoReset13_0100] END');
      done();
    });
  })
}

