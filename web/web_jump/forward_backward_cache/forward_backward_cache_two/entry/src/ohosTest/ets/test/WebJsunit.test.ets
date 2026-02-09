/**
 * Copyright (c) 2022~2025 Huawei Device Co., Ltd.
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

import { beforeAll, afterEach, beforeEach, describe, it, TestType, Size, Level, expect } from '@ohos/hypium';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';


export default function webJsunit() {
  describe('ActsAceWebDevTest', () => {
    beforeAll(async (done: Function) => {
      await waitForComponent('webcomponent');
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
        if (data.chload >= 900 || data.rssi <= -80) {
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
      console.info('web beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('web afterEach start');
      done();
    })

    /**
     * @tc.name   Backward
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_003
     * @tc.desc   Backward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Backward', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitBackward', 135300)
      Utils.registerEvent('emitBackward', 'index', 135310, done);
      sendEventByKey('webcomponent', 10, '');
    })

    /**
     * @tc.name   Forward
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_004
     * @tc.desc   Forward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Forward', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitForward', 135300)
      Utils.registerEvent('emitForward', 'demo', 135320, done);
      sendEventByKey('webcomponent', 10, '');
    })

    /**
     * @tc.name   AccessBackward
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_005
     * @tc.desc   AccessBackward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AccessBackward', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitAccessBackward', 135300)
      Utils.registerEvent('emitAccessBackward', true, 135330, done);
      sendEventByKey('webcomponent', 10, '');
    })

    /**
     * @tc.name   AccessForward
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_006
     * @tc.desc   AccessForward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AccessForward', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitAccessForward', 135300)
      Utils.registerEvent('emitAccessForward', false, 135340, done);
      sendEventByKey('webcomponent', 10, '');
    })

    /**
     * @tc.name   AccessStep
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_010
     * @tc.desc   AccessStep
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AccessStep', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitAccessStep', 135300)
      Utils.registerEvent('emitAccessStep', true, 135350, done);
      sendEventByKey('webcomponent', 10, '');
    })

    /**
     * @tc.name   ClearHistory
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_011
     * @tc.desc   ClearHistory
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ClearHistory', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitClearHistory', 135300)
      Utils.registerEvent('emitClearHistory', false, 135360, done);
      sendEventByKey('webcomponent', 10, '');
    })

    /**
     * @tc.name   Once
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_031
     * @tc.desc   Once
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Once', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnce', 135300)
      Utils.registerContainEvent('emitOnce', 'a=b', 135370, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   GetItemAtIndex
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_032
     * @tc.desc   GetItemAtIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetItemAtIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitGetItemAtIndex', 135300)
      Utils.registerEvent('emitGetItemAtIndex', 'Example Domain', 135380, done);
      sendEventByKey('webcomponent', 10, '');
    })
  })
}
