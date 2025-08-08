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

export default function setTextSelection() {
  describe('setTextSelection', () => {
    beforeEach(async (done: Function) => {
      console.info("setTextSelection beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/setTextSelection',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get setTextSelection state pages:" + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("setTextSelection" == pages.name)) {
          console.info("get setTextSelection pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push setTextSelection page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push setTextSelection page error:" + err);
      }
      console.info("setTextSelection beforeEach end");
      done();
    });

    /**
     * @tc.number    setTextSelection_0100
     * @tc.name      setTextSelection_0100
     * @tc.desc      TextArea,TextInput: setTextSelection
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('setTextSelection_0100', Level.LEVEL1, async (done: Function) => {
      console.info('setTextSelection_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let textArea = await driver.findComponent(ON.id('textArea'));
      await CommonFunc.sleep(500);
      await textArea.click();
      await CommonFunc.sleep(500);
      let but = await driver.findComponent(ON.id('but1'));
      await CommonFunc.sleep(500);
      await but.click();
      await CommonFunc.sleep(500);
      expect('' + AppStorage.get('textAreaStart')).assertEqual("0");
      expect('' + AppStorage.get('textAreaEnd')).assertEqual("0");
      let textInput = await driver.findComponent(ON.id('textInput'));
      await CommonFunc.sleep(500);
      await textInput.click();
      await CommonFunc.sleep(500);
      await but.click();
      await CommonFunc.sleep(500);
      expect('' + AppStorage.get('textInputStart')).assertEqual("0");
      expect('' + AppStorage.get('textInputEnd')).assertEqual("0");
      AppStorage.delete('textAreaStart');
      AppStorage.delete('textAreaEnd');
      AppStorage.delete('textInputStart');
      AppStorage.delete('textInputEnd');
      console.info('setTextSelection_0100 END');
      done();
    });

    /**
     * @tc.number    setTextSelection_0200
     * @tc.name      setTextSelection_0200
     * @tc.desc      TextArea,TextInput: setTextSelection
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('setTextSelection_0200', Level.LEVEL1, async (done: Function) => {
      console.info('setTextSelection_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let textArea = await driver.findComponent(ON.id('textArea'));
      await CommonFunc.sleep(500);
      await textArea.click();
      await CommonFunc.sleep(500);
      let but = await driver.findComponent(ON.id('but2'));
      await CommonFunc.sleep(500);
      await but.click();
      await CommonFunc.sleep(500);
      expect('' + AppStorage.get('textAreaStart')).assertEqual("0");
      expect('' + AppStorage.get('textAreaEnd')).assertEqual("3");
      let textInput = await driver.findComponent(ON.id('textInput'));
      await CommonFunc.sleep(500);
      await textInput.click();
      await CommonFunc.sleep(500);
      await but.click();
      await CommonFunc.sleep(500);
      expect('' + AppStorage.get('textInputStart')).assertEqual("0");
      expect('' + AppStorage.get('textInputEnd')).assertEqual("3");
      AppStorage.delete('textAreaStart');
      AppStorage.delete('textAreaEnd');
      AppStorage.delete('textInputStart');
      AppStorage.delete('textInputEnd');
      console.info('setTextSelection_0200 END');
      done();
    });

    /**
     * @tc.number    setTextSelection_0300
     * @tc.name      setTextSelection_0300
     * @tc.desc      TextArea,TextInput: setTextSelection
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('setTextSelection_0300', Level.LEVEL1, async (done: Function) => {
      console.info('setTextSelection_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let textArea = await driver.findComponent(ON.id('textArea'));
      await CommonFunc.sleep(500);
      await textArea.click();
      await CommonFunc.sleep(500);
      let but = await driver.findComponent(ON.id('but3'));
      await CommonFunc.sleep(500);
      await but.click();
      await CommonFunc.sleep(500);
      expect('' + AppStorage.get('textAreaStart')).assertEqual("0");
      expect('' + AppStorage.get('textAreaEnd')).assertEqual("0");
      let textInput = await driver.findComponent(ON.id('textInput'));
      await CommonFunc.sleep(500);
      await textInput.click();
      await CommonFunc.sleep(500);
      await but.click();
      await CommonFunc.sleep(500);
      expect('' + AppStorage.get('textInputStart')).assertEqual("0");
      expect('' + AppStorage.get('textInputEnd')).assertEqual("0");
      await but.click();
      await CommonFunc.sleep(500);
      if (globalThis.winLeft == 0) {
        await driver.assertComponentExist(ON.text('全选'));
      }
      AppStorage.delete('textAreaStart');
      AppStorage.delete('textAreaEnd');
      AppStorage.delete('textInputStart');
      AppStorage.delete('textInputEnd');
      console.info('setTextSelection_0300 END');
      done();
    });


    /**
     * @tc.number    setTextSelection_0400
     * @tc.name      setTextSelection_0400
     * @tc.desc      TextArea,TextInput: setTextSelection
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('setTextSelection_0400', Level.LEVEL1, async (done: Function) => {
      console.info('setTextSelection_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let textArea = await driver.findComponent(ON.id('textArea'));
      await CommonFunc.sleep(500);
      await textArea.click();
      await CommonFunc.sleep(500);
      let but = await driver.findComponent(ON.id('but4'));
      await CommonFunc.sleep(500);
      await but.click();
      await CommonFunc.sleep(500);
      expect('' + AppStorage.get('textAreaStart')).assertEqual("0");
      expect('' + AppStorage.get('textAreaEnd')).assertEqual("0");
      let textInput = await driver.findComponent(ON.id('textInput'));
      await CommonFunc.sleep(500);
      await textInput.click();
      await CommonFunc.sleep(500);
      await but.click();
      await CommonFunc.sleep(500);
      expect('' + AppStorage.get('textInputStart')).assertEqual("0");
      expect('' + AppStorage.get('textInputEnd')).assertEqual("0");
      AppStorage.delete('textAreaStart');
      AppStorage.delete('textAreaEnd');
      AppStorage.delete('textInputStart');
      AppStorage.delete('textInputEnd');
      console.info('setTextSelection_0400 END');
      done();
    });

    /**
     * @tc.number    setTextSelection_0500
     * @tc.name      setTextSelection_0500
     * @tc.desc      TextArea,TextInput: setTextSelection
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('setTextSelection_0500', Level.LEVEL1, async (done: Function) => {
      console.info('setTextSelection_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let textArea = await driver.findComponent(ON.id('textArea'));
      await CommonFunc.sleep(500);
      await textArea.click();
      await CommonFunc.sleep(500);
      let but = await driver.findComponent(ON.id('but5'));
      await CommonFunc.sleep(500);
      await but.click();
      await CommonFunc.sleep(500);
      expect('' + AppStorage.get('textAreaStart')).assertEqual("0");
      expect('' + AppStorage.get('textAreaEnd')).assertEqual("4");
      let textInput = await driver.findComponent(ON.id('textInput'));
      await CommonFunc.sleep(500);
      await textInput.click();
      await CommonFunc.sleep(500);
      await but.click();
      await CommonFunc.sleep(500);
      expect('' + AppStorage.get('textInputStart')).assertEqual("0");
      expect('' + AppStorage.get('textInputEnd')).assertEqual("4");
      AppStorage.delete('textAreaStart');
      AppStorage.delete('textAreaEnd');
      AppStorage.delete('textInputStart');
      AppStorage.delete('textInputEnd');
      console.info('setTextSelection_0500 END');
      done();
    });
  })
}