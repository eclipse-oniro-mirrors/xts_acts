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
 	 
 	 export default function PromptActionMethodNullUndefinedTest() {
 	   describe('PromptActionMethodNullUndefinedTest', () => {
 	     beforeEach(async (done: Function) => {
 	       console.info('PromptActionMethodNullUndefinedTest beforeEach start');
 	       let options: router.RouterOptions = {
 	         url: 'MainAbility/pages/promptaction/PromptActionMethodNullUndefined',
 	       }
 	       try {
 	         router.clear();
 	         let pages = router.getState();
 	         console.info('get PromptActionMethodNullUndefinedTest state pages:' + JSON.stringify(pages));
 	         let result = await router.replaceUrl(options);
 	         if (!('PromptActionMethodNullUndefined' == pages.name)) {
 	           console.info('get PromptActionMethodNullUndefinedTest pages.name:' + JSON.stringify(pages.name));
 	           await Utils.sleep(2500);
 	           console.info('push PromptActionMethodNullUndefinedTest page result:' + JSON.stringify(result));
 	         }
 	       } catch (err) {
 	         console.error('push PromptActionMethodNullUndefinedTest page error:' + err);
 	       }
 	       console.info('PromptActionMethodNullUndefinedTest beforeEach end');
 	       done();
 	     });
 	     afterAll(async (done:Function)=>{
 	       AppStorage.delete('promptActionShowToast1')
 	       AppStorage.delete('promptActionShowToast2')
 	       AppStorage.delete('promptActionShowToast3')
 	       AppStorage.delete('promptActionShowToast4')
 	       AppStorage.delete('promptActionOpenToast1')
 	       AppStorage.delete('promptActionOpenToast2')
 	       AppStorage.delete('promptActionOpenToast3')
 	       AppStorage.delete('promptActionOpenToast4')
 	       AppStorage.delete('promptActionShowDialog1')
 	       AppStorage.delete('promptActionShowDialog2')
 	       AppStorage.delete('promptActionShowDialog3')
 	       AppStorage.delete('promptActionShowDialog4')
 	       AppStorage.delete('promptActionShowDialog5')
 	       AppStorage.delete('promptActionShowDialog6')
 	       AppStorage.delete('promptActionShowDialog7')
 	       AppStorage.delete('promptActionShowDialog8')
 	       AppStorage.delete('promptActionShowActionMenu1')
 	       AppStorage.delete('promptActionShowActionMenu2')
 	       AppStorage.delete('promptActionShowActionMenu3')
 	       AppStorage.delete('promptActionShowActionMenu4')
 	       AppStorage.delete('promptActionShowActionMenu5')
 	       AppStorage.delete('promptActionShowActionMenu6')
 	       AppStorage.delete('promptActionShowActionMenu7')
 	       AppStorage.delete('promptActionShowActionMenu8')
 	       done();
 	     })
 	 
 	     /**
 	      * @tc.name   PromptActionMethodNullUndefinedTest_001
 	      * @tc.number PromptActionMethodNullUndefinedTest_001
 	      * @tc.desc   To test the promptAction showToast
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('PromptActionMethodNullUndefinedTest_001', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('PromptActionMethodNullUndefinedTest_001 START')
 	       let driver: Driver = Driver.create();
 	       let btn = await driver.findComponent(ON.id('promptActionShowToast1'));
 	       await Utils.sleep(200);
 	       await btn.click()
		   await Utils.sleep(200);
 	       await btn.click()
 	       await Utils.sleep(200);
 	       expect(AppStorage.get('promptActionShowToast1')).assertEqual(true)
 	       console.log('PromptActionMethodNullUndefinedTest_001 END')
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   PromptActionMethodNullUndefinedTest_002
 	      * @tc.number PromptActionMethodNullUndefinedTest_002
 	      * @tc.desc   To test the promptAction showToast
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('PromptActionMethodNullUndefinedTest_002', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('PromptActionMethodNullUndefinedTest_002 START')
 	       let driver: Driver = Driver.create();
 	       let btn = await driver.findComponent(ON.id('promptActionShowToast2'));
 	       await Utils.sleep(200);
 	       await btn.click()
 	       await Utils.sleep(200);
 	       expect(AppStorage.get('promptActionShowToast2')).assertEqual(true)
 	       console.log('PromptActionMethodNullUndefinedTest_002 END')
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   PromptActionMethodNullUndefinedTest_003
 	      * @tc.number PromptActionMethodNullUndefinedTest_003
 	      * @tc.desc   To test the promptAction showToast
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('PromptActionMethodNullUndefinedTest_003', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('PromptActionMethodNullUndefinedTest_003 START')
 	       let driver: Driver = Driver.create();
 	       let btn = await driver.findComponent(ON.id('promptActionShowToast3'));
 	       await Utils.sleep(200);
 	       await btn.click()
 	       await Utils.sleep(200);
 	       expect(AppStorage.get('promptActionShowToast3')).assertEqual(true)
 	       console.log('PromptActionMethodNullUndefinedTest_003 END')
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   PromptActionMethodNullUndefinedTest_004
 	      * @tc.number PromptActionMethodNullUndefinedTest_004
 	      * @tc.desc   To test the promptAction showToast
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('PromptActionMethodNullUndefinedTest_004', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('PromptActionMethodNullUndefinedTest_004 START')
 	       let driver: Driver = Driver.create();
 	       let btn = await driver.findComponent(ON.id('promptActionShowToast4'));
 	       await Utils.sleep(200);
 	       await btn.click()
 	       await Utils.sleep(200);
 	       expect(AppStorage.get('promptActionShowToast4')).assertEqual(true)
 	       console.log('PromptActionMethodNullUndefinedTest_004 END')
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   PromptActionMethodNullUndefinedTest_005
 	      * @tc.number PromptActionMethodNullUndefinedTest_005
 	      * @tc.desc   To test the promptAction openToast
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('PromptActionMethodNullUndefinedTest_005', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('PromptActionMethodNullUndefinedTest_005 START')
 	       let driver: Driver = Driver.create();
 	       let btn = await driver.findComponent(ON.id('promptActionOpenToast1'));
 	       await Utils.sleep(200);
 	       await btn.click()
 	       await Utils.sleep(200);
 	       expect(AppStorage.get('promptActionOpenToast1')).assertEqual(true)
 	       console.log('PromptActionMethodNullUndefinedTest_005 END')
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   PromptActionMethodNullUndefinedTest_006
 	      * @tc.number PromptActionMethodNullUndefinedTest_006
 	      * @tc.desc   To test the promptAction openToast
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('PromptActionMethodNullUndefinedTest_006', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('PromptActionMethodNullUndefinedTest_006 START')
 	       let driver: Driver = Driver.create();
 	       let btn = await driver.findComponent(ON.id('promptActionOpenToast2'));
 	       await Utils.sleep(200);
 	       await btn.click()
 	       await Utils.sleep(200);
 	       expect(AppStorage.get('promptActionOpenToast2')).assertEqual(true)
 	       console.log('PromptActionMethodNullUndefinedTest_006 END')
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   PromptActionMethodNullUndefinedTest_007
 	      * @tc.number PromptActionMethodNullUndefinedTest_007
 	      * @tc.desc   To test the promptAction openToast
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('PromptActionMethodNullUndefinedTest_007', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('PromptActionMethodNullUndefinedTest_007 START')
 	       let driver: Driver = Driver.create();
 	       let btn = await driver.findComponent(ON.id('promptActionOpenToast3'));
 	       await Utils.sleep(200);
 	       await btn.click()
 	       await Utils.sleep(200);
 	       expect(AppStorage.get('promptActionOpenToast3')).assertEqual(true)
 	       console.log('PromptActionMethodNullUndefinedTest_007 END')
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   PromptActionMethodNullUndefinedTest_008
 	      * @tc.number PromptActionMethodNullUndefinedTest_008
 	      * @tc.desc   To test the promptAction openToast
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('PromptActionMethodNullUndefinedTest_008', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('PromptActionMethodNullUndefinedTest_008 START')
 	       let driver: Driver = Driver.create();
 	       let btn = await driver.findComponent(ON.id('promptActionOpenToast4'));
 	       await Utils.sleep(200);
 	       await btn.click()
 	       await Utils.sleep(200);
 	       expect(AppStorage.get('promptActionOpenToast4')).assertEqual(true)
 	       console.log('PromptActionMethodNullUndefinedTest_008 END')
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   PromptActionMethodNullUndefinedTest_009
 	      * @tc.number PromptActionMethodNullUndefinedTest_009
 	      * @tc.desc   To test the promptAction showDialog
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('PromptActionMethodNullUndefinedTest_009', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('PromptActionMethodNullUndefinedTest_009 START')
 	       let driver: Driver = Driver.create();
 	       let btn = await driver.findComponent(ON.id('promptActionShowDialog1'));
 	       await Utils.sleep(200);
 	       await btn.click()
 	       await Utils.sleep(200);
		   await driver.triggerKey(2070)
      	   await Utils.sleep(200);
 	       expect(AppStorage.get('promptActionShowDialog1')).assertEqual(true)
 	       console.log('PromptActionMethodNullUndefinedTest_009 END')
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   PromptActionMethodNullUndefinedTest_010
 	      * @tc.number PromptActionMethodNullUndefinedTest_010
 	      * @tc.desc   To test the promptAction showDialog
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('PromptActionMethodNullUndefinedTest_010', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('PromptActionMethodNullUndefinedTest_010 START')
 	       let driver: Driver = Driver.create();
 	       let btn = await driver.findComponent(ON.id('promptActionShowDialog2'));
 	       await Utils.sleep(200);
 	       await btn.click()
 	       await Utils.sleep(1000);
 	       let cancel = await driver.findComponent(ON.text('2'));
 	       await Utils.sleep(200);
 	       await cancel?.click()
 	       await Utils.sleep(200);
 	       expect(AppStorage.get('promptActionShowDialog2')).assertEqual(true)
 	       console.log('PromptActionMethodNullUndefinedTest_010 END')
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   PromptActionMethodNullUndefinedTest_011
 	      * @tc.number PromptActionMethodNullUndefinedTest_011
 	      * @tc.desc   To test the promptAction showDialog
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('PromptActionMethodNullUndefinedTest_011', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('PromptActionMethodNullUndefinedTest_011 START')
 	       let driver: Driver = Driver.create();
 	       let btn = await driver.findComponent(ON.id('promptActionShowDialog3'));
 	       await Utils.sleep(200);
 	       await btn.click()
 	       await Utils.sleep(200);
 	       expect(AppStorage.get('promptActionShowDialog3')).assertEqual(true)
 	       console.log('PromptActionMethodNullUndefinedTest_011 END')
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   PromptActionMethodNullUndefinedTest_012
 	      * @tc.number PromptActionMethodNullUndefinedTest_012
 	      * @tc.desc   To test the promptAction showDialog
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('PromptActionMethodNullUndefinedTest_012', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('PromptActionMethodNullUndefinedTest_012 START')
 	       let driver: Driver = Driver.create();
 	       let btn = await driver.findComponent(ON.id('promptActionShowDialog4'));
 	       await Utils.sleep(200);
 	       await btn.click()
 	       await Utils.sleep(200);
 	       expect(AppStorage.get('promptActionShowDialog4')).assertEqual(true)
 	       console.log('PromptActionMethodNullUndefinedTest_012 END')
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   PromptActionMethodNullUndefinedTest_013
 	      * @tc.number PromptActionMethodNullUndefinedTest_013
 	      * @tc.desc   To test the promptAction showDialog
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('PromptActionMethodNullUndefinedTest_013', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('PromptActionMethodNullUndefinedTest_013 START')
 	       let driver: Driver = Driver.create();
 	       let btn = await driver.findComponent(ON.id('promptActionShowDialog5'));
 	       await Utils.sleep(200);
 	       await btn.click()
 	       await Utils.sleep(200);
		   await driver.triggerKey(2070)
      	   await Utils.sleep(200);
 	       expect(AppStorage.get('promptActionShowDialog5')).assertEqual(true)
 	       console.log('PromptActionMethodNullUndefinedTest_013 END')
 	       done();
 	     });

		 /**
 	      * @tc.name   PromptActionMethodNullUndefinedTest_014
 	      * @tc.number PromptActionMethodNullUndefinedTest_014
 	      * @tc.desc   To test the promptAction showDialog
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('PromptActionMethodNullUndefinedTest_014', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('PromptActionMethodNullUndefinedTest_014 START')
 	       let driver: Driver = Driver.create();
 	       let btn = await driver.findComponent(ON.id('promptActionShowDialog6'));
 	       await Utils.sleep(200);
      	   await btn.click()
      	   await Utils.sleep(1000);
      	   let cancel = await driver.findComponent(ON.text('2'));
      	   await Utils.sleep(200);
      	   await cancel?.click()
      	   await Utils.sleep(200);
      	   expect(AppStorage.get('promptActionShowDialog6')).assertEqual(true)
 	       console.log('PromptActionMethodNullUndefinedTest_014 END')
 	       done();
 	     });
 	 
		
 	     /**
 	      * @tc.name   PromptActionMethodNullUndefinedTest_015
 	      * @tc.number PromptActionMethodNullUndefinedTest_015
 	      * @tc.desc   To test the promptAction showDialog
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('PromptActionMethodNullUndefinedTest_015', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('PromptActionMethodNullUndefinedTest_015 START')
 	       let driver: Driver = Driver.create();
 	       let btn = await driver.findComponent(ON.id('promptActionShowDialog7'));
 	       await Utils.sleep(200);
 	       await btn.click()
 	       await Utils.sleep(200);
 	       expect(AppStorage.get('promptActionShowDialog7')).assertEqual(true)
 	       console.log('PromptActionMethodNullUndefinedTest_015 END')
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   PromptActionMethodNullUndefinedTest_016
 	      * @tc.number PromptActionMethodNullUndefinedTest_016
 	      * @tc.desc   To test the promptAction showDialog
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('PromptActionMethodNullUndefinedTest_016', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('PromptActionMethodNullUndefinedTest_016 START')
 	       let driver: Driver = Driver.create();
 	       let btn = await driver.findComponent(ON.id('promptActionShowDialog8'));
 	       await Utils.sleep(200);
 	       await btn.click()
 	       await Utils.sleep(200);
 	       expect(AppStorage.get('promptActionShowDialog8')).assertEqual(true)
 	       console.log('PromptActionMethodNullUndefinedTest_016 END')
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   PromptActionMethodNullUndefinedTest_017
 	      * @tc.number PromptActionMethodNullUndefinedTest_017
 	      * @tc.desc   To test the promptAction showActionMenu
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('PromptActionMethodNullUndefinedTest_017', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('PromptActionMethodNullUndefinedTest_017 START')
 	       let driver: Driver = Driver.create();
 	       let btn = await driver.findComponent(ON.id('promptActionShowActionMenu1'));
 	       await Utils.sleep(200);
 	       await btn.click()
 	       await Utils.sleep(1000);
 	       let cancel = await driver.findComponent(ON.text('2'));
 	       await Utils.sleep(200);
 	       await cancel?.click()
 	       await Utils.sleep(200);
 	       expect(AppStorage.get('promptActionShowActionMenu1')).assertEqual(true)
 	       console.log('PromptActionMethodNullUndefinedTest_017 END')
 	       done();
 	     });
 	     
 	     /**
 	      * @tc.name   PromptActionMethodNullUndefinedTest_018
 	      * @tc.number PromptActionMethodNullUndefinedTest_018
 	      * @tc.desc   To test the promptAction showActionMenu
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('PromptActionMethodNullUndefinedTest_018', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('PromptActionMethodNullUndefinedTest_018 START')
 	       let driver: Driver = Driver.create();
 	       let btn = await driver.findComponent(ON.id('promptActionShowActionMenu2'));
 	       await Utils.sleep(200);
 	       await btn.click()
 	       await Utils.sleep(1000);
 	       let cancel = await driver.findComponent(ON.text('2'));
 	       await Utils.sleep(200);
 	       await cancel?.click()
 	       await Utils.sleep(200);
 	       expect(AppStorage.get('promptActionShowActionMenu2')).assertEqual(true)
 	       console.log('PromptActionMethodNullUndefinedTest_018 END')
 	       done();
 	     });
 	     /**
 	      * @tc.name   PromptActionMethodNullUndefinedTest_019
 	      * @tc.number PromptActionMethodNullUndefinedTest_019
 	      * @tc.desc   To test the promptAction showActionMenu
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('PromptActionMethodNullUndefinedTest_019', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('PromptActionMethodNullUndefinedTest_019 START')
 	       let driver: Driver = Driver.create();
 	       let btn = await driver.findComponent(ON.id('promptActionShowActionMenu3'));
 	       await Utils.sleep(200);
 	       await btn.click()
 	       await Utils.sleep(200);
 	       expect(AppStorage.get('promptActionShowActionMenu3')).assertEqual(true)
 	       console.log('PromptActionMethodNullUndefinedTest_019 END')
 	       done();
 	     });
 	     /**
 	      * @tc.name   PromptActionMethodNullUndefinedTest_020
 	      * @tc.number PromptActionMethodNullUndefinedTest_020
 	      * @tc.desc   To test the promptAction showActionMenu
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('PromptActionMethodNullUndefinedTest_020', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('PromptActionMethodNullUndefinedTest_020 START')
 	       let driver: Driver = Driver.create();
 	       let btn = await driver.findComponent(ON.id('promptActionShowActionMenu4'));
 	       await Utils.sleep(200);
 	       await btn.click()
 	       await Utils.sleep(200);
 	       expect(AppStorage.get('promptActionShowActionMenu4')).assertEqual(true)
 	       console.log('PromptActionMethodNullUndefinedTest_020 END')
 	       done();
 	     });
 	     /**
 	      * @tc.name   PromptActionMethodNullUndefinedTest_021
 	      * @tc.number PromptActionMethodNullUndefinedTest_021
 	      * @tc.desc   To test the promptAction showActionMenu
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('PromptActionMethodNullUndefinedTest_021', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('PromptActionMethodNullUndefinedTest_021 START')
 	       let driver: Driver = Driver.create();
 	       let btn = await driver.findComponent(ON.id('promptActionShowActionMenu5'));
 	       await Utils.sleep(200);
 	       await btn.click()
 	       await Utils.sleep(1000);
 	       let cancel = await driver.findComponent(ON.text('2'));
 	       await Utils.sleep(200);
 	       await cancel?.click()
 	       await Utils.sleep(200);
 	       expect(AppStorage.get('promptActionShowActionMenu5')).assertEqual(true)
 	       console.log('PromptActionMethodNullUndefinedTest_021 END')
 	       done();
 	     });
 	     /**
 	      * @tc.name   PromptActionMethodNullUndefinedTest_022
 	      * @tc.number PromptActionMethodNullUndefinedTest_022
 	      * @tc.desc   To test the promptAction showActionMenu
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('PromptActionMethodNullUndefinedTest_022', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('PromptActionMethodNullUndefinedTest_022 START')
 	       let driver: Driver = Driver.create();
 	       let btn = await driver.findComponent(ON.id('promptActionShowActionMenu6'));
 	       await Utils.sleep(200);
 	       await btn.click()
 	       await Utils.sleep(1000);
 	       let cancel = await driver.findComponent(ON.text('2'));
 	       await Utils.sleep(200);
 	       await cancel?.click()
 	       await Utils.sleep(200);
 	       expect(AppStorage.get('promptActionShowActionMenu6')).assertEqual(true)
 	       console.log('PromptActionMethodNullUndefinedTest_022 END')
 	       done();
 	     });
 	     /**
 	      * @tc.name   PromptActionMethodNullUndefinedTest_023
 	      * @tc.number PromptActionMethodNullUndefinedTest_023
 	      * @tc.desc   To test the promptAction showActionMenu
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('PromptActionMethodNullUndefinedTest_023', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('PromptActionMethodNullUndefinedTest_023 START')
 	       let driver: Driver = Driver.create();
 	       let btn = await driver.findComponent(ON.id('promptActionShowActionMenu7'));
 	       await Utils.sleep(200);
 	       await btn.click()
 	       await Utils.sleep(200);
 	       expect(AppStorage.get('promptActionShowActionMenu7')).assertEqual(true)
 	       console.log('PromptActionMethodNullUndefinedTest_023 END')
 	       done();
 	     });
 	     /**
 	      * @tc.name   PromptActionMethodNullUndefinedTest_024
 	      * @tc.number PromptActionMethodNullUndefinedTest_024
 	      * @tc.desc   To test the promptAction showActionMenu
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('PromptActionMethodNullUndefinedTest_024', Level.LEVEL2, async (done: Function) => {
 	       await Utils.sleep(1000);
 	       console.log('PromptActionMethodNullUndefinedTest_024 START')
 	       let driver: Driver = Driver.create();
 	       let btn = await driver.findComponent(ON.id('promptActionShowActionMenu8'));
 	       await Utils.sleep(200);
 	       await btn.click()
 	       await Utils.sleep(200);
 	       expect(AppStorage.get('promptActionShowActionMenu8')).assertEqual(true)
 	       console.log('PromptActionMethodNullUndefinedTest_024 END')
 	       done();
 	     });
 	 
 	   })
 	 }