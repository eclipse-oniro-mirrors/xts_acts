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
import { describe, afterEach, it, expect } from '@ohos/hypium'

import FormInfo from '@ohos.application.formInfo';
import formInfoNew from '@ohos.app.form.formInfo';
import formError from '@ohos.application.formError';
import formHost from '@ohos.application.formHost';
import abilityConstant from '@ohos.app.ability.AbilityConstant'
import appManagerNew from '@ohos.app.ability.appManager'
import commonEvent from '@ohos.commonEvent';
import ability from '@ohos.ability.ability';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import contextConstant from "@ohos.app.ability.contextConstant"

let EXTENSION_INFO_ERR = 16000001;
let INNER_ERROR = 16000050;
let CROSS_USER_DENY = 201;
let array = new Array();
let TAG = '';
function sleep(time) {
  return new Promise((resolve)=>setTimeout(resolve,time));
}

export default function ApiCoverTest() {
  describe('ApiCoverTestTest', function () {
    afterEach(async (done) => {
      setTimeout(function () {
        done();
      }, 2500);
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_001
     * @tc.name    StartServiceExtensionAbility with incorrect abilityName.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_001', 0, async function (done) {
      await sleep(2000);
      let want = {
        bundleName: "com.example.extensionapitest",
        abilityName: "FirstExtension1"
      };
      await globalThis.abilityContext.startServiceExtensionAbility(want).then((data) => {
        console.log('Ability: startServiceExtensionAbility success:' + JSON.stringify(data));
        expect("case execute failed").assertEqual(data);
      }).catch((error) => {
        console.error(`Ability: startServiceExtensionAbility failed: ${JSON.stringify(error)}`);
        expect(EXTENSION_INFO_ERR).assertEqual(error.code);
      })
      done()
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_002
     * @tc.name    StopServiceExtensionAbility with incorrect bundleName.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_002', 0, async function (done) {
      await sleep(2000);
      let want = {
        bundleName: "com.example.extensionapitest1",
        abilityName: "FirstExtension"
      };
      await globalThis.abilityContext.stopServiceExtensionAbility(want).then((data) => {
        console.log(`Ability: stopServiceExtensionAbility success: ${JSON.stringify(data)}`);
        expect("case execute failed").assertEqual(data);
      }).catch((error) => {
        console.error(`Ability: stopServiceExtensionAbility failed: ${JSON.stringify(error)}`);
        expect(EXTENSION_INFO_ERR).assertEqual(error.code);
      })
      done()
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_003
     * @tc.name    startServiceExtensionAbilityWithAccount with incorrect userId.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_003', 0, async function (done) {
      await sleep(2000);
      let want = {
        bundleName: "com.example.extensionapitest",
        abilityName: "FirstExtension"
      };
      await globalThis.abilityContext.startServiceExtensionAbilityWithAccount(want, 999).then((data) => {
        console.log(`Ability: startServiceExtensionAbilityWithAccount success: ${JSON.stringify(data)}`);
        expect("case execute failed").assertEqual("data");
      }).catch((error) => {
        console.error(`Ability: startServiceExtensionAbilityWithAccount failed: ${JSON.stringify(error)}`);
        expect(CROSS_USER_DENY).assertEqual(error.code);
      })
      done()
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_004
     * @tc.name    stopServiceExtensionAbilityWithAccount with incorrect userId.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_004', 0, async function (done) {
      await sleep(2000);
      let want = {
        bundleName: "com.example.extensionapitest",
        abilityName: "FirstExtension"
      };
      await globalThis.abilityContext.stopServiceExtensionAbilityWithAccount(want, 999).then((data) => {
        console.log(`Ability: stopServiceExtensionAbilityWithAccount success: ${JSON.stringify(data)}`);
        expect("case execute failed").assertEqual(data);
      }).catch((error) => {
        console.error(`Ability: stopServiceExtensionAbilityWithAccount failed: ${JSON.stringify(error)}`);
        expect(CROSS_USER_DENY).assertEqual(error.code);
      })
      done()
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_005
     * @tc.name    StartServiceExtensionAbility with incorrect abilityName.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_005', 0, async function (done) {
      await sleep(2000);
      let want = {
        bundleName: "com.example.extensionapitest",
        abilityName: "FirstExtension1"
      }
      await globalThis.abilityContext.startServiceExtensionAbility(want, (err, data) => {
        if (err.code) {
          console.error(`Ability: startServiceExtensionAbility failed: ${JSON.stringify(err)}`);
          expect(EXTENSION_INFO_ERR).assertEqual(err.code);
        } else {
          console.log(`Ability: startServiceExtensionAbility success: ${JSON.stringify(data)}`);
          expect("case execute failed").assertEqual(data);
        }
        done()
      })
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_006
     * @tc.name    StopServiceExtensionAbility with incorrect bundleName.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_006', 0, async function (done) {
      await sleep(2000);
      let want = {
        bundleName: "com.example.extensionapitest1",
        abilityName: "FirstExtension"
      };
      await globalThis.abilityContext.stopServiceExtensionAbility(want, (err, data) => {
        if (err.code) {
          console.error(`Ability: stopServiceExtensionAbility failed: ${JSON.stringify(err)}`);
          expect(EXTENSION_INFO_ERR).assertEqual(err.code);
        } else {
          console.log(`Ability: stopServiceExtensionAbility success: ${JSON.stringify(data)}`);
          expect("case execute failed").assertEqual(data);
        }
        done()
      })
      done()
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_007
     * @tc.name    startServiceExtensionAbilityWithAccount with incorrect userId.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_007', 0, async function (done) {
      await sleep(2000);
      let want = {
        bundleName: "com.example.extensionapitest",
        abilityName: "FirstExtension"
      };
      await globalThis.abilityContext.startServiceExtensionAbilityWithAccount(want, 999, (err, data) => {
        if (err.code) {
          console.error(`Ability: startServiceExtensionAbilityWithAccount failed: ${JSON.stringify(err)}`);
          expect(CROSS_USER_DENY).assertEqual(err.code);
        } else {
          console.log(`Ability: startServiceExtensionAbilityWithAccount success: ${JSON.stringify(data)}`);
          expect("case execute failed").assertEqual(data);
        }
        done()
      })
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_008
     * @tc.name    stopServiceExtensionAbilityWithAccount with incorrect userId.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_008', 0, async function (done) {
      await sleep(2000);
      let want = {
        bundleName: "com.example.extensionapitest",
        abilityName: "FirstExtension"
      };
      globalThis.abilityContext.stopServiceExtensionAbilityWithAccount(want, 999, (err, data) => {
        if (err.code) {
          console.error(`Ability: stopServiceExtensionAbilityWithAccount failed: ${JSON.stringify(err)}`);
          expect(CROSS_USER_DENY).assertEqual(err.code);
        } else {
          console.log(`Ability: stopServiceExtensionAbilityWithAccount success: ${JSON.stringify(data)}`);
          expect("case execute failed").assertEqual(data);
        }
        done()
      })
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_009
     * @tc.name    connectServiceExtensionAbility with invalid want.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_009', 0, async function (done) {
      console.log(`SUB_AA_ABILITY_Extension_API_009 start`);
      let want = {
        bundleName: "com.example.extensionapitest1",
        abilityName: "FirstExtension"
      };
      let options = {
        onConnect: function (elementName, proxy) {
          console.log("onConnect");
        },
        onDisconnect: function () {
          console.log("onDisconnect");
        },
        onFailed: function () {
          console.log("onFailed");
        }
      }
      try {
        let id = globalThis.abilityContext.connectServiceExtensionAbility(want, options);
        console.log(`connectServiceExtensionAbility id: ${id}`);
      } catch (err) {
        console.log(`connectServiceExtensionAbility catch code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
      }
      done();
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_010
     * @tc.name    disconnectServiceExtensionAbility with invalid connectionId.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_010', 0, async function (done) {
      console.log(`SUB_AA_ABILITY_Extension_API_010 start`);
      try {
        globalThis.abilityContext.disconnectServiceExtensionAbility(undefined, (err, data) => {
          console.log(`disconnectServiceExtensionAbility, err: ${JSON.stringify(err)}, data: ${JSON.stringify(data)}`);
          expect(err.code).assertEqual(INNER_ERROR);
          done();
        })
      } catch (err) {
        console.log(`disconnectServiceExtensionAbility catch code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_011
     * @tc.name    disconnectServiceExtensionAbility with invalid connectionId.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_011', 0, async function (done) {
      console.log(`SUB_AA_ABILITY_Extension_API_011 start`);
      try {
        globalThis.abilityContext.disconnectServiceExtensionAbility(undefined).then((err, data) => {
          console.log(`disconnectServiceExtensionAbility, err: ${JSON.stringify(err)}, data: ${JSON.stringify(data)}`);
          expect(err.code).assertEqual(INNER_ERROR);
        });
      } catch (err) {
        console.log(`disconnectServiceExtensionAbility catch code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
      }
      done();
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_012
     * @tc.name    killProcessesBySelf with invalid param.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_012', 0, async function (done) {
      try {
        let info: appManagerNew.ProcessInformation;
        let stageContext: common.AbilityStageContext = globalThis.stageContext;
        let abilityContext: common.UIAbilityContext = globalThis.abilityContext;
        let appContext: common.ApplicationContext = abilityContext.getApplicationContext();
        let baseContext: common.BaseContext = stageContext;
        let context: common.Context = stageContext;
        let el1 = contextConstant.AreaMode.EL1;
        let el2 = contextConstant.AreaMode.EL2;
        let eventHub: common.EventHub = context.eventHub;
        let abilityResult: common.AbilityResult;
        let connectOptions: common.ConnectOptions;

        console.log("killAllProcesses:" + JSON.stringify(appContext.killAllProcesses));
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
        abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let abilityDelegatorArgs: abilityDelegatorRegistry.AbilityDelegatorArgs;
        abilityDelegatorArgs = abilityDelegatorRegistry.getArguments();
        let abilityMonitor: abilityDelegatorRegistry.AbilityMonitor = {
          abilityName: "FirstExtension"
        }
        abilityDelegator.addAbilityMonitor(abilityMonitor, (err, data) => {
          console.log(`printMsg, err: ${JSON.stringify(err)}, data: ${JSON.stringify(data)}`);
        })
        let shellCmdResult: abilityDelegatorRegistry.ShellCmdResult;
      } catch (err) {
        console.log(`catch code: ${err.code}, message: ${err.message}`);
      }
      done();
    })

    /*
     * @tc.number  SUB_AA_AMS_Context_0100
     * @tc.name    Get the resource and path of the context.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Context_0100', 0, async function (done) {
      expect("/data/storage/el2/base/haps/phone/cache").assertEqual(globalThis.abilityContext.cacheDir)
      expect("/data/storage/el2/base/haps/phone/temp").assertEqual(globalThis.abilityContext.tempDir)
      expect("/data/storage/el2/base/haps/phone/files").assertEqual(globalThis.abilityContext.filesDir)
      expect("/data/storage/el2/database/phone").assertEqual(globalThis.abilityContext.databaseDir)
      expect("/data/storage/el2/base/haps/phone/preferences").assertEqual(globalThis.abilityContext.preferencesDir)
      expect("/data/storage/el1/bundle").assertEqual(globalThis.abilityContext.bundleCodeDir)
      expect("/data/storage/el2/distributedfiles").assertEqual(globalThis.abilityContext.distributedFilesDir)
      expect(1).assertEqual(globalThis.abilityContext.area)
	    let moduleContext = globalThis.abilityContext.createModuleContext("module1")
      expect("/data/storage/el2/base/cache").assertEqual(moduleContext.cacheDir)
      globalThis.abilityContext.area = 0
      expect(0).assertEqual(globalThis.abilityContext.area)
      globalThis.abilityContext.resourceManager.getConfiguration((err, data) => {
        if(err == undefined){
          console.log(`Ability: getConfiguration success: ${JSON.stringify(data)}`);
          console.log(`Ability: getConfiguration success: JSON.stringify(data.direction)`);
          expect(0).assertEqual(data.direction)
          done()
        }else{
        expect().assertFail()
          done()
        }
     })
    })

	/*
     * @tc.number  SUB_AA_AMS_Context_0200
     * @tc.name    Register the listener of Ability and cancel the listener.
     * @tc.desc    Function test
     * @tc.level   3
     */
	it('SUB_AA_AMS_Context_0200', 0, async function (done) {
      await globalThis.abilityContext.eventHub.on("contextEvent", func1)
      globalThis.abilityContext.eventHub.emit("contextEvent", "aa", "bb")
      await sleep(500)
      expect("aa").assertEqual(array[0])
      expect("bb").assertEqual(array[1])
      array = []
      await globalThis.abilityContext.eventHub.off("contextEvent", func1)
      globalThis.abilityContext.eventHub.emit("contextEvent", "cc", "dd")
      await sleep(500)
      expect(array.length).assertEqual(0)
      array = [];
      function func1(a, b){
        array.push(a)
        array.push(b)
      }
      await sleep(2000)
      done()
    })

    /*
     * @tc.number  SUB_AA_Form_provider_TestFormErr_0100
     * @tc.name    Get all FormError types.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_Form_provider_TestFormErr_0100', 0, async function (done) {
      console.info("SUB_AA_Form_provider_TestFormErr_0100");
      expect(7).assertEqual(formError.FormError.ERR_ADD_INVALID_PARAM)
      expect(10).assertEqual(formError.FormError.ERR_BIND_PROVIDER_FAILED)
      expect(8).assertEqual(formError.FormError.ERR_CFG_NOT_MATCH_ID)
      expect(1).assertEqual(formError.FormError.ERR_COMMON)
      expect(31).assertEqual(formError.FormError.ERR_FORM_DUPLICATE_ADDED)
      expect(20).assertEqual(formError.FormError.ERR_FORM_FA_NOT_INSTALLED)
      expect(18).assertEqual(formError.FormError.ERR_FORM_NO_SUCH_ABILITY)
      expect(19).assertEqual(formError.FormError.ERR_FORM_NO_SUCH_DIMENSION)
      expect(17).assertEqual(formError.FormError.ERR_FORM_NO_SUCH_MODULE)
      expect(5).assertEqual(formError.FormError.ERR_GET_BUNDLE_FAILED)
      expect(4).assertEqual(formError.FormError.ERR_GET_INFO_FAILED)
      expect(6).assertEqual(formError.FormError.ERR_GET_LAYOUT_FAILED)
      expect(36).assertEqual(formError.FormError.ERR_IN_RECOVERY)
      expect(15).assertEqual(formError.FormError.ERR_MAX_FORMS_PER_CLIENT)
      expect(12).assertEqual(formError.FormError.ERR_MAX_INSTANCES_PER_FORM)
      expect(11).assertEqual(formError.FormError.ERR_MAX_SYSTEM_FORMS)
      expect(16).assertEqual(formError.FormError.ERR_MAX_SYSTEM_TEMP_FORMS)
      expect(9).assertEqual(formError.FormError.ERR_NOT_EXIST_ID)
      expect(13).assertEqual(formError.FormError.ERR_OPERATION_FORM_NOT_SELF)
      expect(2).assertEqual(formError.FormError.ERR_PERMISSION_DENY)
      expect(14).assertEqual(formError.FormError.ERR_PROVIDER_DEL_FAIL)
      expect(30).assertEqual(formError.FormError.ERR_SYSTEM_RESPONSES_FAILED)
      done()
    })

    /*
     * @tc.number  SUB_AA_Form_provider_TestFormInfo_0100
     * @tc.name     Get all FormInfo types
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_Form_provider_TestFormInfo_0100', 0, async function (done) {
      console.info("SUB_AA_Form_provider_TestFormInfo_0100");
      expect("ohos.extra.param.key.form_dimension").assertEqual(FormInfo.FormParam.DIMENSION_KEY)
      expect("ohos.extra.param.key.form_height").assertEqual(FormInfo.FormParam.HEIGHT_KEY)
      expect("ohos.extra.param.key.module_name").assertEqual(FormInfo.FormParam.MODULE_NAME_KEY)
      expect("ohos.extra.param.key.form_width").assertEqual(FormInfo.FormParam.WIDTH_KEY)
      expect("ohos.extra.param.key.form_name").assertEqual(FormInfo.FormParam.NAME_KEY)
      expect("ohos.extra.param.key.form_temporary").assertEqual(FormInfo.FormParam.TEMPORARY_KEY)
      expect("ohos.extra.param.key.form_identity").assertEqual(FormInfo.FormParam.IDENTITY_KEY)
      expect(0).assertEqual(FormInfo.FormState.DEFAULT)
      expect(1).assertEqual(FormInfo.FormState.READY)
      expect(-1).assertEqual(FormInfo.FormState.UNKNOWN)
      expect(0).assertEqual(FormInfo.ColorMode.MODE_DARK)
      expect(1).assertEqual(FormInfo.ColorMode.MODE_LIGHT)
      expect(1).assertEqual(FormInfo.FormType.JS);
      done();
    });

    /*
     * @tc.number  SUB_AA_Form_provider_TestFormInfo_0200
     * @tc.name     Get all FormInfo types
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_Form_provider_TestFormInfo_0200', 0, async function (done) {
      console.info("SUB_AA_Form_provider_TestFormInfo_0200");
      expect("ohos.extra.param.key.form_dimension").assertEqual(formInfoNew.FormParam.DIMENSION_KEY)
      expect("ohos.extra.param.key.form_height").assertEqual(formInfoNew.FormParam.HEIGHT_KEY)
      expect("ohos.extra.param.key.module_name").assertEqual(formInfoNew.FormParam.MODULE_NAME_KEY)
      expect("ohos.extra.param.key.form_width").assertEqual(formInfoNew.FormParam.WIDTH_KEY)
      expect("ohos.extra.param.key.form_name").assertEqual(formInfoNew.FormParam.NAME_KEY)
      expect("ohos.extra.param.key.form_temporary").assertEqual(formInfoNew.FormParam.TEMPORARY_KEY)
      expect("ohos.extra.param.key.form_identity").assertEqual(formInfoNew.FormParam.IDENTITY_KEY)
      expect("ohos.extra.param.key.bundle_name").assertEqual(formInfoNew.FormParam.BUNDLE_NAME_KEY)
      expect("ohos.extra.param.key.ability_name").assertEqual(formInfoNew.FormParam.ABILITY_NAME_KEY)
      expect(0).assertEqual(formInfoNew.FormState.DEFAULT)
      expect(1).assertEqual(formInfoNew.FormState.READY)
      expect(-1).assertEqual(formInfoNew.FormState.UNKNOWN)
      expect(0).assertEqual(formInfoNew.ColorMode.MODE_DARK)
      expect(1).assertEqual(formInfoNew.ColorMode.MODE_LIGHT)
      console.info("SUB_AA_Form_provider_TestFormInfo_0200:" + formInfoNew.FormDimension.Dimension_2_1);
      expect(1).assertEqual(formInfoNew.FormDimension.Dimension_1_2)
      expect(2).assertEqual(formInfoNew.FormDimension.Dimension_2_2)
      expect(3).assertEqual(formInfoNew.FormDimension.Dimension_2_4)
      expect(4).assertEqual(formInfoNew.FormDimension.Dimension_4_4)
      expect(5).assertEqual(formInfoNew.FormDimension.Dimension_2_1)
      expect(1).assertEqual(formInfoNew.FormType.JS);
      expect(2).assertEqual(formInfoNew.FormType.eTS);
      expect(1).assertEqual(formInfoNew.VisibilityType.FORM_VISIBLE);
      expect(2).assertEqual(formInfoNew.VisibilityType.FORM_INVISIBLE);
      let formStateInfo: formInfoNew.FormStateInfo = {
        formState: formInfoNew.FormState.READY,
        want: {
          bundleName: "com.example.extensionapitest",
          abilityName: "FirstExtension"
        }
      }
      done();
    });

    /*
     * @tc.number  SUB_AA_Test_AbilityConstant_0100
     * @tc.name    Test abilityConstant.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_Test_AbilityConstant_0100', 0, async function (done) {
      expect(1).assertEqual(abilityConstant.LaunchReason.START_ABILITY)
      expect(1).assertEqual(abilityConstant.LastExitReason.ABILITY_NOT_RESPONDING)
      expect(2).assertEqual(abilityConstant.LastExitReason.NORMAL)
      expect(0).assertEqual(abilityConstant.MemoryLevel.MEMORY_LEVEL_MODERATE)
      expect(1).assertEqual(abilityConstant.MemoryLevel.MEMORY_LEVEL_LOW)
      expect(2).assertEqual(abilityConstant.MemoryLevel.MEMORY_LEVEL_CRITICAL)
      done()
    });

    /*
     * @tc.number  SUB_AA_FMS_AbilityStage_0100
     * @tc.name    Start AbilityStage and get config.
     * @tc.desc    Function test
     * @tc.level   3
     */
     it('SUB_AA_FMS_AbilityStage_0100', 0, async function (done) {
      console.info("SUB_AA_FMS_AbilityStage_0100===AbilityStage===" + JSON.stringify(globalThis.stageContext))
      console.info("SUB_AA_FMS_AbilityStage_0100===AbilityStage===" + JSON.stringify(globalThis.stageContext.config))
      let directions = globalThis.stageContext.config.direction
      let pointer = globalThis.stageContext.config.hasPointerDevice
      let subscriber = null
        let subscribeInfo = {
          events: ["AbilityStage_StartAbility"]
        }
        function UnSubscribeInfoCallback(err, data) {
          console.info("SUB_AA_FMS_AbilityStage_0100===UnSubscribeInfoCallback===")
          done()
        }
        async function SubscribeInfoCallback(err, data) {
          console.info("SUB_AA_FMS_AbilityStage_0100===SubscribeInfoCallback===" + JSON.stringify(data))
            expect(data.parameters["config"]).assertEqual(-1)
            expect(data.parameters["config"]).assertEqual(directions)
            expect(typeof(pointer)).assertEqual("boolean")
            commonEvent.unsubscribe(subscriber, UnSubscribeInfoCallback)
            await sleep(4000)
            done()
        }
        commonEvent.createSubscriber(subscribeInfo, (err, data) => {
          console.info("SUB_AA_FMS_AbilityStage_0100===CreateSubscriberCallback===")
          subscriber = data
          commonEvent.subscribe(subscriber, SubscribeInfoCallback)
        })
      let formWant ={
        deviceId:"",
        bundleName:"ohos.acts.aafwk.test.stagesupplement",
        abilityName:"MainAbility3",
      }
      globalThis.abilityContext.startAbility(formWant, (err, data)=>{
        if(err.code == 0){
           console.info("SUB_AA_FMS_AbilityStage_0100===CreateSubscriberCallback===")
        }else{
          console.info("SUB_AA_FMS_AbilityStage_0100===failed===")
          expect().assertFail()
          done()
        }
      })
    })

    /*
     * @tc.number  SUB_AA_FMS_AcquireForm_0100
     * @tc.name    Test startAbility in FormExtensionContext.
     * @tc.desc    Function test
     * @tc.level   3
     */
     it('SUB_AA_FMS_AcquireForm_0100', 0, async function (done) {
      let subscriber = null
      let formExtensionContext:common.FormExtensionContext
      let pacMap:ability.PacMap
        let subscribeInfo = {
          events: ["Form_StartAbility"]
        }
        function UnSubscribeInfoCallback(err, data) {
          console.info("SUB_AA_FMS_AcquireForm_0100 ===UnSubscribeInfoCallback===")
        }
        function SubscribeInfoCallback(err, data) {
          console.info("SUB_AA_FMS_AcquireForm_0100 ===SubscribeInfoCallback===" + JSON.stringify(data))
            expect(data.parameters["Life"]).assertEqual("onForeground")
            commonEvent.unsubscribe(subscriber, UnSubscribeInfoCallback)
            done()
        }
        commonEvent.createSubscriber(subscribeInfo, (err, data) => {
          console.info("SUB_AA_FMS_AcquireForm_0100 ===CreateSubscriberCallback===")
          subscriber = data
          commonEvent.subscribe(subscriber, SubscribeInfoCallback)
        })
      let formWant ={
        deviceId:"",
        bundleName:"com.example.apicoverhaptest",
        abilityName:"CreateFormAbility",
        parameters:{
          "createForm": true
        }
      }
      globalThis.abilityContext.startAbility(formWant, (err, data)=>{
        if(err.code == 0){
           console.info("SUB_AA_FMS_AcquireForm_0100 ===acquireFormState=== " + JSON.stringify(data))
        }else{
          expect().assertFail()
          done()
        }
      })
    })

    /*
     * @tc.number  SUB_AA_FormDisplaySpecifications_0100
     * @tc.name    Create a form and delete.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_FormDisplaySpecifications_0100', 0, async function (done) {
      let formWant ={
        deviceId:"",
        bundleName:"com.example.apicoverhaptest",
        abilityName:"FormHostAbility",
      }
      globalThis.abilityContext.startAbility(formWant, (err, data)=>{
        if(err.code == 0){
           console.info("SUB_AA_FormDisplaySpecifications_0100===abilityContext startAbility success===")
        }else{
          expect().assertFail()
          done()
        }
      })
      await sleep(2000)
      console.info("SUB_AA_FormDisplaySpecifications_0100===globalThis.formId21 success===" + globalThis.formId21)
      expect(globalThis.formId21 != undefined).assertTrue()
      formHost.deleteForm(globalThis.formId21).then((data)=>{
        console.info("SUB_AA_FormDisplaySpecifications_0100===deleteForm success===")
        done()
      }).catch((err)=>{
        console.info("SUB_AA_FormDisplaySpecifications_0100===deleteForm failed===")
        expect().assertFail()
        done()
      })
    })

    /*
     * @tc.number  SUB_AA_FormDisplaySpecifications_0200
     * @tc.name    get the form info.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_FormDisplaySpecifications_0200', 0, async function (done) {
      await formHost.getFormsInfo("com.example.apicoverhaptest", "phone").then((data)=>{
        console.info("SUB_AA_FormDisplaySpecifications_0200===deleteForm success===" + JSON.stringify(data))
        expect(5).assertEqual(data[0].defaultDimension)
        done()
      }).catch((err)=>{
        console.info("SUB_AA_FormDisplaySpecifications_0200===deleteForm failed===" + JSON.stringify(err))
        expect().assertFail()
        done()
      })
    })

    /*
     * @tc.number  SUB_AA_AbilityAppManager_0100
     * @tc.name    The form of a promise getRunningProcessInformation
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AbilityAppManager_0100', 0, async function (done) {
      TAG = 'SUB_AA_AbilityAppManager_0100';
      await appManagerNew.getRunningProcessInformation().then((data)=>{
        console.log(`${TAG} getRunningProcessInformation data  ${JSON.stringify(data.length)}`);
        for (let i = 0; i < data.length; i++) {
          console.log(`${TAG} getRunningProcessInformation${i} : JSON.stringify(data[i])`);
          expect(typeof (data[i].pid)).assertEqual("number");
          expect(data[i].pid).assertLarger(0);
          expect(typeof (data[i].uid)).assertEqual("number");
          expect(data[i].uid).assertLarger(0);
          expect(typeof (data[i].processName)).assertEqual("string");
          expect(data[i].processName.length).assertLarger(0);
          expect(Array.isArray(data[i].bundleNames)).assertEqual(true);
          expect(data[i].bundleNames.length).assertLarger(0);
        }
        done();
      }).catch((err)=>{
        console.log(`${TAG} getRunningProcessInformation err  ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number  SUB_AA_AbilityAppManager_0200
     * @tc.name    The form of a callback getRunningProcessInformation
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AbilityAppManager_0200', 0, async function (done) {
      TAG = 'SUB_AA_AbilityAppManager_0100';
      appManagerNew.getRunningProcessInformation((err, data) => {
        console.log(`${TAG} getRunningProcessInformation data  ${JSON.stringify(data.length)}
        err: ${JSON.stringify(err)}`);
        for (let i = 0; i < data.length; i++) {
          console.log(`${TAG} getRunningProcessInformation${i} : JSON.stringify(data[i])`);
          expect(typeof (data[i].pid)).assertEqual("number");
          expect(data[i].pid).assertLarger(0);
          expect(typeof (data[i].uid)).assertEqual("number");
          expect(data[i].uid).assertLarger(0);
          expect(typeof (data[i].processName)).assertEqual("string");
          expect(data[i].processName.length).assertLarger(0);
          expect(Array.isArray(data[i].bundleNames)).assertEqual(true);
          expect(data[i].bundleNames.length).assertLarger(0);
        }
        done();
      })
    })

    /*
     * @tc.number  SUB_AA_ApplicationContext_0100
     * @tc.name    The form of a promise getRunningProcessInformation
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ApplicationContext_0100', 0, async function (done) {
      TAG = 'SUB_AA_ApplicationContext_0100';
      await globalThis.applicationContext.getRunningProcessInformation().then((data)=>{
        console.log(`${TAG} getRunningProcessInformation data  ${JSON.stringify(data.length)}`);
        for (let i = 0; i < data.length; i++) {
          console.log(`${TAG} getRunningProcessInformation${i} : JSON.stringify(data[i])`);
          expect(typeof (data[i].pid)).assertEqual("number");
          expect(data[i].pid).assertLarger(0);
          expect(typeof (data[i].uid)).assertEqual("number");
          expect(data[i].uid).assertLarger(0);
          expect(typeof (data[i].processName)).assertEqual("string");
          expect(data[i].processName.length).assertLarger(0);
          expect(Array.isArray(data[i].bundleNames)).assertEqual(true);
          expect(data[i].bundleNames.length).assertLarger(0);
        }
        done();
      }).catch((err)=>{
        console.log(`${TAG} getRunningProcessInformation err  ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number  SUB_AA_ApplicationContext_0200
     * @tc.name    The form of a callback getRunningProcessInformation
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ApplicationContext_0200', 0, async function (done) {
      TAG = 'SUB_AA_ApplicationContext_0200';
      globalThis.applicationContext.getRunningProcessInformation((err, data) => {
        console.log(`${TAG} getRunningProcessInformation data  ${JSON.stringify(data.length)}
        err: ${JSON.stringify(err)}`);
        for (let i = 0; i < data.length; i++) {
          console.log(`${TAG} getRunningProcessInformation${i} : JSON.stringify(data[i])`);
          expect(typeof (data[i].pid)).assertEqual("number");
          expect(data[i].pid).assertLarger(0);
          expect(typeof (data[i].uid)).assertEqual("number");
          expect(data[i].uid).assertLarger(0);
          expect(typeof (data[i].processName)).assertEqual("string");
          expect(data[i].processName.length).assertLarger(0);
          expect(Array.isArray(data[i].bundleNames)).assertEqual(true);
          expect(data[i].bundleNames.length).assertLarger(0);
        }
        done();
      })
    })
  })
}
