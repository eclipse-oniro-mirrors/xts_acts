/*
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

import CommonFunc, { RectValue } from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function StackChildAlignmentTest() {
  describe('StackChildAlignmentTest', () => {
    beforeEach(async (done: Function) => {
      console.info("StackChildAlignmentTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/StackChildAlignment',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StackChildAlignmentTest state pages:" + JSON.stringify(pages));
        if (!("StackChildAlignmentTest" == pages.name)) {
          console.info("get StackChildAlignmentTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StackChildAlignmentTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StackChildAlignmentTest page error:" + err);
      }
      console.info("StackChildAlignmentTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

     /**
      * @tc.name   StackChildAlignmentTest_0100
      * @tc.number StackChildAlignmentTest_0100
      * @tc.desc   StackChildAlignmentTest_0100
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('StackChildAlignmentTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[StackChildAlignmentTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('AlignmentText1');
      console.log('[StackChildAlignmentTest_0100] layoutGravity1 is:' + JSON.stringify(JSON.parse(strJson1).$attrs.layoutGravity));
      let strJson2 = getInspectorByKey('AlignmentText2');
      console.log('[StackChildAlignmentTest_0100] layoutGravity2 is:' + JSON.stringify(JSON.parse(strJson2).$attrs.layoutGravity));
      let strJson3 = getInspectorByKey('AlignmentText3');
      console.log('[StackChildAlignmentTest_0100] layoutGravity3 is:' + JSON.stringify(JSON.parse(strJson3).$attrs.layoutGravity));
      let strJson4 = getInspectorByKey('AlignmentText4');
      console.log('[StackChildAlignmentTest_0100] layoutGravity4 is:' + JSON.stringify(JSON.parse(strJson4).$attrs.layoutGravity));
      let strJson5 = getInspectorByKey('AlignmentText5');
      console.log('[StackChildAlignmentTest_0100] layoutGravity5 is:' + JSON.stringify(JSON.parse(strJson5).$attrs.layoutGravity));
      let strJson6 = getInspectorByKey('AlignmentText6');
      console.log('[StackChildAlignmentTest_0100] layoutGravity6 is:' + JSON.stringify(JSON.parse(strJson6).$attrs.layoutGravity));
      let strJson7 = getInspectorByKey('AlignmentText7');
      console.log('[StackChildAlignmentTest_0100] layoutGravity7 is:' + JSON.stringify(JSON.parse(strJson7).$attrs.layoutGravity));
      let strJson8 = getInspectorByKey('AlignmentText8');
      console.log('[StackChildAlignmentTest_0100] layoutGravity8 is:' + JSON.stringify(JSON.parse(strJson8).$attrs.layoutGravity));
      let strJson9 = getInspectorByKey('AlignmentText9');
      console.log('[StackChildAlignmentTest_0100] layoutGravity9 is:' + JSON.stringify(JSON.parse(strJson9).$attrs.layoutGravity));
      
      expect(JSON.parse(strJson1).$attrs.layoutGravity).assertEqual('Alignment.TopStart');
      expect(JSON.parse(strJson2).$attrs.layoutGravity).assertEqual('Alignment.Top');
      expect(JSON.parse(strJson3).$attrs.layoutGravity).assertEqual('Alignment.TopEnd');
      expect(JSON.parse(strJson4).$attrs.layoutGravity).assertEqual('Alignment.Start');
      expect(JSON.parse(strJson5).$attrs.layoutGravity).assertEqual('Alignment.Center');
      expect(JSON.parse(strJson6).$attrs.layoutGravity).assertEqual('Alignment.End');
      expect(JSON.parse(strJson7).$attrs.layoutGravity).assertEqual('Alignment.BottomStart');
      expect(JSON.parse(strJson8).$attrs.layoutGravity).assertEqual('Alignment.Bottom');
      expect(JSON.parse(strJson9).$attrs.layoutGravity).assertEqual('Alignment.BottomEnd');
      
      console.info('[StackChildAlignmentTest_0100] END');
      done();
    });


  })
}