/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import { BusinessError, RecordData } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import StartOptions from '@ohos.app.ability.StartOptions'
import { Caller } from '@ohos.app.ability.UIAbility';
import contextConstant from '@ohos.app.ability.contextConstant';
import { Driver, ON } from '@ohos.UiTest';

let domain: int = 0x0000;
let tag: string = 'testTag';
let context:common.UIAbilityContext;

export default function UIAbilityContextteststatic() {
  describe("AbilityUIAbilityContextTestStatic", (): void => {

    beforeAll(async() => {
      let driver = Driver.create();
      try {
          let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
          if (allowed) {
            await allowed.click();
          }
      } catch (err) {
          console.error('findComponent failed: ' + JSON.stringify(err));
      }      
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.actsbaseerrrocodemethodtest.static");
      await Utils.msSleep(2000);
      context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_static_0100
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_static_0100
     * @tc.desc   To verify the scenario where error code 16000004 is returned when the startAbilityForResult interface is invoked, Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Ability_AbilityBase_UIAbilityContextError_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Test SUB_Ability_AbilityBase_UIAbilityContextError_static_0100 START');
        let want: Want = {
          deviceId: '',
          bundleName: 'com.acts.ability.baseerrorrely.static',
          abilityName: 'EntryAbility1'
        };
        try {
          context.startAbilityForResult(want,(err: BusinessError | null, data: common.AbilityResult | undefined)=>{
            hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_static_0100`, err?.message);
            expect(err?.code).assertEqual(16000004);
            done();
          })
        } catch (err: BusinessError) {
          hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_static_0100`, err.message);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_static_0100 end');
      });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_static_0200
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_static_0200
     * @tc.desc   To verify the scenario where error code 16000019 is returned when the startAbilityForResult interface is invoked,Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Ability_AbilityBase_UIAbilityContextError_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_static_0200 start');
        let want: Want = {
          deviceId: '',
          bundleName: 'com.acts.ability.baseerrorrely.static',
          action: 'zzabc'
        };
        try {
          context.startAbilityForResult(want, (err: BusinessError | null, data: common.AbilityResult | undefined)=>{
            hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_static_0200 ${err?.code}`);
            expect(err?.code).assertEqual(16000019);
            done();
          })
        } catch (err: BusinessError) {
          hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_static_0200 ${err?.code}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_static_0200 end');
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_static_1000
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_static_1000
     * @tc.desc   To verify the scenario where error code 16000050 is returned when the startAbilityForResult interface is invoked,Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Ability_AbilityBase_UIAbilityContextError_static_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_static_1000 start');
        let Fd: Record<String,Object> = {
          'type': 'FD',
          'value': -1
        }
        let parameters: Record<String,RecordData> = {
          'keyFd': Fd
        }
        let want: Want = {
          deviceId: '',
          bundleName: 'com.acts.ability.baseerrorrely',
          abilityName: 'EntryAbility',
          parameters: parameters
        };
        try {
          context.startAbilityForResult(want, (err: BusinessError | null, data: common.AbilityResult | undefined)=>{
            hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_static_1000 ${err?.code}`);
            expect(err?.code).assertEqual(16000050);
            done();
          })
        } catch (err: BusinessError) {
          hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_static_1000 ${err?.code}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_static_1000 end');
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_static_1100
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_static_1100
     * @tc.desc   To verify the scenario where error code 16000004 is returned when the startAbilityForResult interface is invoked,Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Ability_AbilityBase_UIAbilityContextError_static_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Test START');
        let want: Want = {
          bundleName: 'com.acts.ability.baseerrorrely.static',
          abilityName: 'EntryAbility1'
        };
        let options: StartOptions = {
          displayId: 0
        };
        try {
          context.startAbilityForResult(want,options, (err: BusinessError | null, data: common.AbilityResult | undefined)=>{
            hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_static_1100`, err?.message);
            expect(err?.code).assertEqual(16000004);
            done();
          })
        } catch (err: BusinessError) {
          hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_static_1100`, err.message);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_static_1100 end');
      });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_static_1200
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_static_1200
     * @tc.desc   To verify the scenario where error code 16000019 is returned when the startAbilityForResult interface is invoked Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Ability_AbilityBase_UIAbilityContextError_static_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Test START');
        let want: Want = {
          deviceId: '',
          bundleName: 'com.acts.ability.baseerrorrely.static',
          action: 'zzabc'
        };
        let options: StartOptions = {
          displayId: 0
        };
        try {
          context.startAbilityForResult(want,options, (err: BusinessError | null, data: common.AbilityResult | undefined)=>{
            hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_static_1100`, err?.message);
            expect(err?.code).assertEqual(16000019);
            done();
          })
        } catch (err: BusinessError) {
          hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_static_1100`, err.message);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_static_1100 end');
      });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_static_2000
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_static_2000
     * @tc.desc   To verify the scenario where error code 16000050 is returned when the startAbilityForResult interface is invoked,Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Ability_AbilityBase_UIAbilityContextError_static_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Test START');
        let Fd: Record<String,Object> = {
          'type': 'FD',
          'value': -1
        }
        let parameters: Record<String,RecordData> = {
          'keyFd': Fd
        }
        let want: Want = {
          deviceId: '',
          bundleName: 'com.acts.ability.baseerrorrely',
          abilityName: 'EntryAbility',
          parameters: parameters
        };
        let options: StartOptions = {
          displayId: 0
        };
        try {
          context.startAbilityForResult(want,options, (err: BusinessError | null, data: common.AbilityResult | undefined)=>{
            hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_static_2000`, err?.message);
            expect(err?.code).assertEqual(16000050);
            done();
          })
        } catch (err: BusinessError) {
          hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_static_2000`, err.message);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_static_2000 end');
      });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_static_2100
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_static_2100
     * @tc.desc   To verify the scenario where error code 16000004 is returned when the startAbilityForResult interface is invoked,Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Ability_AbilityBase_UIAbilityContextError_static_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Test START');
        let want: Want = {
          deviceId: '',
          bundleName: 'com.acts.ability.baseerrorrely.static',
          abilityName: 'EntryAbility1'
        };
        let options: StartOptions = {
          displayId: 0
        };
        try {
          context.startAbilityForResult(want,options)
            .then((result: common.AbilityResult) => {
              hilog.info(domain, tag, '%{public}s', `startAbilityForResult succeed`);
              expect().assertFail();
              done();
            })
            .catch((err: Error):void => {
              hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_static_2100 ${err.code}`);
              expect(err.code).assertEqual(16000004);
              done();
            });
        } catch (err: BusinessError) {
          hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_static_2100 ${err.code}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_static_2100 end');
      });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_static_2200
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_static_2200
     * @tc.desc   To verify the scenario where error code 16000019 is returned when the startAbilityForResult interface is invoked,Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Ability_AbilityBase_UIAbilityContextError_static_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Test START');
        let want: Want = {
          deviceId: '',
          bundleName: 'com.acts.ability.baseerrorrely.static',
          action: 'zzabc'
        };
        let options: StartOptions = {
          displayId: 0
        };
        try {
          context.startAbilityForResult(want,options)
            .then((result: common.AbilityResult) => {
              hilog.info(domain, tag, '%{public}s', `startAbilityForResult succeed`);
              expect().assertFail();
              done();
            })
            .catch((err: Error):void => {
              hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_static_2200 ${err.code}`);
              expect(err.code).assertEqual(16000019);
              done();
            });
        } catch (err: BusinessError) {
          hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_static_2200 ${err.code}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_static_2200 end');
      });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_static_3000
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_static_3000
     * @tc.desc   To verify the scenario where error code 16000050 is returned when the startAbilityForResult interface is invoked,Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Ability_AbilityBase_UIAbilityContextError_static_3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Test START');
        let Fd: Record<String,Object> = {
          'type': 'FD',
          'value': -1
        }
        let parameters: Record<String,RecordData> = {
          'keyFd': Fd
        }
        let want: Want = {
          deviceId: '',
          bundleName: 'com.acts.ability.baseerrorrely',
          abilityName: 'EntryAbility',
          parameters: parameters
        };
        let options: StartOptions = {
          displayId: 0
        };
        try {
          context.startAbilityForResult(want,options)
            .then((result: common.AbilityResult) => {
              hilog.info(domain, tag, '%{public}s', `startAbilityForResult succeed`);
              expect().assertFail();
              done();
            })
            .catch((err: Error):void => {
              hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_static_3000 ${err.code}`);
              expect(err.code).assertEqual(16000050);
              done();
            });
        } catch (err: BusinessError) {
          hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_static_3000 ${err.code}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_static_3000 end');
      });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_static_3100
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_static_3100
     * @tc.desc   To verify the scenario where error code 16000001 is returned when the startAbilityByCall interface is invoked Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Ability_AbilityBase_UIAbilityContextError_static_3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Test SUB_Ability_AbilityBase_UIAbilityContextError_static_3100 START');
        let caller: Caller;
        let want: Want = {
          deviceId: '',
          bundleName: 'com.acts.ability.baseerrorrely.static',
          abilityName: 'EntryAbilityzzabc',
        };
        try {
          context.startAbilityByCall(want)
            .then((obj: Caller) => {
              caller = obj;
              hilog.info(domain, tag, '%{public}s', `startAbilityByCall succeed`);
              expect().assertFail();
              done();
            }).catch((err: Error): void => {
            hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_static_3100 ${err.code}`);
            expect(err.code).assertEqual(16000001);
            done();
          });
        } catch (err: BusinessError) {
          hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_static_3100 ${err.code}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_static_3100 end');
      });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_static_3300
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_static_3300
     * @tc.desc   To verify the scenario where error code 16000050 is returned when the startAbilityByCall interface is invoked Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Ability_AbilityBase_UIAbilityContextError_static_3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Test SUB_Ability_AbilityBase_UIAbilityContextError_static_3300 START');
        let caller: Caller;
        let Fd: Record<String,Object> = {
          'type': 'FD',
          'value': -1
        }
        let parameters: Record<String,RecordData> = {
          'keyFd': Fd
        }
        let want: Want = {
          deviceId: '',
          bundleName: 'com.acts.ability.baseerrorrely',
          abilityName: 'EntryAbility',
          parameters: parameters
        };
        try {
          context.startAbilityByCall(want)
            .then((obj: Caller) => {
              caller = obj;
              hilog.info(domain, tag, '%{public}s', `startAbilityByCall succeed`);
              expect().assertFail();
              done();
            }).catch((err: Error): void => {
            hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_static_3300 ${err.code}`);
            expect(err.code).assertEqual(16000050);
            done();
          });
        } catch (err: BusinessError) {
          hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_static_3300 ${err.code}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_static_3300 end');
      });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_static_4100
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_static_4100
     * @tc.desc   To verify the scenario where error code 16000005 is returned when the startAbilityForResult interface is invoked, Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Ability_AbilityBase_UIAbilityContextError_static_4100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Test START');
        let want: Want = {
          bundleName: 'com.acts.ability.baseerrorrely.static',
          abilityName: 'EntryAbility2'
        };
        let options: StartOptions = {
          displayId: 0
        };
        try {
          context.startAbilityForResult(want,options, (err: BusinessError | null, data: common.AbilityResult | undefined)=>{
            hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_1100`, err?.message);
            expect(err?.code).assertEqual(16000005);
            done();
          })
        } catch (err: BusinessError) {
          hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_1100`, err.message);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_1100 end');
      });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_static_4200
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_static_4200
     * @tc.desc   To verify the scenario where error code 16000005 is returned when the startAbilityForResult interface is invoked, Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Ability_AbilityBase_UIAbilityContextError_static_4200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Test START');
        let want: Want = {
          bundleName: 'com.acts.ability.baseerrorrely.static',
          abilityName: 'EntryAbility2'
        };
        try {
          context.startAbilityForResult(want, (err: BusinessError | null, data: common.AbilityResult | undefined)=>{
            hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_1100`, err?.message);
            expect(err?.code).assertEqual(16000005);
            done();
          })
        } catch (err: BusinessError) {
          hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_1100`, err.message);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_1100 end');
      });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_static_4300
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_static_4300
     * @tc.desc   To verify the scenario where error code 16000005 is returned when the startAbilityForResult interface is invoked, Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Ability_AbilityBase_UIAbilityContextError_static_4300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Test START');
        let want: Want = {
          deviceId: '',
          bundleName: 'com.acts.ability.baseerrorrely.static',
          abilityName: 'EntryAbility2'
        };
        let options: StartOptions = {
          displayId: 0
        };
        try {
          context.startAbilityForResult(want,options)
            .then((result: common.AbilityResult) => {
              hilog.info(domain, tag, '%{public}s', `startAbilityForResult succeed`);
              expect().assertFail();
              done();
            })
            .catch((err: Error):void => {
              hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_2100 ${err.code}`);
              expect(err.code).assertEqual(16000005);
              done();
            });
        } catch (err: BusinessError) {
          hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_2100 ${err.code}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_2100 end');
      });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_static_4400
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_static_4400
     * @tc.desc   To verify the scenario where error code 201 is returned when the startAbilityForResult interface is invoked, Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Ability_AbilityBase_UIAbilityContextError_static_4400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Test START');
        context.moveAbilityToBackground()
        .catch((err: Error): void => {
          hilog.info(domain, tag, `moveAbilityToBackground error: ${JSON.stringify(err)}.`)
            if(err?.code == 16000061) {
              done();
            }
          });
        await Utils.msSleep(2000);
        let want: Want = {
          bundleName: 'com.acts.ability.baseerrorrely.static',
          abilityName: 'EntryAbility'
        };
        let options: StartOptions = {
          displayId: 0
        };
        try {
          context.startAbilityForResult(want,options, (err: BusinessError | null, data: common.AbilityResult | undefined)=>{
            hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_1100`, err?.message);
            expect(err?.code).assertEqual(201);
            done();
          })
        } catch (err: BusinessError) {
          hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_1100`, err.message);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_1100 end');
      });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_static_4500
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_static_4500
     * @tc.desc   To verify the scenario where error code 201 is returned when the startAbilityForResult interface is invoked, Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Ability_AbilityBase_UIAbilityContextError_static_4500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Test START');
        context.moveAbilityToBackground()
        .catch((err: Error): void => {
          hilog.info(domain, tag, `moveAbilityToBackground error: ${JSON.stringify(err)}.`)
            if(err?.code == 16000061) {
              done();
            }
          });
        await Utils.msSleep(2000);
        let want: Want = {
          bundleName: 'com.acts.ability.baseerrorrely.static',
          abilityName: 'EntryAbility'
        };
        try {
          context.startAbilityForResult(want, (err: BusinessError | null, data: common.AbilityResult | undefined)=>{
            hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_1100`, err?.message);
            expect(err?.code).assertEqual(201);
            done();
          })
        } catch (err: BusinessError) {
          hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_1100`, err.message);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_1100 end');
      });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_static_4600
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_static_4600
     * @tc.desc   To verify the scenario where error code 201 is returned when the startAbilityForResult interface is invoked, Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Ability_AbilityBase_UIAbilityContextError_static_4600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Test START');
        context.moveAbilityToBackground()
        .catch((err: Error): void => {
          hilog.info(domain, tag, `moveAbilityToBackground error: ${JSON.stringify(err)}.`)
            if(err?.code == 16000061) {
              done();
            }
          });
        await Utils.msSleep(2000);
        let want: Want = {
          deviceId: '',
          bundleName: 'com.acts.ability.baseerrorrely.static',
          abilityName: 'EntryAbility'
        };
        let options: StartOptions = {
          displayId: 0
        };
        try {
          context.startAbilityForResult(want,options)
            .then((result: common.AbilityResult) => {
              hilog.info(domain, tag, '%{public}s', `startAbilityForResult succeed`);
              expect().assertFail();
              done();
            })
            .catch((err: Error):void => {
              hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_2100 ${err.code}`);
              expect(err?.code).assertEqual(201);
              done();
            });
        } catch (err: BusinessError) {
          hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_2100 ${err.code}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_2100 end');
      });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_static_4700
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_static_4700
     * @tc.desc   To verify the scenario where error code 801 is returned when the startAbilityForResult interface is invoked, Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Ability_AbilityBase_UIAbilityContextError_static_4700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Test START');
        let want: Want = {
          bundleName: 'com.acts.actsbaseerrrocodemethodtest.static',
          abilityName: 'EntryAbility1'
        };
        let options: StartOptions = {
          processMode: contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_PARENT,
          startupVisibility: contextConstant.StartupVisibility.STARTUP_SHOW
        };
        try {
          context.startAbilityForResult(want,options, (err: BusinessError | null, data: common.AbilityResult | undefined)=>{
            hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_1100`, err?.message);
            if (err?.code !== 0) {
              if(err?.code==801) {
                done()
              }else{
                hilog.info(domain, tag,`startAbility, code is ${err?.code}, message is ${err?.message}`);
                done()
              }
            } else {
              hilog.info(domain, tag, `startAbility success`);
              done();
            }
          })
        } catch (err: BusinessError) {
          hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_1100`, err.message);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_1100 end');
      });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContextError_static_4800
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContextError_static_4800
     * @tc.desc   To verify the scenario where error code 201 is returned when the startAbilityForResult interface is invoked, Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Ability_AbilityBase_UIAbilityContextError_static_4800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Test START');
        let want: Want = {
          bundleName: 'com.acts.actsbaseerrrocodemethodtest.static',
          abilityName: 'EntryAbility1'
        };
        let options: StartOptions = {
          processMode: contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_PARENT,
          startupVisibility: contextConstant.StartupVisibility.STARTUP_SHOW
        };
        try {
          context.startAbilityForResult(want,options)
            .then((result: common.AbilityResult) => {
              hilog.info(domain, tag, '%{public}s', `startAbilityForResult succeed`);
              expect().assertFail();
              done();
            })
            .catch((err: Error):void => {
              hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_2100 ${err.code}`);
              if (err.code !== 0) {
                if(err.code==801) {
                  done()
                }else{
                  hilog.info(domain, tag,`startAbility, code is ${err.code}, message is ${err.message}`);
                  done()
                }
              } else {
                hilog.info(domain, tag, `startAbility success`);
                done();
              }
            });
        } catch (err: BusinessError) {
          hilog.info(domain, tag, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContextError_2100 ${err.code}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', 'SUB_Ability_AbilityBase_UIAbilityContextError_2100 end');
      });
  });
}