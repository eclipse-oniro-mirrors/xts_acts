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
export default function getBlue() {
  describe('getBlue', () => {
    beforeEach(async (done: Function) => {
      console.info("getBlue beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Graphics/getBlue',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getBlue state pages: " + JSON.stringify(pages));
        if (!("getBlue" == pages.name)) {
          console.info("get getBlue state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push getBlue success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getBlue page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
     /**
     * @tc.number    SUB_ACE_getBlue_0100
     * @tc.name      getBlue_0100
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type : 
     * @tc.size :
     */
    it('getBlue_0100', Level.LEVEL0, async (done: Function) => {
      console.info('getBlue_0100 START');
      let strJson: string = getInspectorByKey('getBlue');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[getBlue_0100] component obj is: " + JSON.stringify(obj));
      console.info("[getBlue_0100] title: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual("#FF0000FF");
      console.info('[getBlue_0100] END');
      done();
    });
    
  })
}