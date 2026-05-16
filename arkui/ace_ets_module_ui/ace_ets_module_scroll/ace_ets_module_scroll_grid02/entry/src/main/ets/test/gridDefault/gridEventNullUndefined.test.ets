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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function gridEventNullUndefined() {
  describe('gridEventNullUndefined', () => {
    beforeAll(async (done: Function) => {
      console.info("gridEventNullUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/gridDefault/gridEventNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get state pages:" + JSON.stringify(pages));
        if (!("gridEventNullUndefined" == pages.name)) {
          console.info("get gridEventNullUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push gridEventNullUndefined page result:" + JSON.stringify(result));

          let driver = await Driver.create()
          let eventBtn = await driver.findComponent(ON.id('gridEvent_nullUndefined_btn'));
          await eventBtn.click();
          console.info("gridEventNullUndefined click success");
          await CommonFunc.sleep(2000);
          done();
        }
      } catch (err) {
        console.error("push gridEventNullUndefined page error:" + err);
      }
      console.info("gridEventNullUndefined beforeEach end");
      done();
    });

    // ========== setOnWillScroll tests ==========
    /**
     * @tc.name   setOnWillScroll_nullUndefined_0100
     * @tc.number setOnWillScroll_nullUndefined_0100
     * @tc.desc   Test UIGridEvent setOnWillScroll with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('setOnWillScroll_nullUndefined_0100', Level.LEVEL2, async () => {
      console.info('[setOnWillScroll_nullUndefined_0100] START');
      let result: string | undefined = AppStorage.get("UIGridEvent_setOnWillScroll_null");
      console.info('[setOnWillScroll_nullUndefined_0100] result: ' + JSON.stringify(result));
      expect(result).assertEqual("success");
      await CommonFunc.sleep(500);

      AppStorage.delete('UIGridEvent_setOnWillScroll_null')
      console.info('[setOnWillScroll_nullUndefined_0100] END');
    })

    /**
     * @tc.name   setOnWillScroll_nullUndefined_0200
     * @tc.number setOnWillScroll_nullUndefined_0200
     * @tc.desc   Test UIGridEvent setOnWillScroll with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('setOnWillScroll_nullUndefined_0200', Level.LEVEL2, async () => {
      console.info('[setOnWillScroll_nullUndefined_0200] START');
      let result: string | undefined = AppStorage.get("UIGridEvent_setOnWillScroll_undefined");
      console.info('[setOnWillScroll_nullUndefined_0200] result: ' + JSON.stringify(result));
      expect(result).assertEqual("success");
      await CommonFunc.sleep(500);

      AppStorage.delete('UIGridEvent_setOnWillScroll_undefined')
      console.info('[setOnWillScroll_nullUndefined_0200] END');
    })

    // ========== setOnDidScroll tests ==========
    /**
     * @tc.name   setOnDidScroll_nullUndefined_0100
     * @tc.number setOnDidScroll_nullUndefined_0100
     * @tc.desc   Test UIGridEvent setOnDidScroll with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('setOnDidScroll_nullUndefined_0100', Level.LEVEL2, async () => {
      console.info('[setOnDidScroll_nullUndefined_0100] START');
      let result: string | undefined = AppStorage.get("UIGridEvent_setOnDidScroll_null");
      console.info('[setOnDidScroll_nullUndefined_0100] result: ' + JSON.stringify(result));
      expect(result).assertEqual("success");
      await CommonFunc.sleep(500);

      AppStorage.delete('UIGridEvent_setOnDidScroll_null')
      console.info('[setOnDidScroll_nullUndefined_0100] END');
    })

    /**
     * @tc.name   setOnDidScroll_nullUndefined_0200
     * @tc.number setOnDidScroll_nullUndefined_0200
     * @tc.desc   Test UIGridEvent setOnDidScroll with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('setOnDidScroll_nullUndefined_0200', Level.LEVEL2, async () => {
      console.info('[setOnDidScroll_nullUndefined_0200] START');
      let result: string | undefined = AppStorage.get("UIGridEvent_setOnDidScroll_undefined");
      console.info('[setOnDidScroll_nullUndefined_0200] result: ' + JSON.stringify(result));
      expect(result).assertEqual("success");
      await CommonFunc.sleep(500);

      AppStorage.delete('UIGridEvent_setOnDidScroll_undefined')
      console.info('[setOnDidScroll_nullUndefined_0200] END');
    })

    // ========== setOnScrollIndex tests ==========
    /**
     * @tc.name   setOnScrollIndex_nullUndefined_0100
     * @tc.number setOnScrollIndex_nullUndefined_0100
     * @tc.desc   Test UIGridEvent setOnScrollIndex with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('setOnScrollIndex_nullUndefined_0100', Level.LEVEL2, async () => {
      console.info('[setOnScrollIndex_nullUndefined_0100] START');
      let result: string | undefined = AppStorage.get("UIGridEvent_setOnScrollIndex_null");
      console.info('[setOnScrollIndex_nullUndefined_0100] result: ' + JSON.stringify(result));
      expect(result).assertEqual("success");
      await CommonFunc.sleep(500);

      AppStorage.delete('UIGridEvent_setOnScrollIndex_null')
      console.info('[setOnScrollIndex_nullUndefined_0100] END');
    })

    /**
     * @tc.name   setOnScrollIndex_nullUndefined_0200
     * @tc.number setOnScrollIndex_nullUndefined_0200
     * @tc.desc   Test UIGridEvent setOnScrollIndex with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('setOnScrollIndex_nullUndefined_0200', Level.LEVEL2, async () => {
      console.info('[setOnScrollIndex_nullUndefined_0200] START');
      let result: string | undefined = AppStorage.get("UIGridEvent_setOnScrollIndex_undefined");
      console.info('[setOnScrollIndex_nullUndefined_0200] result: ' + JSON.stringify(result));
      expect(result).assertEqual("success");
      await CommonFunc.sleep(500);

      AppStorage.delete('UIGridEvent_setOnScrollIndex_undefined')
      console.info('[setOnScrollIndex_nullUndefined_0200] END');
    })
  })
}