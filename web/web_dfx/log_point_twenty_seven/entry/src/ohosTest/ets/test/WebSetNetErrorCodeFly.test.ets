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
import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils.test';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = ""
const EVENT_ID_SET_EIMIT_KEY = 108000;
const driver = Driver.create();

export default function ActsAceWebSetNetErrorCodeFly() {
  describe('ActsAceWebSetNetErrorCodeFly', () => {
    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/WebSetNetErrorCodeFly',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info('get webSetNetErrorCodeFly state success ' + JSON.stringify(pages));
        if (!("WebSetNetErrorCodeFly" == pages.name)) {
          console.info('get webSetNetErrorCodeFly state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webSetNetErrorCodeFly state success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webSetNetErrorCodeFly page error:' + err);
      }
      await driver.waitForComponent(ON.id("webSetNetErrorCodeFly"), 10000);
      console.log('waitForComponent webSetNetErrorCodeFly');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      done();
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0001
     *@tc.name   testWebSetNetErrorCode_ERR_UNKNOWN_URL_SCHEME
     *@tc.desc   test WebSetNetErrorCode_ERR_UNKNOWN_URL_SCHEME (-302)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_UNKNOWN_URL_SCHEME', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UNKNOWN_URL_SCHEME"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UNKNOWN_URL_SCHEME", true, 108010, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeFly");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0002
     *@tc.name   testWebSetNetErrorCode_ERR_INVALID_REDIRECT
     *@tc.desc   test WebSetNetErrorCode_ERR_INVALID_REDIRECT (-303)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_INVALID_REDIRECT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INVALID_REDIRECT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INVALID_REDIRECT", true, 108020, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeFly");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0003
     *@tc.name   testWebSetNetErrorCode_ERR_TOO_MANY_REDIRECTS
     *@tc.desc   test WebSetNetErrorCode_ERR_TOO_MANY_REDIRECTS (-310)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_TOO_MANY_REDIRECTS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_TOO_MANY_REDIRECTS"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_TOO_MANY_REDIRECTS", true, 108030, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeFly");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0004
     *@tc.name   testWebSetNetErrorCode_ERR_ERR_UNSAFE_REDIRECT
     *@tc.desc   test WebSetNetErrorCode_ERR_UNSAFE_REDIRECT (-311)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_ERR_UNSAFE_REDIRECT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UNSAFE_REDIRECT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_ERR_UNSAFE_REDIRECT", true, 108040, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeFly");
    })

    /**
     *@tc.number  SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0005
     *@tc.name    testWebSetNetErrorCode_ERR_UNSAFE_PORT
     *@tc.desc    test WebSetNetErrorCode_ERR_UNSAFE_PORT (-312)
     *@tc.size    MediumTest
     *@tc.type    Function
     *@tc.level   Level 1
     */
    it('testWebSetNetErrorCode_ERR_UNSAFE_PORT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UNSAFE_PORT"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UNSAFE_PORT", true, 108050, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeFly");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0006
     *@tc.name   testWebSetNetErrorCode_ERR_INVALID_RESPONSE
     *@tc.desc   test WebSetNetErrorCode_ERR_INVALID_RESPONSE (-320)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_INVALID_RESPONSE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INVALID_RESPONSE"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INVALID_RESPONSE", true, 108060, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeFly");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0007
     *@tc.name   testWebSetNetErrorCode_ERR_INVALID_CHUNKED_ENCODING
     *@tc.desc   test WebSetNetErrorCode_ERR_INVALID_CHUNKED_ENCODING (-321)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_INVALID_CHUNKED_ENCODING', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_INVALID_CHUNKED_ENCODING"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_INVALID_CHUNKED_ENCODING", true, 108070, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeFly");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0008
     *@tc.name   testWebSetNetErrorCode_ERR_METHOD_UNSUPPORTED
     *@tc.desc   test WebSetNetErrorCode_ERR_METHOD_UNSUPPORTED (-322)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_METHOD_UNSUPPORTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_METHOD_UNSUPPORTED"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_METHOD_UNSUPPORTED", true, 108080, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeFly");
    })

    /**
     *@tc.number SUB_ACE_WEB_SET_NET_ERROR_CODE_TWO_API_0009
     *@tc.name   testWebSetNetErrorCode_ERR_UNEXPECTED_PROXY_AUTH
     *@tc.desc   test WebSetNetErrorCode_ERR_UNEXPECTED_PROXY_AUTH (-323)
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 1
     */
    it('testWebSetNetErrorCode_ERR_UNEXPECTED_PROXY_AUTH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetNetErrorCode_ERR_UNEXPECTED_PROXY_AUTH"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EIMIT_KEY);
      Utils.registerEvent("testWebSetNetErrorCode_ERR_UNEXPECTED_PROXY_AUTH", true, 108090, done);
      Utils.waitAndClickComponent(driver, "webSetNetErrorCodeFly");
    })
  })
}