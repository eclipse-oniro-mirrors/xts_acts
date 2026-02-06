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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../../MainAbility/common/Common';
import GlobalContext from '../../../../MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';

export default function AlignContentFlex_Start() {

  describe('AlignContentFlex_Start', () => {
    beforeEach(async () => {
      console.info("AlignContentFlex_Start beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/Start/AlignContentFlex_Start',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get AlignContentFlex_Start state success " + JSON.stringify(pages));
        if (!("AlignContentFlex_Start" == pages.name)) {
          console.info("get AlignContentFlex_Start state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push AlignContentFlex_Start page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignContentFlex_Start page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000)
      console.info("AlignContentFlex_Start beforeEach end");

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000)
      console.info("AlignContentFlex_Start after each called");
    });


    /**
     * @tc.name   testAlignContentStartFlexHeightSatisfy
     * @tc.number testAlignContentStartFlexHeightSatisfy
     * @tc.desc   testAlignContentStartFlexHeightSatisfy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAlignContentStartFlexHeightSatisfy',  Level.LEVEL0, async () => {
      console.info('testAlignContentStartFlexHeightSatisfy START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'height', value: 360
      })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlex_Start_flex001');

      console.info('flex [getInspectorByKey] is:' + JSON.stringify(JSON.parse(strJson)));
      console.info('flex obj.$attrs.constructor is:' + JSON.stringify(JSON.parse(strJson).$attrs.constructor));
      let AlignContentFlexStart_flex001: RectValue = CommonFunc.getComponentRect('AlignContentFlex_Start_flex001');
      let AlignContentFlexStart_1: RectValue = CommonFunc.getComponentRect('AlignContentFlex_Start_flex001_1');
      let AlignContentFlexStart_2: RectValue = CommonFunc.getComponentRect('AlignContentFlex_Start_flex001_2');
      let AlignContentFlexStart_3: RectValue = CommonFunc.getComponentRect('AlignContentFlex_Start_flex001_3');
      let AlignContentFlexStart_4: RectValue = CommonFunc.getComponentRect('AlignContentFlex_Start_flex001_4');

      console.log('AlignContentFlex_Start_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_flex001));
      console.log('AlignContentFlexStart_1 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_1));
      console.log('AlignContentFlexStart_2 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_2));
      console.log('AlignContentFlexStart_3 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_3));
      console.log('AlignContentFlexStart_4 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_4));

	  expect(Math.abs(Math.round(AlignContentFlexStart_1.bottom - AlignContentFlexStart_1.top) - Math.round(vp2px(50))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexStart_2.bottom - AlignContentFlexStart_2.top) - Math.round(vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexStart_3.bottom - AlignContentFlexStart_3.top) - Math.round(vp2px(150))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexStart_4.bottom - AlignContentFlexStart_4.top) - Math.round(vp2px(200))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexStart_1.right - AlignContentFlexStart_1.left) - Math.round(vp2px(150))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexStart_2.right - AlignContentFlexStart_2.left) - Math.round(vp2px(150))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexStart_3.right - AlignContentFlexStart_3.left) - Math.round(vp2px(150))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexStart_4.right - AlignContentFlexStart_4.left) - Math.round(vp2px(150))) <= 1).assertTrue();

      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(JSON.parse(strJson).$attrs.constructor.alignContent).assertEqual("FlexAlign.Start");

      expect(AlignContentFlexStart_2.top).assertEqual(AlignContentFlexStart_flex001.top);
      expect(AlignContentFlexStart_4.top).assertEqual(AlignContentFlexStart_2.bottom);
	  expect(Math.abs(Math.round(AlignContentFlexStart_flex001.bottom - AlignContentFlexStart_4.bottom) - Math.round(vp2px(60))) <= 1).assertTrue();

      console.info('testAlignContentStartFlexHeightSatisfy END');

    });


    /**
     * @tc.name   testAlignContentStartFlexHeightNoSatisfy
     * @tc.number testAlignContentStartFlexHeightNoSatisfy
     * @tc.desc   testAlignContentStartFlexHeightNoSatisfy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAlignContentStartFlexHeightNoSatisfy',  Level.LEVEL0, async () => {
      console.info('testAlignContentStartFlexHeightNoSatisfy START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'height', value: 250
      })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlex_Start_flex001');

      let AlignContentFlexStart_flex002: RectValue = CommonFunc.getComponentRect('AlignContentFlex_Start_flex001');
      let AlignContentFlexStart_1: RectValue = CommonFunc.getComponentRect('AlignContentFlex_Start_flex001_1');
      let AlignContentFlexStart_2: RectValue = CommonFunc.getComponentRect('AlignContentFlex_Start_flex001_2');
      let AlignContentFlexStart_3: RectValue = CommonFunc.getComponentRect('AlignContentFlex_Start_flex001_3');
      let AlignContentFlexStart_4: RectValue = CommonFunc.getComponentRect('AlignContentFlex_Start_flex001_4');

      console.log('AlignContentFlexStart_flex002 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_flex002))
      console.log('AlignContentFlexStart_1 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_1));
      console.log('AlignContentFlexStart_2 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_2));
      console.log('AlignContentFlexStart_3 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_3));
      console.log('AlignContentFlexStart_4 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_4));

	  expect(Math.abs(Math.round(AlignContentFlexStart_1.bottom - AlignContentFlexStart_1.top) - Math.round(vp2px(50))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexStart_2.bottom - AlignContentFlexStart_2.top) - Math.round(vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexStart_3.bottom - AlignContentFlexStart_3.top) - Math.round(vp2px(150))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexStart_4.bottom - AlignContentFlexStart_4.top) - Math.round(vp2px(200))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexStart_1.right - AlignContentFlexStart_1.left) - Math.round(vp2px(150))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexStart_2.right - AlignContentFlexStart_2.left) - Math.round(vp2px(150))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexStart_3.right - AlignContentFlexStart_3.left) - Math.round(vp2px(150))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexStart_4.right - AlignContentFlexStart_4.left) - Math.round(vp2px(150))) <= 1).assertTrue();

      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(JSON.parse(strJson).$attrs.constructor.alignContent).assertEqual("FlexAlign.Start");

      expect(AlignContentFlexStart_1.top).assertEqual(AlignContentFlexStart_flex002.top);
      expect(AlignContentFlexStart_4.bottom).assertLarger(AlignContentFlexStart_flex002.bottom);
      expect(AlignContentFlexStart_2.bottom).assertEqual(AlignContentFlexStart_4.top);

      console.info('testAlignContentStartFlexHeightNoSatisfy END');

    });
  })
}
