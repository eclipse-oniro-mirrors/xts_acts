/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium";
import router from '@ohos.router';
import { UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';
import { MessageManager, Callback } from '../MainAbility/utils/MessageManager';
export default function WorkerUseCurvesTest() {
  describe('WorkerUseCurvesTest', () => {
    beforeEach(async (done: Function) => {
      console.info("WorkerUseCurves beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WorkerUseCurves',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WorkerUseCurves state pages:' + JSON.stringify(pages));
        if (!('WorkerUseCurves' == pages.name)) {
          console.info('get WorkerUseCurves state pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push WorkerUseCurves page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WorkerUseCurves page error:' + err);
      }
      done()
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('WorkerUseCurves after each called');
    });
    /**
     * @tc.name   WorkerUseCurves_0100
     * @tc.number WorkerUseCurves_0100
     * @tc.desc   WorkerUseCurves_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerUseCurves_0100', Level.LEVEL0, async (done: Function) => {
      console.info('WorkerUseCurves_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('workClickId'));
      await button.click();
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('workTextId');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[workTextId_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[workTextId_0100] content obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('texttext');
      console.info('WorkerUseCurves_0100 END');
      done();
    });
  }) 
}