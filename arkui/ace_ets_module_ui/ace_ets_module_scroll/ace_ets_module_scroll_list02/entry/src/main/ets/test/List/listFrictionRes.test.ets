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
import CommonFunc from '../../MainAbility/common/Common';

export default function listFrictionRes() {
  describe('listFrictionRes', () => {
    beforeEach(async (done: Function) => {
      console.info("listFrictionRes beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/listFrictionRes",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get listFrictionRes state pages:" + JSON.stringify(pages));
        if (!("listFrictionRes" == pages.name)) {
          console.info("get listFrictionRes pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push listFrictionRes page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listFrictionRes page error:" + err);
      }
      console.info("listFrictionRes beforeEach end");
      done();
    });

    /**
     * @tc.name   listFrictionRes_0100
     * @tc.number listFrictionRes_0100
     * @tc.desc   Set the friction coefficient to Resource type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('listFrictionRes_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[listFrictionRes_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('list_friction_res');
      console.info("[listFrictionRes_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[listFrictionRes_0100] type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[listFrictionRes_0100] friction: " + JSON.stringify(JSON.parse(strJson).$attrs.friction));
      expect(JSON.parse(strJson).$type).assertEqual("List");
      let friRes: number = JSON.parse(strJson).$attrs.friction
      expect(Math.floor(Math.abs(friRes - 0.6)) <= 1).assertTrue();
      console.info('[listFrictionRes_0100] END');
      done();
    });
  })
}
