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
 	 
 	 export default function TriggerSelectNullUndefinedTest() {
 	   describe('TriggerSelectNullUndefinedTest', () => {
 	     beforeEach(async (done: Function) => {
 	       console.info('TriggerSelectNullUndefinedTest beforeEach start');
 	       let options: router.RouterOptions = {
 	         url: 'MainAbility/pages/select/TriggerSelectNullUndefinedExample',
 	       }
 	       try {
 	         router.clear();
 	         let pages = router.getState();
 	         console.info('get TriggerSelectNullUndefinedTest state pages:' + JSON.stringify(pages));
 	         if (!('TriggerSelectNullUndefinedExample' == pages.name)) {
 	           console.info('get TriggerSelectNullUndefinedTest pages.name:' + JSON.stringify(pages.name));
 	           let result = await router.pushUrl(options);
 	           await Utils.sleep(2500);
 	           console.info('push TriggerSelectNullUndefinedTest page result:' + JSON.stringify(result));
 	         }
 	       } catch (err) {
 	         console.error('push TriggerSelectNullUndefinedTest page error:' + err);
 	       }
 	       console.info('TriggerSelectNullUndefinedTest beforeEach end');
 	       done();
 	     });
 	     afterAll(async (done:Function)=>{
 	       AppStorage.delete('triggerSelectNull')
 	       AppStorage.delete('triggerSelectUndefined')
 	       AppStorage.delete('triggerSelectEmpty')
 	       done();
 	     })
 	 
 	     /**
 	      * @tc.name   triggerSelectNullUndefinedTest_001
 	      * @tc.number triggerSelectNullUndefinedTest_001
 	      * @tc.desc   To test the MenuItemConfiguration triggerSelect null
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('triggerSelectNullUndefinedTest_001', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('triggerSelectNullUndefinedTest_001 START')
 	       let driver: Driver = Driver.create();
 	       let select = await driver.findComponent(ON.id('triggerSelectNull'));
 	       await Utils.sleep(200);
 	       await select.click();
 	       await Utils.sleep(200);
 	       let item = await driver.findComponent(ON.text('triggerSelectNull'));
 	       await Utils.sleep(200);
 	       await item.click();
 	       await Utils.sleep(200);
 	       await select.click();
 	       expect(AppStorage.get('triggerSelectNull')).assertEqual(true)
 	       console.log('triggerSelectNullUndefinedTest_001 END')
 	       done();
 	     });
 	     /**
 	      * @tc.name   triggerSelectNullUndefinedTest_002
 	      * @tc.number triggerSelectNullUndefinedTest_002
 	      * @tc.desc   To test the MenuItemConfiguration triggerSelect undefined
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('triggerSelectNullUndefinedTest_002', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('triggerSelectNullUndefinedTest_002 START')
 	       let driver: Driver = Driver.create();
 	       let select = await driver.findComponent(ON.id('triggerSelectUndefined'));
 	       await Utils.sleep(200);
 	       await select.click();
 	       await Utils.sleep(200);
 	       let item = await driver.findComponent(ON.text('triggerSelectUndefined'));
 	       await Utils.sleep(200);
 	       await item.click();
 	       await Utils.sleep(200);
 	       await select.click();
 	       expect(AppStorage.get('triggerSelectUndefined')).assertEqual(true)
 	       console.log('triggerSelectNullUndefinedTest_002 END')
 	       done();
 	     });
 	     /**
 	      * @tc.name   triggerSelectNullUndefinedTest_003
 	      * @tc.number triggerSelectNullUndefinedTest_003
 	      * @tc.desc   To test the MenuItemConfiguration triggerSelect empty
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('triggerSelectNullUndefinedTest_003', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('triggerSelectNullUndefinedTest_003 START')
 	       let driver: Driver = Driver.create();
 	       let select = await driver.findComponent(ON.id('triggerSelectEmpty'));
 	       await Utils.sleep(200);
 	       await select.click();
 	       await Utils.sleep(200);
 	       let item = await driver.findComponent(ON.text('triggerSelectEmpty'));
 	       await Utils.sleep(200);
 	       await item.click();
 	       await Utils.sleep(200);
 	       expect(AppStorage.get('triggerSelectEmpty')).assertEqual(true)
 	       console.log('triggerSelectNullUndefinedTest_003 END')
 	       done();
 	     });
 	   })
 	 }