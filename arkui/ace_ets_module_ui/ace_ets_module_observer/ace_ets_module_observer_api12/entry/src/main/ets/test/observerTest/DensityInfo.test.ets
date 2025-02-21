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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';


export default function DensityInfoTest() {
  describe('DensityInfoTest', () => {
    beforeEach(async (done: Function) => {
      console.info("DensityInfoTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/observer/DensityInfo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DensityInfoTest state pages: " + JSON.stringify(pages));
        if (!("DensityInfo" == pages.name)) {
          console.info("get DensityInfoTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push DensityInfoTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DensityInfoTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    DensityInfoTest_0100
     * @tc.name      DensityInfoTest_0100
     * @tc.desc      test the api of DensityInfo
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('DensityInfoTest_0100', 0, async (done: Function) => {
      console.info('DensityInfoTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('DensityInfo_id'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('DensityInfo_id');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[DensityInfoTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('DensityInfo succ');
      console.info('[DensityInfoTest_0100] END');
      done();
    });
  })
}

