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
import router from '@system.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


interface optionsObj {
  uri: string
}

export default function DataOperationTypeTest() {
  describe('DataOperationTypeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("DataOperationTypeTest beforeEach start");
      let options: optionsObj = {
        uri: 'MainAbility/pages/LazyForEach/LazyForEachDataOperationType',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DataOperationTypeTest state pages: " + JSON.stringify(pages));
        if (!("LazyForEachDataOperationType" == pages.name)) {
          console.info("get DataOperationTypeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push DataOperationTypeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DataOperationTypeTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   DataOperationTypeTest_0100
     * @tc.number DataOperationTypeTest_0100
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DataOperationTypeTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('DataOperationTypeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('DataOperationType_2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('DataOperationType_1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[DataOperationTypeTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Length:4');
      console.info('[DataOperationTypeTest_0100] END');
      done();
    });
    /**
     * @tc.name   DataOperationTypeTest_0200
     * @tc.number DataOperationTypeTest_0200
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DataOperationTypeTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('DataOperationTypeTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('DataOperationType_3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('DataOperationType_1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[DataOperationTypeTest_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Length:3');
      console.info('[DataOperationTypeTest_0200] END');
      done();
    });
    /**
     * @tc.name   DataOperationTypeTest_0300
     * @tc.number DataOperationTypeTest_0300
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DataOperationTypeTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('DataOperationTypeTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('DataOperationType_4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('DataOperationType_0');
      let obj: ESObject = JSON.parse(strJson);
      await CommonFunc.sleep(1000);
      console.info("[DataOperationTypeTest_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Text:Hello 2');
      console.info('[DataOperationTypeTest_0300] END');
      done();
    });
  })
}

