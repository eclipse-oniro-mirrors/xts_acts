/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import RectValue from '../../../MainAbility/common/Rect';
import CommonFunc from '../../../MainAbility/common/Common';

export default function Column_Space() {
  describe('column_SpaceTest', () => {
    beforeEach(async () => {
      console.info("column_SpaceTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Column/spaceChanged/Column_Space",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Column_Space state pages:" + JSON.stringify(pages));
        if (!("Column_Space" == pages.name)) {
          console.info("get Column_Space pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Column_Space page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Column_Space page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("column_SpaceTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Column_Space after each called")
    });
    /**
     * @tc.number SUB_ACE_COLUMN_SPACE_TEST_0100
     * @tc.name testColumnSpaceToThirty
     * @tc.desc The value of space set to 30, and the layout size of the parent and child components is fixed
     */
    it('testColumnSpaceToThirty', 0, async () => {
      console.info('[testColumnSpaceToThirty] START');
      globalThis.value.message.notify({
        name: 'addSpace', value: 30
      });
      await CommonFunc.sleep(3000);
      let Column_Space_011: RectValue = CommonFunc.getComponentRect('Column_Space_011');
      let Column_Space_012: RectValue = CommonFunc.getComponentRect('Column_Space_012');
      let Column_Space_013: RectValue = CommonFunc.getComponentRect('Column_Space_013');
      let Column_Space_01: RectValue = CommonFunc.getComponentRect('Column_Space_01');
      expect(Math.abs(Math.round(Column_Space_011.left - Column_Space_01.left) -
      Math.round(Column_Space_01.right - Column_Space_011.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Column_Space_012.left - Column_Space_01.left) -
      Math.round(Column_Space_01.right - Column_Space_012.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Column_Space_013.left - Column_Space_01.left) -
      Math.round(Column_Space_01.right - Column_Space_013.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Column_Space_012.top - Column_Space_011.bottom) -
      Math.round(Column_Space_013.top - Column_Space_012.bottom)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_01.top - Column_Space_011.top) <= 1).assertTrue();
      expect(Column_Space_013.bottom).assertLess(Column_Space_01.bottom);
      expect(Math.abs((Column_Space_012.top - Column_Space_011.bottom) - vp2px(30)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_011.bottom - Column_Space_011.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_012.bottom - Column_Space_012.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_013.bottom - Column_Space_013.top) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_011.right - Column_Space_011.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_012.right - Column_Space_012.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_013.right - Column_Space_013.left) - vp2px(300)) <= 1).assertTrue();

      console.info('[testColumnSpaceToThirty] END');
    });
    /**
     * @tc.number SUB_ACE_COLUMN_SPACE_TEST_0200
     * @tc.name testColumnSpaceToFifty
     * @tc.desc The value of space set to 50, and the layout size of the parent and child components is fixed
     */
    it('testColumnSpaceToFifty', 0, async () => {
      console.info('[testColumnSpaceToFifty] START');
      globalThis.value.message.notify({
        name: 'addSpace', value: 50
      });
      await CommonFunc.sleep(3000);
      let Column_Space_011: RectValue = CommonFunc.getComponentRect('Column_Space_011');
      let Column_Space_012: RectValue = CommonFunc.getComponentRect('Column_Space_012');
      let Column_Space_013: RectValue = CommonFunc.getComponentRect('Column_Space_013');
      let Column_Space_01: RectValue = CommonFunc.getComponentRect('Column_Space_01');
      expect(Math.abs(Math.round(Column_Space_011.left - Column_Space_01.left) -
      Math.round(Column_Space_01.right - Column_Space_011.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Column_Space_012.left - Column_Space_01.left) -
      Math.round(Column_Space_01.right - Column_Space_012.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Column_Space_013.left - Column_Space_01.left) -
      Math.round(Column_Space_01.right - Column_Space_013.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Column_Space_012.top - Column_Space_011.bottom) -
      Math.round(Column_Space_013.top - Column_Space_012.bottom)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_01.top - Column_Space_011.top) <= 1).assertTrue();
      expect(Math.abs(Column_Space_013.bottom - Column_Space_01.bottom) <= 1).assertTrue();
      expect(Math.abs((Column_Space_012.top - Column_Space_011.bottom) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_011.bottom - Column_Space_011.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_012.bottom - Column_Space_012.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_013.bottom - Column_Space_013.top) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_011.right - Column_Space_011.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_012.right - Column_Space_012.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_013.right - Column_Space_013.left) - vp2px(300)) <= 1).assertTrue();

      console.info('[testColumnSpaceToFifty] END');
    });
    /**
     * @tc.number SUB_ACE_COLUMN_SPACE_TEST_0300
     * @tc.name testColumnSpaceToSeventy
     * @tc.desc The value of space set to 70, and the layout size of the parent and child components is fixed
     */
    it('testColumnSpaceToSeventy', 0, async () => {
      console.info('[testColumnSpaceToSeventy] START');
      globalThis.value.message.notify({
        name: 'addSpace', value: 70
      });
      await CommonFunc.sleep(3000);
      let Column_Space_011: RectValue = CommonFunc.getComponentRect('Column_Space_011');
      let Column_Space_012: RectValue = CommonFunc.getComponentRect('Column_Space_012');
      let Column_Space_013: RectValue = CommonFunc.getComponentRect('Column_Space_013');
      let Column_Space_01: RectValue = CommonFunc.getComponentRect('Column_Space_01');
      expect(Math.abs(Column_Space_01.top - Column_Space_011.top) <= 1).assertTrue();
      expect(Column_Space_013.bottom).assertLarger(Column_Space_01.bottom);
      expect(Math.abs((Column_Space_011.left - Column_Space_01.left) - (Column_Space_01.right - Column_Space_011.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_012.left - Column_Space_01.left) - (Column_Space_01.right - Column_Space_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_013.left - Column_Space_01.left) - (Column_Space_01.right - Column_Space_013.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_012.top - Column_Space_011.bottom) - (Column_Space_013.top - Column_Space_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_Space_012.top - Column_Space_011.bottom) - vp2px(70)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_011.bottom - Column_Space_011.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_012.bottom - Column_Space_012.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_013.bottom - Column_Space_013.top) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_011.right - Column_Space_011.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_012.right - Column_Space_012.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_Space_013.right - Column_Space_013.left) - vp2px(300)) <= 1).assertTrue();

      console.info('[testColumnSpaceToSeventy] END');
    });
  })
}
