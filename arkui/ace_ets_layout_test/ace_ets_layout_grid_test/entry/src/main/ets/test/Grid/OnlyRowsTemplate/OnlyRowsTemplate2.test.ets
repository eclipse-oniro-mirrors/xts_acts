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
import CommonFunc from '../../../MainAbility/common/Common';
import { MessageManager,Callback } from '../../../MainAbility/common/MessageManager';
export default function OnlyRowsTemplate2() {
  describe('OnlyRowsTemplate2', function () {
    beforeEach(async function (done) {
      console.info("GridFrictionPage beforeEach start");
      let options = {
        url: 'MainAbility/pages/Grid/OnlyRowsTemplate/OnlyRowsTemplate2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OnlyRowsTemplate2 state pages:" + JSON.stringify(pages));
        if (!("GridFrictionPage" == pages.name)) {
          console.info("get OnlyRowsTemplate2 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push OnlyRowsTemplate2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OnlyRowsTemplate2 page error:" + err);
      }
      console.info("OnlyRowsTemplate2 beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("OnlyRowsTemplate2 after each called");
    });
    /**
     * @tc.number    SUB_ACE_GRID_OnlyRowsTemplate2_0100
     * @tc.name      testGrid
     * @tc.desc      GridItem only sets rowStart
     */
    it('SUB_ACE_GRID_OnlyRowsTemplate2_0100', 0, async function (done) {
      console.info('[SUB_ACE_GRID_OnlyRowsTemplate2_0100] START');
      await CommonFunc.sleep(2000);

      console.log('get Initial value')
      let GridItem_01 = CommonFunc.getComponentRect('OnlyRowsTemplate2_GridItem_01');
      let GridItem_02 = CommonFunc.getComponentRect('OnlyRowsTemplate2_GridItem_02');

      console.log('assert size')
      expect(Math.round(GridItem_01.right - GridItem_01.left)).assertEqual(Math.round(vp2px(100)));
      console.log('GGridItem_01.right - GridItem_01.left' + (GridItem_01.right - GridItem_01.left))
      expect(Math.round(GridItem_01.bottom - GridItem_01.top)).assertEqual(Math.round(vp2px(60)));
      console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_01.bottom - GridItem_01.top))

      console.info('[SUB_ACE_GRID_OnlyRowsTemplate2_0100] END');
      done();
    });

  })
}
