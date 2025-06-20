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
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';

export default function repeatNoTemplateIdJsunit() {
  describe('repeatNoTemplateIdJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("repeatNoTemplateIdJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Repeat/repeatNoTemplateId',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get repeatNoTemplateIdJsunit state pages: " + JSON.stringify(pages));
        if (!("repeatNoTemplateId" == pages.name)) {
          console.info("get repeatNoTemplateIdJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push repeatNoTemplateIdJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push repeatNoTemplateIdJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("repeatCountJsunit after each called");
    });

    /* *
    * @tc.number: repeatNoTemplateIdJsunit_0100
    * @tc.name  : repeatNoTemplateIdJsunit_0100
    * @tc.desc  : The Repeat component template test.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('repeatNoTemplateIdJsunit_0100', Level.LEVEL0, async (done: Function) => {
      console.info('RepeatEachJsunit_0100 START');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('textNo3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[repeatNoTemplateIdJsunit_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual("3:3eachMessage123");
      console.info('[repeatNoTemplateIdJsunit_0100] END');

      let strJson1 = getInspectorByKey('textNo4');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[repeatNoTemplateIdJsunit_0100] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual("4:4eachMessage123");
      console.info('[repeatNoTemplateIdJsunit_0100] END');

      let strJson2 = getInspectorByKey('textNo5');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[repeatNoTemplateIdJsunit_0100] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual("5:5eachMessage123");
      console.info('[repeatNoTemplateIdJsunit_0100] END');
      done();
    });
  })
}

