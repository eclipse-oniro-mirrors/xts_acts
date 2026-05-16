/**
 	  * Copyright (c) 2026 Huawei Device Co., Ltd.
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
 	 import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
 	 import { router } from '@kit.ArkUI';
 	 import Utils from '../../MainAbility/common/Utils';
 	 import { Driver, ON, } from '@ohos.UiTest';
 	 
 	 export default function AdvancedPopupTest() {
 	   describe('AdvancedPopupTest', () => {
 	     beforeEach(async (done: Function) => {
 	       console.info('AdvancedPopupTest beforeEach start');
 	       let options: router.RouterOptions = {
 	         url: 'MainAbility/pages/Popup/AdvancedPopup',
 	       }
 	       try {
 	         router.clear();
 	         let pages = router.getState();
 	         console.info('get AdvancedPopupTest state pages:' + JSON.stringify(pages));
 	         if (!('AdvancedPopup' == pages.name)) {
 	           console.info('get AdvancedPopupTest pages.name:' + JSON.stringify(pages.name));
 	           let result = await router.pushUrl(options);
 	           await Utils.sleep(2500);
 	           console.info('push AdvancedPopupTest page result:' + JSON.stringify(result));
 	         }
 	       } catch (err) {
 	         console.error('push AdvancedPopupTest page error:' + err);
 	       }
 	       console.info('AdvancedPopupTest beforeEach end');
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   AdvancedPopupTest_001
 	      * @tc.number AdvancedPopupTest_001
 	      * @tc.desc   To test the Advanced Popup
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('AdvancedPopupTest_001', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('AdvancedPopupTest_001 START')
 	       let driver: Driver = Driver.create();
 	       let popup = await driver.findComponent(ON.text('message1'));
 	       await Utils.sleep(200);
 	       expect(popup != null).assertEqual(true)
 	       console.log('AdvancedPopupTest_001 END')
 	       done();
 	     });
 	     /**
 	      * @tc.name   AdvancedPopupTest_002
 	      * @tc.number AdvancedPopupTest_002
 	      * @tc.desc   To test the Advanced Popup
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('AdvancedPopupTest_002', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('AdvancedPopupTest_002 START')
 	       let driver: Driver = Driver.create();
 	       let popup = await driver.findComponent(ON.text('message2'));
 	       await Utils.sleep(200);
 	       expect(popup != null).assertEqual(true)
 	       console.log('AdvancedPopupTest_002 END')
 	       done();
 	     });
 	   })
 	 }