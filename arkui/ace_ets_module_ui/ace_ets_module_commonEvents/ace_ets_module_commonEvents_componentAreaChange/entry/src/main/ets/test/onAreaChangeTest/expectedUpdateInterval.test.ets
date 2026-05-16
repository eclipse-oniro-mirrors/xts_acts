/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function expectedUpdateInterval() {
  describe('expectedUpdateInterval', () => {
    beforeEach(async (done: Function) => {
      console.info("expectedUpdateInterval beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/onAreaChange/expectedUpdateInterval',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get expectedUpdateInterval state pages:" + JSON.stringify(pages));
        if (!("onAttach" == pages.name)) {
          console.info("get expectedUpdateInterval pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push expectedUpdateInterval page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push expectedUpdateInterval page error:" + err);
      }
      console.info("expectedUpdateInterval beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("expectedUpdateInterval after each called");
    });

    /**
     * @tc.name   SUB_ACE_ARKUI_ONAREACHANGE_0100
     * @tc.number SUB_ACE_ARKUI_ONAREACHANGE_0100
     * @tc.desc   set expectedUpdateInterval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_ARKUI_ONAREACHANGE_0100', Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_ARKUI_ONAREACHANGE_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let IntervalText = await driver.findComponent(ON.id('IntervalText'));
      await IntervalText.click();
      await CommonFunc.sleep(100);
      await IntervalText.click();
      await CommonFunc.sleep(9000);
      let strJson = getInspectorByKey('IntervalText2');
      let obj: ESObject = JSON.parse(strJson);
      console.info('SUB_ACE_ARKUI_ONAREACHANGE_0100 text content is :' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('2');
      console.info('SUB_ACE_ARKUI_ONAREACHANGE_0100 END');
      done();
    });
  })
}
