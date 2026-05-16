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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router'
import CommonFunc from '../../MainAbility/common/Common';

export default function stepperItemJsunit() {
    describe('stepperItemJsunit', () => {
      beforeEach(async (done: Function) => {
        console.info("stepperItemJsunit beforeEach start");
        let options: router.RouterOptions = {
          url: 'MainAbility/pages/stepper/stepperItem2',
        }
        let result: ESObject;
        try {
          router.clear();
          let pages = router.getState();
          console.info("get stepperItem2 state pages: " + JSON.stringify(pages));
          if (!("stepperItem2" == pages.name)) {
            console.info("get stepperItem2 state pages.name: " + JSON.stringify(pages.name));
            result = await router.push(options);
            await CommonFunc.sleep(2000);
            console.info("push stepperItem2 page result: " + JSON.stringify(result));
          }
        } catch (err) {
          console.error("push stepperItem2 page error: " + err);
        }
        done()
      })

    /**
     * @tc.name   sArkUX_Stage_StepperItem_0100
     * @tc.number sArkUX_Stage_StepperItem_0100
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sArkUX_Stage_StepperItem_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[sArkUX_Stage_StepperItem_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('nextLabel1');
          let obj: ESObject = JSON.parse(strJson);
          console.info("----sArkUX_Stage_StepperItem_0100 is" + JSON.stringify(obj.$attrs.nextLabel));
          expect(obj.$attrs.nextLabel).assertEqual("textLabel");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('sArkUX_Stage_StepperItem_0100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })
  })
}
