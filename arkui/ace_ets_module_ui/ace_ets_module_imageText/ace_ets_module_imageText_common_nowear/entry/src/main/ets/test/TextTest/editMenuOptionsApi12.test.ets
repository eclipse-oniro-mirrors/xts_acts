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

export default function editMenuOptionsApi12Test() {
  describe('editMenuOptionsApi12Test', () => {
    beforeEach(async (done: Function) => {
      console.info("editMenuOptionsApi12Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/editMenuOptionsApi12',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get editMenuOptionsApi12Test state pages:" + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        await CommonFunc.sleep(2000);
        console.info("push editMenuOptionsApi12Test page result:" + JSON.stringify(result));
        if (!("editMenuOptionsApi12" == pages.name)) {
          console.info("get editMenuOptionsApi12Test pages.name:" + JSON.stringify(pages.name));
        }
      } catch (err) {
        console.error("push editMenuOptionsApi12Test page error:" + err);
      }
      console.info("editMenuOptionsApi12Test beforeEach end");
      done();
    });

    /**
     * @tc.name   editMenuOptionsApi12Test_0100
     * @tc.number editMenuOptionsApi12Test_0100
     * @tc.desc   Text: editMenuOptionsApi12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('editMenuOptionsApi12Test_0100', Level.LEVEL2, async (done: Function) => {
      console.info('editMenuOptionsApi12Test_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('TextEditMenuOptions'));
      await button.longClick();
      await CommonFunc.sleep(2000);
      await driver.assertComponentExist(ON.text('Custom 2'));
      let strJson1 = getInspectorByKey('TextEditMenuOptions');
      await CommonFunc.sleep(200);
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[editMenuOptionsApi12Test_0100] obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(500);
      expect(obj1.$type).assertEqual('Text');
      console.info('editMenuOptionsApi12Test_0100 END');
      done();
    });

    /**
     * @tc.name   editMenuOptionsApi12Test_0300
     * @tc.number editMenuOptionsApi12Test_0300
     * @tc.desc   TextInput: editMenuOptionsApi12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('editMenuOptionsApi12Test_0300', Level.LEVEL2, async (done: Function) => {
      console.info('editMenuOptionsApi12Test_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('TextInputEditMenuOptions'));
      await button.longClick();
      await CommonFunc.sleep(2000);
      await driver.assertComponentExist(ON.text('Custom 2'));
      let strJson1 = getInspectorByKey('TextInputEditMenuOptions');
      await CommonFunc.sleep(200);
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[editMenuOptionsApi12Test_0300] obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(500);
      expect(obj1.$type).assertEqual('TextInput');
      console.info('editMenuOptionsApi12Test_0300 END');
      done();
    });

    /**
     * @tc.name   editMenuOptionsApi12Test_0200
     * @tc.number editMenuOptionsApi12Test_0200
     * @tc.desc   TextArea: editMenuOptionsApi12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('editMenuOptionsApi12Test_0200', Level.LEVEL2, async (done: Function) => {
      console.info('editMenuOptionsApi12Test_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('TextAreaEditMenuOptions'));
      await button.longClick();
      await CommonFunc.sleep(2000);
      await driver.assertComponentExist(ON.text('Custom 2'));
      let strJson1 = getInspectorByKey('TextAreaEditMenuOptions');
      await CommonFunc.sleep(200);
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[editMenuIdAIWriterTest_0200] obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(500);
      expect(obj1.$type).assertEqual('TextArea');
      console.info('editMenuOptionsApi12Test_0200 END');
      done();
    });
  })
}