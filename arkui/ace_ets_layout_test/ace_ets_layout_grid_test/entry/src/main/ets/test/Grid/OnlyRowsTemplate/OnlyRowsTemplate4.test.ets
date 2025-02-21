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
import { Driver, ON } from '@ohos.UiTest';
export default function OnlyRowsTemplate4() {
  describe('OnlyRowsTemplate4', function () {
    beforeEach(async function (done) {
      console.info("GridFrictionPage beforeEach start");
      let options = {
        url: 'MainAbility/pages/Grid/OnlyRowsTemplate/OnlyRowsTemplate1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OnlyRowsTemplate4 state pages:" + JSON.stringify(pages));
        if (!("GridFrictionPage" == pages.name)) {
          console.info("get OnlyRowsTemplate4 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push OnlyRowsTemplate4 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OnlyRowsTemplate4 page error:" + err);
      }
      console.info("OnlyRowsTemplate4 beforeEach end");
      done();
    });
    afterEach(async function () {
      console.info("OnlyRowsTemplate4 after each called");
    });

    /**
     * @tc.number    SUB_ACE_GRID_OnlyRowsTemplate4_0400
     * @tc.name      testGrid
     * @tc.desc      GridItem sets rowStart to a negative number
     */
    it('SUB_ACE_GRID_OnlyRowsTemplate4_0400', 0, async function (done) {
      console.info('[SUB_ACE_GRID_OnlyRowsTemplate4_0400] START');
      globalThis.value.message.notify({name:'rowStart1', value:-1})
      globalThis.value.message.notify({name:'rowEnd1', value:1})
      globalThis.value.message.notify({name:'rowStart2', value:-1})
      globalThis.value.message.notify({name:'rowEnd2', value:1})
      await CommonFunc.sleep(2000);

      console.log('get Initial value')
      let GridItem_01 = CommonFunc.getComponentRect('OnlyRowsTemplate1_GridItem_01');
      let GridItem_02 = CommonFunc.getComponentRect('OnlyRowsTemplate1_GridItem_02');

      console.log('assert space')
      expect(Math.round(GridItem_02.top - GridItem_01.bottom)).assertEqual(Math.round(vp2px(10)));
      console.log('GridItem_02.top - GridItem_01.bottom' + (GridItem_02.top - GridItem_01.bottom))


      console.log('assert size')
      expect(Math.round(GridItem_01.right - GridItem_01.left)).assertEqual(Math.round(vp2px(100)));
      console.log('GGridItem_01.right - GridItem_01.left' + (GridItem_01.right - GridItem_01.left))
      expect(Math.round(GridItem_01.bottom - GridItem_01.top)).assertEqual(Math.round(vp2px(72)));
      console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_01.bottom - GridItem_01.top))

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let button = await driver.findComponent(ON.id('OnlyRowsTemplate1_button'));
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('[SUB_ACE_GRID_OnlyRowsTemplate4_0400] END');
      done();
    });





  })
}
