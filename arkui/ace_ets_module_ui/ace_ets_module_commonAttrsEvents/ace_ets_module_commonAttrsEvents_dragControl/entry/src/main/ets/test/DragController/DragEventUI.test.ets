/*
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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function DragEventUITest() {

  describe('DragEventUITest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragController/DragEventUI',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DragEventUI state pages: " + JSON.stringify(pages));
        if (!("DragEventUI" == pages.name)) {
          console.info("get DragEventUI state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push DragEventUI success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DragEventUI page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("DragEventUI after each called");
    });

    /**
     * @tc.name   DragEventUI_0010
     * @tc.number DragEventUI_0010
     * @tc.desc   api: UIContext DragController
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DragEventUI_0010', Level.LEVEL0, async (done: Function) => {
      console.info('DragEventUI_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('10001'));
      let button2 = await driver.findComponent(ON.id('401'));
      await button.click();
      await CommonFunc.sleep(500);
      await button2.click();
      await CommonFunc.sleep(500);
      console.info("[DragEventUI_0010] dragPreviewOptions: " + JSON.stringify(AppStorage.get('executeDrag10001')));
      console.info("[DragEventUI_0010] dragPreviewOptions: " + JSON.stringify(AppStorage.get('getRectangleById')));
      console.info("[DragEventUI_0010] dragPreviewOptions: " + JSON.stringify(AppStorage.get('executeDrag401')));
      expect(AppStorage.get('getRectangleById')).assertEqual('100001');
      expect(AppStorage.get('executeDrag10001')).assertEqual('100001');
      expect(AppStorage.get('executeDrag401')).assertEqual('"401"');
      console.info('[DragEventUI_0010] END');
      done();
    });
  })
}