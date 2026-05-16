/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
export default function AddComponentContentNullUndefinedTest() {
  describe('AddComponentContentNullUndefinedTest', () => {
    
    beforeEach(async (done: Function) => {
      console.info('AddComponentContentNullUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/frameNode/AddComponentContentNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        let result = await router.replaceUrl(options);
        console.info('get AddComponentContentNullUndefined state pages:' + JSON.stringify(pages));
        if (!('AddComponentContentNullUndefined' == pages.name)) {
          console.info('get AddComponentContentNullUndefined pages.name:' + JSON.stringify(pages.name));
          await CommonFunc.sleep(1000);
          console.info('push AddComponentContentNullUndefined page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push AddComponentContentNullUndefined page error:' + err);
      }
      console.info('AddComponentContentNullUndefined beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('AddComponentContentNullUndefined after each called');
    });

    /**
     * @tc.name   AddComponentContentNullUndefinedTest_0100
     * @tc.number AddComponentContentNullUndefinedTest_0100
     * @tc.desc   test addComponentContent with null/undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AddComponentContentNullUndefinedTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('AddComponentContentNullUndefinedTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('AddComponentContentNullUndefinedTest_getChildNumber'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('AddComponentContentNullUndefinedTest_text');
 	    let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[AddComponentContentNullUndefinedTest_0100] obj.$attrs.content:' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('2');

      console.info('[AddComponentContentNullUndefinedTest_0100] END');
      done();
    });
  })
}