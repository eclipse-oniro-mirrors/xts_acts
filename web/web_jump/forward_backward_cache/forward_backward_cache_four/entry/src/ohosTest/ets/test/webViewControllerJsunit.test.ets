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

import { beforeAll, describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';


export default function webViewControllerJsunit() {
  describe('ActsAceWebDevWebViewControllerTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewController',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webViewController state success ' + JSON.stringify(pages));
        if (!('webViewController' == pages.name)) {
          console.info('get webViewController state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webViewController page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webViewController page error: ' + err);
      }
      await waitForComponent('webcomponent');
      done();
    });

    beforeEach(async (done: Function) => {
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

    /*
     *tc.number SUB_ACE_BASIC_ETS_API_1300
     *tc.name testFetchCookieSync
     *tc.desc test for FetchCookieSync
     */
    it('testFetchCookieSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitFetchCookieSync', 137200);
      Utils.registerEvent('testFetchCookieSync', 'a=b', 137210, done);
      sendEventByKey('webcomponent', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_API_1400
     *tc.name testFetchCookieCallback
     *tc.desc test for FetchCookieCallback
     */
    it('testFetchCookieCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitFetchCookieCallback', 137200);
      Utils.registerEvent('emitFetchCookieCallback', 'a=c', 137220, done);
      sendEventByKey('webcomponent', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_API_1500
     *tc.name testFetchCookiePromise
     *tc.desc test for FetchCookiePromise
     */
    it('testFetchCookiePromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitFetchCookiePromise', 137200);
      Utils.registerEvent('emitFetchCookiePromise', 'a=d', 137230, done);
      sendEventByKey('webcomponent', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_API_1600
     *tc.name testConfigCookieSync
     *tc.desc test for ConfigCookieSync
     */
    it('testConfigCookieSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieSync', 137200);
      Utils.registerEvent('emitConfigCookieSync', 'a=e', 137240, done);
      sendEventByKey('webcomponent', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_API_1700
     *tc.name testConfigCookieCallback
     *tc.desc test for ConfigCookieCallback
     */
    it('testConfigCookieCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieCallback', 137200);
      Utils.registerEvent('emitConfigCookieCallback', 'a=f', 137250, done);
      sendEventByKey('webcomponent', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_API_1800
     *tc.name testConfigCookiePromise
     *tc.desc test for ConfigCookiePromise
     */
    it('testConfigCookiePromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitConfigCookiePromise', 137200);
      Utils.registerEvent('emitConfigCookiePromise', 'a=g', 137260, done);
      sendEventByKey('webcomponent', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_API_1900
     *tc.name testClearAllCookiesSync
     *tc.desc test for ClearAllCookiesSync
     */
    it('testClearAllCookiesSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitClearAllCookiesSync', 137200);
      Utils.registerEvent('emitClearAllCookiesSync', true, 137270, done);
      sendEventByKey('webcomponent', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_API_2000
     *tc.name testClearAllCookiesCallback
     *tc.desc test for ClearAllCookiesCallback
     */
    it('testClearAllCookiesCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitClearAllCookiesCallback', 137200);
      Utils.registerEvent('emitClearAllCookiesCallback', true, 137280, done);
      sendEventByKey('webcomponent', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_API_2100
     *tc.name testClearAllCookiesPromise
     *tc.desc test for ClearAllCookiesPromise
     */
    it('testClearAllCookiesPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitClearAllCookiesPromise', 137200);
      Utils.registerEvent('emitClearAllCookiesPromise', true, 137290, done);
      sendEventByKey('webcomponent', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_API_2200
     *tc.name testClearSessionCookieSync
     *tc.desc test for ClearSessionCookieSync
     */
    it('testClearSessionCookieSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitClearSessionCookieSync', 137200);
      Utils.registerEvent('emitClearSessionCookieSync', true, 137300, done);
      sendEventByKey('webcomponent', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_API_2300
     *tc.name testClearSessionCookieCallback
     *tc.desc test for ClearSessionCookieCallback
     */
    it('testClearSessionCookieCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitClearSessionCookieCallback', 137200);
      Utils.registerEvent('emitClearSessionCookieCallback', true, 137310, done);
      sendEventByKey('webcomponent', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_API_2400
     *tc.name testClearSessionCookiePromise
     *tc.desc test for ClearSessionCookiePromise
     */
    it('testClearSessionCookiePromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitClearSessionCookiePromise', 137200);
      Utils.registerEvent('emitClearSessionCookiePromise', true, 137320, done);
      sendEventByKey('webcomponent', 10, '');
    })
  })
}