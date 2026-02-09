/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import { MessageManager, Callback } from '../MainAbility/utils/MessageManager';


export default function toggleJsunit() {
  describe('toggleTest', () => {
    beforeEach(async (done: Function) => {
      console.info("Toggle beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/toggle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Toggle state pages: " + JSON.stringify(pages));
        if (!("toggle" == pages.name)) {
          console.info("get Toggle state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
        }
      } catch (err) {
        console.error("push Toggle page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   ToggleJsunit001
     * @tc.number ToggleJsunit001
     * @tc.desc   Set selectedColor values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ToggleJsunit001', Level.LEVEL0, async (done: Function) => {
      console.info('[ToggleJsunit001] START');
      let strJson = getInspectorByKey('toggleCheckbox');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ToggleJsunit001] obj: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.selectedColor).assertEqual('#FF0000FF');
      console.info('[ToggleJsunit001] END');
      done();
    });

    /**
     * @tc.name   ToggleJsunit002
     * @tc.number ToggleJsunit002
     * @tc.desc   Set switchPointColor values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ToggleJsunit002', Level.LEVEL0, async (done: Function) => {
      console.info('[ToggleJsunit002] START');
      let strJson = getInspectorByKey('toggleCheckbox');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ToggleJsunit002] obj: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.switchPointColor).assertEqual('#FF008000');
      console.info('[ToggleJsunit002] END');
      done();
    });

    /**
     * @tc.name   ToggleJsunit003
     * @tc.number ToggleJsunit003
     * @tc.desc   Change selectedColor values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ToggleJsunit003', Level.LEVEL0, async (done: Function) => {
      console.info('ToggleJsunit003 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)
      let strJsonNew = getInspectorByKey('toggleCheckbox'); //测试组件的key名称
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("ToggleJsunit003 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.selectedColor).assertEqual("#FF0000FF"); //
      console.info('ToggleJsunit003 END');
      done();
    });
  })
}