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
import Utils from '../../MainAbility/common/Utils'
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';


export default function radiounllundefined(){
  describe('radiounllundefined',  () =>{

    beforeEach(async (done: Function) => {
      console.info("radiounllundefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/radioNull/radio',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get slider state success " + JSON.stringify(pages));
        if (!("radio" == pages.name)) {
          console.info("get slider state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push radiounllundefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push radiounllundefined page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("radiounllundefined after each called");
    });


    /**
     * @tc.name   radionull_001
     * @tc.number SUB_ARKUI_API_RADIO_NULL_001
     * @tc.desc   Test Stack alignContent with null parameter in constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('radionull_001', Level.LEVEL0, async (done:Function) =>{
      let tagName = 'slidenullundeifned';
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let resource = getInspectorByKey('Radionull');
      expect(JSON.parse(resource).$attrs.checked).assertEqual('false')
      expect(JSON.parse(resource).$attrs.radioStyle.checkedBackgroundColor).assertEqual(undefined)
      await Utils.sleep(2000);
      console.info('[' + tagName + '] END ===========================');
      done();
    })

    /**
     * @tc.name   radioundefined_001
     * @tc.number SUB_ARKUI_API_RADIO_UNDEFINED_001
     * @tc.desc   Test Stack alignContent with null parameter in constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('radioundefined_001', Level.LEVEL0, async (done:Function) =>{
      let tagName = 'slidenullundeifned';
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let resource = getInspectorByKey('Radionundefined');
      expect(JSON.parse(resource).$attrs.checked).assertEqual('false')
      expect(JSON.parse(resource).$attrs.radioStyle.checkedBackgroundColor).assertEqual(undefined)
      await Utils.sleep(2000);
      console.info('[' + tagName + '] END ===========================');
      done();
    })
  })
}