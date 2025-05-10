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
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';

export default function getLineMetrics() {
  describe('getLineMetrics', () => {
    beforeEach(async (done: Function) => {
      console.info("getLineMetrics beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/getLineMetrics',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getLineMetrics state pages: " + JSON.stringify(pages));
        if (!("getLineMetrics" == pages.name)) {
          console.info("get getLineMetrics state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push getLineMetrics success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getLineMetrics page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info(" getLineMetrics after each called");
    });

    /* *
    * @tc.number: SUB_ACE_Text_common_0100
    * @tc.name  : getLineMetrics_0100
    * @tc.desc  : Get the glyph position at coordinate and get LineMetrics..
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('getLineMetrics_0100', 0, async (done: Function) => {
      console.info('getLineMetrics_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('lineMetrics_get'));
      await btn1.click()
      console.info("[getLineMetrics_0100] btn1");
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('lineMetrics_mess');
      let obj: ESObject = JSON.parse(strJson);
      await CommonFunc.sleep(1000);
      console.info("[getLineMetrics_0100] obj is: " + JSON.stringify(obj));
      console.info("[getLineMetrics_0200] startIndex: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('startIndex: 0');

      console.info('getLineMetrics_0100 END');
      done();
    });


  })
}