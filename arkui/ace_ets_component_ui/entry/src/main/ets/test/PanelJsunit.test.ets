/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';
import {MessageManager,Callback} from '../MainAbility/utils/MessageManager';

export default function PanelJsunit() {
  describe('PanelJsunit', function () {
    beforeEach(async function (done) {
      console.info("Panel beforeEach start");
      let options = {
        uri: 'MainAbility/pages/Panel',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Panel state pages: " + JSON.stringify(pages));
        if (!("Panel" == pages.name)) {
          console.info("get Panel state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Panel page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Panel page error:" + err);
      }
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("Panel after each called");
    });

    it('PanelJsunit_0100', 0, async function (done) {
      console.info('[PanelJsunit_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PanelText');
      let obj = JSON.parse(strJson);
      console.info("[PanelJsunit_0100] obj is: " + JSON.stringify(obj.$attrs.customHeight));
      expect(obj.$attrs.customHeight).assertEqual("0.00px");
      console.info('[PanelJsunit_0100] END');
      done();
    });

  })
}
