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

export default function linkJsunit() {


  describe('linkTest', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Link/Link',
      }
      try {
        router.clear();
        await sleep(1);
        let pages = router.getState();
        console.info("get Link state success " + JSON.stringify(pages));
        if (!("Link" == pages.name)) {
          console.info("get Link state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push Link page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Link page error " + JSON.stringify(err));
      }
      await sleep(2)
    });

    afterEach(async () => {
      await sleep(1)
      console.info("Link after each called");
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0370
     * @tc.name linkTest001
     * @tc.desc aceEtsTest
     */
    it('linkTest001', Level.LEVEL0, async () => {
      console.info('linkTest001 START');
      await sleep(1)
      let strJson = getInspectorByKey('Button');
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Button');
      console.log(JSON.stringify(obj.$type))
      console.info("yr link0 type: " + JSON.stringify(obj.$type));
      console.info("component obj is: " + JSON.stringify(obj));
      expect(JSON.parse(strJson).$attrs.stateEffect).assertEqual('false');
      console.log("yr link0 stateEffect-'false'" + JSON.stringify(JSON.parse(strJson).$attrs.stateEffect))
      console.info('linkTest001 END');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0380
     * @tc.name linkTest001
     * @tc.desc aceEtsTest
     */
    it('linkTest002', Level.LEVEL0, async () => {
      console.info('linkTest002 START');
      let strJson = getInspectorByKey('Button1');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(JSON.parse(strJson).$attrs.stateEffect).assertEqual('false');
      console.log("yr link1 stateEffect-'false'" + JSON.stringify(JSON.parse(strJson).$attrs.stateEffect))
      console.info('linkTest002 END');
    });
  })
}
