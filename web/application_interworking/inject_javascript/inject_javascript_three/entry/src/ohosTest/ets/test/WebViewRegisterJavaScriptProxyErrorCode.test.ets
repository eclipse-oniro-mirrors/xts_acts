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

import { beforeAll, beforeEach,afterEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function WebviewRegisterJavaScriptProxyErrorCode() {

  describe('WebviewRegisterJavaScriptProxyErrorCode', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebviewRegisterJavaScriptProxyErrorCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebviewRegisterJavaScriptProxyErrorCode state success ' + JSON.stringify(pages));
        if (!("WebviewRegisterJavaScriptProxyErrorCode" == pages.name)) {
          console.info('get WebviewRegisterJavaScriptProxyErrorCode state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebviewRegisterJavaScriptProxyErrorCode page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebviewRegisterJavaScriptProxyErrorCode page error: ' + err);
      }
      await waitForComponent("WebviewRegisterJavaScriptProxyErrorCodeButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('WebviewRegisterJavaScriptProxyErrorCode beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('WebviewRegisterJavaScriptProxyErrorCode afterEach start');
      console.info('WebviewRegisterJavaScriptProxyErrorCode afterEach end');
      done();
    })

    /*
    * @tc.number     : SUB_ACE_WEB_REGISTERJAVASCRIPTPROXY_OBJECT_ERRORCODE_API_0001
    * @tc.name       : testWebviewRegisterJavaScriptProxyObjectNull
    * @tc.desc       : test registerJavaScriptProxy object null
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebviewRegisterJavaScriptProxyObjectNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitWebviewRegisterJavaScriptProxyObjectNull', 173210);
      Utils.registerEvent('testWebviewRegisterJavaScriptProxyObjectNull', '401', 173220, done);
      sendEventByKey('WebviewRegisterJavaScriptProxyErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_REGISTERJAVASCRIPTPROXY_OBEJCT_ERRORCODE_API_0002
    * @tc.name       : testWebviewRegisterJavaScriptProxyObjectUndefined
    * @tc.desc       : test registerJavaScriptProxy object undefined
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebviewRegisterJavaScriptProxyObjectUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitWebviewRegisterJavaScriptProxyObjectUndefined', 173210);
      Utils.registerEvent('testWebviewRegisterJavaScriptProxyObjectUndefined', '401', 173230, done);
      sendEventByKey('WebviewRegisterJavaScriptProxyErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_REGISTERJAVASCRIPTPROXY_NAME_ERRORCODE_API_0001
    * @tc.name       : testWebviewRegisterJavaScriptProxyNameNull
    * @tc.desc       : test registerJavaScriptProxy name null
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebviewRegisterJavaScriptProxyNameNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitWebviewRegisterJavaScriptProxyNameNull', 173210);
      Utils.registerEvent('testWebviewRegisterJavaScriptProxyNameNull', '401', 173240, done);
      sendEventByKey('WebviewRegisterJavaScriptProxyErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_REGISTERJAVASCRIPTPROXY_NAME_ERRORCODE_API_0002
    * @tc.name       : testWebviewRegisterJavaScriptProxyNameUndefined
    * @tc.desc       : test registerJavaScriptProxy name undefined
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebviewRegisterJavaScriptProxyNameUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitWebviewRegisterJavaScriptProxyNameUndefined', 173210);
      Utils.registerEvent('testWebviewRegisterJavaScriptProxyNameUndefined', '401', 173250, done);
      sendEventByKey('WebviewRegisterJavaScriptProxyErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_REGISTERJAVASCRIPTPROXY_METHODLIST_ERRORCODE_API_0001
    * @tc.name       : testWebviewRegisterJavaScriptProxyMethodListNull
    * @tc.desc       : test registerJavaScriptProxy methodList null
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebviewRegisterJavaScriptProxyMethodListNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitWebviewRegisterJavaScriptProxyMethodListNull', 173210);
      Utils.registerEvent('testWebviewRegisterJavaScriptProxyMethodListNull', '401', 173260, done);
      sendEventByKey('WebviewRegisterJavaScriptProxyErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_REGISTERJAVASCRIPTPROXY_METHOD_ERRORCODE_API_0002
    * @tc.name       : testWebviewRegisterJavaScriptProxyMethodListUndefined
    * @tc.desc       : test registerJavaScriptProxy methodList undefined
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebviewRegisterJavaScriptProxyMethodListUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitWebviewRegisterJavaScriptProxyMethodListUndefined', 173210);
      Utils.registerEvent('testWebviewRegisterJavaScriptProxyMethodListUndefined', '401', 173270, done);
      sendEventByKey('WebviewRegisterJavaScriptProxyErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_REGISTERJAVASCRIPTPROXY_ASYNCMETHODLIST_ERRORCODE_API_0001
    * @tc.name       : testWebviewRegisterJavaScriptProxyAsyncMethodListNull
    * @tc.desc       : test registerJavaScriptProxy asyncMethodList null
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebviewRegisterJavaScriptProxyAsyncMethodListNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitWebviewRegisterJavaScriptProxyAsyncMethodListNull', 173210);
      Utils.registerEvent('testWebviewRegisterJavaScriptProxyAsyncMethodListNull', '401', 173280, done);
      sendEventByKey('WebviewRegisterJavaScriptProxyErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_REGISTERJAVASCRIPTPROXY_ASYNCMETHODLIST_ERRORCODE_API_0002
    * @tc.name       : testWebviewRegisterJavaScriptProxyAsyncMethodListUndefined
    * @tc.desc       : test registerJavaScriptProxy asyncMethodList undefined
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebviewRegisterJavaScriptProxyAsyncMethodListUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitWebviewRegisterJavaScriptProxyAsyncMethodListUndefined', 173210);
      Utils.registerEvent('testWebviewRegisterJavaScriptProxyAsyncMethodListUndefined', '401', 173290, done);
      sendEventByKey('WebviewRegisterJavaScriptProxyErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_REGISTERJAVASCRIPTPROXY_PERMISSION_ERRORCODE_API_0001
    * @tc.name       : testWebviewRegisterJavaScriptProxyPermissionNull
    * @tc.desc       : test registerJavaScriptProxy permission null
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebviewRegisterJavaScriptProxyPermissionNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitWebviewRegisterJavaScriptProxyPermissionNull', 173210);
      Utils.registerEvent('testWebviewRegisterJavaScriptProxyPermissionNull', '401', 173300, done);
      sendEventByKey('WebviewRegisterJavaScriptProxyErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_REGISTERJAVASCRIPTPROXY_PERMISSION_ERRORCODE_API_0002
    * @tc.name       : testWebviewRegisterJavaScriptProxyPermissionUndefined
    * @tc.desc       : test registerJavaScriptProxy permission undefined
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebviewRegisterJavaScriptProxyPermissionUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitWebviewRegisterJavaScriptProxyPermissionUndefined', 173210);
      Utils.registerEvent('testWebviewRegisterJavaScriptProxyPermissionUndefined', '401', 173310, done);
      sendEventByKey('WebviewRegisterJavaScriptProxyErrorCodeButton', 10, '');
    })


  })
}
