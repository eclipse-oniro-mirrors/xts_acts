/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import contextConstant from "@ohos.app.ability.contextConstant";
import appManager from '@ohos.app.ability.appManager'
import { ProcessInformation } from 'application.ProcessInformation'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import insightIntent from '@ohos.app.ability.insightIntent'
import Want from '@ohos.app.ability.Want';
import { ElementName } from 'bundleManager.ElementName';
import rpc from '@ohos.rpc';
import { BusinessError } from '@ohos.base';
import { Driver, ON } from '@ohos.UiTest';

class ConnectOptions implements common.ConnectOptions {
  public isConnect: boolean = false;
  public isDisConnect: boolean = false;
  public isFailed: boolean = false;
  public failedCode: number = -1;

  onConnect: (elementName: ElementName, remote: rpc.IRemoteObject) => void = (elementName: ElementName,
    remote: rpc.IRemoteObject) => {
    hilog.info(0x0000, tag, 'ConnectOptions onConnect');
    this.isConnect = true;
  }

  onDisconnect: (elementName: ElementName) => void = (elementName: ElementName) => {
    hilog.info(0x0000, tag, 'ConnectOptions onDisconnect');
    this.isDisConnect = true;
  }

  onFailed: (code: int) => void = (code: int) => {
    hilog.info(0x0000, tag, `ConnectOptions onFailed code: ${code}`);
    this.isFailed = true;
    this.failedCode = code;
  }
}

let domain: int = 0x0000;
let tag: string = 'testTag';
let context: common.UIAbilityContext | undefined;
let array: string[] = new Array<string>();

