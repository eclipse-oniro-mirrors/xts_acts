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
 	 
 	 export default function ShowAlertDialogNullUndefinedTest() {
 	   describe('ShowAlertDialogNullUndefinedTest', () => {
 	     beforeEach(async (done: Function) => {
 	       console.info('ShowAlertDialogNullUndefinedTest beforeEach start');
 	       let options: router.RouterOptions = {
 	         url: 'MainAbility/pages/AlertDialog/ShowAlertDialogNullUndefined',
 	       }
 	       try {
 	         router.clear();
 	         let pages = router.getState();
 	         console.info('get ShowAlertDialogNullUndefinedTest state pages:' + JSON.stringify(pages));
 	         if (!('ShowAlertDialogNullUndefined' == pages.name)) {
 	           console.info('get ShowAlertDialogNullUndefinedTest pages.name:' + JSON.stringify(pages.name));
 	           let result = await router.pushUrl(options);
 	           await Utils.sleep(2500);
 	           console.info('push ShowAlertDialogNullUndefinedTest page result:' + JSON.stringify(result));
 	         }
 	       } catch (err) {
 	         console.error('push ShowAlertDialogNullUndefinedTest page error:' + err);
 	       }
 	       console.info('ShowAlertDialogNullUndefinedTest beforeEach end');
 	       done();
 	     });
 	     afterAll(async (done:Function)=>{
 	       AppStorage.delete('showAlertDialogNull')
 	       AppStorage.delete('showAlertDialogUndefined')
 	       done();
 	     })
 	 
 	     /**
 	      * @tc.name   showAlertDialogNullUndefinedTest_001
 	      * @tc.number showAlertDialogNullUndefinedTest_001
 	      * @tc.desc   To test the showAlertDialog null
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('showAlertDialogNullUndefinedTest_001', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('showAlertDialogNullUndefinedTest_001 START')
 	       let driver: Driver = Driver.create();
 	       let btn = await driver.findComponent(ON.id('showAlertDialogNull'));
 	       await Utils.sleep(200);
 	       await btn.click()
 	       await Utils.sleep(200);
 	       expect(AppStorage.get('showAlertDialogNull')).assertEqual(true)
 	       console.log('showAlertDialogNullUndefinedTest_001 END')
 	       done();
 	     });
 	     /**
 	      * @tc.name   showAlertDialogNullUndefinedTest_002
 	      * @tc.number showAlertDialogNullUndefinedTest_002
 	      * @tc.desc   To test the showAlertDialog undefined
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('showAlertDialogNullUndefinedTest_002', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('showAlertDialogNullUndefinedTest_002 START')
 	       let driver: Driver = Driver.create();
 	       let btn = await driver.findComponent(ON.id('showAlertDialogUndefined'));
 	       await Utils.sleep(200);
 	       await btn.click()
 	       await Utils.sleep(200);
 	       expect(AppStorage.get('showAlertDialogUndefined')).assertEqual(true)
 	       console.log('showAlertDialogNullUndefinedTest_002 END')
 	       done();
 	     });
 	   })
 	 }