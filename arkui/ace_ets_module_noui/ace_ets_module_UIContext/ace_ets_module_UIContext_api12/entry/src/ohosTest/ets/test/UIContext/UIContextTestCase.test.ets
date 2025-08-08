/*
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
import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
export default function UIContextTestCase() {
  describe('UIContextTestCase', () => {
    beforeEach(async (done: Function) => {
      console.info("UIContextTestCase beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIContext/UIcontextTestPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get UIContextTestCase state pages:" + JSON.stringify(pages));
        if (!("UIcontextTestPage" == pages.name)) {
          console.info("get UIcontextTestPag pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push UIContextTestCase page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UIContextTestCase page error:" + err);
      }
      console.info("UIContextTestCase beforeEach end");
      done();
    });
    afterEach(async () => {
    });
    /**
     * @tc.number    UIContextTestInterface
     * @tc.name      UIContextTestCase_0100
     * @tc.desc      test getHostContext object
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */


    it('UIContextTestCase_0100', Level.LEVEL2, async (done: Function) => {
      console.info('UIContextTestCase_0100');
      await CommonFunc.sleep(1000);
      // to get the getHostContext object
      let strJson = getInspectorByKey('getHostContext');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[UIContextTestCase_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('object = [object Object]');
      console.info('[UIContextTestCase_0100] END');
      done();
    });
    /**
     * @tc.number    UIContextTestInterface
     * @tc.name      UIContextTestCase_0200
     * @tc.desc      test getWindowName
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */


    it('UIContextTestCase_0200', Level.LEVEL2, async (done: Function) => {
      console.info('UIContextTestCase_0200');
      await CommonFunc.sleep(1000);
      // to get the getHostContext object
      let strJson = getInspectorByKey('getWindowName');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[UIContextTestCase_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('UIContext120');
      console.info('[UIContextTestCase_0200] END');
      done();
    });
  })
}