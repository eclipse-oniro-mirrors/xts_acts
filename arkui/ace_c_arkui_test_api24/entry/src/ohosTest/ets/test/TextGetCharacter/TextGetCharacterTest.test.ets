/*
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
 	 
 	 import { beforeAll, describe, expect, it, Level, afterEach } from '@ohos/hypium';
 	 import Utils from '../common/Utils';
 	 import { Driver, ON } from '@ohos.UiTest';
 	 
 	 export default function TextGetCharacterTest() {
 	 
 	   describe('TextGetCharacterTest', () => {
 	 
 	     let PAGE_TAG = 'TextGetCharacterTest';
 	 
 	     beforeAll(async (done: Function) => {
 	       await Utils.pushPage(`TextGetCharacter/${PAGE_TAG}`, done);
 	     });
 	 
 	     /**
 	      * @tc.name   SUB_ACE_C_ARKUI_TEXT_GETCHARACTER_0100
 	      * @tc.number SUB_ACE_C_ARKUI_TEXT_GETCHARACTER_0100
 	      * @tc.desc   SUB_ACE_C_ARKUI_TEXT_GETCHARACTER_0100
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL1
 	      */
 	     it('SUB_ACE_C_ARKUI_TEXT_GETCHARACTER_0100', Level.LEVEL1, async (done: Function) => {
 	       console.info('[SUB_ACE_C_ARKUI_TEXT_GETCHARACTER_0100] START');
 	       await Utils.sleep(1000);
 	       let driver: Driver = Driver.create();
 	       let targetButton = await driver.findComponent(ON.id('buttonA'));
 	       await targetButton.click();
 	       await Utils.sleep(500);
 	       let strJson1 = getInspectorByKey('Text11');
 	       let obj1: ESObject = JSON.parse(strJson1);
 	       await Utils.sleep(500);
 	       console.info('[SUB_ACE_C_ARKUI_TEXT_GETCHARACTER_0100] Text11 : ' + obj1.$attrs.content);
 	       expect(obj1.$attrs.content).assertEqual('Text positon=0 affinity=1');

			let strJson2 = getInspectorByKey('Text22');
 	       let obj2: ESObject = JSON.parse(strJson2);
 	       await Utils.sleep(500);
 	       console.info('[SUB_ACE_C_ARKUI_TEXT_GETCHARACTER_0100] Text22 : ' + obj2.$attrs.content);
 	       expect(obj2.$attrs.content).assertEqual('Text glyphStart=0 glyphEnd=1 actualCharStart=0 actualCharEnd=1');

		   let strJson3 = getInspectorByKey('Text33');
 	       let obj3: ESObject = JSON.parse(strJson3);
 	       await Utils.sleep(500);
 	       console.info('[SUB_ACE_C_ARKUI_TEXT_GETCHARACTER_0100] Text33 : ' + obj3.$attrs.content);
 	       expect(obj3.$attrs.content).assertEqual('Text charStart=0 charEnd=1 actualGlyphStart=0 actualGlyphEnd=1');

 	       console.info('[SUB_ACE_C_ARKUI_TEXT_GETCHARACTER_0100] END');
 	       done();
 	     })

		 /**
 	      * @tc.name   SUB_ACE_C_ARKUI_TEXT_GETCHARACTER_0200
 	      * @tc.number SUB_ACE_C_ARKUI_TEXT_GETCHARACTER_0200
 	      * @tc.desc   SUB_ACE_C_ARKUI_TEXT_GETCHARACTER_0200
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL1
 	      */
 	     it('SUB_ACE_C_ARKUI_TEXT_GETCHARACTER_0200', Level.LEVEL1, async (done: Function) => {
 	       console.info('[SUB_ACE_C_ARKUI_TEXT_GETCHARACTER_0200] START');
 	       await Utils.sleep(1000);
 	       let driver: Driver = Driver.create();
 	       let targetButton = await driver.findComponent(ON.id('buttonB'));
 	       await targetButton.click();
 	       await Utils.sleep(500);
 	       let strJson1 = getInspectorByKey('Text11');
 	       let obj1: ESObject = JSON.parse(strJson1);
 	       await Utils.sleep(500);
 	       console.info('[SUB_ACE_C_ARKUI_TEXT_GETCHARACTER_0200] Text11 : ' + obj1.$attrs.content);
 	       expect(obj1.$attrs.content).assertEqual('ARKUI_ERROR_CODE_PARAM_INVALID');

			let strJson2 = getInspectorByKey('Text22');
 	       let obj2: ESObject = JSON.parse(strJson2);
 	       await Utils.sleep(500);
 	       console.info('[SUB_ACE_C_ARKUI_TEXT_GETCHARACTER_0200] Text22 : ' + obj2.$attrs.content);
 	       expect(obj2.$attrs.content).assertEqual('ARKUI_ERROR_CODE_PARAM_INVALID');

		   let strJson3 = getInspectorByKey('Text33');
 	       let obj3: ESObject = JSON.parse(strJson3);
 	       await Utils.sleep(500);
 	       console.info('[SUB_ACE_C_ARKUI_TEXT_GETCHARACTER_0200] Text33 : ' + obj3.$attrs.content);
 	       expect(obj3.$attrs.content).assertEqual('ARKUI_ERROR_CODE_PARAM_INVALID');

 	       console.info('[SUB_ACE_C_ARKUI_TEXT_GETCHARACTER_0200] END');
 	       done();
 	     })
 	   })
 	 }