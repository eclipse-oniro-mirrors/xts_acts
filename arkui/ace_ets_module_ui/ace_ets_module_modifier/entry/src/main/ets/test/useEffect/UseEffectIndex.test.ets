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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import Utils from '../Utils';


export default function UseEffectIndexTest() {
  describe('UseEffectIndexTest', () => {
    beforeEach(async (done: Function) => {
      console.info("UseEffectIndexTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/useEffect/useEffectIndex",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get UseEffectIndexTest state pages: " + JSON.stringify(pages));
        if (!("UseEffectIndexTest" == pages.name)) {
          console.info("get UseEffectIndexTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push UseEffectIndexTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UseEffectIndexTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   UseEffectIndex_0100
     * @tc.number UseEffectIndex_0100
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UseEffectIndex_0100', Level.LEVEL2, async (done: Function) => {

      console.info('[UseEffectIndex] START');
      let strJson1 = getInspectorByKey('windowEffect');
      let strJson2 = getInspectorByKey('windowDefault');
      console.info("[UseEffectIndex] JSON.parse(strJson1) is : " + JSON.stringify(JSON.parse(strJson1).$attrs));
      console.info("[UseEffectIndex] JSON.parse(strJson2) is : " + JSON.stringify(JSON.parse(strJson2).$attrs));

      expect(JSON.parse(strJson1).$attrs.useEffectType).assertEqual('EffectType.WINDOW_EFFECT');
      expect(JSON.parse(strJson2).$attrs.useEffectType).assertEqual('EffectType.DEFAULT');
      console.info('[UseEffectIndex] END');
      done();
    });
  })
}

