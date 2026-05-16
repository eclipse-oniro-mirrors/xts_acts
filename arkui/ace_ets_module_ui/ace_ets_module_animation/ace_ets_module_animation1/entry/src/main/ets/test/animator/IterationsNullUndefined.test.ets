/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../MainAbility/utils/Common';
import { Driver, ON } from '@ohos.UiTest';

export default function IterationsNullUndefinedTest() {
  describe('IterationsNullUndefinedTest', () => {

    beforeEach(async (done: Function) => {
      console.info("IterationsNullUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/animator/IterationsNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get IterationsNullUndefined state pages:" + JSON.stringify(pages));
        if (!("IterationsNullUndefined" == pages.name)) {
          console.info("get IterationsNullUndefined state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push IterationsNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push IterationsNullUndefined page error:" + err);
      }
      done()
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("IterationsNullUndefined after each called");
    });

    /**
     * @tc.name   IterationsNullUndefined_0100
     * @tc.number SUB_ARKUI_SIMPLEANIMATOR_ITERATIONS_NULL_0100
     * @tc.desc   Test SimpleAnimatorOptions iterations method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('IterationsNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[IterationsNullUndefined_0100] START');
      try {
        await CommonFunc.sleep(1000)
        let driver = await Driver.create()
        await CommonFunc.sleep(1000);
        let button = await driver.findComponent(ON.text('create'));
        await button.click();
        await CommonFunc.sleep(1000);
        let button2 = await driver.findComponent(ON.text('play'));
        await button2.click();
        await CommonFunc.sleep(1100);
        let flag: boolean | undefined = AppStorage.get('flag')
        expect(flag).assertTrue();
        AppStorage.delete('flag')
        console.info('[IterationsNullUndefined_0100] SimpleAnimatorOptions with undefined iterations created');
        await CommonFunc.sleep(1000);
      } catch (error) {
        console.info('[IterationsNullUndefined_0100] error: ' + JSON.stringify(error));
      }
      console.info('[IterationsNullUndefined_0100] END');
    })

    /**
     * @tc.name   IterationsNullUndefined_0200
     * @tc.number SUB_ARKUI_SIMPLEANIMATOR_ITERATIONS_NULL_0200
     * @tc.desc   Test SimpleAnimatorOptions iterations method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('IterationsNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[IterationsNullUndefined_0200] START');
      try {
        await CommonFunc.sleep(1000)
        let driver = await Driver.create()
        await CommonFunc.sleep(1000);
        let button = await driver.findComponent(ON.text('createNull'));
        await button.click();
        await CommonFunc.sleep(1000);
        let button2 = await driver.findComponent(ON.text('playNull'));
        await button2.click();
        await CommonFunc.sleep(1100);
        let flag: boolean | undefined = AppStorage.get('flag')
        expect(flag).assertTrue();
        AppStorage.delete('flag')
        console.info('[IterationsNullUndefined_0200] SimpleAnimatorOptions with null iterations created');
        await CommonFunc.sleep(1000);
        console.info('[IterationsNullUndefined_0200] SimpleAnimatorOptions with undefined iterations created');
      } catch (error) {
        console.info('[IterationsNullUndefined_0200] error: ' + JSON.stringify(error));
      }

      console.info('[IterationsNullUndefined_0200] END');
    })
  })
}
