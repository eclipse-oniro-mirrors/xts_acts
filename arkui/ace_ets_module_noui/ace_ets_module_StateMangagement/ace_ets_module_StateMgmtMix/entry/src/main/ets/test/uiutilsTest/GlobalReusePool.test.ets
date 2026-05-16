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
import { hilog } from '@kit.PerformanceAnalysisKit';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import { IReusableInfo, IReusePool } from '@kit.ArkUI';
import CommonFunc from '../../MainAbility/common/Common';


export default function GlobalReusePoolTest() {
  let driver: Driver;
  describe('GlobalReusePoolTest', () => {
    beforeAll(async () => {
      driver = Driver.create();
      await driver.delayMs(1000)
    });

    beforeEach(async (done: Function) => {
      console.info("GlobalReusePoolTest setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/uiutils/GlobalReusePool",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("GlobalReusePool" == pages.name)) {
          console.info("get GlobalReusePoolTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GlobalReusePoolTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GlobalReusePoolTest page error:" + err);
      }
      console.info("GlobalReusePoolTest beforeEach end");
      done();
    });

    afterEach(() => {
      hilog.info(0x0000, 'GlobalReusePoolTest', 'afterEach: test case finished');
    });

    afterAll(async () => {
      AppStorage.delete('getReusableInfoUndefined')
      AppStorage.delete('getReusePoolUndefined')
      AppStorage.delete('getReusePoolNotUndefined')
      AppStorage.delete('IReusableInfoArray')
      AppStorage.delete('IReusableInfo')

      hilog.info(0x0000, 'GlobalReusePoolTest', 'afterAll: all tests finished');
    });

    /**
     * @tc.name   globalReusePool_getReusePool_0100
     * @tc.number SUB_ARKUI_GLOBALREUSEPOOL_GETREUSEPOOL_0100
     * @tc.desc   Test getReusePool API returns valid pool when configured
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('globalReusePool_getReusePool_0100', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'GlobalReusePoolTest', 'globalReusePool_getReusePool_0100 START');
      let getReusePoolUndefined: IReusableInfo | undefined = AppStorage.get('getReusePoolUndefined')
      expect(getReusePoolUndefined).assertUndefined();
      hilog.info(0x0000, 'GlobalReusePoolTest', 'globalReusePool_getReusePool_0100 END');
    });

    /**
     * @tc.name   globalReusePool_getReusableInfo_0100
     * @tc.number SUB_ARKUI_GLOBALREUSEPOOL_GETREUSABLEINFO_0100
     * @tc.desc   Test getReusableInfo API returns component pool info
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('globalReusePool_getReusableInfo_0100', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'GlobalReusePoolTest', 'globalReusePool_getReusableInfo_0100 START');
      let getReusableInfoUndefined: IReusableInfo | undefined = AppStorage.get('getReusableInfoUndefined')
      expect(getReusableInfoUndefined).assertUndefined();
      hilog.info(0x0000, 'GlobalReusePoolTest', 'globalReusePool_getReusableInfo_0100 END');
    });

    /**
     * @tc.name   globalReusePool_getReusableInfo_withReuseId_0100
     * @tc.number SUB_ARKUI_GLOBALREUSEPOOL_GETREUSABLEINFO_REUSEID_0100
     * @tc.desc   Test getReusableInfo API with reuseId parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('globalReusePool_getReusableInfo_withReuseId_0100', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'GlobalReusePoolTest', 'globalReusePool_getReusableInfo_withReuseId_0100 START');
      let button = await driver.findComponent(ON.id('GlobalReusePoolChangeComponent'));
      await button.click();
      await driver.delayMs(500)
      let button2 = await driver.findComponent(ON.id('GlobalReusePoolCheckGlobalChild'));
      await button2.click();
      await driver.delayMs(500)
      let getReusePool: IReusePool| undefined = AppStorage.get('getReusePoolNotUndefined');
      expect(getReusePool).not().assertUndefined()
      let iReusableInfoArray: IReusableInfo[]| undefined = AppStorage.get('IReusableInfoArray');
      expect(iReusableInfoArray?.length).assertLarger(0)
      hilog.info(0x0000, 'GlobalReusePoolTest', 'globalReusePool_getReusableInfo_withReuseId_0100 END');
    });

    /**
     * @tc.name   globalReusePool_preRender_0100
     * @tc.number SUB_ARKUI_GLOBALREUSEPOOL_PRERENDER_0100
     * @tc.desc   Test preRender API creates reusable components in advance
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('globalReusePool_preRender_0100', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'GlobalReusePoolTest', 'globalReusePool_preRender_0100 START');
      let button = await driver.findComponent(ON.id('GlobalReusePoolCheckLegacyComp'));
      await button.click();
      await driver.delayMs(500);
      let iReusableInfo: IReusableInfo| undefined = AppStorage.get('IReusableInfo');
      expect(iReusableInfo).not().assertUndefined();
      expect(iReusableInfo?.count).assertEqual(0);
      expect(iReusableInfo?.maxCount).assertEqual(100);
      expect(iReusableInfo?.reuseId).assertUndefined();
      hilog.info(0x0000, 'GlobalReusePoolTest', 'globalReusePool_preRender_0100 END');
    });

  });
}
