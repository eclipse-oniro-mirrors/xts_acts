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
     * @tc.number Freeze001_001
     * @tc.name Freeze001_001
     * @tc.desc aceEtsTest
     */
    it('FreezeTest001', 0, async () => {
      console.info('FreezeTest001 START');
      let driver = await Driver.create()
      let changeIndex = await driver.findComponent(ON.id('changeIndex'));
      await changeIndex.click();
      await sleep(0.5)

      let changeMessage = await driver.findComponent(ON.id('changeMessage'));
      await changeMessage.click();
      await sleep(0.5)

      let observer1 = await driver.createUIEventObserver()
      let callback1 = (uiElementInfo: UIElementInfo) => {
        try {
          expect(uiElementInfo.text == 'FreezeChild message callback func 1, index: 1').assertTrue()
          expect(uiElementInfo.type == 'Toast').assertTrue()
        } catch (err) {
          console.info(err)
        }
      }
      observer1.once('toastShow', callback1)
      console.info('FreezeTest001 END');
    });


    /**
     * @tc.number Freeze001_002
     * @tc.name Freeze001_002
     * @tc.desc aceEtsTest
     */
    it('FreezeTest002', 0, async () => {
      console.info('FreezeTest002 START');
      let driver = await Driver.create()
      let changeIndex0 = await driver.findComponent(ON.id('changeIndex0'));
      await changeIndex0.click();
      await sleep(0.5)

      let observer1 = await driver.createUIEventObserver()
      let callback1 = (uiElementInfo: UIElementInfo) => {
        try {
          expect(uiElementInfo.text == 'TabContent message callback func 1').assertTrue()
          expect(uiElementInfo.type == 'Toast').assertTrue()
        } catch (err) {
          console.info(err)
        }
      }
      observer1.once('toastShow', callback1)
      console.info('FreezeTest002 END');
    });
  })
}
