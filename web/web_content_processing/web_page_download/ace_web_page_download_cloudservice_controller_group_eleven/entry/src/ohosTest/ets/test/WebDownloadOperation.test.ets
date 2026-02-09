/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Util';
import { router } from '@kit.ArkUI';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponents } from './WaitTest.test';
import { webview } from '@kit.ArkWeb';
import events_emitter from '@ohos.events.emitter';
import { Driver } from '@kit.TestKit';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();

export default function webDownloadOperation() {
  describe('webDownloadOperation', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebDownloadOperation',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webDownloadOperation state success ' + JSON.stringify(pages));
        if (!('webDownloadOperation' == pages.name)) {
          console.info('get index state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push index state success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push index page error: ' + err);
      }
      await waitForComponents("subAceWebButton");
      done()
    });

    beforeEach(async (done: Function) => {
      try {
        console.info('======> wifi_test/isWifiActive :' + wifiMg.isWifiActive());
        let data: wifiMg.WifiLinkedInfo = await wifiMg.getLinkedInfo();
        console.info('======> Internet WifiLinkedInfo : ' + JSON.stringify(data));
        console.info('======> Internet speed : ' + JSON.stringify(data.linkSpeed));
        console.info('======> Internet chload : ' + JSON.stringify(data.chload));
        console.info('======> Internet rssi : ' + JSON.stringify(data.rssi));
        if (data.connState == wifiMg.ConnState.CONNECTED) {
          console.info('======> WLAN connection established ');
        } else {
          expect().message('======> WLAN Network error').assertFail();
          done()
        }
        if (data.chload >= 800 || data.rssi <= -80) {
          expect().message('======> WLAN Network error').assertFail();
          done();
        } else if (data.chload >= 500) {
          console.info('======> The internet connection is poor. ');
        }
      } catch (err) {
        console.info('======> getLinkedInfo promise failed, err : ' + JSON.stringify(err));
        throw (err as Error);
        done();
      }
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      done();
    });

    afterEach(() => {
    })

    afterAll(() => {
    })

    /**
     * @tc.name   SUB_ACE_WEB_cancel_0100
     * @tc.number testWebView_cancel0100
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_ACE_WEB_cancel_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('SUB_ACE_WEB_cancel_0100', 131100)
      Utils.registerBaseEvent("SUB_ACE_WEB_cancel_0100", webview.WebDownloadState.CANCELED, 131110, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'subAceWebButton');;
    })

    /**
     * @tc.name   SUB_ACE_WEB_cancel_0200
     * @tc.number testWebView_cancel0200
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_ACE_WEB_cancel_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('SUB_ACE_WEB_cancel_0200', 131100)
      Utils.registerBaseEvent("SUB_ACE_WEB_cancel_0200", webview.WebDownloadState.UNKNOWN, 131120, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'subAceWebButton');;
    })

    /**
     * @tc.name   SUB_ACE_WEB_cancel_0300
     * @tc.number testWebView_cancel0300
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_ACE_WEB_cancel_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('SUB_ACE_WEB_cancel_0300', 131100)
      Utils.registerBaseEvent("SUB_ACE_WEB_cancel_0300", webview.WebDownloadState.CANCELED, 131130, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'subAceWebButton');;
    })

    /**
     * @tc.name   SUB_ACE_WEB_cancel_0400
     * @tc.number testWebView_cancel0400
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_ACE_WEB_cancel_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('SUB_ACE_WEB_cancel_0400', 131100)
      Utils.registerBaseEvent("SUB_ACE_WEB_cancel_0400", webview.WebDownloadState.INTERRUPTED, 131140, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'subAceWebButton');;
    })

    /**
     * @tc.name   SUB_ACE_WEB_pause_0100
     * @tc.number testWebView_pause0100
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_ACE_WEB_pause_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('SUB_ACE_WEB_pause_0100', 131100)
      Utils.registerBaseEvent("SUB_ACE_WEB_pause_0100", '17100019The download task is not started yet.', 131150, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'subAceWebButton');;
    })

    /**
     * @tc.name   SUB_ACE_WEB_pause_0200
     * @tc.number testWebView_pause0200
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_ACE_WEB_pause_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('SUB_ACE_WEB_pause_0200', 131100)
      Utils.registerBaseEvent("SUB_ACE_WEB_pause_0200", '17100019The download task is not started yet.', 131160, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'subAceWebButton');;
    })


    /**
     * @tc.name   SUB_ACE_WEB_pause_0300
     * @tc.number testWebView_pause0300
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_ACE_WEB_pause_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('SUB_ACE_WEB_pause_0300', 131100)
      Utils.registerBaseEvent("SUB_ACE_WEB_pause_0300", '17100019The download task is not started yet.', 131170, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'subAceWebButton');;
    })

    /**
     * @tc.name   SUB_ACE_WEB_pause_0400
     * @tc.number testWebView_pause0400
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_ACE_WEB_pause_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('SUB_ACE_WEB_pause_0400', 131100)
      Utils.registerBaseEvent("SUB_ACE_WEB_pause_0400", webview.WebDownloadState.IN_PROGRESS, 131190, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'subAceWebButton');;
    })

    /**
     * @tc.name   SUB_ACE_WEB_pause_0500
     * @tc.number testWebView_pause0500
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_ACE_WEB_pause_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('SUB_ACE_WEB_pause_0500', 131100)
      Utils.registerBaseEvent("SUB_ACE_WEB_pause_0500", '17100019The download task is not started yet.', 131200, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'subAceWebButton');;
    })

    /**
     * @tc.name   SUB_ACE_WEB_pause_0600
     * @tc.number testWebView_pause0600
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_ACE_WEB_pause_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('SUB_ACE_WEB_pause_0600', 131100)
      Utils.registerBaseEvent("SUB_ACE_WEB_pause_0600", '17100019The download task is not started yet.', 131210, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'subAceWebButton');;
    })

    /**
     * @tc.name   SUB_ACE_WEB_resume_0100
     * @tc.number testWebView_resume0100
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_ACE_WEB_resume_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('SUB_ACE_WEB_resume_0100', 131100)
      Utils.registerBaseEvent("SUB_ACE_WEB_resume_0100", '17100016The download task is not paused.', 131220, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'subAceWebButton');;
    })

    /**
     * @tc.name   SUB_ACE_WEB_resume_0200
     * @tc.number testWebView_resume0200
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_ACE_WEB_resume_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('SUB_ACE_WEB_resume_0200', 131100)
      Utils.registerBaseEvent("SUB_ACE_WEB_resume_0200", '17100016The download task is not paused.', 131230, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'subAceWebButton');;
    })

    /**
     * @tc.name   SUB_ACE_WEB_resume_0300
     * @tc.number testWebView_resume0300
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_ACE_WEB_resume_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('SUB_ACE_WEB_resume_0300', 131100)
      Utils.registerBaseEvent("SUB_ACE_WEB_resume_0300", '17100016The download task is not paused.', 131240, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'subAceWebButton');;
    })

    /**
     * @tc.name   SUB_ACE_WEB_resume_0400
     * @tc.number testWebView_resume0400
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_ACE_WEB_resume_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('SUB_ACE_WEB_resume_0400', 131100)
      Utils.registerBaseEvent("SUB_ACE_WEB_resume_0400", '17100016The download task is not paused.', 131250, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'subAceWebButton');;
    })

    /**
     * @tc.name   SUB_ACE_WEB_resume_0500
     * @tc.number testWebView_resume0500
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_ACE_WEB_resume_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('SUB_ACE_WEB_resume_0500', 131100)
      Utils.registerBaseEvent("SUB_ACE_WEB_resume_0500", '17100016The download task is not paused.', 131260, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'subAceWebButton');;
    })


    /**
     * @tc.name   SUB_ACE_onDownloadUpdated_1000
     * @tc.number testWebView_onDownloadUpdated1000
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_ACE_onDownloadUpdated_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('SUB_ACE_onDownloadUpdated_1000', 131100)
      Utils.registerBaseEvent("SUB_ACE_onDownloadUpdated_1000", 22, 131270, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'subAceWebButton');;
    })

    /**
     * @tc.name   SUB_ACE_onDownloadUpdated_1001
     * @tc.number testWebView_onDownloadUpdated1001
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_ACE_onDownloadUpdated_1001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('SUB_ACE_onDownloadUpdated_1001', 131100)
      Utils.registerBaseEvent("SUB_ACE_onDownloadUpdated_1001", true, 131280, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'subAceWebButton');;
    })

    /**
     * @tc.name   SUB_ACE_onDownloadUpdated_1002
     * @tc.number testWebView_onDownloadUpdated1002
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_ACE_onDownloadUpdated_1002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('SUB_ACE_onDownloadUpdated_1002', 131100)
      Utils.registerBaseEvent("SUB_ACE_onDownloadUpdated_1002", 100, 131290, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'subAceWebButton');;
    })

    /**
     * @tc.name   SUB_ACE_onDownloadUpdated_1003
     * @tc.number testWebView_onDownloadUpdated1003
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_ACE_onDownloadUpdated_1003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('SUB_ACE_onDownloadUpdated_1003', 131100)
      Utils.registerBaseEvent("SUB_ACE_onDownloadUpdated_1003", 2, 131320, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'subAceWebButton');;
    })

    /**
     * @tc.name   SUB_ACE_onDownloadUpdated_1004
     * @tc.number testWebView_onDownloadUpdated1004
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_ACE_onDownloadUpdated_1004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('SUB_ACE_onDownloadUpdated_1004', 131100)
      Utils.registerBaseEvent("SUB_ACE_onDownloadUpdated_1004", 2, 131340, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'subAceWebButton');;
    })


    /**
     * @tc.name   SUB_ACE_WEB_onDownloadFinish_1000
     * @tc.number testWebView_onDownloadFinish1000
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_ACE_WEB_onDownloadFinish_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('SUB_ACE_WEB_onDownloadFinish_1000', 131100)
      Utils.registerBaseEvent("SUB_ACE_WEB_onDownloadFinish_1000", webview.WebDownloadState.COMPLETED, 131350, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'subAceWebButton');;
    })

    /**
     * @tc.name   SUB_ACE_WEB_onDownloadFinish_1002
     * @tc.number testWebView_onDownloadFinish1002
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_ACE_WEB_onDownloadFinish_1002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('SUB_ACE_WEB_onDownloadFinish_1002', 131100)
      Utils.registerBaseEvent("SUB_ACE_WEB_onDownloadFinish_1002", webview.WebDownloadState.COMPLETED, 131360, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'subAceWebButton');;
    })

  })
}