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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function IsDisposedTest() {
  describe('IsDisposedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("IsDisposedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/NodeReturn/IsDisposedTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        let result = await router.replaceUrl(options);
        console.info("get IsDisposedTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get IsDisposedTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push IsDisposedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push IsDisposedTest page error:" + err);
      }
      console.info("IsDisposedTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("IsDisposedTest after each called");
    });

    /**
     * @tc.name   IsDisposedTest_0100
     * @tc.number IsDisposedTest_0100
     * @tc.desc   frameNode: UIContext isDisposed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IsDisposedTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('IsDisposedTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_DisposeTest'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson1: string = getInspectorByKey('BuilderNodeBeforeValue');
      let obj1: Record<string, ESObject> = JSON.parse(strJson1);
      let strJson2: string = getInspectorByKey('BuilderNodeAfterValue');
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      let strJson3: string = getInspectorByKey('FrameNodeBeforeValue');
      let obj3: Record<string, ESObject> = JSON.parse(strJson3);
      let strJson4: string = getInspectorByKey('FrameNodeAfterValue');
      let obj4: Record<string, ESObject> = JSON.parse(strJson4);
      let strJson5: string = getInspectorByKey('RenderNodeBeforeValue');
      let obj5: Record<string, ESObject> = JSON.parse(strJson5);
      let strJson6: string = getInspectorByKey('RenderNodeAfterValue');
      let obj6: Record<string, ESObject> = JSON.parse(strJson6);
      let strJson7: string = getInspectorByKey('NodeAdapterBeforeValue');
      let obj7: Record<string, ESObject> = JSON.parse(strJson7);
      let strJson9: string = getInspectorByKey('ComponentContentBeforeValue');
      let obj9: Record<string, ESObject> = JSON.parse(strJson9);
      let strJson10: string = getInspectorByKey('ComponentContentAfterValue');
      let obj10: Record<string, ESObject> = JSON.parse(strJson10);

      expect(obj1.$attrs.content).assertEqual('false');
      expect(obj2.$attrs.content).assertEqual('true');
      expect(obj3.$attrs.content).assertEqual('false');
      expect(obj4.$attrs.content).assertEqual('true');
      expect(obj5.$attrs.content).assertEqual('false');
      expect(obj6.$attrs.content).assertEqual('true');
      expect(obj7.$attrs.content).assertEqual('false');
      expect(obj9.$attrs.content).assertEqual('undefined');
      expect(obj10.$attrs.content).assertEqual('undefined');
      console.info('[IsDisposedTest_0100] END');
      done();
    });

  })
}