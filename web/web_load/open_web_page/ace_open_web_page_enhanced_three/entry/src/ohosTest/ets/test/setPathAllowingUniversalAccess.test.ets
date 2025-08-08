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
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function setPathAllowingUniversalAccess() {

  describe('setPathAllowingUniversalAccess', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/setPathAllowingUniversalAccess',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get setPathAllowingUniversalAccess state success " + JSON.stringify(pages));
        if (!("webTwo" == pages.name)) {
          console.info("get setPathAllowingUniversalAccess state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push setPathAllowingUniversalAccess page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push setPathAllowingUniversalAccess page error: " + err);
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
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_SETPATHALLOWINGUNIVERSALACCESS_0100
    * @tc.name       : setPathAllowingUniversalAccess0100
    * @tc.desc       : test setPathAllowingUniversalAccess
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('setPathAllowingUniversalAccess0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("setPathAllowingUniversalAccess0100", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("setPathAllowingUniversalAccess0100", 1, 9470, done);
      sendEventByKey('setPathAllowingUniversalAccessButton', 10, '');
    })

  })
}
