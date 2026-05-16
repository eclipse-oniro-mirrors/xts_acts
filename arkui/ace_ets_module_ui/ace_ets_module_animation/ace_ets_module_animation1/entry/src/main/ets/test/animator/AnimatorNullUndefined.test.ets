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
import { Driver, ON, Component } from '@ohos.UiTest';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../MainAbility/utils/Common';

export default function AnimatorNullUndefinedTest() {
  describe('AnimatorNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("AnimatorNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/animator/AnimatorNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AnimatorNullUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("AnimatorNullUndefined" == pages.name)) {
          console.info("get AnimatorNullUndefinedTest state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AnimatorNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AnimatorNullUndefinedTest page error:" + err);
      }
      done()
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("AnimatorNullUndefinedTest after each called");
    });

    /**
     * @tc.name   animatorCreateNullUndefined_0100
     * @tc.number SUB_ARKUI_ANIMATOR_CREATE_NULL_0100
     * @tc.desc   Test createAnimator method with valid options
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('animatorCreateNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[animatorCreateNullUndefined_0100] START');
      try {
        await CommonFunc.sleep(1000)
        let driver = await Driver.create()
        let btn = await driver.findComponent(ON.id('btn_createAnimator_undefined'));
        await btn.click();
        await CommonFunc.sleep(500);

        console.info('[animatorCreateNullUndefined_0100] Created animator with default options');
        let errCode: string | undefined = AppStorage.get('errCode')
        expect(errCode == '401').assertTrue();
        AppStorage.delete('errCode')
      } catch (error) {
        console.info('[animatorCreateNullUndefined_0100] ERROR: ' + JSON.stringify(error));
      }
      console.info('[animatorCreateNullUndefined_0100] END');
    })

    /**
     * @tc.name   animatorCreateNullUndefined_0200
     * @tc.number animatorCreateNullUndefined_0200
     * @tc.desc   Test createAnimator method with valid options
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('animatorCreateNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[animatorCreateNullUndefined_0200] START');

      try {
        await CommonFunc.sleep(1000)
        let driver = await Driver.create()
        let btn = await driver.findComponent(ON.id('btn_createAnimator_null'));
        await btn.click();
        await CommonFunc.sleep(500);

        console.info('[animatorCreateNullUndefined_0200] Created animator with default options');
        let errCode: string | undefined = AppStorage.get('errCode')
        expect(errCode == '401').assertTrue();
        AppStorage.delete('errCode')
      } catch (error) {
        console.info('[animatorCreateNullUndefined_0200] ERROR: ' + JSON.stringify(error));
      }
      console.info('[animatorCreateNullUndefined_0200] END');
    })

    /**
     * @tc.name   animatorResetNullUndefined_0200
     * @tc.number SUB_ARKUI_ANIMATOR_RESET_NULL_0200
     * @tc.desc   Test reset method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('animatorResetNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[animatorResetNullUndefined_0200] START');
      try {
        await CommonFunc.sleep(1000)
        let driver = await Driver.create()
        let btn = await driver.findComponent(ON.id('btn_reset_default'));
        await btn.click();
        await CommonFunc.sleep(500);

        console.info('[animatorResetNullUndefined_0200] Called reset with undefined parameter');
        let errCode: string | undefined = AppStorage.get('errCode')
        expect(errCode == '401').assertTrue();
        AppStorage.delete('errCode')
      } catch (error) {
        console.info('[animatorResetNullUndefined_0200] ERROR: ' + JSON.stringify(error));
      }
      console.info('[animatorResetNullUndefined_0200] END');
    })

    /**
     * @tc.name   animatorResetNullUndefined_0300
     * @tc.number SUB_ARKUI_ANIMATOR_RESET_NULL_0300
     * @tc.desc   Test reset method with valid options
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('animatorResetNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[animatorResetNullUndefined_0300] START');

      try {
        await CommonFunc.sleep(1000)
        let driver = await Driver.create()
        let btn = await driver.findComponent(ON.id('btn_reset_null'));
        await btn.click();
        await CommonFunc.sleep(500);
        console.info('[animatorResetNullUndefined_0300] Called reset with valid options');
        let errCode: string | undefined = AppStorage.get('errCode')
        expect(errCode == '401').assertTrue();
        AppStorage.delete('errCode')
      } catch (error) {
        console.info('[animatorResetNullUndefined_0300] ERROR: ' + JSON.stringify(error));
      }
      console.info('[animatorResetNullUndefined_0300] END');
    })

    /**
     * @tc.name   animatorSetExpectedFrameRateRangeNullUndefined_0200
     * @tc.number SUB_ARKUI_ANIMATOR_SETEXPECTEDFRAMERATERANGE_NULL_0200
     * @tc.desc   Test setExpectedFrameRateRange method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('animatorSetExpectedFrameRateRangeNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[animatorSetExpectedFrameRateRangeNullUndefined_0200] START');

      try {
        await CommonFunc.sleep(1000)
        let driver = await Driver.create()
        let btn = await driver.findComponent(ON.id('btn_setExpectedFrameRateRange_null'));
        await btn.click();
        await CommonFunc.sleep(500);
        console.info('[animatorSetExpectedFrameRateRangeNullUndefined_0200] Called setExpectedFrameRateRange with undefined parameter');
        let errCode: string | undefined = AppStorage.get('errCode')
        expect(errCode == '401').assertTrue();
        AppStorage.delete('errCode')
      } catch (error) {
        console.info('[animatorSetExpectedFrameRateRangeNullUndefined_0200] ERROR: ' + JSON.stringify(error));
      }
      console.info('[animatorSetExpectedFrameRateRangeNullUndefined_0200] END');
    })

    /**
     * @tc.name   animatorSetExpectedFrameRateRangeNullUndefined_0300
     * @tc.number SUB_ARKUI_ANIMATOR_SETEXPECTEDFRAMERATERANGE_NULL_0300
     * @tc.desc   Test setExpectedFrameRateRange method with valid options
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('animatorSetExpectedFrameRateRangeNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[animatorSetExpectedFrameRateRangeNullUndefined_0300] START');

      try {
        await CommonFunc.sleep(1000)
        let driver = await Driver.create()
        let btn = await driver.findComponent(ON.id('btn_setExpectedFrameRateRange_undefined'));
        await btn.click();
        await CommonFunc.sleep(500);
        console.info('[animatorSetExpectedFrameRateRangeNullUndefined_0300] Called setExpectedFrameRateRange with valid options');
        let errCode: string | undefined = AppStorage.get('errCode')
        expect(errCode == '401').assertTrue();
        AppStorage.delete('errCode')
      } catch (error) {
        console.info('[animatorSetExpectedFrameRateRangeNullUndefined_0300] ERROR: ' + JSON.stringify(error));
      }
      console.info('[animatorSetExpectedFrameRateRangeNullUndefined_0300] END');
    })
  })
}
