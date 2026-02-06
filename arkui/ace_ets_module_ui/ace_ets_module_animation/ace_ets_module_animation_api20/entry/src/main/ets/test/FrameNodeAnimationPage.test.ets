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

export default function FrameNodeAnimationPage() {
  describe('FrameNodeAnimationPage', () => {
    beforeEach(async (done: Function) => {
      console.info('FrameNodeAnimationPage beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNodeAnimationPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get FrameNodeAnimationPage state pages:' + JSON.stringify(pages));
        if (!('FrameNodeAnimationPage' == pages.name)) {
          console.info('get FrameNodeAnimationPage pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push FrameNodeAnimationPage page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push FrameNodeAnimationPage page error:' + err);
      }
      console.info('FrameNodeAnimationPage beforeEach end');
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('FrameNodeAnimationPage after each called');
    });

    /**
     * @tc.name   FrameNodeAnimationPage_001
     * @tc.number FrameNodeAnimationPage_001
     * @tc.desc   test createAnimation return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FrameNodeAnimationPage_001', Level.LEVEL0, async (done: Function) => {
      console.info('[FrameNodeAnimationPage_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let failBtn: Component = await driver.findComponent(ON.text('failBtn'));
      await failBtn.click()
      console.info('[FrameNodeAnimationPage_001] failBtn click');
      await driver.delayMs(1000);

      let getValue: boolean = AppStorage.get('checkCreatFail') as boolean
      console.log('FrameNodeAnimationPage_001 getValue: ', getValue)
      expect(getValue).assertFalse();
      AppStorage.delete('checkCreatFail')
      console.info('FrameNodeAnimationPage_001 END');
      done();
    });

    /**
     * @tc.name   FrameNodeAnimationPage_002
     * @tc.number FrameNodeAnimationPage_002
     * @tc.desc   test createAnimation return true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FrameNodeAnimationPage_002', Level.LEVEL0, async (done: Function) => {
      console.info('[FrameNodeAnimationPage_002] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let succBtn: Component = await driver.findComponent(ON.text('succBtn'));
      await succBtn.click()
      console.info('[FrameNodeAnimationPage_002] succBtn click');
      await driver.delayMs(1000);

      let getValue: boolean = AppStorage.get('checkCreatSucc') as boolean
      console.log('FrameNodeAnimationPage_002 getValue: ', getValue)
      expect(getValue).assertTrue();
      AppStorage.delete('checkCreatSucc')
      console.info('FrameNodeAnimationPage_002 END');
      done();
    });


    /**
     * @tc.name   FrameNodeAnimationPage_003
     * @tc.number FrameNodeAnimationPage_003
     * @tc.desc   test frameNode cancelAnimations return true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FrameNodeAnimationPage_003', Level.LEVEL0, async (done: Function) => {
      console.info('[FrameNodeAnimationPage_003] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let cancelBtn: Component = await driver.findComponent(ON.text('cancelSucc'));
      await cancelBtn.click()
      console.info('[FrameNodeAnimationPage_003] cancelBtn click');
      await driver.delayMs(1000);

      let getValue: boolean = AppStorage.get('checkCancelSucc') as boolean
      console.log('FrameNodeAnimationPage_003 getValue: ', getValue)
      expect(getValue).assertTrue();
      AppStorage.delete('checkCancelSucc')

      console.info('FrameNodeAnimationPage_003 END');
      done();
    });

    /**
     * @tc.name   FrameNodeAnimationPage_004
     * @tc.number FrameNodeAnimationPage_004
     * @tc.desc   test frameNode cancelAnimations return  false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FrameNodeAnimationPage_004', Level.LEVEL0, async (done: Function) => {
      console.info('[FrameNodeAnimationPage_004] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let cancelBtn: Component = await driver.findComponent(ON.text('cancelFail'));
      await cancelBtn.click()
      console.info('[FrameNodeAnimationPage_004] cancelBtn click');
      await driver.delayMs(1000);

      let getValue: boolean = AppStorage.get('checkCancelFail') as boolean
      console.log('FrameNodeAnimationPage_003 getValue: ', getValue)
      expect(getValue).assertFalse();
      AppStorage.delete('checkCancelFail')

      console.info('FrameNodeAnimationPage_004 END');
      done();
    });

    /**
     * @tc.name   FrameNodeAnimationPage_005
     * @tc.number FrameNodeAnimationPage_005
     * @tc.desc   test getNodePropertyValue return type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FrameNodeAnimationPage_005', Level.LEVEL0, async (done: Function) => {
      console.info('[FrameNodeAnimationPage_005] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let getBtn: Component = await driver.findComponent(ON.text('get'));
      await getBtn.click()
      console.info('[FrameNodeAnimationPage_005] getBtn click');
      await driver.delayMs(1000);

      let getValue: Array<number> = AppStorage.get('checkGetNodePropertyValue') as Array<number>
      console.log('FrameNodeAnimationPage_005 getValue: ', getValue)
      expect(getValue?.length).assertEqual(3);
      AppStorage.delete('checkGetNodePropertyValue')
      console.info('FrameNodeAnimationPage_005 END');
      done();
    });

    /**
     * @tc.name   FrameNodeAnimationPage_006
     * @tc.number FrameNodeAnimationPage_006
     * @tc.desc   test getNodePropertyValue return Empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FrameNodeAnimationPage_006', Level.LEVEL0, async (done: Function) => {
      console.info('[FrameNodeAnimationPage_006] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let getEmptyBtn: Component = await driver.findComponent(ON.text('getEmpty'));
      await getEmptyBtn.click()
      console.info('[FrameNodeAnimationPage_006] getEmptyBtn click');
      await driver.delayMs(1000);

      let getValue: Array<number> = AppStorage.get('checkNullNodePropertyValue') as Array<number>
      console.log('FrameNodeAnimationPage_006 getValue: ', getValue)
      expect(getValue?.length).assertEqual(0);
      AppStorage.delete('checkNullNodePropertyValue')
      console.info('FrameNodeAnimationPage_006 END');
      done();
    });
  })
}