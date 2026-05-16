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

export default function navigationJsunit() {


  describe('navigationTest', () => {

    /**
     * run before testcase
     */
    beforeEach(async (done: Function) => {
      console.info('[navigationTest] before each called');
      await sleep(1);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/Navigation',
      };
      try {
        router.clear();
        let result = router.pushUrl(options);
        console.info("push navigation page success " + JSON.stringify(result));
      } catch (err) {
        console.info("push navigation page error " + JSON.stringify(err));
      }
      await sleep(1);
      done();
    });

    /**
     * run after testcase
     */
    afterEach(async () => {
      console.info('[navigationTest] after each called');
      router.clear();
      await sleep(1)
    });

    /**
     * @tc.name   testNavigation010
     * @tc.number testNavigation010
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNavigation010',  Level.LEVEL0, async (done: Function) => {
      console.info('testNavigation010 START');
      let strJson: string = getInspectorByKey('navigation1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[navigation1] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('Navigation');
      expect(obj.$attrs.title).assertEqual('title');
      expect(obj.$attrs.hideBackButton).assertFalse();
      expect(obj.$attrs.hideTitleBar).assertFalse();
      console.info('testNavigation010 End');
      done();
    });


    /**
     * @tc.name   testNavigation020
     * @tc.number testNavigation020
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNavigation020',  Level.LEVEL0, async (done: Function) => {
      console.info('testNavigation020 START');
      let strJson: string = getInspectorByKey('navigation2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[navigation2] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('Navigation');
      expect(obj.$attrs.hideTitleBar).assertTrue();
      expect(obj.$attrs.hideBackButton).assertTrue();
      console.info('testNavigation020 End');
      done();
    });
  })
}
