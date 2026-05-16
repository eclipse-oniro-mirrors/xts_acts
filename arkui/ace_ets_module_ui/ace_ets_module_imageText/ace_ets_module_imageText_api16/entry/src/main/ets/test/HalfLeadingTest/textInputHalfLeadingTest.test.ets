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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import { Driver, ON} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function textInputHalfLeadingTest() {
  describe('textInputHalfLeadingTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/HalfLeadingTest/textInputHalfLeadingTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInputHalfLeadingTest state success " + JSON.stringify(pages));
        if (!("textInputHalfLeadingTest" == pages.name)) {
          console.info("get textInputHalfLeadingTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push textInputHalfLeadingTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textInputHalfLeadingTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textInputHalfLeadingTest after each called");
    });

    /**
     * @tc.name   textInputHalfLeadingTest0001
     * @tc.number SUB_ACE_BASIC_ETS_API_0001
     * @tc.desc   textInputHalfLeadingTest0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textInputHalfLeadingTest0001',  Level.LEVEL0, async () => {
        let driver = Driver.create();
        console.info('textInputHalfLeadingTest textInputHalfLeadingTest0001 START');
        await CommonFunc.sleep(1000);
        let input1 = getInspectorByKey('input1');
        let obj: ESObject = JSON.parse(input1);
        console.log('textInputHalfLeadingTest0001---' + obj.$attrs.halfLeading)
        expect(obj.$attrs.halfLeading).assertEqual(true);
        console.info("[textInputHalfLeadingTest0001] end");
    });
	
    /**
     * @tc.name   textInputHalfLeadingTest0002
     * @tc.number SUB_ACE_BASIC_ETS_API_0002
     * @tc.desc   textInputHalfLeadingTest0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textInputHalfLeadingTest0002',  Level.LEVEL0, async () => {
        let driver = Driver.create();
        console.info('textInputHalfLeadingTest textInputHalfLeadingTest0002 START');
        await CommonFunc.sleep(1000);
        let input2 = getInspectorByKey('input2');
        let obj: ESObject = JSON.parse(input2);
        console.log('textInputHalfLeadingTest0002---' + obj.$attrs.halfLeading)
        expect(obj.$attrs.halfLeading).assertEqual(false);
        console.info("[textInputHalfLeadingTest0002] end");
    });
	
    /**
     * @tc.name   textInputHalfLeadingTest0003
     * @tc.number SUB_ACE_BASIC_ETS_API_0003
     * @tc.desc   textInputHalfLeadingTest0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textInputHalfLeadingTest0003',  Level.LEVEL0, async () => {
        let driver = Driver.create();
        console.info('textInputHalfLeadingTest textInputHalfLeadingTest0003 START');
        await CommonFunc.sleep(1000);
        let input3 = getInspectorByKey('input3');
        let obj: ESObject = JSON.parse(input3);
        console.log('textInputHalfLeadingTest0003---' + obj.$attrs.halfLeading)
        expect(obj.$attrs.halfLeading).assertEqual(false);
        console.info("[textInputHalfLeadingTest0003] end");
    });
	
    /**
     * @tc.name   textInputHalfLeadingTest0004
     * @tc.number SUB_ACE_BASIC_ETS_API_0004
     * @tc.desc   textInputHalfLeadingTest0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textInputHalfLeadingTest0004',  Level.LEVEL0, async () => {
        let driver = Driver.create();
        console.info('textInputHalfLeadingTest textInputHalfLeadingTest0004 START');
        await CommonFunc.sleep(1000);
        let input4 = getInspectorByKey('input4');
        let obj: ESObject = JSON.parse(input4);
        console.log('textInputHalfLeadingTest0004---' + obj.$attrs.halfLeading)
        expect(obj.$attrs.halfLeading).assertEqual(false);
        console.info("[textInputHalfLeadingTest0004] end");
    });
	
  })
}
