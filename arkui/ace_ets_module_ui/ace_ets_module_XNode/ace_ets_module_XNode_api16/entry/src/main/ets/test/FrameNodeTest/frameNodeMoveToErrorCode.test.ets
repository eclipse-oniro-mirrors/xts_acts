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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect} from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function frameNodeMoveToErrorCodeTest() {
  describe('frameNodeMoveToErrorCodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('frameNodeMoveToErrorCodeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/frameNodeMoveToErrorCodeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        let result = await router.replaceUrl(options);
        console.info('get frameNodeMoveToErrorCodeTest state pages:' + JSON.stringify(pages));
        if (!('gestureEventTest' == pages.name)) {
          console.info('get frameNodeMoveToErrorCodeTest pages.name:' + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info('push frameNodeMoveToErrorCodeTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push frameNodeMoveToErrorCodeTest page error:' + err);
      }
      console.info('frameNodeMoveToErrorCodeTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('frameNodeMoveToErrorCodeTest after each called');
    });

    /**
     * @tc.name   frameNodeMoveToErrorCodeTest_0100
     * @tc.number frameNodeMoveToErrorCodeTest_0100
     * @tc.desc   frameNode: test UINode node move error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('frameNodeMoveToErrorCodeTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('frameNodeMoveOneTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('check_error_id'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('error_str_id');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[frameNodeMoveToErrorCodeTest_0100] content obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('100021:The FrameNode is not modifiable.');
      console.info('[frameNodeMoveToErrorCodeTest_0100] END');
      done();
    });

  })
}