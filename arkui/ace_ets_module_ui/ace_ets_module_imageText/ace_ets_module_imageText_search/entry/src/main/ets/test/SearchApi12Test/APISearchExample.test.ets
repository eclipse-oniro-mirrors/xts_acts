/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../MainAbility/common/Common';

export default function APISearchExample() {
  describe('APISearchExample', () => {
    beforeEach(async (done: Function) => {
      console.info("APISearchExampleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SearchApi12/APISearchExample',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get APISearchExample state pages: " + JSON.stringify(pages));
        if (!("APISearchExample" == pages.name)) {
          console.info("get APISearchExample pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push APISearchExample page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push APISearchExample page error: " + err);
      }
      await CommonFunc.sleep(1000)
      console.info("APISearchExample beforeEach end");
      done()
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("APISearchExample after each called");
    })

    /**
     * @tc.name   APISearchExample_0100
     * @tc.number APISearchExample_0100
     * @tc.desc   APISearchExample_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APISearchExample_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('APISearchExample_0100 START');
      let driver = await Driver.create()
      let textComponent = await driver.findComponent(ON.id('APISearchExample_Search'));
      await textComponent.click()
      await CommonFunc.sleep(1000);
	    await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await textComponent.inputText("DFE")
      await CommonFunc.sleep(2000);
	    await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('APISearchExample_Text01');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[APISearchExample_0100] component obj is: " + JSON.stringify(obj), obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('done');
      console.info('[APISearchExample_0100] END');
      done();
    });

    /**
     * @tc.name   APISearchExample_0200
     * @tc.number APISearchExample_0200
     * @tc.desc   APISearchExample_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APISearchExample_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('APISearchExample_0200 START');
      let driver = await Driver.create()
      let textComponent = await driver.findComponent(ON.id('APISearchExample_Search'));
      await textComponent.inputText("1")
      await CommonFunc.sleep(1000);
	    await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await textComponent.clearText();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('APISearchExample_Text02');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[APISearchExample_0200] component obj is: " + JSON.stringify(obj), obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('done');
      console.info('[APISearchExample_0200] END');
      done();
    });
    /**
     * @tc.name   APISearchExample_0300
     * @tc.number APISearchExample_0300
     * @tc.desc   APISearchExample_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APISearchExample_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('APISearchExample_0200 START');
      let driver = await Driver.create()
      let textComponent = await driver.findComponent(ON.id('APISearchExample_Search'));
      await textComponent.click()
      await CommonFunc.sleep(1000);
	    await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await textComponent.inputText("123");
      await CommonFunc.sleep(2000);
	    await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('APISearchExample_Text03');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[APISearchExample_0300] component obj is: " + JSON.stringify(obj), obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('init');
      console.info('[APISearchExample_0300] END');
      done();
    });

    /**
     * @tc.name   APISearchExample_0400
     * @tc.number APISearchExample_0400
     * @tc.desc   APISearchExample_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APISearchExample_0400',  Level.LEVEL0, async (done: Function) => {
      console.info('APISearchExample_0200 START');
      let driver = await Driver.create()
      let textComponent = await driver.findComponent(ON.id('APISearchExample_Search'));
      await textComponent.click()
      await CommonFunc.sleep(1000);
	    await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await textComponent.inputText("2")
      await CommonFunc.sleep(2000);
	    await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('APISearchExample_Text04');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[APISearchExample_0200] component obj is: " + JSON.stringify(obj), obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('init');
      console.info('[APISearchExample_0200] END');
      done();
    });
  })
}