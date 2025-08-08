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

import { afterEach, beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';

export default function WebViewEnumAndSetWebController() {

  describe('WebViewEnumAndSetWebControllerTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewEnumAndSetWebController',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewEnumAndSetWebController state success " + JSON.stringify(pages));
        if (!("webTwo" == pages.name)) {
          console.info("get WebViewEnumAndSetWebController state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewEnumAndSetWebController page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewEnumAndSetWebController page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebViewControllerDownloadTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebViewControllerDownloadTest afterEach end");
      done();
    })
    /*
     * @tc.number     : SUB_WEB_FILESELECTORMODE_0200
     * @tc.name       : testFileSelectorMode002
     * @tc.desc       : test FileSelectorMode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFileSelectorMode002', 0, async (done: Function) => {
      Utils.emitEvent("emitFileSelectorModeFileOpenMultipleMode", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFileSelectorMode002", 1, 862, done);
      sendEventByKey('buttonEnumAndSetWebController', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_FILESELECTORMODE_0300
    * @tc.name       : testFileSelectorMode003
    * @tc.desc       : test FileSelectorMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFileSelectorMode003', 0, async (done: Function) => {
      Utils.emitEvent("emitFileSelectorModeFileOpenFolderMode", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFileSelectorMode003", 2, 863, done);
      sendEventByKey('buttonEnumAndSetWebController', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_CONTEXTMENUMEDIATYPE_0200
    * @tc.name       : testContextMenuMediaType002
    * @tc.desc       : test ContextMenuMediaType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testContextMenuMediaType002', 0, async (done: Function) => {
      Utils.emitEvent("emitContextMenuMediaTypeImage", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testContextMenuMediaType002", 1, 882, done);
      sendEventByKey('buttonEnumAndSetWebController', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_CONTEXTMENUSOURCETYPEMOUSE_0100
    * @tc.name       : testContextMenuSourceTypeMouse001
    * @tc.desc       : test ContextMenuSourceTypeMouse
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testContextMenuSourceTypeMouse001', 0, async (done: Function) => {
      Utils.emitEvent("emitContextMenuSourceTypeMouse", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testContextMenuSourceTypeMouse001", 1, 1981, done);
      sendEventByKey('buttonEnumAndSetWebController', 10, '');
    })
  })
}
