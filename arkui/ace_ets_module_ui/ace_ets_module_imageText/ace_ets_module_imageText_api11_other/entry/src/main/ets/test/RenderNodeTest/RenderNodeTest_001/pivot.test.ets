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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/common/Common';
export default function pivot() {
  describe('pivot', () => {
    beforeEach(async (done: Function) => {
      console.info("pivot beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RenderNode/renderNode001/pivot',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get pivot state pages: " + JSON.stringify(pages));
        if (!("pivot" == pages.name)) {
          console.info("get pivot state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push pivot success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push pivot page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_ACE_pivot_0100
     * @tc.name      pivot_0100
     * @tc.desc      getPivot api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('pivot_0100', 0, async (done: Function) => {
      console.info('pivot_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('getPivot_id'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text_getPivot');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[pivot_0100] component obj is: " + JSON.stringify(obj));
      console.info("[pivot_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('0.5');
      console.info('[pivot_0100] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_pivot_0200
     * @tc.name      pivot_0200
     * @tc.desc      setPivot api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('pivot_0200', 0, async (done: Function) => {
      console.info('pivot_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('setPivot_id'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text_setPivot');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[pivot_0200] component obj is: " + JSON.stringify(obj));
      console.info("[pivot_0200] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('0.5');
      console.info('[pivot_0200] END');
      done();
    });
  })
}

