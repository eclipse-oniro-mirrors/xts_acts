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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok")
    }, time * 1000)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function propJsunit() {


  describe('propTest', () => {

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/Prop',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Prop state success " + JSON.stringify(pages));
        if (!("Prop" == pages.name)) {
          console.info("get Prop state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push Prop page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Prop page error " + JSON.stringify(err));
      }
      await sleep(2)
    });

    afterEach(async () => {
      await sleep(1)
      console.info("Prop after each called");
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0470
     * @tc.name propTest001
     * @tc.desc aceEtsTest
     */
    it('propTest001', 0, async () => {
      console.info('propTest001 START');
      await sleep(1)
      let strJson = getInspectorByKey('Text001');
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      console.log(JSON.stringify(obj.$type))
      console.log("cd attrs.conten type1" + typeof ("10"))
      console.log("yr prop0 content-'10'" + JSON.parse(strJson).$attrs.content)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("10");
      console.info('propTest001 END');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0480
     * @tc.name propTest001
     * @tc.desc aceEtsTest
     */
    it('propTest002', 0, async () => {
      console.info('propTest002 START');
      let strJson = getInspectorByKey('Text002');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.log("cd attrs.conten type" + typeof (JSON.parse(strJson).$attrs.content))
      console.log("cd attrs.conten type1 " + typeof ("10"))
      expect(JSON.parse(strJson).$attrs.content).assertEqual("10");
      console.log("cd prop0 content-'10'" + JSON.stringify(JSON.parse(strJson).$attrs.content))
      console.info('propTest002 END');
    });
  })
}
