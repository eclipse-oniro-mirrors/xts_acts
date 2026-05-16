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
 	 import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
 	 import router from '@ohos.router';
 	 import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
 	 import Utils from '../Utils';
 	 
 	 export default function setDefaultThemeNullTest() {
 	   describe('setDefaultThemeNullTest', () => {
 	     beforeEach(async (done: Function) => {
 	       console.info("setDefaultThemeNullTest beforeEach start");
 	       let options: router.RouterOptions = {
 	         url: 'MainAbility/pages/theme/setDefaultThemeNull',
 	       }
 	       try {
 	         router.clear();
 	         let pages = router.getState();
 	         console.info("get setDefaultThemeNullTest state pages:" + JSON.stringify(pages));
 	         if (!("gestureEventTest" == pages.name)) {
 	           console.info("get setDefaultThemeNullTest pages.name:" + JSON.stringify(pages.name));
 	           let result = await router.pushUrl(options);
 	           await Utils.sleep(2000);
 	           console.info("push setDefaultThemeNullTest page result:" + JSON.stringify(result));
 	         }
 	       } catch (err) {
 	         console.error("push setDefaultThemeNullTest page error:" + err);
 	       }
 	       console.info("setDefaultThemeNullTest beforeEach end");
 	       done();
 	     });
 	 
 	     afterEach(async () => {
 	       await Utils.sleep(1000);
 	       console.info("setDefaultThemeNullTest after each called");
 	     });
 	 
 	     /**
 	      * @tc.name   setDefaultThemeNullTest_0100
 	      * @tc.number setDefaultThemeNullTest_0100
 	      * @tc.desc   setDefaultTheme null test
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('setDefaultThemeNullTest_0100', Level.LEVEL2, async (done: Function) => {
 	       console.info('setDefaultThemeNullTest_0100 START');
           let driver = await Driver.create();
 	       await Utils.sleep(1000);
 	       let strJsonBefore: string = getInspectorByKey('text_setDefaultTheme_id');
           let button = await driver.findComponent(ON.id('btn_setDefaultTheme_id'));
           await button.click();
           await Utils.sleep(1000);
           let strJsonAfter: string = getInspectorByKey('text_setDefaultTheme_id');
 	       let objBefore: Record<string, ESObject> = JSON.parse(strJsonBefore);
 	       console.info("[setDefaultThemeNullTest_0100] component objBefore is: " + JSON.stringify(objBefore));
 	       console.info("[setDefaultThemeNullTest_0100] content objBefore is: " + JSON.stringify(objBefore.$attrs.fontColor));
 	       let objAfter: Record<string, ESObject> = JSON.parse(strJsonAfter);
 	       console.info("[setDefaultThemeNullTest_0100] component objAfter is: " + JSON.stringify(objAfter));
 	       console.info("[setDefaultThemeNullTest_0100] content objAfter is: " + JSON.stringify(objAfter.$attrs.fontColor));
 	       expect(objBefore.$attrs.fontColor).assertEqual(objAfter.$attrs.fontColor);
 	       console.info('[setDefaultThemeNullTest_0100] END');
 	       done();
 	     });
 	 
 	   })
 	 }