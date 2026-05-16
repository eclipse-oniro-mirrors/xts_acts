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
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, MouseButton, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import text from "@ohos.graphics.text"

export default function styledStringAddApi() {
  describe('styledStringAddApi', () => {
    beforeEach(async (done: Function) => {
      console.info("styledStringAddApi beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get styledStringAddApi state pages:" + JSON.stringify(pages));
        if (!("styledStringAddApi" == pages.name)) {
          console.info("get  Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Text/styledStringAddApi"})
          await CommonFunc.sleep(2000);
          console.info("push styledStringAddApi page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push styledStringAddApi page error:" + err);
      }
      console.info("styledStringAddApi foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("styledStringAddApi after each called");
    });


    /**
     * @tc.name   styledStringAddApi_001
     * @tc.number styledStringAddApi_001
     * @tc.desc   styledStringAddApi_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('styledStringAddApi_001',  Level.LEVEL0, async (done: Function) => {
      console.info('[styledStringAddApi_001] START');
      let driver: Driver = Driver.create();
      let text: Component = await driver.findComponent(ON.id('styledStringAddApi'));
      await CommonFunc.sleep(1000);
      await text.inputText('0');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('styledStringText');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[styledStringAddApi_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('0');
      console.info('[styledStringAddApi_001] END');
      done();
    });


    /**
     * @tc.name   styledStringAddApi_002
     * @tc.number styledStringAddApi_002
     * @tc.desc   styledStringAddApi_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('styledStringAddApi_002', Level.LEVEL3, async () => {
      let msg = 'testPositionWithAffinity'
      console.info(msg + 'begin');
      try {
        let positionWithAffinity: text.PositionWithAffinity = {
          position: 20,
          affinity: text.Affinity.UPSTREAM
        }
      } catch (err) {
        console.info(msg + 'test PositionWithAffinity error ' + JSON.stringify(err));
        expect().assertFail();
      }
    })




  })
}
