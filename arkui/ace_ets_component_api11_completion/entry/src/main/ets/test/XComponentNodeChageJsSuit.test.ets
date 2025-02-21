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
import CommonFunc from '../MainAbility/utils/Common';
import events_emitter from '@ohos.events.emitter'

export default function XComponentNodeChageJsSuit() {
  describe('XComponentNodeChageJsSuit', () => {
    beforeEach(async (done: Function) => {
      console.info("XComponentNodeChageJsSuit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/XComponentNodeChage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get XComponentNodeChageJsSuit state pages: " + JSON.stringify(pages));
        if (!("XComponentNodeChage" == pages.name)) {
          console.info("get XComponentNodeChageJsSuit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push XComponentNodeChageJsSuit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push XComponentNodeChageJsSuit page error:" + err);
      }
      done()
    });

    /**
     * @tc.number: SUB_ACE_COMPONENT_XComponentNodeChageJsSuit_0100
     * @tc.name : XComponentNodeChageJsSuit_0100
     * @tc.desc  : api
     * @tc.level : Level 2
     * @tc.type :
     * @tc.size :
     */

    it('XComponentNodeChageJsSuit_0100', 0, async (done: Function) => {
      console.info('[XComponentNodeChageJsSuit_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('xComponentNode_change'));
      await button_Bottom.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('xComponent_RenderType');
      console.info("[XComponentNodeChageJsSuit_0100] obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[XComponentNodeChageJsSuit_0100] obj content is: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content == 'init').assertTrue();
      console.info('[XComponentNodeChageJsSuit_0100] END');
      done();
    });
  })
}