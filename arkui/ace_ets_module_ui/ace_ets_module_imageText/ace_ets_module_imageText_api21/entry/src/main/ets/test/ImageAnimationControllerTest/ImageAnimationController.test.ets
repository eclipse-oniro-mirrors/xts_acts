/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium'
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function ImageAnimationControllerTest() {
  describe('ImageAnimationControllerTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ImageAnimationControllerTest beforeEach start');
      const options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageAnimationController/ImageAnimationController',
      }
      try {
        router.clear();
        const pages = router.getState();
        console.info('get ImageAnimationControllerTest state success ' + JSON.stringify(pages));
        if (!pages.name.includes('ImageAnimationController')) {
          const result = await router.replaceUrl(options);
          console.info('push ImageAnimationControllerTest page success ' + JSON.stringify(result));
        }
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.error('push ImageAnimationControllerTest page error:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ImageAnimationControllerTest afterEach called');
    });

    /**
     * @tc.name   ImageAnimationControllerTest001
     * @tc.number ImageAnimationControllerTest001
     * @tc.desc   test the getAnimationController()?.start()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimationControllerTest001', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimationControllerTest001] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let button1 = await driver.findComponent(ON.id('c1start'));
      await CommonFunc.sleep(500);
      await button1.click();
      await CommonFunc.sleep(500);

      let button2 = await driver.findComponent(ON.id('c1status'));
      await CommonFunc.sleep(500);
      await button2.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('statusText');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageAnimationControllerTest001] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Running');
      console.info('[ImageAnimationControllerTest001] END');
      done();
    });

    /**
     * @tc.name   ImageAnimationControllerTest002
     * @tc.number ImageAnimationControllerTest002
     * @tc.desc   test the getAnimationController()?.stop()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimationControllerTest002', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimationControllerTest002] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let button1 = await driver.findComponent(ON.id('c1stop'));
      await CommonFunc.sleep(500);
      await button1.click();
      await CommonFunc.sleep(500);

      let button2 = await driver.findComponent(ON.id('c1status'));
      await CommonFunc.sleep(500);
      await button2.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('statusText');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageAnimationControllerTest002] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Stopped');
      console.info('[ImageAnimationControllerTest002] END');
      done();
    });

    /**
     * @tc.name   ImageAnimationControllerTest003
     * @tc.number ImageAnimationControllerTest003
     * @tc.desc   test the getAnimationController()?.pause()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimationControllerTest003', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimationControllerTest003] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let button1 = await driver.findComponent(ON.id('c1pause'));
      await CommonFunc.sleep(500);
      await button1.click();
      await CommonFunc.sleep(500);

      let button2 = await driver.findComponent(ON.id('c1status'));
      await CommonFunc.sleep(500);
      await button2.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('statusText');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageAnimationControllerTest003] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Paused');
      console.info('[ImageAnimationControllerTest003] END');
      done();
    });

    /**
     * @tc.name   ImageAnimationControllerTest004
     * @tc.number ImageAnimationControllerTest004
     * @tc.desc   test the getAnimationController()?.resume()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimationControllerTest004', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimationControllerTest004] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let button1 = await driver.findComponent(ON.id('c1resume'));
      await CommonFunc.sleep(500);
      await button1.click();
      await CommonFunc.sleep(500);

      let button2 = await driver.findComponent(ON.id('c1status'));
      await CommonFunc.sleep(500);
      await button2.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('statusText');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageAnimationControllerTest004] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Running');
      console.info('[ImageAnimationControllerTest004] END');
      done();
    });

    /**
     * @tc.name   ImageAnimationControllerTest005
     * @tc.number ImageAnimationControllerTest005
     * @tc.desc   test the getAnimationController()?.start()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimationControllerTest005', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimationControllerTest005] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let button1 = await driver.findComponent(ON.id('c2start'));
      await CommonFunc.sleep(500);
      await button1.click();
      await CommonFunc.sleep(500);

      let button2 = await driver.findComponent(ON.id('c2status'));
      await CommonFunc.sleep(500);
      await button2.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('statusText');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageAnimationControllerTest005] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Running');
      console.info('[ImageAnimationControllerTest005] END');
      done();
    });

    /**
     * @tc.name   ImageAnimationControllerTest006
     * @tc.number ImageAnimationControllerTest006
     * @tc.desc   test the getAnimationController()?.stop()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimationControllerTest006', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimationControllerTest006] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let button1 = await driver.findComponent(ON.id('c2stop'));
      await CommonFunc.sleep(500);
      await button1.click();
      await CommonFunc.sleep(500);

      let button2 = await driver.findComponent(ON.id('c2status'));
      await CommonFunc.sleep(500);
      await button2.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('statusText');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageAnimationControllerTest006] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Stopped');
      console.info('[ImageAnimationControllerTest006] END');
      done();
    });

    /**
     * @tc.name   ImageAnimationControllerTest007
     * @tc.number ImageAnimationControllerTest007
     * @tc.desc   test the getAnimationController()?.pause()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimationControllerTest007', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimationControllerTest007] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let button1 = await driver.findComponent(ON.id('c2pause'));
      await CommonFunc.sleep(500);
      await button1.click();
      await CommonFunc.sleep(500);

      let button2 = await driver.findComponent(ON.id('c2status'));
      await CommonFunc.sleep(500);
      await button2.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('statusText');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageAnimationControllerTest007] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Paused');
      console.info('[ImageAnimationControllerTest007] END');
      done();
    });

    /**
     * @tc.name   ImageAnimationControllerTest008
     * @tc.number ImageAnimationControllerTest008
     * @tc.desc   test the getAnimationController()?.resume()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimationControllerTest008', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimationControllerTest008] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let button1 = await driver.findComponent(ON.id('c2resume'));
      await CommonFunc.sleep(500);
      await button1.click();
      await CommonFunc.sleep(500);

      let button2 = await driver.findComponent(ON.id('c2status'));
      await CommonFunc.sleep(500);
      await button2.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('statusText');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageAnimationControllerTest008] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Running');
      console.info('[ImageAnimationControllerTest008] END');
      done();
    });

    /**
     * @tc.name   ImageAnimationControllerTest009
     * @tc.number ImageAnimationControllerTest009
     * @tc.desc   test the getAnimationController()?.start()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimationControllerTest009', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimationControllerTest009] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let button1 = await driver.findComponent(ON.id('c3start'));
      await CommonFunc.sleep(500);
      await button1.click();
      await CommonFunc.sleep(500);

      let button2 = await driver.findComponent(ON.id('c3status'));
      await CommonFunc.sleep(500);
      await button2.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('statusText');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageAnimationControllerTest009] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('undefined');
      console.info('[ImageAnimationControllerTest009] END');
      done();
    });

    /**
     * @tc.name   ImageAnimationControllerTest010
     * @tc.number ImageAnimationControllerTest010
     * @tc.desc   test the getAnimationController()?.stop()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimationControllerTest010', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimationControllerTest010] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let button1 = await driver.findComponent(ON.id('c3stop'));
      await CommonFunc.sleep(500);
      await button1.click();
      await CommonFunc.sleep(500);

      let button2 = await driver.findComponent(ON.id('c3status'));
      await CommonFunc.sleep(500);
      await button2.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('statusText');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageAnimationControllerTest010] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('undefined');
      console.info('[ImageAnimationControllerTest010] END');
      done();
    });

    /**
     * @tc.name   ImageAnimationControllerTest011
     * @tc.number ImageAnimationControllerTest011
     * @tc.desc   test the getAnimationController()?.pause()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimationControllerTest011', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimationControllerTest011] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let button1 = await driver.findComponent(ON.id('c3pause'));
      await CommonFunc.sleep(500);
      await button1.click();
      await CommonFunc.sleep(500);

      let button2 = await driver.findComponent(ON.id('c3status'));
      await CommonFunc.sleep(500);
      await button2.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('statusText');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageAnimationControllerTest011] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('undefined');
      console.info('[ImageAnimationControllerTest011] END');
      done();
    });

    /**
     * @tc.name   ImageAnimationControllerTest012
     * @tc.number ImageAnimationControllerTest012
     * @tc.desc   test the getAnimationController()?.resume()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimationControllerTest012', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimationControllerTest012] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let button1 = await driver.findComponent(ON.id('c3resume'));
      await CommonFunc.sleep(500);
      await button1.click();
      await CommonFunc.sleep(500);

      let button2 = await driver.findComponent(ON.id('c3status'));
      await CommonFunc.sleep(500);
      await button2.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('statusText');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageAnimationControllerTest012] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('undefined');
      console.info('[ImageAnimationControllerTest012] END');
      done();
    });
  })
}