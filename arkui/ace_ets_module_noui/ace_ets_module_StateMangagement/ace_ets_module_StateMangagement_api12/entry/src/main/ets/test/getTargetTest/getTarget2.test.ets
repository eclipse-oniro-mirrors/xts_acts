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
export default function getTarget2Test() {
  describe('getTarget2Test', () => {
    beforeEach(async (done: Function) => {
      console.info("getTarget2Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getTarget/getTarget2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getTarget2Test state pages: " + JSON.stringify(pages));
        if (!("getTarget2" == pages.name)) {
          console.info("get getTarget2Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push getTarget2Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getTarget2Test page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    getTarget2
     * @tc.name      getTarget2Test_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('getTarget2Test_0100', Level.LEVEL0, async (done: Function) => {
      console.info('getTarget2Test_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('useGetTarget2_1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getTarget2Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('this.InfoV1Observed === g0 true');

      strJson = getInspectorByKey('useGetTarget2_2');
      obj = JSON.parse(strJson);
      console.info("[getTarget2Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('UIUtils.getTarget(this.InfoV1Observed) === g0: true');

      console.info('[getTarget2Test_0100] END');
      done();
    });
  })
}

