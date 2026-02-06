/**
 * Copyright (c) 2023-2025 iSoftStone Information Technology (Group) Co.,Ltd.
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

import { afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';


export default function webGetCookieManager() {
  describe('ActsAceWebDevWebGetCookieManagerTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webGetCookieManager',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webGetCookieManager state success ' + JSON.stringify(pages));
        if (!('webGetCookieManager' == pages.name)) {
          console.info('get webGetCookieManager state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webGetCookieManager page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webGetCookieManager page error: ' + err);
      }
      await waitForComponent('webGetCookieManager');
      done();
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webGetCookieManager beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webGetCookieManager afterEach start');
      done();
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBGETCOOKIEMMANAGER_API_0100
     *tc.name testGetCookieManagerWebc
     *tc.desc test interface of onfullscreenexit with runjavascript exitFullscreen
     */
    it('testGetCookieManagerWebc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitGetCookieManagerWebc', 137150);
      Utils.registerEvent('testGetCookieManagerWebc', 2, 137160, done);
      sendEventByKey('webGetCookieManager', 10, '');
    })
  })
}