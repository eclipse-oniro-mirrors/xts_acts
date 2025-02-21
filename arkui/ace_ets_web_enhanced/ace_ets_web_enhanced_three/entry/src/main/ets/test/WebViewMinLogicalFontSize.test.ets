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

export default function webViewMinLogicalFontSize() {

  describe('WebViewMinLogicalFontSize', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebViewMinLogicalFontSize',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewMinLogicalFontSize state success " + JSON.stringify(pages));
        if (!("webTwo" == pages.name)) {
          console.info("get WebViewMinLogicalFontSize state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewMinLogicalFontSize page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewMinLogicalFontSize page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_MINLOGICALFONTSIZE_0100
    * @tc.name       : testMinLogicalFontSize001
    * @tc.desc       : test minLogicalFontSize
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testMinLogicalFontSize001', 0, async (done: Function) => {
      Utils.emitEvent("emitMinLogicalFontSize", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testMinLogicalFontSize001", true, 2602, done);
      sendEventByKey('WebViewMinLogicalFontSizeTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_MINLOGICALFONTSIZEMIN_0100
    * @tc.name       : testMinLogicalFontSizeMin001
    * @tc.desc       : test minLogicalFontSizeMin
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testMinLogicalFontSizeMin001', 0, async (done: Function) => {
      Utils.emitEvent("emitMinLogicalFontSizeMin", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testMinLogicalFontSizeMin001", true, 2603, done);
      sendEventByKey('WebViewMinLogicalFontSizeTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_MINLOGICALFONTSIZEMAX_0100
    * @tc.name       : testMinLogicalFontSizeMax001
    * @tc.desc       : test minLogicalFontSizeMax
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testMinLogicalFontSizeMax001', 0, async (done: Function) => {
      Utils.emitEvent("emitMinLogicalFontSizeMax", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testMinLogicalFontSizeMax001", true, 2604, done);
      sendEventByKey('WebViewMinLogicalFontSizeTestButton', 10, '');
    })
  })
}
