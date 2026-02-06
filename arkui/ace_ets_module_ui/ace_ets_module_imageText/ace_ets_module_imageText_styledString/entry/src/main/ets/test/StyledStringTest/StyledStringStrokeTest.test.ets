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

export default function StyledStringStrokeTest() {
  describe('StyledStringStrokeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("StyledStringStrokeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/StyledStringStrokeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StyledStringStrokeTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        await CommonFunc.sleep(1000);
        if (!("StyledStringStrokeTest" == pages.name)) {
          console.info("get StyledStringStrokeTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push StyledStringStrokeTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StyledStringStrokeTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("StyledStringStrokeTest after each called");
    });

    /**
     * @tc.name   StyledStringStrokeTest0001
     * @tc.number SUB_ACE_BASIC_ETS_STYLED_STRING_STROKE_API_0001
     * @tc.desc   set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('StyledStringStrokeTest0001', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('StyledStringStrokeTest0001 START');
      let spanStyle1 = await driver.findComponent(ON.id('spanStyle1StyledStringStroke'))
      await CommonFunc.sleep(500);
      await spanStyle1.click()
      let getStyles = await driver.findComponent(ON.id('getStylesStyledStringStroke'))
      await CommonFunc.sleep(500);
      await getStyles.click()
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('StyledStringStrokeWidth')).assertEqual('0');
      expect(''+AppStorage.get('StyledStringStrokeColor')).assertEqual('#FFFFC0CB');
      AppStorage.delete('StyledStringStrokeWidth')
      AppStorage.delete('StyledStringStrokeColor')
      console.info("[StyledStringStrokeTest0001] end");
      done();
    });

    /**
     * @tc.name   StyledStringStrokeTest0002
     * @tc.number SUB_ACE_BASIC_ETS_STYLED_STRING_STROKE_API_0002
     * @tc.desc   set Normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('StyledStringStrokeTest0002', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('StyledStringStrokeTest0002 START');
      let spanStyle2 = await driver.findComponent(ON.id('spanStyle2StyledStringStroke'))
      await CommonFunc.sleep(500);
      await spanStyle2.click()
      await CommonFunc.sleep(500);
      let getStyles = await driver.findComponent(ON.id('getStylesStyledStringStroke'))
      await CommonFunc.sleep(500);
      await getStyles.click()
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('StyledStringStrokeWidth')).assertEqual('5');
      expect(''+AppStorage.get('StyledStringStrokeColor')).assertEqual('#FF125AD6');
      AppStorage.delete('StyledStringStrokeWidth')
      AppStorage.delete('StyledStringStrokeColor')
      console.info("[StyledStringStrokeTest0002] end");
      done();
    });

    /**
     * @tc.name   StyledStringStrokeTest0003
     * @tc.number SUB_ACE_BASIC_ETS_STYLED_STRING_STROKE_API_0003
     * @tc.desc   set Normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('StyledStringStrokeTest0003', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('StyledStringStrokeTest0003 START');
      let spanStyle3 = await driver.findComponent(ON.id('spanStyle3StyledStringStroke'))
      await CommonFunc.sleep(500);
      await spanStyle3.click()
      await CommonFunc.sleep(500);
      let getStyles = await driver.findComponent(ON.id('getStylesStyledStringStroke'))
      await CommonFunc.sleep(500);
      await getStyles.click()
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('StyledStringStrokeWidth')).assertEqual('-5');
      expect(''+AppStorage.get('StyledStringStrokeColor')).assertEqual('#FF008000');
      AppStorage.delete('StyledStringStrokeWidth')
      AppStorage.delete('StyledStringStrokeColor')
      console.info("[StyledStringStrokeTest0003] end");
      done();
    });
  })
}