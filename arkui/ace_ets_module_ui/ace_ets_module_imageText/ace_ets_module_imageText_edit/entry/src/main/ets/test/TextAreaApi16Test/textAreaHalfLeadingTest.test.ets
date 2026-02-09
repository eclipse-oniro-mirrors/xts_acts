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

export default function textAreaHalfLeadingTest() {
  describe('textAreaHalfLeadingTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextAreaApi16/textAreaHalfLeading',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textAreaHalfLeadingTest state success " + JSON.stringify(pages));
        if (!("textAreaHalfLeading" == pages.name)) {
          console.info("get textAreaHalfLeadingTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push textAreaHalfLeadingTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textAreaHalfLeadingTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textAreaHalfLeadingTest after each called");
    });

    /**
     * @tc.name   textAreaHalfLeadingTest0001
     * @tc.number textAreaHalfLeadingTest0001
     * @tc.desc   Test textAreaHalfLeadingTest Normal value :true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaHalfLeadingTest0001', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaHalfLeadingTest textAreaHalfLeadingTest0001 START');
        await CommonFunc.sleep(1000);
        let area1 = getInspectorByKey('area1');
        let obj: ESObject = JSON.parse(area1);
        console.log('textAreaHalfLeadingTest0001---' + obj.$attrs.halfLeading)
        expect(obj.$attrs.halfLeading).assertEqual(true);
        console.info("[textAreaHalfLeadingTest0001] end");
    });
	
    /**
     * @tc.name   textAreaHalfLeadingTest0002
     * @tc.number textAreaHalfLeadingTest0002
     * @tc.desc   Test textAreaHalfLeadingTest Normal value :false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaHalfLeadingTest0002', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaHalfLeadingTest textAreaHalfLeadingTest0002 START');
        await CommonFunc.sleep(1000);
        let area2 = getInspectorByKey('area2');
        let obj: ESObject = JSON.parse(area2);
        console.log('textAreaHalfLeadingTest0002---' + obj.$attrs.halfLeading)
        expect(obj.$attrs.halfLeading).assertEqual(false);
        console.info("[textAreaHalfLeadingTest0002] end");
    });
	
    /**
     * @tc.name   textAreaHalfLeadingTest0003
     * @tc.number textAreaHalfLeadingTest0003
     * @tc.desc   Test textAreaHalfLeadingTest abnormal value :undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaHalfLeadingTest0003', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaHalfLeadingTest textAreaHalfLeadingTest0003 START');
        await CommonFunc.sleep(1000);
        let area3 = getInspectorByKey('area3');
        let obj: ESObject = JSON.parse(area3);
        console.log('textAreaHalfLeadingTest0003---' + obj.$attrs.halfLeading)
        expect(obj.$attrs.halfLeading).assertEqual(false);
        console.info("[textAreaHalfLeadingTest0003] end");
    });
	
    /**
     * @tc.name   textAreaHalfLeadingTest0004
     * @tc.number textAreaHalfLeadingTest0004
     * @tc.desc   Test textAreaHalfLeadingTest abnormal value :null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaHalfLeadingTest0004', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaHalfLeadingTest textAreaHalfLeadingTest0004 START');
        await CommonFunc.sleep(1000);
        let area4 = getInspectorByKey('area4');
        let obj: ESObject = JSON.parse(area4);
        console.log('textAreaHalfLeadingTest0004---' + obj.$attrs.halfLeading)
        expect(obj.$attrs.halfLeading).assertEqual(false);
        console.info("[textAreaHalfLeadingTest0004] end");
    });
  })
}
