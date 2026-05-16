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
 	 
 	 export default function EnableClickSoundEffectTest() {
 	 
 	   describe('EnableClickSoundEffectTest', () => {
 	 
 	     let PAGE_TAG = 'EnableClickSoundEffectTest';
 	 
 	     beforeAll(async (done: Function) => {
 	       await Utils.pushPage(`enableClickSoundEffect/${PAGE_TAG}`, done);
 	     });
 	 
 	     /**
 	      * @tc.name   EnableClickSoundEffectTest_0010
 	      * @tc.number EnableClickSoundEffectTest_0010
 	      * @tc.desc   EnableClickSoundEffectTest_0010
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL1
 	      */
 	     it('EnableClickSoundEffectTest_0010', Level.LEVEL1, async (done: Function) => {
 	       console.info('[EnableClickSoundEffectTest_0010] START');
 	       let driver: Driver = Driver.create();
 	       let targetButton = await driver.findComponent(ON.id('buttonEnableClickSoundEffect1'));
 	       await targetButton.click();
 	       await Utils.sleep(1000);
 	       let strJson1 = getInspectorByKey('buttonEnableClickSoundEffect1');
 	       let obj1: ESObject = JSON.parse(strJson1);
           console.info("[EnableClickSoundEffectTest_0010] component obj1 is: " + JSON.stringify(obj1));
 	       console.info('[EnableClickSoundEffectTest_0010] enableClickSoundEffect: ' + obj1.$attrs.enableClickSoundEffect);
 	       expect(obj1.$attrs.enableClickSoundEffect).assertEqual(true);
 	       console.info('[EnableClickSoundEffectTest_0010] END');
 	       done();
 	       });

           /**
 	      * @tc.name   EnableClickSoundEffectTest_0020
 	      * @tc.number EnableClickSoundEffectTest_0020
 	      * @tc.desc   EnableClickSoundEffectTest_0020
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL1
 	      */
 	     it('EnableClickSoundEffectTest_0020', Level.LEVEL1, async (done: Function) => {
 	       console.info('[EnableClickSoundEffectTest_0020] START');
 	       let driver: Driver = Driver.create();
 	       let targetButton = await driver.findComponent(ON.id('buttonEnableClickSoundEffect0'));
 	       await targetButton.click();
 	       await Utils.sleep(1000);
 	       let strJson1 = getInspectorByKey('buttonEnableClickSoundEffect0');
 	       let obj1: ESObject = JSON.parse(strJson1);
           console.info("[EnableClickSoundEffectTest_0020] component obj1 is: " + JSON.stringify(obj1));
 	       console.info('[EnableClickSoundEffectTest_0020] enableClickSoundEffect: ' + obj1.$attrs.enableClickSoundEffect);
 	       expect(obj1.$attrs.enableClickSoundEffect).assertEqual(false);
 	       console.info('[EnableClickSoundEffectTest_0020] END');
 	       done();
 	       });

           /**
 	      * @tc.name   EnableClickSoundEffectTest_0030
 	      * @tc.number EnableClickSoundEffectTest_0030
 	      * @tc.desc   EnableClickSoundEffectTest_0030
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL1
 	      */
 	     it('EnableClickSoundEffectTest_0030', Level.LEVEL2, async (done: Function) => {
 	       console.info('[EnableClickSoundEffectTest_0030] START');
 	       let driver: Driver = Driver.create();
 	       let targetButton = await driver.findComponent(ON.id('buttonEnableClickSoundEffect-1'));
 	       await targetButton.click();
 	       await Utils.sleep(1000);
 	       let strJson1 = getInspectorByKey('buttonEnableClickSoundEffect-1');
 	       let obj1: ESObject = JSON.parse(strJson1);
           console.info("[EnableClickSoundEffectTest_0030] component obj1 is: " + JSON.stringify(obj1));
 	       console.info('[EnableClickSoundEffectTest_0030] enableClickSoundEffect: ' + obj1.$attrs.enableClickSoundEffect);
 	       expect(obj1.$attrs.enableClickSoundEffect).assertEqual(true);
 	       console.info('[EnableClickSoundEffectTest_0030] END');
 	       done();
 	       });
 	   })
 	 }