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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../MainAbility/common/Common';

export default function row_TextVisibilityTest() {
  describe('Row_TextVisibilityTest', () => {
    beforeAll(async (done: Function) => {
      console.info("Row_TextVisibilityTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/subComponentChanged/Row_TextVisibility',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Row_TextVisibility state pages:" + JSON.stringify(pages));
        if (!("Row_TextVisibility" == pages.name)) {
          console.info("get Row_TextPosition pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Row_TextVisibility page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Row_TextVisibility page error:" + err);
      }
      console.info("Row_TextVisibilityTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(3000);
      console.info("Row_TextVisibilityTest after each called");
    });
    /**
     * @tc.name   testRowTextVisibilityNone
     * @tc.number SUB_ACE_ROW_SUBCOMPONENTCHANGED_1800
     * @tc.desc   The visibility of second subcomponent set to 'None'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRowTextVisibilityNone',  Level.LEVEL0, async (done: Function) => {
      console.info('[testRowTextVisibilityNone] START');
      try {
        globalThis.value.message.notify({
          name: 'secondTextVisibility', value: Visibility.None
        });
        await CommonFunc.sleep(3000);
        let firstText: RectValue = CommonFunc.getComponentRect('Row_TextVisibility1');
        let secondText: RectValue = CommonFunc.getComponentRect('Row_TextVisibility2');
        let thirdText: RectValue = CommonFunc.getComponentRect('Row_TextVisibility3');
        let rowContainer: RectValue = CommonFunc.getComponentRect('Row_TextVisibility_Container01');
        let rowContainerStrJson = getInspectorByKey('Row_TextVisibility_Container01');

        expect(JSON.parse(rowContainerStrJson).$type).assertEqual('Row');

        let secondTextStrJson = getInspectorByKey('Row_TextVisibility2');
        expect(JSON.parse(secondTextStrJson).$attrs.visibility).assertEqual("Visibility.None");

        expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
        expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();

        expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
        expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1)
          .assertTrue();

        expect(Math.abs((Math.round(firstText.top - rowContainer.top)) - (Math.round(rowContainer.bottom - firstText.bottom))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(thirdText.top - rowContainer.top)) - (Math.round(rowContainer.bottom - thirdText.bottom))) <= 1)
          .assertTrue();

        expect(Math.abs((firstText.left) - (rowContainer.left)) <= 1).assertTrue();
        expect(Math.abs((Math.round(thirdText.left - firstText.right)) - (Math.round(vp2px(10)))) <= 1).assertTrue();

        expect(Math.abs((Math.round(rowContainer.right - thirdText.right)) - (Math.round(vp2px(140)))) <= 1)
          .assertTrue();
      } catch (err) {
        console.error('[testRowTextVisibilityNone] failed');
        expect().assertFail();
      }
      console.info('[testRowTextVisibilityNone] END');
      done();
    });
    /**
     * @tc.name   testRowTextVisibilityHidden
     * @tc.number SUB_ACE_ROW_SUBCOMPONENTCHANGED_1900
     * @tc.desc   The visibility of second subcomponent set to 'Hidden'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRowTextVisibilityHidden',  Level.LEVEL0, async (done: Function) => {
      console.info('[testRowTextVisibilityHidden] START');
      try {
        globalThis.value.message.notify({
          name: 'secondTextVisibility', value: Visibility.Hidden
        });
        await CommonFunc.sleep(3000);
        let firstText: RectValue = CommonFunc.getComponentRect('Row_TextVisibility1');
        let secondText: RectValue = CommonFunc.getComponentRect('Row_TextVisibility2');
        let thirdText: RectValue = CommonFunc.getComponentRect('Row_TextVisibility3');
        let rowContainer: RectValue = CommonFunc.getComponentRect('Row_TextVisibility_Container01');
        let rowContainerStrJson = getInspectorByKey('Row_TextVisibility_Container01');

        expect(JSON.parse(rowContainerStrJson).$type).assertEqual('Row');
        let secondTextStrJson = getInspectorByKey('Row_TextVisibility2');
        expect(JSON.parse(secondTextStrJson).$attrs.visibility).assertEqual("Visibility.Hidden");
        expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
        expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();

        expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
        expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1)
          .assertTrue();

        expect(Math.abs((Math.round(firstText.top - rowContainer.top)) - (Math.round(rowContainer.bottom - firstText.bottom))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(thirdText.top - rowContainer.top)) - (Math.round(rowContainer.bottom - thirdText.bottom))) <= 1)
          .assertTrue();

        expect(Math.abs((firstText.left) - (rowContainer.left)) <= 1).assertTrue();
        expect(Math.abs((Math.round(thirdText.left - firstText.right)) - (Math.round(vp2px(120)))) <= 1).assertTrue();

        expect(Math.abs((Math.round(rowContainer.right - thirdText.right)) - (Math.round(vp2px(30)))) <= 1)
          .assertTrue();
      } catch (err) {
        console.error('[testRowTextVisibilityHidden] failed');
        expect().assertFail();
      }
      console.info('[testRowTextVisibilityHidden] END');
      done();
    });
    /**
     * @tc.name   testRowTextVisibilityVisible
     * @tc.number SUB_ACE_ROW_SUBCOMPONENTCHANGED_2000
     * @tc.desc   The visibility of second subcomponent set to 'visible'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRowTextVisibilityVisible',  Level.LEVEL0, async (done: Function) => {
      console.info('[testRowTextVisibilityVisible] START');
      try {
        globalThis.value.message.notify({
          name: 'secondTextVisibility', value: Visibility.Visible
        });
        await CommonFunc.sleep(3000);
        let firstText: RectValue = CommonFunc.getComponentRect('Row_TextVisibility1');
        let secondText: RectValue = CommonFunc.getComponentRect('Row_TextVisibility2');
        let thirdText: RectValue = CommonFunc.getComponentRect('Row_TextVisibility3');
        let rowContainer: RectValue = CommonFunc.getComponentRect('Row_TextVisibility_Container01');
        let rowContainerStrJson = getInspectorByKey('Row_TextVisibility_Container01');

        expect(JSON.parse(rowContainerStrJson).$type).assertEqual('Row');

        let secondTextStrJson = getInspectorByKey('Row_TextVisibility2');
        expect(JSON.parse(secondTextStrJson).$attrs.visibility).assertEqual("Visibility.Visible");

        expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
        expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
        expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();

        expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
        expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(secondText.right - secondText.left))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(secondText.right - secondText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1)
          .assertTrue();


        expect(Math.abs((Math.round(firstText.top - rowContainer.top)) - (Math.round(rowContainer.bottom - firstText.bottom))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(secondText.top - rowContainer.top)) - (Math.round(rowContainer.bottom - secondText.bottom))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(thirdText.top - rowContainer.top)) - (Math.round(rowContainer.bottom - thirdText.bottom))) <= 1)
          .assertTrue();

        expect(Math.abs((firstText.left) - (rowContainer.left)) <= 1).assertTrue();
        expect(Math.abs((Math.round(secondText.left - firstText.right)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
        expect(Math.abs((Math.round(secondText.left - firstText.right)) - (Math.round(thirdText.left - secondText.right))) <= 1)
          .assertTrue();

        expect(Math.abs((Math.round(rowContainer.right - thirdText.right)) - (Math.round(vp2px(30)))) <= 1)
          .assertTrue();
      } catch (err) {
        console.error('[testRowTextVisibilityVisible] failed');
        expect().assertFail();
      }
      console.info('[testRowTextVisibilityVisible] END');
      done();
    });
  })
}
