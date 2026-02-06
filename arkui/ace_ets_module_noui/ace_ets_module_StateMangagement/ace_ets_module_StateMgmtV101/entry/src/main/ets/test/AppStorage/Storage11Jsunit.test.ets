/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function Storage11Jsunit() {
  describe('Storage11Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("Storage11Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AppStorage/Storage11',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Storage11Jsunit state pages: " + JSON.stringify(pages));
        if (!("Storage11" == pages.name)) {
          console.info("get Storage11Jsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Storage11Jsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Storage11Jsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    //link给定的键值key存在，返回对应该键值的属性的双向绑定的数据 47
    /**
     * @tc.name   Storage11Jsunit_0100
     * @tc.number Storage11Jsunit_0100
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Storage11Jsunit_0100', Level.LEVEL0, async (done: Function) => {

      console.info('[Storage11Jsunit_0100] START');
      let driver = await UiDriver.create()
      let Storage11Button1 = await driver.findComponent(BY.key('Storage11Button1'));
      await Storage11Button1.click();
      await CommonFunc.sleep(1000);
      let Storage11ContentJson = getInspectorByKey('Storage11Content');
      let text: ESObject = JSON.parse(Storage11ContentJson);
      console.info("[Storage11Jsunit_0100] Storage11Content is: " + JSON.stringify(text));
      expect(text.$attrs.content).assertEqual('47');
      console.info('[Storage11Jsunit_0100] END');
      done();
    });
    //link给定的键值key不存在，返回undefined
    /**
     * @tc.name   Storage11Jsunit_0200
     * @tc.number Storage11Jsunit_0200
     * @tc.desc   Storage11Jsunit_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Storage11Jsunit_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[Storage11Jsunit_0200] START');
      let driver = await UiDriver.create()
      let Storage11Button2 = await driver.findComponent(BY.key('Storage11Button2'));
      await Storage11Button2.click();
      await CommonFunc.sleep(1000);
      let Storage11ContentJson = getInspectorByKey('Storage11Content');
      let text: ESObject = JSON.parse(Storage11ContentJson);
      console.info("[Storage11Jsunit_0200] Storage11Content is: " + JSON.stringify(text));
      expect(text.$attrs.content).assertEqual('undefined');
      console.info('[Storage11Jsunit_0200] END');
      done();
    });
    //setAndLink给定的键值key存在，返回对应该键值的属性的双向绑定的数据 47
    /**
     * @tc.name   Storage11Jsunit_0300
     * @tc.number Storage11Jsunit_0300
     * @tc.desc   Storage11Jsunit_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Storage11Jsunit_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[Storage11Jsunit_0300] START');
      let driver = await UiDriver.create()
      let Storage11Button3 = await driver.findComponent(BY.key('Storage11Button3'));
      await Storage11Button3.click();
      await CommonFunc.sleep(1000);
      let Storage11ContentJson = getInspectorByKey('Storage11Content');
      let text: ESObject = JSON.parse(Storage11ContentJson);
      console.info("[Storage11Jsunit_0300] Storage11Content is: " + JSON.stringify(text));
      expect(text.$attrs.content).assertEqual('47');
      console.info('[Storage11Jsunit_0300] END');
      done();
    });
    //setAndLink给定的键值key不存在，初始化新的数据 5
    /**
     * @tc.name   Storage11Jsunit_0400
     * @tc.number Storage11Jsunit_0400
     * @tc.desc   Storage11Jsunit_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Storage11Jsunit_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[Storage11Jsunit_0400] START');
      let driver = await UiDriver.create()
      let Storage11Button4 = await driver.findComponent(BY.key('Storage11Button4'));
      await Storage11Button4.click();
      await CommonFunc.sleep(1000);
      let Storage11ContentJson = getInspectorByKey('Storage11Content');
      let text: ESObject = JSON.parse(Storage11ContentJson);
      console.info("[Storage11Jsunit_0400] Storage11Content is: " + JSON.stringify(text));
      expect(text.$attrs.content).assertEqual('5');
      console.info('[Storage11Jsunit_0400] END');
      done();
    });
    //prop给定的键值key存在，返回对应该键值的属性的双向绑定的数据 47
    /**
     * @tc.name   Storage11Jsunit_0500
     * @tc.number Storage11Jsunit_0500
     * @tc.desc   Storage11Jsunit_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Storage11Jsunit_0500', Level.LEVEL0, async (done: Function) => {
      console.info('[Storage11Jsunit_0500] START');
      let driver = await UiDriver.create()
      let Storage11Button5 = await driver.findComponent(BY.key('Storage11Button5'));
      await Storage11Button5.click();
      await CommonFunc.sleep(1000);
      let Storage11ContentJson = getInspectorByKey('Storage11Content');
      let text: ESObject = JSON.parse(Storage11ContentJson);
      console.info("[Storage11Jsunit_0500] Storage11Content is: " + JSON.stringify(text));
      expect(text.$attrs.content).assertEqual('47');
      console.info('[Storage11Jsunit_0500] END');
      done();
    });
    //prop给定的键值key存在，返回undefined
    /**
     * @tc.name   Storage11Jsunit_0600
     * @tc.number Storage11Jsunit_0600
     * @tc.desc   Storage11Jsunit_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Storage11Jsunit_0600', Level.LEVEL0, async (done: Function) => {
      console.info('[Storage11Jsunit_0600] START');
      let driver = await UiDriver.create()
      let Storage11Button6 = await driver.findComponent(BY.key('Storage11Button6'));
      await Storage11Button6.click();
      await CommonFunc.sleep(1000);
      let Storage11ContentJson = getInspectorByKey('Storage11Content');
      let text: ESObject = JSON.parse(Storage11ContentJson);
      console.info("[Storage11Jsunit_0600] Storage11Content is: " + JSON.stringify(text));
      expect(text.$attrs.content).assertEqual('undefined');
      console.info('[Storage11Jsunit_0600] END');
      done();
    });
    //setAndProp给定的键值key存在，返回对应该键值的属性的双向绑定的数据 47
    /**
     * @tc.name   Storage11Jsunit_0700
     * @tc.number Storage11Jsunit_0700
     * @tc.desc   Storage11Jsunit_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Storage11Jsunit_0700', Level.LEVEL0, async (done: Function) => {
      console.info('[Storage11Jsunit_0700] START');
      let driver = await UiDriver.create()
      let Storage11Button7 = await driver.findComponent(BY.key('Storage11Button7'));
      await Storage11Button7.click();
      await CommonFunc.sleep(1000);
      let Storage11ContentJson = getInspectorByKey('Storage11Content');
      let text: ESObject = JSON.parse(Storage11ContentJson);
      console.info("[Storage11Jsunit_0700] Storage11Content is: " + JSON.stringify(text));
      expect(text.$attrs.content).assertEqual('47');
      console.info('[Storage11Jsunit_0700] END');
      done();
    });
    //setAndProp给定的键值key存在，返回对应该键值的属性的双向绑定的数据 5
    /**
     * @tc.name   Storage11Jsunit_0800
     * @tc.number Storage11Jsunit_0800
     * @tc.desc   Storage11Jsunit_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Storage11Jsunit_0800', Level.LEVEL0, async (done: Function) => {
      console.info('[Storage11Jsunit_0800] START');
      let driver = await UiDriver.create()
      let Storage11Button8 = await driver.findComponent(BY.key('Storage11Button8'));
      await Storage11Button8.click();
      await CommonFunc.sleep(1000);
      let Storage11ContentJson = getInspectorByKey('Storage11Content');
      let text: ESObject = JSON.parse(Storage11ContentJson);
      console.info("[Storage11Jsunit_0800] Storage11Content is: " + JSON.stringify(text));
      expect(text.$attrs.content).assertEqual('5');
      console.info('[Storage11Jsunit_0800] END');
      done();
    });
  })
}
