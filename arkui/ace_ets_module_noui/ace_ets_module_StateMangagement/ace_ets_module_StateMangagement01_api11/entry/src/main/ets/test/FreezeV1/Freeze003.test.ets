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

import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  UIElementInfo
} from '@ohos.UiTest';
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

export default function FreezeV1Test03() {
  describe('FreezeV1Test03', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FreezeV1/Freeze003',
      }
      try {
        router.clear();
        await sleep(1);
        let pages = router.getState();
        console.info("get Freeze003 state success " + JSON.stringify(pages));
        if (!("Freeze003" == pages.name)) {
          console.info("get Freeze003 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push Freeze003 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Freeze003 page error " + JSON.stringify(err));
      }
      await sleep(2)
    });

    afterEach(async () => {
      await sleep(1)
      console.info("Freeze003 after each called");
    });

    /**
     * @tc.number Freeze003_001
     * @tc.name Freeze001
     * @tc.desc aceEtsTest
     */
    it('FreezeTest001', Level.LEVEL0, async () => {
      console.info('FreezeTest001 START');
      let driver = await Driver.create();

      let changeMessage = await driver.findComponent(ON.id('changeMessage'));
      await changeMessage.click();

      let nextPage0 = await driver.findComponent(ON.id('NextPage0'));
      await nextPage0.click();
      await sleep(1);
      await changeMessage.click();

      let observer1 = await driver.createUIEventObserver()
      let callback1 = (UiElementInfo: UIElementInfo) => {
        try {
          expect(UiElementInfo.text == 'NavigationContent message:2 index:1 logNumber:1').assertTrue()
          expect(UiElementInfo.type == 'Toast').assertTrue()
        } catch (err) {
          console.info(err)
        }
      }
      observer1.once('toastShow', callback1)

      console.info('FreezeTest001 END');
    });

    /**
     * @tc.number Freeze003_002
     * @tc.name Freeze002
     * @tc.desc aceEtsTest
     */
    it('FreezeTest002', Level.LEVEL0, async () => {
      console.info('FreezeTest002 START');
      let driver = await Driver.create();
      let nextPage1 = await driver.findComponent(ON.id('NextPage1'));
      await nextPage1.click();
      await sleep(1);

      let changeMessage = await driver.findComponent(ON.id('changeMessage'));
      await changeMessage.click();

      let observer1 = await driver.createUIEventObserver()
      let callback1 = (UiElementInfo: UIElementInfo) => {
        try {
          expect(UiElementInfo.text == 'NavigationContent message:3 index:2 logNumber:2').assertTrue()
          expect(UiElementInfo.type == 'Toast').assertTrue()
        } catch (err) {
          console.info(err)
        }
      }
      observer1.once('toastShow', callback1)

      console.info('FreezeTest002 END');
    });

    /**
     * @tc.number Freeze003_003
     * @tc.name Freeze003_003
     * @tc.desc aceEtsTest
     */
    it('FreezeTest003', Level.LEVEL0, async () => {
      console.info('FreezeTest003 START');
      let driver = await Driver.create();
      let nextPage2 = await driver.findComponent(ON.id('NextPage2'));
      await nextPage2.click();
      await sleep(1);

      let changeMessage = await driver.findComponent(ON.id('changeMessage'));
      await changeMessage.click();

      let observer1 = await driver.createUIEventObserver()
      let callback1 = (UiElementInfo: UIElementInfo) => {
        try {
          expect(UiElementInfo.text == 'NavigationContent message:4 index:3 logNumber:3').assertTrue()
          expect(UiElementInfo.type == 'Toast').assertTrue()
        } catch (err) {
          console.info(err)
        }
      }
      observer1.once('toastShow', callback1)

      console.info('FreezeTest003 END');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0004
     * @tc.name Freeze004
     * @tc.desc aceEtsTest
     */
    it('FreezeTest004', Level.LEVEL0, async () => {
      console.info('FreezeTest004 START');
      let driver = await Driver.create();
      let backPage3 = await driver.findComponent(ON.id('BackPage3'));
      await backPage3.click();
      await sleep(1);

      let observer1 = await driver.createUIEventObserver()
      let callback1 = (UiElementInfo: UIElementInfo) => {
        try {
          expect(UiElementInfo.text == 'NavigationContent message:4 index:2 logNumber:4').assertTrue()
          expect(UiElementInfo.type == 'Toast').assertTrue()
        } catch (err) {
          console.info(err)
        }
      }
      observer1.once('toastShow', callback1)

      console.info('FreezeTest004 END');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0005
     * @tc.name Freeze005
     * @tc.desc aceEtsTest
     */
    it('FreezeTest005', Level.LEVEL0, async () => {
      console.info('FreezeTest005 START');
      let driver = await Driver.create();
      let backPage2 = await driver.findComponent(ON.id('BackPage2'));
      await backPage2.click();
      await sleep(1);

      let observer1 = await driver.createUIEventObserver()
      let callback1 = (UiElementInfo: UIElementInfo) => {
        try {
          expect(UiElementInfo.text == 'NavigationContent message:4 index:1 logNumber:5').assertTrue()
          expect(UiElementInfo.type == 'Toast').assertTrue()
        } catch (err) {
          console.info(err)
        }
      }
      observer1.once('toastShow', callback1);
      console.info('FreezeTest005 END');
    });
  })
}
