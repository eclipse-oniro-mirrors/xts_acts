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

export default function selectValueNullTest() {
  describe('selectValueNullTest', () => {

    beforeEach(async (done: Function) => {
      console.info("selectValueNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/selectNull/SelectValueNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get selectValueNullTest state success " + JSON.stringify(pages));
        if (!("SelectValueNullTest" == pages.name)) {
          console.info("get selectValueNullTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push selectValueNullTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push selectValueNullTest page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("selectValueNullTest after each called");
    });

    /**
     * @tc.name   selectValue_Null_001
     * @tc.number SUB_ARKUI_SELECT_VALUE_PARAM_001
     * @tc.desc   Test Select value with null value
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectValue_Null_001', Level.LEVEL0, async (done: Function) => {
      console.info('selectValue_Null_001 START');
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('select_value_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.value).assertEqual('');

      console.info('selectValue_Null_001 END');
      done();
    });

    /**
     * @tc.name   selectValue_Undefined_002
     * @tc.number SUB_ARKUI_SELECT_VALUE_PARAM_002
     * @tc.desc   Test Select value with undefined value
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectValue_Undefined_002', Level.LEVEL0, async (done: Function) => {
      console.info('selectValue_Undefined_002 START');
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('select_value_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.value).assertEqual('');

      console.info('selectValue_Undefined_002 END');
      done();
    });

  })
}