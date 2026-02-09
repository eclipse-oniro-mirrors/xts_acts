/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils';
import { Driver, ON } from '@ohos.UiTest';


export default function ToggleSwitchStyle() {
  describe('ToggleSwitchStyle', () => {
    beforeEach(async (done: Function) => {
      console.info("ToggleSwitchStyle beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Toggle/ToggleSwitchStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ToggleSwitchStyle state success " + JSON.stringify(pages));
        if (!("ToggleSwitchStyle" == pages.name)) {
          console.info("get ToggleSwitchStyle state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push ToggleSwitchStyle page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ToggleSwitchStyle page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("ToggleSwitchStyle after each called");
    });


    /**
     * @tc.name   ToggleSwitchStyle_001
     * @tc.number ToggleSwitchStyle_001
     * @tc.desc   Test the switchStyle of the toggle component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ToggleSwitchStyle_001', Level.LEVEL2, async (done: Function) => {
      console.info('[ToggleSwitchStyle_001] START');
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('TogglePointColor_toggle');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[ToggleSwitchStyle_001] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.pointRadius).assertEqual('15.00vp');
      expect(obj1.$attrs.trackBorderRadius).assertEqual('10.00vp');
      expect(obj1.$attrs.switchPointColor).assertEqual('#FF00FF00');
      expect(obj1.$attrs.unselectedColor).assertEqual('#FFFF0000');

      console.info('[ToggleSwitchStyle_001] END');
      done();
    });
  })
}


