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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';
export default function SXrenderingStrategyJsunit() {
  describe('SXrenderingStrategyJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("SXrenderingStrategyJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi11/SXrenderingStrategy',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SXrenderingStrategyJsunit state pages:" + JSON.stringify(pages));
        if (!("SXrenderingStrategy" == pages.name)) {
          console.info("get SXrenderingStrategyJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push SXrenderingStrategyJsunit success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SXrenderingStrategyJsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   SXrenderingStrategyJsunit_0100
     * @tc.number SXrenderingStrategyJsunit_0100
     * @tc.desc   test RichEditor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SXrenderingStrategyJsunit_0100', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('SXrenderingStrategyJsunit_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn1 = await driver.findComponent(ON.id('SXrenderingStrategyButton'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let strcontent = getInspectorByKey('SXrenderingStrategyText');
      let obj: ESObject = JSON.parse(strcontent);
      await CommonFunc.sleep(1000);
      console.info('SXrenderingStrategyJsunit_0100 component obj is: ' + obj);
      console.info('SXrenderingStrategyJsunit_0100 component obj.$attrs is: ' + obj.$attrs);
      expect(obj.$attrs.content).assertEqual('0');
      console.info('SXrenderingStrategyJsunit_0100 END')
      done();
    });
  })
}