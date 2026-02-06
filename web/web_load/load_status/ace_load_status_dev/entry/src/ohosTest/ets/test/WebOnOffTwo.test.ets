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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { Driver } from '@kit.TestKit';
import { waitForExist } from './WaitTest.test';

let emitKey = "emitOnOffTwo";
const driver = Driver.create();
export default function webOnOffTwoTest() {


  describe('webOnOffTwoTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebOnOffTwo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebAttributeTest state success " + JSON.stringify(pages));
        if (!("webOnOffTwo" == pages.name)) {
          console.info("get WebAttributeTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebAttributeTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebAttributeTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_EMITONOFFONETWO_0100
    * @tc.name        : emitOnOffTwo
    * @tc.desc        : test on normal
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */

    it('emitOnOffTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnOffTwo", 141341)
      let isReturn = false;
      Utils.registerEvent("emitOnOffTwo", true, 141380, ()=>{isReturn = true});
      Utils.waitAndClickComponent("OnOffTwoButton",driver)
      await waitForExist(()=>isReturn, "emitOnOffOne", true,1000);
      done();
    })
  })
}