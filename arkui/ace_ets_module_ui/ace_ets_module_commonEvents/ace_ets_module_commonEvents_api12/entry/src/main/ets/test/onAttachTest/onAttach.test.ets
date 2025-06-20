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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function onAttachTest() {
  describe('onAttachTest', () => {
    beforeEach(async (done: Function) => {
      console.info("onAttachTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/onAttach/onAttach',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onAttachTest state pages:" + JSON.stringify(pages));
        if (!("onAttach" == pages.name)) {
          console.info("get onAttachTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push onAttachTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onAttachTest page error:" + err);
      }
      console.info("onAttachTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("onAttachTest after each called");
    });

    /**
     * @tc.number    onAttachTest_0010
     * @tc.name      onAttachTest_0010
     * @tc.desc      api: onAttach
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('onAttachTest_0010', 0, async (done: Function) => {
      console.info('onAttachTest_0010 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('OnAttach_button'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('OnAttach_text');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('onAttach succ');
      console.info('onAttachTest_0010 END');
      done();
    });

    /**
     * @tc.number    onDetachTest_0020
     * @tc.name      onDetachTest_0020
     * @tc.desc      api: onDetach
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('onDetachTest_0020', 0, async (done: Function) => {
      console.info('onDetachTest_0020 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('OnAttach_button'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('OnAttach_text');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('onDetach succ');
      console.info('onDetachTest_0020 END');
      done();
    });
  })
}
