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

export default function AddComponentContentErrorCodeTest() {
  describe('AddComponentContentErrorCodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('AddComponentContentErrorCodeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/AddComponentContentErrorCodeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        let result = await router.replaceUrl(options);
        console.info('get AddComponentContentErrorCodeTest state pages:' + JSON.stringify(pages));
        if (!('gestureEventTest' == pages.name)) {
          console.info('get AddComponentContentErrorCodeTest pages.name:' + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info('push AddComponentContentErrorCodeTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push AddComponentContentErrorCodeTest page error:' + err);
      }
      console.info('AddComponentContentErrorCodeTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('AddComponentContentErrorCodeTest after each called');
    });

    /**
     * @tc.number    addComponentContentErrorCodeTest_0100
     * @tc.name      addComponentContentErrorCodeTest_0100
     * @tc.desc      frameNode: test Add ComponentContent error code
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('addComponentContentErrorCodeTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('addComponentContentErrorCodeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('check_error_id'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('error_str_id');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[addComponentContentErrorCodeTest_0100] content obj is:' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('100021:The FrameNode is not modifiable.');
      console.info('[addComponentContentErrorCodeTest_0100] END');
      done();
    });

  })
}