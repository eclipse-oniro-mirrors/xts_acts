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
        url: 'testability/pages/webViewMenuInputFieldType',
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
  })
}
