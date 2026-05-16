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

export default function SwiperContentUpdateNullTest() {
  describe('SwiperContentUpdateNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info('SwiperContentUpdateNullTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ParamsNull/SwiperContentUpdateNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get SwiperContentUpdateNullTest state pages:' + JSON.stringify(pages));
        if (!('SwiperContentUpdateNullTest' == pages.name)) {
          console.info('get SwiperContentUpdateNullTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push SwiperContentUpdateNullTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push SwiperContentUpdateNullTest page error:' + err);
      }
      console.info('SwiperContentUpdateNullTest beforeEach end');
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   SwiperContentUpdateNullTest_0100
     * @tc.number SwiperContentUpdateNullTest_0100
     * @tc.desc   swiperContentUpdate null test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SwiperContentUpdateNullTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('SwiperContentUpdateNullTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_onSwiperContentUpdate_null'));
      await button1.click();
      await CommonFunc.sleep(500);
      let button2 = await driver.findComponent(ON.id('btn_onSwiperContentUpdate_undefined'));
      await button2.click();
      await CommonFunc.sleep(500);
      let button3 = await driver.findComponent(ON.id('btn_offSwiperContentUpdate_null'));
      await button3.click();
      await CommonFunc.sleep(500);
      let button4 = await driver.findComponent(ON.id('btn_offSwiperContentUpdate_undefined'));
      await button4.click();
      await CommonFunc.sleep(500);
      expect(AppStorage.get('onSwiperContentUpdateNull')).assertEqual('success');
      expect(AppStorage.get('onSwiperContentUpdateUndefined')).assertEqual('success');
      expect(AppStorage.get('offSwiperContentUpdateNull')).assertEqual('success');
      expect(AppStorage.get('offSwiperContentUpdateUndefined')).assertEqual('success');
      AppStorage.delete('onSwiperContentUpdateNull');
      AppStorage.delete('onSwiperContentUpdateUndefined');
      AppStorage.delete('offSwiperContentUpdateNull');
      AppStorage.delete('offSwiperContentUpdateUndefined');
      console.info('[SwiperContentUpdateNullTest_0100] END');
      done();
    });
  })
}