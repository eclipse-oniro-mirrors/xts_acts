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
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';
export default function getNumeric() {
  describe('getNumeric', () => {
    beforeEach(async (done: Function) => {
      console.info("getNumeric beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Graphics/getNumeric',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getNumeric state pages: " + JSON.stringify(pages));
        if (!("getNumeric" == pages.name)) {
          console.info("get getNumeric state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push getNumeric success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getNumeric page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   getNumeric_0100
     * @tc.number SUB_ACE_getNumeric_0100
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getNumeric_0100', Level.LEVEL0, async (done: Function) => {
      console.info('getNumeric_0100 START');
      let strJson: string = getInspectorByKey('getNumeric');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[getNumeric_0100] component obj is: " + JSON.stringify(obj));
      console.info("[getNumeric_0100] title: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual("#FFFF0000");
      console.info('[getNumeric_0100] END');
      done();
    });
    
  })
}