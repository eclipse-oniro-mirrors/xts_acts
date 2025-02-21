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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/utils/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function arkuiNodeTest() {
  describe('arkuiNodeTest', function () {
    beforeEach(async function (done) {
      console.info("arkuiNodeTes beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get arkuinode state pages:" + JSON.stringify(pages));
        if (!("arkui_node" == pages.name)) {
          console.info("get arkuinode pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/arkuinode/arkui_node"})
          await CommonFunc.sleep(2000);
          console.info("push arkuinode page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push arkuinode page error:" + err);
      }
      console.info("arkuinode beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("arkuinode after each called");
    });

    /**
     * @tc.number    SUB_ACE_ARKUINODE_0100
     * @tc.name      testarkuinode
     * @tc.desc      set api
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('arkuinode_0100', 0, async function (done) {
      console.info('[arkuinode_0100] START');
      await CommonFunc.sleep(2000);
      let json = getInspectorByKey('nodeButton');
      let Obj1 = JSON.parse(json);
      console.info("arkuinode_0100 json info " + JSON.stringify(json));
      expect(Obj1.$attrs.label).assertEqual('button this is a string');
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      // rebuild
      let btn1 = await driver.findComponent(ON.id('nodeButton'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let json2 = getInspectorByKey('nodeButton');
      let Obj2 = JSON.parse(json2);
      expect(Obj2.$attrs.label).assertEqual('button this is a string');
      console.info('[arkuinode_0100] END');
      done();
    });

  })
}
