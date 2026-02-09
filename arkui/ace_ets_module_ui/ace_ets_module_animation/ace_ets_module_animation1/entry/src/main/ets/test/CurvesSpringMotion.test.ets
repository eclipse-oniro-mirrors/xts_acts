/**
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

export default function CurvesSpringMotion() {
  describe('CurvesSpringMotion', () => {
    beforeEach(async (done: Function) => {
      console.info('CurvesSpringMotion beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CurvesSpringMotion',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get CurvesSpringMotion state pages:' + JSON.stringify(pages));
        if (!('CurvesSpringMotion' == pages.name)) {
          console.info('get CurvesSpringMotion pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push CurvesSpringMotion page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push CurvesSpringMotion page error:' + err);
      }
      console.info('CurvesSpringMotion beforeEach end');
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('CurvesSpringMotion after each called');
    });

    /**
     * @tc.number CurvesSpringMotion_001
     * @tc.name CurvesSpringMotion_001
     * @tc.desc test SpringMotion and responsiveSpringMotion
     * @tc.level Level 0
     * @tc.type
     * @tc.size
     */
    it('CurvesSpringMotion_001', Level.LEVEL0, async (done: Function) => {
      console.info('[CurvesSpringMotion_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);

      let strJson: string = getInspectorByKey('curves1');
      console.info("CurvesSpringMotion_001 obj is: " + strJson);
      console.info("CurvesSpringMotion_001 obj width is: " + JSON.parse(strJson)?.$attrs?.width);
      let width: string = JSON.parse(strJson)?.$attrs?.width;
      console.info("CurvesSpringMotion_001 obj width number is: ", parseInt(width))
      expect(parseInt(width) - 100 <= 1 ).assertTrue();

      let btn = await driver.findComponent(ON.id('curves1'));
      await btn.click();
      console.log("[CurvesSpringMotion_001] click btn");
      await driver.delayMs(3000);
      let strJson2: string = getInspectorByKey('curves1');
      console.info("CurvesSpringMotion_001 obj2 is: " + strJson2);
      console.info("CurvesSpringMotion_001 obj2 width is: " + JSON.parse(strJson2)?.$attrs?.width);
      let width2: string = JSON.parse(strJson2)?.$attrs?.width;
      console.info("CurvesSpringMotion_001 obj2 width2 number is: ", parseInt(width2))
      expect(parseInt(width2) - 50 <= 1 ).assertTrue();
      done();
    });
  })
}