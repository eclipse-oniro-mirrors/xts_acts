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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/common/Common';
export default function getColorTest() {
  describe('getColorTest', () => {
    beforeEach(async (done: Function) => {
      console.info("getColorTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RenderNode/renderNode001/getColor',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getColorTest state pages: " + JSON.stringify(pages));
        if (!("getColor" == pages.name)) {
          console.info("get getColorTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push getColorTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getColorTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    getColor
     * @tc.name      getColorTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('getColorTest_0100', 0, async (done: Function) => {
      console.info('getColorTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('get_color'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('render_color');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('color:0');
      console.info('[getColorTest_0100] END');
      done();
    });
    /**
     * @tc.number    getColor
     * @tc.name      getColorTest_0200
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('getColorTest_0200', 0, async (done: Function) => {
      console.info('getColorTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('getSet_color'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('render_color');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorTest_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('color:4278255360');
      console.info('[getColorTest_0200] END');
      done();
    });
  })
}

