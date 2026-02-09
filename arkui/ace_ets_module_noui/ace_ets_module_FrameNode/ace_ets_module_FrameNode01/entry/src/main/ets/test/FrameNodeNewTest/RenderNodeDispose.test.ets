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

export default function RenderNodeDisposeTest() {
  describe('RenderNodeDisposeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('RenderNodeDisposeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNodeNew/RenderNodeDisposeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        let result = await router.replaceUrl(options);
        console.info('get RenderNodeDisposeTest state pages:' + JSON.stringify(pages));
        if (!('gestureEventTest' == pages.name)) {
          console.info('get RenderNodeDisposeTest pages.name:' + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info('push RenderNodeDisposeTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push RenderNodeDisposeTest page error:' + err);
      }
      console.info('RenderNodeDisposeTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('RenderNodeDisposeTest after each called');
    });

    /**
     * @tc.name   renderNodeDisposeTest_0100
     * @tc.number renderNodeDisposeTest_0100
     * @tc.desc   frameNode: renderNode Dispose Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('renderNodeDisposeTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('renderNodeDisposeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('dispose_id'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('result_id'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('dispose_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[frameNodeIsVisibleTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[frameNodeIsVisibleTest_0100] content obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Init');
      console.info('[renderNodeDisposeTest_0100] END');
      done();
    });

  })
}