/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../MainAbility/utils/Common';

export default function GridScrollEdgeCallbackJsunit() {
  describe('GridScrollEdgeCallbackJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info('text beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridScrollEdgeCallback',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get GridScrollEdgeCallback state pages:' + JSON.stringify(pages));
        if (!('GridScrollEdgeCallback' == pages.name)) {
          console.info('get GridScrollEdgeCallback state pages.name:' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push GridScrollEdgeCallback page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push GridScrollEdgeCallback page error:' + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('GridScrollEdgeCallback after each called');
    });

    /**
     * @tc.name   GridScrollEdgeCallbackTest_1580
     * @tc.number GridScrollEdgeCallbackTest_1580
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GridScrollEdgeCallbackTest_1580', Level.LEVEL1, async (done: Function) => {
      console.info('GridScrollEdgeCallbackTest_1580 START');
      let driver1 = Driver.create();
      let button = await driver1.findComponent(ON.id('GridScrollEdgeCallback01'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('GridTextByScrollEdge01')
      console.info('[Grid_ReachStartAndEnd_0100] component obj1 is: ' + JSON.stringify(JSON.parse(strJson1)))
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('ScrollEdgeSuccess');
      await CommonFunc.sleep(1000);
      console.info('GridScrollEdgeCallbackTest_1580 END');
      done();
    });

  })
}