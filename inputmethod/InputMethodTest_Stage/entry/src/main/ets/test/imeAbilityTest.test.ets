/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import inputMethod from '@ohos.inputMethod'

export default function imeAbilityTest(abilityContext) {
  describe('imeAbilityTest', function () {
    var prop = {
      packageName: '',
      methodId: '',
      name:'',
      id:'',
      extra:{}
    }

    /**
     * beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.
     */
    beforeAll(function () {
      let inputM = inputMethod.getCurrentInputMethod()
      console.info("====>beforeAll: switchInputMethod to: " +  JSON.stringify(inputM));
      prop.packageName = inputM.packageName;
      prop.methodId = inputM.methodId;
      prop.name = inputM.packageName;
      prop.id = inputM.methodId;
    });

    /**
     * afterEach: Test case-level clearance conditions, which are executed after each test case is executed.
     */
    afterAll(async function () {
      console.info('====>afterAll: switchInputMethod to origionInput.' + JSON.stringify(prop));
      await inputMethod.switchInputMethod(prop).then((data)=>{
        console.info('====>afterAll switchInputMethod to origionInput :' + data);
        expect(data == true).assertTrue();
      }).catch(err =>{
        console.info('====>afterAll switchInputMethod to origionInput error: ' + err);
      })
    });

    /**
     * @tc.number    SUB_InputMethod_IMEAbility_0001
     * @tc.desc      Start a inputMethodExtension ability session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_InputMethod_IMEAbility_0001', 0, async function (done) {
      console.info('====>----------SUB_InputMethod_IMEAbility_0001 start-------------');
      let imExtAbilityProperty = {
        packageName : "com.acts.imeability.test",
        methodId : "com.acts.imeability.test.ImExtAbility",
        name:"com.acts.imeability.test",
        id:"com.acts.imeability.test.ImExtAbility",
        extra:{}
      }

      inputMethod.switchInputMethod(imExtAbilityProperty).then((data)=>{
        console.info('====>SUB_InputMethod_IMEAbility_0001 switchInputMethod to IME :' + data);
        expect(data == true).assertTrue();
      });
      let t = setTimeout(() => {
        console.info('====>----------SUB_InputMethod_IMEAbility_0001 end-------------' + t);
        clearTimeout(t);
        done();
      }, 500);
    })

    /**
     * @tc.number    SUB_InputMethod_IMEAbility_0002
     * @tc.desc      Start a inputMethodExtension ability session
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_InputMethod_IMEAbility_0002', 0, async function (done) {
      console.info('====>-----------SUB_InputMethod_IMEAbility_0002 start-------------');

      let imExtAbilityProperty = {
        packageName : "com.acts.imeability.test",
        methodId : "com.acts.imeability.test.ImExtAbility",
        name:"com.acts.imeability.test",
        id:"com.acts.imeability.test.ImExtAbility",
        extra:{}
      }

      inputMethod.switchInputMethod(imExtAbilityProperty).then((data)=>{
        console.info('====>SUB_InputMethod_IMEAbility_0002 switchInputMethod to IME :' + data);
        expect(data == true).assertTrue();
      });
      let t = setTimeout(() => {
        console.info('====>----------SUB_InputMethod_IMEAbility_0001 end-------------' + t);
        clearTimeout(t);
        done();
      }, 500);
    })
  })
}
