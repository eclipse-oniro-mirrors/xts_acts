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

import { afterEach, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import router from '@ohos.router';

function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve();
    }, time * 1000);
  }).then(() => {
    console.info(`sleep ${time} over...`);
  })
}

export default function blankJsunit() {
  describe('BlankTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Blank/Blank',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Blank state success " + JSON.stringify(pages));
        if (!("Blank" == pages.name)) {
          console.info("get Blank state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push Blank page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Blank page error " + JSON.stringify(err));
      }
      await sleep(2);
      done();
    });

    afterEach(async () => {
      await sleep(1);
      console.info("Blank after each called");
    });

    /**
     * @tc.name   BlankGetInspectorByKey
     * @tc.number SUB_ACE_BASIC_ETS_API_0630
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BlankGetInspectorByKey',  Level.LEVEL0, async (done: Function) => {
      let strJson = getInspectorByKey('BlankTest_blank');
      let obj: ESObject = JSON.parse(strJson);
      console.info("cd blank component obj is: " + JSON.stringify(obj));
      console.log("cd blank type" + JSON.stringify(obj.$type));
      console.log("cd blank min" + JSON.stringify(obj.$attrs.min));
      console.log("cd blank color" + JSON.stringify(obj.$attrs.color));
      expect(obj.$type).assertEqual('Blank');
      expect(obj.$attrs.min).assertEqual('100.00vp');
      console.info('cd BlankGetInspectorByKey END');
      done();
    });

  })
}
