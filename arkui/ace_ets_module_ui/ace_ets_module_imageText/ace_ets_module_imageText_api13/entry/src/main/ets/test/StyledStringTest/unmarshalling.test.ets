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
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function UnmarshallingErrorCodeTest() {
  describe('UnmarshallingErrorCodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("UnmarshallingErrorCodeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/unmarshalling',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get UnmarshallingErrorCodeTest state pages: " + JSON.stringify(pages));
        if (!("unmarshalling" == pages.name)) {
          console.info("get UnmarshallingErrorCodeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push UnmarshallingErrorCodeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UnmarshallingErrorCodeTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_UnmarshallingErrorCodeTest_0010
     * @tc.name      UnmarshallingErrorCodeTest_0010
     * @tc.desc      test StyledString Unmarshalling ErrorCode: 401
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('UnmarshallingErrorCodeTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('[UnmarshallingErrorCodeTest_0010] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('Unmarshalling_button'));
      await Button.click()
      await CommonFunc.sleep(500);
      await Button.click()
      await CommonFunc.sleep(500);
      console.info('[UnmarshallingErrorCodeTest_0010] click succ');
      let strJson = getInspectorByKey('Unmarshalling_GetCode401');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[UnmarshallingErrorCodeTest_0010] ErrorCode: ' + JSON.stringify(obj.$attrs.text));
      expect(obj.$attrs.text).assertEqual('401');
      console.info('[UnmarshallingErrorCodeTest_0010] END');
      done();
    });
  })
}