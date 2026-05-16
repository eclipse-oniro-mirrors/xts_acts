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
 	 
 	 export default function LevelOrderClampNullUndefinedTest() {
 	   describe('LevelOrderClampNullUndefinedTest', () => {
 	     beforeEach(async (done: Function) => {
 	       console.info('AdvancedPopupTest beforeEach start');
 	       let options: router.RouterOptions = {
 	         url: 'MainAbility/pages/promptaction/LevelOrderClampNullUndefined',
 	       }
 	       try {
 	         router.clear();
 	         let pages = router.getState();
 	         let result = await router.replaceUrl(options);
 	         console.info('get LevelOrderClampNullUndefinedTest state pages:' + JSON.stringify(pages));
 	         if (!('LevelOrderClampNullUndefined' == pages.name)) {
 	           console.info('get LevelOrderClampNullUndefinedTest pages.name:' + JSON.stringify(pages.name));
 	           await Utils.sleep(2500);
 	           console.info('push LevelOrderClampNullUndefinedTest page result:' + JSON.stringify(result));
 	         }
 	       } catch (err) {
 	         console.error('push LevelOrderClampNullUndefinedTest page error:' + err);
 	       }
 	       console.info('LevelOrderClampNullUndefinedTest beforeEach end');
 	       done();
 	     });
 	     afterAll(async (done:Function)=>{
 	       AppStorage.delete('setLevelOrderNull')
 	       AppStorage.delete('setLevelOrderUndefined')
 	       done();
 	     })
 	 
 	     /**
 	      * @tc.name   LevelOrderClampNullUndefinedTest_001
 	      * @tc.number LevelOrderClampNullUndefinedTest_001
 	      * @tc.desc   To test the LevelOrder null
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('LevelOrderClampNullUndefinedTest_001', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('LevelOrderClampNullUndefinedTest_001 START')
 	       let driver: Driver = Driver.create();
 	       let btn = await driver.findComponent(ON.id('OpenToastLevelOrderNull'));
 	       await Utils.sleep(200);
 	       await btn.click()
 	       await Utils.sleep(200);
 	       await btn.click()
 	       expect(AppStorage.get('setLevelOrderNull')).assertEqual(true)
 	       console.log('LevelOrderClampNullUndefinedTest_001 END')
 	       done();
 	     });
 	     /**
 	      * @tc.name   LevelOrderClampNullUndefinedTest_002
 	      * @tc.number LevelOrderClampNullUndefinedTest_002
 	      * @tc.desc   To test the LevelOrder undefined
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('LevelOrderClampNullUndefinedTest_002', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('LevelOrderClampNullUndefinedTest_002 START')
 	       let driver: Driver = Driver.create();
 	       let btn = await driver.findComponent(ON.id('OpenToastLevelOrderUndefined'));
 	       await Utils.sleep(200);
 	       await btn.click()
 	       await Utils.sleep(200);
 	       await btn.click()
 	       expect(AppStorage.get('setLevelOrderUndefined')).assertEqual(true)
		   await Utils.sleep(1000);
		   let closeBtn = await driver.findComponent(ON.id('closeToast'));
 	       await closeBtn.click()
		   await Utils.sleep(1000);
 	       console.log('LevelOrderClampNullUndefinedTest_002 END')
 	       done();
 	     });
 	   })
 	 }