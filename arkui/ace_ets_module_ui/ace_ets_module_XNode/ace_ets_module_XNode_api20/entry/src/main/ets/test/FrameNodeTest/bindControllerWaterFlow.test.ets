/*
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

export default function bindControllerWaterFlow() {
  describe('bindControllerWaterFlow', () => {
    beforeEach(async (done: Function) => {
      console.info('bindControllerWaterFlow beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/bindControllerWaterFlow',
      }
      try {
        router.clear();
        let pages = router.getState();
        let result = await router.replaceUrl(options);
        console.info('get bindControllerWaterFlow state pages:' + JSON.stringify(pages));
        if (!('bindControllerWaterFlow' == pages.name)) {
          console.info('get bindControllerWaterFlow pages.name:' + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info('push bindControllerWaterFlow page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push bindControllerWaterFlow page error:' + err);
      }
      console.info('bindControllerWaterFlow beforeEach end');
      done();
    });

    /**
     * @tc.number    bindControllerWaterFlow_0100
     * @tc.name      bindControllerWaterFlow_0100
     * @tc.desc      frameNode: test bindController error code for WaterFlow
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */
    it('bindControllerWaterFlow_0100', Level.LEVEL2, async (done: Function) => {
      console.info('bindControllerWaterFlow_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('waterFlow_btn_100023'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson: string = getInspectorByKey('error_waterFlow_100023');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[bindControllerWaterFlow_0100] content obj is:' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Error: 100023');
      console.info('[bindControllerWaterFlow_0100] END');
      done();
    });

    /**
     * @tc.number    bindControllerWaterFlow_0200
     * @tc.name      bindControllerWaterFlow_0200
     * @tc.desc      frameNode: test bindController error code for WaterFlow
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('bindControllerWaterFlow_0200', Level.LEVEL2, async (done: Function) => {
      console.info('bindControllerWaterFlow_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('waterFlow_btn_100021'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson: string = getInspectorByKey('error_waterFlow_100021');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[bindControllerWaterFlow_0200] content obj is:' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('100021:The FrameNode is not modifiable.');
      console.info('[bindControllerWaterFlow_0200] END');
      done();
    });
  })
}