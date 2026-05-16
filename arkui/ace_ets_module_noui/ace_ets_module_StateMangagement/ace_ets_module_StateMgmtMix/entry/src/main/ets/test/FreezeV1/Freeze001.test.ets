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

import { Driver, ON, UIElementInfo } from '@ohos.UiTest';
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

export default function FreezeV1Test() {
  describe('FreezeV1Test', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FreezeV1/Freeze001',
      }
      try {
        router.clear();
        await sleep(1);
        let pages = router.getState();
        console.info("get Freeze001 state success " + JSON.stringify(pages));
        if (!("Freeze001" == pages.name)) {
          console.info("get Freeze001 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push Freeze001 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Freeze001 page error " + JSON.stringify(err));
      }
      await sleep(2)
    });

    afterEach(async () => {
      await sleep(1)
      console.info("Freeze001 after each called");
    });

    /**
     * @tc.name   FreezeV1Test01001
     * @tc.number FreezeV1Test01001
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FreezeV1Test01001', Level.LEVEL0, async (done: Function) => {
      console.info('FreezeV1Test01001 START');
      let driver = await Driver.create()
      let tvTab1 = await driver.findComponent(ON.text('tab1'));
      await tvTab1.click();
      await sleep(0.5)
      let btnChangeCount = await driver.findComponent(ON.id('btnChangeCount'));
      await btnChangeCount.click();
      await sleep(0.5)
      let tvCount = await (await driver.findComponent(ON.id('tvFreezeChangeCount01'))).getText();
      console.info('[FreezeV1Test01001] component tvCount: ' + tvCount);
      expect(tvCount).assertEqual('count1')
      let tvTab0 = await driver.findComponent(ON.text('tab0'));
      await tvTab0.click();
      await sleep(0.5)
      let tvCount1 = await (await driver.findComponent(ON.id('tvFreezeChangeCount01'))).getText();
      console.info('[FreezeV1Test01001] component tvCount1: ' + tvCount1);
      expect(tvCount1).assertEqual('count2')
      console.info('FreezeV1Test01001 END');
      done();
    });
  })
}
