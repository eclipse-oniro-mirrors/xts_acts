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

export default function webViewMenuShowResult() {

  describe('WebViewMenuShowResult', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewMenuShowResult',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewMenuShowResult state success " + JSON.stringify(pages));
        if (!("webTwo" == pages.name)) {
          console.info("get WebViewMenuShowResult state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewMenuShowResult page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewMenuShowResult page error: " + err);
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
    * @tc.number     : SUB_WEB_CLOSECONTEXTMENU_0100
    * @tc.name       : testCloseContextMenu001
    * @tc.desc       : test CloseContextMenu
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCloseContextMenu001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitCloseContextMenu", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testCloseContextMenu001", true, 3501, done);
      sendEventByKey('WebViewMenuShowResultTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_COPYGETEDITSTATEFLAGS_0100
    * @tc.name       : testCopyGetEditStateFlags001
    * @tc.desc       : test Copy
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitCopyGetEditStateFlags001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitCopyGetEditStateFlags001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitCopyGetEditStateFlags001", 4, 20241018, done);
      sendEventByKey('WebViewMenuShowResultTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_CONTEXTMENURESULTCOPY_0100
    * @tc.name       : testCopy001
    * @tc.desc       : test Copy
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCopy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitCopy001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testCopy001", true, 3502, done);
      sendEventByKey('WebViewMenuShowResultTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_CONTEXTMENURESULTCUT_0100
    * @tc.name       : testCut001
    * @tc.desc       : test Cut
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCut001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitCut001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testCut001", true, 3504, done);
      sendEventByKey('WebViewMenuShowResultTestButton', 10, '');
    })

  })
}
