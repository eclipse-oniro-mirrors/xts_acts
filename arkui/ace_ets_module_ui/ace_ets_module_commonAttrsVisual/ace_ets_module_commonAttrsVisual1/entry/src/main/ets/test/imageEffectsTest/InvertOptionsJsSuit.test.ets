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
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter'

export default function InvertOptionsJsSuit() {
  describe('InvertOptionsJsSuit', () => {
    beforeEach(async (done: Function) => {
      console.info('InvertOptionsJsSuit beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageEffects/InvertOptions',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get InvertOptionsJsSuit state pages: ' + JSON.stringify(pages));
        if (!('overlay' == pages.name)) {
          console.info('get InvertOptionsJsSuit state pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push InvertOptionsJsSuit page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push InvertOptionsJsSuit page error:' + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('overlay after each called');
    });


    /**
     * @tc.name   InvertOptionsJsSuit_0100
     * @tc.number InvertOptionsJsSuit_0100
     * @tc.desc   InvertOptionsJsSuit_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InvertOptionsJsSuit_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[InvertOptionsJsSuit_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('InvertOptionsenum'));
      await button_Bottom.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('InvertOptionsenum');
      console.info('[InvertOptionsJsSuit_0100] obj is: ' + JSON.stringify(JSON.parse(strJson).$attrs.content));
      console.info('[InvertOptionsJsSuit_0100] obj is: ' + JSON.stringify(JSON.parse(strJson).$attrs.invert.low));
      console.info('[InvertOptionsJsSuit_0100] obj is: ' + JSON.stringify(JSON.parse(strJson).$attrs.invert.high));
      console.info('[InvertOptionsJsSuit_0100] obj is: ' + JSON.stringify(JSON.parse(strJson).$attrs.invert.threshold));
      console.info('[InvertOptionsJsSuit_0100] obj is: ' + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .invert
        .thresholdRange));
      expect(JSON.parse(strJson).$attrs.invert.low == '1').assertTrue();
      expect(JSON.parse(strJson).$attrs.invert.high == '1').assertTrue();
      expect(JSON.parse(strJson).$attrs.invert.threshold == '1').assertTrue();
      expect(JSON.parse(strJson).$attrs.invert.thresholdRange == '1').assertTrue();
      console.info('[InvertOptionsJsSuit_0100] END');
      done();
    });
  })
}