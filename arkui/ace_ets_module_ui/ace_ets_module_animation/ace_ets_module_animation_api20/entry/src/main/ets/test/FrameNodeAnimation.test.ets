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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter'
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

export default function FrameNodeAnimation() {
  describe('FrameNodeAnimation', () => {
    beforeEach(async (done: Function) => {
      console.info('FrameNodeAnimation beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNodeAnimation',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get FrameNodeAnimation state pages:' + JSON.stringify(pages));
        if (!('FrameNodeAnimation' == pages.name)) {
          console.info('get FrameNodeAnimation pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push FrameNodeAnimation page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push FrameNodeAnimation page error:' + err);
      }
      console.info('FrameNodeAnimation beforeEach end');
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('FrameNodeAnimation after each called');
    });

    /**
     * @tc.number FrameNodeAnimation_001
     * @tc.name FrameNodeAnimation_001
     * @tc.desc test AnimationPropertyType
     * @tc.level Level 0
     * @tc.type
     * @tc.size
     */
    it('FrameNodeAnimation_001', Level.LEVEL0, async (done: Function) => {
      console.info('[FrameNodeAnimation_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let startBtn: Component = await driver.findComponent(ON.text('start'));
      await startBtn.click()
      console.info('[FrameNodeAnimation_001] startBtn click');
      await driver.delayMs(1000);

      let strJson: string = getInspectorByKey('CreateResultText');
      console.info('[FrameNodeAnimation_001] strJson: ' + JSON.parse(strJson).$attrs.content);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('Create:Success');
      console.info('FrameNodeAnimation_001 END');
      done();
    });

    /**
     * @tc.number FrameNodeAnimation_002
     * @tc.name FrameNodeAnimation_002
     * @tc.desc test frameNode getNodePropertyValue
     * @tc.level Level 0
     * @tc.type
     * @tc.size
     */
    it('FrameNodeAnimation_002', Level.LEVEL0, async (done: Function) => {
      console.info('[FrameNodeAnimation_002] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let getBtn: Component = await driver.findComponent(ON.text('get'));
      await getBtn.click()
      console.info('[FrameNodeAnimation_002] getBtn click');
      await driver.delayMs(1000);

      let strJson: string = getInspectorByKey('GetResultText');
      console.info('[FrameNodeAnimation_002] strJson: ' + JSON.parse(strJson).$attrs.content);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('Get:Success');
      console.info('FrameNodeAnimation_002 END');
      done();
    });

    /**
     * @tc.number FrameNodeAnimation_003
     * @tc.name FrameNodeAnimation_003
     * @tc.desc test frameNode cancelAnimations
     * @tc.level Level 0
     * @tc.type
     * @tc.size
     */
    it('FrameNodeAnimation_003', Level.LEVEL0, async (done: Function) => {
      console.info('[FrameNodeAnimation_003] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let cancelBtn: Component = await driver.findComponent(ON.text('cancel'));
      await cancelBtn.click()
      console.info('[FrameNodeAnimation_003] cancelBtn click');
      await driver.delayMs(1000);

      let strJson: string = getInspectorByKey('CancelResultText');
      console.info('[FrameNodeAnimation_003] strJson: ' + JSON.parse(strJson).$attrs.content);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('Cancel:Success');
      console.info('FrameNodeAnimation_003 END');
      done();
    });
  })
}