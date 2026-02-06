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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function CacheMaxCountForHSPParamTest() {
  describe('CacheMaxCountForHSPParamTest', () => {
    beforeEach(async (done: Function) => {
      console.info("CacheMaxCountForHSPParamTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CacheMaxCount/CacheMaxCountForHSPParamTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CacheMaxCountForHSPParamTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get CacheMaxCountForHSPParamTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push CacheMaxCountForHSPParamTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CacheMaxCountForHSPParamTest page error:" + err);
      }
      console.info("CacheMaxCountForHSPParamTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("CacheMaxCountForHSPParamTest after each called");
    });

    /**
     * @tc.name   CacheMaxCountForHSPParamTest_0100
     * @tc.number CacheMaxCountForHSPParamTest_0100
     * @tc.desc   CacheMaxCountForHSP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CacheMaxCountForHSPParamTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('CacheMaxCountForHSPParamTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_param0'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('btn_param100000000'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let button3 = await driver.findComponent(ON.id('btn_param100000001'));
      await button3.click();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('setResourceManagerCacheMaxCountForHSP0')).assertEqual(0);
      expect(AppStorage.get('setResourceManagerCacheMaxCountForHSP10')).assertEqual(100000000);
      expect(AppStorage.get('setResourceManagerCacheMaxCountForHSP101')).assertEqual(100000001);
      AppStorage.delete('setResourceManagerCacheMaxCountForHSP0');
      AppStorage.delete('setResourceManagerCacheMaxCountForHSP10');
      AppStorage.delete('setResourceManagerCacheMaxCountForHSP101');
      console.info('[CacheMaxCountForHSPParamTest_0100] END');
      done();
    });

  })
}