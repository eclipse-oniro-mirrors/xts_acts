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

export default function webFontTest() {

  describe('WebFontTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebFontTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebFontTest state success " + JSON.stringify(pages));
        if (!("WebFontTest" == pages.name)) {
          console.info("get WebFontTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebFontTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebFontTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_WEBSTANDARDFONT_0100
    * @tc.name        : testWebStandardFont001
    * @tc.desc        : test WebStandardFont
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebStandardFont001', 0, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebStandardFont001", '"serif"', 75001, done);
      sendEventByKey('WebFontTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBSTANDARDFONT_0200
    * @tc.name        : testWebStandardFont002
    * @tc.desc        : test WebStandardFont
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebStandardFont002', 0, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebStandardFont002", '"monospace"', 75003, done);
      sendEventByKey('WebFontTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBSTANDARDFONT_0300
    * @tc.name        : testWebStandardFont003
    * @tc.desc        : test WebStandardFont
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebStandardFont003', 0, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebStandardFont003", '"Helvetica"', 75005, done);
      sendEventByKey('WebFontTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBSTANDARDFONT_0400
    * @tc.name        : testWebStandardFont004
    * @tc.desc        : test WebStandardFont
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebStandardFont004', 0, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebStandardFont004", '"Arial"', 75007, done);
      sendEventByKey('WebFontTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBSTANDARDFONT_0500
    * @tc.name        : testWebStandardFont005
    * @tc.desc        : test WebStandardFont
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebStandardFont005', 0, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebStandardFont005", '"\\"sans serif\\""', 75009, done);
      sendEventByKey('WebFontTestButton', 10, '');
    })

  })
}
