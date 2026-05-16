/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils'
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function selectSelectedNullTest() {
  describe('selectSelectedNullTest', () => {

    beforeEach(async (done: Function) => {
      console.info("selectSelectedNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/selectNull/SelectSelectedNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get selectSelectedNullTest state success " + JSON.stringify(pages));
        if (!("SelectSelectedNullTest" == pages.name)) {
          console.info("get selectSelectedNullTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push selectSelectedNullTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push selectSelectedNullTest page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("selectSelectedNullTest after each called");
    });

    /**
     * @tc.name   selectSelected_Null_001
     * @tc.number SUB_ARKUI_SELECT_SELECTED_PARAM_001
     * @tc.desc   Test Select selected with null value
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectSelected_Null_001', Level.LEVEL0, async (done: Function) => {
      console.info('selectSelected_Null_001 START');
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('select_selected_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("========="+obj.$attrs.selected)
      expect(obj.$attrs.selected).assertEqual("0");

      console.info('selectSelected_Null_001 END');
      done();
    });

    /**
     * @tc.name   selectSelected_Undefined_002
     * @tc.number SUB_ARKUI_SELECT_SELECTED_PARAM_002
     * @tc.desc   Test Select selected with undefined value
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectSelected_Undefined_002', Level.LEVEL0, async (done: Function) => {
      console.info('selectSelected_Undefined_002 START');
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('select_selected_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("========="+obj.$attrs.selected)
      expect(obj.$attrs.selected).assertEqual("0");

      console.info('selectSelected_Undefined_002 END');
      done();
    });

  })
}