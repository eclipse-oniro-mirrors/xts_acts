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

export default function webAttributeTwo() {

  describe('webAttributeTwo', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webAttributeTwo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webAttributeTwo state success " + JSON.stringify(pages));
        if (!("webAttributeTwo" == pages.name)) {
          console.info("get webAttributeTwo state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webAttributeTwo page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webAttributeTwo page error: " + err);
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
      console.info("webAttributeTwo beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_ONWINDOWEXIT_0100
    * @tc.name       : testOnWindowExit001
    * @tc.desc       : test onWindowExit
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnWindowExit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testOnWindowExit001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnWindowExit001", true, 300750, done);
      sendEventByKey('WebAttributeButton', 10, '');
    })
  })
}