export default function ApiCoverStaticTest() {
  describe('ApiCoverStaticTestTest', () => {
    const BUNDLE_NAME = 'com.example.apicoverhaptest.static';

    beforeAll(async () => {
      let driver = Driver.create();	
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
      hilog.info(domain, tag, 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      hilog.info(domain, tag, 'beforeAll AbilityDelegator');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.apicoverhaptest.static")
      await Utils.msSleep(2000);
      context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(domain, tag, 'beforeAll end');
    })

    /**
     * @tc.name   SUB_AA_ABILITY_Extension_API_Static_012
     * @tc.number SUB_AA_ABILITY_Extension_API_Static_012
     * @tc.desc   killProcessesBySelf with invalid param.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_AA_ABILITY_Extension_API_Static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        hilog.info(0x0000, 'SUB_AA_ABILITY_Extension_API_Static_012', `el1 start`);
        let el1 = contextConstant.AreaMode.EL1;
        expect((String(el1))).assertEqual("0");
        hilog.info(0x0000, 'SUB_AA_ABILITY_Extension_API_Static_012', `el2 start`);
        let el2 = contextConstant.AreaMode.EL2;
        expect((String(el2))).assertEqual("1");
        hilog.info(0x0000, 'SUB_AA_ABILITY_Extension_API_Static_012', `el3 start`);
        let el3 = contextConstant.AreaMode.EL3;
        expect((String(el3))).assertEqual("2");
        hilog.info(0x0000, 'SUB_AA_ABILITY_Extension_API_Static_012', `el4 start`);
        let el4 = contextConstant.AreaMode.EL4;
        expect((String(el4))).assertEqual("3");
        hilog.info(0x0000, 'SUB_AA_ABILITY_Extension_API_Static_012', `el5 start`);
        let el5 = contextConstant.AreaMode.EL5;
        expect((String(el5))).assertEqual("4");
        hilog.info(0x0000, 'SUB_AA_ABILITY_Extension_API_Static_012', `AreaMode end`);
        done()
      } catch (err) {
        hilog.info(0x0000, 'testTag', '%{public}s', `catch code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_AA_Test_InsightIntent_Static_0100
     * @tc.number SUB_AA_Test_InsightIntent_Static_0100
     * @tc.desc   Test insightIntent.ExecuteMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_AA_Test_InsightIntent_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('0').assertEqual(insightIntent.ExecuteMode.UI_ABILITY_FOREGROUND + '');
      expect('1').assertEqual(insightIntent.ExecuteMode.UI_ABILITY_BACKGROUND + '');
      expect('2').assertEqual(insightIntent.ExecuteMode.UI_EXTENSION_ABILITY + '');
      done();
    })

    /**
     * @tc.name   SUB_AA_AbilityAppManager_Static_0100
     * @tc.number SUB_AA_AbilityAppManager_Static_0100
     * @tc.desc   The form of a promise getRunningProcessInformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_AA_AbilityAppManager_Static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "SUB_AA_AbilityAppManager_Static_0100 begin");
      await Utils.msSleep(1000);
      appManager.getRunningProcessInformation()
        .then((data: Array<ProcessInformation>) => {
          hilog.info(domain, tag, "SUB_AA_AbilityAppManager_Static_0100 success");
          hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0100 getRunningProcessInformation data.length:' + data.length);
          for (let i = 0; i < data.length; i++) {
            hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0100 getRunningProcessInformation data' + i);
            hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0100 getRunningProcessInformation data' + i + '.pid: ' + data[i].pid);
            expect(typeof (data[i].pid)).assertEqual("int");
            expect(data[i].pid).assertLarger(0.0);
            hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0100 getRunningProcessInformation data' + i + '.uid: ' + data[i].uid);
            expect(typeof (data[i].uid)).assertEqual("int");
            expect(data[i].uid).assertLarger(0.0);
            hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0100 getRunningProcessInformation data' + i + '.processName: ' + data[i].processName);
            expect(typeof (data[i].processName)).assertEqual("string");
            expect(data[i].processName.length).assertLarger(0.0);
            hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0100 getRunningProcessInformation data' + i + '.bundleNames: ' + data[i].bundleNames);
            expect(Array.isArray(data[i].bundleNames)).assertEqual(true);
            expect(data[i].bundleNames.length).assertLarger(0.0);
            hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0100 getRunningProcessInformation data' + i + '.bundleType: ' + data[i]?.bundleType);
            expect(typeof (data[i]?.bundleType)).assertEqual("int");
            hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0100 getRunningProcessInformation data' + i + '.appCloneIndex: ' + data[i]?.appCloneIndex);
            expect(data[i]?.appCloneIndex).assertUndefined();
          }
          hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0100 getRunningProcessInformation done');
          done();
        })
        .catch<void>((err: Error): void => {
          hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0100 getRunningProcessInformation err: ' + err);
          expect().assertFail();
          done();
        })
    })

    /**
     * @tc.name   SUB_AA_AbilityAppManager_Static_0200
     * @tc.number SUB_AA_AbilityAppManager_Static_0200
     * @tc.desc   The form of a callback getRunningProcessInformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_AA_AbilityAppManager_Static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "SUB_AA_AbilityAppManager_Static_0200 begin");
      await Utils.msSleep(1000);
      appManager.getRunningProcessInformation((err: BusinessError | null, data: Array<ProcessInformation> | undefined) => {
        if (err != null && data !== undefined) {
          hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0200 getRunningProcessInformation data.length: ' + data!.length);
          for (let i = 0; i < data!.length; i++) {
            hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0200 getRunningProcessInformation data' + i + '.pid: ' + data![i].pid);
            expect(typeof (data![i].pid)).assertEqual("int");
            expect(data![i].pid).assertLarger(0.0);
            hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0200 getRunningProcessInformation data' + i + '.uid: ' + data![i].uid);
            expect(typeof (data![i].uid)).assertEqual("int");
            expect(data![i].uid).assertLarger(0.0);
            hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0200 getRunningProcessInformation data' + i + '.processName: ' + data![i].processName);
            expect(typeof (data![i].processName)).assertEqual("string");
            expect(data![i].processName.length).assertLarger(0.0);
            hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0200 getRunningProcessInformation data' + i + '.bundleNames: ' + data![i].bundleNames);
            expect(Array.isArray(data![i].bundleNames)).assertEqual(true);
            expect(data![i].bundleNames.length).assertLarger(0.0);
            hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0200 getRunningProcessInformation data' + i + '.state: ' + data![i].state);
            expect(typeof data![i].state).assertEqual("int");
            expect(data![i].state >= -1 && data![i].state <= 5).assertTrue();
          }
          hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0200 getRunningProcessInformation done');
          done();
        } else {
          hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0200 getRunningProcessInformation err: ' + err);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Context_AbilityContext_Static_1700
     * @tc.number SUB_Ability_AbilityRuntime_Context_AbilityContext_Static_1700
     * @tc.desc   test want as empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Context_AbilityContext_Static_1700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityRuntime_Context_AbilityContext_Static_1700';
        hilog.info(domain, tag, `${itName} start`);
        try {
          const want: Want = {};
          const options = new ConnectOptions();
          hilog.info(domain, tag, `${itName} connect`);
          const connectId = context?.connectServiceExtensionAbility(want, options);
          hilog.info(domain, tag, `${itName} connectId: ${connectId}`);
          await Utils.msSleep(2000);

          hilog.info(domain, tag, `${itName} options isFailed: ${options.isFailed}`);
          expect(options.isFailed).assertTrue();
          hilog.info(domain, tag, `${itName} options failedCode: ${options.failedCode}`)
          expect(`${options.failedCode}`).assertEqual('16000001');
        } catch (err) {
          hilog.info(domain, tag, `${itName} err: code ${err.code}, message ${err.message}`);
          expect().assertFail();
        }
        done();
        hilog.info(domain, tag, `${itName} end`);
      });

    /**
     * @tc.name   SUB_Ability_AbilityBase_ErrorCode_Static_0004
     * @tc.number SUB_Ability_AbilityBase_ErrorCode_Static_0004
     * @tc.desc   To verify the errcode 16000001 when The specified ability does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_ErrorCode_Static_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityBase_ErrorCode_Static_0004';
        hilog.info(domain, tag, `${itName} start`);
        try {
          const want: Want = {
            bundleName: `${BUNDLE_NAME}`,
            abilityName: 'ServiceExt1'
          };
          const options = new ConnectOptions();
          hilog.info(domain, tag, `${itName} connect`);
          const connectId = context?.connectServiceExtensionAbility(want, options);
          hilog.info(domain, tag, `${itName} connectId: ${connectId}`);
          await Utils.msSleep(2000);

          hilog.info(domain, tag, `${itName} options isFailed: ${options.isFailed}`);
          expect(options.isFailed).assertTrue();
          hilog.info(domain, tag, `${itName} options failedCode: ${options.failedCode}`);
          expect(`${options.failedCode}`).assertEqual('16000001');
        } catch (err) {
          hilog.info(domain, tag, `${itName} err: code ${err.code}, message ${err.message}`);
          expect().assertFail();
        }
        done();
        hilog.info(domain, tag, `${itName} end`);
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_ErrorCode_Static_0005
     * @tc.number SUB_Ability_AbilityBase_ErrorCode_Static_0005
     * @tc.desc   To verify the errcode 16000002 when Incorrect ability type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_ErrorCode_Static_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityBase_ErrorCode_Static_0005';
        hilog.info(domain, tag, `${itName} start`);
        try {
          const want: Want = {
            bundleName: `${BUNDLE_NAME}`,
            abilityName: 'EntryAbility'
          };
          const options = new ConnectOptions();
          hilog.info(domain, tag, `${itName} connect`);
          const connectId = context?.connectServiceExtensionAbility(want, options);
          hilog.info(domain, tag, `${itName} connectId: ${connectId}`);
          await Utils.msSleep(2000);

          hilog.info(domain, tag, `${itName} options isFailed: ${options.isFailed}`);
          expect(options.isFailed).assertTrue();
          hilog.info(domain, tag, `${itName} options failedCode: ${options.failedCode}`);
          expect(`${options.failedCode}`).assertEqual('16000002');
        } catch (err) {
          hilog.info(domain, tag, `${itName} err: code ${err.code}, message ${err.message}`);
          expect().assertFail();
        }
        done();
        hilog.info(domain, tag, `${itName} end`);
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_Static_3800
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_Static_3800
     * @tc.desc   Call the interface disconnectServiceExtensionAbility through context, return errorcode 16000050.(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_Static_3800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityBase_UIAbilityContext_Static_3800';
        hilog.info(domain, tag, `${itName} start`);
        try {
          hilog.info(domain, tag, `${itName} disconnect`);
          context?.disconnectServiceExtensionAbility(-1).then(() => {
            hilog.info(domain, tag, `${itName} disconnect success`);
            expect().assertFail();
            done();
            hilog.info(domain, tag, `${itName} end`);
          }).catch((e) => {
            const err = e as BusinessError;
            hilog.info(domain, tag, `${itName} disconnect err: code ${err.code}, message ${err.message}`);
            expect(`${err.code}`).assertEqual('16000050');
            done();
            hilog.info(domain, tag, `${itName} end`);
          })
        } catch (err) {
          hilog.info(domain, tag, `${itName} err: code ${err.code}, message ${err.message}`);
          expect().assertFail();
          done();
          hilog.info(domain, tag, `${itName} end`);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_Static_3900
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_Static_3900
     * @tc.desc   Call the interface disconnectServiceExtensionAbility through context, return errorcode 16000050.(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_Static_3900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityBase_UIAbilityContext_Static_3900';
        hilog.info(domain, tag, `${itName} start`);
        try {
          hilog.info(domain, tag, `${itName} disconnect`);
          context?.disconnectServiceExtensionAbility(-1, (err: BusinessError<void> | null) => {
            hilog.info(domain, tag, `${itName} disconnect err: code ${err?.code}, message ${err?.message}`);
            expect(`${err?.code}`).assertEqual('16000050');
            done();
            hilog.info(domain, tag, `${itName} end`);
          });
        } catch(err) {
          err = err as BusinessError;
          hilog.info(domain, tag, `${itName} err: code ${err.code}, message ${err.message}`);
          expect().assertFail();
          done();
          hilog.info(domain, tag, `${itName} end`);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Context_AbilityContext_Static_1800
     * @tc.number SUB_Ability_AbilityRuntime_Context_AbilityContext_Static_1800
     * @tc.desc   connectServiceExtensionAbility is normal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Context_AbilityContext_Static_1800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityRuntime_Context_AbilityContext_Static_1800';
        hilog.info(domain, tag, `${itName} start`);
        try {
          const want: Want = {
            bundleName: `${BUNDLE_NAME}`,
            abilityName: 'ServiceExt'
          };
          const options = new ConnectOptions();
          hilog.info(domain, tag, `${itName} connect`);
          const connectId = context?.connectServiceExtensionAbility(want, options);
          hilog.info(domain, tag, `${itName} connectId: ${connectId}`);
          await Utils.msSleep(2000);
          hilog.info(domain, tag, `${itName} options isConnect: ${options.isConnect}`);
          expect(options.isConnect).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, `${itName} err: code ${err.code}, message ${err.message}`);
          expect().assertFail();
        }
        done();
        hilog.info(domain, tag, `${itName} end`);
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_Static_4000
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_Static_4000
     * @tc.desc   Call the interface disconnectServiceExtensionAbility through context.(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_Static_4000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityBase_UIAbilityContext_Static_4000';
        hilog.info(domain, tag, `${itName} start`);
        try {
          const want: Want = {
            bundleName: `${BUNDLE_NAME}`,
            abilityName: 'ServiceExt'
          };
          const options = new ConnectOptions();
          const connectId = context!.connectServiceExtensionAbility(want, options);
          hilog.info(domain, tag, `${itName} connectId: ${connectId}`);
          await Utils.msSleep(2000);
          expect(options.isConnect).assertTrue();

          hilog.info(domain, tag, `${itName} disconnect`);
          context?.disconnectServiceExtensionAbility(connectId).then(() => {
            hilog.info(domain, tag, `${itName} disconnect success`);
            hilog.info(domain, tag, `${itName} options isDisConnect: ${options.isDisConnect}`);
            expect(options.isDisConnect).assertTrue();
            done();
            hilog.info(domain, tag, `${itName} end`);
          }).catch((e) => {
            const err = e as BusinessError;
            hilog.info(domain, tag, `${itName} disconnect err: code ${err.code}, message ${err.message}`);
            expect().assertFail();
            done();
            hilog.info(domain, tag, `${itName} end`);
          })
        } catch (err) {
          hilog.info(domain, tag, `${itName} err: code ${err.code}, message ${err.message}`);
          expect().assertFail();
          done();
          hilog.info(domain, tag, `${itName} end`);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_Static_4100
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_Static_4100
     * @tc.desc   Call the interface disconnectServiceExtensionAbility through context.(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_Static_4100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityBase_UIAbilityContext_Static_4100';
        hilog.info(domain, tag, `${itName} start`);
        try {
          const want: Want = {
            bundleName: `${BUNDLE_NAME}`,
            abilityName: 'ServiceExt'
          };
          const options = new ConnectOptions();
          const connectId = context!.connectServiceExtensionAbility(want, options);
          hilog.info(domain, tag, `${itName} connectId: ${connectId}`);
          await Utils.msSleep(2000);
          expect(options.isConnect).assertTrue();

          hilog.info(domain, tag, `${itName} disconnect`);
          context?.disconnectServiceExtensionAbility(connectId, (err: BusinessError<void> | null): void => {
            hilog.info(domain, tag, `${itName} disconnect err: code ${err?.code}, message ${err?.message}`);
            expect(`${err?.code}`).assertEqual('0');
            hilog.info(domain, tag, `${itName} options isDisConnect: ${options.isDisConnect}`);
            expect(options.isDisConnect).assertTrue();
            done();
            hilog.info(domain, tag, `${itName} end`);
          });
        } catch (err) {
          hilog.info(domain, tag, `${itName} err: code ${err.code}, message ${err.message}`);
          expect().assertFail();
          done();
          hilog.info(domain, tag, `${itName} end`);
        }
      });
  })
}