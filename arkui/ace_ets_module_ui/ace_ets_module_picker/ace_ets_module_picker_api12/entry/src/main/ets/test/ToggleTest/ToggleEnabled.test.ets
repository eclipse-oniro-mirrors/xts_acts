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


export default function ToggleContentEnabled() {
  describe('ToggleContentEnabled', () => {
    beforeEach(async (done: Function) => {
      console.info("ToggleContentEnabled beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Toggle/ToggleEnabled',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ToggleContentEnabled state success " + JSON.stringify(pages));
        if (!("ToggleContentEnabled" == pages.name)) {
          console.info("get ToggleContentEnabled state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push ToggleContentEnabled page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ToggleContentEnabled page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("ToggleContentEnabled after each called");
    });

    /**
      * @tc.number    ArkUI_Stage_Toggle_Content_0200
      * @tc.name      Test the builder property of the Toggle component
      * @tc.desc      set the enabled property value
      * @tc.size: MediumTest
      * @tc.type: Function
      * @tc.level: Level 0
      */
    it('ArkUI_Stage_Toggle_Content_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUI_Stage_Toggle_Content_0200] START');
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('ToggleContentModifier_enabled');
      let obj: ESObject = JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info("[ArkUI_Stage_Toggle_Content_0200] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('enabled status is: true');
      console.info('[ArkUI_Stage_Toggle_Content_0200] END');
      done();
    });
  })
}
