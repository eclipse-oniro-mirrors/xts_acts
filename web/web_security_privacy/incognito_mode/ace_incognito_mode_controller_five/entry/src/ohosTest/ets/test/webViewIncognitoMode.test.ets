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
import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { waitForComponent } from './WaitTest';
// @ts-nocheck
let emitKey = ""

export default function ActsAceWebViewIncognitoMode() {
  describe('ActsAceWebViewIncognitoMode', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/webViewIncognitoMode',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info('get webViewIncognitoMode state success ' + JSON.stringify(pages));
        if (!('webViewIncognitoMode' == pages.name)) {
          console.info('get webViewIncognitoMode state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webViewIncognitoMode state success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webViewIncognitoMode page error:' + err);
      }
      await waitForComponent("webViewIncognitoModeButton");
      done()
    });

    beforeEach(async (done: Function) => {
      done();
    })


    /**
     * @tc.name   testWebViewIncognitoMode01
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_0001
     * @tc.desc   test isIncognitoMode true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewIncognitoMode01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitWebViewIncognitoMode01'
      Utils.emitEvent(emitKey, 160310);
      Utils.registerEvent('testWebViewIncognitoMode01', 'success', 160320, done);
      sendEventByKey('webViewIncognitoModeButton', 10, '');
    })
    /**
     * @tc.name   testWebViewIncognitoMode02
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_0002
     * @tc.desc   test isIncognitoMode false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewIncognitoMode02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitWebViewIncognitoMode02'
      Utils.emitEvent(emitKey, 160310);
      Utils.registerEvent('testWebViewIncognitoMode02', 'success', 160330, done);
      sendEventByKey('webViewIncognitoModeButton', 10, '');
    })
    /**
     * @tc.name   testWebViewIncognitoMode03
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_0003
     * @tc.desc   test configCookieSync incognito
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewIncognitoMode03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitWebViewIncognitoMode03'
      Utils.emitEvent(emitKey, 160310);
      Utils.registerEvent('testWebViewIncognitoMode03', 'success', 160340, done);
      sendEventByKey('webViewIncognitoModeButton', 10, '');
    })
    /**
     * @tc.name   testWebViewIncognitoMode04
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_0004
     * @tc.desc   test configCookieSync normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewIncognitoMode04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitWebViewIncognitoMode04'
      Utils.emitEvent(emitKey, 160310);
      Utils.registerEvent('testWebViewIncognitoMode04', 'success', 160350, done);
      sendEventByKey('webViewIncognitoModeButton', 10, '');
    })

    /**
     * @tc.name   testWebViewIncognitoMode07
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_0007
     * @tc.desc   test deleteAllData incognito
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewIncognitoMode07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitWebViewIncognitoMode07'
      Utils.emitEvent(emitKey, 160310);
      Utils.registerEvent('testWebViewIncognitoMode07', 'success', 160360, done);
      sendEventByKey('webViewIncognitoModeButton', 10, '');
    })
    /**
     * @tc.name   testWebViewIncognitoMode08
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_0008
     * @tc.desc   test deleteAllData normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewIncognitoMode08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitWebViewIncognitoMode08'
      Utils.emitEvent(emitKey, 160310);
      Utils.registerEvent('testWebViewIncognitoMode08', 'success', 160370, done);
      sendEventByKey('webViewIncognitoModeButton', 10, '');
    })
    /**
     * @tc.name   testWebViewIncognitoMode09
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_0009
     * @tc.desc   test getAccessibleGeolocation(promise) incognito
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewIncognitoMode09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitWebViewIncognitoMode09'
      Utils.emitEvent(emitKey, 160310);
      Utils.registerEvent('testWebViewIncognitoMode09', 'success', 160380, done);
      sendEventByKey('webViewIncognitoModeButton', 10, '');
    })
    /**
     * @tc.name   testWebViewIncognitoMode10
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_0010
     * @tc.desc   test getAccessibleGeolocation(callback) incognito
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewIncognitoMode10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitWebViewIncognitoMode10'
      Utils.emitEvent(emitKey, 160310);
      Utils.registerEvent('testWebViewIncognitoMode10', 'success', 160390, done);
      sendEventByKey('webViewIncognitoModeButton', 10, '');
    })
    /**
     * @tc.name   testWebViewIncognitoMode11
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_0011
     * @tc.desc   test getAccessibleGeolocation(promise) normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewIncognitoMode11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitWebViewIncognitoMode11'
      Utils.emitEvent(emitKey, 160310);
      Utils.registerEvent('testWebViewIncognitoMode11', 'success', 160400, done);
      sendEventByKey('webViewIncognitoModeButton', 10, '');
    })
    /**
     * @tc.name   testWebViewIncognitoMode12
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_0012
     * @tc.desc   test getAccessibleGeolocation(callback) normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewIncognitoMode12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitWebViewIncognitoMode12'
      Utils.emitEvent(emitKey, 160310);
      Utils.registerEvent('testWebViewIncognitoMode12', 'success', 160410, done);
      sendEventByKey('webViewIncognitoModeButton', 10, '');
    })
    /**
     * @tc.name   testWebViewIncognitoMode13
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_0013
     * @tc.desc   test getStoredGeolocation(promise) incognito
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewIncognitoMode13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitWebViewIncognitoMode13'
      Utils.emitEvent(emitKey, 160310);
      Utils.registerEvent('testWebViewIncognitoMode13', 'success', 160420, done);
      sendEventByKey('webViewIncognitoModeButton', 10, '');
    })
    /**
     * @tc.name   testWebViewIncognitoMode14
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_0014
     * @tc.desc   test getStoredGeolocation(callback) incognito
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewIncognitoMode14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitWebViewIncognitoMode14'
      Utils.emitEvent(emitKey, 160310);
      Utils.registerEvent('testWebViewIncognitoMode14', 'success', 160430, done);
      sendEventByKey('webViewIncognitoModeButton', 10, '');
    })
    /**
     * @tc.name   testWebViewIncognitoMode15
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_0015
     * @tc.desc   test getStoredGeolocation(promise) normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewIncognitoMode15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitWebViewIncognitoMode15'
      Utils.emitEvent(emitKey, 160310);
      Utils.registerEvent('testWebViewIncognitoMode15', 'success', 160440, done);
      sendEventByKey('webViewIncognitoModeButton', 10, '');
    })
    /**
     * @tc.name   testWebViewIncognitoMode16
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_0016
     * @tc.desc   test getStoredGeolocation(callback) normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewIncognitoMode16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitWebViewIncognitoMode16'
      Utils.emitEvent(emitKey, 160310);
      Utils.registerEvent('testWebViewIncognitoMode16', 'success', 160450, done);
      sendEventByKey('webViewIncognitoModeButton', 10, '');
    })
    /**
     * @tc.name   testWebViewIncognitoMode17
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_0017
     * @tc.desc   test deleteGeolocation incognito
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewIncognitoMode17', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitWebViewIncognitoMode17'
      Utils.emitEvent(emitKey, 160310);
      Utils.registerEvent('testWebViewIncognitoMode17', 'success', 160460, done);
      sendEventByKey('webViewIncognitoModeButton', 10, '');
    })
    /**
     * @tc.name   testWebViewIncognitoMode18
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_0018
     * @tc.desc   test deleteGeolocation normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewIncognitoMode18', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitWebViewIncognitoMode18'
      Utils.emitEvent(emitKey, 160310);
      Utils.registerEvent('testWebViewIncognitoMode18', 'success', 160470, done);
      sendEventByKey('webViewIncognitoModeButton', 10, '');
    })
    /**
     * @tc.name   testWebViewIncognitoMode19
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_0019
     * @tc.desc   test deleteAllGeolocation incognito
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewIncognitoMode19', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitWebViewIncognitoMode19'
      Utils.emitEvent(emitKey, 160310);
      Utils.registerEvent('testWebViewIncognitoMode19', 'success', 160480, done);
      sendEventByKey('webViewIncognitoModeButton', 10, '');
    })
    /**
     * @tc.name   testWebViewIncognitoMode20
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_0020
     * @tc.desc   test deleteAllGeolocation normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewIncognitoMode20', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitWebViewIncognitoMode20'
      Utils.emitEvent(emitKey, 160310);
      Utils.registerEvent('testWebViewIncognitoMode20', 'success', 160490, done);
      sendEventByKey('webViewIncognitoModeButton', 10, '');
    })

    /**
     * @tc.name   emitWebViewIncognitoMode21
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_0021
     * @tc.desc   emitWebViewIncognitoMode21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('emitWebViewIncognitoMode21', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitWebViewIncognitoMode21'
      Utils.emitEvent(emitKey, 160310);
      Utils.registerEvent('emitWebViewIncognitoMode21', true, 20251020, done);
      sendEventByKey('webViewIncognitoModeButton', 10, '');
    })

    /**
     * @tc.name   emitWebViewIncognitoMode22
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_0022
     * @tc.desc   emitWebViewIncognitoMode22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('emitWebViewIncognitoMode22', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitWebViewIncognitoMode22'
      Utils.emitEvent(emitKey, 160310);
      Utils.registerEvent('emitWebViewIncognitoMode22', true, 20251021, done);
      sendEventByKey('webViewIncognitoModeButton', 10, '');
    })

    /**
     * @tc.name   emitWebViewIncognitoMode23
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_0023
     * @tc.desc   emitWebViewIncognitoMode23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('emitWebViewIncognitoMode23', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitWebViewIncognitoMode23'
      Utils.emitEvent(emitKey, 160310);
      Utils.registerEvent('emitWebViewIncognitoMode23', true, 20251022, done);
      sendEventByKey('webViewIncognitoModeButton', 10, '');
    })

    /**
     * @tc.name   emitWebViewIncognitoMode24
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_0024
     * @tc.desc   emitWebViewIncognitoMode24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('emitWebViewIncognitoMode24', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitWebViewIncognitoMode24'
      Utils.emitEvent(emitKey, 160310);
      Utils.registerEvent('emitWebViewIncognitoMode24', true, 20251023, done);
      sendEventByKey('webViewIncognitoModeButton', 10, '');
    })

  })
}
