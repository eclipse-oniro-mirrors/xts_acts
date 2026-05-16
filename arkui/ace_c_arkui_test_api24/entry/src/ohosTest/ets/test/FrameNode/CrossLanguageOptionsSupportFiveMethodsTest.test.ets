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
   
 import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium" 
 import router from '@ohos.router'; 
 import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest'; 
 import Utils from '../common/Utils'; 
 
 
 export default function CrossLanguageOptionsSupportFiveMethodsTest() { 
   describe('CrossLanguageOptionsSupportFiveMethodsTest', () => { 
     beforeEach(async (done: Function) => { 
       console.info("CrossLanguageOptionsSupportFiveMethodsTest beforeEach start"); 
       let options: router.RouterOptions = { 
         url: "MainAbility/pages/FrameNode/CrossLanguageOptionsSupportFiveMethods", 
       } 
       try { 
         router.clear(); 
         let pages = router.getState(); 
         console.info("get CrossLanguageOptionsSupportFiveMethods state pages: " + JSON.stringify(pages)); 
         if (!("CrossLanguageOptionsSupportFiveMethods" == pages.name)) { 
           console.info("get CrossLanguageOptionsSupportFiveMethods state pages.name: " + JSON.stringify(pages.name)); 
           let result = await router.pushUrl(options); 
           await Utils.sleep(2000); 
           console.info("push CrossLanguageOptionsSupportFiveMethods success: " + JSON.stringify(result)); 
         } 
       } catch (err) { 
         console.error("push CrossLanguageOptionsSupportFiveMethods page error: " + err); 
         expect().assertFail(); 
       } 
       done(); 
     }); 
 
     /** 
      * @tc.name   CrossLanguageOptionsSupportFiveMethodsTest_0100 
      * @tc.number SUB_ARKUI_API_CrossLanguageOptionsSupportFiveMethodsTest_0100 
      * @tc.desc   ArkUIAPI 
      * @tc.type   FUNCTION 
      * @tc.size   MEDIUMTEST 
      * @tc.level  LEVEL2 
      */ 
     it('CrossLanguageOptionsSupportFiveMethodsTest_0100', Level.LEVEL2, async (done: Function) => { 
       console.info('[CrossLanguageOptionsSupportFiveMethodsTest_0100] START'); 
       let driver = await Driver.create() 
       await Utils.sleep(2000); 
 
       let button1 = await driver.findComponent(ON.id('CrossLanguageOptionsRemoveChild')); 
       await button1.click(); 
       await Utils.sleep(2000) 
       let node1 = await driver.findComponent(ON.id('col_child')); 
        
       let button2 = await driver.findComponent(ON.id('CrossLanguageOptionsAddChild')); 
       await button2.click(); 
       await Utils.sleep(2000) 
       let node2 = await driver.findComponent(ON.id('AddChildNodeId')); 
        
       let button3 = await driver.findComponent(ON.id('CrossLanguageOptionsInsertChildAfter')); 
       await button3.click(); 
       await Utils.sleep(2000) 
       let node3 = await driver.findComponent(ON.id('InsertChildAfterNodeId')); 
       
       let button4 = await driver.findComponent(ON.id('CrossLanguageOptionsInsertChildBefore')); 
       await button4.click(); 
       await Utils.sleep(2000)       
       let node4 = await driver.findComponent(ON.id('InsertChildBeforeNodeId')); 
        
       let button5 = await driver.findComponent(ON.id('CrossLanguageOptionsInsertChildAt')); 
       await button5.click(); 
       await Utils.sleep(2000) 
       let node5 = await driver.findComponent(ON.id('InsertChildAtNodeId')); 
        
       expect(node1).not().assertNull(); 
       expect(node2).assertNull(); 
       expect(node3).assertNull(); 
       expect(node4).assertNull(); 
       expect(node5).assertNull(); 
 
       console.info('[CrossLanguageOptionsSupportFiveMethodsTest_0100] END'); 
       done(); 
     }); 
 
     /** 
      * @tc.name   CrossLanguageOptionsSupportFiveMethodsTest_0200 
      * @tc.number SUB_ARKUI_API_CrossLanguageOptionsSupportFiveMethodsTest_0200 
      * @tc.desc   ArkUIAPI 
      * @tc.type   FUNCTION 
      * @tc.size   MEDIUMTEST 
      * @tc.level  LEVEL2 
      */ 
     it('CrossLanguageOptionsSupportFiveMethodsTest_0200', Level.LEVEL2, async (done: Function) => { 
       console.info('[CrossLanguageOptionsSupportFiveMethodsTest_0200] START'); 
       let driver = await Driver.create() 
       await Utils.sleep(2000); 
 
       let button = await driver.findComponent(ON.id('CrossLanguageOptionsSetNull')); 
       await button.click(); 
       await Utils.sleep(2000) 
 
       let button1 = await driver.findComponent(ON.id('CrossLanguageOptionsRemoveChild')); 
       await button1.click(); 
       await Utils.sleep(2000) 
       let node1 = await driver.findComponent(ON.id('col_child')); 
        
       let button2 = await driver.findComponent(ON.id('CrossLanguageOptionsAddChild')); 
       await button2.click(); 
       await Utils.sleep(2000) 
       let node2 = await driver.findComponent(ON.id('AddChildNodeId')); 
        
       let button3 = await driver.findComponent(ON.id('CrossLanguageOptionsInsertChildAfter')); 
       await button3.click(); 
       await Utils.sleep(2000) 
       let node3 = await driver.findComponent(ON.id('InsertChildAfterNodeId')); 
       
       let button4 = await driver.findComponent(ON.id('CrossLanguageOptionsInsertChildBefore')); 
       await button4.click(); 
       await Utils.sleep(2000) 
       let node4 = await driver.findComponent(ON.id('InsertChildBeforeNodeId')); 
        
       let button5 = await driver.findComponent(ON.id('CrossLanguageOptionsInsertChildAt')); 
       await button5.click(); 
       await Utils.sleep(2000) 
       let node5 = await driver.findComponent(ON.id('InsertChildAtNodeId')); 
        
       expect(node1).not().assertNull(); 
       expect(node2).assertNull(); 
       expect(node3).assertNull(); 
       expect(node4).assertNull(); 
       expect(node5).assertNull(); 
 
       console.info('[CrossLanguageOptionsSupportFiveMethodsTest_0200] END'); 
       done(); 
     }); 
 
     /** 
      * @tc.name   CrossLanguageOptionsSupportFiveMethodsTest_0300 
      * @tc.number SUB_ARKUI_API_CrossLanguageOptionsSupportFiveMethodsTest_0300 
      * @tc.desc   ArkUIAPI 
      * @tc.type   FUNCTION 
      * @tc.size   MEDIUMTEST 
      * @tc.level  LEVEL2 
      */ 
     it('CrossLanguageOptionsSupportFiveMethodsTest_0300', Level.LEVEL2, async (done: Function) => { 
       console.info('[CrossLanguageOptionsSupportFiveMethodsTest_0300] START'); 
       let driver = await Driver.create() 
       await Utils.sleep(2000); 
 
       let button = await driver.findComponent(ON.id('CrossLanguageOptionsSetUndefined')); 
       await button.click(); 
       await Utils.sleep(2000) 

       let button1 = await driver.findComponent(ON.id('CrossLanguageOptionsRemoveChild')); 
       await button1.click(); 
       await Utils.sleep(2000) 
       let node1 = await driver.findComponent(ON.id('col_child')); 
        
       let button2 = await driver.findComponent(ON.id('CrossLanguageOptionsAddChild')); 
       await button2.click(); 
       await Utils.sleep(2000) 
       let node2 = await driver.findComponent(ON.id('AddChildNodeId')); 
        
       let button3 = await driver.findComponent(ON.id('CrossLanguageOptionsInsertChildAfter')); 
       await button3.click(); 
       await Utils.sleep(2000) 
       let node3 = await driver.findComponent(ON.id('InsertChildAfterNodeId')); 
       
       let button4 = await driver.findComponent(ON.id('CrossLanguageOptionsInsertChildBefore')); 
       await button4.click(); 
       await Utils.sleep(2000) 
       let node4 = await driver.findComponent(ON.id('InsertChildBeforeNodeId')); 
        
       let button5 = await driver.findComponent(ON.id('CrossLanguageOptionsInsertChildAt')); 
       await button5.click(); 
       await Utils.sleep(2000) 
       let node5 = await driver.findComponent(ON.id('InsertChildAtNodeId')); 
        
       expect(node1).not().assertNull(); 
       expect(node2).assertNull(); 
       expect(node3).assertNull(); 
       expect(node4).assertNull(); 
       expect(node5).assertNull(); 
 
       console.info('[CrossLanguageOptionsSupportFiveMethodsTest_0300] END'); 
       done(); 
     }); 
 
     /** 
      * @tc.name   CrossLanguageOptionsSupportFiveMethodsTest_0400 
      * @tc.number SUB_ARKUI_API_CrossLanguageOptionsSupportFiveMethodsTest_0400 
      * @tc.desc   ArkUIAPI 
      * @tc.type   FUNCTION 
      * @tc.size   MEDIUMTEST 
      * @tc.level  LEVEL2 
      */ 
     it('CrossLanguageOptionsSupportFiveMethodsTest_0400', Level.LEVEL2, async (done: Function) => { 
       console.info('[CrossLanguageOptionsSupportFiveMethodsTest_0400] START'); 
       let driver = await Driver.create() 
       await Utils.sleep(2000); 
 
       let button = await driver.findComponent(ON.id('CrossLanguageOptionsSetTrue')); 
       await button.click(); 
       await Utils.sleep(2000) 
 
       let button1 = await driver.findComponent(ON.id('CrossLanguageOptionsRemoveChild')); 
       await button1.click(); 
       console.info('[CrossLanguageOptionsSupportFiveMethodsTest_0400] click CrossLanguageOptionsRemoveChild' ) 
       await Utils.sleep(2000) 
       let node1 = await driver.findComponent(ON.id('col_child')); 
       expect(node1).assertNull(); 
        
       let button2 = await driver.findComponent(ON.id('CrossLanguageOptionsAddChild')); 
       await button2.click(); 
       console.info('[CrossLanguageOptionsSupportFiveMethodsTest_0400] click CrossLanguageOptionsAddChild' ) 
       await Utils.sleep(2000) 
       let node2 = await driver.findComponent(ON.id('AddChildNodeId')); 
       expect(node2).not().assertNull(); 
        
       let button3 = await driver.findComponent(ON.id('CrossLanguageOptionsInsertChildAfter')); 
       await button3.click(); 
       console.info('[CrossLanguageOptionsSupportFiveMethodsTest_0400] click CrossLanguageOptionsInsertChildAfter' ) 
       await Utils.sleep(2000) 
       let node3 = await driver.findComponent(ON.id('InsertChildAfterNodeId')); 
       expect(node3).not().assertNull(); 
       
       let button4 = await driver.findComponent(ON.id('CrossLanguageOptionsInsertChildBefore')); 
       await button4.click(); 
       console.info('[CrossLanguageOptionsSupportFiveMethodsTest_0400] click CrossLanguageOptionsInsertChildBefore' ) 
       await Utils.sleep(2000) 
       let node4 = await driver.findComponent(ON.id('InsertChildBeforeNodeId')); 
       expect(node4).not().assertNull(); 
        
       let button5 = await driver.findComponent(ON.id('CrossLanguageOptionsInsertChildAt')); 
       await button5.click(); 
       console.info('[CrossLanguageOptionsSupportFiveMethodsTest_0400] click CrossLanguageOptionsInsertChildAt' ) 
       await Utils.sleep(2000) 
       let node5 = await driver.findComponent(ON.id('InsertChildAtNodeId')); 
       expect(node5).not().assertNull(); 
        
       console.info('[CrossLanguageOptionsSupportFiveMethodsTest_0400] END'); 
       done(); 
     }); 
 
   }) 
 }