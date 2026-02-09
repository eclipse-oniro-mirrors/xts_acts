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


export default function StorageLinkJsunit2() {
  describe('StorageLinkJsunit2', () => {
    beforeEach(async (done: Function) => {
      console.info("StorageLinkJsunit2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/StorageLink2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StorageLinkJsunit2 state pages: " + JSON.stringify(pages));
        if (!("StorageProp" == pages.name)) {
          console.info("get StorageLinkJsunit2 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StorageLinkJsunit2 page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StorageLinkJsunit2 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   StorageLinkJsunit2_0100
     * @tc.number StorageLinkJsunit2_0100
     * @tc.desc   StorageLinkJsunit2_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageLinkJsunit2_0100', Level.LEVEL0, async (done: Function) => {
      // Get the init value of son1 and son2
      console.info('[StorageLinkJsunit2_0100] START');
      let driver = await UiDriver.create()
      let button_son111 = await driver.findComponent(BY.key('button_son111'));
      await button_son111.click();
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('button_son111');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[StorageLinkJsunit2_0100] son1 obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.label).assertEqual('has1: true');
      console.info('[StorageLinkJsunit2_0100] END');
      done();
    });

    /**
     * @tc.name   StorageLinkJsunit2_0200
     * @tc.number StorageLinkJsunit2_0200
     * @tc.desc   StorageLinkJsunit2_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageLinkJsunit2_0200', Level.LEVEL0, async (done: Function) => {
      // Get the init value of son1 and son2
      console.info('[StorageLinkJsunit2_0200] START');
      let driver = await UiDriver.create()
      let button_son2 = await driver.findComponent(BY.key('button_son2'));
      await button_son2.click();
      await CommonFunc.sleep(1000);

      let strJson2 = getInspectorByKey('button_son2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[StorageLinkJsunit2_0200] son2 obj2 is: " + JSON.stringify(obj2));
      await CommonFunc.sleep(1000);
      expect(obj2.$attrs.label).assertEqual('has2: false');
      console.info('[StorageLinkJsunit2_0200] END');
      done();
    });

    /**
     * @tc.name   StorageLinkJsunit2_0300
     * @tc.number StorageLinkJsunit2_0300
     * @tc.desc   StorageLinkJsunit2_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageLinkJsunit2_0300', Level.LEVEL0, async (done: Function) => {
      // Get the init value of son1 and son2
      console.info('[StorageLinkJsunit2_0300] START');
      let driver = await UiDriver.create()
      let button_son3 = await driver.findComponent(BY.key('button_son3'));
      await button_son3.click();
      await CommonFunc.sleep(1000);

      let Storage12ContentJson = getInspectorByKey('text');
      let text: ESObject = JSON.parse(Storage12ContentJson);
      console.info("[StorageLinkJsunit2_0300] son3 text is: " + JSON.stringify(text));
      await CommonFunc.sleep(1000);
      expect(text.$attrs.content).assertEqual('has3: true');
      console.info('[StorageLinkJsunit2_0300] END');
      done();
    });

    /**
     * @tc.name   StorageLinkJsunit2_0400
     * @tc.number StorageLinkJsunit2_0400
     * @tc.desc   StorageLinkJsunit2_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageLinkJsunit2_0400', Level.LEVEL0, async (done: Function) => {
      // Get the init value of son1 and son2
      console.info('[StorageLinkJsunit2_0400] START');
      let driver = await UiDriver.create()
      let button_son4 = await driver.findComponent(BY.key('button_son4'));
      await button_son4.click();
      await CommonFunc.sleep(1000);

      let strJson4 = getInspectorByKey('button_son4');
      let obj4: ESObject = JSON.parse(strJson4);
      console.info("[StorageLinkJsunit2_0400] son4 obj4 is: " + JSON.stringify(obj4));
      await CommonFunc.sleep(1000);
      expect(obj4.$attrs.label).assertEqual('has4: true');
      console.info('[StorageLinkJsunit2_0400] END');
      done();
    });

    /**
     * @tc.name   StorageLinkJsunit2_0500
     * @tc.number StorageLinkJsunit2_0500
     * @tc.desc   StorageLinkJsunit2_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageLinkJsunit2_0500', Level.LEVEL0, async (done: Function) => {
      // Click to change the value of Storage
      console.info('[StorageLinkJsunit2_0500] START');
      let driver = await UiDriver.create()
      let button_son5 = await driver.findComponent(BY.key('button_son5'));
      await button_son5.click();
      await CommonFunc.sleep(2000);

      let strJson5 = getInspectorByKey('button_son5');
      let obj5: ESObject = JSON.parse(strJson5);
      console.info("[StorageLinkJsunit2_0500] son5 obj5 is: " + JSON.stringify(obj5));
      await CommonFunc.sleep(2000);
      expect(obj5.$attrs.label).assertEqual('son1: 48');
      console.info('[StorageLinkJsunit2_0500] END');
      done();
    });

    /**
     * @tc.name   StorageLinkJsunit2_0600
     * @tc.number StorageLinkJsunit2_0600
     * @tc.desc   StorageLinkJsunit2_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageLinkJsunit2_0600', Level.LEVEL0, async (done: Function) => {
      // Click to change the value of Storage
      console.info('[StorageLinkJsunit2_0600] START');
      let driver = await UiDriver.create()
      let button_son6 = await driver.findComponent(BY.key('button_son6'));
      await button_son6.click();
      await CommonFunc.sleep(2000);

      let strJson6 = getInspectorByKey('button_son6');
      let obj6: ESObject = JSON.parse(strJson6);
      console.info("[StorageLinkJsunit2_0600] son6 obj6 is: " + JSON.stringify(obj6));
      await CommonFunc.sleep(1000);
      expect(obj6.$attrs.label).assertEqual('son2: 49');
      console.info('[StorageLinkJsunit2_0600] END');
      done();
    });
  })
}
