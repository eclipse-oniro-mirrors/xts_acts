/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

export default function rowJsunit() {


  describe('rowTest', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row',
      }
      try {
        router.clear();
        await sleep(1);
        let pages = router.getState();
        console.info("get Row state success " + JSON.stringify(pages));
        if (!("Row" == pages.name)) {
          console.info("get Row state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push Row page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Row page error " + JSON.stringify(err));
      }
      await sleep(2)
    });

    afterEach(async () => {
      await sleep(1)
      console.info("Row after each called");
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0490
     * @tc.name rowTest001
     * @tc.desc aceEtsTest
     */
    it('rowTest001', 0, async () => {
      console.info('++++++++++++++++ Row TestCase 1 START ++++++++++++++++');
      await sleep(1)
      let strJson = getInspectorByKey('row');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("get inspector value is: " + JSON.stringify(obj));
      console.log(JSON.stringify(obj.$type))
      expect(obj.$type).assertEqual('Row')
      console.log('Row‘s useAlign is ' + JSON.stringify(JSON.parse(strJson).$attrs.useAlign))
      console.log('Row‘s space is ' + JSON.stringify(JSON.parse(strJson).$attrs.space))
      console.log('Row‘s alignItems is ' + JSON.stringify(JSON.parse(strJson).$attrs.alignItems))
      expect(JSON.parse(strJson).$attrs.alignItems).assertEqual('VerticalAlign.Top')
      console.info('++++++++++++++++ Row TestCase 1 End ++++++++++++++++');
    });
  })
}
