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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';
export default function alphabetTest() {
  describe('alphabetTest', () => {
    beforeEach(async (done: Function) => {
      console.info("alphabetTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AlphabetIndexer/alphabet',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get alphabetTest state pages: " + JSON.stringify(pages));
        if (!("alphabet" == pages.name)) {
          console.info("get alphabetTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push alphabetTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push alphabetTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number blendMode
     * @tc.name alphabetTest_0100
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('alphabetTest_0100', 0, async (done: Function) => {
      console.info('alphabetTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('alphabet_1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[alphabetTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[alphabetTest_0100] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.autoCollapse).assertEqual('false');
      console.info('[alphabetTest_0100] END');
      done();
    });
  })
  }

