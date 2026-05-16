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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function openToastTest() {
  describe('openToastTest', () => {
    beforeEach(async (done: Function) => {
      console.info("openToastTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/openToastTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get openToastTest state pages: " + JSON.stringify(pages));
        if (!("openToastTest" == pages.name)) {
          console.info("get openToastTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push openToastTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push openToastTest page error: " + err);
        expect().assertFail();
      }
      done();
    })

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("openToastTest after each called");
    });

    /**
     * @tc.name   openToastTest_0100
     * @tc.number SUB_ACE_openToastTest_0100
     * @tc.desc   To test that the promptAction.openToastTest parameter is an abnormal value(0,undefined,null).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('openToastTest_0100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('openToastTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.text('Open Toast'));
      await button.click();
      await CommonFunc.sleep(1000);
    
      let strJson = getInspectorByKey('code1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('401');

      console.info('openToastTest_0100 END');
      await CommonFunc.sleep(1000);
      done();
    });
  })
}