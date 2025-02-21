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
import CommonFunc, { RectValue } from '../../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

export default function OnlyColumnsTemplate3() {
  describe('OnlyColumnsTemplate3', () => {
    beforeEach(async (done: Function) => {
      console.info("GridFrictionPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/OnlyColumnsTemplate/OnlyColumnsTemplate3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OnlyColumnsTemplate3 state pages:" + JSON.stringify(pages));
        if (!("GridFrictionPage" == pages.name)) {
          console.info("get OnlyColumnsTemplate3 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push OnlyColumnsTemplate3 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OnlyColumnsTemplate3 page error:" + err);
      }
      console.info("OnlyColumnsTemplate3 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("OnlyColumnsTemplate3 after each called");
    });
    /**
     * @tc.number SUB_ACE_GRID_OnlyColumnsTemplate3_0100
     * @tc.name testGrid
     * @tc.desc GridItem only sets columnStart
     */
    it('SUB_ACE_GRID_OnlyColumnsTemplate3_0100', 0, async (done: Function) => {
      console.info('[SUB_ACE_GRID_OnlyColumnsTemplate3_0100] START');
      await CommonFunc.sleep(2000);

      console.log('get Initial value')
      let GridItem_01: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate3_GridItem_01');

      console.log('assert size')
      expect(Math.abs(Math.round(GridItem_01.right - GridItem_01.left) - Math.round(vp2px(114))) <= 1).assertTrue();
      console.log('GGridItem_01.right - GridItem_01.left' + (GridItem_01.right - GridItem_01.left))
      expect(Math.abs(Math.round(GridItem_01.bottom - GridItem_01.top) - Math.round(vp2px(50))) <= 1).assertTrue();
      console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_01.bottom - GridItem_01.top))

      console.info('[SUB_ACE_GRID_OnlyColumnsTemplate3_0100] END');
      done();
    });

  })
}
