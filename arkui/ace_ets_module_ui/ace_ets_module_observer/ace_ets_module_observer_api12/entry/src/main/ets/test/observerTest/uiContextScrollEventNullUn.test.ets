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

export default function uiContextScrollEventNullUnTest() {
  describe('uiContextScrollEventNullUnTest', () => {

    let centerX: number;
    let y1: number;
    let y2: number;
    beforeEach(async (done: Function) => {
      console.info("uiContextScrollEventNullUnTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/observer/uiContextScrollEventNullUn",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get   state pages:" + JSON.stringify(pages));
        if (!("uiContextScrollEventNullUn" == pages.name)) {
          console.info("get uiContextScrollEventNullUnTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push uiContextScrollEventNullUnTest page result:" + JSON.stringify(result));

          let driver = await Driver.create()
          let rect = CommonFunc.getComponentRect("getUIObserver_scrollEvent_default");
          let width = rect.right - rect.left;
          let height = rect.bottom - rect.top;
          console.info("uiContextScrollEventNullUnTest width is" + width + ", height is" + height);
          centerX = Math.round(globalThis.winLeft + rect.left + width/2);
          y1 = Math.round(globalThis.winTop + rect.top + height*0.1);
          y2 = Math.round(globalThis.winTop + rect.bottom - height*0.2);
          console.info("uiContextScrollEventNullUnTest  centerX= " +  centerX  + ", y1 = " + y1  + ", y2 = " + y2);
          await CommonFunc.sleep(2000);
          done();
        }
      } catch (err) {
        console.error("push uiContextScrollEventNullUnTest page error:" + err);
      }
      console.info("uiContextScrollEventNullUnTest beforeEach end");
      done();
    });

    /**
     * @tc.name   getUIObserver_scrollEvent_on_null_0100
     * @tc.number getUIObserver_scrollEvent_on_null_0100
     * @tc.desc   Test getUIObserver.on(null, callback)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('getUIObserver_scrollEvent_on_null_0100', Level.LEVEL2, async () => {
      console.info('[getUIObserver_scrollEvent_on_null_0100] START');
      // 滚动列表触发 UIObserver 回调
      let driver = await Driver.create();
      // 模拟滚动操作
      console.info(`====>getUIObserver_scrollEvent_on_null_0100 swipe<====`);
      await driver.swipe(centerX, y2, centerX, y1, 2000);
      await CommonFunc.sleep(2000); // 等待回调执行完成

      let result = JSON.stringify(AppStorage.get('scrollEvent_UIObserver_on_null'));
      console.info('[getUIObserver_scrollEvent_on_null_0100] result: ' + result);
      expect(result).assertEqual('"success"');
      await CommonFunc.sleep(500);
      AppStorage.delete('scrollEvent_UIObserver_on_null')

      console.info('[getUIObserver_scrollEvent_on_null_0100] END');
    })

    /**
     * @tc.name   getUIObserver_scrollEvent_off_null_0200
     * @tc.number getUIObserver_scrollEvent_off_null_0200
     * @tc.desc   Test getUIObserver.off(null, callback)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('getUIObserver_scrollEvent_off_null_0200', Level.LEVEL2, async () => {
      console.info('[getUIObserver_scrollEvent_off_null_0200] START');
      // 滚动列表触发 UIObserver 回调
      let driver = await Driver.create();
      // 模拟滚动操作
      console.info(`====>getUIObserver_scrollEvent_off_null_0200 swipe<====`);
      await driver.swipe(centerX, y2, centerX, y1, 2000);
      await CommonFunc.sleep(2000);

      let result = JSON.stringify(AppStorage.get('scrollEvent_UIObserver_off_null'));
      console.info('[getUIObserver_scrollEvent_off_null_0200] result: ' + result);
      expect(result).assertEqual('"success"');
      await CommonFunc.sleep(500);
      AppStorage.delete('scrollEvent_UIObserver_off_null')

      console.info('[getUIObserver_scrollEvent_off_null_0200] END');
    })

    /**
     * @tc.name   getUIObserver_scrollEvent_on_undefined_0300
     * @tc.number getUIObserver_scrollEvent_on_undefined_0300
     * @tc.desc   Test getUIObserver.on(undefined, callback)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('getUIObserver_scrollEvent_on_undefined_0300', Level.LEVEL2, async () => {
      console.info('[getUIObserver_scrollEvent_on_undefined_0300] START');
      // 滚动列表触发 UIObserver 回调
      let driver = await Driver.create();
      // 模拟滚动操作
      console.info(`====>getUIObserver_scrollEvent_on_undefined_0300 swipe<====`);
      await driver.swipe(centerX, y2, centerX, y1, 2000);
      await CommonFunc.sleep(2000);

      let result = JSON.stringify(AppStorage.get('scrollEvent_UIObserver_on_undefined'));
      console.info('[getUIObserver_scrollEvent_on_undefined_0300] result: ' + result);
      expect(result).assertEqual('"success"');
      await CommonFunc.sleep(500);
      AppStorage.delete('scrollEvent_UIObserver_on_undefined')

      console.info('[getUIObserver_scrollEvent_on_undefined_0300] END');
    })

    /**
     * @tc.name   getUIObserver_scrollEvent_off_undefined_0400
     * @tc.number getUIObserver_scrollEvent_off_undefined_0400
     * @tc.desc   Test getUIObserver.off(undefined, callback)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('getUIObserver_scrollEvent_off_undefined_0400', Level.LEVEL2, async () => {
      console.info('[getUIObserver_scrollEvent_off_undefined_0400] START');
      // 滚动列表触发 UIObserver 回调
      let driver = await Driver.create();
      // 模拟滚动操作
      console.info(`====>getUIObserver_scrollEvent_off_undefined_0400 swipe<====`);
      await driver.swipe(centerX, y2, centerX, y1, 2000);
      await CommonFunc.sleep(2000);

      let result = JSON.stringify(AppStorage.get('scrollEvent_UIObserver_off_undefined'));
      console.info('[getUIObserver_scrollEvent_off_undefined_0400] result: ' + result);
      expect(result).assertEqual('"success"');
      await CommonFunc.sleep(500);
      AppStorage.delete('scrollEvent_UIObserver_off_undefined')

      console.info('[getUIObserver_scrollEvent_off_undefined_0400] END');
    })

    /**
     * @tc.name   getUIObserver_scrollEvent_on_null_id_0500
     * @tc.number getUIObserver_scrollEvent_on_null_id_0500
     * @tc.desc   Test getUIObserver.on(null, options, callback)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('getUIObserver_scrollEvent_on_null_id_0500', Level.LEVEL2, async () => {
      console.info('[getUIObserver_scrollEvent_on_null_id_0500] START');
      // 滚动列表触发 UIObserver 回调
      let driver = await Driver.create();
      // 模拟滚动操作
      console.info(`====>getUIObserver_scrollEvent_on_null_id_0500 swipe<====`);
      await driver.swipe(centerX, y2, centerX, y1, 2000);
      await CommonFunc.sleep(2000);

      let result = JSON.stringify(AppStorage.get('scrollEvent_UIObserver_on_null_id'));
      console.info('[getUIObserver_scrollEvent_on_null_id_0500] result: ' + result);
      expect(result).assertEqual('"success"');
      await CommonFunc.sleep(500);
      AppStorage.delete('scrollEvent_UIObserver_on_null_id')

      console.info('[getUIObserver_scrollEvent_on_null_id_0500] END');
    })

    /**
     * @tc.name   getUIObserver_scrollEvent_off_null_id_0600
     * @tc.number getUIObserver_scrollEvent_off_null_id_0600
     * @tc.desc   Test getUIObserver.off(null, options, callback)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('getUIObserver_scrollEvent_off_null_id_0600', Level.LEVEL2, async () => {
      console.info('[getUIObserver_scrollEvent_off_null_id_0600] START');
      // 滚动列表触发 UIObserver 回调
      let driver = await Driver.create();
      // 模拟滚动操作
      console.info(`====>getUIObserver_scrollEvent_off_null_id_0600 swipe<====`);
      await driver.swipe(centerX, y2, centerX, y1, 2000);
      await CommonFunc.sleep(2000);

      let result = JSON.stringify(AppStorage.get('scrollEvent_UIObserver_off_null_id'));
      console.info('[getUIObserver_scrollEvent_off_null_id_0600] result: ' + result);
      expect(result).assertEqual('"success"');
      await CommonFunc.sleep(500);
      AppStorage.delete('scrollEvent_UIObserver_off_null_id')

      console.info('[getUIObserver_scrollEvent_off_null_id_0600] END');
    })

    /**
     * @tc.name   getUIObserver_scrollEvent_on_undefined_id_0700
     * @tc.number getUIObserver_scrollEvent_on_undefined_id_0700
     * @tc.desc   Test getUIObserver.on(undefined, options, callback)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('getUIObserver_scrollEvent_on_undefined_id_0700', Level.LEVEL2, async () => {
      console.info('[getUIObserver_scrollEvent_on_undefined_id_0700] START');
      // 滚动列表触发 UIObserver 回调
      let driver = await Driver.create();
      // 模拟滚动操作
      console.info(`====>getUIObserver_scrollEvent_on_undefined_id_0700 swipe<====`);
      await driver.swipe(centerX, y2, centerX, y1, 2000);
      await CommonFunc.sleep(2000);

      let result = JSON.stringify(AppStorage.get('scrollEvent_UIObserver_on_undefined_id'));
      console.info('[getUIObserver_scrollEvent_on_undefined_id_0700] result: ' + result);
      expect(result).assertEqual('"success"');
      await CommonFunc.sleep(500);
      AppStorage.delete('scrollEvent_UIObserver_on_undefined_id')

      console.info('[getUIObserver_scrollEvent_on_undefined_id_0700] END');
    })

    /**
     * @tc.name   getUIObserver_scrollEvent_off_undefined_id_0800
     * @tc.number getUIObserver_scrollEvent_off_undefined_id_0800
     * @tc.desc   Test getUIObserver.off(undefined, options, callback)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('getUIObserver_scrollEvent_off_undefined_id_0800', Level.LEVEL2, async () => {
      console.info('[getUIObserver_scrollEvent_off_undefined_id_0800] START');
      // 滚动列表触发 UIObserver 回调
      let driver = await Driver.create();
      // 模拟滚动操作
      console.info(`====>getUIObserver_scrollEvent_off_undefined_id_0800 swipe<====`);
      await driver.swipe(centerX, y2, centerX, y1, 2000);
      await CommonFunc.sleep(2000);

      let result = JSON.stringify(AppStorage.get('scrollEvent_UIObserver_off_undefined_id'));
      console.info('[getUIObserver_scrollEvent_off_undefined_id_0800] result: ' + result);
      expect(result).assertEqual('"success"');
      await CommonFunc.sleep(500);
      AppStorage.delete('scrollEvent_UIObserver_off_undefined_id')

      console.info('[getUIObserver_scrollEvent_off_undefined_id_0700] END');
    })

    /**
     * @tc.name   getUIObserver_scrollEvent_on_id_empty_0900
     * @tc.number getUIObserver_scrollEvent_on_id_empty_0900
     * @tc.desc   Test getUIObserver.on('scrollEvent', { id: '' }, callback)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('getUIObserver_scrollEvent_on_id_empty_0900', Level.LEVEL2, async () => {
      console.info('[getUIObserver_scrollEvent_on_id_empty_0900] START');
      // 滚动列表触发 UIObserver 回调
      let driver = await Driver.create();
      // 模拟滚动操作
      console.info(`====>getUIObserver_scrollEvent_on_id_empty_0900 swipe<====`);
      await driver.swipe(centerX, y2, centerX, y1, 2000);
      await CommonFunc.sleep(2000);

      let result = JSON.stringify(AppStorage.get('scrollEvent_UIObserver_on_id_empty'));
      console.info('[getUIObserver_scrollEvent_on_id_empty_0900] result: ' + result);
      expect(result).assertEqual('"success"');
      await CommonFunc.sleep(500);
      AppStorage.delete('scrollEvent_UIObserver_on_id_empty')

      console.info('[getUIObserver_scrollEvent_on_id_empty_0900] END');
    })

    /**
     * @tc.name   getUIObserver_scrollEvent_off_id_empty_1000
     * @tc.number getUIObserver_scrollEvent_off_id_empty_1000
     * @tc.desc   Test getUIObserver.off('scrollEvent', { id: '' }, callback)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('getUIObserver_scrollEvent_off_id_empty_1000', Level.LEVEL2, async () => {
      console.info('[getUIObserver_scrollEvent_off_id_empty_1000] START');
      // 滚动列表触发 UIObserver 回调
      let driver = await Driver.create();
      // 模拟滚动操作
      console.info(`====>getUIObserver_scrollEvent_off_id_empty_1000 swipe<====`);
      await driver.swipe(centerX, y2, centerX, y1, 2000);
      await CommonFunc.sleep(2000);

      let result = JSON.stringify(AppStorage.get('scrollEvent_UIObserver_off_id_empty'));
      console.info('[getUIObserver_scrollEvent_off_id_empty_1000] result: ' + result);
      expect(result).assertEqual('"success"');
      await CommonFunc.sleep(500);
      AppStorage.delete('scrollEvent_UIObserver_off_id_empty')

      console.info('[getUIObserver_scrollEvent_off_id_empty_1000] END');
    })
  })
}
