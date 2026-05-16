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

import { UIElementInfo, Driver, ON, } from '@ohos.UiTest';
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

export default function FreezeV1Test02() {
  describe('FreezeV1Test02', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FreezeV1/Freeze002',
      }
      try {
        router.clear();
        await sleep(1);
        let pages = router.getState();
        console.info("get Freeze002 state success " + JSON.stringify(pages));
        if (!("Freeze002" == pages.name)) {
          console.info("get Freeze002 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push Freeze002 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Freeze002 page error " + JSON.stringify(err));
      }
      await sleep(2)
    });

    afterEach(async () => {
      await sleep(1)
      console.info("Freeze002 after each called");
    });

    /**
     * @tc.name   FreezeTest001
     * @tc.number Freeze002_001
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FreezeTest001', Level.LEVEL0, async (done: Function) => {
      console.info('FreezeV1Test02001 START');
      await sleep(1)
      let driver = await Driver.create()
      await sleep(1);
      let btnToBottom = await driver.findComponent(ON.id('btnToBottom'));
      await btnToBottom.click();
      await sleep(1);
      let btnChangeMsg = await driver.findComponent(ON.id('btnChangeMsg'));
      await btnChangeMsg.click();
      await sleep(1);
      let tvCount = await (await driver.findComponent(ON.id('tvFreezeChangeCount'))).getText();
      console.info('[FreezeV1Test02001] component tvCount: ' + tvCount);
      expect(tvCount).assertEqual('count5')
      let btnToTop = await driver.findComponent(ON.id('btnToTop'));
      await btnToTop.click();
      await sleep(1);
      let tvCount1 = await (await driver.findComponent(ON.id('tvFreezeChangeCount'))).getText();
      console.info('[FreezeV1Test02001] component tvCount1: ' + tvCount1);
      expect(tvCount1).assertEqual('count8')
      console.info('FreezeV1Test02001 END');
      done();
    });
  })
}
