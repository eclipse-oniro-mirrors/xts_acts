/**
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

import { expect, describe, it, beforeEach, afterEach, Level  } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import router from '@ohos.router';

export default function CustomMarkDirtyTest() {
  describe('CustomMarkDirtyTest', () => {
    beforeEach(async (done: Function) => {
      console.info("CustomMarkDirtyTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomComponent/CustomMarkDirty',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CustomMarkDirty state pages:" + JSON.stringify(pages));
        if (!("CustomMarkDirty" == pages.name)) {
          console.info("get CustomMarkDirty pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push CustomMarkDirty page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CustomMarkDirty page error:" + err);
      }
      console.info("CustomMarkDirty beforeEach end");
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("CustomMarkDirtyTest after each called");
    });

    /**	
     * @tc.name   CustomMarkDirtyTest_0100	
     * @tc.number SUB_ARKUI_API_CustomMarkDirtyTest_0100	
     * @tc.desc   CustomMarkDirty test	
     * @tc.type   FUNCTION	
     * @tc.size   MEDIUMTEST	
     * @tc.level  LEVEL1	
     */
    it('CustomMarkDirtyTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[CustomMarkDirtyTest_0100] START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      
      let strJson = getInspectorByKey('CustomMarkDirty1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.width).assertEqual('100.00vp');
      expect(obj.$attrs.height).assertEqual('100.00vp');
      console.info('[CustomMarkDirtyTest_0100] END');

      done();
    });
  })
}