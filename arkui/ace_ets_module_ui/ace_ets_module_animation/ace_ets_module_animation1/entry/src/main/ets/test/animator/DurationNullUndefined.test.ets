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
import { Driver, ON} from '@ohos.UiTest';

export default function DurationNullUndefinedTest() {
  describe('DurationNullUndefinedTest', () => {

    beforeEach(async (done: Function) => {
      console.info("DurationNullUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/animator/DurationNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DurationNullUndefined state pages:" + JSON.stringify(pages));
        if (!("DurationNullUndefined" == pages.name)) {
          console.info("get DurationNullUndefined state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push DurationNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DurationNullUndefined page error:" + err);
      }
      done()
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("DurationNullUndefined after each called");
    });

    /**
     * @tc.name   DurationNullUndefined_0100
     * @tc.number DurationNullUndefined_0100
     * @tc.desc   Test SimpleAnimatorOptions duration method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('DurationNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[DurationNullUndefined_0100] START');
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
        console.info('[DurationNullUndefined_0100] SimpleAnimatorOptions with null duration created');
        await CommonFunc.sleep(1000);
      } catch (error) {
        console.info('[DurationNullUndefined_0100] error: ' + JSON.stringify(error));
      }
      console.info('[DurationNullUndefined_0100] END');
    })

    /**
     * @tc.name   DurationNullUndefined_0200
     * @tc.number DurationNullUndefined_0200
     * @tc.desc   Test SimpleAnimatorOptions duration method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('DurationNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[DurationNullUndefined_0200] START');
      try {
        await CommonFunc.sleep(1000)
        let driver = await Driver.create()
        await CommonFunc.sleep(1000);
        let button = await driver.findComponent(ON.text('createUndefined'));
        await button.click();
        await CommonFunc.sleep(1000);
        let button2 = await driver.findComponent(ON.text('playUndefined'));
        await button2.click();
        await CommonFunc.sleep(1100);
        let flag: boolean | undefined = AppStorage.get('flag')
        expect(flag).assertTrue();
        AppStorage.delete('flag')
        console.info('[DurationNullUndefined_0100] SimpleAnimatorOptions with null duration created');
        await CommonFunc.sleep(1000);
        console.info('[DurationNullUndefined_0200] SimpleAnimatorOptions with undefined duration created');
      } catch (error) {
        console.info('[DurationNullUndefined_0200] error: ' + JSON.stringify(error));
      }

      console.info('[DurationNullUndefined_0200] END');
    })
  })
}
