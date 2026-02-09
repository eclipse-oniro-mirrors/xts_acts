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
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';
export default function ListMainChildrenTest() {
  describe('ListMainChildrenTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ListMainChildrenTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/ListMainChildren',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ListMainChildrenTest state pages: " + JSON.stringify(pages));
        if (!("ListMainChildren" == pages.name)) {
          console.info("get ListMainChildrenTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ListMainChildrenTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ListMainChildrenTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   ListMainChildrenTest_0100
     * @tc.number ListMainChildren
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ListMainChildrenTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ListMainChildrenTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('ListMainChildren_1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ListMainChildren_1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ListMainChildrenTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('ListChild:20');
      console.info('[ListMainChildrenTest_0100] END');
      done();
    });
    /**
     * @tc.name   ListMainChildrenTest_0200
     * @tc.number ListMainChildren
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ListMainChildrenTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('ListMainChildrenTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('ListMainChildren_2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ListMainChildren_2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ListMainChildrenTest_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('ListItemGroupChild:10');
      console.info('[ListMainChildrenTest_0100] END');
      done();
    });
  })
}

