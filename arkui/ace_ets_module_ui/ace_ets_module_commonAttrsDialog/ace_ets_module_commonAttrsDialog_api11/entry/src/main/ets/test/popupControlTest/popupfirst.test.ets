/*
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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import router from '@ohos.router';

export default function abilityTest() {
  describe('ActsAbilityTest',  () =>{
    beforeAll(async (done:Function) =>{
      let options:router.RouterOptions = {
        url: "MainAbility/pages/popupControl/popupfirst",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get popupfirst state success " + JSON.stringify(pages));
        if (!("popupfirst" == pages.name)) {
          console.info("get popupfirst state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push popupfirst page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push popupfirst page error " + JSON.stringify(err));
      }
      done()
    });
    /**
     * @tc.number    ArkUX_Stage_Popup_0100
     * @tc.name      Popup added enableArrow and placement interface coverage
     * @tc.desc      Popup added enableArrow and placement interface coverage
     */
    it('ArkUX_Stage_Popup_0100', 0, async (done:Function) =>{
      console.info('ArkUX_Stage_Popup_0100 START');
      setTimeout(() => {
        try {
          console.info("ArkUX_Stage_Popup_0100 component obj is: " + JSON.stringify(JSON.parse(getInspectorByKey('forPopup'))));
          expect(JSON.parse(getInspectorByKey('forPopup')).$attrs.bindPopup).assertEqual(undefined);
          console.info('ArkUX_Stage_Popup_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Popup_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

  })
}