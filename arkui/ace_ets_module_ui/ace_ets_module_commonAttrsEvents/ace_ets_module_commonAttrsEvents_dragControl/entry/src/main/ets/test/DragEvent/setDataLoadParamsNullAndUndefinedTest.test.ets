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

export default function setDataLoadParamsNullAndUndefinedTest() {
  describe('setDataLoadParamsNullAndUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("setDataLoadParamsNullAndUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/DragEvent/setDataLoadParamsNullAndUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get setDataLoadParamsNullAndUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("setDataLoadParamsNullAndUndefined" == pages.name)) {
          console.info("get setDataLoadParamsNullAndUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push setDataLoadParamsNullAndUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push setDataLoadParamsNullAndUndefinedTest page error:" + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("setDataLoadParamsNullAndUndefinedTest after each called");
    });

    /**
     * @tc.name   SUB_ARKUI_DRAGEVENT_SETDATALOADPARAMS_PARAM_001
     * @tc.number  SUB_ARKUI_DRAGEVENT_SETDATALOADPARAMS_PARAM_001
     * @tc.desc   Test setDataLoadParams with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_DRAGEVENT_SETDATALOADPARAMS_PARAM_001', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_DRAGEVENT_SETDATALOADPARAMS_PARAM_001] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      // 触发拖拽到null测试区域
      let image1 = await driver.findComponent(ON.id('image1'));
      let button = await driver.findComponent(ON.id('testNull'));
      await image1.dragTo(button);
      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_DRAGEVENT_SETDATALOADPARAMS_PARAM_001] setDataLoadParamsNullResult: ' + AppStorage.get('setDataLoadParamsNullResult'));
      expect(AppStorage.get('setDataLoadParamsNullResult')).assertEqual(undefined);
      console.info('[SUB_ARKUI_DRAGEVENT_SETDATALOADPARAMS_PARAM_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_DRAGEVENT_SETDATALOADPARAMS_PARAM_002
     * @tc.number  SUB_ARKUI_DRAGEVENT_SETDATALOADPARAMS_PARAM_002
     * @tc.desc   Test setDataLoadParams with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_DRAGEVENT_SETDATALOADPARAMS_PARAM_002', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_DRAGEVENT_SETDATALOADPARAMS_PARAM_002] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      // 触发拖拽到undefined测试区域
      let image1 = await driver.findComponent(ON.id('image1'));
      let button = await driver.findComponent(ON.id('testUndefined'));
      await image1.dragTo(button);
      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_DRAGEVENT_SETDATALOADPARAMS_PARAM_002] setDataLoadParamsUndefinedResult: ' + AppStorage.get('setDataLoadParamsUndefinedResult'));
      expect(AppStorage.get('setDataLoadParamsUndefinedResult')).assertEqual(undefined);
      console.info('[SUB_ARKUI_DRAGEVENT_SETDATALOADPARAMS_PARAM_002] END');
      done();
    });
  })
}