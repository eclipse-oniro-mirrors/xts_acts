/*
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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function KeyframeAnimateToNullTest() {
  describe('KeyframeAnimateToNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info('KeyframeAnimateToNullTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ParamsNull/KeyframeAnimateToNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get KeyframeAnimateToNullTest state pages:' + JSON.stringify(pages));
        if (!('KeyframeAnimateToNullTest' == pages.name)) {
          console.info('get KeyframeAnimateToNullTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push KeyframeAnimateToNullTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push KeyframeAnimateToNullTest page error:' + err);
      }
      console.info('KeyframeAnimateToNullTest beforeEach end');
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   KeyframeAnimateToNullTest_0100
     * @tc.number KeyframeAnimateToNullTest_0100
     * @tc.desc   keyframeAnimateTo null test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('KeyframeAnimateToNullTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('KeyframeAnimateToNullTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_keyframeAnimateTo1_null'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('btn_keyframeAnimateTo2_null'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let button3 = await driver.findComponent(ON.id('btn_keyframeAnimateTo1_undefined'));
      await button3.click();
      await CommonFunc.sleep(1000);
      let button4 = await driver.findComponent(ON.id('btn_keyframeAnimateTo2_undefined'));
      await button4.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('keyframeAnimateTo1Null')).assertEqual('success');
      expect(AppStorage.get('keyframeAnimateTo2Null')).assertEqual('success');
      expect(AppStorage.get('keyframeAnimateTo1Undefined')).assertEqual('success');
      expect(AppStorage.get('keyframeAnimateTo2Undefined')).assertEqual('success');
      AppStorage.delete('keyframeAnimateTo1Null');
      AppStorage.delete('keyframeAnimateTo2Null');
      AppStorage.delete('keyframeAnimateTo1Undefined');
      AppStorage.delete('keyframeAnimateTo2Undefined');
      console.info('[KeyframeAnimateToNullTest_0100] END');
      done();
    });
  })
}