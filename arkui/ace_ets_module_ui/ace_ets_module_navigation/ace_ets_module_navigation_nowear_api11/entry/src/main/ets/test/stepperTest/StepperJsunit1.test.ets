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


import { afterEach, describe, expect, it, Level } from '@ohos/hypium';
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


export default function stepperJsunit1() {


  describe('stepperTest', () => {

    /**
     * run after testcase
     */
    afterEach(async () => {
      console.info('[stepperTest] after each called');
      router.clear();
      await sleep(1);
    });


    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1400
     * @tc.name testStepper010
     * @tc.desc aceEtsTest
     */
    it('testStepper010',  Level.LEVEL0, async (done: Function) => {
      console.info('testStepper010 START');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stepper/Stepper1',
      }
      try {
        let result = await router.push(options)
        console.info("push stepper page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push stepper page error " + JSON.stringify(err));
      }
      await sleep(1);
      let strJson: string = getInspectorByKey('stepper');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[stepper] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('Stepper');
      expect(obj.$attrs.index).assertEqual('0');
      console.info('testStepper010 End');
      done();
    });
  })
}
