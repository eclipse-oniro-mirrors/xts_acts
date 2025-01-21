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

export default function webViewMenuInputFieldType() {

  describe('webViewMenuInputFieldType', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebViewMenuInputFieldType',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewMenuInputFieldType state success " + JSON.stringify(pages));
        if (!("webTwo" == pages.name)) {
          console.info("get webViewMenuInputFieldType state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webViewMenuInputFieldType page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewMenuInputFieldType page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_INPUTFIELDTYPENUMBER_0100
    * @tc.name       : testInputFieldTypeNumber001
    * @tc.desc       : test InputFieldType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testInputFieldTypeNumber001', 0, async (done: Function) => {
      Utils.emitEvent("emitInputFieldTypeNumber001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testInputFieldTypeNumber001", true, 2901, done);
      sendEventByKey('WebViewMenuInputFieldTypeTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_INPUTFIELDTYPETEXT_0100
    * @tc.name       : testInputFieldTypeText001
    * @tc.desc       : test InputFieldTypeText
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testInputFieldTypeText001', 0, async (done: Function) => {
      Utils.emitEvent("emitInputFieldTypeText001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testInputFieldTypeText001", true, 2902, done);
      sendEventByKey('WebViewMenuInputFieldTypeTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_INPUTFIELDTYPEPASSWORD_0100
    * @tc.name       : testInputFieldTypePassword001
    * @tc.desc       : test InputFieldTypePassWord
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testInputFieldTypePassword001', 0, async (done: Function) => {
      Utils.emitEvent("emitInputFieldTypePassWord001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testInputFieldTypePassword001", true, 2903, done);
      sendEventByKey('WebViewMenuInputFieldTypeTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_INPUTFIELDTYPETELEPHONE_0100
    * @tc.name       : testInputFieldTypeTelephone001
    * @tc.desc       : test InputFieldTypePassTelephone
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testInputFieldTypeTelephone001', 0, async (done: Function) => {
      Utils.emitEvent("emitInputFieldTypeTelephone001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testInputFieldTypeTelephone001", true, 2904, done);
      sendEventByKey('WebViewMenuInputFieldTypeTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_INPUTFIELDTYPEOTHER_0100
    * @tc.name       : testInputFieldTypeOther001
    * @tc.desc       : test InputFieldTypeOther
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testInputFieldTypeOther001', 0, async (done: Function) => {
      Utils.emitEvent("emitInputFieldTypeOther001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testInputFieldTypeOther001", true, 2905, done);
      sendEventByKey('WebViewMenuInputFieldTypeTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONINTERCEPTKEYBOARDATTACH_0100
    * @tc.name       : testOnInterceptKeyboardAttach0100
    * @tc.desc       : test onInterceptKeyboardAttach
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('onInterceptKeyboardAttach0100', 0, async (done: Function) => {
      Utils.emitEvent("onInterceptKeyboardAttach0100", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("onInterceptKeyboardAttach0100", true, 2893, done);
      sendEventByKey('WebViewMenuInputFieldTypeTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONINTERCEPTKEYBOARDATTACH_0200
    * @tc.name       : testOnInterceptKeyboardAttach0200
    * @tc.desc       : test onInterceptKeyboardAttach
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('onInterceptKeyboardAttach0200', 0, async (done: Function) => {
      Utils.emitEvent("onInterceptKeyboardAttach0200", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("onInterceptKeyboardAttach0200", true, 2894, done);
      sendEventByKey('WebViewMenuInputFieldTypeTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONINTERCEPTKEYBOARDATTACH_0300
    * @tc.name       : testOnInterceptKeyboardAttach0300
    * @tc.desc       : test onInterceptKeyboardAttach
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('onInterceptKeyboardAttach0300', 0, async (done: Function) => {
      Utils.emitEvent("onInterceptKeyboardAttach0300", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("onInterceptKeyboardAttach0300", 6, 2895, done);
      sendEventByKey('WebViewMenuInputFieldTypeTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONINTERCEPTKEYBOARDATTACH_0400
    * @tc.name       : testOnInterceptKeyboardAttach0400
    * @tc.desc       : test onInterceptKeyboardAttach
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('onInterceptKeyboardAttach0400', 0, async (done: Function) => {
      Utils.emitEvent("onInterceptKeyboardAttach0400", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("onInterceptKeyboardAttach0400", 2, 2896, done);
      sendEventByKey('WebViewMenuInputFieldTypeTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONINTERCEPTKEYBOARDATTACH_0500
    * @tc.name       : testOnInterceptKeyboardAttach0500
    * @tc.desc       : test onInterceptKeyboardAttach
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('onInterceptKeyboardAttach0500', 0, async (done: Function) => {
      Utils.emitEvent("onInterceptKeyboardAttach0500", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("onInterceptKeyboardAttach0500", 5, 2897, done);
      sendEventByKey('WebViewMenuInputFieldTypeTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONINTERCEPTKEYBOARDATTACH_0600
    * @tc.name       : testOnInterceptKeyboardAttach0600
    * @tc.desc       : test onInterceptKeyboardAttach
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('onInterceptKeyboardAttach0600', 0, async (done: Function) => {
      Utils.emitEvent("onInterceptKeyboardAttach0600", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("onInterceptKeyboardAttach0600", 7, 2898, done);
      sendEventByKey('WebViewMenuInputFieldTypeTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONINTERCEPTKEYBOARDATTACH_0700
    * @tc.name       : testOnInterceptKeyboardAttach0700
    * @tc.desc       : test onInterceptKeyboardAttach
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('onInterceptKeyboardAttach0700', 0, async (done: Function) => {
      Utils.emitEvent("onInterceptKeyboardAttach0700", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("onInterceptKeyboardAttach0700", 3, 2899, done);
      sendEventByKey('WebViewMenuInputFieldTypeTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONINTERCEPTKEYBOARDATTACH_0800
    * @tc.name       : testOnInterceptKeyboardAttach0800
    * @tc.desc       : test onInterceptKeyboardAttach
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('onInterceptKeyboardAttach0800', 0, async (done: Function) => {
      Utils.emitEvent("onInterceptKeyboardAttach0800", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("onInterceptKeyboardAttach0800", 4, 2880, done);
      sendEventByKey('WebViewMenuInputFieldTypeTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONINTERCEPTKEYBOARDATTACH_0900
    * @tc.name       : testOnInterceptKeyboardAttach0900
    * @tc.desc       : test onInterceptKeyboardAttach
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('onInterceptKeyboardAttach0900', 0, async (done: Function) => {
      Utils.emitEvent("onInterceptKeyboardAttach0900", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("onInterceptKeyboardAttach0900", 0, 2881, done);
      sendEventByKey('WebViewMenuInputFieldTypeTestButton', 10, '');
    })
  })
}
