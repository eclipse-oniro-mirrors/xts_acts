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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
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
import CommonFunc from '../../MainAbility/utils/Common';
import events_emitter from '@ohos.events.emitter'
export default function geometryTransition() {
  describe('geometryTransition', () => {
    beforeEach(async (done:Function) =>{
      console.info("geometryTransition beforeEach start");
      let options:router.RouterOptions= {
        url: 'MainAbility/pages/geometryTransition/geometryTransition',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get geometryTransition state pages: " + JSON.stringify(pages));
        if (!("geometryTransition" == pages.name)) {
          console.info("get geometryTransition state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push geometryTransition success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push geometryTransition page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_GEOMETRYTRANSITION_FOLLOW_0010
    * @tc.name  : geometryTransition_0100
    * @tc.desc  : whether follow target for the component still in the hierarchy.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('geometryTransition_0100', Level.LEVEL0, async (done:Function) => {
      console.info('geometryTransition_0100 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('geometry_follow_1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('geometry_follow_2');
      console.info("[geometryTransition_0100] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[geometryTransition_0100] geometryTransition: " + JSON.stringify(JSON.parse(strJson).$attrs.geometryTransition));
      expect(JSON.parse(strJson).$attrs.autoResize == "false").assertTrue();
      expect(JSON.parse(strJson).$attrs.clip == "true").assertTrue();
      console.info('[geometryTransition_0100] END');
      done();
    })
  })
}