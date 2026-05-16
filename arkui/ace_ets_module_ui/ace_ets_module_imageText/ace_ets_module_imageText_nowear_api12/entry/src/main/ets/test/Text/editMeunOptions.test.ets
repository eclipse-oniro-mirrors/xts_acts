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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function editMeunOptionsTest() {
  describe('editMeunOptionsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("editMeunOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/editMeunOptions',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get editMeunOptionsTest state pages:" + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        await CommonFunc.sleep(2000);
        console.info("push editMeunOptionsTest page result:" + JSON.stringify(result));
        if (!("editMeunOptions" == pages.name)) {
          console.info("get editMeunOptionsTest pages.name:" + JSON.stringify(pages.name));
        }
      } catch (err) {
        console.error("push editMeunOptionsTest page error:" + err);
      }
      console.info("editMeunOptionsTest beforeEach end");
      done();
    });

    /**
     * @tc.name   editMeunOptionsTest_0100
     * @tc.number editMeunOptionsTest_0100
     * @tc.desc   Text: editMeunOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('editMeunOptionsTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('editMeunOptionsTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('TextEditMenuOptions'));
      await button.longClick();
      await CommonFunc.sleep(2000);
      await driver.assertComponentExist(ON.text('Custom 2'));      
      console.info('editMeunOptionsTest_0100 END');
      done();
    });

    /**
     * @tc.name   editMeunOptionsTest_0300
     * @tc.number editMeunOptionsTest_0300
     * @tc.desc   TextInput: editMeunOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('editMeunOptionsTest_0300', Level.LEVEL2, async (done: Function) => {
      console.info('editMeunOptionsTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('TextInputEditMenuOptions'));
      await button.longClick();
      await CommonFunc.sleep(2000);
      await driver.assertComponentExist(ON.text('Custom 2'));
      console.info('editMeunOptionsTest_0300 END');
      done();
    });

    /**
     * @tc.name   editMeunOptionsTest_0200
     * @tc.number editMeunOptionsTest_0200
     * @tc.desc   TextArea: editMeunOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('editMeunOptionsTest_0200', Level.LEVEL2, async (done: Function) => {
      console.info('editMeunOptionsTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('TextAreaEditMenuOptions'));
      await button.longClick();
      await CommonFunc.sleep(2000);
      await driver.assertComponentExist(ON.text('Custom 2'));
      console.info('editMeunOptionsTest_0200 END');
      done();
    });

  })
}