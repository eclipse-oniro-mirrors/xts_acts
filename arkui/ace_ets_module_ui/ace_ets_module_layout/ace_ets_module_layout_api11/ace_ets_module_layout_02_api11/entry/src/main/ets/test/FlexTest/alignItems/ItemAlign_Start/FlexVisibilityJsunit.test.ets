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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc, { RectValue } from "../../../../MainAbility/common/Common";
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';
import GlobalContext from '../../../../MainAbility/common/GlobalContext';

export default function flexVisibility_StartJsunit() {
  describe('flexItemAlignStartTest8', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Start/ItemAlign_Start_FlexVisibility',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get ItemAlign_Start_FlexVisibility state success " + JSON.stringify(pages));
        if (!("ItemAlign_Start_FlexVisibility" == pages.name)) {
          console.info("get ItemAlign_Start_FlexVisibility state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push ItemAlign_Start_FlexVisibility page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ItemAlign_Start_FlexVisibility page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);

    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ItemAlign_Start_FlexVisibility after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_START_1100
     * @tc.name testFlexItemAlignStartSubSetVisibilityNone
     * @tc.desc aceFlexAlignItemTest
     */
    it('testFlexItemAlignStartSubSetVisibilityNone',  Level.LEVEL0, async () => {
      console.info('new testFlexItemAlignStartSubSetVisibilityNone START');
      try {
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'visibility', value: Visibility.None
        });
        await CommonFunc.sleep(2000);
        let strJson1 = getInspectorByKey('ItemAlign_Start_flexVisible');

        let strJson2 = getInspectorByKey('ItemAlign_Start_textVisible01');

        expect(JSON.parse(strJson2).$attrs.visibility).assertEqual("Visibility.None");
        let textVisible01: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_textVisible01');
        let textVisible02: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_textVisible02');
        let textVisible03: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_textVisible03');
        let flexVisible: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_flexVisible');

        expect(Math.abs(textVisible01.left - textVisible01.right) <= 1).assertTrue();
        expect(Math.abs(textVisible01.right - flexVisible.left) <= 1).assertTrue();
        expect(Math.abs(textVisible02.top - textVisible03.top) <= 1).assertTrue();
        expect(Math.abs(textVisible03.top - flexVisible.top) <= 1).assertTrue();
        expect(Math.abs(Math.round(textVisible02.bottom - textVisible02.top) - Math.round(vp2px(100))) <= 1)
          .assertTrue();
        expect(Math.abs(Math.round(textVisible03.bottom - textVisible03.top) - Math.round(vp2px(150))) <= 1)
          .assertTrue();
        expect(Math.abs(Math.round(textVisible02.right - textVisible02.left) - Math.round(vp2px(150))) <= 1)
          .assertTrue();
        expect(Math.abs(Math.round(textVisible03.right - textVisible03.left) - Math.round(vp2px(150))) <= 1)
          .assertTrue();
        expect(JSON.parse(strJson1).$attrs.visibility).assertEqual("Visibility.Visible");
        expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row')
        expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.Start')
      } catch (err) {
        console.error('[testFlexItemAlignBaselineSubSetVisibilityNone] failed');
        expect().assertFail();
      }
      console.info('new testFlexItemAlignStartSubSetVisibilityNone END');

    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_START_1200
     * @tc.name testFlexItemAlignStartSubSetVisibilityHidden
     * @tc.desc aceFlexAlignItemTest
     */
    it('testFlexItemAlignStartSubSetVisibilityHidden',  Level.LEVEL0, async () => {
      console.info('new testFlexItemAlignStartSubSetVisibilityHidden START');
      try {
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'visibility', value: Visibility.Hidden
        });
        await CommonFunc.sleep(2000);
        let strJson1 = getInspectorByKey('ItemAlign_Start_flexVisible');

        let strJson2 = getInspectorByKey('ItemAlign_Start_textVisible01');

        expect(JSON.parse(strJson2).$attrs.visibility).assertEqual("Visibility.Hidden");
        let textVisible01: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_textVisible01');
        let textVisible02: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_textVisible02');
        let textVisible03: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_textVisible03');
        let flexVisible: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_flexVisible');
        expect(Math.abs(textVisible01.left - flexVisible.left) <= 1).assertTrue();
        expect(Math.abs(textVisible01.right - textVisible02.left) <= 1).assertTrue();
        expect(Math.abs(textVisible02.top - textVisible03.top) <= 1).assertTrue();
        expect(Math.abs(textVisible03.top - flexVisible.top) <= 1).assertTrue();

        expect(Math.abs(Math.round(textVisible01.bottom - textVisible01.top) - Math.round(vp2px(50))) <= 1)
          .assertTrue();
        expect(Math.abs(Math.round(textVisible02.bottom - textVisible02.top) - Math.round(vp2px(100))) <= 1)
          .assertTrue();
        expect(Math.abs(Math.round(textVisible03.bottom - textVisible03.top) - Math.round(vp2px(150))) <= 1)
          .assertTrue();
        expect(Math.abs(Math.round(textVisible01.right - textVisible01.left) - Math.round(vp2px(150))) <= 1)
          .assertTrue();
        expect(Math.abs(Math.round(textVisible02.right - textVisible02.left) - Math.round(vp2px(150))) <= 1)
          .assertTrue();
        expect(Math.abs(Math.round(textVisible03.right - textVisible03.left) - Math.round(vp2px(150))) <= 1)
          .assertTrue();
        expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row')
        expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.Start')
      } catch (err) {
        console.error('[testFlexItemAlignBaselineSubSetVisibilityHidden] failed');
        expect().assertFail();
      }
      console.info('new testFlexItemAlignStartSubSetVisibilityHidden END');

    });
  })
}
