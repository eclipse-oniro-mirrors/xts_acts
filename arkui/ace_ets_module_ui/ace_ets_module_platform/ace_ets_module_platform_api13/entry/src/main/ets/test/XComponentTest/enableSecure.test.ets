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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function enableSecureTest() {
  describe('enableSecureTest', () => {
    beforeEach(async (done: Function) => {
      console.info("enableSecureTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/XComponent/enableSecure",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get enableSecureTest state pages: " + JSON.stringify(pages));
        if (!("enableSecureTest" == pages.name)) {
          console.info("get enableSecureTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push enableSecureTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push enableSecureTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number enableSecureTest_0010
     * @tc.name enableSecureTest_0010
     * @tc.desc Xcomponent: get the api of enableSecureTest
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('enableSecureTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('enableSecureTest_0010 START');
      let driver = await Driver.create()
	  console.info('enableSecureTest_0010 Driver');
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('enableSecureTest_button1'));
	  console.info('enableSecureTest_0010 getButton1');
      await CommonFunc.sleep(1000);
      await button1.click();
	  console.info('enableSecureTest_0010 Click1');
      await CommonFunc.sleep(1500);
      let button2 = await driver.findComponent(ON.id('enableSecureTest_button2'));
	  console.info('enableSecureTest_0010 getButton2');
      await CommonFunc.sleep(1000);
      await button2.click();
	  console.info('enableSecureTest_0010 Click2');
      await CommonFunc.sleep(1500);
	  let strJson = getInspectorByKey('xcomponent');
	  console.info("[enableSecureTest_0010] img1_attrs: " + JSON.stringify(JSON.parse(strJson).$attrs));
	  console.info("[enableSecureTest_0010] img1_attrs_enableSecure: " + JSON.stringify(JSON.parse(strJson).$attrs.enableSecure));
	  console.info("[enableSecureTest_0010] img1_attrs_height: " + JSON.stringify(JSON.parse(strJson).$attrs.height));
      expect(JSON.parse(strJson).$attrs.enableSecure).assertEqual('true');
	  
      console.info('[enableSecureTest_0010] END'); 
      done();
    });
  })
}


