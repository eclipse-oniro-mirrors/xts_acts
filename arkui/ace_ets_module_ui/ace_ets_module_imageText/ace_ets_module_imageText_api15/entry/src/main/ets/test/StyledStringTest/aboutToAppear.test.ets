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
import { describe, beforeEach, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';


export default function AboutToAppearTest() {
  describe('AboutToAppearTest', () => {
    beforeEach(async (done: Function) => {
      console.info("AboutToAppearTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/aboutToAppear',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AboutToAppearTest state pages: " + JSON.stringify(pages));
        if (!("AboutToAppearTest" == pages.name)) {
          console.info("get AboutToAppearTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AboutToAppearTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AboutToAppearTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.number    SUB_ACE_TextArea_KeyboardAppearanceTest_0010
     * @tc.name      AboutToAppearTest_0010
     * @tc.desc      The aboutToAppear method is added to the property string
     * @tc.level:    Level 2
     * @tc.type : 
     * @tc.size :
     */
    it('AboutToAppearTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[AboutToAppearTest_0010] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[AboutToAppearTest_0010] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.content).assertEqual('运动45分钟');
      console.info('[AboutToAppearTest_0010] END');
      done();
    });

  })
}

