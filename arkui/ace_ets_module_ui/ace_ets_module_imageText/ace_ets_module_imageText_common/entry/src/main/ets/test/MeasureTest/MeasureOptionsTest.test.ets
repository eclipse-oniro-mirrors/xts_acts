/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function MeasureOptionsTest() {
  describe('MeasureOptionsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("MeasureOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Measure/MeasureOptionsTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MeasureOptionsTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("MeasureOptionsTest" == pages.name)) {
          console.info("get MeasureOptionsTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push MeasureOptionsTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MeasureOptionsTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("MeasureOptionsTest after each called");
    });

    /**
     * @tc.name   measureOptionsTest0001
     * @tc.number SUB_ACE_BASIC_ETS_API_measureOptionsTest0001
     * @tc.desc   get  SizeOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('measureOptionsTest0001', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('SizeOptions measureOptionsTest0001 START');
      await CommonFunc.sleep(1000);
      let get = await driver.findComponent(ON.id('getWidthAndHeight'))
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);
      let textStyle1Width :number = AppStorage.get('textStyle1Width') as number
      expect(textStyle1Width > 0).assertTrue();
      let textStyle1Height :number = AppStorage.get('textStyle1Height') as number
      expect(textStyle1Height > 0).assertTrue();
      let textStyle2Width :number = AppStorage.get('textStyle2Width') as number
      expect(textStyle2Width > 0).assertTrue();
      let textStyle2Height :number = AppStorage.get('textStyle2Height') as number
      expect(textStyle2Height > 0).assertTrue();
      let textStyle3Width :number = AppStorage.get('textStyle3Width') as number
      expect(textStyle3Width > 0).assertTrue();
      let textStyle3WHeight :number = AppStorage.get('textStyle3WHeight') as number
      expect(textStyle3WHeight > 0).assertTrue();
      AppStorage.delete('textStyle1Width')
      AppStorage.delete('textStyle1Height')
      AppStorage.delete('textStyle2Width')
      AppStorage.delete('textStyle2Width')
      AppStorage.delete('textStyle3Width')
      AppStorage.delete('textStyle3Height')
      console.info("[measureOptionsTest0001] end");
      done();
    });
  })
}