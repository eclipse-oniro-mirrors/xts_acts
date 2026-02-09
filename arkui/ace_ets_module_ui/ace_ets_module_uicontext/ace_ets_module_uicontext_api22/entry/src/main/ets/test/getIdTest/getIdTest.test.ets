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

import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from '@ohos/hypium'
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function getIdUndefinedTest() {
  describe('getIdUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info('getIdUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getId/getIdTest',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info('get getIdUndefinedTest state pages:' + JSON.stringify(pages));
        if (pages.name !== 'getIdUndefinedTest') { 
          console.info('get getIdUndefinedTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push getIdUndefinedTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push getIdUndefinedTest page error:' + JSON.stringify(err));
        expect().assertFail('页面跳转失败'); 
      }
      console.info('getIdUndefinedTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('getIdUndefinedTest after each called');
    });

    /**
     * @tc.number    getIdUndefinedTest_001
     * @tc.name      getIdUndefinedTest_001
     * @tc.desc      testing getId undefined
     * @tc.level:    Level 1
     */
    it('getIdUndefinedTest_001', Level.LEVEL1, async (done: Function) => {
      console.info('[getIdUndefinedTest_001] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);

        let keyBtn = await driver.findComponent(ON.id('getId2'));
        await keyBtn.click();
        await CommonFunc.sleep(500);

        let strJson = getInspectorByKey('text2'); 
        let obj: ESObject = JSON.parse(strJson);
        console.info('[getIdUndefinedTest_001]:' + obj.$attrs.content);
        expect(obj.$attrs.content).assertEqual('-1'); 
  
      console.info('[getIdUndefinedTest_001] END');
      done();
    });
  });
}