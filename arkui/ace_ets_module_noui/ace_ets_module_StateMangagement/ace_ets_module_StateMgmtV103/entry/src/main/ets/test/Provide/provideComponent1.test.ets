/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
 


export default function provideComponent1() {
  describe('provideComponent1', () => {
    beforeEach(async (done: Function) => {
      console.info("provideComponent1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Provide/provideComponent1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get provideComponent1 state pages: " + JSON.stringify(pages));
        if (!("provideComponent1" == pages.name)) {
          console.info("get provideComponent1 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push provideComponent1 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push provideComponent1 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   provideComponentOneTest_0100
     * @tc.number SUB_ACE_provideComponent1_0100
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('provideComponentOneTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('provideComponentOneTest_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('provideComponent1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[provideComponentOneTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[provideComponentOneTest_0100] title: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual('reviewVotes(5), give +1');
      console.info('[provideComponentOneTest_0100] END');
      done();
    });


  })
}

