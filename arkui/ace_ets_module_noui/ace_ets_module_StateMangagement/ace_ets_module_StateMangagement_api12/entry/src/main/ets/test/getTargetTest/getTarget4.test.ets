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
export default function getTarget4Test() {
  describe('getTarget4Test', () => {
    beforeEach(async (done: Function) => {
      console.info("getTarget4Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getTarget/getTarget4',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getTarget4Test state pages: " + JSON.stringify(pages));
        if (!("getTarget4" == pages.name)) {
          console.info("get getTarget4Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push getTarget4Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getTarget4Test page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    getTarget4
     * @tc.name      getTarget4Test_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('getTarget4Test_0100', Level.LEVEL0, async (done: Function) => {
      console.info('getTarget4Test_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('useGetTarget4_1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getTarget4Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('this.InfoV1Observed === g0 true');

      strJson = getInspectorByKey('useGetTarget4_2');
      obj = JSON.parse(strJson);
      console.info("[getTarget4Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('UIUtils.getTarget(this.InfoV1Observed) === g0: false');

      console.info('[getTarget4Test_0100] END');
      done();
    });
  })
}

