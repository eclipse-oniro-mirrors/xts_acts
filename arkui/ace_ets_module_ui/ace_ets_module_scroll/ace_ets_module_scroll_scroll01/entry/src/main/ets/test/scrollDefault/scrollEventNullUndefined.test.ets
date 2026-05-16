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

export default function scrollEventNullUndefined() {
  describe('scrollEventNullUndefined', () => {
    beforeAll(async (done: Function) => {
      console.info("scrollEventNullUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/scrollDefault/scrollEventNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get state pages:" + JSON.stringify(pages));
        if (!("scrollEventNullUndefined" == pages.name)) {
          console.info("get scrollEventNullUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollEventNullUndefined page result:" + JSON.stringify(result));

          let driver = await Driver.create()
          let eventBtn = await driver.findComponent(ON.id('scrollEvent_nullUndefined_btn'));
          await eventBtn.click();
          console.info("scrollEventNullUndefined click success");
          await CommonFunc.sleep(2000);
          done();
        }
      } catch (err) {
        console.error("push scrollEventNullUndefined page error:" + err);
      }
      console.info("scrollEventNullUndefined beforeEach end");
      done();
    });

    // ========== setOnWillScroll tests ==========
    /**
     * @tc.name   setOnWillScroll_nullUndefined_0100
     * @tc.number setOnWillScroll_nullUndefined_0100
     * @tc.desc   Test UIScrollEvent setOnWillScroll with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('setOnWillScroll_nullUndefined_0100', Level.LEVEL2, async () => {
      console.info('[setOnWillScroll_nullUndefined_0100] START');
      let result: string | undefined = AppStorage.get("UIScrollEvent_setOnWillScroll_null");
      console.info('[setOnWillScroll_nullUndefined_0100] result: ' + JSON.stringify(result));
      expect(result).assertEqual("success");
      await CommonFunc.sleep(500);

      AppStorage.delete('UIScrollEvent_setOnWillScroll_null')
      console.info('[setOnWillScroll_nullUndefined_0100] END');
    })

    /**
     * @tc.name   setOnWillScroll_nullUndefined_0200
     * @tc.number setOnWillScroll_nullUndefined_0200
     * @tc.desc   Test UIScrollEvent setOnWillScroll with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('setOnWillScroll_nullUndefined_0200', Level.LEVEL2, async () => {
      console.info('[setOnWillScroll_nullUndefined_0200] START');
      let result: string | undefined = AppStorage.get("UIScrollEvent_setOnWillScroll_undefined");
      console.info('[setOnWillScroll_nullUndefined_0200] result: ' + JSON.stringify(result));
      expect(result).assertEqual("success");
      await CommonFunc.sleep(500);

      AppStorage.delete('UIScrollEvent_setOnWillScroll_undefined')
      console.info('[setOnWillScroll_nullUndefined_0200] END');
    })

    // ========== setOnDidScroll tests ==========
    /**
     * @tc.name   setOnDidScroll_nullUndefined_0100
     * @tc.number setOnDidScroll_nullUndefined_0100
     * @tc.desc   Test UIScrollEvent setOnDidScroll with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('setOnDidScroll_nullUndefined_0100', Level.LEVEL2, async () => {
      console.info('[setOnDidScroll_nullUndefined_0100] START');
      let result: string | undefined = AppStorage.get("UIScrollEvent_setOnDidScroll_null");
      console.info('[setOnDidScroll_nullUndefined_0100] result: ' + JSON.stringify(result));
      expect(result).assertEqual("success");
      await CommonFunc.sleep(500);

      AppStorage.delete('UIScrollEvent_setOnDidScroll_null')
      console.info('[setOnDidScroll_nullUndefined_0100] END');
    })

    /**
     * @tc.name   setOnDidScroll_nullUndefined_0200
     * @tc.number setOnDidScroll_nullUndefined_0200
     * @tc.desc   Test UIScrollEvent setOnDidScroll with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('setOnDidScroll_nullUndefined_0200', Level.LEVEL2, async () => {
      console.info('[setOnDidScroll_nullUndefined_0200] START');
      let result: string | undefined = AppStorage.get("UIScrollEvent_setOnDidScroll_undefined");
      console.info('[setOnDidScroll_nullUndefined_0200] result: ' + JSON.stringify(result));
      expect(result).assertEqual("success");
      await CommonFunc.sleep(500);

      AppStorage.delete('UIScrollEvent_setOnDidScroll_undefined')
      console.info('[setOnDidScroll_nullUndefined_0200] END');
    })

    // ========== setOnReachStart tests ==========
    /**
     * @tc.name   setOnReachStart_nullUndefined_0100
     * @tc.number setOnReachStart_nullUndefined_0100
     * @tc.desc   Test UIScrollEvent setOnReachStart with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('setOnReachStart_nullUndefined_0100', Level.LEVEL2, async () => {
      console.info('[setOnReachStart_nullUndefined_0100] START');
      let result: string | undefined = AppStorage.get("UIScrollEvent_setOnReachStart_null");
      console.info('[setOnReachStart_nullUndefined_0100] result: ' + JSON.stringify(result));
      expect(result).assertEqual("success");
      await CommonFunc.sleep(500);

      AppStorage.delete('UIScrollEvent_setOnReachStart_null')
      console.info('[setOnReachStart_nullUndefined_0100] END');
    })

    /**
     * @tc.name   setOnReachStart_nullUndefined_0200
     * @tc.number setOnReachStart_nullUndefined_0200
     * @tc.desc   Test UIScrollEvent setOnReachStart with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('setOnReachStart_nullUndefined_0200', Level.LEVEL2, async () => {
      console.info('[setOnReachStart_nullUndefined_0200] START');
      let result: string | undefined = AppStorage.get("UIScrollEvent_setOnReachStart_undefined");
      console.info('[setOnReachStart_nullUndefined_0200] result: ' + JSON.stringify(result));
      expect(result).assertEqual("success");
      await CommonFunc.sleep(500);

      AppStorage.delete('UIScrollEvent_setOnReachStart_undefined')
      console.info('[setOnReachStart_nullUndefined_0200] END');
    })

    // ========== setOnReachEnd tests ==========
    /**
     * @tc.name   setOnReachEnd_nullUndefined_0100
     * @tc.number setOnReachEnd_nullUndefined_0100
     * @tc.desc   Test UIScrollEvent setOnReachEnd with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('setOnReachEnd_nullUndefined_0100', Level.LEVEL2, async () => {
      console.info('[setOnReachEnd_nullUndefined_0100] START');
      let result: string | undefined = AppStorage.get("UIScrollEvent_setOnReachEnd_null");
      console.info('[setOnReachEnd_nullUndefined_0100] result: ' + JSON.stringify(result));
      expect(result).assertEqual("success");
      await CommonFunc.sleep(500);

      AppStorage.delete('UIScrollEvent_setOnReachEnd_null')
      console.info('[setOnReachEnd_nullUndefined_0100] END');
    })

    /**
     * @tc.name   setOnReachEnd_nullUndefined_0200
     * @tc.number setOnReachEnd_nullUndefined_0200
     * @tc.desc   Test UIScrollEvent setOnReachEnd with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('setOnReachEnd_nullUndefined_0200', Level.LEVEL2, async () => {
      console.info('[setOnReachEnd_nullUndefined_0200] START');
      let result: string | undefined = AppStorage.get("UIScrollEvent_setOnReachEnd_undefined");
      console.info('[setOnReachEnd_nullUndefined_0200] result: ' + JSON.stringify(result));
      expect(result).assertEqual("success");
      await CommonFunc.sleep(500);

      AppStorage.delete('UIScrollEvent_setOnReachEnd_undefined')
      console.info('[setOnReachEnd_nullUndefined_0200] END');
    })

    // ========== setOnScrollStart tests ==========
    /**
     * @tc.name   setOnScrollStart_nullUndefined_0100
     * @tc.number setOnScrollStart_nullUndefined_0100
     * @tc.desc   Test UIScrollEvent setOnScrollStart with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('setOnScrollStart_nullUndefined_0100', Level.LEVEL2, async () => {
      console.info('[setOnScrollStart_nullUndefined_0100] START');
      let result: string | undefined = AppStorage.get("UIScrollEvent_setOnScrollStart_null");
      console.info('[setOnScrollStart_nullUndefined_0100] result: ' + JSON.stringify(result));
      expect(result).assertEqual("success");
      await CommonFunc.sleep(500);

      AppStorage.delete('UIScrollEvent_setOnScrollStart_null')
      console.info('[setOnScrollStart_nullUndefined_0100] END');
    })

    /**
     * @tc.name   setOnScrollStart_nullUndefined_0200
     * @tc.number setOnScrollStart_nullUndefined_0200
     * @tc.desc   Test UIScrollEvent setOnScrollStart with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('setOnScrollStart_nullUndefined_0200', Level.LEVEL2, async () => {
      console.info('[setOnScrollStart_nullUndefined_0200] START');
      let result: string | undefined = AppStorage.get("UIScrollEvent_setOnScrollStart_undefined");
      console.info('[setOnScrollStart_nullUndefined_0200] result: ' + JSON.stringify(result));
      expect(result).assertEqual("success");
      await CommonFunc.sleep(500);

      AppStorage.delete('UIScrollEvent_setOnScrollStart_undefined')
      console.info('[setOnScrollStart_nullUndefined_0200] END');
    })

    // ========== setOnScrollStop tests ==========
    /**
     * @tc.name   setOnScrollStop_nullUndefined_0100
     * @tc.number setOnScrollStop_nullUndefined_0100
     * @tc.desc   Test UIScrollEvent setOnScrollStop with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('setOnScrollStop_nullUndefined_0100', Level.LEVEL2, async () => {
      console.info('[setOnScrollStop_nullUndefined_0100] START');
      let result: string | undefined = AppStorage.get("UIScrollEvent_setOnScrollStop_null");
      console.info('[setOnScrollStop_nullUndefined_0100] result: ' + JSON.stringify(result));
      expect(result).assertEqual("success");
      await CommonFunc.sleep(500);

      AppStorage.delete('UIScrollEvent_setOnScrollStop_null')
      console.info('[setOnScrollStop_nullUndefined_0100] END');
    })

    /**
     * @tc.name   setOnScrollStop_nullUndefined_0200
     * @tc.number setOnScrollStop_nullUndefined_0200
     * @tc.desc   Test UIScrollEvent setOnScrollStop with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('setOnScrollStop_nullUndefined_0200', Level.LEVEL2, async () => {
      console.info('[setOnScrollStop_nullUndefined_0200] START');
      let result: string | undefined = AppStorage.get("UIScrollEvent_setOnScrollStop_undefined");
      console.info('[setOnScrollStop_nullUndefined_0200] result: ' + JSON.stringify(result));
      expect(result).assertEqual("success");
      await CommonFunc.sleep(500);

      AppStorage.delete('UIScrollEvent_setOnScrollStop_undefined')
      console.info('[setOnScrollStop_nullUndefined_0200] END');
    })

    // ========== setOnScrollFrameBegin tests ==========
    /**
     * @tc.name   setOnScrollFrameBegin_nullUndefined_0100
     * @tc.number setOnScrollFrameBegin_nullUndefined_0100
     * @tc.desc   Test UIScrollEvent setOnScrollFrameBegin with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('setOnScrollFrameBegin_nullUndefined_0100', Level.LEVEL2, async () => {
      console.info('[setOnScrollFrameBegin_nullUndefined_0100] START');
      let result: string | undefined = AppStorage.get("UIScrollEvent_setOnScrollFrameBegin_null");
      console.info('[setOnScrollFrameBegin_nullUndefined_0100] result: ' + JSON.stringify(result));
      expect(result).assertEqual("success");
      await CommonFunc.sleep(500);

      AppStorage.delete('UIScrollEvent_setOnScrollFrameBegin_null')
      console.info('[setOnScrollFrameBegin_nullUndefined_0100] END');
    })

    /**
     * @tc.name   setOnScrollFrameBegin_nullUndefined_0200
     * @tc.number setOnScrollFrameBegin_nullUndefined_0200
     * @tc.desc   Test UIScrollEvent setOnScrollFrameBegin with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('setOnScrollFrameBegin_nullUndefined_0200', Level.LEVEL2, async () => {
      console.info('[setOnScrollFrameBegin_nullUndefined_0200] START');
      let result: string | undefined = AppStorage.get("UIScrollEvent_setOnScrollFrameBegin_undefined");
      console.info('[setOnScrollFrameBegin_nullUndefined_0200] result: ' + JSON.stringify(result));
      expect(result).assertEqual("success");
      await CommonFunc.sleep(500);

      AppStorage.delete('UIScrollEvent_setOnScrollFrameBegin_undefined')
      console.info('[setOnScrollFrameBegin_nullUndefined_0200] END');
    })
  })
}