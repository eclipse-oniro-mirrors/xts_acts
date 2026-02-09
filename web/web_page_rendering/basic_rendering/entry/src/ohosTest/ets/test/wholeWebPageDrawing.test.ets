/*
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

import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level,
  DataDriver } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import wifiMg from '@ohos.wifiManager';
import { Driver } from '@kit.TestKit'
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitAndClickComponent , waitForComponent} from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "";
const driver: Driver = Driver.create();

export default function wholeWebPageDrawing() {
  describe('wholeWebPageDrawing', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/wholeWebPageDrawing',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get wholeWebPageDrawing state success " + JSON.stringify(pages));
        if (!("wholeWebPageDrawing" == pages.name)) {
          console.info("get wholeWebPageDrawing state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push wholeWebPageDrawing page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push wholeWebPageDrawing page error: " + err);
      }
      await waitForComponent("wholeWebPageDrawingButton");
      done();
    });
    beforeEach(async (done: Function) => {
      if(!wifiMg.isWifiActive()){
        console.info("======> wifi_test/enable wifi:" + wifiMg.enableWifi());
        await Utils.sleep(5000);
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
        if (data.chload >= 800 || data.rssi <= -80) {
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
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("wholeWebPageDrawing beforeEach start");
      done();
    })
   afterEach(async (done: Function) => {
      console.info("wholeWebPageDrawing afterEach start:" + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        }
        let backEvent: events_emitter.InnerEvent = {
          eventId: 152180,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      done();
    })
    /**
     * @tc.name   wholeWebPageDrawing0100
     * @tc.number SUB_ACE_BASIC_ETS_WHOLEWEBPAGEDRAWING_API_0100
     * @tc.desc   wholeWebPageDrawing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('wholeWebPageDrawing0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("wholeWebPageDrawing0100",152180)
      Utils.registerEvent("wholeWebPageDrawing0100", "hello", 152190, done);
      waitAndClickComponent('wholeWebPageDrawingButton',driver);
    })

    /**
     * @tc.name   wholeWebPageDrawing0200
     * @tc.number SUB_ACE_BASIC_ETS_WHOLEWEBPAGEDRAWING_API_0200
     * @tc.desc   wholeWebPageDrawing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('wholeWebPageDrawing0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("wholeWebPageDrawing0200",152180)
      Utils.registerEvent("wholeWebPageDrawing0200", true, 152200, done);
      waitAndClickComponent('wholeWebPageDrawingButton',driver);
    })

    /**
     * @tc.name   wholeWebPageDrawing0300
     * @tc.number SUB_ACE_BASIC_ETS_WHOLEWEBPAGEDRAWING_API_0300
     * @tc.desc   wholeWebPageDrawing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('wholeWebPageDrawing0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("wholeWebPageDrawing0300",152180)
      Utils.registerEvent("wholeWebPageDrawing0300", 100, 152210, done);
      waitAndClickComponent('wholeWebPageDrawingButton',driver);
    })

    /**
     * @tc.name   wholeWebPageDrawing0400
     * @tc.number SUB_ACE_BASIC_ETS_WHOLEWEBPAGEDRAWING_API_0400
     * @tc.desc   wholeWebPageDrawing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('wholeWebPageDrawing0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("wholeWebPageDrawing0400",152180)
      Utils.registerEvent("wholeWebPageDrawing0400", 100, 152220, done);
      waitAndClickComponent('wholeWebPageDrawingButton',driver);
    })

    /**
     * @tc.name   wholeWebPageDrawing0500
     * @tc.number SUB_ACE_BASIC_ETS_WHOLEWEBPAGEDRAWING_API_0500
     * @tc.desc   wholeWebPageDrawing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('wholeWebPageDrawing0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("wholeWebPageDrawing0500",152180)
      Utils.registerEvent("wholeWebPageDrawing0500", true, 152230, done);
      waitAndClickComponent('wholeWebPageDrawingButton',driver);
    })

    /**
     * @tc.name   wholeWebPageDrawing0600
     * @tc.number SUB_ACE_BASIC_ETS_WHOLEWEBPAGEDRAWING_API_0600
     * @tc.desc   wholeWebPageDrawing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('wholeWebPageDrawing0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("wholeWebPageDrawing0600",152180)
      Utils.registerEvent("wholeWebPageDrawing0600", false, 152240, done);
      waitAndClickComponent('wholeWebPageDrawingButton',driver);
    })
  })
}