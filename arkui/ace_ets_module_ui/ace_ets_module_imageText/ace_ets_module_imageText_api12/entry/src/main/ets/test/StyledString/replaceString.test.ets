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

export default function replaceString() {
  describe('replaceString', () => {
    beforeEach(async (done: Function) => {
      console.info("replaceString beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/replaceString',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get replaceString state pages:" + JSON.stringify(pages));
        if (!("replaceString" == pages.name)) {
          console.info("get replaceString pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push replaceString page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push replaceString page error:" + err);
      }
      console.info("replaceString beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number replaceString_0100
     * @tc.name   testFocus
     * @tc.desc
     */
    it('replaceString_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('replaceString_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let but = await driver.findComponent(ON.id('but'));
      await CommonFunc.sleep(500);
      await but.click();
      await CommonFunc.sleep(500);
      let but2 = await driver.findComponent(ON.id('replaceString'));
      await CommonFunc.sleep(500);
      await but2.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('text');
      let obj: ESObject = JSON.parse(strJson);
      console.log('replaceString_0100---obj.$attrs.content---' +
        JSON.stringify(obj.$attrs.content));
      expect('' + obj.$attrs.content).assertEqual("401");

      console.info('replaceString_0100 END');
      done();
    });


    /**
     * @tc.number replaceString_0200
     * @tc.name   testFocus
     * @tc.desc
     */
    it('replaceString_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('replaceString_0200 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let but = await driver.findComponent(ON.id('but'));
      await CommonFunc.sleep(500);
      await but.click();
      await CommonFunc.sleep(500);
      let but2 = await driver.findComponent(ON.id('insertString'));
      await CommonFunc.sleep(500);
      await but2.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('text');
      let obj: ESObject = JSON.parse(strJson);
      console.log('replaceString_0200---obj.$attrs.content---' +
        JSON.stringify(obj.$attrs.content));
      expect('' + obj.$attrs.content).assertEqual("401");

      console.info('replaceString_0200 END');
      done();
    });

    /**
     * @tc.number replaceString_0300
     * @tc.name   testFocus
     * @tc.desc
     */
    it('replaceString_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('replaceString_0300 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let but = await driver.findComponent(ON.id('but'));
      await CommonFunc.sleep(500);
      await but.click();
      await CommonFunc.sleep(500);
      let but2 = await driver.findComponent(ON.id('removeString'));
      await CommonFunc.sleep(500);
      await but2.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('text');
      let obj: ESObject = JSON.parse(strJson);
      console.log('replaceString_0300---obj.$attrs.content---' +
        JSON.stringify(obj.$attrs.content));
      expect('' + obj.$attrs.content).assertEqual("401");

      console.info('replaceString_0300 END');
      done();
    });

    /**
     * @tc.number replaceString_0400
     * @tc.name   testFocus
     * @tc.desc
     */
    it('replaceString_0400',  Level.LEVEL0, async (done: Function) => {
      console.info('replaceString_0400 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let but = await driver.findComponent(ON.id('but'));
      await CommonFunc.sleep(500);
      await but.click();
      await CommonFunc.sleep(500);
      let but2 = await driver.findComponent(ON.id('replaceStyle'));
      await CommonFunc.sleep(500);
      await but2.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('text');
      let obj: ESObject = JSON.parse(strJson);
      console.log('replaceString_0400---obj.$attrs.content---' +
        JSON.stringify(obj.$attrs.content));
      expect('' + obj.$attrs.content).assertEqual("401");

      console.info('replaceString_0400 END');
      done();
    });

    /**
     * @tc.number replaceString_0500
     * @tc.name   testFocus
     * @tc.desc
     */
    it('replaceString_0500',  Level.LEVEL0, async (done: Function) => {
      console.info('replaceString_0500 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let but = await driver.findComponent(ON.id('but'));
      await CommonFunc.sleep(500);
      await but.click();
      await CommonFunc.sleep(500);
      let but2 = await driver.findComponent(ON.id('setStyle'));
      await CommonFunc.sleep(500);
      await but2.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('text');
      let obj: ESObject = JSON.parse(strJson);
      console.log('replaceString_0500---obj.$attrs.content---' +
        JSON.stringify(obj.$attrs.content));
      expect('' + obj.$attrs.content).assertEqual("401");

      console.info('replaceString_0500 END');
      done();
    });

    /**
     * @tc.number replaceString_0600
     * @tc.name   testFocus
     * @tc.desc
     */
    it('replaceString_0600',  Level.LEVEL0, async (done: Function) => {
      console.info('replaceString_0600 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let but = await driver.findComponent(ON.id('but'));
      await CommonFunc.sleep(500);
      await but.click();
      await CommonFunc.sleep(500);
      let but2 = await driver.findComponent(ON.id('removeStyle'));
      await CommonFunc.sleep(500);
      await but2.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('text');
      let obj: ESObject = JSON.parse(strJson);
      console.log('replaceString_0600---obj.$attrs.content---' +
        JSON.stringify(obj.$attrs.content));
      expect('' + obj.$attrs.content).assertEqual("401");

      console.info('replaceString_0600 END');
      done();
    });

    /**
     * @tc.number replaceString_0700
     * @tc.name   testFocus
     * @tc.desc
     */
    it('replaceString_0700',  Level.LEVEL0, async (done: Function) => {
      console.info('replaceString_0700 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let but = await driver.findComponent(ON.id('but'));
      await CommonFunc.sleep(500);
      await but.click();
      await CommonFunc.sleep(500);
      let but2 = await driver.findComponent(ON.id('removeStyles'));
      await CommonFunc.sleep(500);
      await but2.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('text');
      let obj: ESObject = JSON.parse(strJson);
      console.log('replaceString_0700---obj.$attrs.content---' +
        JSON.stringify(obj.$attrs.content));
      expect('' + obj.$attrs.content).assertEqual("401");

      console.info('replaceString_0700 END');
      done();
    });

    /**
     * @tc.number replaceString_0800
     * @tc.name   testFocus
     * @tc.desc
     */
    it('replaceString_0800',  Level.LEVEL0, async (done: Function) => {
      console.info('replaceString_0800 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let but = await driver.findComponent(ON.id('but'));
      await CommonFunc.sleep(500);
      await but.click();
      await CommonFunc.sleep(500);
      let but2 = await driver.findComponent(ON.id('replaceStyledString'));
      await CommonFunc.sleep(500);
      await but2.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('text');
      let obj: ESObject = JSON.parse(strJson);
      console.log('replaceString_0800---obj.$attrs.content---' +
        JSON.stringify(obj.$attrs.content));
      expect('' + obj.$attrs.content).assertEqual("401");

      console.info('replaceString_0800 END');
      done();
    });

    /**
     * @tc.number replaceString_0900
     * @tc.name   testFocus
     * @tc.desc
     */
    it('replaceString_0900',  Level.LEVEL0, async (done: Function) => {
      console.info('replaceString_0900 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let but = await driver.findComponent(ON.id('but'));
      await CommonFunc.sleep(500);
      await but.click();
      await CommonFunc.sleep(500);
      let but2 = await driver.findComponent(ON.id('insertStyledString'));
      await CommonFunc.sleep(500);
      await but2.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('text');
      let obj: ESObject = JSON.parse(strJson);
      console.log('replaceString_0900---obj.$attrs.content---' +
        JSON.stringify(obj.$attrs.content));
      expect('' + obj.$attrs.content).assertEqual("401");

      console.info('replaceString_0900 END');
      done();
    });

  })
}