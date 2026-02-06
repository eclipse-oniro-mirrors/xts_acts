/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { describe, beforeAll, beforeEach, it, expect , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import Utils from './Utils';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
class ResultData{
  public type:string;
  public value:string | boolean;

  constructor(type:string,value:string | boolean) {
    this.type = type;
    this.value = value;
  }
}



export default function ActsAceCookieTest() {
  describe('CookieTest', async () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/CookieTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webviewBFCacheSuspendPlayer state success " + JSON.stringify(pages));
        if (!("CookieTest" == pages.name)) {
          console.info("get index state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push index state success");
        }
      } catch (err) {
        console.error("push index page error:" + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      done();
    });

    /**
     * @tc.number SUB_WEB_ONCREATWEBCOOKIEMANAGER_0100
     * @tc.name testOnCreatWebCookieManager0100
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testOnCreatWebCookieManager0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const key = 'getCookie10114';
      let result:ResultData | undefined = AppStorage.get(key);
      let retryTimes = 0;
      while (!result && retryTimes < 3) {
        result = AppStorage.get(key);
        await Utils.sleep(1000);
        retryTimes++;
        console.info('AppStorage.get retryTimes: ' + retryTimes);
      }
      if (!result) {
        console.error('result is undefined!');
        return;
      }
      expect(result.type).assertEqual('string');
      expect(result.value).assertEqual('a=b');
      done();
    });

    /**
     * @tc.number SUB_WEB_ONCREATWEBCOOKIEMANAGER_0200
     * @tc.name testOnCreatWebCookieManager0200
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testOnCreatWebCookieManager0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const key = 'fetchCookieSync10115';
      let result:ResultData | undefined = AppStorage.get(key);
      let retryTimes = 0;
      while (!result && retryTimes < 3) {
        result = AppStorage.get(key);
        await Utils.sleep(1000);
        retryTimes++;
        console.info('AppStorage.get retryTimes: ' + retryTimes);
      }
      if (!result) {
        console.error('result is undefined!');
        return;
      }
      expect(result.type).assertEqual('string');
      expect(result.value).assertEqual('a=b');
      done();
    });

    /**
     * @tc.number SUB_WEB_ONCREATWEBCOOKIEMANAGER_0300
     * @tc.name testOnCreatWebCookieManager0300
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testOnCreatWebCookieManager0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const key = 'fetchCookieCallback10116';
      let result:ResultData | undefined = AppStorage.get(key);
      let retryTimes = 0;
      while (!result && retryTimes < 10) {
        result = AppStorage.get(key);
        await Utils.sleep(1000);
        retryTimes++;
        console.info('AppStorage.get retryTimes: ' + retryTimes);
      }
      if (!result) {
        console.error('result is undefined!');
        return;
      }
      expect(result.type).assertEqual('string');
      expect(result.value).assertEqual('a=b');
      done();
    });

    /**
     * @tc.number SUB_WEB_ONCREATWEBCOOKIEMANAGER_0400
     * @tc.name testOnCreatWebCookieManager0400
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testOnCreatWebCookieManager0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const key = 'fetchCookiePromise10117';
      let result:ResultData | undefined = AppStorage.get(key);
      let retryTimes = 0;
      while (!result && retryTimes < 3) {
        result = AppStorage.get(key);
        await Utils.sleep(1000);
        retryTimes++;
        console.info('AppStorage.get retryTimes: ' + retryTimes);
      }
      if (!result) {
        console.error('result is undefined!');
        return;
      }
      expect(result.type).assertEqual('string');
      expect(result.value).assertEqual('a=b');
      done();
    });

    /**
     * @tc.number SUB_WEB_ONCREATWEBCOOKIEMANAGER_0500
     * @tc.name testOnCreatWebCookieManager0500
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testOnCreatWebCookieManager0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const key = 'configCookieSync10118';
      let result:ResultData | undefined = AppStorage.get(key);
      let retryTimes = 0;
      while (!result && retryTimes < 3) {
        result = AppStorage.get(key);
        await Utils.sleep(1000);
        retryTimes++;
        console.info('AppStorage.get retryTimes: ' + retryTimes);
      }
      if (!result) {
        console.error('result is undefined!');
        return;
      }
      expect(result.type).assertEqual('string');
      expect(result.value).assertEqual('a=b');
      done();
    });

    /**
     * @tc.number SUB_WEB_ONCREATWEBCOOKIEMANAGER_0600
     * @tc.name testOnCreatWebCookieManager0600
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testOnCreatWebCookieManager0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const key = 'configCookieCallback10119';
      let result:ResultData | undefined = AppStorage.get(key);
      let retryTimes = 0;
      while (!result && retryTimes < 3) {
        result = AppStorage.get(key);
        await Utils.sleep(1000);
        retryTimes++;
        console.info('AppStorage.get retryTimes: ' + retryTimes);
      }
      if (!result) {
        console.error('result is undefined!');
        return;
      }
      expect(result.type).assertEqual('string');
      expect(result.value).assertEqual('a=b');
      done();
    });

    /**
     * @tc.number SUB_WEB_ONCREATWEBCOOKIEMANAGER_0700
     * @tc.name testOnCreatWebCookieManager0700
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testOnCreatWebCookieManager0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const key = 'configCookiePromise10120';
      let result:ResultData | undefined = AppStorage.get(key);
      let retryTimes = 0;
      while (!result && retryTimes < 3) {
        result = AppStorage.get(key);
        await Utils.sleep(1000);
        retryTimes++;
        console.info('AppStorage.get retryTimes: ' + retryTimes);
      }
      if (!result) {
        console.error('result is undefined!');
        return;
      }
      expect(result.type).assertEqual('string');
      expect(result.value).assertEqual('a=b');
      done();
    });

    /**
     * @tc.number SUB_WEB_ONCREATWEBCOOKIEMANAGER_1000
     * @tc.name testOnCreatWebCookieManager1000
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testOnCreatWebCookieManager1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const key = 'putAcceptCookieEnabled10123';
      let result:ResultData | undefined = AppStorage.get(key);
      let retryTimes = 0;
      while (!result && retryTimes < 3) {
        result = AppStorage.get(key);
        await Utils.sleep(1000);
        retryTimes++;
        console.info('AppStorage.get retryTimes: ' + retryTimes);
      }
      if (!result) {
        console.error('result is undefined!');
        return;
      }
      expect(result.type).assertEqual('boolean');
      expect(result.value).assertEqual(false);
      done();
    });

    /**
     * @tc.number SUB_WEB_ONCREATWEBCOOKIEMANAGER_1100
     * @tc.name testOnCreatWebCookieManager1100
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testOnCreatWebCookieManager1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const key = 'putAcceptThirdPartyCookieEnabled10124';
      let result:ResultData | undefined = AppStorage.get(key);
      let retryTimes = 0;
      while (!result && retryTimes < 3) {
        result = AppStorage.get(key);
        await Utils.sleep(1000);
        retryTimes++;
        console.info('AppStorage.get retryTimes: ' + retryTimes);
      }
      if (!result) {
        console.error('result is undefined!');
        return;
      }
      expect(result.type).assertEqual('boolean');
      expect(result.value).assertEqual(false);
      done();
    });

    /**
     * @tc.number SUB_WEB_ONCREATWEBCOOKIEMANAGER_1200
     * @tc.name testOnCreatWebCookieManager1200
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testOnCreatWebCookieManager1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const key = 'existCookie10125';
      let result:ResultData | undefined = AppStorage.get(key);
      let retryTimes = 0;
      while (!result && retryTimes < 3) {
        result = AppStorage.get(key);
        await Utils.sleep(1000);
        retryTimes++;
        console.info('AppStorage.get retryTimes: ' + retryTimes);
      }
      if (!result) {
        console.error('result is undefined!');
        return;
      }
      expect(result.type).assertEqual('boolean');
      expect(result.value).assertEqual(true);
      done();
    });
  });
}