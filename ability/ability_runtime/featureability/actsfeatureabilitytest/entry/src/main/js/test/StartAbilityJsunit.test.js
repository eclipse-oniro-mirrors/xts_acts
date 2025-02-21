/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import featureAbility from '@ohos.ability.featureAbility'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

let resultCode = 123;
let bundleName = 'ohso.act.aafwk';
let mainAbilityName = 'ohos.acts.aafwk.jsap';
const errCode = 1;
const errCode1 = 202;
export default function startAbilityTest() {
describe('StartAbilityTest', function () {
  
    afterEach(async function(done) {
        let wantInfo = {
            want: {
                bundleName: "com.example.actsfeatureabilitytest",
                abilityName: "com.example.actsfeatureabilitytest.TestAbility"
            }
        }
        await featureAbility.startAbility(wantInfo).then((data) => {
          console.log("SUB_AA_JsApi_StartAbility startAbility data : " + JSON.stringify(data));
        }).catch((err) => {
          console.log("SUB_AA_JsApi_StartAbility startAbility err : " + JSON.stringify(err));
        })
        setTimeout(function () {
            console.log("SUB_AA_JsApi_StartAbility afterEach end");
            done();
        }, 500);
    })
    
    /*
    * @tc.number: SUB_AA_JsApi_StartAbility_0100
    * @tc.name: testAbility0100.
    * @tc.desc: StartAbility fail with want nothing.(by promise)
    */
    it("SUB_AA_JsApi_StartAbility_0100", 0, async function (done) {
        let parameter = {
            'want': {}
        }
        await featureAbility.startAbility(parameter).then((data) => {
            console.log('testAbility0100 data: ' + JSON.stringify(data))
            expect().assertFail()
        }).catch((error) => {
            console.log('testAbility0100 error: ' + JSON.stringify(error))
            expect(errCode).assertEqual(error.code)
        })
        done()
    })

    /*
   * @tc.number: SUB_AA_JsApi_Ability_0200
   * @tc.name: testAblity0200.
   * @tc.desc: StartAbility fail with want nothing.(by callback)
   */
    it("SUB_AA_JsApi_Ability_0200", 0, async function (done) {
        let parameter = {
            'want': {}
        }
        featureAbility.startAbility(parameter, (error, data) => {
            console.log('testAbility0200 data: ' + JSON.stringify(data))
            console.log('testAbility0200 error: ' + JSON.stringify(error))
            expect(errCode).assertEqual(error.code)
            done();
        })
    })

    /*
    * @tc.number: SUB_AA_JsApi_StartAbility_0300
    * @tc.name: testAbility0300.
    * @tc.desc: StartAbility fail with error parameter.(by promise)
    */
    it("SUB_AA_JsApi_StartAbility_0300", 0, async function (done) {
        let startAbilityParameter = {
            'want': {}
        }
        await featureAbility.startAbility(startAbilityParameter).then((data) => {
            console.log('testAbility0300 data: ' + JSON.stringify(data))
            expect().assertFail()
        }).catch((error) => {
            console.log('testAbility0300 error: ' + JSON.stringify(error))
            expect(errCode).assertEqual(error.code)
        })
        done()
    })

    /*
    * @tc.number: SUB_AA_JsApi_StartAbility_0400
    * @tc.name: testAbility0400.
    * @tc.desc: StartAbility fail with error parameter.(by callback)
    */
    it("SUB_AA_JsApi_StartAbility_0400", 0, async function (done) {
        let startAbilityParameter = {
            'want': {}
        }
        featureAbility.startAbility((startAbilityParameter), (error, data) => {
            console.log('testAbility0400 data: ' + JSON.stringify(data))
            console.log('testAbility0400 error: ' + JSON.stringify(error))
            expect(errCode).assertEqual(error.code)
            done()
        })
    })

    /*
    * @tc.number: SUB_AA_JsApi_Ability_0500
    * @tc.name: testAblity0500.
    * @tc.desc: startAbility-want configure action+entities- there is no Ability corresponding to entities.(by promise)
    */
    it("SUB_AA_JsApi_Ability_0500", 0, async function (done) {
        let parameter = {
            'want': {
                'action': 'action.ohos.acts.aafwk.jsapi.MainAbility',
                'entities': [
                    'entity.com.example.mytestw.ENITIES22'
                ]
            }
        }
        await featureAbility.startAbility(parameter).then((data) => {
            console.log('testAblity0500 data: ' + JSON.stringify(data))
            expect().assertFail()
        }).catch((error) => {
            console.log('testAblity0500 error: ' + JSON.stringify(error))
            expect(errCode).assertEqual(error.code)
        })
        done()
    })

    /*
    * @tc.number: SUB_AA_JsApi_Ability_0600
    * @tc.name: testAblity0600.
    * @tc.desc: startAbility-want configure action+entities- there is no Ability corresponding to entities.(by callback)
    */
    it("SUB_AA_JsApi_Ability_0600", 0, async function (done) {
        let parameter = {
            'want': {
                'action': 'action.ohos.acts.aafwk.jsapi.MainAbility',
                'entities': [
                    'entity.com.example.mytestw.ENITIES22'
                ]
            }
        }
        featureAbility.startAbility((parameter), (error, data) => {
            console.log('testAbility0600 data: ' + JSON.stringify(data))
            console.log('testAbility0600 error: ' + JSON.stringify(error))
            expect(errCode).assertEqual(error.code)
            done()
        })
    })

    /*
    * @tc.number: SUB_AA_JsApi_Ability_0900
    * @tc.name: testAblity0900.
    * @tc.desc: startAbility-want configure action+entities- entities is configurd as a string.(by promise)
    */
    it("SUB_AA_JsApi_Ability_0900", 0, async function (done) {
        let startAbilityParameter = {
            'want': {
                'bundleName': bundleName,
                'abilityName': mainAbilityName
            }
        }
        await featureAbility.startAbility(startAbilityParameter).then((data) => {
            console.log('testAblity0900 data: ' + JSON.stringify(data))
            expect().assertFail()
        }).catch((error) => {
            console.log('testAblity0900 error: ' + JSON.stringify(error))
            expect(errCode).assertEqual(error.code)
        })
        done()
    })

    /*
    * @tc.number: SUB_AA_JsApi_Ability_1000
    * @tc.name: testAblity1000.
    * @tc.desc: startAbility-want configure action+entities- entities is configurd as a string.(by callback)
    */
    it("SUB_AA_JsApi_Ability_1000", 0, async function (done) {
        let startAbilityParameter = {
            'want': {
                'bundleName': bundleName,
                'abilityName': mainAbilityName
            }
        }
        featureAbility.startAbility((startAbilityParameter), (error, data) => {
            console.log('testAblity1000 data: ' + JSON.stringify(data))
            console.log('testAblity1000 error: ' + JSON.stringify(error))
            expect(errCode).assertEqual(error.code)
            done()
        })
    })

    /*
    * @tc.number: SUB_AA_JsApi_Ability_1100
    * @tc.name: testAblity1100.
    * @tc.desc: startAbility: The input parameter want is not configured (the value is {}).(by promise)
    */
    it("SUB_AA_JsApi_Ability_1100", 0, async function (done) {
        let parameter = {}
        await featureAbility.startAbility(parameter).then((data) => {
            console.log('testAblity1100 data: ' + JSON.stringify(data))
            expect().assertFail()
        }).catch((error) => {
            console.log('testAblity1100 error: ' + JSON.stringify(error))
            expect(errCode1).assertEqual(error.code)
        })
        done()
    })

    /*
    * @tc.number: SUB_AA_JsApi_Ability_1200
    * @tc.name: testAblity1200.
    * @tc.desc: startAbility: The input parameter want is not configured (the value is {}).(by callback)
    */
    it("SUB_AA_JsApi_Ability_1200", 0, async function (done) {
        let parameter = {}
        featureAbility.startAbility(parameter, (error, data) => {
            console.log('testAblity1200 data: ' + JSON.stringify(data))
            console.log('testAblity1200 error: ' + JSON.stringify(error))
            expect(errCode1).assertEqual(error.code)
            done();
        })
    })

    /*
    * @tc.number: SUB_AA_JsApi_Ability_1300
    * @tc.name: testAblity1300.
    * @tc.desc: startAbility: The input parameter is uddefined.(by promise)
    */
    it("SUB_AA_JsApi_Ability_1300", 0, async function (done) {
        await featureAbility.startAbility(undefined).then((data) => {
            console.log('testAblity1300 data: ' + JSON.stringify(data))
            expect().assertFail()
        }).catch((error) => {
            console.log('testAblity1300 error: ' + JSON.stringify(error))
            expect(errCode1).assertEqual(error.code)
        })
        done()
    })

    /*
    * @tc.number: SUB_AA_JsApi_Ability_1400
    * @tc.name: testAblity1400.
    * @tc.desc: startAbility: The input parameter is uddefined.(by callback)
    */
    it("SUB_AA_JsApi_Ability_1400", 0, async function (done) {
        featureAbility.startAbility(undefined, (error, data) => {
            console.log('testAblity1400 data: ' + JSON.stringify(data))
            console.log('testAblity1400 error: ' + JSON.stringify(error))
            expect(errCode1).assertEqual(error.code)
            done();
        })
    })

    /*
    * @tc.number: SUB_AA_JsApi_Ability_1500
    * @tc.name: testAblity1500.
    * @tc.desc: startAbilityForResult: The input parameter want is not configured (the value is {}).(by promise)
    */
    it("SUB_AA_JsApi_Ability_1500", 0, async function (done) {
        let parameter = {}
        await featureAbility.startAbilityForResult(parameter).then((data) => {
            console.log('testAblity1500 data: ' + JSON.stringify(data))
            expect.assertFail()
        }).catch((error) => {
            console.log('testAblity1500' + JSON.stringify(error));
            expect(errCode1).assertEqual(error.code)
        })
        done()
    })

    /*
    * @tc.number: SUB_AA_JsApi_Ability_1600
    * @tc.name: testAblity1600.
    * @tc.desc: startAbilityForResult: The input parameter want is not configured (the value is {}).(by callback)
    */
    it("SUB_AA_JsApi_Ability_1600", 0, async function (done) {
        let parameter = {}
        featureAbility.startAbilityForResult(parameter, (error, data) => {
            console.log('testAblity1600 data: ' + JSON.stringify(data))
            console.log('testAblity1600 error: ' + JSON.stringify(error))
            expect(errCode1).assertEqual(error.code)
            console.log('testAblity1600-1 error: ' + JSON.stringify(error))
            done();
        })
    })

    /*
    * @tc.number: SUB_AA_JsApi_Ability_1700
    * @tc.name: testAblity1700.
    * @tc.desc: startAbilityForResult: The input parameter optParam is undefined.(by promise)
    */
    it("SUB_AA_JsApi_Ability_1700", 0, async function (done) {
        await featureAbility.startAbilityForResult(undefined).then((data) => {
            console.log('testAblity1700 data: ' + JSON.stringify(data))
            expect.assertFail()
        }).catch((error) => {
            console.log('testAblity1700' + JSON.stringify(error));
            expect(errCode1).assertEqual(error.code)
        })
        done()
    })

    /*
    * @tc.number: SUB_AA_JsApi_Ability_1800
    * @tc.name: testAblity1800.
    * @tc.desc: startAbilityForResult: The input parameter optParam is undefined.(by callback)
    */
    it("SUB_AA_JsApi_Ability_1800", 0, async function (done) {
        featureAbility.startAbilityForResult(undefined, (error) => {
            console.log('testAblity1800' + JSON.stringify(error));
            expect(errCode1).assertEqual(error.code)
            done()
        })
    })

    /*
    * @tc.number: SUB_AA_JsApi_Ability_1900
    * @tc.name: testAblity1900.
    * @tc.desc: startAbilityForResult-wrong input parameter format want a layer outside.(by promise)
    */
    it("SUB_AA_JsApi_Ability_1900", 0, async function (done) {
        let startAbilityParameter = {
            'want': {
                'bundleName': bundleName,
                'abilityName': mainAbilityName,
                'parameters': {
                    'key': resultCode,
                    'terminate': true
                }
            }
        }
        await featureAbility.startAbilityForResult(startAbilityParameter).then((data) => {
            console.log('testAblity1900 data: ' + JSON.stringify(data))
            expect.assertFail()
        }).catch((error) => {
            console.log('testAblity1900 err:' + JSON.stringify(error));
            expect(errCode).assertEqual(error.code)
        })
        done()
    })

    /*
    * @tc.number: SUB_AA_JsApi_Ability_2000
    * @tc.name: testAblity2000.
    * @tc.desc: startAbilityForResult-wrong input parameter format want a layer outside.(by callback)
    */
    it("SUB_AA_JsApi_Ability_2000", 0, async function (done) {
        let startAbilityParameter = {
            'want': {
                'bundleName': bundleName,
                'abilityName': mainAbilityName,
                'parameters': {
                    'key': resultCode,
                    'terminate': true
                }
            }
        }
        featureAbility.startAbilityForResult(startAbilityParameter, (error, data) => {
            console.log('testAblity2000' + JSON.stringify(error));
            expect(errCode).assertEqual(error.code)
            done()
        })
    })

    /*
    * @tc.number: SUB_AA_JsApi_Ability_2100
    * @tc.name: testAblity2100.
    * @tc.desc: startAbilityForResult-want-Set bundleName and abilityName+flag-flag to character strings.(by promise)
    */
    it("SUB_AA_JsApi_Ability_2100", 0, async function (done) {
        let parameter = {
            'want': {
                'bundleName': bundleName,
                'abilityName': mainAbilityName,
                'flages': 'abc',
                'parameters': {
                    'key': resultCode,
                    'terminate': true
                }
            }
        }
        await featureAbility.startAbilityForResult(parameter).then((data) => {
            console.log('testAblity2100 data: ' + JSON.stringify(data))
            expect.assertFail()
        }).catch((error) => {
            console.log('testAblity2100' + JSON.stringify(error));
            expect(errCode).assertEqual(error.code)
        })
        done()
    })

    /*
    * @tc.number: SUB_AA_JsApi_Ability_2200
    * @tc.name: testAblity2200.
    * @tc.desc: startAbilityForResult-want-Set bundleName and abilityName+flag-flag to character strings.(by callback)
    */
    it("SUB_AA_JsApi_Ability_2200", 0, async function (done) {
        let parameter = {
            'want': {
                'bundleName': bundleName,
                'abilityName': mainAbilityName,
                'flages': 'abc',
                'parameters': {
                    'key': resultCode,
                    'terminate': true
                }
            }
        }
        featureAbility.startAbilityForResult(parameter, (error, data) => {
            console.log('testAblity2200' + JSON.stringify(error));
            expect(errCode).assertEqual(error.code)
            done()
        })
    })
})
}
