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
import CommonFunc, { RectValue } from '../../../../MainAbility/common/Common';

export default function Grid_Row_SizeOption() {
  describe('Grid_Row_SizeOption', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_Row_SizeOption beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_Row/Grid_Row_GutterOption/Grid_Row_SizeOption",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_Row_SizeOption state pages:" + JSON.stringify(pages));
        if (!("Grid_Row_SizeOption" == pages.name)) {
          console.info("get Grid_Row_SizeOption pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_Row_SizeOption page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_Row_SizeOption page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Grid_Row_SizeOption beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_Row_SizeOption after each called")
    });

    /**
     * @tc.number SUB_ACE_GRIDROWSIZEOPTION_0100
     * @tc.name testGridRowSizeOption
     * @tc.desc Set the GridRowSizeOption of GridRow to '30vp'
     */
    it('SUB_ACE_GridRowSizeOption_0100', 0, async (done: Function) => {
      console.info('SUB_ACE_GridRowGutterOption_0100 START');
      globalThis.value.message.notify({
        name: 'size', value: '30vp'
      })
      await CommonFunc.sleep(2000)

      let firstSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption0');
      let secondSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption1');
      let thirdSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption2');
      let fourthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption3');
      let fifthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption4');
      let sixthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption5');
      let seventhSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption6');


      expect(Math.abs(Math.round(secondSizeOption.top - firstSizeOption.bottom) - Math.round(vp2px(5))) <= 1)
        .assertTrue();

      console.info('SUB_ACE_GridRowGutterOption_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_GRIDROWSIZEOPTION_0200
     * @tc.name testGridRowSizeOption
     * @tc.desc Set the GridRowSizeOption of GridRow to '50vp'
     */
    it('SUB_ACE_GridRowSizeOption_0200', 0, async (done: Function) => {
      console.info('SUB_ACE_GridRowSizeOption_0200 START');
      globalThis.value.message.notify({
        name: 'size', value: '70vp'
      })
      await CommonFunc.sleep(2000)

      let firstSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption0');
      let secondSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption1');
      let thirdSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption2');
      let fourthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption3');
      let fifthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption4');
      let sixthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption5');
      let seventhSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption6');

      expect(Math.abs(Math.round(secondSizeOption.left - firstSizeOption.right) - Math.round(vp2px(5))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(thirdSizeOption.top - firstSizeOption.bottom) - Math.round(vp2px(5))) <= 1)
        .assertTrue();

      console.info('SUB_ACE_GridRowSizeOption_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_GRIDROWSIZEOPTION_0300
     * @tc.name testGridRowSizeOption
     * @tc.desc Set the GridRowSizeOption of GridRow to '100vp'
     */
    it('SUB_ACE_GridRowSizeOption_0300', 0, async (done: Function) => {
      console.info('SUB_ACE_GridRowSizeOption_0300 START');
      globalThis.value.message.notify({
        name: 'size', value: '120vp'
      })
      await CommonFunc.sleep(2000)

      let firstSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption0');
      let secondSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption1');
      let thirdSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption2');
      let fourthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption3');
      let fifthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption4');
      let sixthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption5');
      let seventhSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption6');


      expect(Math.abs(Math.round(secondSizeOption.left - firstSizeOption.right) - Math.round(vp2px(5))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(fourthSizeOption.top - firstSizeOption.bottom) - Math.round(vp2px(5))) <= 1)
        .assertTrue();

      console.info('SUB_ACE_GridRowSizeOption_0300 END');
      done();
    });
    /**
     * @tc.number SUB_ACE_GRIDROWSIZEOPTION_0400
     * @tc.name testGridRowSizeOption
     * @tc.desc Set the GridRowSizeOption of GridRow to '150vp'
     */
    it('SUB_ACE_GridRowSizeOption_0400', 0, async (done: Function) => {
      console.info('SUB_ACE_GridRowSizeOption_0400 START');
      globalThis.value.message.notify({
        name: 'size', value: '170vp'
      })
      await CommonFunc.sleep(2000)

      let firstSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption0');
      let secondSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption1');
      let thirdSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption2');
      let fourthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption3');
      let fifthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption4');
      let sixthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption5');
      let seventhSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption6');


      expect(Math.abs((Math.round(secondSizeOption.left - firstSizeOption.right)) - (Math.round(vp2px(5)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(fifthSizeOption.top - firstSizeOption.bottom)) - (Math.round(vp2px(5)))) <= 1)
        .assertTrue();

      console.info('SUB_ACE_GridRowSizeOption_0400 END');
      done();
    });
    /**
     * @tc.number SUB_ACE_GRIDROWSIZEOPTION_0500
     * @tc.name testGridRowSizeOption
     * @tc.desc Set the GridRowSizeOption of GridRow to '200vp'
     */
    it('SUB_ACE_GridRowSizeOption_0500', 0, async (done: Function) => {
      console.info('SUB_ACE_GridRowSizeOption_0500 START');
      globalThis.value.message.notify({
        name: 'size', value: '220vp'
      })
      await CommonFunc.sleep(2000)

      let firstSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption0');
      let secondSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption1');
      let thirdSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption2');
      let fourthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption3');
      let fifthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption4');
      let sixthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption5');
      let seventhSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption6');

      expect(Math.abs(Math.round(secondSizeOption.left - firstSizeOption.right) - Math.round(vp2px(5))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(sixthSizeOption.top - firstSizeOption.bottom) - Math.round(vp2px(5))) <= 1)
        .assertTrue();

      console.info('SUB_ACE_GridRowSizeOption_0500 END');
      done();
    });
    /**
     * @tc.number SUB_ACE_GRIDROWSIZEOPTION_0600
     * @tc.name testGridRowSizeOption
     * @tc.desc Set the GridRowSizeOption of GridRow to '300vp'
     */
    it('SUB_ACE_GridRowSizeOption_0600', 0, async (done: Function) => {
      console.info('SUB_ACE_GridRowSizeOption_0600 START');
      globalThis.value.message.notify({
        name: 'size', value: '320vp'
      })
      await CommonFunc.sleep(2000)

      let firstSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption0');
      let secondSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption1');
      let thirdSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption2');
      let fourthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption3');
      let fifthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption4');
      let sixthSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption5');
      let seventhSizeOption: RectValue = CommonFunc.getComponentRect('Grid_Row_SizeOption6');


      expect(Math.abs(Math.round(secondSizeOption.left - firstSizeOption.right) - Math.round(vp2px(5))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(seventhSizeOption.top - firstSizeOption.bottom) - Math.round(vp2px(5))) <= 1)
        .assertTrue();

      console.info('SUB_ACE_GridRowSizeOption_0600 END');
      done();
    });
  })
}
