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

export default function FreezeV2Test03() {
  describe('FreezeV2Test03', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FreezeV2/Freeze002',
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
     * @tc.name   FreezeTest001
     * @tc.number SUB_ACE_BASIC_ETS_API_0001
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FreezeTest001', Level.LEVEL1, async () => {
      console.info('FreezeTest001 START');
      let driver = await Driver.create();
      let changeMessage = await driver.findComponent(ON.id('changeMessage'));
      await changeMessage.click();
      let nextPage0 = await driver.findComponent(ON.id('NextPage0'));
      await nextPage0.click();
      await sleep(1);
      await changeMessage.click();
      await sleep(1);
      let text1 = await (await driver.findComponent(ON.id('Freeze002_text1'))).getText();
      expect(text1).assertEqual('NavigationContent message:2 index:1, logNum: 1');
      //跳转页面3，修改message，预期不触发导航2页面的监听方法，通过logNum作为标识
      let nextPage1 = await driver.findComponent(ON.id('NextPage1'));
      await nextPage1.click();
      await sleep(1);
      await changeMessage.click();
      await sleep(1);
      await changeMessage.click();
      await sleep(1);
      //上一个页面的监听函数未触发
      let text2 = await (await driver.findComponent(ON.id('logNum_FreezeV2002'))).getText();
      expect(text2).assertEqual('3');
      //返回上一页面，监听函数触发
      let backPage2 = await driver.findComponent(ON.id('BackPage2'));
      await backPage2.click();
      await sleep(1);
      let text3 = await (await driver.findComponent(ON.id('logNum_FreezeV2002'))).getText();
      expect(text3).assertEqual('4');
      console.info('FreezeTest001 END');
    });
  })
}
