/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';



export default function composeTitleBarTest() {
  describe('composeTitleBarTest', () => {
    beforeEach(async (done: Function) => {
      console.info('composeTitleBarTest beforeEach start');
      let opt: router.RouterOptions = {
        url: 'MainAbility/pages/composeTitleBar/composeTitleBarTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info(`get composeTitleBarTest state pages: ${JSON.stringify(pages)}`);
        if('composeTitleBarTest'!== pages.name) {
          console.info(`get composeTitleBarTest pages.name: ${JSON.stringify(pages.name)}`);
          await router.pushUrl(opt);
          await Utils.sleep(2000);
          console.info(`push composeTitleBarTest page result successful`);
        }
      } catch (err) {
        console.error(`push composeTitleBarTest page error: ${err}`);
      }

      await Utils.sleep(1000);
      console.info('composeTitleBarTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('composeTitleBarTest after each called');
    })

    /**
     * @tc.number composeTitleBarTest
     * @tc.name   testComposeTitleBar_0100
     * @tc.desc   Test composeTitleBar page
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testComposeTitleBar_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[testComposeTitleBar_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

    //查询ComposeTitleBar是否存在 以下信息的文本文字
      let  ComposeTitleBarItem1 = await driver.findComponent(ON.text('titleA'));
      let  ComposeTitleBarItem2 = await driver.findComponent(ON.text('subtitleA'));
      let  ComposeTitleBarItem3 = await driver.findComponent(ON.text('titleB'));
      let  ComposeTitleBarItem4 = await driver.findComponent(ON.text('subtitleB'));

      expect(ComposeTitleBarItem1!== null).assertTrue();
      expect(ComposeTitleBarItem2!== null).assertTrue();
      expect(ComposeTitleBarItem3!== null).assertTrue();
      expect(ComposeTitleBarItem4!== null).assertTrue();
      console.info('[testComposeTitleBar_0100] END');
      done();
    });

    /**
     * @tc.number composeTitleBarTest
     * @tc.name   testComposeTitleBar_0200
     * @tc.desc   Test composeTitleBar page
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testComposeTitleBar_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[testComposeTitleBar_0200] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let  ComposeTitleBarItem5 = await driver.findComponent(ON.text('titleC'));
      let  ComposeTitleBarItem6 = await driver.findComponent(ON.text('subtitleC'));
      let  ComposeTitleBarItem7 = await driver.findComponent(ON.text('titleD'));
      let  ComposeTitleBarItem8 = await driver.findComponent(ON.text('subtitleD'));

      expect(ComposeTitleBarItem5!== null).assertTrue();
      expect(ComposeTitleBarItem6!== null).assertTrue();
      expect(ComposeTitleBarItem7!== null).assertTrue();
      expect(ComposeTitleBarItem8!== null).assertTrue();
      console.info('[testComposeTitleBar_0200] END');
      done();
    });
  })
}