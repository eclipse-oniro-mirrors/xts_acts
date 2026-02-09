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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
 
export default function getDialogControllerReturnTest() {
  describe('getDialogControllerReturnTest', () => {
    beforeEach(async (done: Function) => {
      console.info("getDialogControllerReturnTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/dialog/getDialogControllerReturn",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getDialogControllerReturn state pages:" + JSON.stringify(pages));
        if (!("getDialogControllerReturn" == pages.name)) {
          console.info("get getDialogControllerReturn pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push getDialogControllerReturn page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getDialogControllerReturn page error:" + err);
      }
      console.info("getDialogControllerReturn beforeEach end");
      done();
    });
 
    /**
     * @tc.name   getDialogControllerReturnTest_0100
     * @tc.number getDialogControllerReturnTest_0100
     * @tc.desc   getDialogControllerReturnTest_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getDialogControllerReturnTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[getDialogControllerReturnTest_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('GetDialogControllerReturnUndefined'));
      await btn.click();
      await CommonFunc.sleep(1000);
      console.info("[getDialogControllerReturnTest_0100] GetDialogControllerReturnUndefined: " + AppStorage.get('GetDialogControllerReturnUndefined'));
      expect(AppStorage.get('GetDialogControllerReturnUndefined')).assertDeepEquals(undefined);
      AppStorage.delete('GetDialogControllerReturnUndefined')
      console.info('[getDialogControllerReturnTest_0100] END');
      done();
    });

  })
}