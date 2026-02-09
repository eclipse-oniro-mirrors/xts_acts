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
import { beforeAll, beforeEach, describe, it , TestType, Size, Level, expect } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import events_emitter from '@ohos.events.emitter';
import { waitForComponents } from './WaitTest.test';
import { Driver } from '@kit.TestKit';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const driver = Driver.create();

export default function webViewControllerVideoMedia() {

  describe('webViewControllerVideoMedia', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewControllerVideoMedia',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerVideoMedia state success " + JSON.stringify(pages));
        if (!("WebViewControllerVideoMedia" == pages.name)) {
          console.info("get WebViewControllerVideoMedia state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewControllerVideoMedia page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerVideoMedia page error: " + err);
      }
      await waitForComponents('WebViewControllerVideoMedia');
      done()
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
      console.info("web beforeEach start");
      done();
    })

    /**
     * @tc.name   StopAllMedia0100
     * @tc.number Acts_StopAllMedia_0100
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StopAllMedia0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0100", 132260)
      Utils.registerBaseEvent("StopAllMedia0100", 'MediaPlaybackState.STOPPED', 132270, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   StopAllMedia0200
     * @tc.number Acts_StopAllMedia_0200
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StopAllMedia0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0200", 132260)
      Utils.registerBaseEvent("StopAllMedia0200", 'MediaPlaybackState.NONE', 132280, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   StopAllMedia0300
     * @tc.number Acts_StopAllMedia_0300
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StopAllMedia0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0300", 132260)
      Utils.registerBaseEvent("StopAllMedia0300", 'MediaPlaybackState.STOPPED', 132290, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   StopAllMedia0400
     * @tc.number Acts_StopAllMedia_0400
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StopAllMedia0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0400", 132260)
      Utils.registerBaseEvent("StopAllMedia0400", 'MediaPlaybackState.PAUSED', 132300, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   StopAllMedia0500
     * @tc.number Acts_StopAllMedia_0500
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StopAllMedia0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0500", 132260)
      Utils.registerBaseEvent("StopAllMedia0500", 'MediaPlaybackState.PAUSED', 132310, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   StopAllMedia0600
     * @tc.number Acts_StopAllMedia_0600
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StopAllMedia0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0600", 132260)
      Utils.registerBaseEvent("StopAllMedia0600", 'MediaPlaybackState.STOPPED', 132320, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   StopAllMedia0700
     * @tc.number Acts_StopAllMedia_0700
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StopAllMedia0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0700", 132260)
      Utils.registerBaseEvent("StopAllMedia0700",'MediaPlaybackState.STOPPED', 132330, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   StopAllMedia0800
     * @tc.number Acts_StopAllMedia_0800
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StopAllMedia0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("StopAllMedia0800", 132260)
      Utils.registerBaseEvent("StopAllMedia0800", 'MediaPlaybackState.STOPPED', 132340, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   ResumeAllMedia0100
     * @tc.number Acts_ResumeAllMedia_0100
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ResumeAllMedia0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("ResumeAllMedia0100", 132260)
      Utils.registerBaseEvent("ResumeAllMedia0100", 'MediaPlaybackState.PLAYING', 132350, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   ResumeAllMedia0200
     * @tc.number Acts_ResumeAllMedia_0200
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ResumeAllMedia0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("ResumeAllMedia0200", 132260)
      Utils.registerBaseEvent("ResumeAllMedia0200", 'MediaPlaybackState.NONE', 132360, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   ResumeAllMedia0300
     * @tc.number Acts_ResumeAllMedia_0300
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ResumeAllMedia0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("ResumeAllMedia0300", 132260)
      Utils.registerBaseEvent("ResumeAllMedia0300", 'MediaPlaybackState.PLAYING', 132370, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   ResumeAllMedia0400
     * @tc.number Acts_ResumeAllMedia_0400
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ResumeAllMedia0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("ResumeAllMedia0400", 132260)
      Utils.registerBaseEvent("ResumeAllMedia0400", 'MediaPlaybackState.PAUSED', 132380, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   ResumeAllMedia0500
     * @tc.number Acts_ResumeAllMedia_0500
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ResumeAllMedia0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("ResumeAllMedia0500", 132260)
      Utils.registerBaseEvent("ResumeAllMedia0500", 'MediaPlaybackState.STOPPED', 132390, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   ResumeAllMedia0600
     * @tc.number Acts_ResumeAllMedia_0600
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ResumeAllMedia0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("ResumeAllMedia0600", 132260)
      Utils.registerBaseEvent("ResumeAllMedia0600", 'MediaPlaybackState.PLAYING', 132400, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   ResumeAllMedia0700
     * @tc.number Acts_ResumeAllMedia_0700
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ResumeAllMedia0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("ResumeAllMedia0700", 132260)
      Utils.registerBaseEvent("ResumeAllMedia0700", 'MediaPlaybackState.PLAYING', 132410, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   PauseAllMedia0100
     * @tc.number Acts_PauseAllMedia_0100
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PauseAllMedia0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0100", 132260)
      Utils.registerBaseEvent("PauseAllMedia0100", 'MediaPlaybackState.PAUSED', 132420, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   PauseAllMedia0200
     * @tc.number Acts_PauseAllMedia_0200
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PauseAllMedia0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0200", 132260)
      Utils.registerBaseEvent("PauseAllMedia0200", 'MediaPlaybackState.PAUSED', 132430, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   PauseAllMedia0300
     * @tc.number Acts_PauseAllMedia_0300
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PauseAllMedia0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0300", 132260)
      Utils.registerBaseEvent("PauseAllMedia0300", 'MediaPlaybackState.PAUSED', 132440, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   PauseAllMedia0400
     * @tc.number Acts_PauseAllMedia_0400
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PauseAllMedia0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0400", 132260)
      Utils.registerBaseEvent("PauseAllMedia0400", 'MediaPlaybackState.PAUSED', 132450, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   PauseAllMedia0500
     * @tc.number Acts_PauseAllMedia_0500
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PauseAllMedia0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0500", 132260)
      Utils.registerBaseEvent("PauseAllMedia0500", 'MediaPlaybackState.PAUSED', 132460, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   PauseAllMedia0600
     * @tc.number Acts_PauseAllMedia_0600
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PauseAllMedia0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0600", 132260)
      Utils.registerBaseEvent("PauseAllMedia0600", 'MediaPlaybackState.PAUSED', 132470, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   PauseAllMedia0700
     * @tc.number Acts_PauseAllMedia_0700
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PauseAllMedia0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0700", 132260)
      Utils.registerBaseEvent("PauseAllMedia0700", 'MediaPlaybackState.PAUSED', 132480, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   PauseAllMedia0800
     * @tc.number Acts_PauseAllMedia_0800
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PauseAllMedia0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("PauseAllMedia0800", 132260)
      Utils.registerBaseEvent("PauseAllMedia0800", 'MediaPlaybackState.PAUSED', 132490, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   GetMediaPlaybackState0100
     * @tc.number Acts_GetMediaPlaybackState_0100
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GetMediaPlaybackState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0100", 132260)
      Utils.registerBaseEvent("GetMediaPlaybackState0100", 'MediaPlaybackState.NONE', 132500, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   GetMediaPlaybackState0200
     * @tc.number Acts_GetMediaPlaybackState_0200
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GetMediaPlaybackState0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0200", 132260)
      Utils.registerBaseEvent("GetMediaPlaybackState0200", 'MediaPlaybackState.PLAYING', 132510, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   GetMediaPlaybackState0300
     * @tc.number Acts_GetMediaPlaybackState_0300
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GetMediaPlaybackState0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0300", 132260)
      Utils.registerBaseEvent("GetMediaPlaybackState0300", 'MediaPlaybackState.PAUSED', 132520, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   GetMediaPlaybackState0400
     * @tc.number Acts_GetMediaPlaybackState_0400
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GetMediaPlaybackState0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0400", 132260)
      Utils.registerBaseEvent("GetMediaPlaybackState0400", 'MediaPlaybackState.PAUSED', 132530, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   GetMediaPlaybackState0500
     * @tc.number Acts_GetMediaPlaybackState_0500
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GetMediaPlaybackState0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0500", 132260)
      Utils.registerBaseEvent("GetMediaPlaybackState0500", 'MediaPlaybackState.STOPPED', 132540, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   GetMediaPlaybackState0600
     * @tc.number Acts_GetMediaPlaybackState_0600
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GetMediaPlaybackState0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0600", 132260)
      Utils.registerBaseEvent("GetMediaPlaybackState0600", true, 132550, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   GetMediaPlaybackState0700
     * @tc.number Acts_GetMediaPlaybackState_0700
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GetMediaPlaybackState0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0700", 132260)
      Utils.registerBaseEvent("GetMediaPlaybackState0700", 'MediaPlaybackState.NONE', 132560, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   GetMediaPlaybackState0800
     * @tc.number Acts_GetMediaPlaybackState_0800
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GetMediaPlaybackState0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0800", 132260)
      Utils.registerBaseEvent("GetMediaPlaybackState0800", 'MediaPlaybackState.PLAYING', 132570, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   GetMediaPlaybackState0900
     * @tc.number Acts_GetMediaPlaybackState_0900
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GetMediaPlaybackState0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState0900", 132260)
      Utils.registerBaseEvent("GetMediaPlaybackState0900", 'MediaPlaybackState.PLAYING', 132580, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   GetMediaPlaybackState1000
     * @tc.number Acts_GetMediaPlaybackState_1000
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GetMediaPlaybackState1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState1000", 132260)
      Utils.registerBaseEvent("GetMediaPlaybackState1000", 'MediaPlaybackState.PLAYING', 132590, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   GetMediaPlaybackState1100
     * @tc.number Acts_GetMediaPlaybackState_1100
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GetMediaPlaybackState1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState1100", 132260)
      Utils.registerBaseEvent("GetMediaPlaybackState1100", 'MediaPlaybackState.PAUSED', 132600, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })

    /**
     * @tc.name   GetMediaPlaybackState1200
     * @tc.number Acts_GetMediaPlaybackState_1200
     * @tc.desc   test WebViewControllerVideoMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GetMediaPlaybackState1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("GetMediaPlaybackState1200", 132260)
      Utils.registerBaseEvent("GetMediaPlaybackState1200", 'MediaPlaybackState.PAUSED', 132610, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerVideoMedia');
    })
  })
}
