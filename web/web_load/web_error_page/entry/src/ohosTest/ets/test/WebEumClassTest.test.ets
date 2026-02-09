/**
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { accessibility, config } from '@kit.AccessibilityKit';
import webview from '@ohos.web.webview';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';


export default function WebEumClassTest() {
  describe('WebEumClassTest', () => {

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
      console.info('WebHttpCookies beforeEach start');
      done();
    })

    /**
     * @tc.name   testWebSecurityLevel0001
     * @tc.number SUB_WEB_SecurityLevel_0001
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebSecurityLevel0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(webview.SecurityLevel.NONE).assertEqual(0);
      done();
    })

    /**
     * @tc.name   testWebSecurityLevel0002
     * @tc.number SUB_WEB_SecurityLevel_0002
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebSecurityLevel0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(webview.SecurityLevel.SECURE).assertEqual(1);
      done();
    })

    /**
     * @tc.name   testWebSecurityLevel0003
     * @tc.number SUB_WEB_SecurityLevel_0003
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebSecurityLevel0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(webview.SecurityLevel.WARNING).assertEqual(2);
      done();
    })

    /**
     * @tc.name   testWebSecurityLevel0004
     * @tc.number SUB_WEB_SecurityLevel_0004
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebSecurityLevel0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(webview.SecurityLevel.DANGEROUS).assertEqual(3);
      done();
    })

    /**
     * @tc.name   testWebNavigationType0001
     * @tc.number SUB_WEB_WebNavigationType_0001
     * @tc.desc   test WebNavigationType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebNavigationType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(WebNavigationType.UNKNOWN).assertEqual(0);
      done();
    })

    /**
     * @tc.name   testWebNavigationType0002
     * @tc.number SUB_WEB_WebNavigationType_0002
     * @tc.desc   test WebNavigationType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebNavigationType0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(WebNavigationType.MAIN_FRAME_NEW_ENTRY).assertEqual(1);
      done();
    })

    /**
     * @tc.name   testWebNavigationType0003
     * @tc.number SUB_WEB_WebNavigationType_0003
     * @tc.desc   test WebNavigationType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebNavigationType0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(WebNavigationType.MAIN_FRAME_EXISTING_ENTRY).assertEqual(2);
      done();
    })

    /**
     * @tc.name   testWebNavigationType0004
     * @tc.number SUB_WEB_WebNavigationType_0004
     * @tc.desc   test WebNavigationType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebNavigationType0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(WebNavigationType.NAVIGATION_TYPE_NEW_SUBFRAME).assertEqual(4);
      done();
    })

    /**
     * @tc.name   testWebNavigationType0005
     * @tc.number SUB_WEB_WebNavigationType_0005
     * @tc.desc   test WebNavigationType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebNavigationType0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(WebNavigationType.NAVIGATION_TYPE_AUTO_SUBFRAME).assertEqual(5);
      done();
    })

    /**
     * @tc.name   testWebThreatType0001
     * @tc.number SUB_WEB_ThreatType_0001
     * @tc.desc   test ThreatType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebThreatType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(ThreatType.THREAT_ILLEGAL).assertEqual(0);
      done();
    })

    /**
     * @tc.name   testWebThreatType0002
     * @tc.number SUB_WEB_ThreatType_0002
     * @tc.desc   test ThreatType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebThreatType0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(ThreatType.THREAT_FRAUD).assertEqual(1);
      done();
    })

    /**
     * @tc.name   testWebThreatType0003
     * @tc.number SUB_WEB_ThreatType_0003
     * @tc.desc   test ThreatType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebThreatType0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(ThreatType.THREAT_RISK).assertEqual(2);
      done();
    })

    /**
     * @tc.name   testWebThreatType0004
     * @tc.number SUB_WEB_ThreatType_0004
     * @tc.desc   test ThreatType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebThreatType0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(ThreatType.THREAT_WARNING).assertEqual(3);
      done();
    })

    /**
     * @tc.name   testWebThreatType0005
     * @tc.number SUB_WEB_ThreatType_0005
     * @tc.desc   test ThreatType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebThreatType0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(ThreatType.THREAT_NONE).assertEqual(4);
      done();
    })

    /**
     * @tc.name   testWebThreatType0006
     * @tc.number SUB_WEB_ThreatType_0006
     * @tc.desc   test ThreatType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebThreatType0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(ThreatType.THREAT_UNPROCESSED).assertEqual(5);
      done();
    })

  })
}