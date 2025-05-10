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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import { hilog } from '@kit.PerformanceAnalysisKit';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
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
        await Utils.sleep(1000);
        router.clear();
        let pages = router.getState();
        console.info("get webviewBFCacheSuspendPlayer state success " + JSON.stringify(pages));
        if (!("CookieTest" == pages.name)) {
          console.info("get index state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info("push index state success " + JSON.stringify(result));
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
      await Utils.sleep(2000);
      done();
    });

    afterEach(() => {

    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.number SUB_WEB_ONCREATWEBCOOKIEMANAGER_0100
     * @tc.name testOnCreatWebCookieManager0100
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testOnCreatWebCookieManager0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testOnCreatWebCookieManager0100 START');
      let result:ResultData | undefined = AppStorage.get('getCookie10114')
      if(result != undefined){
        expect(result.type).assertEqual('string');
        expect(result.value).assertEqual('a=b');
        hilog.info(0x0000, 'testTag', '%{public}s', 'testOnCreatWebCookieManager0100 END');
        done();
      }
    });

    /**
     * @tc.number SUB_WEB_ONCREATWEBCOOKIEMANAGER_0200
     * @tc.name testOnCreatWebCookieManager0200
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testOnCreatWebCookieManager0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testOnCreatWebCookieManager0200 START');
      let result:ResultData | undefined = AppStorage.get('fetchCookieSync10115')
      if(result != undefined){
        expect(result.type).assertEqual('string');
        expect(result.value).assertEqual('a=b');
        hilog.info(0x0000, 'testTag', '%{public}s', 'testOnCreatWebCookieManager0200 END');
        done();
      }
    });

    /**
     * @tc.number SUB_WEB_ONCREATWEBCOOKIEMANAGER_0300
     * @tc.name testOnCreatWebCookieManager0300
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testOnCreatWebCookieManager0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testOnCreatWebCookieManager0300 START');
      let result:ResultData | undefined = AppStorage.get('fetchCookieCallback10116')
      if(result != undefined){
        expect(result.type).assertEqual('string');
        expect(result.value).assertEqual('a=b');
        hilog.info(0x0000, 'testTag', '%{public}s', 'testOnCreatWebCookieManager0300 END');
        done();
      }
    });

    /**
     * @tc.number SUB_WEB_ONCREATWEBCOOKIEMANAGER_0400
     * @tc.name testOnCreatWebCookieManager0400
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testOnCreatWebCookieManager0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testOnCreatWebCookieManager0400 START');
      let result:ResultData | undefined = AppStorage.get('fetchCookiePromise10117')
      if(result != undefined){
        expect(result.type).assertEqual('string');
        expect(result.value).assertEqual('a=b');
        hilog.info(0x0000, 'testTag', '%{public}s', 'testOnCreatWebCookieManager0400 END');
        done();
      }
    });

    /**
     * @tc.number SUB_WEB_ONCREATWEBCOOKIEMANAGER_0500
     * @tc.name testOnCreatWebCookieManager0500
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testOnCreatWebCookieManager0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testOnCreatWebCookieManager0500 START');
      let result:ResultData | undefined = AppStorage.get('configCookieSync10118')
      if(result != undefined){
        expect(result.type).assertEqual('string');
        expect(result.value).assertEqual('a=b');
        hilog.info(0x0000, 'testTag', '%{public}s', 'testOnCreatWebCookieManager0500 END');
        done();
      }
    });

    /**
     * @tc.number SUB_WEB_ONCREATWEBCOOKIEMANAGER_0600
     * @tc.name testOnCreatWebCookieManager0600
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testOnCreatWebCookieManager0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testOnCreatWebCookieManager0600 START');
      let result:ResultData | undefined = AppStorage.get('configCookieCallback10119')
      if(result != undefined){
        expect(result.type).assertEqual('string');
        expect(result.value).assertEqual('a=b');
        hilog.info(0x0000, 'testTag', '%{public}s', 'testOnCreatWebCookieManager0600 END');
        done();
      }
    });

    /**
     * @tc.number SUB_WEB_ONCREATWEBCOOKIEMANAGER_0700
     * @tc.name testOnCreatWebCookieManager0700
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testOnCreatWebCookieManager0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testOnCreatWebCookieManager0700 START');
      let result:ResultData | undefined = AppStorage.get('configCookiePromise10120')
      if(result != undefined){
        expect(result.type).assertEqual('string');
        expect(result.value).assertEqual('a=b');
        hilog.info(0x0000, 'testTag', '%{public}s', 'testOnCreatWebCookieManager0700 END');
        done();
      }
    });

    /**
     * @tc.number SUB_WEB_ONCREATWEBCOOKIEMANAGER_1000
     * @tc.name testOnCreatWebCookieManager1000
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testOnCreatWebCookieManager1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testOnCreatWebCookieManager1000 START');
      let result:ResultData | undefined = AppStorage.get('putAcceptCookieEnabled10123')
      if(result != undefined){
        expect(result.type).assertEqual('boolean');
        expect(result.value).assertEqual(false);
        hilog.info(0x0000, 'testTag', '%{public}s', 'testOnCreatWebCookieManager1000 END');
        done();
      }
    });

    /**
     * @tc.number SUB_WEB_ONCREATWEBCOOKIEMANAGER_1100
     * @tc.name testOnCreatWebCookieManager1100
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testOnCreatWebCookieManager1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testOnCreatWebCookieManager1100 START');
      let result:ResultData | undefined = AppStorage.get('putAcceptThirdPartyCookieEnabled10124')
      if(result != undefined){
        expect(result.type).assertEqual('boolean');
        expect(result.value).assertEqual(false);
        hilog.info(0x0000, 'testTag', '%{public}s', 'testOnCreatWebCookieManager1100 END');
        done();
      }
    });

    /**
     * @tc.number SUB_WEB_ONCREATWEBCOOKIEMANAGER_1200
     * @tc.name testOnCreatWebCookieManager1200
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testOnCreatWebCookieManager1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testOnCreatWebCookieManager1200 START');
      let result:ResultData | undefined = AppStorage.get('existCookie10125')
      if(result != undefined){
        expect(result.type).assertEqual('boolean');
        expect(result.value).assertEqual(true);
        hilog.info(0x0000, 'testTag', '%{public}s', 'testOnCreatWebCookieManager1200 END');
        done();
      }
    });


  });
}