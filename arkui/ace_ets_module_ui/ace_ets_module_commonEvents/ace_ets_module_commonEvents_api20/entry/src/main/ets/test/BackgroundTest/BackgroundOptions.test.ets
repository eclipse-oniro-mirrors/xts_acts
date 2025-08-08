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
import {describe, beforeAll, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium'
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';
export default function BackgroundOptionsTest() {
  describe('BackgroundOptionsTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Background/BackgroundOptions',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get BackgroundOptionsTest state pages: ' + JSON.stringify(pages));
        if (!('BackgroundOptions' == pages.name)) {
          console.info('get BackgroundOptionsTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push BackgroundOptionsTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push BackgroundOptions page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('BackgroundOptions after each called');
    });
    /**
     * @tc.number    BackgroundOptionsTest_0010
     * @tc.name      BackgroundOptionsTest_0010
     * @tc.desc      set align test succ
     * @tc.level:    Level 1
     */
    it('BackgroundOptionsTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('BackgroundOptionsTest_0010 START');
      let strJson = getInspectorByKey('column1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[colorMetricsTest_0010] backgroundColor1: ' + JSON.stringify(obj.$attrs.align));
      expect(obj.$attrs.align).assertEqual("Alignment.Center");
      console.info('[BackgroundOptionsTest_0010] END');
      done();
    });
  })
}