/*
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

import { describe, beforeEach, afterEach, it, expect, Level, Size, TestType } from '@ohos/hypium'
import router from '@ohos.router';
import { Driver, On, ON, Component, Point } from '@kit.TestKit';
import Utils from '../../MainAbility/common/Utils';

export default function bindTips1Test() {
  describe('ActsbindTips', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindTips/bindTips1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get bindTips state success ' + JSON.stringify(pages));
        if (!('bindTips1' == pages.name)) {
          console.info('get bindTips state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push bindTips page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push bindTips page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.number bindTips1_0100
     * @tc.name bindTips1_0100
     * @tc.desc Test suspended bubbles
     * @tc.level: Level 1
     * @tc.type : Function
     * @tc.size : MEDIUMTEST
     */
    it('bindTips1_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('bindTips_0100 start');
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('bindTips'));
      let center: Point = await button.getBoundsCenter();
      console.info('[bindTips_0100] component obj is: ' + JSON.stringify(center));
      await driver.mouseMoveTo(center);
      await Utils.sleep(2000);
      let tip: Component = await driver.findComponent(ON.text('test bind tips'));
      expect(!!tip).assertTrue();
      await driver.mouseMoveTo({
        x: 0, y: 0
      });
      await Utils.sleep(5000);
      done();
    });
  })
}
