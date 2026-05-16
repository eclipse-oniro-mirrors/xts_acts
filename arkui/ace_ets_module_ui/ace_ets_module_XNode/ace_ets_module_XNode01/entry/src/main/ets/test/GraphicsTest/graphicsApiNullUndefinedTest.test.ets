/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
 
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc, { RectValue } from '../../MainAbility/common/Common';

export default function graphicsApiNullUndefinedTest() {
  describe('graphicsApiNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("graphicsApiNullUndefinedTest beforeEach start");
      let options : router.RouterOptions = {
        url: "MainAbility/pages/Graphics/graphicsApiNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get graphicsApiNullUndefined state pages: " + JSON.stringify(pages));
        if (!("graphicsApiNullUndefined" == pages.name)) {
          console.info("get graphicsApiNullUndefined state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info("push graphicsApiNullUndefined success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push graphicsApiNullUndefined page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   graphicsApiNullUndefinedTest_0100
     * @tc.number SUB_ARKUI_API_graphicsApiNullUndefinedTest_0100
     * @tc.desc   setOvalShape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicsApiNullUndefinedTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('graphicsApiNullUndefinedTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
 
      let strJson1 = getInspectorByKey('graphicsApiNullUndefinedFirst');
      let strJson2 = getInspectorByKey('graphicsApiNullUndefinedSecond');
      let strJson3 = getInspectorByKey('graphicsApiShapeClipNullUndefinedFirst');
      let strJson4 = getInspectorByKey('graphicsApiShapeClipNullUndefinedSecond');

      expect(JSON.parse(strJson1).$type).assertEqual('NodeContainer');
      expect(JSON.parse(strJson2).$type).assertEqual('NodeContainer');
      expect(JSON.parse(strJson3).$type).assertEqual('NodeContainer');
      expect(JSON.parse(strJson4).$type).assertEqual('NodeContainer');
      
      console.info('[graphicsApiNullUndefinedTest_0100 ] END');
      done();
    });
  })
}