/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function setDataNullAndUndefinedTest() {
  describe('setDataNullAndUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("setDataNullAndUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/DragEvent/setDataNullAndUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get setDataNullAndUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("setDataNullAndUndefined" == pages.name)) {
          console.info("get setDataNullAndUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push setDataNullAndUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push setDataNullAndUndefinedTest page error:" + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("setDataNullAndUndefinedTest after each called");
    });

    /**
     * @tc.name   SUB_ARKUI_DRAGEVENT_SETDATA_PARAM_001
     * @tc.number  SUB_ARKUI_DRAGEVENT_SETDATA_PARAM_001
     * @tc.desc   Test setData with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_DRAGEVENT_SETDATA_PARAM_001', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_DRAGEVENT_SETDATA_PARAM_001] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      
      // 触发拖拽开始事件
      let image1 = await driver.findComponent(ON.id('image1'));
      let button = await driver.findComponent(ON.id('testNull'));
      await button.dragTo(image1);
      await CommonFunc.sleep(1000);
      
      console.info('[SUB_ARKUI_DRAGEVENT_SETDATA_PARAM_001] setDataNullResult: ' + AppStorage.get('setDataNullResult'));
      
      expect(AppStorage.get('setDataNullResult')).assertEqual("SUCCESS");
      console.info('[SUB_ARKUI_DRAGEVENT_SETDATA_PARAM_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_DRAGEVENT_SETDATA_PARAM_002
     * @tc.number  SUB_ARKUI_DRAGEVENT_SETDATA_PARAM_002
     * @tc.desc   Test setData with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_DRAGEVENT_SETDATA_PARAM_002', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_DRAGEVENT_SETDATA_PARAM_002] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      
      // 触发拖拽开始事件
      let image1 = await driver.findComponent(ON.id('image1'));
      let button = await driver.findComponent(ON.id('testUndefined'));
      await button.dragTo(image1);
      await CommonFunc.sleep(1000);
      
      console.info('[SUB_ARKUI_DRAGEVENT_SETDATA_PARAM_002] setDataUndefinedResult: ' + AppStorage.get('setDataUndefinedResult'));
      
      expect(AppStorage.get('setDataUndefinedResult')).assertEqual("SUCCESS");
      console.info('[SUB_ARKUI_DRAGEVENT_SETDATA_PARAM_002] END');
      done();
    });
  })
}