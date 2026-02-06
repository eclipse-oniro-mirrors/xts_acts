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
import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';
import { Driver, ON } from '@kit.TestKit';
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function EmbedVisibilityChange() {

  describe('EmbedVisibilityChange', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/EmbedVisibilityChange',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get EmbedVisibilityChange state success " + JSON.stringify(pages));
        if (!("webTwo" == pages.name)) {
          console.info("get EmbedVisibilityChange state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push EmbedVisibilityChange page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push EmbedVisibilityChange page error: " + err);
      }
      await waitForComponent("WebViewEmbedVisibilityChangeButton");
      done()
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_EMBEDVISIBILITYCHANGE_0100
    * @tc.name       : emitEmbedVisibilityChange001
    * @tc.desc       : test EmbedVisibilityChange
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitEmbedVisibilityChange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitEmbedVisibilityChange001", 153510)
      Utils.registerEvent("emitEmbedVisibilityChange001", true, 153520, done);
      sendEventByKey('WebViewEmbedVisibilityChangeButton', 10, '');
    })

  })
}
