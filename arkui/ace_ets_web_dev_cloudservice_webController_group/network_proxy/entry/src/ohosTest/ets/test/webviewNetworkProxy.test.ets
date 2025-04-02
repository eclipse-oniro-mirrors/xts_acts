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

import { beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';

export default function webviewNetworkProxy() {

  describe('webviewNetworkProxyTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webviewNetworkProxy',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewNetworkProxy state success ' + JSON.stringify(pages));
        if (!('webviewNetworkProxy' == pages.name)) {
          console.info('get webviewNetworkProxy state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push webviewNetworkProxy page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webviewNetworkProxy page error: ' + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info('webviewNetworkProxy beforeEach start');
      done();
    })


    /*
    * @tc.number     : SUB_WEB_NETWORKPROXY_0100
    * @tc.name       : testNetworkProxySchemeFilterMatchAllSchemes
    * @tc.desc       : test ProxySchemeFilter MATCH_ALL_SCHEMES
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testNetworkProxySchemeFilterMatchAllSchemes', 0, async (done: Function) => {
      Utils.emitEvent('testNetworkProxySchemeFilterMatchAllSchemes', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testNetworkProxySchemeFilterMatchAllSchemes', true, 202502181, done);
      sendEventByKey('networkProxyButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_NETWORKPROXY_0200
    * @tc.name       : testNetworkProxySchemeFilterMatchHttp
    * @tc.desc       : test ProxySchemeFilter MATCH_HTTP
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testNetworkProxySchemeFilterMatchHttp', 0, async (done: Function) => {
      Utils.emitEvent('testNetworkProxySchemeFilterMatchHttp', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testNetworkProxySchemeFilterMatchHttp', true, 202502182, done);
      sendEventByKey('networkProxyButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_NETWORKPROXY_0300
    * @tc.name       : testNetworkProxySchemeFilterMatchHttps
    * @tc.desc       : test ProxySchemeFilter MATCH_HTTPS
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testNetworkProxySchemeFilterMatchHttps', 0, async (done: Function) => {
      Utils.emitEvent('testNetworkProxySchemeFilterMatchHttps', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testNetworkProxySchemeFilterMatchHttps', true, 202502183, done);
      sendEventByKey('networkProxyButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_NETWORKPROXY_0400
    * @tc.name       : testInsertProxyRule
    * @tc.desc       : test insertProxyRule
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testInsertProxyRule', 0, async (done: Function) => {
      Utils.emitEvent('testInsertProxyRule', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testInsertProxyRule', true, 202502184, done);
      sendEventByKey('networkProxyButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_NETWORKPROXY_0500
    * @tc.name       : testInsertDirectRule
    * @tc.desc       : test insertDirectRule
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testInsertDirectRule', 0, async (done: Function) => {
      Utils.emitEvent('testInsertDirectRule', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testInsertDirectRule', true, 202502185, done);
      sendEventByKey('networkProxyButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_NETWORKPROXY_0600
    * @tc.name       : testInsertBypassRule
    * @tc.desc       : test insertBypassRule
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testInsertBypassRule', 0, async (done: Function) => {
      Utils.emitEvent('testInsertBypassRule', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testInsertBypassRule', true, 202502186, done);
      sendEventByKey('networkProxyButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_NETWORKPROXY_0700
    * @tc.name       : testBypassHostnamesWithoutPeriod
    * @tc.desc       : test bypassHostnamesWithoutPeriod
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testBypassHostnamesWithoutPeriod', 0, async (done: Function) => {
      Utils.emitEvent('testBypassHostnamesWithoutPeriod', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testBypassHostnamesWithoutPeriod', true, 202502187, done);
      sendEventByKey('networkProxyButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_NETWORKPROXY_0800
    * @tc.name       : testClearImplicitRules
    * @tc.desc       : test clearImplicitRules
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testClearImplicitRules', 0, async (done: Function) => {
      Utils.emitEvent('testClearImplicitRules', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testClearImplicitRules', true, 202502188, done);
      sendEventByKey('networkProxyButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_NETWORKPROXY_0900
    * @tc.name       : testEnableReverseBypass
    * @tc.desc       : test enableReverseBypass
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testEnableReverseBypass', 0, async (done: Function) => {
      Utils.emitEvent('testEnableReverseBypass', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testEnableReverseBypass', true, 202502189, done);
      sendEventByKey('networkProxyButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_NETWORKPROXY_1000
    * @tc.name       : testGetBypassRules
    * @tc.desc       : test getBypassRules
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetBypassRules', 0, async (done: Function) => {
      Utils.emitEvent('testGetBypassRules', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testGetBypassRules', true, 202502190, done);
      sendEventByKey('networkProxyButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_NETWORKPROXY_1100
    * @tc.name       : testGetProxyRules
    * @tc.desc       : test getProxyRules
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetProxyRules', 0, async (done: Function) => {
      Utils.emitEvent('testGetProxyRules', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testGetProxyRules', true, 202502191, done);
      sendEventByKey('networkProxyButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_NETWORKPROXY_1200
    * @tc.name       : testIsReverseBypassEnabled
    * @tc.desc       : test isReverseBypassEnabled
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testIsReverseBypassEnabled', 0, async (done: Function) => {
      Utils.emitEvent('testIsReverseBypassEnabled', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testIsReverseBypassEnabled', false, 202502192, done);
      sendEventByKey('networkProxyButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_NETWORKPROXY_1300
    * @tc.name       : testGetSchemeFilter
    * @tc.desc       : test getSchemeFilter
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetSchemeFilter', 0, async (done: Function) => {
      Utils.emitEvent('testGetSchemeFilter', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testGetSchemeFilter', true, 202502193, done);
      sendEventByKey('networkProxyButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_NETWORKPROXY_1300
    * @tc.name       : testProxyGetUrl
    * @tc.desc       : test getUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testProxyGetUrl', 0, async (done: Function) => {
      Utils.emitEvent('testProxyGetUrl', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testProxyGetUrl', true, 202502194, done);
      sendEventByKey('networkProxyButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_NETWORKPROXY_1500
    * @tc.name       : testApplyProxyOverride
    * @tc.desc       : test applyProxyOverride
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testApplyProxyOverride', 0, async (done: Function) => {
      Utils.emitEvent('testApplyProxyOverride', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testApplyProxyOverride', true, 202502195, done);
      sendEventByKey('networkProxyButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_NETWORKPROXY_1600
    * @tc.name       : testRemoveProxyOverride
    * @tc.desc       : test removeProxyOverride
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRemoveProxyOverride', 0, async (done: Function) => {
      Utils.emitEvent('testRemoveProxyOverride', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testRemoveProxyOverride', true, 202502196, done);
      sendEventByKey('networkProxyButton', 10, '');
    })

  })
}
