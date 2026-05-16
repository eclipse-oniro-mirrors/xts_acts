/*
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

import { describe, beforeAll, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import { BusinessError, RecordData } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import StartOptions from '@ohos.app.ability.StartOptions'
import contextConstant from '@ohos.app.ability.contextConstant';
import { CompletionHandlerForAbilityStartCallback, AbilityStartFailureCode } from '@ohos.app.ability.CompletionHandlerForAbilityStartCallback';
import { Driver, ON } from '@ohos.UiTest';

let domain: int = 0x0000;
let tag: string = 'testTag';
let context: common.UIAbilityContext;
let g_code: number = 0;

class AbilityStartCallbackExt implements common.AbilityStartCallback {
  onError(code: int, name: string, message: string): void {
    console.log(`startAbilityByType Error:` + "code:" + code + "name:" + name + "message:" + message);
    g_code = code;
  }

  onResult?: (abilityResult: common.AbilityResult) => void = (parameter: common.AbilityResult) => {
    console.log(`startAbilityByType resultCode:` + parameter.resultCode + `bundleName:` + parameter.want?.bundleName);
  }
}

export default function UiAbilityContextStartAbilityStatic() {
  describe("ActsStartAbilityErrorTestStatic", (): void => {

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
     * @tc.name   SUB_Ability_AbilityBase_StartAbilityError_static_1200
     * @tc.number SUB_Ability_AbilityBase_StartAbilityError_static_1200
     * @tc.desc   Call UIAbilityContext startAbility with options failed.(callback),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityBase_StartAbilityError_static_1200`;
      hilog.info(domain, tag, `it begin`);
      let Fd: Record<String,Object> = {
        'type': 'FD',
        'value': -1
      }
      let parameters: Record<String,RecordData> = {
        'keyFd': Fd
      }
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.baseerrorrely.static',
        abilityName: 'EntryAbility',
        parameters: parameters
      };
      let options: StartOptions = {
        windowLeft: 20,
        windowTop: 20
      };
      try {
        context.startAbility(want, options, (err: BusinessError | null) => {
          if (err?.code !== 0) {
            hilog.info(domain, tag,`startAbility failed, code is ${err?.code}, message is ${err?.message}`);
            expect(err?.code).assertEqual(16000050);
            done();
          } else {
            hilog.info(domain, tag, `startAbility success`);
            expect().assertFail();
            done();
          }
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `startAbility fail: ` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_StartAbilityError_static_1700
     * @tc.number SUB_Ability_AbilityBase_StartAbilityError_static_1700
     * @tc.desc   To verify StartAbility with option ErrorCode.Expect: 16000004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_static_1700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityBase_StartAbilityError_static_1700`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.ability.baseerrorrely.static',
        abilityName: 'EntryAbility1'
      };
      let options: StartOptions = {
        windowLeft: 20,
        windowTop: 20
      };
      try {
        context.startAbility(want, options, (err: BusinessError | null) => {
          if (err?.code !== 0) {
            hilog.info(domain, tag,`startAbility failed, code is ${err?.code}, message is ${err?.message}`);
            expect(err?.code).assertEqual(16000004);
            done();
          } else {
            hilog.info(domain, tag, `startAbility success`);
            expect().assertFail();
            done();
          }
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `startAbility fail: ` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_ErrorCode_static_1800
     * @tc.number SUB_Ability_AbilityBase_ErrorCode_static_1800
     * @tc.desc   Call UIAbilityContext startAbility with options failed.(promise).Expect: 16000004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_ErrorCode_static_1800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityBase_ErrorCode_static_1800`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.ability.baseerrorrely.static',
        abilityName: 'EntryAbility1'
      };
      let options: StartOptions = {
        windowLeft: 20,
        windowTop: 20
      };
      try {
        context.startAbility(want, options).then(() => {
          hilog.info(domain, tag, `startAbility success`);
          expect().assertFail();
          done();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, `startAbility error: ${JSON.stringify(err)}.`)
          expect(err.code).assertEqual(16000004);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `startAbility fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_ErrorCode_static_1900
     * @tc.number SUB_Ability_AbilityBase_ErrorCode_static_1900
     * @tc.desc   Call UIAbilityContext startAbility with options failed.(promise).Expect: 16000050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_ErrorCode_static_1900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityBase_ErrorCode_static_1900`;
      hilog.info(domain, tag, `it begin`);
      let Fd: Record<String,Object> = {
        'type': 'FD',
        'value': -1
      }
      let parameters: Record<String,RecordData> = {
        'keyFd': Fd
      }
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.baseerrorrely.static',
        abilityName: 'EntryAbility',
        parameters: parameters
      };
      let options: StartOptions = {
        windowLeft: 20,
        windowTop: 20
      };
      try {
        context.startAbility(want, options).then(() => {
          hilog.info(domain, tag, `startAbility success`);
          expect().assertFail();
          done();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, `startAbility error: ${JSON.stringify(err)}.`)
          expect(err.code).assertEqual(16000050);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `startAbility fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_ErrorCode_static_2000
     * @tc.number SUB_Ability_AbilityBase_ErrorCode_static_2000
     * @tc.desc   Call UIAbilityContext startAbility failed.(promise).Expect: 16000004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_ErrorCode_static_2000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityBase_ErrorCode_static_2000`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.ability.baseerrorrely.static',
        abilityName: 'EntryAbility1',
      };
      let options: StartOptions = {
        windowLeft: 20,
        windowTop: 20
      };
      try {
        context.startAbility(want).then(() => {
          hilog.info(domain, tag, `startAbility success`);
          expect().assertFail();
          done();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, `startAbility error: ${JSON.stringify(err)}.`)
          expect(err.code).assertEqual(16000004);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `startAbility fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_ErrorCode_static_2100
     * @tc.number SUB_Ability_AbilityBase_ErrorCode_static_2100
     * @tc.desc   Call UIAbilityContext startAbility failed.(promise).Expect: 16000050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_ErrorCode_static_2100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbility_Static_0017`;
      hilog.info(domain, tag, `it begin`);
      let Fd: Record<String,Object> = {
        'type': 'FD',
        'value': -1
      }
      let parameters: Record<String,RecordData> = {
        'keyFd': Fd
      }
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.baseerrorrely.static',
        abilityName: 'EntryAbility',
        parameters: parameters
      };
      let options: StartOptions = {
        windowLeft: 20,
        windowTop: 20
      };
      try {
        context.startAbility(want).then(() => {
          hilog.info(domain, tag, `startAbility success`);
          expect().assertFail();
          done();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, `startAbility error: ${JSON.stringify(err)}.`)
          expect(err.code).assertEqual(16000050);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `startAbility fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_StartAbilityError_static_2600
     * @tc.number SUB_Ability_AbilityBase_StartAbilityError_static_2600
     * @tc.desc   Call UIAbilityContext startAbility failed.(callback), Expect: 801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_static_2600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `StartAbilityError_2600`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.actsbaseerrrocodemethodtest.static',
        abilityName: 'EntryAbility1'
      };
      let options: StartOptions = {
        processMode: contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_PARENT,
        startupVisibility: contextConstant.StartupVisibility.STARTUP_SHOW
      };
      try {
        context.startAbility(want,options, (err: BusinessError | null) => {
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
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `startAbility: ` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_StartAbilityError_static_2700
     * @tc.number SUB_Ability_AbilityBase_StartAbilityError_static_2700
     * @tc.desc   SUB_Ability_AbilityBase_StartAbilityError_static_2700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_static_2700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `StartAbilityError_static_2700`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.actsbaseerrrocodemethodtest.static',
        abilityName: 'EntryAbility1'
      };
      let options: StartOptions = {
        processMode: contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_PARENT,
        startupVisibility: contextConstant.StartupVisibility.STARTUP_SHOW
      };
      try {
        context.startAbility(want, options).then(() => {
          hilog.info(domain, tag, `startAbility success`);
          expect().assertFail();
          done();
        }).catch((err: Error): void => {
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
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `startAbility fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_StartAbilityError_static_1800
     * @tc.number SUB_Ability_AbilityBase_StartAbilityError_static_1800
     * @tc.desc   Call UIAbilityContext startAbility with options failed.(callback), Expect: 16000005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_static_1800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `StartAbilityError_static_1700`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.ability.baseerrorrely.static',
        abilityName: 'EntryAbility2'
      };
      let options: StartOptions = {
        windowLeft: 20,
        windowTop: 20
      };
      try {
        context.startAbility(want, options, (err: BusinessError | null) => {
          if (err?.code !== 0) {
            hilog.info(domain, tag,`startAbility failed, code is ${err?.code}, message is ${err?.message}`);
            expect(err?.code).assertEqual(16000005);
            done();
          } else {
            hilog.info(domain, tag, `startAbility success`);
            expect().assertFail();
            done();
          }
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `startAbility fail: ` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_StartAbilityError_static_1900
     * @tc.number SUB_Ability_AbilityBase_StartAbilityError_static_1900
     * @tc.desc   Call UIAbilityContext startAbility failed.(callback), Expect: 16000005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_static_1900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `StartAbilityError_1900`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.ability.baseerrorrely.static',
        abilityName: 'EntryAbility2'
      };
      try {
        context.startAbility(want, (err: BusinessError | null) => {
          if (err?.code !== 0) {
            hilog.info(domain, tag,`startAbility failed, code is ${err?.code}, message is ${err?.message}`);
            expect(err?.code).assertEqual(16000005);
            done();
          } else {
            hilog.info(domain, tag, `startAbility success`);
            expect().assertFail();
            done();
          }
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `startAbility fail: ` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_StartAbilityError_static_2000
     * @tc.number SUB_Ability_AbilityBase_StartAbilityError_static_2000
     * @tc.desc   Call UIAbilityContext startAbility with options failed.(promise).Expect: 16000005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_static_2000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `StartAbilityError_static_2000`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.ability.baseerrorrely.static',
        abilityName: 'EntryAbility2'
      };
      let options: StartOptions = {
        windowLeft: 20,
        windowTop: 20
      };
      try {
        context.startAbility(want, options).then(() => {
          hilog.info(domain, tag, `startAbility success`);
          expect().assertFail();
          done();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, `startAbility error: ${JSON.stringify(err)}.`)
          expect(err.code).assertEqual(16000005);
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `startAbility fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_StartAbilityError_static_2100
     * @tc.number SUB_Ability_AbilityBase_StartAbilityError_static_2100
     * @tc.desc   Call UIAbilityContext startAbility failed.(promise).Expect: 16000005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_static_2100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `StartAbilityError_static_2100`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.ability.baseerrorrely.static',
        abilityName: 'EntryAbility2'
      };
      try {
        context.startAbility(want).then(() => {
          hilog.info(domain, tag, `startAbility success`);
          expect().assertFail();
          done();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, `startAbility error: ${JSON.stringify(err)}.`)
          expect(err.code).assertEqual(16000005);
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `startAbility fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_StartAbilityError_static_2200
     * @tc.number SUB_Ability_AbilityBase_StartAbilityError_static_2200
     * @tc.desc   Call UIAbilityContext startAbility failed.(promise) Expect: 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_static_2200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `StartAbilityError_static_2200`;
      hilog.info(domain, tag, `it begin`);
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
        context.startAbility(want).then(() => {
          hilog.info(domain, tag, `startAbility success`);
          expect().assertFail();
          done();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, `startAbility error: ${JSON.stringify(err)}.`)
          expect(err.code).assertEqual(201);
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `startAbility fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_StartAbilityError_static_2300
     * @tc.number SUB_Ability_AbilityBase_StartAbilityError_static_2300
     * @tc.desc   Call UIAbilityContext startAbility with options failed.(promise) Expect: 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_static_2300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `StartAbilityError_static_2300`;
      hilog.info(domain, tag, `it begin`);
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
        windowLeft: 20,
        windowTop: 20
      };
      try {
        context.startAbility(want, options).then(() => {
          hilog.info(domain, tag, `startAbility success`);
          expect().assertFail();
          done();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, `startAbility error: ${JSON.stringify(err)}.`)
          expect(err.code).assertEqual(201);
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `startAbility fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_StartAbilityError_static_2400
     * @tc.number SUB_Ability_AbilityBase_StartAbilityError_static_2400
     * @tc.desc   Call UIAbilityContext startAbility with options failed.(callback), Expect: 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_static_2400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `StartAbilityError_static_2400`;
      hilog.info(domain, tag, `it begin`);
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
        windowLeft: 20,
        windowTop: 20
      };
      try {
        context.startAbility(want, options, (err: BusinessError | null) => {
          if (err?.code !== 0) {
            hilog.info(domain, tag,`startAbility failed, code is ${err?.code}, message is ${err?.message}`);
            expect(err?.code).assertEqual(201);
            done();
          } else {
            hilog.info(domain, tag, `startAbility success`);
            expect().assertFail();
            done();
          }
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `startAbility fail: ` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_StartAbilityError_static_2500
     * @tc.number SUB_Ability_AbilityBase_StartAbilityError_static_2500
     * @tc.desc   Call UIAbilityContext startAbility failed.(callback), Expect: 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_static_2500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `StartAbilityError_static_2500`;
      hilog.info(domain, tag, `it begin`);
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
        context.startAbility(want, (err: BusinessError | null) => {
          if (err?.code !== 0) {
            hilog.info(domain, tag,`startAbility failed, code is ${err?.code}, message is ${err?.message}`);
            expect(err?.code).assertEqual(201);
            done();
          } else {
            hilog.info(domain, tag, `startAbility success`);
            expect().assertFail();
            done();
          }
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `startAbility fail: ` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   ACTS_UIExtension_StartAbilityByTypeStatic001
     * @tc.number ACTS_UIExtension_StartAbilityByTypeStatic001
     * @tc.desc   Call UIAbilityContext startAbilityByType failed.(callback), Expect: 16000050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_UIExtension_StartAbilityByTypeStatic001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG = 'ACTS_UIExtension_StartAbilityByTypeStatic001 == ';
      hilog.info(0x0000, tag, TAG + "begin");
      try {
        let abilityStartCallback: AbilityStartCallbackExt = new AbilityStartCallbackExt();
        let wantParam: Record<String,RecordData> = {
          "sceneType": 1,
          'time': '2023-10-23 20:45'
        };
        context.startAbilityByType("shareerror", wantParam, abilityStartCallback, ((err: BusinessError<void> | null): void => {
          if (err != null && err?.code != 0) {
            hilog.info(0x0000, tag, TAG + "startAbilityByType001 err, err:" + JSON.stringify(err));
            return;
          } else {
            hilog.info(0x0000, tag, TAG + "startAbilityByType001 success:");
          }
        }))
        await Utils.msSleep(500);
        expect(g_code).assertEqual(16000050);
        done();
      } catch (Error: BusinessError) {
        hilog.info(domain, tag, `startAbilityByType001 fail: ` + JSON.stringify(Error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   ACTS_UIExtension_StartAbilityByTypeStatic002
     * @tc.number ACTS_UIExtension_StartAbilityByTypeStatic002
     * @tc.desc   Call UIAbilityContext startAbilityByType failed.(callback), Expect: 16000050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_UIExtension_StartAbilityByTypeStatic002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG = 'ACTS_UIExtension_StartAbilityByTypeStatic002 == ';
      hilog.info(0x0000, tag, TAG + "begin");
      try {
        let abilityStartCallback: AbilityStartCallbackExt = new AbilityStartCallbackExt();
        let wantParam: Record<String,RecordData> = {
          "sceneType": 1,
          'time': '2023-10-23 20:45'
        };
        context.startAbilityByType("shareerror", wantParam, abilityStartCallback).then(() => {
          hilog.info(0x0000, tag, TAG + "startAbilityByType002 success");
        }).catch((error: Error): void => {
          hilog.info(0x0000, tag, TAG + "startAbilityByType002 fail, err:" + JSON.stringify(error));
        })
        await Utils.msSleep(500);
        expect(g_code).assertEqual(16000050);
        done();
      } catch (Error: BusinessError) {
        hilog.info(domain, tag, `startAbilityByType002 fail: ` + JSON.stringify(Error));
        expect().assertFail();
        done();
      }
    })
  });
}