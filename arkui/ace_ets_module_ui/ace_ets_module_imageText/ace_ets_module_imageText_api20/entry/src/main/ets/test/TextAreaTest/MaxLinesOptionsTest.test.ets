/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function MaxLinesOptionsTest() {
  describe('MaxLinesOptionsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("MaxLinesOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/MaxLinesOptionsTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MaxLinesOptionsTest state success " + JSON.stringify(pages));
        if (!("MaxLinesOptionsTest" == pages.name)) {
          let result = await router.replaceUrl(options);
          console.info("get MaxLinesOptionsTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push MaxLinesOptionsTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MaxLinesOptionsTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(500);
      console.info("MaxLinesOptionsTest after each called");
    });

    /*
    * @tc.number       SUB_ACE_BASIC_MAX_LINES_OPTIONS_ETS_API_0001
    * @tc.name         MaxLinesOptionsTest0001
    * @tc.desc         test textArea maxLines options overflowMode is  CLIP
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('MaxLinesOptionsTest0001', Level.LEVEL1, async (done: Function) => {
      console.info('MaxLinesOptionsTest0001 START');
      let strJson1 = getInspectorByKey('TextAreaMaxLinesModeCLIP');
      let obj1: ESObject = JSON.parse(strJson1);
      console.log('TextAreaMaxLinesMode------' + obj1.$attrs.scrollable);
      expect(''+obj1.$attrs.scrollable).assertEqual('false');
      console.info("[MaxLinesOptionsTest0001] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_MAX_LINES_OPTIONS_ETS_API_0002
    * @tc.name         MaxLinesOptionsTest0002
    * @tc.desc         test textArea maxLines options overflowMode is  SCROLL
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        3
     */
    it('MaxLinesOptionsTest0002', Level.LEVEL3, async (done: Function) => {
      console.info('MaxLinesOptionsTest0002 START');
      let strJson2 = getInspectorByKey('TextAreaMaxLinesModeSCROLL');
      let obj2: ESObject = JSON.parse(strJson2);
      console.log('TextAreaMaxLinesMode------' + obj2.$attrs.scrollable);
      expect(''+obj2.$attrs.scrollable).assertEqual('true');
      console.info("[MaxLinesOptionsTest0002] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_MAX_LINES_OPTIONS_ETS_API_0003
    * @tc.name         MaxLinesOptionsTest0003
    * @tc.desc         test textArea maxLines options overflowMode is  no set
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        3
     */
    it('MaxLinesOptionsTest0003', Level.LEVEL3, async (done: Function) => {
      console.info('MaxLinesOptionsTest0003 START');
      let strJson3 = getInspectorByKey('TextAreaMaxLinesModeNoSet');
      let obj3: ESObject = JSON.parse(strJson3);
      console.log('TextAreaMaxLinesMode------' + obj3.$attrs.scrollable);
      expect(''+obj3.$attrs.scrollable).assertEqual('false');
      console.info("[MaxLinesOptionsTest0003] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_MAX_LINES_OPTIONS_ETS_API_0004
    * @tc.name         MaxLinesOptionsTest0004
    * @tc.desc         test textArea maxLines options overflowMode is  undefined
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        3
     */
    it('MaxLinesOptionsTest0004', Level.LEVEL3, async (done: Function) => {
      console.info('MaxLinesOptionsTest0004 START');
      let strJson4 = getInspectorByKey('TextAreaMaxLinesModeUndefined');
      let obj4: ESObject = JSON.parse(strJson4);
      console.log('TextAreaMaxLinesMode------' + obj4.$attrs.scrollable);
      expect(''+obj4.$attrs.scrollable).assertEqual('false');
      console.info("[MaxLinesOptionsTest0004] end");
      done();
    });
  })
}