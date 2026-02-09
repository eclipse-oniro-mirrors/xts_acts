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
    it('FreezeTest001', Level.LEVEL0, async () => {
      console.info('FreezeTest001 START');
      let driver = await Driver.create();
      let list1 = await driver.findComponent(ON.id('List'));
      let center1 = await list1.getBoundsCenter();
      await driver.mouseScroll(center1, false, 5, 2072, 0, 20);
      await sleep(1);

      let changeMessage = await driver.findComponent(ON.id('changeMessage'));
      await changeMessage.click();
      await sleep(1);

      await driver.mouseScroll(center1, true, 5, 2072, 0, 20);
      await sleep(1);

      let observer1 = await driver.createUIEventObserver();
      let callback1 = (uiElementInfo: UIElementInfo) => {
        try {
          expect(uiElementInfo.text == `FreezeChild message callback func 1, index: 0`).assertTrue()
          expect(uiElementInfo.type == 'Toast').assertTrue()
        } catch (err) {
          console.info(err)
        }
      }
      observer1.once('toastShow', callback1)
      console.info('FreezeTest001 END');
    });
  })
}
