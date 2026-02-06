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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function BindControllerErrorCodeTest() {
  describe('BindControllerErrorCodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('BindControllerErrorCodeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/BindControllerErrorCodeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        let result = await router.replaceUrl(options);
        console.info('get BindControllerErrorCodeTest state pages:' + JSON.stringify(pages));
        if (!('gestureEventTest' == pages.name)) {
          console.info('get BindControllerErrorCodeTest pages.name:' + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info('push BindControllerErrorCodeTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push BindControllerErrorCodeTest page error:' + err);
      }
      console.info('BindControllerErrorCodeTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('BindControllerErrorCodeTest after each called');
    });

    /**
     * @tc.number    BindControllerErrorCodeTest_0100
     * @tc.name      BindControllerErrorCodeTest_0100
     * @tc.desc      frameNode: test bindController error code
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('BindControllerErrorCodeTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('BindControllerErrorCodeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('error_bnt401_id'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('error_str401_id');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[BindControllerErrorCodeTest_0100] content obj is:' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('401');
      console.info('[BindControllerErrorCodeTest_0100] END');
      done();
    });

    /**
     * @tc.number    BindControllerErrorCodeTest_0100
     * @tc.name      BindControllerErrorCodeTest_0100
     * @tc.desc      frameNode: test bindController error code
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('BindControllerErrorCodeTest_0200', Level.LEVEL2, async (done: Function) => {
      console.info('BindControllerErrorCodeTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('error_bnt100021_id'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('error_str100021_id');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[BindControllerErrorCodeTest_0200] content obj is:' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('100021:The FrameNode is not modifiable.');
      console.info('[BindControllerErrorCodeTest_0200] END');
      done();
    });
  })
}