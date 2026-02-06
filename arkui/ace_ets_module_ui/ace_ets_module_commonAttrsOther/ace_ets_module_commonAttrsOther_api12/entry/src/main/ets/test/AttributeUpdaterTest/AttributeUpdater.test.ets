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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function AttributeUpdaterTest() {
  describe('AttributeUpdaterTest', () => {
    beforeEach(async (done: Function) => {
      console.info("AttributeUpdaterTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AttributeUpdater/AttributeUpdater",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AttributeUpdaterTest state pages: " + JSON.stringify(pages));
        if (!("AttributeUpdater" == pages.name)) {
          console.info("get AttributeUpdaterTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push AttributeUpdaterTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AttributeUpdaterTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    AttributeUpdaterTest_0010
     * @tc.name      AttributeUpdaterTest_0010
     * @tc.desc      AttributeUpdater: UpdateConstructorParams
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('AttributeUpdaterTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('AttributeUpdaterTest_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('UpdateConstructorParams1'));
      await CommonFunc.sleep(1000);
      await button.longClick();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('UpdateConstructorParams1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[AttributeUpdaterTest_0010] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Updated');
      console.info('[AttributeUpdaterTest_0010] END');
      done();
    });
  })
}

